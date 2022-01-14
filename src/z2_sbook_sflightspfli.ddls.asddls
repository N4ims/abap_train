@AbapCatalog.sqlViewName: 'Z2BOOKFLIGPFLI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@OData.publish: true
@EndUserText.label: 'z2_sbook and z2_sflight_spfli'

@UI.headerInfo: {
    typeName: 'Booking',
    typeNamePlural: 'Bookings'
}

@Search.searchable: true

@ObjectModel: {

  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true

}

define view Z2_SBOOK_SFLIGHTPFLI as select from Z2_SBOOK
association [1] to Z2_SFLIGHT_SPFLI_UI as _Z2_SFLIGHTSPFLI
    on  $projection.Carrid = _Z2_SFLIGHTSPFLI.Carrid
    and $projection.Connid = _Z2_SFLIGHTSPFLI.Connid
    and $projection.Fldate = _Z2_SFLIGHTSPFLI.Fldate {
    
    @UI: { 
        lineItem: [{ position : 10, importance : #HIGH }],
        selectionField.position: 10,
        identification: [{ position : 10, importance : #HIGH }],
        facet: [
            { label: 'Booking', type: #IDENTIFICATION_REFERENCE },
            { label: 'Flight', type: #IDENTIFICATION_REFERENCE, targetElement: '_Z2_SFLIGHTSPFLI' }
        ]
       }
    @Search: { 
        defaultSearchElement: true,
        ranking: #MEDIUM,
        fuzzinessThreshold: 0.8
       }
    key Carrid,
    @UI: { 
        lineItem: [{ position : 20, importance : #HIGH }],
        selectionField.position: 20,
        identification: [{ position : 20, importance : #HIGH }]
       }
    @Search: { 
        defaultSearchElement: true,
        ranking: #MEDIUM,
        fuzzinessThreshold: 0.8
       }
    key Connid,
    @UI: { 
        lineItem: [{ position : 30, importance : #HIGH }],
        selectionField.position: 30,
        identification: [{ position : 30, importance : #HIGH }]
       }
    @Search: { 
        defaultSearchElement: true,
        ranking: #HIGH
       }
    key Fldate,
    @UI: { 
        lineItem: [{ position : 40, importance : #HIGH }],
        selectionField.position: 40,
        identification: [{ position : 40, importance : #HIGH }]
       }
    key Bookid,
    @UI: { 
        lineItem: [{ position : 50, importance : #HIGH }],
        selectionField.position: 50
       }
    Customid,
    Passname,
    Passform,
    Passbirth,
    @UI: { 
        lineItem: [{ position : 60, importance : #MEDIUM }]
       }
    Class,
    @UI: { 
        lineItem: [{ position : 60, importance : #MEDIUM }]
       }
    Luggweight,
    @UI: { 
        lineItem: [{ position : 70, importance : #MEDIUM }]
       }
    Wunit,
    @UI: { 
        lineItem: [{ position : 80, importance : #LOW }]
       }
    Custtype,
    @UI: { 
        lineItem: [{ position : 90, importance : #LOW }]
       }
    Smoker,
    @UI: { 
        lineItem: [{ position : 100, importance : #LOW }]
       }
    Forcuram,
    @UI: { 
        lineItem: [{ position : 110, importance : #LOW }]
       }
    Forcurkey,
    @UI: { 
        lineItem: [{ position : 120, importance : #LOW }]
       }
    Loccuram,
    @UI: { 
        lineItem: [{ position : 130, importance : #LOW }]
       }
    Loccurkey,
    @UI: { 
        lineItem: [{ position : 140, importance : #LOW }]
       }
    OrderDate,
    @UI: { 
        lineItem: [{ position : 150, importance : #LOW }]
       }
    Counter,
    @UI: { 
        lineItem: [{ position : 160, importance : #LOW }]
       }
    Agencynum,
    @UI: { 
        lineItem: [{ position : 170, importance : #LOW }]
       }
    Invoice,
    @UI: { 
        lineItem: [{ position : 180, importance : #HIGH },
        { type : #FOR_ACTION, dataAction: 'BOPF:CANCEL_BOOKING', label : 'Cancel Booking' }]
       }
    Cancelled,
    @UI: { 
        lineItem: [{ position : 190, importance : #LOW }]
       }
    Reserved,
    
    @UI: {
        identification: [{ position : 50, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.Price,
    @UI: {
        identification: [{ position : 60, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.Currency,
//    @UI: {
//        identification: [{ position : 70, importance : #LOW }]
//    }
//    _Z2_SFLIGHTSPFLI.Planetype,
    @UI: {
        identification: [{ position : 80, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.Seatsmax,
    @UI: {
        identification: [{ position : 90, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.Seatsocc,
    @UI: {
        identification: [{ position : 100, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.SeatsmaxB,
    @UI: {
        identification: [{ position : 110, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.SeatsoccB,
    @UI: {
        identification: [{ position : 120, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.SeatsmaxF,
    @UI: {
        identification: [{ position : 130, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.SeatsoccF,
    @UI: {
        identification: [{ position : 140, importance : #LOW, label: 'Occupancyrate' }]
    }
    _Z2_SFLIGHTSPFLI.Occupancyrate,
    @UI: {
        identification: [{ position : 150, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.Paymentsum,
    @UI: {
        identification: [{ position : 1160, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.Countryfr,
    @UI: {
        identification: [{ position : 170, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.Cityfrom,
    @UI: {
        identification: [{ position : 180, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.Airpfrom,
    @UI: {
        identification: [{ position : 190, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.Countryto,
    @UI: {
        identification: [{ position : 200, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.Cityto,
    @UI: {
        identification: [{ position : 210, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.Airpto,
//    @UI: {
//        identification: [{ position : 220, importance : #LOW }]
//    }
//    _Z2_SFLIGHTSPFLI.Fltime,
    @UI: {
        identification: [{ position : 230, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.Deptime,
    @UI: {
        identification: [{ position : 240, importance : #LOW }]
    }
    _Z2_SFLIGHTSPFLI.Arrtime,
//    @UI: {
//        identification: [{ position : 250, importance : #LOW }]
//    }
//    _Z2_SFLIGHTSPFLI.Distance,
//    @UI: {
//        identification: [{ position : 260, importance : #LOW }]
//    }
//    _Z2_SFLIGHTSPFLI.Distid,
//    @UI: {
//        identification: [{ position : 270, importance : #LOW }]
//    }
//    _Z2_SFLIGHTSPFLI.Fltype,
//    @UI: {
//        identification: [{ position : 280, importance : #LOW }]
//    }
//    _Z2_SFLIGHTSPFLI.Period,
    
    _Z2_SFLIGHTSPFLI // Make association public
    
} where Fldate >= $session.system_date
