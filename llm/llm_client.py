import os
import ollama
from dotenv import load_dotenv

# Load .env file
load_dotenv()


class LLMClient:

    def __init__(self):
        self.model = os.getenv("OLLAMA_MODEL", "gemma3-local")
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
            ]
        )

        return response["message"]["content"]