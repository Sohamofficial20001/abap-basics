REPORT z_select_into_table.

DATA: lt_sflight TYPE STANDARD TABLE OF sflight,
      ls_sflight TYPE sflight.

SELECT *
  FROM sflight
  INTO TABLE lt_sflight
  WHERE carrid = 'LH'.

IF sy-subrc IS INITIAL.
  LOOP AT lt_sflight INTO ls_sflight.
    WRITE: / ls_sflight-carrid, ls_sflight-connid, ls_sflight-price.
  ENDLOOP.
ENDIF.

