*CLASS lcl_bpassign_helper IMPLEMENTATION.
*
*  METHOD get_db_delta.

*    CLEAR: et_zmm_jptbupaassign_insert, et_zmm_jptbupaassign_update, et_zmm_jptbupaassign_delete.
*
*    "get insert values
*    LOOP AT gt_zmm_jptbupaassign_mem INTO DATA(ls_zmm_jptbupaassign_u).
*
*      IF NOT line_exists( gt_zmm_jptbupaassign_db[ KEY main_key
*                                                  matnr = ls_zmm_jptbupaassign_u-matnr
*                                                  partner = ls_zmm_jptbupaassign_u-partner
*                                                  rltyp  = ls_zmm_jptbupaassign_u-rltyp
*                                                  order_nr = ls_zmm_jptbupaassign_u-order_nr ] ).
*
*
*
*
*
*
*
*
*        INSERT ls_zmm_jptbupaassign_u INTO TABLE et_zmm_jptbupaassign_insert.
*      ENDIF.
*    ENDLOOP.
*
*    "get update_values
*    LOOP AT gt_zmm_jptbupaassign_mem INTO ls_zmm_jptbupaassign_u.
*
**      IF line_exists( gt_zmm_JPTBUPAASSIGN_db[ matnr = ls_zmm_JPTBUPAASSIGN_u-matnr
**                                              idcodetype = ls_zmm_JPTBUPAASSIGN_u-idcodetype
**                                              identcode  = ls_zmm_JPTBUPAASSIGN_u-identcode ] ) AND
**         ls_zmm_JPTBUPAASSIGN_u-xmainidcode NE ls_zmm_JPTBUPAASSIGN_db-xmainidcode.
*
*
*      READ TABLE gt_zmm_jptbupaassign_db INTO DATA(ls_zmm_jptbupaassign_db) WITH TABLE KEY main_key COMPONENTS
*      matnr    = ls_zmm_jptbupaassign_u-matnr
*      partner  = ls_zmm_jptbupaassign_u-partner
*      rltyp    = ls_zmm_jptbupaassign_u-rltyp
*      order_nr = ls_zmm_jptbupaassign_u-order_nr .
**        matnr      = ls_zmm_JPTBUPAASSIGN_u-matnr
**        idcodetype = ls_zmm_JPTBUPAASSIGN_u-idcodetype
**        identcode  = ls_zmm_JPTBUPAASSIGN_u-identcode.
*
*      IF sy-subrc EQ 0 AND ls_zmm_jptbupaassign_u-xmainidcode NE ls_zmm_jptbupaassign_db-xmainidcode.
*        INSERT ls_zmm_jptbupaassign_u INTO TABLE et_zmm_jptbupaassign_update.
*      ENDIF.
*    ENDLOOP.
*
*    "get delete values
*    LOOP AT gt_zmm_jptbupaassign_db INTO ls_zmm_jptbupaassign_db.
*
*      IF NOT line_exists( gt_zmm_jptbupaassign_mem[ KEY main_key
*                                                   matnr = ls_zmm_jptbupaassign_u-matnr
*                                                  partner = ls_zmm_jptbupaassign_u-partner
*                                                  rltyp  = ls_zmm_jptbupaassign_u-rltyp
*                                                  order_nr = ls_zmm_jptbupaassign_u-order_nr ] ).
*
*        INSERT ls_zmm_jptbupaassign_db INTO TABLE et_zmm_jptbupaassign_delete.
*      ENDIF.
*    ENDLOOP.

*  ENDMETHOD.
*
*ENDCLASS.
