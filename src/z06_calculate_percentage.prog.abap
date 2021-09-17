*&---------------------------------------------------------------------*
*& Report z06_calculator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_calculate_percentage.

PARAMETERS: gv_int1 TYPE i , zahl2 TYPE i.
PARAMETERS: gv_op TYPE c length 1.

DATA gv_output TYPE STRING.


gv_output = 'Das Ergebnis lautet: '.

CASE gv_op.
    WHEN '/'.
        IF zahl2 <> 0.
            gv_output = 'Zahl 2 darf nicht 0 bei der Division sein!'.
            EXIT.
        ENDIF.

        gv_output = | { gv_output } && { gv_int1 / zahl2 }|.
    WHEN '+'.
        gv_output = | { gv_output } && { gv_int1 + zahl2 }|.
    WHEN '-'.
        gv_output = | { gv_output } && { gv_int1 - zahl2 }|.
    WHEN '*'.
        gv_output = | { gv_output } && { gv_int1 * zahl2 }|.
    WHEN '%'.
        DATA gv_result TYPE s4d400_percentage.
        CALL FUNCTION 'S4D400_CALCULATE_PERCENTAGE'
          EXPORTING
            IV_INT1          = gv_int1
            IV_INT2          = zahl2
          IMPORTING
            EV_RESULT        = gv_result
          EXCEPTIONS
            DIVISION_BY_ZERO = 1
            OTHERS           = 2
          .
        IF SY-SUBRC <> 0.
            MESSAGE 'Division by Zero' TYPE 'I' DISPLAY like 'W'. "I / S / W / E
        ENDIF.
        gv_output = gv_output && gv_result.
    WHEN OTHERS.
        gv_output = 'Bitte geben Sie a, s, d, m oder % ein!'.


ENDCASE.


        split gv_output AT 't'
            INTO DATA(gv1) DATA(gv2).

WRITE gv_output.
WRITE  Text-001.
