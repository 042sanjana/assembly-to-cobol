import os
import re
import ollama
from dotenv import load_dotenv

# Load .env file
load_dotenv()


class LLMClient:

    def __init__(self):
        self.model = os.getenv("OLLAMA_MODEL", "qwen3-local")
        self.host = os.getenv("OLLAMA_HOST", "http://localhost:11434")

        # Configure Ollama host
        os.environ["OLLAMA_HOST"] = self.host

    def ask(self, prompt):

        response = ollama.chat(
            model=self.model,
            messages=[
                {
                    "role": "user",
                    "content": prompt
                }
            ],
            options={
                # Lower temperature = less hallucination/invention,
                # more literal/faithful translation of the source.
                "temperature": 0.1
            }
        )

        raw = response["message"]["content"]

        return self._clean(raw)

    def _clean(self, text):
        """
        Safety net for models that don't perfectly follow the
        "no markdown, no explanations" instruction.
        """

        if not text:
            return text

        # Strip ```cobol / ``` fences, keep the content inside.
        fenced = re.search(
            r"```(?:cobol|cbl)?\s*(.*?)```",
            text,
            re.DOTALL | re.IGNORECASE
        )

        if fenced:
            text = fenced.group(1)

        # Strip any leftover stray triple-backtick lines.
        text = re.sub(r"```", "", text)

        return text.strip()