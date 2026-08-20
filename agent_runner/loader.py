import os


class AgentLoader:

    def load(self, path):

        if not os.path.exists(path):
            raise FileNotFoundError(
                f"Agent file not found: {path}"
            )

        with open(path, "r", encoding="utf-8") as file:
            content = file.read()

        if not content.strip():
            raise ValueError(
                f"Agent file is empty: {path}"
            )

        return content