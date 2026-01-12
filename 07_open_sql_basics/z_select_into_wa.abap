REPORT z_select_into_wa.

DATA: ls_spfli TYPE spfli.

SELECT *
  FROM spfli
  INTO ls_spfli
  UP TO 1 ROWS.

IF sy-subrc is initial.
  WRITE: / 'Connection:', ls_spfli-carrid, ls_spfli-connid.
ENDIF.
