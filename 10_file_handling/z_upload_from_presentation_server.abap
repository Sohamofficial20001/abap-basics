REPORT z_upload_from_presentation_server.

*----------------------------------------------------------------*
* Upload text file from Presentation Server into internal table
*----------------------------------------------------------------*

PARAMETERS: p_file TYPE rlgrap-filename OBLIGATORY.

DATA: lt_raw  TYPE STANDARD TABLE OF string,
      lv_line TYPE string.

"-------------------------------------------
" Upload file
"-------------------------------------------
CALL FUNCTION 'GUI_UPLOAD'
  EXPORTING
    filename                = p_file
    filetype                = 'ASC'
  TABLES
    data_tab                = lt_raw
  EXCEPTIONS
    file_open_error         = 1
    file_read_error         = 2
    no_batch                = 3
    gui_refuse_filetransfer = 4
    OTHERS                  = 5.

IF sy-subrc <> 0.
  MESSAGE 'File upload failed' TYPE 'E'.
ENDIF.

"-------------------------------------------
" Display uploaded content
"-------------------------------------------
LOOP AT lt_raw INTO lv_line.
  WRITE: / lv_line.
ENDLOOP.
