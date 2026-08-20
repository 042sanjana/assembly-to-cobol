"""
ChunkTranslationService
========================

Implements the "Translation Agent" + "Token Optimization
Strategy" boxes from the architecture diagram together:

    Preprocessing Splits into Small Logical Modules  (already done
                                                         by ModuleSplitter)
    RAG Retrieves Only Relevant Context               (ContextBuilder + ChromaDB)
    Send Small Module / Chunk Per LLM Call            (this file)
    Stay Within Token Limits, Reduce Cost & Improve
    Speed                                             (TokenManager)

For a module that already fits the token budget, this behaves
exactly like a normal single-shot translation (same as
AgentRunner.run for the "translation" agent).

For a module that is too large, it:

1. Splits the module into logical chunks with TokenManager
   (keeping full labeled blocks together wherever possible, so a
   chunk boundary never lands in the middle of one routine's
   business logic).
2. Runs the Business Logic Agent ONCE per chunk, so each chunk's
   translation is grounded in a business-rule summary of just
   that chunk (small, cheap prompt).
3. Runs the Chunk Translation Agent per chunk, passing forward
   only a SHORT tail of the previously generated COBOL (not the
   whole thing) as continuation context, plus the RAG context
   for that specific chunk. This is the key token-saving step:
   each LLM call only ever sees one chunk's assembly + a small
   continuation window, never the entire module.
4. Merges the chunk outputs into a single COBOL module: the
   first chunk keeps its full DIVISION headers, later chunks are
   stripped of any repeated headers and appended as continued
   PROCEDURE DIVISION paragraphs.
"""

from agent_runner.loader import AgentLoader
from rag.context_builder import ContextBuilder
from llm.llm_client import LLMClient
from services.token_manager import TokenManager

from knowledge.chroma_manager import collection

import re


TRANSLATION_AGENT_PATH = "agents/translation/agent.md"
CHUNK_TRANSLATION_AGENT_PATH = "agents/translation/chunk_agent.md"
BUSINESS_LOGIC_AGENT_PATH = "agents/business_logic/agent.md"

# How many trailing lines of the previously generated COBOL chunk
# to carry forward as continuation context. Kept small on
# purpose - this is the token-saving lever. We do NOT resend the
# whole growing COBOL program on every chunk.
CONTINUATION_TAIL_LINES = 25

# Headers that must only appear once, in the first chunk.
DIVISION_HEADERS = (
    "IDENTIFICATION DIVISION",
    "ENVIRONMENT DIVISION",
    "DATA DIVISION",
)


