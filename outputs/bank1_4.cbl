IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  ACCOUNT-A    VALUE   100.
       01  ACCOUNT-B    VALUE   50.
       01  TRANSFER-AMOUNT EQU 75.

       PROCEDURE DIVISION.
       MAIN-PROGRAM.
           DISPLAY "Enter Account A Balance: ".
           READ ACCOUNT-A.
           DISPLAY "Enter Account B Balance: ".
           READ ACCOUNT-B.
           IF ACCOUNT-A > 0 THEN
               IF ACCOUNT-B > 0 THEN
                   DISPLAY "Transfer Amount: " EQU TRANSFER-AMOUNT.
                   TRANSFER-AMOUNT EQU TRANSFER-AMOUNT - ACCOUNT-A.
                   ACCOUNT-A EQU ACCOUNT-A + TRANSFER-AMOUNT.
               ENDIF
           ELSE
               DISPLAY "Account A is zero."
           ENDIF
           STOP RUN.
       END PROGRAM BANK.

      *> ==========================================
      *> MODULE: START
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE VARIABLES
       -----------------------
       ['SUCCESS']

       CURRENT MODULE DEPENDENCIES
       ---------------------------
       ['INITIALIZE_SYSTEM', 'LOGIN_USER']

       CURRENT MODULE ASSEMBLY CODE
       ----------------------------
       CALL INITIALIZE_SYSTEM
       CALL LOGIN_USER
       CMP R1, SUCCESS
       BNE LOGIN_FAILED

       PROGRAM-WIDE LABELS
       -------------------
       []

       PROGRAM-WIDE MODULES
       --------------------
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

      *> ==========================================
      *> MODULE: MAIN_MENU
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE
         MAIN_MENU

       CURRENT MODULE VARIABLES
         ['USER_OPTION']

       CURRENT MODULE DEPENDENCIES
         []

       CURRENT MODULE ASSEMBLY CODE
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
         []

       PROGRAM-WIDE MODULES
         ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

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


RETRIEVED KNOWLEDGE
===================

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

PREVIOUS AGENT ANALYSIS
=======================

The following information was produced by other agents.

These outputs are analysis only.

They are NOT the source of truth.

If they conflict with the original Assembly,
IGNORE them.


--- BUSINESS AGENT OUTPUT ---

Business Purpose:
The program displays options to check account balance, transfer money, and view transactions. The user selects an option to perform a transaction.

Inputs:
- R2: User's choice (1, 2, or 3)

Outputs:
- Displayed message based on the selected option.

Business Rules:
- If R2 = 1, display "Check Balance".
- If R2 = 2, display "Transfer Money".
- If R2 = 3, display "View Transactions".
- The program stops after displaying the chosen message.

External Calls:
- None

Summary:
The program provides a menu with options to check account balance, transfer money, and view transactions.

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
      *> MODULE: LOGIN_USER
      *> ==========================================
LOAD R3, CUSTOMER_ID
LOAD R4, PASSWORD
CALL VALIDATE_USER
CMP R1, SUCCESS
RETURN

      *> ==========================================
      *> MODULE: VALIDATE_USER
      *> ==========================================
       MAIN-MENU   ACCESS (LOGIN_USER).
           DISPLAY "ENTER USERNAME: ".
           ACCEPT USERNAME.
           COMPARE USERNAME, 'USER_ID'.
           IF USERNAME = USER_ID THEN
               DISPLAY "WELCOME, USER!"
               RETURN.
           ELSE
               DISPLAY "INVALID USERNAME."
               RETURN.
       LOGIN_USER   ACCESS (VALIDATE_USER).
           DISPLAY "ENTER PASSWORD: ".
           ACCEPT PASSWORD.
           COMPARE PASSWORD, 'PASSWORD'.
           IF PASSWORD = PASSWORD THEN
               DISPLAY "SUCCESS!"
               RETURN.
           ELSE
               DISPLAY "INVALID PASSWORD."
               RETURN.
       VALIDATE_USER   ACCESS (INVALID_USER).
           DISPLAY "ERROR: INVALID USERNAME."
           RETURN.

       DISPLAY_REPORT  ACCESS (INITIALIZE_SYSTEM).
           DISPLAY "USER DATABASE:"
           DISPLAY USER_DATABASE.
           DISPLAY "CUSTOMER_ID:"
           DISPLAY "USER_ID:"
           DISPLAY "PASSWORD:"
           DISPLAY "STORED_PASSWORD:"
           DISPLAY "SUCCESS:"
           RETURN.

       END-PROGRAM.

      *> ==========================================
      *> MODULE: INVALID_USER
      *> ==========================================
