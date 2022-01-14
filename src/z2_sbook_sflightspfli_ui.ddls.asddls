@AbapCatalog.sqlViewName: 'Z2BOOKFLIGPFLIUI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@OData.publish: true
@EndUserText.label: 'user interface'

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

define view Z2_SBOOK_SFLIGHTSPFLI_UI as select from Z2_SBOOK_SFLIGHTPFLI {
    @UI: { 
        lineItem: [{ position : 10, importance : #HIGH }],
        selectionField.position: 10,
        identification: [{ position : 10, importance : #HIGH }]
//        facet: [
//            { label: 'Booking', type: #IDENTIFICATION_REFERENCE },
//            { label: 'Flight', type: #LINEITEM_REFERENCE, targetElement: '_Z2_SFLIGHTSPFLI' }
//        ]
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
        lineItem: [{ position : 180, importance : #LOW }]
       }
    Cancelled,
    @UI: { 
        lineItem: [{ position : 190, importance : #LOW }]
       }
    Reserved,
    /* Associations */
    _Z2_SFLIGHTSPFLI
    
}where Fldate >= $session.system_date
