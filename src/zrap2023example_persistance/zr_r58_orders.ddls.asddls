@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED Orders'
define root view entity ZR_R58_Orders
  as select from zr58order as Orders
  composition [0..*] of ZR_R58_OrderItems as _Items
  association [1..1] to ZR_R58_OrderStatuses as _Status
    on $projection.Status = _Status.ID
  association [1..1] to ZR_R58_OrderStatusLocalized as _LocalizedStatus
    on $projection.Status = _LocalizedStatus.Id
  //  association [0..1] to I_User as _CreationUser
  //    on $projection.CreatedBy = _CreationUser.UserID
  //  association [0..1] to I_User as _ModificationUser
  //    on $projection.ModifiedBy = _ModificationUser.UserID
  {
    @Semantics.uuid
    key id as ID,
    external_id as ExternalID,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    modified_at as ModifiedAt,
    @Semantics.user.lastChangedBy: true
    modified_by as ModifiedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    last_local_change_at as LastLocalChangeAt,
    @Semantics.user.localInstanceLastChangedBy: true
    last_local_change_by as LastLocalChangeBy,
    status as Status,
    cast( 0 as abap.dec( 10, 2) ) as TotalQuantityInKG,
    _Items,
    _Status,
    _LocalizedStatus
  }