class ChunkTranslationService:

    def __init__(self, max_chunk_tokens=None):

        self.loader = AgentLoader()
        self.llm = LLMClient()
        self.builder = ContextBuilder()
        self.tokens = TokenManager()

        self.max_chunk_tokens = (
            max_chunk_tokens
            or TokenManager.DEFAULT_MAX_CHUNK_TOKENS
        )

    # ------------------------------------------------------------
    # RAG retrieval, scoped as tightly as possible to keep the
    # retrieved context small (token optimization).
    # ------------------------------------------------------------

    def _retrieve_context(self, module, code_text, n_results=1):

        try:
            query = f"Module: {module}\n\nAssembly:\n{code_text}"

            result = collection.query(
                query_texts=[query],
                n_results=n_results
            )

            documents = result.get("documents", [])

            if documents and documents[0]:
                return documents[0][0]

        except Exception as e:
            print(f"ChromaDB retrieval failed: {e}")

        return ""

    # ------------------------------------------------------------
    # Small per-chunk business logic summary. Cheap on tokens
    # because it only ever sees ONE chunk, never the full module.
    # ------------------------------------------------------------

    def _summarize_business_logic(
        self, module, chunk_code_text, variables, dependencies, retrieved_context
    ):

        instruction = self.loader.load(BUSINESS_LOGIC_AGENT_PATH)

        context = self.builder.build(
            module=module,
            code=chunk_code_text,
            variables=variables,
            dependencies=dependencies,
            retrieved_context=retrieved_context,
        )

        prompt = instruction + "\n\n" + context

        return self.llm.ask(prompt)

    # ------------------------------------------------------------
    # Translate a single chunk.
    # ------------------------------------------------------------

    def _translate_chunk(
        self,
        module,
        chunk_index,
        total_chunks,
        chunk_code_text,
        variables,
        dependencies,
        retrieved_context,
        business_summary,
        previous_tail,
        program_labels,
        program_modules,
    ):

        instruction = self.loader.load(CHUNK_TRANSLATION_AGENT_PATH)

        position = "FIRST CHUNK" if chunk_index == 0 else (
            "LAST CHUNK" if chunk_index == total_chunks - 1 else "MIDDLE CHUNK"
        )

        previous_outputs = {
            "business_logic_for_this_chunk": business_summary
        }

        if previous_tail:
            previous_outputs["previous_chunk_cobol_tail"] = previous_tail

        context = self.builder.build(
            module=f"{module} (chunk {chunk_index + 1}/{total_chunks})",
            code=chunk_code_text,
            variables=variables,
            dependencies=dependencies,
            retrieved_context=retrieved_context,
            previous_outputs=previous_outputs,
            program_labels=program_labels,
            program_modules=program_modules,
        )

        prompt = (
            instruction
            + f"\n\nCHUNK POSITION: {position}\n\n"
            + context
        )

        return self.llm.ask(prompt)

    # ------------------------------------------------------------
    # Strip repeated DIVISION headers from continuation chunks and
    # keep only PROCEDURE DIVISION content (or everything after
    # any header that isn't the first chunk).
    # ------------------------------------------------------------

    def _strip_repeated_headers(self, cobol_text):

        lines = cobol_text.splitlines()

        procedure_index = None

        for i, line in enumerate(lines):
            if "PROCEDURE DIVISION" in line.upper():
                procedure_index = i
                break

        if procedure_index is not None:
            # Drop the "PROCEDURE DIVISION." line itself too -
            # only the first chunk should declare it.
            return "\n".join(lines[procedure_index + 1:]).strip()

        # No division headers found at all (model already just
        # returned paragraphs) - use as-is.
        cleaned = []
        for line in lines:
            if any(h in line.upper() for h in DIVISION_HEADERS):
                continue
            cleaned.append(line)

        return "\n".join(cleaned).strip()

    def _tail(self, text, n_lines=CONTINUATION_TAIL_LINES):

        lines = [l for l in text.splitlines() if l.strip()]

        return "\n".join(lines[-n_lines:])

    # ------------------------------------------------------------
    # Public entry point.
    #
    # Returns:
    #   {
    #       "cobol_code": "<merged COBOL for the whole module>",
    #       "chunks_used": <int>,
    #       "business_logic": "<merged business summaries>"
    #   }
    # ------------------------------------------------------------

    def translate_module(
        self,
        module,
        code_lines,
        variables,
        dependencies,
        program_labels=None,
        program_modules=None,
    ):

        program_labels = program_labels or []
        program_modules = program_modules or []

        code_text_full = "\n".join(code_lines)

        chunks = self.tokens.chunk_module(
            code_lines,
            max_tokens=self.max_chunk_tokens
        )

        # --------------------------------------------------
        # Small module: single-shot translation, same
        # behaviour as the original AgentRunner path, no
        # chunking overhead.
        # --------------------------------------------------

        if len(chunks) == 1:

            retrieved_context = self._retrieve_context(
                module, code_text_full
            )

            business_summary = self._summarize_business_logic(
                module=module,
                chunk_code_text=code_text_full,
                variables=variables,
                dependencies=dependencies,
                retrieved_context=retrieved_context,
            )

            instruction = self.loader.load(TRANSLATION_AGENT_PATH)

            context = self.builder.build(
                module=module,
                code=code_text_full,
                variables=variables,
                dependencies=dependencies,
                retrieved_context=retrieved_context,
                previous_outputs={"business": business_summary},
                program_labels=program_labels,
                program_modules=program_modules,
            )

            cobol_code = self.llm.ask(instruction + "\n\n" + context)

            return {
                "cobol_code": cobol_code,
                "chunks_used": 1,
                "business_logic": business_summary,
            }

        # --------------------------------------------------
        # Large module: chunked translation.
        # --------------------------------------------------

        print(
            f"Module '{module}' exceeds token budget "
            f"({self.max_chunk_tokens} tokens/chunk) -> "
            f"splitting into {len(chunks)} chunk(s)."
        )

        translated_parts = []
        business_summaries = []
        previous_tail = ""

        for i, chunk_lines in enumerate(chunks):

            chunk_text = "\n".join(chunk_lines)

            # RAG lookup scoped to just this chunk -> smaller,
            # more relevant retrieved context per call.
            retrieved_context = self._retrieve_context(
                module, chunk_text
            )

            business_summary = self._summarize_business_logic(
                module=module,
                chunk_code_text=chunk_text,
                variables=variables,
                dependencies=dependencies,
                retrieved_context=retrieved_context,
            )

            business_summaries.append(
                f"--- Chunk {i + 1}/{len(chunks)} ---\n{business_summary}"
            )

            raw_cobol = self._translate_chunk(
                module=module,
                chunk_index=i,
                total_chunks=len(chunks),
                chunk_code_text=chunk_text,
                variables=variables,
                dependencies=dependencies,
                retrieved_context=retrieved_context,
                business_summary=business_summary,
                previous_tail=previous_tail,
                program_labels=program_labels,
                program_modules=program_modules,
            )

            if i == 0:
                cleaned = raw_cobol.strip()
            else:
                cleaned = self._strip_repeated_headers(raw_cobol)

            translated_parts.append(cleaned)
            previous_tail = self._tail(cleaned)

        merged_cobol = "\n\n".join(translated_parts)

        return {
            "cobol_code": merged_cobol,
            "chunks_used": len(chunks),
            "business_logic": "\n\n".join(business_summaries),
        }
