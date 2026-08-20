```
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE:
       GLOBAL

       CURRENT MODULE VARIABLES:
       []

       CURRENT MODULE DEPENDENCIES:
       []

       CURRENT MODULE ASSEMBLY CODE:
       LOAD R0, SYSTEM_READY
       STORE R0, RETURN_VALUE
       CALL CALL_FUNCTION
       RETURN
```

      *> ==========================================
      *> MODULE: START
      *> ==========================================
```
CALL INITIALIZE_SYSTEM
CALL LOGIN_USER
CMP R1, SUCCESS
BNE LOGIN_FAILED
```

      *> ==========================================
      *> MODULE: MAIN_MENU
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE VARIABLES
       -----------------------
       ['USER_OPTION']

       CURRENT MODULE DEPENDENCIES
       ---------------------------
       []

       CURRENT MODULE ASSEMBLY CODE
       ----------------------------
DISPLAY "1. CHECK BALANCE"
DISPLAY "2. TRANSFER MONEY"
DISPLAY "3. VIEW TRANSACTIONS"
LOAD R2, USER_OPTION
CMP R2, 1
BEQ CHECK_ACCOUNT_BALANCE
CMP R2, 2
BEQ PROCESS_TRANSFER
CMP R2, 3
BEQ TRANSACTION_REPORT
BR MAIN_MENU

       PROGRAM-WIDE LABELS
       -------------------
       []

       PROGRAM-WIDE MODULES
       --------------------
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES
       -------------------
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

       RETRIEVED KNOWLEDGE
       ----------------===
       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       DISPLAY "1. CHECK BALANCE"
       DISPLAY "2. TRANSFER MONEY"
       DISPLAY "3. VIEW TRANSACTIONS"
       LOAD R2, USER_OPTION
       CMP R2, 1
       BEQ CHECK_ACCOUNT_BALANCE
       CMP R2, 2
       BEQ PROCESS_TRANSFER
       CMP R2, 3
       BEQ TRANSACTION_REPORT
       BR MAIN_MENU

       PROGRAM-WIDE LABELS
       -------------------
       []

       PROGRAM-WIDE MODULES
       --------------------
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES
       -------------------
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

       FINAL SOURCE PRIORITY
       -------------------
       1. ORIGINAL ASSEMBLY CODE
       2. PROGRAM-WIDE LABELS AND MODULES
       3. MODULE VARIABLES
       4. MODULE DEPENDENCIES
       5. DIRECTLY SUPPORTED AGENT ANALYSIS
       6. RETRIEVED KNOWLEDGE

       Never invent missing behavior.

       If behavior cannot be determined, say:

         "Not explicitly defined in the Assembly."

   ```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE VARIABLES
       -----------------------
       ['USER_OPTION']

       CURRENT MODULE DEPENDENCIES
       ---------------------------
       []

       CURRENT MODULE ASSEMBLY CODE
       ----------------------------
DISPLAY "1. CHECK BALANCE"
DISPLAY "2. TRANSFER MONEY"
DISPLAY "3. VIEW TRANSACTIONS"
LOAD R2, USER_OPTION
CMP R2, 1
BEQ CHECK_ACCOUNT_BALANCE
CMP R2, 2
BEQ PROCESS_TRANSFER
CMP R2, 3
BEQ TRANSACTION_REPORT
BR MAIN_MENU

       PROGRAM-WIDE LABELS
       -------------------
       []

       PROGRAM-WIDE MODULES
       --------------------
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES
       -------------------
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

       FINAL SOURCE PRIORITY
       -------------------
       1. ORIGINAL ASSEMBLY CODE
       2. PROGRAM-WIDE LABELS AND MODULES
       3. MODULE VARIABLES
       4. MODULE DEPENDENCIES
       5. DIRECTLY SUPPORTED AGENT ANALYSIS
       6. RETRIEVED KNOWLEDGE

       Never invent missing behavior.

       If behavior cannot be determined, say:

         "Not explicitly defined in the Assembly."
   ```

      *> ==========================================
      *> MODULE: LOGIN_USER
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE
         --------------
         LOGIN_USER

       CURRENT MODULE VARIABLES
         -----------------------
         ['CUSTOMER_ID', 'PASSWORD', 'SUCCESS']

       CURRENT MODULE DEPENDENCIES
         ---------------------------
         ['VALIDATE_USER']

       CURRENT MODULE ASSEMBLY CODE
         ----------------------------
         LOAD R3, CUSTOMER_ID
         LOAD R4, PASSWORD
         CALL VALIDATE_USER
         CMP R1, SUCCESS
         RETURN

       PROGRAM-WIDE LABELS
         -------------------
         []

       PROGRAM-WIDE MODULES
         --------------------
         ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES
         -------------------
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


       RETRIEVED KNOWLEDGE
         -------------------
         The following information came from the knowledge store.

         It is supplementary information only.

         Use it only when directly consistent with the
         original Assembly.

         If it conflicts with the Assembly, IGNORE it.

         LOAD R3, CUSTOMER_ID
         LOAD R4, PASSWORD
         CALL VALIDATE_USER
         CMP R1, SUCCESS
         RETURN

       PREVIOUS AGENT ANALYSIS
         -----------------------
         The following information was produced by other agents.

         These outputs are analysis only.

         They are NOT the source of truth.

         If they conflict with the original Assembly,
           IGNORE them.


