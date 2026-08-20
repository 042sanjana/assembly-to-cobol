import re


class VariableExtractor:

    def __init__(self):

        # Instructions supported by your custom Assembly dialect
        self.instructions = {
            "LOAD",
            "STORE",
            "CALL",
            "BR",
            "BC",
            "B",
            "BNE",
            "BEQ",
            "BGT",
            "BLT",
            "BGE",
            "BLE",
            "CMP",
            "COMPARE",
            "ADD",
            "SUB",
            "MULT",
            "MUL",
            "DIV",
            "RETURN",
            "RET",
            "READ",
            "WRITE",
            "DISPLAY",
            "INPUT",
            "STOP",
            "END"
        }

        # Data definition directives
        self.data_directives = {
            "DB",
            "DC",
            "DS",
            "DW",
            "EQU"
        }

        # Branch instructions
        self.branch_instructions = {
            "BR",
            "BC",
            "B",
            "BNE",
            "BEQ",
            "BGT",
            "BLT",
            "BGE",
            "BLE"
        }

    def extract(self, code):

        variables = []
        instructions = []
        registers = []
        labels = []
        dependencies = []
        data_items = []

        def add_unique(collection, value):

            if value and value not in collection:
                collection.append(value)

        for original_line in code:

            line = original_line.strip()

            # --------------------------------------------
            # Ignore empty lines
            # --------------------------------------------

            if not line:
                continue

            # --------------------------------------------
            # Ignore comments
            # --------------------------------------------

            if line.startswith("*"):
                continue

            if line.startswith(";"):
                continue

            # --------------------------------------------
            # Remove inline comments
            # --------------------------------------------

            line = line.split(";", 1)[0].strip()

            if not line:
                continue

            # --------------------------------------------
            # Detect labels
            #
            # LOGIN:
            # TRANSFER:
            # END_PROGRAM:
            # --------------------------------------------

            label_match = re.match(
                r"^([A-Z_][A-Z0-9_]*)\s*:\s*",
                line,
                re.IGNORECASE
            )

            if label_match:

                label = label_match.group(1).upper()

                add_unique(labels, label)

                # Remove label from instruction line
                line = line[label_match.end():].strip()

                if not line:
                    continue

            # --------------------------------------------
            # Split operation and operands
            # --------------------------------------------

            parts = line.split(None, 1)

            if not parts:
                continue

            operation = parts[0].upper()

            operands_text = ""

            if len(parts) > 1:
                operands_text = parts[1].strip()

            # --------------------------------------------
            # Detect data definitions
            #
            # Example:
            # CUSTOMER_ID DB 10
            # BALANCE DW 100
            # --------------------------------------------

            definition_match = re.match(
                r"^([A-Z_][A-Z0-9_]*)\s+"
                r"(DB|DC|DS|DW|EQU)\b"
                r"(.*)$",
                line,
                re.IGNORECASE
            )

            if definition_match:

                variable_name = (
                    definition_match.group(1).upper()
                )

                directive = (
                    definition_match.group(2).upper()
                )

                add_unique(
                    variables,
                    variable_name
                )

                data_items.append({
                    "name": variable_name,
                    "directive": directive
                })

                continue

            # --------------------------------------------
            # Detect instruction
            # --------------------------------------------

            if operation in self.instructions:

                add_unique(
                    instructions,
                    operation
                )

            # --------------------------------------------
            # Extract registers
            # --------------------------------------------

            found_registers = re.findall(
                r"\bR\d+\b",
                operands_text.upper()
            )

            for register in found_registers:

                add_unique(
                    registers,
                    register
                )

            # --------------------------------------------
            # Extract operands
            # --------------------------------------------

            operands = [
                operand.strip()
                for operand in operands_text.split(",")
                if operand.strip()
            ]

            for operand in operands:

                operand = operand.upper()

                # Remove brackets
                operand = operand.strip("[]()")

                # ----------------------------------------
                # Ignore registers
                # ----------------------------------------

                if re.fullmatch(
                    r"R\d+",
                    operand
                ):
                    continue

                # ----------------------------------------
                # Ignore numeric constants
                # ----------------------------------------

                if re.fullmatch(
                    r"[-+]?(?:0X[0-9A-F]+|\d+)",
                    operand
                ):
                    continue

                # ----------------------------------------
                # Ignore quoted strings
                # ----------------------------------------

                if (
                    operand.startswith('"')
                    and operand.endswith('"')
                ):
                    continue

                # ----------------------------------------
                # Must be a valid identifier
                # ----------------------------------------

                if not re.fullmatch(
                    r"[A-Z_][A-Z0-9_]*",
                    operand
                ):
                    continue

                # ----------------------------------------
                # CALL dependency
                # ----------------------------------------

                if operation == "CALL":

                    add_unique(
                        dependencies,
                        operand
                    )

                    continue

                # ----------------------------------------
                # Branch target
                #
                # Do NOT classify it as a variable.
                # ----------------------------------------

                if operation in self.branch_instructions:

                    continue

                # ----------------------------------------
                # Don't treat instructions as variables
                # ----------------------------------------

                if operand in self.instructions:
                    continue

                if operand in self.data_directives:
                    continue

                # ----------------------------------------
                # Otherwise treat as variable
                # ----------------------------------------

                add_unique(
                    variables,
                    operand
                )

        return {
            "variables": variables,
            "instructions": instructions,
            "registers": registers,
            "labels": labels,
            "dependencies": dependencies,
            "data_items": data_items
        }