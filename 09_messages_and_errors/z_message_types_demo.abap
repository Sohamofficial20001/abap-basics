REPORT z_message_types_demo.

*----------------------------------------------------------------*
* Demo of different MESSAGE types
*----------------------------------------------------------------*

PARAMETERS: p_num TYPE i.

"-------------------------------
" Input validation
"-------------------------------
IF p_num IS INITIAL.
  MESSAGE 'Please enter a number' TYPE 'E'.
ENDIF.

IF p_num < 0.
  MESSAGE 'Negative values are not allowed' TYPE 'W'.
ENDIF.

"-------------------------------
" Success message
"-------------------------------
IF p_num > 0 AND p_num <= 10.
  MESSAGE 'You entered a valid number between 1 and 10' TYPE 'S'.
ENDIF.

"-------------------------------
" Information popup
"-------------------------------
IF p_num > 10.
  MESSAGE 'Number is greater than 10' TYPE 'I'.
ENDIF.

"-------------------------------
" Uncomment to test abort
"-------------------------------
* MESSAGE 'Program aborted' TYPE 'A'.  " use only for demo