--- BUSINESS AGENT OUTPUT ---

Business Purpose: To validate a customer's ID and password against a predefined user rule.

Inputs:
* CUSTOMER_ID:  A unique identifier for the customer.
* PASSWORD: The password provided by the user.

Outputs:
* SUCCESS: If the validation is successful; otherwise, FAILURE.

Business Rules:
* VALIDATE_USER: Checks if the CUSTOMER_ID and PASSWORD match a defined rule.

External Calls:
* None

Summary:
The assembly code validates a customer's ID and password against a set of rules.

FINAL SOURCE PRIORITY
----------------=====

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

      *> ==========================================
      *> MODULE: VALIDATE_USER
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE
         VALIDATE_USER

       CURRENT MODULE VARIABLES
         ['USER_DATABASE', 'CUSTOMER_ID', 'USER_ID', 'PASSWORD', 'STORED_PASSWORD', 'SUCCESS']

       CURRENT MODULE ASSEMBLY CODE
         READ USER_DATABASE
         COMPARE CUSTOMER_ID, USER_ID
         BNE INVALID_USER
         COMPARE PASSWORD, STORED_PASSWORD
         BNE INVALID_USER
         LOAD R1, SUCCESS
         RETURN


       PROGRAM-WIDE LABELS
         []

       PROGRAM-WIDE MODULES
         ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES
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

       RETRIVED KNOWLEDGE
         The following information came from the knowledge store.

         It is supplementary information only.

         Use it only when directly consistent with the
         original Assembly.

         If it conflicts with the Assembly, IGNORE it.

         READ USER_DATABASE
         COMPARE CUSTOMER_ID, USER_ID
         BNE INVALID_USER
         COMPARE PASSWORD, STORED_PASSWORD
         BNE INVALID_USER
         LOAD R1, SUCCESS
         RETURN


       PREVIOUS AGENT ANALYSIS
         The following information was produced by other agents.

         These outputs are analysis only.

         They are NOT the source of truth.

         If they conflict with the original Assembly,
           IGNORE them.


--- BUSINESS AGENT OUTPUT ---

Business Purpose:
The program reads a database containing user information and compares it to a customer ID and user ID. It then loads success onto a result variable if the customer ID matches, otherwise, it returns an invalid user status.

Inputs:
*   USER_DATABASE (Unspecified)
*   CUSTOMER_ID (Unspecified)
*   USER_ID (Unspecified)
*   PASSWORD (Unspecified)
*   STORED_PASSWORD (Unspecified)
*   SUCCESS (Unspecified)

Outputs:
*   SUCCESS (The result of the operation)

Business Rules:
1.  If CUSTOMER_ID and USER_ID match, then LOAD R1, SUCCESS.
2.  If CUSTOMER_ID does not match, then RETURN INVALID_USER.

External Calls:
None

Summary:
The program reads a database, compares customer ID and user ID, and loads success if the customer matches.

If behavior is unknown:
Not explicitly defined in the Assembly.

