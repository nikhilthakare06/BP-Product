*CLASS ltc_get_db_delta DEFINITION FINAL FOR TESTING
*  DURATION SHORT
*  RISK LEVEL HARMLESS.
*
*  PRIVATE SECTION.
*    METHODS:
*      setup,
*      single_values FOR TESTING RAISING cx_static_check.
*ENDCLASS.


*CLASS ltc_get_db_delta IMPLEMENTATION.
*  METHOD setup.
*
*  ENDMETHOD.
*
*  METHOD single_values.
    "given
*    gt_zmm_JPTBUPAASSIGN_db = VALUE #( ( matnr = '000000000123456789' idcodetype = 'I001' identcode = '123' xmainidcode = ''  )
*                                      ( matnr = '000000000123456789' idcodetype = 'I002' identcode = '456' xmainidcode = ''  )
*                                      ( matnr = '000000000123456789' idcodetype = 'I003' identcode = '456' xmainidcode = 'X' ) ).
*
*    gt_zmm_JPTBUPAASSIGN_mem = VALUE #( ( matnr = '000000000123456789' idcodetype = 'I001' identcode = '123' xmainidcode = 'X' )
*                                     ( matnr = '000000000123456789' idcodetype = 'I002' identcode = '456' xmainidcode = ''  )
*                                     ( matnr = '000000000123456789' idcodetype = 'I004' identcode = '789' xmainidcode = ''  ) ).
*    "when
*    lcl_idcode_helper=>get_db_delta(
*      IMPORTING
*        et_zmm_JPTBUPAASSIGN_insert = DATA(lt_zmm_JPTBUPAASSIGN_insert)
*        et_zmm_JPTBUPAASSIGN_update = DATA(lt_zmm_JPTBUPAASSIGN_update)
*        et_zmm_JPTBUPAASSIGN_delete = DATA(lt_zmm_JPTBUPAASSIGN_delete) ).
*
*    "then
*    cl_abap_unit_assert=>assert_equals(
*      EXPORTING
*        act                  = lt_zmm_JPTBUPAASSIGN_insert
*        exp                  = VALUE zmm_t_JPTBUPAASSIGN( ( matnr = '000000000123456789'
*                                                           idcodetype = 'I004'
*                                                           identcode = '789'
*                                                           xmainidcode = '' ) ) ). "#EC CI_FLDEXT_OK
*
*    cl_abap_unit_assert=>assert_equals(
*      EXPORTING
*        act                  = lt_zmm_JPTBUPAASSIGN_update
*        exp                  = VALUE zmm_t_JPTBUPAASSIGN( ( matnr = '000000000123456789'
*                                                           idcodetype = 'I001'
*                                                           identcode = '123'
*                                                           xmainidcode = 'X' ) ) ). "#EC CI_FLDEXT_OK
*
*    cl_abap_unit_assert=>assert_equals(
*      EXPORTING
*        act                  = lt_zmm_JPTBUPAASSIGN_delete
*        exp                  = VALUE zmm_t_JPTBUPAASSIGN( ( matnr = '000000000123456789'
*                                                           idcodetype = 'I003'
*                                                           identcode = '456'
*                                                           xmainidcode = 'X' ) ) ). "#EC CI_FLDEXT_OK
*
*  ENDMETHOD.
*
*ENDCLASS.
