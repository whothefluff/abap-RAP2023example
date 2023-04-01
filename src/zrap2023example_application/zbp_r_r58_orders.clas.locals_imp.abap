class call_stack definition
                 create public.

  public section.

    types t_data type standard table of string with empty key.

    class-methods instance
                    returning
                      value(r_singleton) type ref to call_stack.

    class-methods class_constructor.

    methods add
              importing
                i_method_call type string
              returning
                value(r_self) type ref to call_stack.

    methods data
              returning
                value(r_self) type call_stack=>t_data.

  protected section.

    class-data a_singleton type ref to call_stack.

    data a_data_itab type call_stack=>t_data.

endclass.
class call_stack implementation.

  method add.

    me->a_data_itab = value #( base me->a_data_itab
                               ( i_method_call ) ).

  endmethod.
  method data.

    r_self = me->a_data_itab.

  endmethod.
  method instance.

    r_singleton = call_stack=>a_singleton.

  endmethod.
  method class_constructor.

    call_stack=>a_singleton = new #( ).

  endmethod.

endclass.
class lhc_items definition
                inheriting from cl_abap_behavior_handler.

  private section.

    methods get_instance_features
              for instance features
              importing
                keys
              request
                requested_features for Items
              result
                result.

    methods get_global_authorizations
              for global authorization
              importing request
                requested_authorizations for Items
              result
                result.

    methods Duplicate
              for modify
              importing
                keys for action Items~Duplicate.

    methods AssureQtyIsPositive
              for validate on save
              importing
                keys for Items~AssureQtyIsPositive.

endclass.
class lhc_items implementation.

  method get_instance_features.

  endmethod.
  method get_global_authorizations.

  endmethod.
  method Duplicate.

  endmethod.
  method AssureQtyIsPositive.

  endmethod.

endclass.
class lhc_Orders definition
                 inheriting from cl_abap_behavior_handler.

  private section.

    methods get_global_authorizations
              for global authorization
              importing request
                requested_authorizations for Orders
              result
                result.

    methods get_instance_features
            for instance features
            importing
              keys
            request
              requested_features for Orders
            result
              result.

    methods get_global_features
              for global features
              importing request
                requested_features for Orders
              result
                result.

    methods precheck_create
              for precheck
              importing
                entities for create Orders.

    methods CalculateSUM
              for read
              importing
                keys for function Orders~CalculateSUM
              request
                requested_fields
              result
                result.

    methods ReturnPosted
              for read
              importing
                keys for function Orders~ReturnPosted
              result
                result.

    methods Duplicate
              for modify
              importing
                keys for action Orders~Duplicate.

    methods Post
            for modify
            importing
              keys for action Orders~Post
            result
              result.

    methods test
              for modify
              importing
                keys for action Orders~test.

    methods test2
              for modify
              importing
                keys for action Orders~test2.

    methods precheck_test2
              for precheck
              importing
                keys for action Orders~test2.

    methods RecalculateSumInKG
              for determine on modify
              importing
                keys for Orders~RecalculateSumInKG.

    methods AssignExternalID
              for determine on save
              importing
                keys for Orders~AssignExternalID.

    methods AssureExtIDIsUnique
              for validate on save
              importing
                keys for Orders~AssureExtIDIsUnique.
    methods GetEntityWithGreatestExtID for read
      importing keys for function Orders~GetEntityWithGreatestExtID request requested_fields result result.

endclass.

class lhc_Orders implementation.

  method get_global_authorizations.

    if 1 eq 1.

      result = value #( %create = if_abap_behv=>fc-o-enabled
                        %update = if_abap_behv=>fc-o-enabled ).

    endif.

*    if requested_authorizations-%create eq conv abp_behv_flag( '1' ).
*
*      result = value #(  ).
*
*    endif.

  endmethod.
  method get_instance_features.

  endmethod.
  method get_global_features.

  endmethod.
  method precheck_create.

  endmethod.
  method CalculateSUM.

  endmethod.
  method ReturnPosted.

  endmethod.
  method Duplicate.

  endmethod.
  method Post.

  endmethod.
  method test.

  endmethod.
  method test2.

  endmethod.
  method precheck_test2.

  endmethod.
  method RecalculateSumInKG.

  endmethod.
  method AssignExternalID. "post commit

    read entities of ZR_R58_Orders
      in local mode
      entity orders
      execute GetEntityWithGreatestExtID
      from value #( )
      request value #( ExternalID = if_abap_behv=>mk-on )
      result data(result).

  endmethod.
  method AssureExtIDIsUnique.




  endmethod.
  method GetEntityWithGreatestExtID.

    select ID,
           max( ExternalID ) over( order by ID descending ) as ext_id
      from ZR_R58_Orders
      into @data(max_ext_id) up to 1 rows.



*      result = value #( %cid = value #( ) ).

    endselect.

  endmethod.

endclass.
