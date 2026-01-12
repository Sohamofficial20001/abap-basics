REPORT z_method_vs_form_comparison.

CLASS lcl_demo DEFINITION.
  PUBLIC SECTION.
    METHODS: say_hello.
ENDCLASS.

CLASS lcl_demo IMPLEMENTATION.
  METHOD say_hello.
    WRITE: / 'Hello from METHOD'.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  PERFORM hello_form.

  DATA(lo_obj) = NEW lcl_demo( ).
  lo_obj->say_hello( ).

FORM hello_form.
  WRITE: / 'Hello from FORM'.
ENDFORM.
