REPORT z_while_loop.

DATA: lv_counter TYPE i VALUE 1.

WHILE lv_counter <= 5.
  WRITE: / 'Counter value:', lv_counter.
  lv_counter = lv_counter + 1.
ENDWHILE.
