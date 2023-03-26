@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: 'Order Items'
@ObjectModel.semanticKey: [ 'up__ID', 'ID' ]
define view entity ZI_R58_OrderItems
  as projection on ZR_R58_OrderItems
  {
    key up__ID,
    key ID,
    Createdat,
    Createdby,
    Modifiedat,
    Modifiedby,
    Unit,
    Quantity,
    _Header : redirected to parent ZI_R58_Orders,
    _UnitOfMeasure
  }
