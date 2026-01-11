REPORT z_itab_bonus_tasks.

* Solutions for Try-it-yourself tasks

TYPES: BEGIN OF ty_employee,
         empid TYPE i,
         name  TYPE string,
         age   TYPE i,
       END OF ty_employee.

DATA: gt_employee TYPE STANDARD TABLE OF ty_employee,
      gs_employee TYPE ty_employee.

* 1. Add 5 records
DO 5 TIMES.
  gs_employee-empid = sy-index.
  gs_employee-name  = |Employee { sy-index }|.
  gs_employee-age   = 20 + sy-index.
  APPEND gs_employee TO gt_employee.
ENDDO.

* 2. Read employee ID = 3
READ TABLE gt_employee INTO gs_employee WITH KEY empid = 3.
IF sy-subrc = 0.
  WRITE: / 'Found:', gs_employee-name.
ENDIF.

* 3. Delete employee ID = 2
DELETE gt_employee WHERE empid = 2.

* 4. Sort by name
SORT gt_employee BY name.

* 5. Display final list
ULINE.
WRITE: / 'Final Employee List:'.
ULINE.

LOOP AT gt_employee INTO gs_employee.
  WRITE: / gs_employee-empid, gs_employee-name, gs_employee-age.
ENDLOOP.
