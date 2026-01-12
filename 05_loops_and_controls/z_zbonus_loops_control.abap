REPORT z_zbonus_loops_control.

*----------------------------------------------------------------------
* Program – Loops & Control Statements
* This program contains "Try it Yourself" tasks
* Covered:
* - DO loop (odd numbers)
* - WHILE logic using DO...EXIT
* - LOOP AT internal table with filtering
* - CASE statement for days
* - EXIT and CONTINUE examples
*----------------------------------------------------------------------

"----------------------------"
" 1) DO loop – odd numbers   "
"----------------------------"

WRITE: / '--- DO LOOP : PRINT ODD NUMBERS ---'.

DATA: lv_counter TYPE i VALUE 1.

DO 10 TIMES.

  IF lv_counter MOD 2 = 0.
    lv_counter = lv_counter + 1.
    CONTINUE. " Skip even
  ENDIF.

  WRITE: / 'Odd number:', lv_counter.

  lv_counter = lv_counter + 1.

ENDDO.


"--------------------------------------------"
" 2) WHILE loop logic using DO and EXIT      "
"--------------------------------------------"

WRITE: / ' ', / '--- WHILE USING DO...EXIT ---'.

CLEAR lv_counter.
lv_counter = 1.

DO.

  IF lv_counter > 5.
    EXIT.   " stop loop
  ENDIF.

  WRITE: / 'Value:', lv_counter.

  lv_counter = lv_counter + 1.

ENDDO.


"------------------------------------------------"
" 3) LOOP AT internal table + filter condition    "
"------------------------------------------------"

WRITE: / ' ', / '--- LOOP AT FILTER VALUES > 100 ---'.

TYPES: BEGIN OF ty_amount,
         value TYPE i,
       END OF ty_amount.

DATA: lt_amounts TYPE STANDARD TABLE OF ty_amount,
      ls_amount  TYPE ty_amount.

ls_amount-value = 50.   APPEND ls_amount TO lt_amounts.
ls_amount-value = 120.  APPEND ls_amount TO lt_amounts.
ls_amount-value = 300.  APPEND ls_amount TO lt_amounts.

LOOP AT lt_amounts INTO ls_amount.

  IF ls_amount-value <= 100.
    CONTINUE. " Skip small values
  ENDIF.

  WRITE: / 'High value:', ls_amount-value.

ENDLOOP.


"-------------------------------"
" 4) CASE statement for days    "
"-------------------------------"

WRITE: / ' ', / '--- CASE: DAY CATEGORY ---'.

PARAMETERS: p_day TYPE c LENGTH 3 DEFAULT 'MON'.

CASE p_day.

  WHEN 'MON'.
    WRITE: / 'Start of the week'.

  WHEN 'TUE' OR 'WED' OR 'THU'.
    WRITE: / 'Mid week'.

  WHEN 'FRI'.
    WRITE: / 'Weekend is near'.

  WHEN 'SAT' OR 'SUN'.
    WRITE: / 'Weekend'.

  WHEN OTHERS.
    WRITE: / 'Invalid input'.

ENDCASE.


"-----------------------------------------"
" 5) EXIT and CONTINUE demonstration      "
"-----------------------------------------"

WRITE: / ' ', / '--- EXIT & CONTINUE USAGE ---'.

DATA: lv_num TYPE i.

DO 10 TIMES.

  lv_num = sy-index.

  IF lv_num = 3.
    CONTINUE. " Skip 3
  ENDIF.

  IF lv_num = 7.
    EXIT. " Stop completely
  ENDIF.

  WRITE: / 'Processed number:', lv_num.

ENDDO.

*----------------------------------------------------------------------
* END OF PROGRAM
*----------------------------------------------------------------------
