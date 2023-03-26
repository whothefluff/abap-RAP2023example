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
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZBP_R_R58_ORDERS'
    @Semantics.quantity.unitOfMeasure : 'TotalQuantityUnit'
    virtual TotalQuantity: abap.quan( 10, 2 ),
    virtual TotalQuantityUnit: abap.unit( 3 ),
    _Items : redirected to composition child ZC_R58_OrderItems
  }