LOAD R1, FAILURE
RETURN

      *> ==========================================
      *> MODULE: LOGIN_FAILED
      *> ==========================================
       MAIN_MENU MkStart.
           DISPLAY "ENTER LOGIN: ".
           ACCEPT LOGIN-USER-NAME.
           ACCEPT LOGIN-PASSWORD.
           DISPLAY "INVALID LOGIN".
           RETURN.

      *> ==========================================
      *> MODULE: CHECK_ACCOUNT_BALANCE
      *> ==========================================
LOAD R5, ACCOUNT_NUMBER
CALL FETCH_BALANCE
DISPLAY BALANCE
BR MAIN_MENU

IDENTIFICATION DIVISION.
PROGRAM-ID. BANK.

START PROGRAM.
       DATA.
       ACCOUNT_NUMBER = '12345'
       BALANCE = 1000.00

       DEPENDENCIES.
       FETCH_BALANCE = TRUE

       CALL FETCH_BALANCE.
       DISPLAY BALANCE.
       BR MAIN_MENU.

       PROGRAM-WIDE LABELS.
       []

       MODULES.
       CHECK_ACCOUNT_BALANCE = TRUE

       END PROGRAM.

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
- ACCOUNT_FILE (empty)
- ACCOUNT_BALANCE (empty)

Outputs:
- ACCOUNT_BALANCE

Business Rules:
- READ ACCOUNT_FILE
- LOAD R6, ACCOUNT_BALANCE
- RETURN

External Calls:
- None

Summary:
- Read account balance from file.
- Return the balance to the program.

If behavior is unknown:

Not explicitly defined in the Assembly.

      *> ==========================================
      *> MODULE: PROCESS_TRANSFER
      *> ==========================================
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

PROGRAM-WIDE LABELS
-------------------
[]

