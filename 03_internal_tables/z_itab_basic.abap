REPORT z_itab_basic.

TYPES: BEGIN OF ty_employee,
         empid TYPE i,
         name  TYPE string,
         age   TYPE i,
       END OF ty_employee.

DATA: gt_employee TYPE STANDARD TABLE OF ty_employee,
      gs_employee TYPE ty_employee.

* Add entries
gs_employee-empid = 1.
gs_employee-name  = 'John'.
gs_employee-age   = 28.
APPEND gs_employee TO gt_employee.

gs_employee-empid = 2.
gs_employee-name  = 'Sara'.
gs_employee-age   = 31.
APPEND gs_employee TO gt_employee.

gs_employee-empid = 3.
gs_employee-name  = 'Alex'.
gs_employee-age   = 25.
APPEND gs_employee TO gt_employee.

* Display
LOOP AT gt_employee INTO gs_employee.
  WRITE: / 'ID:', gs_employee-empid,
         'Name:', gs_employee-name,
         'Age:', gs_employee-age.
ENDLOOP.
