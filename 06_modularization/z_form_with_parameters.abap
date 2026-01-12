REPORT z_form_with_parameters.

DATA: lv_a TYPE i VALUE 5,
      lv_b TYPE i VALUE 7,
      lv_sum TYPE i.

PERFORM add_numbers USING lv_a lv_b CHANGING lv_sum.

WRITE: / 'Sum is:', lv_sum.

FORM add_numbers
  USING    p_a TYPE i
           p_b TYPE i
  CHANGING p_sum TYPE i.

  p_sum = p_a + p_b.

ENDFORM.
