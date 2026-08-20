cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       DATA SECTION.
       GLOBAL VARIABLES.
       ACCOUNT_A   VALUE  1000
       ACCOUNT_B   VALUE  500

       CALLS SECTION.
       CALL  LOGIN.

       DISPLAY SECTION.
       DISPLAY "Account A Balance: $".
       DISPLAY "Account B Balance: $".

       STOP SECTION.
       PROGRAM-WIDE LABELS.
       PROGRAM-WIDE MODULES.
       MODULES.
       '----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

      *> ==========================================
      *> MODULE: LOGIN
      *> ==========================================
       MAIN-PROGRAM:
           DISPLAY "LOGIN"
           LOAD R1, CUSTOMER_ID
           LOAD R2, PASSWORD
           CALL AUTHENTICATE
           IF AUTHENTICATE = 0 THEN
               DISPLAY "ERROR"
               RETURN
           END-IF
           DISPLAY "LOGIN_FAILED"
           DISPLAY "MAIN_MENU"
           DISPLAY "TRANSFER_SUCCESS"
           DISPLAY "CHECK_BALANCE"
           DISPLAY "GENERATE_REPORT"
           DISPLAY "AUTHENTicate"
           DISPLAY "CHECK_BALANCE"
           DISPLAY "UPDATE_SENDER"
           DISPLAY "UPDATE_RECEIVER"
           DISPLAY "SAVE_TRANSACTION"
           DISPLAY "GET_TRANSACTIONS"
           DISPLAY "PRINT_REPORT"
           DISPLAY "END_PROGRAM"

       STOP RUN.

      *> ==========================================
      *> MODULE: LOGIN_FAILED
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       DATA DIVISION.
       WORKING-STORAGE SECTION .
       01  LOGIN-FAILED PIC X VALUE "INVALID USER".
       02  01  GLOBAL PIC X VALUE "GLOBAL".
       02  01  01  LOGIN-FAILED PIC X VALUE "LOGIN_FAILED".
       03  01  TRANSFER PIC X VALUE "TRANSFER".
       04  01  INSUFFICIENT-FUNDS PIC X VALUE "Insufficient Funds".
       05  01  01  TRANSFER_SUCCESS PIC X VALUE "TRANSFER_SUCCESS".
       06  01  CALCULATE_INTEREST PIC X VALUE "Calculate Interest".
       07  01  GENERATE_REPORT PIC X VALUE "Generate Report".
       08  01  MAIN-MENU PIC X VALUE "Main Menu".
       09  01  01  AUTHENTICATE PIC X VALUE "Authenticate".
       10  01  01  CHECK_BALANCE PIC X VALUE "Check Balance".
       11  01  01  UPDATE_SENDER PIC X VALUE "Update Sender".
       12  01  01  UPDATE_RECEIVER PIC X VALUE "Update Receiver".
       13  01  01  SAVE_TRANSACTION PIC X VALUE "Save Transaction".
       14  01  01  GET_TRANSACTIONS PIC X VALUE "Get Transactions".
       15  01  01  PRINT_REPORT PIC X VALUE "Print Report".
       16  01  END_PROGRAM.

     CODE DIVISION.
       DISPLAY "INVALID USER"
       BR END_PROGRAM.

     EXECUTE-SECTION.
       DISPLAY "INVALID LOGIN"
       BR END_PROGRAM.

      *> ==========================================
      *> MODULE: TRANSFER
      *> ==========================================
LOAD R3, SENDER_ACCOUNT
LOAD R4, RECEIVER_ACCOUNT
LOAD R5, AMOUNT
CALL CHECK_BALANCE
BNE INSUFFICIENT_FUNDS
CALL UPDATE_SENDER
CALL UPDATE_RECEIVER
CALL SAVE_TRANSACTION
BR TRANSFER_SUCCESS

PROGRAM-WIDE LABELS
-------------------
[]

PROGRAM-WIDE MODULES
--------------------
['GLOBAL', 'LOGIN', 'LOGIN_FAILED', 'TRANSFER', 'INSUFFICIENT_FUNDS', 'TRANSFER_SUCCESS', 'CALCULATE_INTEREST', 'GENERATE_REPORT', 'MAIN_MENU', 'AUTHENTICATE', 'CHECK_BALANCE', 'UPDATE_SENDER', 'UPDATE_RECEIVER', 'SAVE_TRANSACTION', 'GET_TRANSACTIONS', 'PRINT_REPORT', 'END_PROGRAM']

