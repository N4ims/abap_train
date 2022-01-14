@AbapCatalog.sqlViewName: 'Z2SBOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@OData.publish: true
@EndUserText.label: 'cds for sbook'
define view Z2_SBOOK as select from sbook {
    key carrid as Carrid,
    key connid as Connid,
    key fldate as Fldate,
    key bookid as Bookid,
    customid as Customid,
    custtype as Custtype,
    smoker as Smoker,
    @Semantics.quantity.unitOfMeasure: 'Wunit'
    luggweight as Luggweight,
    @Semantics.unitOfMeasure: true
    wunit as Wunit,
    invoice as Invoice,
    class as Class,
    @Semantics.amount.currencyCode: 'Forcurkey'
    forcuram as Forcuram,
    @Semantics.currencyCode: true
    forcurkey as Forcurkey,
    @Semantics.amount.currencyCode: 'Loccurkey'
    loccuram as Loccuram,
    @Semantics.currencyCode: true
    loccurkey as Loccurkey,
    order_date as OrderDate,
    counter as Counter,
    agencynum as Agencynum,
    cancelled as Cancelled,
    reserved as Reserved,
    passname as Passname,
    passform as Passform,
    passbirth as Passbirth
}
