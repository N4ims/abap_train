*&---------------------------------------------------------------------*
*& Report z06_class
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_class.


CLASS lcl_human DEFINITION.
  PUBLIC SECTION.


    METHODS constructor
      IMPORTING
                i_first_name TYPE string
                i_last_name  TYPE string
      RAISING   cx_s4d400_no_data.

  PRIVATE SECTION.
    DATA first_name TYPE string.
    DATA last_name TYPE string.

ENDCLASS.


CLASS lcl_human IMPLEMENTATION.

  METHOD constructor.
    IF i_first_name = 'Testname'.
      RAISE EXCEPTION TYPE cx_s4d400_no_data.
    ENDIF.
    first_name = i_first_name.
    last_name = i_last_name.
  ENDMETHOD.
ENDCLASS.


"Declaration
CLASS lcl_airplane DEFINITION.
  PUBLIC SECTION.

    "Structure
    TYPES BEGIN OF ts_attribute.
    TYPES attribute TYPE string.
    TYPES value TYPE string.
    TYPES END OF ts_attribute.

    "Table
    TYPES tt_attributes TYPE STANDARD TABLE OF ts_attribute
    WITH NON-UNIQUE KEY attribute.

    "Methods
    CLASS-METHODS class_constructor.  "warum keine CLASS-METHODS, obwohl es static sein soll?

    METHODS constructor
      IMPORTING
                i_name      TYPE string
                i_planetype TYPE saplane-planetype
      RAISING   cx_s4d400_wrong_plane.


    METHODS set_attributes
      IMPORTING
                iv_name      TYPE string
                iv_planetype TYPE saplane-planetype
      RAISING   cx_sy_conversion_no_number. "

    METHODS get_attributes
      EXPORTING
        et_attributes TYPE tt_attributes.

    CLASS-METHODS get_n_o_airplanes
      EXPORTING
        ev_number TYPE i.

    METHODS get_attributes_return
      RETURNING
        VALUE(r_attributes) TYPE tt_attributes.



  PRIVATE SECTION.

    DATA mv_name TYPE string.
    DATA mv_planetyp TYPE saplane-planetype.
    CLASS-DATA gv_n_o_airplanes TYPE i.
    CLASS-DATA gt_planetypes TYPE STANDARD TABLE OF saplane
    WITH NON-UNIQUE KEY planetype.

ENDCLASS.

"Implementation
CLASS lcl_airplane IMPLEMENTATION.


  METHOD class_constructor.
    SELECT FROM saplane FIELDS * INTO CORRESPONDING FIELDS OF TABLE @gt_planetypes.
      cl_s4d_output=>display_table( it_table = gt_planetypes ).
  ENDMETHOD.

  METHOD constructor.

    IF NOT line_exists( gt_planetypes[ planetype = i_planetype ] ). "Warum wird es von Auto-Completion nicht vorgeschlage?
      RAISE EXCEPTION TYPE cx_s4d400_wrong_plane.
    ENDIF.

    mv_name = i_name.
    mv_planetyp = i_planetype.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
  ENDMETHOD.

  METHOD get_attributes.
    CLEAR et_attributes.
    et_attributes = VALUE #( BASE et_attributes ( attribute = 'NAME' value = mv_name )
                                                   ( attribute = 'PLANETYPE' value = mv_planetyp )  ).
  ENDMETHOD.

  METHOD get_n_o_airplanes.
    ev_number = gv_n_o_airplanes.
  ENDMETHOD.

  METHOD set_attributes.
    mv_name = iv_name.
    mv_planetyp = iv_planetype.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
  ENDMETHOD.

  METHOD get_attributes_return.
    r_attributes = VALUE #( ( attribute = 'NAME' value = mv_name )
                                                   ( attribute = 'PLANETYPE' value = mv_planetyp ) ).
  ENDMETHOD.



ENDCLASS.





DATA: go_airplane   TYPE REF TO lcl_airplane,
      gt_airplanes  TYPE TABLE OF REF TO lcl_airplane,
      gt_attributes TYPE lcl_airplane=>tt_attributes.
DATA gt_output TYPE STANDARD TABLE OF lcl_airplane=>ts_attribute.

START-OF-SELECTION.

  TRY.
      go_airplane = NEW #(
          i_name      = 'XXX'
          i_planetype = 'CONCORDE'
      ).
      gt_airplanes = VALUE #( BASE gt_airplanes ( go_airplane ) ).
    CATCH cx_s4d400_wrong_plane.
  ENDTRY.

  TRY.
      go_airplane = NEW #(
            i_name = 'YARAKI'
            i_planetype = 'YAK-242'
      ).
      gt_airplanes = VALUE #( BASE gt_airplanes ( go_airplane ) ).
    CATCH cx_s4d400_wrong_plane.
  ENDTRY.


  TRY.
      go_airplane = NEW #(
            i_name = 'Unlucky'
            i_planetype = 'CONCORDE'
      ).
      gt_airplanes = VALUE #( BASE gt_airplanes ( go_airplane ) ).
    CATCH cx_s4d400_wrong_plane.
  ENDTRY.


  LOOP AT gt_airplanes INTO go_airplane.
    go_airplane->get_attributes(
        IMPORTING
            et_attributes = gt_attributes   ).
    gt_output = CORRESPONDING #( BASE ( gt_output ) gt_attributes ).
  ENDLOOP.



  cl_s4d_output=>display_table( it_table = gt_output ).