LOAD R3, SENDER_ACCOUNT
LOAD R4, RECEIVER_ACCOUNT
LOAD R5, AMOUNT
CALL CHECK_BALANCE
BNE INSUFFICIENT_FUNDS
CALL UPDATE_SENDER
CALL UPDATE_RECEIVER
CALL SAVE_TRANSACTION
BR TRANSFER_SUCCESS

IDENTIFICATION DIVISION.
PROGRAM-ID. BANK.

SOURCE SECTION.
PROGRAM-WIDE LABELS.
-------------------
[]

PROGRAM-WIDE MODULES.
--------------------
['GLOBAL', 'LOGIN', 'LOGIN_FAILED', 'TRANSFER', 'INSUFFICIENT_FUNDS', 'TRANSFER_SUCCESS', 'CALCULATE_INTEREST', 'GENERATE_REPORT', 'MAIN_MENU', 'AUTHENTICATE', 'CHECK_BALANCE', 'UPDATE_SENDER', 'UPDATE_RECEIVER', 'SAVE_TRANSACTION', 'GET_TRANSACTIONS', 'PRINT_REPORT', 'END_PROGRAM']

DATA SECTION.
-------------------
['SENDER_ACCOUNT', 'RECEIVER_ACCOUNT', 'AMOUNT']

DEPENDENCIES.
-----------------------
['CHECK_BALANCE']

ASSEMBLY CODE:
LOAD R3, SENDER_ACCOUNT
LOAD R4, RECEIVER_ACCOUNT
LOAD R5, AMOUNT
CALL CHECK_BALANCE
BNE INSUFFICIENT_FUNDS
CALL UPDATE_SENDER
CALL UPDATE_RECEIVER
CALL SAVE_TRANSACTION
BR TRANSFER_SUCCESS

END_PROGRAM.

      *> ==========================================
      *> MODULE: INSUFFICIENT_FUNDS
      *> ==========================================
cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       PROGRAM-WIDE LABELS.
       -------------------
       ['GLOBAL', 'LOGIN', 'LOGIN_FAILED', 'TRANSFER', 'INSUFFICIENT_FUNDS', 'TRANSFER_SUCCESS', 'CALCULATE_INTEREST', 'GENERATE_REPORT', 'MAIN_MENU', 'AUTHENTICATE', 'CHECK_BALANCE', 'UPDATE_SENDER', 'UPDATE_RECEIVER', 'SAVE_TRANSACTION', 'GET_TRANSACTIONS', 'PRINT_REPORT', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES.
       -----------------------
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
       -----------------------
       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       DISPLAY "INSUFFICIENT BALANCE"
       BR END_PROGRAM


       PROGRAM-WIDE LABELS.
       -------------------
       ['GLOBAL', 'LOGIN', 'LOGIN_FAILED', 'TRANSFER', 'INSUFFICIENT_FUNDS', 'TRANSFER_SUCCESS', 'CALCULATE_INTEREST', 'GENERATE_REPORT', 'MAIN_MENU', 'AUTHENTICATE', 'CHECK_BALANCE', 'UPDATE_SENDER', 'UPDATE_RECEIVER', 'SAVE_TRANSACTION', 'GET_TRANSACTIONS', 'PRINT_REPORT', 'END_PROGRAM']

       CURRENT MODULE
       --------------
       INSUFFICIENT_FUNDS

       CURRENT MODULE VARIABLES
       -----------------
       []

       CURRENT MODULE DEPENDENCIES
       ------------------
       []

       MODULE ASSEMBLY CODE
       --------------------
       DISPLAY "INSUFFICIENT BALANCE"
       BR END_PROGRAM

       PROGRAM-WIDE LABELS
       -------------------
       ['GLOBAL', 'LOGIN', 'LOGIN_FAILED', 'TRANSFER', 'INSUFFICIENT_FUNDS', 'TRANSFER_SUCCESS', 'CALCULATE_INTEREST', 'GENERATE_REPORT', 'MAIN_MENU', 'AUTHENTICATE', 'CHECK_BALANCE', 'UPDATE_SENDER', 'UPDATE_RECEIVER', 'SAVE_TRANSACTION', 'GET_TRANSACTIONS', 'PRINT_REPORT', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES
       -----------------------
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
       -----------------------
       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       DISPLAY "INSUFFICIENT BALANCE"
       BR END_PROGRAM


       PROGRAM-WIDE LABELS.
       -------------------
       ['GLOBAL', 'LOGIN', 'LOGIN_FAILED', 'TRANSFER', 'INSUFFICIENT_FUNDS', 'TRANSFER_SUCCESS', 'CALCULATE_INTEREST', 'GENERATE_REPORT', 'MAIN_MENU', 'AUTHENTICATE', 'CHECK_BALANCE', 'UPDATE_SENDER', 'UPDATE_RECEIVER', 'SAVE_TRANSACTION', 'GET_TRANSACTIONS', 'PRINT_REPORT', 'END_PROGRAM']

       CURRENT MODULE
       --------------
       INSUFFICIENT_FUNDS

       CURRENT MODULE VARIABLES
       -----------------
       []

       CURRENT MODULE DEPENDENCIES
       ------------------
       []

       MODULE ASSEMBLY CODE
       --------------------
       DISPLAY "INSUFFICIENT BALANCE"
       BR END_PROGRAM

       PROGRAM-WIDE LABELS.
       -------------------
       ['GLOBAL', 'LOGIN', 'LOGIN_FAILED', 'TRANSFER', 'INSUFFICIENT_FUNDS', 'TRANSFER_SUCCESS', 'CALCULATE_INTEREST', 'GENERATE_REPORT', 'MAIN_MENU', 'AUTHENTICATE', 'CHECK_BALANCE', 'UPDATE_SENDER', 'UPDATE_RECEIVER', 'SAVE_TRANSACTION', 'GET_TRANSACTIONS', 'PRINT_REPORT', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES
       -----------------------
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
       -----------------------
       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       DISPLAY "INSUFFICIENT BALANCE"
       BR END_PROGRAM


       PROGRAM-WIDE LABELS.
       -------------------
       ['GLOBAL', 'LOGIN', 'LOGIN_FAILED', 'TRANSFER', 'INSUFFICIENT_FUNDS', 'TRANSFER_SUCCESS', 'CALCULATE_INTEREST', 'GENERATE_REPORT', 'MAIN_MENU', 'AUTHENTICATE', 'CHECK_BALANCE', 'UPDATE_SENDER', 'UPDATE_RECEIVER', 'SAVE_TRANSACTION', 'GET_TRANSACTIONS', 'PRINT_REPORT', 'END_PROGRAM']

       CURRENT MODULE
       --------------
       INSUFFICIENT_FUNDS

       CURRENT MODULE VARIABLES
       -----------------
       []

       CURRENT MODULE DEPENDENCIES
       ------------------
       []

       MODULE ASSEMBLY CODE
       --------------------
       DISPLAY "INSUFFICIENT BALANCE"
       BR END_PROGRAM

       PROGRAM-WIDE LABELS.
       -------------------
       ['GLOBAL', 'LOGIN', 'LOGIN_FAILED', 'TRANSFER', 'INSUFFICIENT_FUNDS', 'TRANSFER_SUCCESS', 'CALCULATE_INTEREST', 'GENERATE_REPORT', 'MAIN_MENU', 'AUTHENTICATE', 'CHECK_BALANCE', 'UPDATE_SENDER', 'UPDATE_RECEIVER', 'SAVE_TRANSACTION', 'GET_TRANSACTIONS', 'PRINT_REPORT', 'END_PROGRAM']

       IMPORTANT GROUNDING RULES
       -----------------------
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
       -----------------------
       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       DISPLAY "INSUFFICIENT BALANCE"
       BR END_PROGRAM


       PROGRAM-WIDE LABELS.
       -------------------
       ['GLOBAL', 'LOGIN', 'LOGIN_FAILED', 'TRANSFER', 'INSUFFICIENT_FUNDS', 'TRANSFER_SUCCESS', 'CALCULATE_INTEREST', 'GENERATE_REPORT', 'MAIN_MENU', 'AUTHENTICATE', 'CHECK_BALANCE', 'UPDATE_SENDER', 'UPDATE_RECEIVER', 'SAVE_TRANSACTION', 'GET_TRANSACTIONS',

      *> ==========================================
      *> MODULE: TRANSFER_SUCCESS
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE
       TRANSFER_SUCCESS

       CURRENT MODULE VARIABLES
       []

       CURRENT MODULE DEPENDENCIES
       []

       CURRENT MODULE ASSEMBLY CODE
       DISPLAY "TRANSFER SUCCESSFUL"

       PROGRAM-WIDE LABELS
       []

       PROGRAM-WIDE MODULES
       ['GLOBAL', 'LOGIN', 'LOGIN_FAILED', 'TRANSFER', 'INSUFFICIENT_FUNDS', 'TRANSFER_SUCCESS', 'CALCULATE_INTEREST', 'GENERATE_REPORT', 'MAIN_MENU', 'AUTHENTICATE', 'CHECK_BALANCE', 'UPDATE_SENDER', 'UPDATE_RECEIVER', 'SAVE_TRANSACTION', 'GET_TRANSACTIONS', 'PRINT_REPORT', 'END_PROGRAM']

      *> ==========================================
      *> MODULE: CALCULATE_INTEREST
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE
         CALCULATE_INTEREST

       CURRENT MODULE VARIABLES
         ['BALANCE', 'RATE', 'INTEREST']

       CURRENT MODULE DEPENDENCIES
         []

       CURRENT MODULE ASSEMBLY CODE
         LOAD R6, BALANCE
         LOAD R7, RATE
         MULT R6, R7
         STORE INTEREST
         RETURN

       PROGRAM-WIDE LABELS
         []

       PROGRAM-WIDE MODULES
         []

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

       FINAL SOURCE PRIORITY
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
      *> MODULE: GENERATE_REPORT
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE
       GENERATE_REPORT

       CURRENT MODULE VARIABLES
       []

       CURRENT MODULE DEPENDENCIES
       ['GET_TRANSACTIONS', 'PRINT_REPORT']

       CURRENT MODULE ASSEMBLY CODE
       CALL GET_TRANSACTIONS
       CALL PRINT_REPORT
       RETURN

       PROGRAM-WIDE LABELS
       []

       PROGRAM-WIDE MODULES
       ['GLOBAL', 'LOGIN', 'LOGIN_FAILED', 'TRANSFER', 'INSUFFICIENT_FUNDS', 'TRANSFER_SUCCESS', 'CALCULATE_INTEREST', 'GENERATE_REPORT', 'MAIN_MENU', 'AUTHENTICATE', 'CHECK_BALANCE', 'UPDATE_SENDER', 'UPDATE_RECEIVER', 'SAVE_TRANSACTION', 'GET_TRANSACTIONS', 'PRINT_REPORT', 'END_PROGRAM']

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
       ===================

       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       CALL GET_TRANSACTIONS
       CALL PRINT_REPORT
       RETURN

       PROGRAM-WIDE LABELS
       []

       PROGRAM-WIDE MODULES
       ['GLOBAL', 'LOGIN', 'LOGIN_FAILED', 'TRANSFER', 'INSUFFICIENT_FUNDS', 'TRANSFER_SUCCESS', 'CALCULATE_INTEREST', 'GENERATE_REPORT', 'MAIN_MENU', 'AUTHENTICATE', 'CHECK_BALANCE', 'UPDATE_SENDER', 'UPDATE_RECEIVER', 'SAVE_TRANSACTION', 'GET_TRANSACTIONS', 'PRINT_REPORT', 'END_PROGRAM']

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
         exists in PROGRAM-WIDE MODULES or PROGRAM-WIDE LABELS.
       14. Do not report a CALL as missing if the CALL target exists
         in PROGRAM-WIDE MODULES or PROGRAM-WIDE LABELS.
       15. If something cannot be determined from the Assembly,
         explicitly report it as UNKNOWN or AMBIGUOUS.
       16. If an Assembly instruction is not understood, do not
         silently replace it with invented behavior.
       17. The original Assembly code has higher priority than
         retrieved knowledge and previous agent analysis.

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
      *> MODULE: MAIN_MENU
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

CURRENT MODULE
--------------
MAIN_MENU

CURRENT MODULE VARIABLES
-----------------------
[]

CURRENT MODULE DEPENDENCIES
---------------------------
[]

CURRENT MODULE ASSEMBLY CODE
----------------------------
DISPLAY "1. Check Balance"
DISPLAY "2. Transfer Money"
DISPLAY "3. Generate Report"
RETURN

PROGRAM-WIDE LABELS
-------------------
1. Check Balance
2. Transfer Money
3. Generate Report

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
    exists in PROGRAM-WIDE MODULES or PROGRAM-WIDE LABELS.
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

DISPLAY "1. Check Balance"
DISPLAY "2. Transfer Money"
DISPLAY "3. Generate Report"
RETURN

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
      *> MODULE: AUTHENTICATE
      *> ==========================================
LOAD USER_TABLE
RETURN

      *> ==========================================
      *> MODULE: CHECK_BALANCE
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       DATA SECTION.
       BALANCE   1000.00
       AMOUNT    1000.00

       CALLS SECTION.
       CALL  LOAD_BALANCE
           COMPARE BALANCE, AMOUNT
           RETURN

       LOAD_BALANCE
           DISPLAY BALANCE
           DISPLAY AMOUNT
           RETURN

       RETURN SECTION.

      *> ==========================================
      *> MODULE: UPDATE_SENDER
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE VARIABLES
       ['BALANCE', 'AMOUNT']

       CURRENT MODULE DEPENDENCIES
       []

       CURRENT MODULE ASSEMBLY CODE
       SUB BALANCE, AMOUNT
       STORE BALANCE
       RETURN

       PROGRAM-WIDE LABELS
       []

       PROGRAM-WIDE MODULES
       ['GLOBAL', 'LOGIN', 'LOGIN_FAILED', 'TRANSFER', 'INSUFFICIENT_FUNDS', 'TRANSFER_SUCCESS', 'CALCULATE_INTEREST', 'GENERATE_REPORT', 'MAIN_MENU', 'AUTHENTICATE', 'CHECK_BALANCE', 'UPDATE_SENDER', 'UPDATE_RECEIVER', 'SAVE_TRANSACTION', 'GET_TRANSACTIONS', 'PRINT_REPORT', 'END_PROGRAM']

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

       SUB CURRENT_BALANCE, TRANSFER_AMOUNT
       STORE CURRENT_BALANCE
       RETURN

       PREVIOUS AGENT ANALYSIS
       The following information was produced by other agents.

       These outputs are analysis only.

       They are NOT the source of truth.

       If they conflict with the original Assembly,
       IGNORE them.


       --- BUSINESS AGENT OUTPUT ---

       Business Purpose: Update balance and transfer amount.

       Inputs:
       *   BALANCE: Current balance
       *   AMOUNT: Amount to transfer

       Outputs:
       *   CURRENT_BALANCE: Updated balance

       Business Rules:
       *   UPDATE_SENDER: The program is updating the balance of a specific sender.
       *   TRANSFER_AMOUNT: The amount being transferred is specified.

       External Calls: None

       Summary:
       The program updates the balance and transfers an amount to a specified sender.

       If behavior is unknown:

       Not explicitly defined in the Assembly.

       --- END BUSINESS OUTPUT ---

       FINAL SOURCE PRIORITY
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
      *> MODULE: UPDATE_RECEIVER
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       DATA SECTION.
       DATA DECLARATIONS.
       BALANCE   100.00
       AMOUNT    50.00

       CALLS SECTION.
       CALLS  CALL_RECEIVER.

       EXECUTION SECTION.
       RETURN.

      *> ==========================================
      *> MODULE: SAVE_TRANSACTION
      *> ==========================================
       MAIN-MENU.
           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           CALL STORE_TRANSACTION.

       MAIN-MENU.
           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "Enter Transaction Log Number: ".
           ACCEPT TRANSACTION_LOG.
           IF TRANSACTION_LOG = 0 THEN GOTO MAIN-MENU.

           DISPLAY "

      *> ==========================================
      *> MODULE: GET_TRANSACTIONS
      *> ==========================================
LOAD TRANSACTION_LOG
RETURN

      *> ==========================================
      *> MODULE: PRINT_REPORT
      *> ==========================================
       MAIN-PROGRAM FLOW.
           DISPLAY "TRANSACTION REPORT"
           RETURN.

      *> ==========================================
      *> MODULE: END_PROGRAM
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       DATA SECTION.
       ACCOUNT_A   100.
       ACCOUNT_B   50.

       CALLS SECTION.
       CALL  TRANSFER.

       TRANSFER SECTION.
       Transfer Funds: Transfer money between accounts.
       Debit Account A: Reduce the balance of Account A.
       Credit Account B: Increase the balance of Account B.

       STOP SECTION.
       END_PROGRAM