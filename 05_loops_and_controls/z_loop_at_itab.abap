REPORT z_loop_at_itab.

TYPES: BEGIN OF ty_num,
         value TYPE i,
       END OF ty_num.

DATA: lt_numbers TYPE STANDARD TABLE OF ty_num,
      ls_number  TYPE ty_num.

ls_number-value = 10.  APPEND ls_number TO lt_numbers.
ls_number-value = 20.  APPEND ls_number TO lt_numbers.
ls_number-value = 30.  APPEND ls_number TO lt_numbers.

LOOP AT lt_numbers INTO ls_number.
  WRITE: / 'Number:', ls_number-value.
ENDLOOP.
