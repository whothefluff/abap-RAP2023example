class zcl_r58_initialize_data definition
                              public
                              create public.

  public section.

    interfaces: if_oo_adt_classrun.

  protected section.

endclass.
class zcl_r58_initialize_data implementation.

  method if_oo_adt_classrun~main.

    modify entities of ZC_R58_Orders
      entity Orders
      create fields ( ID
                      ExternalID )
      auto fill cid
      with value #( ( %data = value #( ExternalID = '14' ) ) )
      failed data(failed)
      reported data(reported).

    commit entities.

    out->write( reported-orders ).

  endmethod.

endclass.
