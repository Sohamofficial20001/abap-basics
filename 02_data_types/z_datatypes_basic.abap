REPORT z_datatypes_basic.

DATA: gv_name TYPE c LENGTH 20,
      gv_age  TYPE i,
      gv_sal  TYPE p LENGTH 8 DECIMALS 2,
      gv_date TYPE d,
      gv_time TYPE t.

gv_name = 'ABAP Developer'.
gv_age  = 25.
gv_sal  = '55000.75'.
gv_date = sy-datum.
gv_time = sy-uzeit.

WRITE: / 'Name     :', gv_name,
       / 'Age      :', gv_age,
       / 'Salary   :', gv_sal,
       / 'Date     :', gv_date,
       / 'Time     :', gv_time.
