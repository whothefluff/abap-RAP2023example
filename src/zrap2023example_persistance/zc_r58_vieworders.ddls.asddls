@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '##GENERATED Orders'
@ObjectModel.semanticKey: [ 'ID' ]
define root view entity ZC_R58_ViewOrders
  provider contract transactional_query
  as projection on ZI_R58_Orders
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
    _Items: redirected to composition child ZC_R58_ViewOrderItems
  }
