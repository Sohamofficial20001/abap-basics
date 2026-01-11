REPORT z_datatypes_bonus_examples.

* "Try it yourself" tasks

* 1. Salary variable
DATA gv_salary TYPE p LENGTH 8 DECIMALS 2.
gv_salary = '75000.50'.
WRITE: / 'Salary:', gv_salary.

* 2. Company constant
CONSTANTS gc_company TYPE c LENGTH 20 VALUE 'Your Company'.
WRITE: / 'Company:', gc_company.

* 3. Date and time experiment
DATA: gv_today TYPE d VALUE sy-datum,
      gv_now   TYPE t VALUE sy-uzeit.

WRITE: / 'Today:', gv_today,
       / 'Current Time:', gv_now.

* 4. TYPE vs LIKE
TABLES mara.
DATA gv_matnr TYPE mara-matnr.
gv_matnr = '000000000000001234'.
WRITE: / 'Material Number:', gv_matnr.
