REPORT z_itab_read_table.

TYPES: BEGIN OF ty_employee,
         empid TYPE i,
         name  TYPE string,
       END OF ty_employee.

DATA: gt_employee TYPE STANDARD TABLE OF ty_employee WITH DEFAULT KEY,
      gs_employee TYPE ty_employee.

APPEND VALUE #( empid = 1 name = 'John' ) TO gt_employee.
APPEND VALUE #( empid = 2 name = 'Sara' ) TO gt_employee.

READ TABLE gt_employee INTO gs_employee WITH KEY empid = 2.

IF sy-subrc = 0.
  WRITE: / 'Employee found:', gs_employee-name.
ELSE.
  WRITE: / 'Employee not found'.
ENDIF.
