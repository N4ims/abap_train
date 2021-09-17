*&---------------------------------------------------------------------*
*& Report z06_sql1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_sql1.

DATA gs_flight TYPE d400_s_flight.
DATA g_airline TYPE d400_s_flight-carrid.
DATA g_flnr TYPE d400_s_flight-connid.
DATA g_fldate TYPE d400_s_flight-fldate.

cl_s4d_input=>GET_FLIGHT(
    IMPORTING
    EV_AIRLINE   = g_airline
    EV_FLIGHT_NO = g_flnr
    EV_DATE      = g_fldate
).


SELECT SINGLE FROM SFLIGHT
    fields carrid, connid, fldate, planetype, seatsmax, seatsocc
        WHERE carrid = @g_airline AND connid = @g_flnr AND fldate = @g_fldate
            INTO @gs_flight.


cl_s4d_output=>display_structure( gs_flight ).
