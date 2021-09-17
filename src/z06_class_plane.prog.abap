*&---------------------------------------------------------------------*
*& Report z06_class_plane
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_class_plane.


CLASS lcl_cargo_plane DEFINITION INHERITING FROM Z06_class.

  PUBLIC SECTION.
    METHODS get_attributes REDEFINITION.

    METHODS constructor
        IMPORTING
            iv_name TYPE STRING
            iv_planetype TYPE saplane-planetype
            iv_weight TYPE I
        RAISING cx_s4d400_wrong_plane.


  PRIVATE SECTION.

    DATA mv_weight TYPE I.


ENDCLASS.







CLASS lcl_cargo_plane IMPLEMENTATION.



  METHOD constructor.

    super->constructor( i_name = iv_name i_planetype = iv_planetype ).

  ENDMETHOD.

  METHOD get_attributes.
    "et_attributes = VALUE #( ( attribute = 'NAME' value = mv_  ) ( attribute = 'PLANETYPE' value = mv_  ) )
  ENDMETHOD.

ENDCLASS.
