FUNCTION z_mm_bpassign_change_check.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  CHANGING
*"     REFERENCE(CV_HAS_CHANGES) TYPE  T130F-KZREF
*"----------------------------------------------------------------------
  IF gt_zmm_jptbupaassign_db NE gt_zmm_jptbupaassign_mem.
    cv_has_changes = abap_true.
  ENDIF.

ENDFUNCTION.
