@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: 'Order Items'
@ObjectModel.semanticKey: [ 'up__ID', 'ID' ]
define view entity ZC_R58_ViewOrderItems
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
    _Header: redirected to parent ZC_R58_ViewOrders,
    _UnitOfMeasure
  }
