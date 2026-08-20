import json

from database.config import SessionLocal
from database.models import Module


class ModuleService:

    def save(self, upload_id, module_name, variables, dependencies):

        db = SessionLocal()

        module = Module(
            upload_id=upload_id,
            module_name=module_name,
            variables=json.dumps(variables),
            dependencies=json.dumps(dependencies)
        )

        db.add(module)
        db.commit()
        db.close()

    def save_translation(
        self,
        upload_id,
        module_name,
        cobol_code,
        business_rules=None,
        execution_status="Translated",
    ):
        """
        Persist the AI-generated COBOL (and optional business
        logic summary) for a module back onto its row.
        """

        db = SessionLocal()

        module = (
            db.query(Module)
            .filter(
                Module.upload_id == upload_id,
                Module.module_name == module_name,
            )
            .first()
        )

        if module:

            module.cobol_code = cobol_code

            if business_rules is not None:
                module.business_rules = business_rules

            module.execution_status = execution_status

            db.commit()

        db.close()

    def get_all_for_upload(self, upload_id):

        db = SessionLocal()

        modules = (
            db.query(Module)
            .filter(Module.upload_id == upload_id)
            .all()
        )

        result = [
            {
                "module_name": m.module_name,
                "cobol_code": m.cobol_code,
                "execution_status": m.execution_status,
            }
            for m in modules
        ]

        db.close()

        return result