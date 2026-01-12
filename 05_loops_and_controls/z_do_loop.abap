REPORT z_do_loop.

DATA: lv_counter TYPE i VALUE 1.

DO 5 TIMES.
  WRITE: / 'Loop counter:', lv_counter.
  lv_counter = lv_counter + 1.
ENDDO.
