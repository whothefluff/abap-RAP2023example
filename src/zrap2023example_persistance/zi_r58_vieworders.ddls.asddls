@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '##GENERATED Orders'
@ObjectModel.semanticKey: [ 'ID' ]
define root view entity ZI_R58_ViewOrders
  provider contract transactional_interface
  as projection on ZR_R58_Orders
  {
    key ID,
    ExternalID,
    CreatedAt,
    CreatedBy,
    ModifiedAt,
    ModifiedBy,
    LastLocalChangeAt,
    LastLocalChangeBy,
    Status,
    _Items : redirected to composition child ZI_R58_ViewOrderItems
  }
