*&---------------------------------------------------------------------*
*& Report z06_uebung1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_uebung1.


PARAMETERS gv_input TYPE STRING lower case.

DATA gv_output TYPE STRING.

DATA(first_letter) = substring( val = gv_input off = 0 len = 1 ).
DATA(first_letter2) = gv_input+0(1).

CASE first_letter.
    WHEN 'A'  OR 'a' .
        WRITE 'Test'.
        gv_output = gv_input.
        TRANSLATE gv_output TO upper case.
    WHEN 'z' OR 'Z'.
        gv_output = Reverse( gv_input ).
    WHEN OTHERS.
        "DATA(i) = 0.
        DO STRLEN( gv_input ) TIMES.
            WRITE 'Hier '.
            gv_output = gv_output && |{ sy-index } : { cl_abap_char_utilities=>cr_lf } { gv_input+1(1) }|.
        ENDDO.
        EXIT.
ENDCASE.

WRITE / gv_output.

*new-line scrolling/rolling
