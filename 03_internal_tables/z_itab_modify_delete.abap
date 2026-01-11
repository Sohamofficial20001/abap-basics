REPORT z_itab_modify_delete.

TYPES: BEGIN OF ty_employee,
         empid TYPE i,
         name  TYPE string,
       END OF ty_employee.

DATA: gt_employee TYPE STANDARD TABLE OF ty_employee,
      gs_employee TYPE ty_employee.

APPEND VALUE #( empid = 1 name = 'John' ) TO gt_employee.
APPEND VALUE #( empid = 2 name = 'Sara' ) TO gt_employee.
APPEND VALUE #( empid = 3 name = 'Alex' ) TO gt_employee.

* Modify employee name
READ TABLE gt_employee INTO gs_employee WITH KEY empid = 2.
IF sy-subrc = 0.
  gs_employee-name = 'Sarah Miller'.
  MODIFY gt_employee FROM gs_employee INDEX sy-tabix.
ENDIF.

* Delete employee
DELETE gt_employee WHERE empid = 3.

* Display final table
LOOP AT gt_employee INTO gs_employee.
  WRITE: / gs_employee-empid, gs_employee-name.
ENDLOOP.
