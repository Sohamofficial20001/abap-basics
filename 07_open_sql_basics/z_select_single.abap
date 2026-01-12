REPORT z_select_single.

DATA: ls_scarr TYPE scarr.

SELECT SINGLE *
  FROM scarr
  INTO ls_scarr
  WHERE carrid = 'LH'.

IF sy-subrc = 0.
  WRITE: / 'Airline:', ls_scarr-carrid, ls_scarr-carrname.
ELSE.
  WRITE: / 'No data found'.
ENDIF.
