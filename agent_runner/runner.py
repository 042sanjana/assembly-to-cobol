from agent_runner.loader import AgentLoader
from rag.context_builder import ContextBuilder
from llm.llm_client import LLMClient

from knowledge.chroma_manager import collection


class AgentRunner:

    def __init__(self):

        self.loader = AgentLoader()
        self.llm = LLMClient()
        self.builder = ContextBuilder()

    # --------------------------------------------------
    # Retrieve context from ChromaDB
    # --------------------------------------------------

    def retrieve_context(self, module, code):

        try:

            query = f"""
Module: {module}

Assembly:
{code}
"""

            result = collection.query(
                query_texts=[query],
                n_results=1
            )

            documents = result.get(
                "documents",
                []
            )

            if documents and documents[0]:

                return documents[0][0]

        except Exception as e:

            print(
                f"ChromaDB retrieval failed: {e}"
            )

        return ""

    # --------------------------------------------------
    # Run one agent
    # --------------------------------------------------

    def run(
        self,
        agent_path,
        module,
        code,
        variables,
        dependencies,
        retrieved_context="",
        previous_outputs=None,
        program_labels=None,
        program_modules=None
    ):

        print(
            f"Loading agent instruction: {agent_path}"
        )

        instruction = self.loader.load(
            agent_path
        )

        context = self.builder.build(

            module=module,

            code=code,

            variables=variables,

            dependencies=dependencies,

            retrieved_context=retrieved_context,

            previous_outputs=previous_outputs,

            program_labels=program_labels,

            program_modules=program_modules
        )

        prompt = (
            instruction
            + "\n\n"
            + context
        )

        return self.llm.ask(prompt)

    # --------------------------------------------------
    # Run all agents
    # --------------------------------------------------

    def run_all(
        self,
        module,
        code,
        variables,
        dependencies,
        program_labels=None,
        program_modules=None
    ):

        if program_labels is None:
            program_labels = []

        if program_modules is None:
            program_modules = []

        agents = {

            "business":
                "agents/business_logic/agent.md",

            "syntax":
                "agents/syntax/agent.md",

            "error_detection":
                "agents/ErrorDetection/agent.md",

            "execution":
                "agents/Execution/agent.md",

            "optimization":
                "agents/optimization/agent.md",

            "translation":
                "agents/translation/agent.md",

            "validation":
                "agents/validation/agent.md"
        }

        results = {}

        # --------------------------------------------------
        # RAG
        # --------------------------------------------------

        retrieved_context = self.retrieve_context(
            module,
            code
        )

        # --------------------------------------------------
        # Execute agents sequentially
        # --------------------------------------------------

        for name, path in agents.items():

            print()
            print("==============================")
            print(f"Running {name.upper()} Agent")
            print("==============================")

            try:

                previous_outputs = {}

                # ------------------------------------------
                # Execution Agent
                # ------------------------------------------

                if name == "execution":

                    previous_outputs = {
                        "syntax":
                            results.get(
                                "syntax",
                                ""
                            )
                    }

                # ------------------------------------------
                # Error Detection
                # ------------------------------------------

                elif name == "error_detection":

                    previous_outputs = {
                        "syntax":
                            results.get(
                                "syntax",
                                ""
                            )
                    }

                # ------------------------------------------
                # Optimization
                # ------------------------------------------

                elif name == "optimization":

                    previous_outputs = {

                        "syntax":
                            results.get(
                                "syntax",
                                ""
                            ),

                        "error_detection":
                            results.get(
                                "error_detection",
                                ""
                            )
                    }

                # ------------------------------------------
                # Translation
                # ------------------------------------------

                elif name == "translation":

                    previous_outputs = {

                        "syntax":
                            results.get(
                                "syntax",
                                ""
                            ),

                        "error_detection":
                            results.get(
                                "error_detection",
                                ""
                            ),

                        "execution":
                            results.get(
                                "execution",
                                ""
                            ),

                        "business":
                            results.get(
                                "business",
                                ""
                            )
                    }

                # ------------------------------------------
                # Validation
                # ------------------------------------------

                elif name == "validation":

                    previous_outputs = {

                        "syntax":
                            results.get(
                                "syntax",
                                ""
                            ),

                        "error_detection":
                            results.get(
                                "error_detection",
                                ""
                            ),

                        "execution":
                            results.get(
                                "execution",
                                ""
                            ),

                        "business":
                            results.get(
                                "business",
                                ""
                            ),

                        "translation":
                            results.get(
                                "translation",
                                ""
                            )
                    }

                # ------------------------------------------
                # Run agent
                # ------------------------------------------

                response = self.run(

                    agent_path=path,

                    module=module,

                    code=code,

                    variables=variables,

                    dependencies=dependencies,

                    retrieved_context=retrieved_context,

                    previous_outputs=previous_outputs,

                    program_labels=program_labels,

                    program_modules=program_modules
                )

                results[name] = response

                print(
                    f"{name.upper()} Agent completed successfully."
                )

            except Exception as e:

                error_message = (
                    f"Agent Failed: "
                    f"{type(e).__name__}: {str(e)}"
                )

                results[name] = error_message

                print(error_message)

        return results