PROGRAM-WIDE MODULES
--------------------
['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_FUNDS', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

IDENTIFICATION DIVISION.
PROGRAM-ID. BANK.

START PROGRAM BANK.

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

       PROGRAM-LOOP.
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       MAIN_MENU:
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       LOGIN_USER:
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       VALIDATE_USER:
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       INVALID_USER:
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       LOGIN_FAILED:
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       CHECK_ACCOUNT_BALANCE:
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       FETCH_BALANCE:
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       PROCESS_TRANSFER:
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       CHECK_FUNDS:
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       INSUFFICIENT_FUNDS:
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       DEBIT_ACCOUNT:
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       CREDIT_ACCOUNT:
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       SAVE_TRANSACTION:
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       TRANSACTION_REPORT:
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       INITIALIZE_SYSTEM:
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       DATA:
           DISPLAY "INSUFFICIENT BALANCE"
           LOAD R1, FAILURE
           BR MAIN_MENU

       END_PROGRAM.

      *> ==========================================
      *> MODULE: DEBIT_ACCOUNT
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE VARIABLES
       -----------------------
       ['CURRENT_BALANCE', 'TRANSFER_AMOUNT']

       CURRENT MODULE DEPENDENCIES
       ---------------------------
       []

       CURRENT MODULE ASSEMBLY CODE
       ----------------------------
       SUB CURRENT_BALANCE, TRANSFER_AMOUNT
       STORE CURRENT_BALANCE
       RETURN

       PROGRAM-WIDE LABELS
       -------------------
       []

       PROGRAM-WIDE MODULES
       --------------------
       ['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_Fonds', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

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
       -----------------------
       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       SUB CURRENT_BALANCE, TRANSFER_AMOUNT
       STORE CURRENT_BALANCE
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
Retrieve the current balance and transfer amount from the debit account.

Inputs:
*   CURRENT_BALANCE (integer)
*   TRANSFER_AMOUNT (integer)

Outputs:
*   CURRENT_BALANCE (integer)
*   TRANSFER_AMOUNT (integer)

Business Rules:
*   The current balance is retrieved from the debit account.
*   The transfer amount is retrieved from the debit account.
*   The balance and transfer amount are stored in the CURRENT_BALANCE variable.
*   The balance and transfer amount are returned to the caller.

External Calls:
None

Summary:
Retrieve the current balance and transfer amount from the debit account.

If behavior is unknown:

Not explicitly defined in the Assembly.

--- END BUSINESS OUTPUT ---

       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE VARIABLES
       -----------------------
       ['CURRENT_BALANCE', 'TRANSFER_AMOUNT']

       CURRENT MODULE DEPENDENCIES
       ---------------------------
       []

       CURRENT MODULE ASSEMBLY CODE
       ----------------------------
       SUB CURRENT_BALANCE, TRANSFER_AMOUNT
       STORE CURRENT_BALANCE
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
       -----------------------
       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       SUB CURRENT_BALANCE, TRANSFER_AMOUNT
       STORE CURRENT_BALANCE
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
Retrieve the current balance and transfer amount from the debit account.

Inputs:
*   CURRENT_BALANCE (integer)
*   TRANSFER_AMOUNT (integer)

Outputs:
*   CURRENT_BALANCE (integer)
*   TRANSFER_AMOUNT (integer)

Business Rules:
*   The current balance is retrieved from the debit account.
*   The transfer amount is retrieved from the debit account.
*   The balance and transfer amount are stored in the CURRENT_BALANCE variable.
*   The balance and transfer amount are returned to the caller.

External Calls:
None

Summary:
Retrieve the current balance and transfer amount from the debit account.

If behavior is unknown:

Not explicitly defined in the Assembly.

--- END BUSINESS OUTPUT ---

      *> ==========================================
      *> MODULE: CREDIT_ACCOUNT
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE VARIABLES
           ['RECEIVER_BALANCE', 'TRANSFER_AMOUNT']

       CURRENT MODULE DEPENDENCIES
           []

       CURRENT MODULE ASSEMBLY CODE
           ADD RECEIVER_BALANCE, TRANSFER_AMOUNT
           STORE RECEIVER_BALANCE
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

       RETRIEVED KNOWLEDGE
           The following information came from the knowledge store.

           It is supplementary information only.

           Use it only when directly consistent with the
           original Assembly.

           If it conflicts with the Assembly, IGNORE it.

           ADD RECEIVER_BALANCE, TRANSFER_AMOUNT
           STORE RECEIVER_BALANCE
           RETURN


PREVIOUS AGENT ANALYSIS
           The following information was produced by other agents.

           These outputs are analysis only.

           They are NOT the source of truth.

           If they conflict with the original Assembly,
           IGNORE them.


--- BUSINESS AGENT OUTPUT ---

Business Purpose:
Retrieve and store receiver balance based on transfer amount.

Inputs:
*RECEIVER_BALANCE (not provided)
* TRANSFER_AMOUNT (not provided)

Outputs:
*RECEIVER_BALANCE  (the updated receiver balance)

Business Rules:
* The receiver balance is updated when a transfer occurs.
* The receiver balance is stored after the transfer.

External Calls:
None

Summary:
The code retrieves and stores the receiver balance based on a transfer amount.

If behavior is unknown:

Not explicitly defined in the Assembly.

--- END BUSINESS OUTPUT ---

       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE VARIABLES
           ['RECEIVER_BALANCE', 'TRANSFER_AMOUNT']

       CURRENT MODULE DEPENDENCIES
           []

       CURRENT MODULE ASSEMBLY CODE
           ADD RECEIVER_BALANCE, TRANSFER_AMOUNT
           STORE RECEIVER_BALANCE
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

       RETRIEVED KNOWLEDGE
           The following information came from the knowledge store.

           It is supplementary information only.

           Use it only when directly consistent with the
           original Assembly.

           If it conflicts with the Assembly, IGNORE it.

           ADD RECEIVER_BALANCE, TRANSFER_AMOUNT
           STORE RECEIVER_BALANCE
           RETURN


PREVIOUS AGENT ANALYSIS
           The following information was produced by other agents.

           These outputs are analysis only.

           They are NOT the source of truth.

           If they conflict with the original Assembly,
           IGNORE them.


--- BUSINESS AGENT OUTPUT ---

Business Purpose:
Retrieve and store receiver balance based on transfer amount.

Inputs:
*RECEIVER_BALANCE (not provided)
* TRANSFER_AMOUNT (not provided)

Outputs:
*RECEIVER_BALANCE  (the updated receiver balance)

Business Rules:
* The receiver balance is updated when a transfer occurs.
* The receiver balance is stored after the transfer.

External Calls:
None

Summary:
The code retrieves and stores the receiver balance based on a transfer amount.

If behavior is unknown:

Not explicitly defined in the Assembly.

--- END BUSINESS OUTPUT ---

      *> ==========================================
      *> MODULE: SAVE_TRANSACTION
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE
       --------------
       SAVE_TRANSACTION

       CURRENT MODULE VARIABLES
       -----------------------
       ['TRANSACTION_LOG']

       CURRENT MODULE DEPENDENCIES
       ---------------------------
       []

       CURRENT MODULE ASSEMBLY CODE
       ----------------------------
       WRITE TRANSACTION_LOG
       RETURN

       PROGRAM-WIDE LABELS
       -------------------
       []

       PROGRAM-WIDE MODULES
       --------------------
       []

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


RETRIEVED KNOWLEDGE
===================

The following information came from the knowledge store.

It is supplementary information only.

Use it only when directly consistent with the
original Assembly.

If it conflicts with the Assembly, IGNORE it.

WRITE TRANSACTION_LOG
RETURN

FINAL SOURCE PRIORITY
=====================
1. ORIGINAL ASSEMBLY CODE
2. PROGRAM-WIDE LABELS AND MODULES
3. MODULE VARIABLES
4. MODULE DEPENDENCIES
5. DIRECTLY SUPPORTED AGENT ANALYSIS
6. RETRIEVED KNOWLEDGE

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
      *> MODULE: TRANSACTION_REPORT
      *> ==========================================
       MAIN-MENU           Modular Title: MAIN_MENU
           DISPLAY TRANGORITHM   Display Transaction Report
           DISPLAY REPORT        Display Report
           DISPLAY LOGIN-USER    Display Login User
           DISPLAY VALIDATE-USER Display User Validation
           DISPLAY INVALID-USER  Display Invalid User
           DISPLAY LOGIN-FAILED     Display Failed Login
           DISPLAY CHECK-ACCOUNT-BALANCE Display Account Balance
           DISPLAY FETCH-BALANCE   Display Balance Fetch
           DISPLAY PROCESS-TRANSFER   Display Transfer Process
           DISPLAY CHECK-FUNDS        Display Funds Check
           DISPLAY INSUFFICIENT-FUNDS  Display Insufficient Funds
           DISPLAY DEBIT-ACCOUNT      Display Debit Account
           DISPLAY CREDIT-ACCOUNT     Display Credit Account
           DISPLAY SAVE-TRANSACTION    Display Transaction Save
           DISPLAY LOAD_TRANSACTIONS   Display Load Transactions
           DISPLAY DISPLAY_REPORT       Display Report
           DISPLAY INITIALIZE-SYSTEM  Display System Initialization
           DISPLAY DATA                 Display Data
           DISPLAY END_PROGRAM.

       EXECUTE PHASE.
       STOP RUN.

      *> ==========================================
      *> MODULE: LOAD_TRANSACTIONS
      *> ==========================================
       MAIN-PROGRAM MkStart.
           DISPLAY "Enter Transaction Log Number:"
           READ TRANSACTION_LOG
           IF (TRANSACTION_LOG = 1) THEN
               DISPLAY "Transaction Log Number: 1"
           ELSE
               DISPLAY "Transaction Log Number: Not Available"
           END-IF.
           RETURN.

       MAIN-PROGRAM MkEnd.
           DISPLAY "Enter Program Name:"
           READ PROGRAM-WIDE LABELS
           IF (PROGRAM-WIDE LABELS = 'GLOBAL') THEN
               DISPLAY "Global Program Label: GLOBAL"
           ELSE
               DISPLAY "Program-Wide Label: Not Available"
           END-IF.

       MAIN-PROGRAM MkStart.
           DISPLAY "Enter Transaction Log Number:"
           READ TRANSACTION_LOG
           IF (TRANSACTION_LOG = 1) THEN
               DISPLAY "Transaction Log Number: 1"
           ELSE
               DISPLAY "Transaction Log Number: Not Available"
           END-IF.
           RETURN.

       PROGRAM-WIDE LABELS.
           01  GLOBAL   = 'TRUE'.
           01  START    = 'TRUE'.
           01  MAIN_MENU = 'TRUE'.
           01  LOGIN_USER = 'TRUE'.
           01  VALIDATE_USER = 'TRUE'.
           01  INVALID_USER = 'TRUE'.
           01  LOGIN_FAILED = 'FALSE'.
           01  CHECK_ACCOUNT_BALANCE = 'FALSE'.
           01  FETCH_BALANCE = 'FALSE'.
           01  PROCESS_TRANSFER = 'FALSE'.
           01  CHECK_FUNDS = 'FALSE'.
           01  INSUFFICIENT_FUNDS = 'FALSE'.
           01  DEBIT_ACCOUNT = 'FALSE'.
           01  CREDIT_ACCOUNT = 'FALSE'.
           01  SAVE_TRANSACTION = 'FALSE'.
           01  TRANSACTION_REPORT = 'FALSE'.
           01  INITIALIZE_SYSTEM = 'FALSE'.
           01  DATA = 'TRUE'.
           01  END_PROGRAM = 'TRUE'.

       MODULES.
           01  LOAD_TRANSACTIONS = 'TRUE'.
           01  DISPLAY_REPORT = 'TRUE'.
           01  INITIALIZE_SYSTEM = 'TRUE'.
           01  DATA = 'TRUE'.
           01  END_PROGRAM = 'TRUE'.

       EXECUTE PHASE.
           DISPLAY "Program-Wide Labels:"
           DISPLAY "GLOBAL = TRUE"
           DISPLAY "START = TRUE"
           DISPLAY "MAIN_MENU = TRUE"
           DISPLAY "LOGIN_USER = TRUE"
           DISPLAY "VALIDATE_USER = TRUE"
           DISPLAY "INVALID_USER = TRUE"
           DISPLAY "LOGIN_FAILED = FALSE"
           DISPLAY "CHECK_ACCOUNT_BALANCE = FALSE"
           DISPLAY "FETCH_BALANCE = FALSE"
           DISPLAY "PROCESS_TRANSFER = FALSE"
           DISPLAY "CHECK_FUNDS = FALSE"
           DISPLAY "INSUFFICIENT_FUNDS = FALSE"
           DISPLAY "DEBIT_ACCOUNT = FALSE"
           DISPLAY "CREDIT_ACCOUNT = FALSE"
           DISPLAY "SAVE_TRANSACTION = FALSE"
           DISPLAY "TRANSACTION_REPORT = FALSE"
           DISPLAY "INITIALIZE_SYSTEM = FALSE"
           DISPLAY "DATA = TRUE"
           DISPLAY "END_PROGRAM = TRUE".

       END PROGRAM.

      *> ==========================================
      *> MODULE: DISPLAY_REPORT
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE
       DISPLAY_REPORT

       CURRENT MODULE VARIABLES
       []

       CURRENT MODULE DEPENDENCIES
       []

       CURRENT MODULE ASSEMBLY CODE
       DISPLAY "TRANSACTION HISTORY"
       RETURN

       PROGRAM-WIDE LABELS
       -------------------
       []

       PROGRAM-WIDE MODULES
       --------------------
       []

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

       RETRIEVED KNOWLEDGE
       ===================
       The following information came from the knowledge store.

       It is supplementary information only.

       Use it only when directly consistent with the
       original Assembly.

       If it conflicts with the Assembly, IGNORE it.

       DISPLAY "TRANSACTION HISTORY"
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
      *> MODULE: INITIALIZE_SYSTEM
      *> ==========================================
       MAIN-PROGRAM.
       DISPLAY SYSTEM_READY.
       STOP.

      *> ==========================================
      *> MODULE: DATA
      *> ==========================================
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE VARIABLES
       -----------------------
       ['CUSTOMER_ID', 'PASSWORD', 'USER_ID', 'STORED_PASSWORD', 'ACCOUNT_NUMBER', 'CURRENT_BALANCE', 'RECEIVER_BALANCE', 'TRANSFER_AMOUNT', 'FILE', 'SUCCESS', 'FAILURE']

       CURRENT MODULE DEPENDENCIES
       ---------------------------
       []

       CURRENT MODULE ASSEMBLY CODE
       ----------------------------
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
       -------------------
       []

       PROGRAM-WIDE MODULES
       --------------------
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

       UNKNOWN INSTRUCTIONS
       ----------------------------
       None

============================================================
SUPPORTED ASSEMBLY DIALECT
============================================================

This migration project uses the following Assembly instructions:

LOAD
STORE
CALL
BNE
BR
DISPLAY
MULT
COMPARE
RETURN
ADD
SUB
STOP

These instructions are valid instructions in this project.

Do NOT reject them merely because they are not standard
IBM HLASM instructions.

============================================================
STRICT TRANSLATION RULES
============================================================

1. Preserve all Assembly labels.

2. Preserve all Assembly variables.

3. Preserve all CALL operations.

4. Preserve all RETURN operations.

5. Preserve all BR operations.

6. Preserve all BNE operations.

7. Preserve all DISPLAY operations.

8. Preserve all arithmetic operations.

9. Preserve program termination.

10. Preserve execution order.

11. Do NOT invent variables.

12. Do NOT invent database operations.

13. Do NOT invent user interfaces.

14. Do NOT invent authentication rules.

15. Do NOT invent account validation rules.

16. Do NOT invent transaction IDs.

17. Do NOT invent statuses.

18. Do NOT invent business rules.

19. Do NOT invent functionality based on the module name.

20. Do NOT silently remove an Assembly instruction.

============================================================
UNKNOWN INSTRUCTIONS
================================================

If an Assembly instruction cannot be translated confidently,
preserve it as a COBOL comment.

Example:

*> UNTRANSLATED ASSEMBLY:
*> ORIGINAL INSTRUCTION: SOME_UNKNOWN_INSTRUCTION

Do NOT invent replacement behavior.

============================================================
IMPORTANT
================================================

The Assembly code may be a simplified/custom Assembly dialect.

Translate its demonstrated behavior faithfully.

Do not attempt to convert it into real IBM HLASM syntax.

============================================================
OUTPUT
================================================

RETURN ONLY COBOL SOURCE CODE.

Do NOT return JSON.
Do NOT return Markdown.
Do NOT return analysis.
Do NOT return validation results.
Do NOT return:

{
    "valid": true
}

Return actual COBOL source code beginning with something such as:

       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

and continuing with valid COBOL source.

============================================================
FINAL CHECK
================================================

Before returning the answer, verify:

- Did I return COBOL?
- Did I preserve the Assembly labels?
- Did I preserve the variables?
- Did I preserve CALL operations?
- Did I preserve branches?
- Did I preserve DISPLAY statements?
- Did I preserve arithmetic?
- Did I preserve RETURN?
- Did I preserve STOP?
- Did I invent anything?

If the answer is not COBOL, do not return it.


SOURCE OF TRUTH
===============

The original Assembly program is the ONLY authoritative
source for actual program behavior.

CURRENT MODULE
--------------
DATA

CURRENT MODULE VARIABLES
-----------------------
['CUSTOMER_ID', 'PASSWORD', 'USER_ID', 'STORED_PASSWORD', 'ACCOUNT_NUMBER', 'CURRENT_BALANCE', 'RECEIVER_BALANCE', 'TRANSFER_AMOUNT', 'FILE', 'SUCCESS', 'FAILURE']

CURRENT MODULE DEPENDENCIES
---------------------------
[]

CURRENT MODULE ASSEMBLY CODE
----------------------------
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
-------------------
[]

PROGRAM-WIDE MODULES
--------------------
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

UNKNOWN INSTRUCTIONS
----------------------------
None

PREVIOUS AGENT ANALYSIS
=======================

The following information came from the knowledge store.

It is supplementary information only.

Use it only when directly consistent with the
original Assembly.

If it conflicts with the Assembly,
IGNORE it.

--- BUSINESS AGENT OUTPUT ---

Business Purpose:
The program manages a customer account with balances and transfers. It logs transactions.

Inputs:
* CUSTOMER_ID: A unique identifier for the customer.
* PASSWORD: The customer's password.
* USER_ID: The user ID of the current session.
* STORED_PASSWORD: The stored password.
* ACCOUNT_NUMBER: The account number to manage.
* CURRENT_BALANCE: The current balance in the account.
* RECEIVER_BALANCE: The balance held by the recipient.
* TRANSFER_AMOUNT: The amount transferred.
* FILE: A file for transaction logging.
* SUCCESS: 1 if the transaction was successful, 0 otherwise.
* FAILURE: 1 if the transaction failed.

Outputs:
* TRANSACTION_LOG: A log of transactions.
* SUCCESS: 1 if successful, 0 if unsuccessful.
* FAILURE: 1 if unsuccessful.

Business Rules:
* The program must validate the USER_ID and ACCOUNT_NUMBER.
* The program must ensure that the PASSWORD is correct.
* The program must log all transactions to the FILE.
* The program must handle SUCCESS and FAILURE conditions appropriately.

External Calls:
None

Summary:
The program manages a customer account, logs transactions, and handles success/failure events.

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
IDENTIFICATION DIVISION.
       PROGRAM-ID. BANK.

       CURRENT MODULE
       --------------
       END_PROGRAM

       CURRENT MODULE VARIABLES
       -----------------------
       []

       CURRENT MODULE DEPENDENCIES
       ---------------------------
       []

       CURRENT MODULE ASSEMBLY CODE
       ----------------------------
DISPLAY "SYSTEM CLOSED"
STOP

PROGRAM-WIDE LABELS
-------------------
['GLOBAL', 'START', 'MAIN_MENU', 'LOGIN_USER', 'VALIDATE_USER', 'INVALID_USER', 'LOGIN_FAILED', 'CHECK_ACCOUNT_BALANCE', 'FETCH_BALANCE', 'PROCESS_TRANSFER', 'CHECK_FUNDS', 'INSUFFICIENT_Fonds', 'DEBIT_ACCOUNT', 'CREDIT_ACCOUNT', 'SAVE_TRANSACTION', 'TRANSACTION_REPORT', 'LOAD_TRANSACTIONS', 'DISPLAY_REPORT', 'INITIALIZE_SYSTEM', 'DATA', 'END_PROGRAM']

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
13. Do not report a branch target as undefined if that label exists in PROGRAM-WIDE LABELS.
14. Do not report a CALL as missing if the CALL target exists in PROGRAM-WIDE MODULES or PROGRAM-WIDE LABELS.
15. If something cannot be determined from the Assembly, explicitly report it as UNKNOWN or AMBIGUOUS.
16. If an Assembly instruction is not understood, do not silently replace it with invented behavior.
17. The original Assembly code has higher priority than retrieved knowledge and previous agent analysis.

RETRIVED KNOWLEDGE
========================

The following information came from the knowledge store.

It is supplementary information only.

Use it only when directly consistent with the original Assembly.

If it conflicts with the Assembly, IGNORE it.

DISPLAY "SYSTEM CLOSED"
STOP

PREVIOUS AGENT ANALYSIS
=======================

The following information was produced by other agents.

These outputs are analysis only.

They are NOT the source of truth.

If they conflict with the original Assembly, IGNORE them.


--- BUSINESS AGENT OUTPUT ---

Business Purpose: The program stops after displaying "SYSTEM CLOSED".

Inputs: None

Outputs: None

Business Rules: The program halts upon execution of the `STOP` instruction.

External Calls: None

Summary: The program terminates after a simple statement.

If behavior is unknown: Not explicitly defined in the Assembly.


SOURCE OF TRUTH:
===============

The original Assembly program is the ONLY authoritative source for actual program behavior.

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