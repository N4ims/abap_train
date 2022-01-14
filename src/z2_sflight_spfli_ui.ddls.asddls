@AbapCatalog.sqlViewName: 'Z2FLIGPFLIUI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@OData.publish: true
@EndUserText.label: 'User Interface'

@UI.headerInfo: {
    title: { label: 'Flights' }
}

@ObjectModel: { 
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}

define view Z2_SFLIGHT_SPFLI_UI as select from Z2_SFLIGHT_SPFLI {
    
    
    @UI: {
        lineItem: [{ position: 10, importance: #HIGH }],
        identification: [{ position: 10, importance: #HIGH }]
    }
    key Carrid,
    @UI: {
        lineItem: [{ position: 20, importance: #HIGH }],
        identification: [{ position: 20, importance: #HIGH }]
    }
    key Connid,
    @UI: {
        lineItem: [{ position: 30, importance: #HIGH }],
        identification: [{ position: 30, importance: #HIGH }]
    }
    key Fldate,
    @UI: {
        lineItem: [{ position: 40, importance: #MEDIUM }]
    }
    Price,
    @UI: {
        lineItem: [{ position: 50, importance: #MEDIUM }]
    }
    Currency,
    @UI: {
        lineItem: [{ position: 60, importance: #MEDIUM }]
    }
    Planetype,
    @UI: {
        lineItem: [{ position: 70, importance: #MEDIUM }]
    }
    Seatsmax,
    @UI: {
        lineItem: [{ position: 80, importance: #LOW }]
    }
    Seatsocc,
    @UI: {
        lineItem: [{ position: 90, importance: #LOW }]
    }
    SeatsmaxB,
    @UI: {
        lineItem: [{ position: 100, importance: #LOW }]
    }
    SeatsoccB,
    @UI: {
        lineItem: [{ position: 110, importance: #LOW }]
    }
    SeatsmaxF,
    @UI: {
        lineItem: [{ position: 120, importance: #LOW }]
    }
    SeatsoccF,
    //Occupancy rate is calculated by dividing occupied seats by max seats
    CONCAT( 
        cast( 
            DIVISION( 
                ( Seatsocc + SeatsoccB + SeatsoccF ) * 100, 
                ( Seatsmax + SeatsmaxB + SeatsmaxF ), 1)
            as abap.sstring(13) ), 
        '%' )
    as Occupancyrate,
    @UI: {
        lineItem: [{ position: 130, importance: #LOW }]
    }
    Paymentsum, 
    @UI: {
        lineItem: [{ position: 140, importance: #LOW }]
    }
    Countryfr,
    @UI: {
        lineItem: [{ position: 150, importance: #LOW }]
    }
    Cityfrom,
    @UI: {
        lineItem: [{ position: 160, importance: #LOW }]
    }
    Airpfrom,
    @UI: {
        lineItem: [{ position: 170, importance: #LOW }]
    }
    Countryto,
    @UI: {
        lineItem: [{ position: 180, importance: #LOW }]
    }
    Cityto,
    @UI: {
        lineItem: [{ position: 190, importance: #LOW }]
    }
    Airpto,
    @UI: {
        lineItem: [{ position: 200, importance: #LOW }]
    }
    Fltime,
    @UI: {
        lineItem: [{ position: 210, importance: #LOW }]
    }
    Deptime,
    @UI: {
        lineItem: [{ position: 220, importance: #LOW }]
    }
    Arrtime,
    @UI: {
        lineItem: [{ position: 230, importance: #LOW }]
    }
    Distance,
    @UI: {
        lineItem: [{ position: 240, importance: #LOW }]
    }
    Distid,
    @UI: {
        lineItem: [{ position: 250, importance: #LOW }]
    }
    Fltype,
    @UI: {
        lineItem: [{ position: 260, importance: #LOW }]
    }
    Period
    
}
