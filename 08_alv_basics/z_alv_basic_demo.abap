REPORT z_08_alv_basic_demo.

*--------------------------------------------------------------------
* 08 – ALV BASICS using CL_SALV_TABLE
*
* Features:
* 1) Read SFLIGHT by CARRID
* 2) Validate input
* 3) Handle no data
* 4) Display ALV Grid
* 5) Optimize columns / functions
*--------------------------------------------------------------------

PARAMETERS: p_carrid TYPE sflight-carrid DEFAULT 'LH'.

DATA: lt_sflight TYPE STANDARD TABLE OF sflight,
      lo_alv     TYPE REF TO cl_salv_table.

"----------------------------------------------------------
" 1) Input validation
"----------------------------------------------------------
IF p_carrid IS INITIAL.
  MESSAGE 'Carrier ID cannot be empty' TYPE 'E'.
ENDIF.

"----------------------------------------------------------
" 2) Fetch data
"----------------------------------------------------------
SELECT *
  FROM sflight
  INTO TABLE lt_sflight
  WHERE carrid = @p_carrid.

IF sy-subrc <> 0 OR lt_sflight IS INITIAL.
  MESSAGE |No SFLIGHT data found for carrier { p_carrid }| TYPE 'I'.
  LEAVE PROGRAM.
ENDIF.

"----------------------------------------------------------
" 3) Create ALV object
"----------------------------------------------------------
TRY.

    cl_salv_table=>factory(
      IMPORTING
        r_salv_table = lo_alv
      CHANGING
        t_table      = lt_sflight ).

  CATCH cx_salv_msg INTO DATA(lx_msg).
    MESSAGE lx_msg->get_text( ) TYPE 'E'.
ENDTRY.

"----------------------------------------------------------
" 4) Basic ALV settings
"----------------------------------------------------------
" Enable ALV functions (sort, filter, export etc.)
lo_alv->get_functions( )->set_all( abap_true ).

" Auto column optimization
lo_alv->get_columns( )->set_optimize( abap_true ).

" Set a title
lo_alv->get_display_settings( )->set_list_header(
  |Flights for Carrier { p_carrid }|
).

"----------------------------------------------------------
" 5) Display ALV
"----------------------------------------------------------
lo_alv->display( ).
