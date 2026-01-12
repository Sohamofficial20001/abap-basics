REPORT z_sel_select_options.

SELECT-OPTIONS: s_matnr FOR mara-matnr.

WRITE: / 'You selected material range:'.
LOOP AT s_matnr.
  WRITE: / s_matnr-low, s_matnr-high, s_matnr-sign, s_matnr-option.
ENDLOOP.
