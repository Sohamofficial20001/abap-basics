REPORT z_sel_validation.

PARAMETERS: p_age TYPE i.

AT SELECTION-SCREEN.
  IF p_age < 0.
    MESSAGE 'Age cannot be negative' TYPE 'E'.
  ENDIF.

START-OF-SELECTION.
  WRITE: / 'Age entered:', p_age.
