REPORT z_sel_bonus_tasks.

* Try-it-yourself tasks

PARAMETERS: p_mat TYPE mara-matnr,
            p_show AS CHECKBOX.

SELECT-OPTIONS: s_date FOR sy-datum.

AT SELECTION-SCREEN.
  IF p_mat IS INITIAL.
    MESSAGE 'Material is mandatory' TYPE 'E'.
  ENDIF.

START-OF-SELECTION.

WRITE: / 'Material:', p_mat.

IF p_show = 'X'.
  WRITE: / 'Date range selected:'.
  LOOP AT s_date.
    WRITE: / s_date-low, s_date-high.
  ENDLOOP.
ENDIF.
