@AbapCatalog.sqlViewName: 'Z2BOOKUI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@OData.publish: true
@EndUserText.label: 'z2_sbook including ui annotations'

@UI.headerInfo: {
    typeName: 'Customer Booking',
    typeNamePlural: 'Customer Bookings'
}

@Search.searchable: true

define view Z2_SBOOK_UI 

//with parameters
//
//@Environment.systemField: #SYSTEM_DATE
//p_start_date : abap.dats

as select from Z2_SBOOK {
    @UI: { 
        lineItem: [{ position : 10, importance : #HIGH }],
        selectionField.position: 10
       }
    @Search: { 
        defaultSearchElement: true,
        ranking: #MEDIUM,
        fuzzinessThreshold: 0.8
       }
    key Carrid,
    @UI: { 
        lineItem: [{ position : 20, importance : #HIGH }],
        selectionField.position: 20
       }
    @Search: { 
        defaultSearchElement: true,
        ranking: #MEDIUM,
        fuzzinessThreshold: 0.8
       }
    key Connid,
    @UI: { 
        lineItem: [{ position : 30, importance : #HIGH }],
        selectionField.position: 30
       }
    key Fldate,
    @UI: { 
        lineItem: [{ position : 40, importance : #HIGH }],
        selectionField.position: 40
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
    Reserved
}
where Fldate >= $session.system_date
