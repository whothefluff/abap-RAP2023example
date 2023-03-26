@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Status Texts'
define view entity ZR_R58_OrderStatusTexts
  as select from zr58orderstattx
  association to parent ZR_R58_OrderStatuses as _Status
    on $projection.ID = _Status.ID
  association [0..1] to ZR_R58_OrderStatusLocalized as _LocalizedText
    on $projection.ID = _LocalizedText.Id
  {
    key language as Language,
    key id as ID,
    created_at as CreatedAt,
    created_by as CreatedBy,
    modified_at as ModifiedAt,
    modified_by as ModifiedBy,
    name as Name,
    description as Description,
    _Status,
    _LocalizedText
  }
