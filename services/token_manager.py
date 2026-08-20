"""
TokenManager
============

Solves the "Token Optimization Strategy" box in the architecture
diagram:

    Large File (20K+ lines)
        -> Preprocessing splits into small logical modules
        -> RAG retrieves only relevant context
        -> Send small chunk per LLM call
        -> Stay within token limits, reduce cost & improve speed

Two responsibilities:

1. estimate_tokens(text)
   Cheap, dependency-light token estimate. Uses tiktoken when
   available (accurate), otherwise falls back to a character
   based heuristic (~4 chars per token, which is a safe
   approximation for English/code).

2. chunk_module(code_lines, ...)
   Splits ONE module's assembly lines into smaller chunks that
   each fit under a token budget, WITHOUT cutting in the middle
   of an instruction and WITHOUT splitting a logical block
   (a label and the instructions that belong to it) across two
   chunks whenever that block itself fits in a single chunk.

   This keeps business logic (a label's full instruction block)
   intact inside a single chunk wherever possible, which is
   what makes it safe to translate chunk-by-chunk without losing
   the meaning of a routine.
"""

import re

try:
    import tiktoken
    _ENCODER = tiktoken.get_encoding("cl100k_base")
except Exception:
    _ENCODER = None


class TokenManager:

    # Reasonable default: leaves headroom in a local model's
    # context window for the agent instructions + RAG context +
    # previous-agent outputs that ContextBuilder also injects.
    DEFAULT_MAX_CHUNK_TOKENS = 1200

    # Rough characters-per-token when tiktoken is not installed.
    CHARS_PER_TOKEN = 4

    def estimate_tokens(self, text):

        if not text:
            return 0

        if _ENCODER is not None:
            return len(_ENCODER.encode(text))

        return max(1, len(text) // self.CHARS_PER_TOKEN)

    def needs_chunking(self, code_lines, max_tokens=None):

        max_tokens = max_tokens or self.DEFAULT_MAX_CHUNK_TOKENS

        text = "\n".join(code_lines)

        return self.estimate_tokens(text) > max_tokens

    # ------------------------------------------------------------
    # Group raw module lines into logical blocks.
    #
    # A block starts either at the beginning of the module, or at
    # any internal label (a line the ModuleSplitter itself would
    # treat as a sub-label, e.g. a paragraph inside a big routine)
    # and runs until the next label / end of module.
    # ------------------------------------------------------------

    def _group_into_blocks(self, code_lines):

        blocks = []
        current_block = []

        label_pattern = re.compile(
            r"^([A-Z_][A-Z0-9_]*)\s*:\s*$",
            re.IGNORECASE
        )

        for line in code_lines:

            stripped = line.strip()

            is_label = bool(label_pattern.match(stripped))

            if is_label and current_block:
                blocks.append(current_block)
                current_block = [line]
            else:
                current_block.append(line)

        if current_block:
            blocks.append(current_block)

        return blocks

    # ------------------------------------------------------------
    # Pack logical blocks into chunks that respect the token
    # budget. A block is only split line-by-line as a last
    # resort, if a single block alone exceeds the budget.
    # ------------------------------------------------------------

    def chunk_module(self, code_lines, max_tokens=None):

        max_tokens = max_tokens or self.DEFAULT_MAX_CHUNK_TOKENS

        if not self.needs_chunking(code_lines, max_tokens):
            return [code_lines]

        blocks = self._group_into_blocks(code_lines)

        chunks = []
        current_chunk = []
        current_tokens = 0

        for block in blocks:

            block_text = "\n".join(block)
            block_tokens = self.estimate_tokens(block_text)

            # A single block is itself too large -> hard split
            # it line by line so we never silently drop code.
            if block_tokens > max_tokens:

                if current_chunk:
                    chunks.append(current_chunk)
                    current_chunk = []
                    current_tokens = 0

                sub_chunk = []
                sub_tokens = 0

                for line in block:

                    line_tokens = self.estimate_tokens(line)

                    if sub_tokens + line_tokens > max_tokens and sub_chunk:
                        chunks.append(sub_chunk)
                        sub_chunk = []
                        sub_tokens = 0

                    sub_chunk.append(line)
                    sub_tokens += line_tokens

                if sub_chunk:
                    chunks.append(sub_chunk)

                continue

            # Block fits in the budget on its own. Does it fit in
            # the chunk currently being built?
            if current_tokens + block_tokens > max_tokens and current_chunk:
                chunks.append(current_chunk)
                current_chunk = []
                current_tokens = 0

            current_chunk.extend(block)
            current_tokens += block_tokens

        if current_chunk:
            chunks.append(current_chunk)

        return chunks
