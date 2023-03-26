@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_R58_ORDERSTATUSES'
@ObjectModel.semanticKey: [ 'ID' ]
define root view entity ZI_R58_OrderStatuses
  provider contract transactional_interface
  as projection on ZR_R58_OrderStatuses
  {
    key ID,
    Name,
    Description
  }
