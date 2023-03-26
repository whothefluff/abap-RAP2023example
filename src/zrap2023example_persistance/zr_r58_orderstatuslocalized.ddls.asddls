@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Status Localized'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZR_R58_OrderStatusLocalized
  as select from zr58orderstatus
    left outer join zr58orderstattx
      on zr58orderstatus.id = zr58orderstattx.id
      and zr58orderstattx.language = $session.system_language
  association [1..1] to ZR_R58_OrderStatuses as _Status
    on $projection.Id = _Status.ID
  association [1..*] to ZR_R58_OrderStatusTexts as _Texts
    on $projection.Id = _Texts.ID
  //  association [0..1] to I_User as _CreationUser
  //    on $projection.CreatedBy = _CreationUser.UserID
  //  association [0..1] to I_User as _ModificationUser
  //    on $projection.ModifiedBy = _ModificationUser.UserID
  {
    key zr58orderstatus.id as Id,
    zr58orderstattx.created_at as CreatedAt,
    zr58orderstattx.created_by as CreatedBy,
    zr58orderstattx.modified_at as ModifiedAt,
    zr58orderstattx.modified_by as ModifiedBy,
    coalesce( zr58orderstattx.name, zr58orderstatus.name ) as Name,
    coalesce( zr58orderstattx.description, zr58orderstatus.description ) as Description,
    _Status,
    _Texts
    //    _CreationUser,
    //    _ModificationUser
  }
