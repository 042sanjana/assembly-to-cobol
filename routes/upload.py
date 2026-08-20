from fastapi import APIRouter, UploadFile, File
from fastapi.responses import FileResponse
import traceback
import os

from services.file_service import save_file
from services.upload_service import UploadService
from services.module_service import ModuleService
from services.merge_service import MergeService

from preprocessing.preprocessing import Preprocessor
from agent_runner.chunk_translator import ChunkTranslationService


router = APIRouter()


@router.post("/upload")
async def upload(file: UploadFile = File(...)):

    try:

        print("\n====================================")
        print("UPLOAD STARTED")
        print("Filename:", file.filename)
        print("====================================")

        # -----------------------------------
        # Save uploaded file
        # -----------------------------------

        print("1. Saving file...")

        filepath, upload_id = save_file(file)

        print("File saved:", filepath)
        print("Upload ID:", upload_id)

        upload_service = UploadService()

        upload_service.update_status(
            upload_id,
            "Preprocessing"
        )

        # -----------------------------------
        # Run Preprocessing
        # -----------------------------------

        print("2. Starting preprocessing...")

        processor = Preprocessor()

        analysis = processor.process(
            filepath=filepath,
            upload_id=upload_id
        )

        print("Preprocessing completed.")
        print("Modules found:", list(analysis.keys()))

        upload_service.update_status(
            upload_id,
            "Running AI Agents"
        )

        # -----------------------------------
        # Run chunk-aware translation
        # (Translation Agent + Token Optimization Strategy)
        # -----------------------------------

        print("3. Starting AI translation (token-aware, chunked)...")

        translator = ChunkTranslationService()
        module_service = ModuleService()

        # Program-wide labels/modules so branch and CALL targets
        # that live in OTHER modules are never misreported as
        # missing, even when a module is translated in isolation.
        program_labels = []
        program_modules = list(analysis.keys())

        for data in analysis.values():
            program_labels.extend(data.get("labels", []))

        translation_results = {}

        for module_name, data in analysis.items():

            print("\n------------------------------------")
            print("Translating module:", module_name)
            print("------------------------------------")

            code_lines = data["code"]

            try:

                result = translator.translate_module(
                    module=module_name,
                    code_lines=code_lines,
                    variables=data["variables"],
                    dependencies=data["dependencies"],
                    program_labels=program_labels,
                    program_modules=program_modules,
                )

                module_service.save_translation(
                    upload_id=upload_id,
                    module_name=module_name,
                    cobol_code=result["cobol_code"],
                    business_rules=result["business_logic"],
                    execution_status="Success",
                )

                translation_results[module_name] = {
                    "status": "Success",
                    "cobol_code": result["cobol_code"],
                    "chunks_used": result["chunks_used"],
                }

                print(
                    f"Module '{module_name}' translated "
                    f"({result['chunks_used']} chunk(s))."
                )

            except Exception as e:

                error_message = f"{type(e).__name__}: {str(e)}"

                module_service.save_translation(
                    upload_id=upload_id,
                    module_name=module_name,
                    cobol_code="",
                    execution_status="Failed",
                )

                translation_results[module_name] = {
                    "status": "Failed",
                    "cobol_code": "",
                    "error": error_message,
                }

                print(f"Module '{module_name}' FAILED: {error_message}")

        # -----------------------------------
        # Merge & Final Output
        # -----------------------------------

        print("4. Merging modules into final COBOL program...")

        upload_service.update_status(
            upload_id,
            "Merging Output"
        )

        merger = MergeService()

        merge_result = merger.merge(
            upload_id=upload_id,
            filename=file.filename,
            module_results=translation_results,
        )

        upload_service.update_status(
            upload_id,
            "Completed"
        )

        print("\n====================================")
        print("UPLOAD COMPLETED")
        print("====================================")

        return {
            "upload_id": upload_id,
            "filename": file.filename,
            "path": filepath,
            "message": "Assembly uploaded and translated successfully",
            "modules_translated": merge_result["modules_translated"],
            "modules_failed": merge_result["modules_failed"],
            "failed_modules": merge_result["failed_modules"],
            "download": {
                "cobol_file": f"/download/{upload_id}/cobol",
                "report_file": f"/download/{upload_id}/report",
            },
            "translations": translation_results,
        }

    except Exception as e:

        print("\n====================================")
        print("UPLOAD FAILED")
        print("====================================")

        print("ERROR:", str(e))

        traceback.print_exc()

        print("====================================\n")

        return {
            "error": True,
            "message": str(e),
            "error_type": type(e).__name__
        }


@router.get("/download/{upload_id}/{artifact}")
def download(upload_id: int, artifact: str):
    """
    artifact: "cobol" or "report"
    """

    import glob

    pattern = f"outputs/*_{upload_id}.cbl" if artifact == "cobol" \
        else f"outputs/*_{upload_id}_report.txt"

    matches = glob.glob(pattern)

    if not matches:
        return {"error": True, "message": "File not found"}

    return FileResponse(
        matches[0],
        filename=os.path.basename(matches[0])
    )