REPORT z_check_sy_subrc.

DATA: ls_scarr TYPE scarr.

SELECT SINGLE *
  FROM scarr
  INTO ls_scarr
  WHERE carrid = 'ZZ'.

IF sy-subrc <> 0.
  WRITE: / 'Airline not found'.
ELSE.
  WRITE: / 'Found airline:', ls_scarr-carrname.
ENDIF.
