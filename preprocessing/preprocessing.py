from parser.assembly_parser import AssemblyParser
from parser.module_splitter import ModuleSplitter
from parser.variable_extractor import VariableExtractor

from services.module_service import ModuleService

from knowledge.embedding_service import EmbeddingService
from knowledge.chroma_manager import collection


class Preprocessor:

    def process(self, filepath, upload_id):

        # ---------------------------------------------
        # 1. Read Assembly file
        # ---------------------------------------------

        parser = AssemblyParser(filepath)

        lines = parser.read_file()

        # ---------------------------------------------
        # 2. Split into modules
        # ---------------------------------------------

        splitter = ModuleSplitter()

        modules = splitter.split(lines)

        # ---------------------------------------------
        # 3. Initialize services
        # ---------------------------------------------

        extractor = VariableExtractor()

        module_service = ModuleService()

        embedder = EmbeddingService()

        analysis = {}

        # ---------------------------------------------
        # 4. Process each module
        # ---------------------------------------------

        for module_name, code in modules.items():

            parsed = extractor.extract(code)

            variables = parsed["variables"]

            instructions = parsed["instructions"]

            registers = parsed["registers"]

            labels = parsed["labels"]

            dependencies = parsed["dependencies"]

            data_items = parsed["data_items"]

            # -----------------------------------------
            # Convert module code to text
            # -----------------------------------------

            module_code = "\n".join(code)

            # -----------------------------------------
            # Save metadata
            # -----------------------------------------

            module_service.save(
                upload_id=upload_id,
                module_name=module_name,
                variables=variables,
                dependencies=dependencies
            )

            # -----------------------------------------
            # Create embedding
            # -----------------------------------------

            vector = embedder.create_embedding(
                module_code
            )

            # -----------------------------------------
            # Store in ChromaDB
            # -----------------------------------------

            collection.add(
                ids=[
                    f"{upload_id}_{module_name}"
                ],
                embeddings=[vector],
                documents=[module_code]
            )

            # -----------------------------------------
            # Store analysis
            # -----------------------------------------

            analysis[module_name] = {

                "variables": variables,

                "instructions": instructions,

                "registers": registers,

                "labels": labels,

                "dependencies": dependencies,

                "data_items": data_items,

                "code": code
            }

        return analysis