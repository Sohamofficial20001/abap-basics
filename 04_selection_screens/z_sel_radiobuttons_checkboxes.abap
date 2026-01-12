REPORT z_sel_radiobuttons_checkboxes.

PARAMETERS: p_sum  RADIOBUTTON GROUP g1 DEFAULT 'X',
            p_avg  RADIOBUTTON GROUP g1,
            p_show AS CHECKBOX.

WRITE: / 'You selected:'.

IF p_sum = 'X'.
  WRITE: 'Sum'.
ELSEIF p_avg = 'X'.
  WRITE: 'Average'.
ENDIF.

IF p_show = 'X'.
  WRITE: / 'Extra information is requested.'.
ENDIF.
