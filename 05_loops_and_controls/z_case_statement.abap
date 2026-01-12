REPORT z_case_statement.

DATA: lv_day TYPE c LENGTH 3 VALUE 'MON'.

CASE lv_day.
  WHEN 'MON'.
    WRITE: 'Monday'.
  WHEN 'TUE'.
    WRITE: 'Tuesday'.
  WHEN 'WED'.
    WRITE: 'Wednesday'.
  WHEN OTHERS.
    WRITE: 'Some other day'.
ENDCASE.
