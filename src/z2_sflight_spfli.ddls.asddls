@AbapCatalog.sqlViewName: 'Z2FLIGPFLI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@OData.publish: true
@EndUserText.label: 'cds view for z2_sflight and z2_spfli'
define view Z2_SFLIGHT_SPFLI as select from Z2_SFLIGHT
association [1] to Z2_SPFLI as _Z2_SPFLI
    on  $projection.Carrid = _Z2_SPFLI.Carrid
    and $projection.Connid = _Z2_SPFLI.Connid {
    
    key Z2_SFLIGHT.Carrid,
    key Z2_SFLIGHT.Connid,
    key Z2_SFLIGHT.Fldate,
    Z2_SFLIGHT.Price,
    Z2_SFLIGHT.Currency,
    Z2_SFLIGHT.Planetype,
    Z2_SFLIGHT.Seatsmax,
    Z2_SFLIGHT.Seatsocc,
    Z2_SFLIGHT.Paymentsum,
    Z2_SFLIGHT.SeatsmaxB,
    Z2_SFLIGHT.SeatsoccB,
    Z2_SFLIGHT.SeatsmaxF,
    Z2_SFLIGHT.SeatsoccF,
    
    _Z2_SPFLI.Countryfr,
    _Z2_SPFLI.Cityfrom,
    _Z2_SPFLI.Airpfrom,
    _Z2_SPFLI.Countryto,
    _Z2_SPFLI.Cityto,
    _Z2_SPFLI.Airpto,
    _Z2_SPFLI.Fltime,
    _Z2_SPFLI.Deptime,
    _Z2_SPFLI.Arrtime,
    _Z2_SPFLI.Distance,
    _Z2_SPFLI.Distid,
    _Z2_SPFLI.Fltype,
    _Z2_SPFLI.Period
}
