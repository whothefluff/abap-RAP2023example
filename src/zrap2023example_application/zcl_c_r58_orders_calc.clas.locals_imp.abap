"! <p class="shorttext synchronized" lang="EN"></p>
class entity_not_allowed definition
                         inheriting from cx_sadl_exit
                         create public.

  public section.

    interfaces: if_t100_dyn_msg.

    "! <p class="shorttext synchronized" lang="EN"></p>
    "!
    "! @parameter i_previous | <p class="shorttext synchronized" lang="EN"></p>
    methods constructor
              importing
                i_previous like previous optional.

endclass.
class entity_not_allowed implementation.


  method constructor ##ADT_SUPPRESS_GENERATION.

    super->constructor( previous = i_previous ).

    me->textid = value #( ).

    me->if_t100_dyn_msg~msgv1 = 'Entity not allowed'(000).

    me->if_t100_dyn_msg~msgty = 'E'.

    me->if_t100_message~t100key = value #( msgid = '000'
                                           msgno = 00
                                           attr1 = 'IF_T100_DYN_MSG~MSGV1' ).

  endmethod.

endclass.
