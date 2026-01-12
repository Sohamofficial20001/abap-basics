REPORT z_08_alv_price_filter.

*-------------------------------------------------------------*
* ALV - Show flights with price greater than 300
* Demonstrates:
* - WHERE condition
* - Basic ALV
*-------------------------------------------------------------*

DATA: lt_sflight TYPE STANDARD TABLE OF sflight,
      lo_alv     TYPE REF TO cl_salv_table.

SELECT *
  FROM sflight
  INTO TABLE lt_sflight
  WHERE price > 300.

IF sy-subrc <> 0 OR lt_sflight IS INITIAL.
  MESSAGE 'No flights found with price > 300' TYPE 'I'.
  LEAVE PROGRAM.
ENDIF.

TRY.
    cl_salv_table=>factory(
      IMPORTING
        r_salv_table = lo_alv
      CHANGING
        t_table      = lt_sflight
    ).
  CATCH cx_salv_msg INTO DATA(lx_msg).
    MESSAGE lx_msg->get_text( ) TYPE 'E'.
ENDTRY.

lo_alv->get_functions( )->set_all( abap_true ).
lo_alv->get_columns( )->set_optimize( abap_true ).

lo_alv->get_display_settings( )->set_list_header(
  'Flights with price greater than 300'
).

lo_alv->display( ).
