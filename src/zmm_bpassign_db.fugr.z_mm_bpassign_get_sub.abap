FUNCTION z_mm_bpassign_get_sub.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_MATNR) TYPE  MARA-MATNR DEFAULT SPACE
*"  EXPORTING
*"     REFERENCE(ET_JPTBUPAASSIGN_MEM) TYPE  ZMM_T_JPTBUPAASSIGN
*"     REFERENCE(ET_JPTBUPAASSIGN_DB) TYPE  ZMM_T_JPTBUPAASSIGN
*"----------------------------------------------------------------------
  CLEAR: et_jptbupaassign_mem, et_jptbupaassign_db.

  IF iv_matnr IS INITIAL.
    et_jptbupaassign_mem = gt_zmm_jptbupaassign_mem.
    et_jptbupaassign_db = gt_zmm_jptbupaassign_db.
  ELSE.
    et_jptbupaassign_mem = FILTER #( gt_zmm_jptbupaassign_mem WHERE client = sy-mandt AND  matnr = iv_matnr ). "mandt = sy-mandt AND
    et_jptbupaassign_db = FILTER #( gt_zmm_jptbupaassign_db WHERE client = sy-mandt AND matnr = iv_matnr ). "mandt = sy-mandt AND
  ENDIF.

ENDFUNCTION.
