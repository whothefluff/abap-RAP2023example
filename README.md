# abap-RAP2023example
Good to know:
- Generator for Web API does not generate BD with draft
- ID must be of type raw(16) (UUID)
- Using data elements abp_lastchange_, abp_locinst_lastchange_, and abp_creation_ automatically creates semantic annotations with RAP generator
- Creating DB names with ABAP notation is automatically translated to camelcase in CDS

TODO:
* Test virtual aggr and determination aggr
* Test localized
* Implement Orders
* Finish BDEF for Status
* Clean Projection hierarchy (R_ > I_ > C_). The interface views should expose diferent behavior for the consumption views
