REPORT z_perform_table_processing.

TYPES: BEGIN OF ty_num,
         value TYPE i,
       END OF ty_num.

DATA: lt_numbers TYPE STANDARD TABLE OF ty_num,
      ls_number  TYPE ty_num.

ls_number-value = 1.  APPEND ls_number TO lt_numbers.
ls_number-value = 2.  APPEND ls_number TO lt_numbers.
ls_number-value = 3.  APPEND ls_number TO lt_numbers.

PERFORM display_table USING lt_numbers.

FORM display_table USING pt_tab TYPE STANDARD TABLE.

  FIELD-SYMBOLS: <fs_line> TYPE any.

  LOOP AT pt_tab ASSIGNING <fs_line>.
    WRITE: / <fs_line>.
  ENDLOOP.

ENDFORM.
