REPORT z_select_with_where_order.

DATA: lt_flights TYPE TABLE OF sflight,
      ls_flight  TYPE sflight.

SELECT *
  FROM sflight
  INTO TABLE lt_flights
  WHERE price > 300
  ORDER BY price DESCENDING.
IF sy-subrc IS INITIAL.
  LOOP AT lt_flights INTO ls_flight.
    WRITE: / ls_flight-carrid, ls_flight-connid, ls_flight-price.
  ENDLOOP.
ENDIF.
