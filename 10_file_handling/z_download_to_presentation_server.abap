REPORT z_download_to_presentation_server.

*----------------------------------------------------------------*
* Download internal table data to local PC file
*----------------------------------------------------------------*

PARAMETERS: p_file TYPE rlgrap-filename OBLIGATORY.

DATA: lt_text TYPE STANDARD TABLE OF string.

"--------------------------------------------
" Sample internal table content
"--------------------------------------------
APPEND 'Hello ABAP'                     TO lt_text.
APPEND 'File handling example'          TO lt_text.
APPEND 'Downloaded via GUI_DOWNLOAD'    TO lt_text.

"--------------------------------------------
" Download
"--------------------------------------------
CALL FUNCTION 'GUI_DOWNLOAD'
  EXPORTING
    filename   = p_file
    filetype   = 'ASC'
  TABLES
    data_tab   = lt_text
  EXCEPTIONS
    file_write_error        = 1
    no_batch                = 2
    gui_refuse_filetransfer = 3
    OTHERS                  = 4.

IF sy-subrc <> 0.
  MESSAGE 'File download failed' TYPE 'E'.
ELSE.
  MESSAGE 'File downloaded successfully' TYPE 'S'.
ENDIF.
