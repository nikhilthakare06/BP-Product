FUNCTION z_mm_bpassign_db_post.
*"----------------------------------------------------------------------
*"*"Update Function Module:
*"
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IT_ZMM_JPTBUPAASSIGN_INSERT) TYPE  ZMM_T_JPTBUPAASSIGN
*"     VALUE(IT_ZMM_JPTBUPAASSIGN_UPDATE) TYPE  ZMM_T_JPTBUPAASSIGN
*"     VALUE(IT_ZMM_JPTBUPAASSIGN_DELETE) TYPE  ZMM_T_JPTBUPAASSIGN
*"----------------------------------------------------------------------
  "insert
  IF lines( it_zmm_JPTBUPAASSIGN_insert ) GT 0.
    INSERT zjptbupaassign FROM TABLE it_zmm_jptbupaassign_insert. "#EC CI_SUBRC
  ENDIF.

  "update
  IF lines( it_zmm_JPTBUPAASSIGN_update ) GT 0.
    MODIFY zjptbupaassign FROM TABLE it_zmm_jptbupaassign_update. "#EC CI_SUBRC
  ENDIF.

  "delete
  IF lines( it_zmm_JPTBUPAASSIGN_delete ) GT 0.
    DELETE zjptbupaassign FROM TABLE it_zmm_jptbupaassign_delete. "#EC CI_SUBRC
  ENDIF.

ENDFUNCTION.
