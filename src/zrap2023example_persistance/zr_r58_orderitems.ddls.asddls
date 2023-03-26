@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Items'
define view entity ZR_R58_OrderItems
  as select from zr58orderitem
  association to parent ZR_R58_Orders as _Header
    on $projection.up__ID = _Header.ID
  association [1..1] to I_UnitOfMeasure as _UnitOfMeasure
    on $projection.Unit = _UnitOfMeasure.UnitOfMeasure
  //  association [0..1] to I_User as _CreationUser
  //    on $projection.CreatedBy = _CreationUser.UserID
  //  association [0..1] to I_User as _ModificationUser
  //    on $projection.ModifiedBy = _ModificationUser.UserID
  //  association [0..1] to I_User as _LocalChangeUser
  //    on $projection.LastLocalChangeBy = _LocalChangeUser.UserID
  {
    key up__id as up__ID,
    key id as ID,
    created_at as Createdat,
    created_by as Createdby,
    modified_at as Modifiedat,
    modified_by as Modifiedby,
    last_local_change_at as LastLocalChangeAt,
    last_local_change_by as LastLocalChangeBy,
    unit as Unit,
    quantity as Quantity,
    _Header,
    _UnitOfMeasure
    //    _CreationUser,
    //    _ModificationUser,
    //   _LocalChangeUser
  }
