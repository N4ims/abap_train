@AbapCatalog.sqlViewName: 'Z2CUSTBOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@OData.publish: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'z2_scustom and z2_sbook'

@UI.headerInfo: {
    typeName: 'Customer',
    typeNamePlural: 'Customers'
}

@Search.searchable: true

@ObjectModel: { 
    writeActivePersistence: 'Z2_SCUSTOM_SBOOK',
    
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}

define view Z2_SCUSTOM_SBOOK as select from Z2_SCUSTOM
association [*] to Z2_SBOOK_SFLIGHTPFLI as _Z2_SBOOK
    on $projection.Id = _Z2_SBOOK.Customid {
    
    @UI: { 
        lineItem: [{ position : 10, importance : #HIGH }],
        identification: [{ position: 10, importance: #HIGH }],
        facet: [
            { label: 'Customer', type: #IDENTIFICATION_REFERENCE },
            { label: 'Bookings', type: #LINEITEM_REFERENCE, targetElement: '_Z2_SBOOK' }
        ]
    }
    @Search: { 
        defaultSearchElement: true,
        fuzzinessThreshold: 0.8,
        ranking: #HIGH
       }
    key Z2_SCUSTOM.Id,   
    @UI: { 
        lineItem: [{ position : 20, importance : #HIGH }],
        identification: [{ position: 20, importance: #HIGH }]
       }
    Z2_SCUSTOM.Form,   
    @UI: { 
        lineItem: [{ position : 30, importance : #HIGH }],
        selectionField.position: 20,
        identification: [{ position: 30, importance: #HIGH }]
       }
    @Search: { 
        defaultSearchElement: true,
        fuzzinessThreshold: 0.85,
        ranking: #HIGH
       }
    Z2_SCUSTOM.Name,   
    @UI: { 
        lineItem: [{ position : 40, importance : #MEDIUM }],
        selectionField.position: 30,
        identification: [{ position: 40, importance: #MEDIUM }]
       }
    @Search: { 
        defaultSearchElement: true,
        fuzzinessThreshold: 0.75,
        ranking: #MEDIUM
       }
    Z2_SCUSTOM.Street,   
    @UI: { 
        lineItem: [{ position : 50, importance : #LOW }],
        identification: [{ position: 50, importance: #LOW }]
       }
    Z2_SCUSTOM.Postbox,   
    @UI: { 
        lineItem: [{ position : 60, importance : #MEDIUM }],
        identification: [{ position: 60, importance: #MEDIUM }]
       }
    Z2_SCUSTOM.Postcode,   
    @UI: { 
        lineItem: [{ position : 70, importance : #MEDIUM }],
        identification: [{ position: 70, importance: #MEDIUM }]
       }
    Z2_SCUSTOM.City,   
    @UI: { 
        lineItem: [{ position : 80, importance : #MEDIUM }],
        identification: [{ position: 80, importance: #MEDIUM }]
       }
    Z2_SCUSTOM.Country,   
    @UI: { 
        lineItem: [{ position : 90, importance : #MEDIUM }],
        identification: [{ position: 90, importance: #LOW }]
       }
    Z2_SCUSTOM.Region,   
    @UI: { 
        lineItem: [{ position : 100, importance : #MEDIUM }],
        selectionField.position: 40,
        identification: [{ position: 100, importance: #MEDIUM }]
       }
    @Search: { 
        defaultSearchElement: true,
        fuzzinessThreshold: 0.90,
        ranking: #MEDIUM
       }
    Z2_SCUSTOM.Telephone,   
    @UI: { 
        lineItem: [{ position : 110, importance : #MEDIUM }],
        selectionField.position: 50,
        identification: [{ position: 110, importance: #MEDIUM }]
       }
    @Search: { 
        defaultSearchElement: true,
        fuzzinessThreshold: 0.90,
        ranking: #MEDIUM
       }
    Z2_SCUSTOM.Email,   
    @UI: { 
        lineItem: [{ position : 120, importance : #LOW }]
       }
    Z2_SCUSTOM.Langu,   
    @UI: { 
        lineItem: [{ position : 130, importance : #LOW }]
       }
    Z2_SCUSTOM.Custtype,   
    @UI: { 
        lineItem: [{ position : 140, importance : #LOW }]
       }
    Z2_SCUSTOM.Webuser,   
    @UI: { 
        lineItem: [{ position : 150, importance : #LOW }]
       }
    Z2_SCUSTOM.Discount,
    
    _Z2_SBOOK // Make association public
}
