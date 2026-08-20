import re


class DependencyAnalyzer:

    def extract(self, lines):

        dependencies = []

        for line in lines:

            match = re.match(
                r"^\s*CALL\s+([A-Z_][A-Z0-9_]*)",
                line,
                re.IGNORECASE
            )

            if match:

                dependency = match.group(1).upper()

                if dependency not in dependencies:
                    dependencies.append(dependency)

        return dependencies