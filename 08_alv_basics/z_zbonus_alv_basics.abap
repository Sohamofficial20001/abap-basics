REPORT z_zbonus_alv_basics.

*---------------------------------------------------------------------*
* ALV BASICS (Try-It-Yourself tasks)
*
* Covers:
* 1) Price > 300
* 2) Dynamic ALV title with carrier
* 3) Toolbar enable/disable example
* 4) WHERE condition on CONNID
*---------------------------------------------------------------------*

PARAMETERS:
  p_carrid TYPE sflight-carrid OBLIGATORY,
  p_connid TYPE sflight-connid.

DATA:
  lt_sflight TYPE STANDARD TABLE OF sflight,
  lo_alv     TYPE REF TO cl_salv_table.

"---------------------------------------------------------------
" 1) Select data with conditions (price > 300 + connid optional)
"---------------------------------------------------------------
SELECT *
  FROM sflight
  INTO TABLE lt_sflight
  WHERE carrid = @p_carrid
    AND price  > 300
    AND ( connid = @p_connid OR @p_connid IS INITIAL ).

IF sy-subrc <> 0 OR lt_sflight IS INITIAL.
  MESSAGE |No flights found for { p_carrid } meeting criteria| TYPE 'I'.
  LEAVE PROGRAM.
ENDIF.

"---------------------------------------------------------------
" 2) Create ALV object
"---------------------------------------------------------------
TRY.
    cl_salv_table=>factory(
      IMPORTING
        r_salv_table = lo_alv
      CHANGING
        t_table      = lt_sflight ).

  CATCH cx_salv_msg INTO DATA(lx_msg).
    MESSAGE lx_msg->get_text( ) TYPE 'E'.
ENDTRY.

"---------------------------------------------------------------
" 3) ALV settings
"---------------------------------------------------------------

" 🔹 toolbar ON (task #3 — comment this line to test difference)
lo_alv->get_functions( )->set_all( abap_true ).

" 🔹 auto column optimization
lo_alv->get_columns( )->set_optimize( abap_true ).

" 🔹 dynamic title (task #2)
DATA(lv_title) =
  |Flights for Carrier { p_carrid } with price > 300|.

IF p_connid IS NOT INITIAL.
  lv_title = |Flights for { p_carrid } / Connid { p_connid } (Price > 300)|.
ENDIF.

lo_alv->get_display_settings( )->set_list_header( lv_title ).

"---------------------------------------------------------------
" 4) Display ALV
"---------------------------------------------------------------
lo_alv->display( ).
