*&---------------------------------------------------------------------*
*& Report z06_calculator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_calculator.

PARAMETERS: gv_int1 TYPE p , zahl2 TYPE p.
PARAMETERS: gv_op TYPE c length 1.

DATA gv_output TYPE STRING.


gv_output = 'Das Ergebnis lautet: '.

CASE gv_op.
    WHEN '/'.
        IF zahl2 <> 0.
            gv_output = 'Zahl 2 darf nicht 0 bei der Division sein!'.
            EXIT.
        ENDIF.

        gv_output = gv_output +  gv_int1 / zahl2.
    WHEN '+'.
        gv_output = gv_output + gv_int1 + zahl2.
    WHEN '-'.
        gv_output = gv_output + gv_int1 - zahl2.
    WHEN '*'.
        gv_output = gv_output + gv_int1 * zahl2.
    WHEN OTHERS.
        gv_output = 'Bitte geben Sie a, s, d oder m ein!'.


ENDCASE.


        split gv_output AT 't'
            INTO DATA(gv1) DATA(gv2).

WRITE gv1 && gv2.
WRITE  Text-001.