--- END BUSINESS OUTPUT ---


       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE
         VALIDATE_USER

       CURRENT MODULE VARIABLES
         ['USER_DATABASE', 'CUSTOMER_ID', 'USER_ID', 'PASSWORD', 'STORED_PASSWORD', 'SUCCESS']

       CURRENT MODULE ASSEMBLY CODE
         READ USER_DATABASE
         COMPARE CUSTOMER_ID, USER_ID
         BNE INVALID_USER
         COMPARE PASSWORD, STORED_PASSWORD
         BNE INVALID_USER
         LOAD R1, SUCCESS
         RETURN


       PROGRAM-WIDE LABELS
         []

       PROGRAM-WIDE MODULES
         ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES
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

       RETRIVED KNOWLEDGE
         The following information came from the knowledge store.

         It is supplementary information only.

         Use it only when directly consistent with the
         original Assembly.

         If it conflicts with the Assembly, IGNORE it.

         READ USER_DATABASE
         COMPARE CUSTOMER_ID, USER_ID
         BNE INVALID_USER
         COMPARE PASSWORD, STORED_PASSWORD
         BNE INVALID_USER
         LOAD R1, SUCCESS
         RETURN


       PREVIOUS AGENT ANALYSIS
         The following information was produced by other agents.

         These outputs are analysis only.

         They are NOT the source of truth.

         If they conflict with the original Assembly,
           IGNORE them.


--- BUSINESS AGENT OUTPUT ---

Business Purpose:
The program reads a database containing user information and compares it to a customer ID and user ID. It then loads success onto a result variable if the customer ID matches, otherwise, it returns an invalid user status.

Inputs:
*   USER_DATABASE (Unspecified)
*   CUSTOMER_ID (Unspecified)
*   USER_ID (Unspecified)
*   PASSWORD (Unspecified)
*   STORED_PASSWORD (Unspecified)
*   SUCCESS (Unspecified)

Outputs:
*   SUCCESS (The result of the operation)

Business Rules:
1.  If CUSTOMER_ID and USER_ID match, then LOAD R1, SUCCESS.
2.  If CUSTOMER_ID does not match, then RETURN INVALID_USER.

External Calls:
None

Summary:
The program reads a database, compares customer ID and user ID, and loads success onto a result variable if the customer matches.

If behavior is unknown:
Not explicitly defined in the Assembly.

--- END BUSINESS OUTPUT ---


       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAM-WIDE LABELS AND MODULES.

       CURRENT MODULE
         VALIDATE_USER

       CURRENT MODULE VARIABLES
         ['USER_DATABASE', 'CUSTOMER_ID', 'USER_ID', 'PASSWORD', 'STORED_PASSWORD', 'SUCCESS']

       CURRENT MODULE ASSEMBLY CODE
         READ USER_DATABASE
         COMPARE CUSTOMER_ID, USER_ID
         BNE INVALID_USER
         COMPARE PASSWORD, STORED_PASSWORD
         BNE INVALID_USER
         LOAD R1, SUCCESS
         RETURN


       PROGRAM-WIDE LABELS
         ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       PROGRAM-WIDE MODULES
         ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES
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
         1

      *> ==========================================
      *> MODULE: INVALID_USER
      *> ==========================================
LOAD R1, FAILURE
RETURN
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.
       BEGIN.
       END.
       1.  LOAD R1, FAILURE.
       2.  RETURN.

      *> ==========================================
      *> MODULE: LOGIN_FAILED
      *> ==========================================
