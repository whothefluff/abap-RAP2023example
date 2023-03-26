@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED Order Status'
define root view entity ZR_R58_OrderStatuses
  as select from zr58orderstatus as OrderStatuses
  composition [1..*] of ZR_R58_OrderStatusTexts as _Texts
  association [1..1] to ZR_R58_OrderStatusLocalized as _LocalizedText
    on $projection.ID = _LocalizedText.Id
  association [0..*] to ZR_R58_Orders as _OrdersRef
    on $projection.ID = _OrdersRef.Status
  {
    key id as ID,
    @Semantics.systemDateTime.createdAt
    created_at as CreatedAt,
    @Semantics.user.createdBy
    created_by as CreatedBy,
    @Semantics.systemDateTime.lastChangedAt
    modified_at as ModifiedAt,
    @Semantics.user.lastChangedBy
    modified_by as ModifiedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt
    last_local_change_at as LastLocalChangeAt,
    @Semantics.user.localInstanceLastChangedBy
    last_local_change_by as LastLocalChangeBy,
    name as Name,
    description as Description,
    _Texts,
    _LocalizedText,
    _OrdersRef
  }
