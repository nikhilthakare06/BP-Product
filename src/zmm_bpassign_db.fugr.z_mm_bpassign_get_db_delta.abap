FUNCTION z_mm_bpassign_get_db_delta.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  EXPORTING
*"     REFERENCE(ET_ZMM_JPTBUPAASSIGN_INSERT) TYPE  ZMM_T_JPTBUPAASSIGN
*"     REFERENCE(ET_ZMM_JPTBUPAASSIGN_UPDATE) TYPE  ZMM_T_JPTBUPAASSIGN
*"     REFERENCE(ET_ZMM_JPTBUPAASSIGN_DELETE) TYPE  ZMM_T_JPTBUPAASSIGN
*"----------------------------------------------------------------------
  CLEAR: et_zmm_jptbupaassign_insert, et_zmm_jptbupaassign_update, et_zmm_jptbupaassign_delete.
*
*  lcl_bpassign_helper=>get_db_delta(
*    IMPORTING
*      et_zmm_JPTBUPAASSIGN_insert = et_zmm_JPTBUPAASSIGN_insert
*      et_zmm_JPTBUPAASSIGN_update = et_zmm_JPTBUPAASSIGN_update
*      et_zmm_JPTBUPAASSIGN_delete = et_zmm_JPTBUPAASSIGN_delete ).

ENDFUNCTION.
