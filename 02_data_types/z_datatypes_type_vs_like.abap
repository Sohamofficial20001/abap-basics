REPORT z_dt_type_vs_like.

TYPES: ty_empid TYPE n LENGTH 6.

DATA: gv_empid1 TYPE ty_empid,  " Using TYPE
      gv_empid2 LIKE gv_empid1. " Using LIKE

gv_empid1 = '123456'.
gv_empid2 = '999999'.

WRITE: / 'TYPE example value:', gv_empid1,
       / 'LIKE example value:', gv_empid2.
