FUNCTION Z_MM_BPASSIGN_DB_POST.
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
    INSERT zJPTBUPAASSIGN FROM TABLE it_zmm_JPTBUPAASSIGN_insert. "#EC CI_SUBRC
  ENDIF.

  "update
  IF lines( it_zmm_JPTBUPAASSIGN_update ) GT 0.
    MODIFY zJPTBUPAASSIGN FROM TABLE it_zmm_JPTBUPAASSIGN_update. "#EC CI_SUBRC
  ENDIF.

  "delete
  IF lines( it_zmm_JPTBUPAASSIGN_delete ) GT 0.
    DELETE zJPTBUPAASSIGN FROM TABLE it_zmm_JPTBUPAASSIGN_delete. "#EC CI_SUBRC
  ENDIF.

ENDFUNCTION.
