;====================================================
; BANK TRANSACTION PROCESSING SYSTEM
;====================================================

; Program Purpose:
; Handles customer authentication,
; balance inquiry,
; fund transfer,
; transaction logging
;====================================================


START:

    CALL INITIALIZE_SYSTEM

    CALL LOGIN_USER

    CMP R1, SUCCESS

    BNE LOGIN_FAILED


MAIN_MENU:

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



;====================================================
; USER LOGIN MODULE
;====================================================


LOGIN_USER:

    LOAD R3, CUSTOMER_ID

    LOAD R4, PASSWORD


    CALL VALIDATE_USER


    CMP R1, SUCCESS


    RETURN



VALIDATE_USER:


    READ USER_DATABASE


    COMPARE CUSTOMER_ID, USER_ID


    BNE INVALID_USER


    COMPARE PASSWORD, STORED_PASSWORD


    BNE INVALID_USER


    LOAD R1, SUCCESS


    RETURN



INVALID_USER:


    LOAD R1, FAILURE

    RETURN




LOGIN_FAILED:


    DISPLAY "INVALID LOGIN"

    BR END_PROGRAM




;====================================================
; BALANCE CHECK MODULE
;====================================================


CHECK_ACCOUNT_BALANCE:


    LOAD R5, ACCOUNT_NUMBER


    CALL FETCH_BALANCE


    DISPLAY BALANCE


    BR MAIN_MENU




FETCH_BALANCE:


    READ ACCOUNT_FILE


    LOAD R6, ACCOUNT_BALANCE


    RETURN




;====================================================
; MONEY TRANSFER MODULE
;====================================================


PROCESS_TRANSFER:


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





CHECK_FUNDS:


    LOAD R10, CURRENT_BALANCE


    CMP R10, TRANSFER_AMOUNT


    BLT INSUFFICIENT_FUNDS



    LOAD R1, SUCCESS


    RETURN





INSUFFICIENT_FUNDS:


    DISPLAY "INSUFFICIENT BALANCE"


    LOAD R1, FAILURE


    BR MAIN_MENU





;====================================================
; ACCOUNT UPDATE MODULES
;====================================================


DEBIT_ACCOUNT:


    SUB CURRENT_BALANCE, TRANSFER_AMOUNT


    STORE CURRENT_BALANCE


    RETURN





CREDIT_ACCOUNT:


    ADD RECEIVER_BALANCE, TRANSFER_AMOUNT


    STORE RECEIVER_BALANCE


    RETURN




;====================================================
; TRANSACTION STORAGE
;====================================================


SAVE_TRANSACTION:


    WRITE TRANSACTION_LOG


    RETURN





;====================================================
; REPORT GENERATION MODULE
;====================================================


TRANSACTION_REPORT:


    CALL LOAD_TRANSACTIONS


    CALL DISPLAY_REPORT


    BR MAIN_MENU





LOAD_TRANSACTIONS:


    READ TRANSACTION_LOG


    RETURN





DISPLAY_REPORT:


    DISPLAY "TRANSACTION HISTORY"


    RETURN





;====================================================
; SYSTEM INITIALIZATION
;====================================================


INITIALIZE_SYSTEM:


    LOAD R0, SYSTEM_READY


    RETURN




;====================================================
; DATA SECTION
;====================================================


DATA:


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



;====================================================

END_PROGRAM:


    DISPLAY "SYSTEM CLOSED"


    STOP

;====================================================