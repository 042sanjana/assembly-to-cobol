"""
MergeService
============

Implements diagram steps 8-10:

    8. MODULE STATUS MANAGER  -> tracked via Module.execution_status
    9. MERGE & FINAL OUTPUT   -> this file
    10. OUTPUT & DOWNLOAD     -> writes the final .cbl + a report
"""

import os
import re

OUTPUT_FOLDER = "outputs"

os.makedirs(OUTPUT_FOLDER, exist_ok=True)


class MergeService:

    def _extract_program_id(self, cobol_code):

        match = re.search(
            r"PROGRAM-ID\.\s*([A-Z0-9\-_]+)",
            cobol_code or "",
            re.IGNORECASE,
        )

        return match.group(1) if match else None

    def merge(self, upload_id, filename, module_results):
        """
        module_results: dict of
            module_name -> {
                "cobol_code": str,
                "chunks_used": int,
                "status": "Success" | "Failed",
                "error": str | None,
            }

        Produces one .cbl file. The first successfully translated
        module keeps its full COBOL headers (IDENTIFICATION /
        ENVIRONMENT / DATA / PROCEDURE DIVISION). Every subsequent
        module is appended as its own set of PROCEDURE DIVISION
        paragraphs, called from the main flow, so the merged
        program remains a single valid COBOL source file.
        """

        successful = [
            (name, data)
            for name, data in module_results.items()
            if data.get("status") == "Success" and data.get("cobol_code")
        ]

        failed = [
            (name, data)
            for name, data in module_results.items()
            if data.get("status") != "Success"
        ]

        merged_sections = []
        program_id = None

        for i, (name, data) in enumerate(successful):

            code = data["cobol_code"].strip()

            if i == 0:
                program_id = self._extract_program_id(code) or "MIGRATED"
                merged_sections.append(code)
            else:
                # Keep only PROCEDURE DIVISION content from later
                # modules, labeled with the original module name
                # so nothing is silently merged/renamed.
                proc_index = None
                lines = code.splitlines()

                for j, line in enumerate(lines):
                    if "PROCEDURE DIVISION" in line.upper():
                        proc_index = j
                        break

                body = (
                    "\n".join(lines[proc_index + 1:])
                    if proc_index is not None
                    else code
                )

                merged_sections.append(
                    f"      *> ==========================================\n"
                    f"      *> MODULE: {name}\n"
                    f"      *> ==========================================\n"
                    f"{body}"
                )

        merged_cobol = "\n\n".join(merged_sections)

        base_name = os.path.splitext(filename)[0]
        output_filename = f"{base_name}_{upload_id}.cbl"
        output_path = os.path.join(OUTPUT_FOLDER, output_filename)

        with open(output_path, "w", encoding="utf-8") as f:
            f.write(merged_cobol)

        report = self._build_report(
            upload_id, filename, successful, failed
        )

        report_path = os.path.join(
            OUTPUT_FOLDER, f"{base_name}_{upload_id}_report.txt"
        )

        with open(report_path, "w", encoding="utf-8") as f:
            f.write(report)

        return {
            "cobol_path": output_path,
            "report_path": report_path,
            "modules_translated": len(successful),
            "modules_failed": len(failed),
            "failed_modules": [name for name, _ in failed],
        }

    def _build_report(self, upload_id, filename, successful, failed):

        lines = [
            "ASSEMBLY -> COBOL MIGRATION REPORT",
            "=" * 40,
            f"Source file: {filename}",
            f"Upload ID: {upload_id}",
            "",
            f"Modules translated successfully: {len(successful)}",
            f"Modules failed: {len(failed)}",
            "",
        ]

        if successful:
            lines.append("SUCCESSFUL MODULES")
            lines.append("-" * 40)
            for name, data in successful:
                chunks = data.get("chunks_used", 1)
                note = (
                    f" (split into {chunks} token-safe chunks)"
                    if chunks > 1 else ""
                )
                lines.append(f"  - {name}{note}")
            lines.append("")

        if failed:
            lines.append("FAILED MODULES")
            lines.append("-" * 40)
            for name, data in failed:
                lines.append(f"  - {name}: {data.get('error', 'Unknown error')}")
            lines.append("")

        return "\n".join(lines)