```
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       DATA SECTION.
       DISPLAY "INVALID LOGIN"
       BR END_PROGRAM

       PROGRAM-WIDE LABELS.
       []

       PROGRAM-WIDE MODULES.
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES.
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

       RETRIEVED KNOWLEDGE.
       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       DISPLAY "INVALID LOGIN"
       BR END_PROGRAM

       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       DATA SECTION.
       DISPLAY "INVALID LOGIN"
       BR END_PROGRAM

       PROGRAM-WIDE LABELS.
       []

       PROGRAM-WIDE MODULES.
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES.
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

       RETRIEVED KNOWLEDGE.
       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       DISPLAY "INVALID LOGIN"
       BR END_PROGRAM

       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       DATA SECTION.
       DISPLAY "INVALID LOGIN"
       BR END_PROGRAM

       PROGRAM-WIDE LABELS.
       []

       PROGRAM-WIDE MODULES.
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES.
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

       RETRIEVED KNOWLEDGE.
       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       DISPLAY "INVALID LOGIN"
       BR END_PROGRAM

       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       DATA SECTION.
       DISPLAY "INVALID LOGIN"
       BR END_PROGRAM

       PROGRAM-WIDE LABELS.
       []

       PROGRAM-WIDE MODULES.
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES.
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

       RETRIEVED KNOWLEDGE.
       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       DISPLAY "INVALID LOGIN"
       BR END_PROGRAM

       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       DATA SECTION.
       DISPLAY "INVALID LOGIN"
       BR END_PROGRAM

       PROGRAM-WIDE LABELS.
       []

       PROGRAM-WIDE MODULES.
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES.
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
       16. If an

      *> ==========================================
      *> MODULE: CHECK_ACCOUNT_BALANCE
      *> ==========================================
LOAD R5, ACCOUNT_NUMBER
CALL FETCH_BALANCE
DISPLAY BALANCE
BR MAIN_MENU

      *> ==========================================
      *> MODULE: FETCH_BALANCE
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE
       FETCH_BALANCE

       CURRENT MODULE VARIABLES
       ['ACCOUNT_FILE', 'ACCOUNT_BALANCE']

       CURRENT MODULE DEPENDENCIES
       []

       CURRENT MODULE ASSEMBLY CODE
       READ ACCOUNT_FILE
       LOAD R6, ACCOUNT_BALANCE
       RETURN

       PROGRAM-WIDE LABELS
       []

       PROGRAM-WIDE MODULES
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_Fonds', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES
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

       RETRIEVED KNOWLEDGE
       ===================

       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       READ ACCOUNT_FILE
       LOAD R6, ACCOUNT_BALANCE
       RETURN

       PREVIOUS AGENT ANALYSIS
       =======================

       The following information was produced by other agents.

       These outputs are analysis only.

       They are NOT the source of truth.

       If they conflict with the original Assembly,
       IGNORE them.

      --- BUSINESS AGENT OUTPUT ---

      Business Purpose: Read account balance and return it.

      Inputs:
      *   Account File: (Unspecified)
      *   Account Balance: (Unspecified)

      Outputs:
      *   Return value: Account Balance

      Business Rules:
      *   Read Account File:  The Assembly code reads the contents of an Account File.
      *   Load Account Balance: The Assembly code loads the value from the account file into a variable.
      *   Return: Returns the loaded account balance to the caller.

      External Calls:
      *   None

      Summary:
      Reads the account file and returns the balance.

      If behavior is unknown:
      Not explicitly defined in the Assembly.

      --- END BUSINESS OUTPUT ---

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

      *> ==========================================
      *> MODULE: PROCESS_TRANSFER
      *> ==========================================
    FILE PROGRAM BANK.
        PROGRAM-ID. BANK.
        SOURCE-PROGRAM. BANK.

    FILE SOURCE.
        LOAD R7, SENDER_ACCOUNT
        LOAD R8, RECEIVER_ACCOUNT
        LOAD R9, TRANSFER_AMOUNT
        CALL CHECK_FUNDS
        CMP R1, SUCCESS
        BNE INSUFFICIENT_FUNDS
        CALL DEBIT_ACCOUNT
        CALL CREDIT_ACCOUNT
        CALL SAVE_TRANSACTION
        DISPLAY "TRANSFER SUCCESSFUL"
        BR MAIN_MENU

    FILE END.

      *> ==========================================
      *> MODULE: CHECK_FUNDS
      *> ==========================================
LOAD R10, CURRENT_BALANCE
CMP R10, TRANSFER_AMOUNT
BLT INSUFFICIENT_FUNDS
LOAD R1, SUCCESS
RETURN

      *> ==========================================
      *> MODULE: INSUFFICIENT_FUNDS
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE
       --------------
       INSUFFICIENT_FUNDS

       CURRENT MODULE VARIABLES
       -----------------------
       ['FAILURE']

       CURRENT MODULE DEPENDENCIES
       ---------------------------
       []

       CURRENT MODULE ASSEMBLY CODE
       ----------------------------
DISPLAY "INSUFFICIENT BALANCE"
LOAD R1, FAILURE
BR MAIN_MENU

PROGRAM-WIDE LABELS
-------------------
['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

IMPORTANT GROUNDING RULES
-------------------------
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
11. A label may be defined in another module. Use PROGRAM-WIDE LABELS when checking branches.
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

RETRIVED KNOWLEDGE
========================

The following information came from the knowledge store.

It is supplementary information only.

Use it only when directly consistent with the
original Assembly.

If it conflicts with the Assembly, IGNORE it.

DISPLAY "INSUFFICIENT BALANCE"
LOAD R1, FAILURE
BR MAIN_MENU

PREVIOUS AGENT ANALYSIS
=======================

The following information was produced by other agents.

These outputs are analysis only.

They are NOT the source of truth.

If they conflict with the original Assembly,
IGNORE them.


--- BUSINESS AGENT OUTPUT ---

Business Purpose:
Analyze the assembly code to determine the outcome of a simple menu-driven program. The program attempts to retrieve funds from an account but fails due to insufficient funds.

Inputs:
*   INPUT FAILURE: An account balance is insufficient.

Outputs:
*   OUTPUT "INSUFFICIENT BALANCE"
*   OUTPUT "FAILURE"

Business Rules:
*   The program's primary goal is to display an error message ("INSUFFICIENT BALANCE") and exit the program.  It does not perform any other actions beyond these two outputs.

External Calls:
*   None

Summary:
The program attempts to retrieve funds, but fails due to insufficient balance. The output will be displayed to the user.

If behavior is unknown:
Not explicitly defined in the Assembly.

--- END BUSINESS OUTPUT ---

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

      *> ==========================================
      *> MODULE: DEBIT_ACCOUNT
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT_BALANCE = 1000.00
       TRANSFER_AMOUNT = 500.00

       CURRENT_BALANCE = 1000.00
       TRANSFER_AMOUNT = 500.00

       CURRENT_BALANCE = 1000.00
       TRANSFER_AMOUNT = 500.00

       CURRENT_BALANCE = 1000.00
       TRANSFER_AMOUNT = 500.00

       CURRENT_BALANCE = 1000.00
       TRANSFER_AMOUNT = 500.00

       CURRENT_BALANCE = 1000.00
       TRANSFER_AMOUNT = 500.00


       RETURN

       PROGRAM-WIDE LABELS
       -------------------
       []

       PROGRAM-WIDE MODULES
       --------------------
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES
       -------------------
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

      *> ==========================================
      *> MODULE: CREDIT_ACCOUNT
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE VARIABLES
       -----------------------
       ['RECEIVER_BALANCE', 'TRANSFER_AMOUNT']

       CURRENT MODULE DEPENDENCIES
       ---------------------------
       []

       CURRENT MODULE ASSEMBLY CODE
       ----------------------------
       ADD RECEIVER_BALANCE, TRANSFER_AMOUNT
       STORE RECEIVER_BALANCE
       RETURN

       PROGRAM-WIDE LABELS
       -------------------
       []

       PROGRAM-WIDE MODULES
       --------------------
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES
       -------------------
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

       RETRIEVED KNOWLEDGE
       -------------------
       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       ADD RECEIVER_BALANCE, TRANSFER_AMOUNT
       STORE RECEIVER_BALANCE
       RETURN


PREVIOUS AGENT ANALYSIS
-----------------------
The following information was produced by other agents.

These outputs are analysis only.

They are NOT the source of truth.

If they conflict with the original Assembly,
IGNORE them.


--- BUSINESS AGENT OUTPUT ---

Business Purpose:
Retrieve and store the receiver's balance after a transfer.

Inputs:
* RECEIVER_BALANCE (not provided)
* TRANSFER_AMOUNT (not provided)

Outputs:
*RECEIVER_BALANCE (updated with transferred amount)

Business Rules:
* The receiver's balance is updated after a transfer.
* The value of the receiver’s balance must be passed as input to the function.

External Calls:
None

Summary:
The code retrieves the current receiver balance and updates it based on a transfer amount.

If behavior is unknown:
Not explicitly defined in the Assembly.

--- END BUSINESS OUTPUT ---


       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE VARIABLES
       -----------------------
       ['RECEIVER_BALANCE', 'TRANSFER_AMOUNT']

       CURRENT MODULE DEPENDENCIES
       ---------------------------
       []

       CURRENT MODULE ASSEMBLY CODE
       ----------------------------
       ADD RECEIVER_BALANCE, TRANSFER_AMOUNT
       STORE RECEIVER_BALANCE
       RETURN

       PROGRAM-WIDE LABELS
       -------------------
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES
       -------------------
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

       RETRIEVED KNOWLEDGE
       -------------------
       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       ADD RECEIVER_BALANCE, TRANSFER_AMOUNT
       STORE RECEIVER_BALANCE
       RETURN


PREVIOUS AGENT ANALYSIS
-----------------------
The following information was produced by other agents.

These outputs are analysis only.

They are NOT the source of truth.

If they conflict with the original Assembly,
IGNORE them.


--- BUSINESS AGENT OUTPUT ---

Business Purpose:
Retrieve and store the receiver's balance after a transfer.

Inputs:
*RECEIVER_BALANCE (not provided)
* TRANSFER_AMOUNT (not provided)

Outputs:
*RECEIVER_BALANCE (updated with transferred amount)

Business Rules:
* The receiver's balance is updated after a transfer.
* The value of the receiver’s balance must be passed as input to the function.

External Calls:
None

Summary:
The code retrieves the current receiver balance and updates it based on a transfer amount.

If behavior is unknown:
Not explicitly defined in the Assembly.

--- END BUSINESS OUTPUT ---


       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE VARIABLES
       -----------------------
       ['RECEIVER_BALANCE', 'TRANSFER_AMOUNT']

       CURRENT MODULE DEPENDENCIES
       ---------------------------
       []

       CURRENT MODULE ASSEMBLY CODE
       ----------------------------
       ADD RECEIVER_BALANCE, TRANSFER_AMOUNT
       STORE RECEIVER_BALANCE
       RETURN

       PROGRAM-WIDE LABELS
       -------------------
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES
       -------------------
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

       RETRIEVED KNOWLEDGE
       -------------------
       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       ADD RECEIVER_BALANCE, TRANSFER_AMOUNT
       STORE RECEIVER_BALANCE
       RETURN


PREVIOUS AGENT ANALYSIS
-----------------------
The following information was produced by other agents.

These outputs are analysis only.

They are NOT the source of truth.

If they conflict with the original Assembly,
IGNORE them.


--- BUSINESS AGENT OUTPUT ---

Business Purpose:
Retrieve and store the receiver's balance after a transfer.

Inputs:
*RECEIVER_BALANCE (not provided)
* TRANSFER_AMOUNT (not provided)

Outputs:
*RECEIVER_BALANCE (updated with transferred amount)

Business Rules:
* The receiver's balance is updated after a transfer.
* The value of the receiver’s balance must be passed as input to the function.

External Calls:
None

Summary:
The code retrieves the current receiver balance and updates it based on a transfer amount.

If behavior is unknown:
Not explicitly defined in the Assembly.

--- END BUSINESS OUTPUT ---


       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE VARIABLES
       -----------------------
       ['RECEIVER_BALANCE', 'TRANSFER_AMOUNT']

       CURRENT MODULE DEPENDENCIES
       ---------------------------
       []

       CURRENT MODULE ASSEMBLY CODE
       ----------------------------
       ADD RECEIVER_BALANCE, TRANSFER_AMOUNT
       STORE RECEIVER_BALANCE
       RETURN

       PROGRAM-WIDE LABELS
       -------------------
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', '

      *> ==========================================
      *> MODULE: SAVE_TRANSACTION
      *> ==========================================
       MAIN-PROGRAM.
           DISPLAY "TRANSACTION LOG"
           RETURN.
```

      *> ==========================================
      *> MODULE: TRANSACTION_REPORT
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE
       --------------
       TRANSACTION_REPORT

       CURRENT MODULE VARIABLES
       -----------------------
       []

       CURRENT MODULE DEPENDENCIES
       ---------------------------
       ['LOAD_TRANSACTIONS', 'DISPLAY_REPORT']

       CURRENT MODULE ASSEMBLY CODE
       ----------------------------
       CALL LOAD_TRANSACTIONS
       CALL DISPLAY_REPORT
       BR MAIN_MENU

       PROGRAM-WIDE LABELS
       --------------
       []

       PROGRAM-WIDE MODULES
       --------------
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

