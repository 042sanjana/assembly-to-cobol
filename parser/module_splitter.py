import re


class ModuleSplitter:

    def split(self, lines):

        modules = {}

        current_module = "GLOBAL"
        modules[current_module] = []

        for raw_line in lines:

            # Remove newline
            line = raw_line.rstrip("\n")

            # Remove surrounding whitespace
            stripped = line.strip()

            # Skip empty lines
            if not stripped:
                continue

            # Skip full-line comments
            if stripped.startswith("*"):
                continue

            if stripped.startswith(";"):
                continue

            # Remove inline comments
            if ";" in line:
                line = line.split(";", 1)[0]

            text = line.strip()

            if not text:
                continue

            # Detect labels
            # LOGIN:
            # TRANSFER:
            # END_PROGRAM:
            label_match = re.match(
                r"^([A-Z_][A-Z0-9_]*)\s*:\s*$",
                text,
                re.IGNORECASE
            )

            if label_match:

                current_module = label_match.group(1).upper()

                if current_module not in modules:
                    modules[current_module] = []

                continue

            # Make sure module exists
            if current_module not in modules:
                modules[current_module] = []

            modules[current_module].append(text)

        return modules