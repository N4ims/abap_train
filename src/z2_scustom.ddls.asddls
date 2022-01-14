@AbapCatalog.sqlViewName: 'Z2SCUSTOM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@OData.publish: true
@EndUserText.label: 'cds for scustom'
define view Z2_SCUSTOM as select from scustom {
    key id as Id,
    name as Name,
    form as Form,
    street as Street,
    postbox as Postbox,
    postcode as Postcode,
    city as City,
    country as Country,
    region as Region,
    telephone as Telephone,
    custtype as Custtype,
    discount as Discount,
    langu as Langu,
    email as Email,
    webuser as Webuser
}
