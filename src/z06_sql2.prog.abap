*&---------------------------------------------------------------------*
*& Report z06_sql2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_sql2.

DATA gt_flights TYPE d400_t_flights.

DATA g_anr TYPE d400_s_flight-carrid.
DATA g_flnr TYPE d400_s_flight-connid.

cl_s4d_input=>GET_CONNECTION(
  IMPORTING
    EV_AIRLINE   = g_anr
    EV_FLIGHT_NO = g_flnr
).

SELECT FROM SFLIGHT
    fields carrid, connid, fldate, planetype, seatsmax, seatsocc
        WHERE carrid = @g_anr AND connid = @g_flnr
            INTO TABLE @gt_flights.

cl_s4d_output=>display_table( gt_flights ).
