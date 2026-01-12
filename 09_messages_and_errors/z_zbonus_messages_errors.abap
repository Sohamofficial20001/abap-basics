REPORT z_zbonus_messages_errors.

*--------------------------------------------------------------------*
* Messages & Error Handling
*
* Demonstrates:
* - SE91 message class usage
* - Field-specific error messages
* - sy-msg* system variables
* - sy-subrc validation
* - program termination vs warning
*--------------------------------------------------------------------*

"------------------------------------------------------------
" Selection screen
"------------------------------------------------------------
TABLES: sflight.

PARAMETERS:
  p_carrid TYPE sflight-carrid OBLIGATORY,
  p_price  TYPE sflight-price  DEFAULT '100'.

DATA:
  lt_sflight TYPE STANDARD TABLE OF sflight,
  ls_sflight TYPE sflight.

"------------------------------------------------------------
" Example message class
" Create in SE91: ZMSG_ABAP
" Add messages:
" 001 Carrier cannot be blank
" 002 No data found for given selection
" 003 Price must be greater than 0
" 004 Record count: & entries found
"------------------------------------------------------------

"------------------------------------------------------------
" AT SELECTION-SCREEN VALIDATION
"------------------------------------------------------------
AT SELECTION-SCREEN.

  IF p_carrid IS INITIAL.
    MESSAGE e001(zmsg_abap).   " Carrier cannot be blank
  ENDIF.

  IF p_price <= 0.
    MESSAGE w003(zmsg_abap).   " Price must be greater than 0
  ENDIF.

"------------------------------------------------------------
" MAIN LOGIC
"------------------------------------------------------------
START-OF-SELECTION.

  SELECT *
    FROM sflight
    INTO TABLE lt_sflight
    WHERE carrid = @p_carrid
      AND price  >= @p_price.

  IF sy-subrc <> 0 OR lt_sflight IS INITIAL.
    MESSAGE e002(zmsg_abap).   " No data found
  ENDIF.

  " Show success message with variable replacement
  DATA(lv_lines) = lines( lt_sflight ).
  MESSAGE s004(zmsg_abap) WITH lv_lines.

"------------------------------------------------------------
" Capture message details (for logs / debugging)
"------------------------------------------------------------
  WRITE: / 'Message ID:', sy-msgid,
         / 'Message No:', sy-msgno,
         / 'Type:',       sy-msgty,
         / 'Var1:',       sy-msgv1,
         / 'Var2:',       sy-msgv2,
         / 'Var3:',       sy-msgv3,
         / 'Var4:',       sy-msgv4.

"------------------------------------------------------------
" Uncomment to see program abort behavior (type A)
"------------------------------------------------------------
* MESSAGE a002(zmsg_abap).   " Use carefully in real systems
