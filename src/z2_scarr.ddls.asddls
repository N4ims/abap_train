@AbapCatalog.sqlViewName: 'Z2SCARR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@OData.publish: true
@EndUserText.label: 'cds for scarr'
define view Z2_SCARR as select from scarr {
    key carrid as Carrid,
    carrname as Carrname,
    currcode as Currcode,
    url as Url
}
