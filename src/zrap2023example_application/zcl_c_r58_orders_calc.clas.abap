class zcl_c_r58_orders_calc definition
                            public
                            create public.

  public section.

    interfaces if_sadl_exit_calc_element_read.

  protected section.

endclass.
class zcl_c_r58_orders_calc implementation.

  method if_sadl_exit_calc_element_read~calculate.

    types orders type standard table of ZC_R58_Orders with empty key.

    types order_ids type standard table of ZC_R58_Orders-ID with empty key.

    types order_items type standard table of ZC_R58_OrderItems with empty key.

    data(orders) = corresponding orders( it_original_data ).

    data(order_ids) = value order_ids( for <line> in orders
                                       ( <line>-ID ) ).

    select ZC_R58_OrderItems~up__ID,
           ZC_R58_OrderItems~Unit,
           ZC_R58_OrderItems~Quantity
      from @order_ids as order_ids
      inner join ZC_R58_OrderItems
        on order_ids~table_line eq ZC_R58_OrderItems~up__id
      into table @data(items).

    ct_calculated_data = corresponding #( value orders( for <line> in orders
                                                        let c_items = value order_items( for <item> in items where ( up__ID eq <line>-ID )
                                                                                         ( corresponding #( <item> ) ) )
                                                            same_unit_for_all_items = abap_true
                                                            total_quantity = cond ZC_R58_Orders-TotalQuantity( when same_unit_for_all_items eq abap_true
                                                                                                               then reduce #( init calc type decfloat34
                                                                                                                              for <c_item> in c_items
                                                                                                                              next calc += <c_item>-Quantity )
                                                                                                               else value #( ) )
                                                            total_quantity_unit = cond ZC_R58_Orders-TotalQuantityUnit( when same_unit_for_all_items = abap_true
                                                                                                                        then value #( c_items[ 1 ]-Unit optional )
                                                                                                                        else value #( ) ) in
                                                        ( value #( base corresponding #( <line> )
                                                                   TotalQuantity = total_quantity
                                                                   TotalQuantityUnit = total_quantity_unit ) ) ) ).

  endmethod.
  method if_sadl_exit_calc_element_read~get_calculation_info.

    et_requested_orig_elements = cond #( when iv_entity eq to_upper( 'ZC_R58_Orders' )
                                         then value #( ( `ID` ) )
                                         else throw entity_not_allowed( ) ).

  endmethod.

endclass.
