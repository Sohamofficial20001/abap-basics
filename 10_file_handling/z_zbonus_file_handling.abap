REPORT z_zbonus_file_handling.

*---------------------------------------------------------------------*
* File Handling (Complete Practical Example)
*
* Features:
* - Upload CSV file from presentation server
* - Skip header line
* - Split each line into fields
* - Validate mandatory fields
* - Handle empty lines
* - Display result in ALV
*---------------------------------------------------------------------*

PARAMETERS:
  p_file TYPE rlgrap-filename OBLIGATORY.  " C:\temp\flight.csv

"-----------------------------------------------------------
" Define structure (example CSV: CARRID, CONNID, FLDATE)
"-----------------------------------------------------------
TYPES: BEGIN OF ty_flight_csv,
         carrid TYPE sflight-carrid,
         connid TYPE sflight-connid,
         fldate TYPE sflight-fldate,
       END OF ty_flight_csv.

DATA:
  lt_raw     TYPE STANDARD TABLE OF string,
  lt_flights TYPE STANDARD TABLE OF ty_flight_csv,
  ls_flight  TYPE ty_flight_csv,
  lv_line    TYPE string.

"-----------------------------------------------------------
" Upload file
"-----------------------------------------------------------
CALL FUNCTION 'GUI_UPLOAD'
  EXPORTING
    filename = p_file
    filetype = 'ASC'
  TABLES
    data_tab = lt_raw
  EXCEPTIONS
    OTHERS   = 1.

IF sy-subrc <> 0 OR lt_raw IS INITIAL.
  MESSAGE 'File upload failed or empty file' TYPE 'E'.
ENDIF.

"-----------------------------------------------------------
" Skip header line (first row)
"-----------------------------------------------------------
DELETE lt_raw INDEX 1.

"-----------------------------------------------------------
" Process each CSV record
"-----------------------------------------------------------
LOOP AT lt_raw INTO lv_line.

  " Skip blank lines
  IF lv_line IS INITIAL.
    CONTINUE.
  ENDIF.

  " Split CSV: CARRID,CONNID,FLDATE
  SPLIT lv_line AT ',' INTO
    ls_flight-carrid
    ls_flight-connid
    ls_flight-fldate.

  "---------------------------
  " Basic validation
  "---------------------------
  IF ls_flight-carrid IS INITIAL
  OR ls_flight-connid IS INITIAL.
    CONTINUE.  " ignore bad line
  ENDIF.

  APPEND ls_flight TO lt_flights.
  CLEAR ls_flight.

ENDLOOP.

IF lt_flights IS INITIAL.
  MESSAGE 'No valid records found in file' TYPE 'E'.
ENDIF.

"-----------------------------------------------------------
" Display result in ALV
"-----------------------------------------------------------
DATA(lo_alv) = NEW cl_salv_table( ).

TRY.
    cl_salv_table=>factory(
      IMPORTING
        r_salv_table = lo_alv
      CHANGING
        t_table      = lt_flights
    ).
  CATCH cx_salv_msg INTO DATA(lx_msg).
    MESSAGE lx_msg->get_text( ) TYPE 'E'.
ENDTRY.

lo_alv->get_functions( )->set_all( abap_true ).
lo_alv->get_columns( )->set_optimize( abap_true ).
lo_alv->get_display_settings( )->set_list_header(
  'Uploaded CSV Flight Records'
).

lo_alv->display( ).
