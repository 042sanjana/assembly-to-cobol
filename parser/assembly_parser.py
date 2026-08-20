class AssemblyParser:

    def __init__(self, filepath):
        self.filepath = filepath

    def read_file(self):
        with open(self.filepath, "r", encoding="utf-8") as file:
            return file.readlines()