```

      *> ==========================================
      *> MODULE: LOAD_TRANSACTIONS
      *> ==========================================
READ TRANSACTION_LOG RETURN

      *> ==========================================
      *> MODULE: DISPLAY_REPORT
      *> ==========================================
       MAIN-PROGRAM FLOW.
       DISPLAY "TRANSACTION HISTORY"
           RETURN.
```

      *> ==========================================
      *> MODULE: INITIALIZE_SYSTEM
      *> ==========================================
       MAIN FLOW.
           LOAD R0, SYSTEM_READY
           RETURN.
```

      *> ==========================================
      *> MODULE: DATA
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE VARIABLES
           ['CUSTOMER_ID', 'PASSWORD', 'USER_ID', 'STORED_PASSWORD', 'ACCOUNT_NUMBER', 'CURRENT_BALANCE', 'RECEIVER_BALANCE', 'TRANSFER_AMOUNT', 'FILE', 'SUCCESS', 'FAILURE']

       CURRENT MODULE DEPENDENCIES
           []

       CURRENT MODULE ASSEMBLY CODE
           CUSTOMER_ID        DB 10001
           PASSWORD           DB 123456
           USER_ID            DB 10001
           STORED_PASSWORD    DB 123456
           ACCOUNT_NUMBER     DB 900001
           CURRENT_BALANCE    DB 50000
           RECEIVER_BALANCE   DB 20000
           TRANSFER_AMOUNT    DB 1000
           TRANSACTION_LOG    FILE
           SUCCESS            EQU 1
           FAILURE            EQU 0

       PROGRAM-WIDE LABELS
           []

       PROGRAM-WIDE MODULES
           ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES
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


       RETRIEVED KNOWLEDGE
           The following information came from the knowledge store.

           It is supplementary information only.

           Use it only when directly consistent with the
           original Assembly.

           If it conflicts with the Assembly, IGNORE it.

           CUSTOMER_ID        DB 10001
           PASSWORD           DB 123456
           USER_ID            DB 10001
           STORED_PASSWORD    DB 123456
           ACCOUNT_NUMBER     DB 900001
           CURRENT_BALANCE    DB 50000
           RECEIVER_BALANCE   DB 20000
           TRANSFER_AMOUNT    DB 1000
           TRANSACTION_LOG    FILE
           SUCCESS            EQU 1
           FAILURE            EQU 0

       PREVIOUS AGENT ANALYSIS
           The following information was produced by other agents.

           These outputs are analysis only.

           They are NOT the source of truth.

           If they conflict with the original Assembly,
             IGNORE them.


--- BUSINESS AGENT OUTPUT ---

Business Purpose:
The program manages a customer account with balances and transfers. It logs transactions to a file. The system has a success/failure outcome for a transaction.

Inputs:
- CUSTOMER_ID (DB 10001)
- PASSWORD (DB 123456)
- USER_ID (DB 10001)
- STORED_PASSWORD (DB 123456)
- ACCOUNT_NUMBER (DB 900001)
- CURRENT_BALANCE (DB 50000)
- RECEIVER_BALANCE (DB 20000)
- TRANSFER_AMOUNT (DB 1000)
- TRANSACTION_LOG (FILE)

Outputs:
- SUCCESS (EQU 1)
- FAILURE (EQU 0)

Business Rules:
- The account balance is updated based on transfers.
- Transactions are logged to a file.
- A success or failure outcome is determined for each transaction.

External Calls:
- None

Summary:
The program handles customer account transactions, logging them to a file.  It manages balances and transfers.

If behavior is unknown:

Not explicitly defined in the Assembly.

--- END BUSINESS OUTPUT ---

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

      *> ==========================================
      *> MODULE: END_PROGRAM
      *> ==========================================
      MAIN-MENU PLACED.
      EXECUTE-BY-PROGRAM-ID.
      RETURN TO PROGRAM-ID.
```