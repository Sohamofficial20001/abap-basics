REPORT z_datatypes_constants.

CONSTANTS: gc_company TYPE c LENGTH 15 VALUE 'SAP Labs',
           gc_country TYPE c LENGTH 10 VALUE 'Germany'.

WRITE: / 'Company :', gc_company,
       / 'Country :', gc_country.
