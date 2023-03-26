@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZI_R58_ORDERS'
@ObjectModel.semanticKey: [ 'ID' ]
define root view entity ZC_R58_Orders
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
    _Items : redirected to composition child ZC_R58_OrderItems
  }
