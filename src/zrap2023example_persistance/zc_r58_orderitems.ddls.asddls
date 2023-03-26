@EndUserText.label: 'Order Items'
@Metadata.allowExtensions: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.semanticKey: [ 'up__ID', 'ID' ]
define view entity ZC_R58_OrderItems
  as projection on ZI_R58_OrderItems
  {
    key up__ID,
    key ID,
    Createdat,
    Createdby,
    Modifiedat,
    Modifiedby,
    Unit,
    Quantity,
    _Header : redirected to parent ZC_R58_Orders,
    _UnitOfMeasure
  }
