REPORT z_08_alv_carrid_connid_abap.

*-------------------------------------------------------------*
* ALV - Select by CARRID and CONNID
* Demonstrates:
* - Selection screen inputs
* - Validation
* - ALV Display
*-------------------------------------------------------------*

PARAMETERS:
  p_carrid TYPE sflight-carrid OBLIGATORY,
  p_connid TYPE sflight-connid.

DATA: lt_sflight TYPE STANDARD TABLE OF sflight,
      lo_alv     TYPE REF TO cl_salv_table.

SELECT *
  FROM sflight
  INTO TABLE lt_sflight
  WHERE carrid = @p_carrid
    AND ( connid = @p_connid OR @p_connid IS INITIAL ).

IF lt_sflight IS INITIAL.
  MESSAGE 'No flight data found for selection' TYPE 'I'.
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
  |Flights for Carrier { p_carrid }|
).

lo_alv->display( ).
