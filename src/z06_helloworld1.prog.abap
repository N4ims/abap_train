*&---------------------------------------------------------------------*
*& Report z06_helloworld1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_helloworld1.

TYPES BEGIN OF ty_person.  "Bauplan für Variable ty_person
    TYPES first_name TYPE string.
    TYPES last_name TYPE string.
    TYPES birthdate TYPE d.
TYPES END OF ty_person.


TYPES BEGIN OF ty_bahnhof.
    TYPES first_name TYPE string.
    TYPES last_name TYPE i.
    TYPES ort type string.
TYPES END OF ty_bahnhof.


DATA person1 TYPE ty_person.
DATA bahnhof1 TYPE ty_bahnhof.


person1 = VALUE #( birthdate = '30121999'
                    first_name = 'Peter'
                    last_name = 'Zwegat' ).

DATA person2 TYPE ty_person.

person1 = value TY_PERSON(
    birthdate = '30121999'
    first_name = 'Peter'
    last_name = 'Zwegat'
).

DATA(bahnhof2) = corresponding ty_bahnhof( person1 ).
