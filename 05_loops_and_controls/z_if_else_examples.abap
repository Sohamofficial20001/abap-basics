REPORT z_if_else_examples.

DATA: lv_num TYPE i VALUE 7.

IF lv_num > 10.
  WRITE: 'Greater than 10'.
ELSEIF lv_num = 10.
  WRITE: 'Equal to 10'.
ELSE.
  WRITE: 'Less than 10'.
ENDIF.
