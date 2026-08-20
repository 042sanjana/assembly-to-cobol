class ContextBuilder:

    def build(
        self,
        module,
        code,
        variables,
        dependencies,
        retrieved_context="",
        previous_outputs=None,
        program_labels=None,
        program_modules=None
    ):
        """
        Build the context sent to an AI agent.

        The original Assembly program is the authoritative
        source of truth.

        module:
            Current module being analyzed.

        code:
            Assembly code belonging to the current module.

        variables:
            Variables extracted from the current module.

        dependencies:
            CALL dependencies of the current module.

        retrieved_context:
            Optional ChromaDB/RAG information.

        previous_outputs:
            Results from previously executed agents.

        program_labels:
            All labels discovered in the complete Assembly program.

        program_modules:
            All modules discovered in the complete Assembly program.
        """

        if previous_outputs is None:
            previous_outputs = {}

        if program_labels is None:
            program_labels = []

        if program_modules is None:
            program_modules = []

        # --------------------------------------------------
        # Main source-of-truth context
        # --------------------------------------------------

        prompt = f"""
SOURCE OF TRUTH
===============

The original Assembly program is the ONLY authoritative
source for actual program behavior.

CURRENT MODULE
--------------
{module}

CURRENT MODULE VARIABLES
-----------------------
{variables}

CURRENT MODULE DEPENDENCIES
---------------------------
{dependencies}

CURRENT MODULE ASSEMBLY CODE
----------------------------
{code}

PROGRAM-WIDE LABELS
-------------------
{program_labels}

PROGRAM-WIDE MODULES
--------------------
{program_modules}

IMPORTANT GROUNDING RULES
=========================

1. Use ONLY the supplied Assembly program as the source of truth.

2. Do NOT invent variables.

3. Do NOT invent instructions.

4. Do NOT invent labels.

5. Do NOT invent business rules.

6. Do NOT invent database operations.

7. Do NOT invent external systems.

8. Do NOT invent input/output behavior.

9. Do NOT infer functionality simply from a module name.

10. Preserve the exact names of variables, labels and CALL targets.

11. A label may be defined in another module. Use
    PROGRAM-WIDE LABELS when checking branches.

12. A CALL target may be another module in the same program.

13. Do not report a branch target as undefined if that label
    exists in PROGRAM-WIDE LABELS.

14. Do not report a CALL as missing if the CALL target exists
    in PROGRAM-WIDE MODULES or PROGRAM-WIDE LABELS.

15. If something cannot be determined from the Assembly,
    explicitly report it as UNKNOWN or AMBIGUOUS.

16. If an Assembly instruction is not understood, do not
    silently replace it with invented behavior.

17. The original Assembly code has higher priority than
    retrieved knowledge and previous agent analysis.

"""

        # --------------------------------------------------
        # RAG context
        # --------------------------------------------------

        if retrieved_context:

            prompt += f"""
RETRIEVED KNOWLEDGE
===================

The following information came from the knowledge store.

It is supplementary information only.

Use it only when directly consistent with the
original Assembly.

If it conflicts with the Assembly, IGNORE it.

{retrieved_context}

"""

        # --------------------------------------------------
        # Previous agent outputs
        # --------------------------------------------------

        if previous_outputs:

            prompt += """
PREVIOUS AGENT ANALYSIS
=======================

The following information was produced by other agents.

These outputs are analysis only.

They are NOT the source of truth.

If they conflict with the original Assembly,
IGNORE them.

"""

            for agent_name, output in previous_outputs.items():

                if not output:
                    continue

                prompt += f"""
--- {agent_name.upper()} AGENT OUTPUT ---

{output}

--- END {agent_name.upper()} OUTPUT ---

"""

        # --------------------------------------------------
        # Final priority
        # --------------------------------------------------

        prompt += """
FINAL SOURCE PRIORITY
=====================

Use this priority order:

1. ORIGINAL ASSEMBLY CODE
2. PROGRAM-WIDE LABELS AND MODULES
3. MODULE VARIABLES
4. MODULE DEPENDENCIES
5. DIRECTLY SUPPORTED AGENT ANALYSIS
6. RETRIEVED KNOWLEDGE

If two pieces of information conflict,
choose the higher-priority source.

Never invent missing behavior.

If behavior cannot be determined, say:

"Not explicitly defined in the Assembly."
"""

        return prompt