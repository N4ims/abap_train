*&---------------------------------------------------------------------*
*& Report z06_itab
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_itab.

DATA gt_connections TYPE Z06_T_CONNECTIONS.
DATA gt_flights TYPE d400_t_flights.
DATA gt_percentage TYPE d400_t_percentage.

gt_connections = VALUE #(
    ( CARRID = 'LH' CONNID = '400')
    (  CARRID = 'LH' CONNID = '402' )
).


CALL FUNCTION 'Z_06_GET_FLIGHTS'
  EXPORTING
    it_connections = gt_connections
   importing
        et_flights = gt_flights.



gt_percentage = corresponding #( gt_flights ).


"Ausgabe der Tabelle

WRITE: `Carrier`, AT 10 `Conn.`, AT 20 `Date`, AT 34 `Occupied`, AT 45 `Max.`, AT 55 `Percentage`.


loop at gt_percentage reference into DATA(gs_percentage).
    if gs_percentage->seatsmax <> 0.
        gs_percentage->percentage = gs_percentage->seatsocc / gs_percentage->seatsmax * 100.
    endif.
    WRITE: / gs_percentage->carrid, AT 10 gs_percentage->connid, AT 20
            gs_percentage->fldate, AT 34 gs_percentage->seatsocc, AT 45
            gs_percentage->seatsmax, AT 55 |{ gs_percentage->percentage ALIGN = LEFT }%|.
endloop.


cl_s4d_output=>display_table( gt_percentage ).
