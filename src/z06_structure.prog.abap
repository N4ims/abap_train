*&---------------------------------------------------------------------*
*& Report z06_structure
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_structure.


TYPES BEGIN OF ts_complete.
    TYPES carryid TYPE z06_connection-carrid .
    TYPES connid TYPE z06_connection-connid.
    TYPES cityfrom TYPE z06_connection-cityfrom.
    TYPES cityto TYPE z06_connection-cityto.
    TYPES fldate TYPE d400_s_flight-fldate.
    TYPES planetype TYPE d400_s_flight-planetype.
    TYPES seatsmax TYPE d400_s_flight-seatsmax.
    TYPES seatsocc TYPE d400_s_flight-seatsocc.
TYPES END OF ts_complete.

DATA gs_conn TYPE z06_connection.
DATA gs_flight type d400_s_flight.
DATA gs_complete TYPE ts_complete.

gs_conn = VALUE Z06_CONNECTION(

    CARRID                  = 'LH'
    CONNID                  = '0400'
    CITYFROM                = 'FRANKFURT'
    CITYTO                  = 'NEW YORK'
).




try.
    cl_s4d400_flight_model=>get_next_flight(
    EXPORTING iv_carrid = gs_conn-carrid
                iv_connid = gs_conn-connid
    IMPORTING
        es_flight = gs_flight ).

    gs_complete = CORRESPONDING #( BASE ( gs_complete )
    gs_conn ).
    gs_complete = CORRESPONDING #( BASE ( gs_complete ) gs_flight ).
    cl_s4d_output=>display_structure( iv_structure = gs_complete ).


    catch cx_s4d400_no_data.
        cl_s4d_output=>display_line( iv_text = |{ TEXT-te1 }| ).
ENDTRY.
