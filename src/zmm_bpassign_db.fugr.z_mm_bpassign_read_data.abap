FUNCTION z_mm_bpassign_read_data.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_MATNR) TYPE  MATNR
*"----------------------------------------------------------------------
  IF lines( gt_zmm_jptbupaassign_db ) IS INITIAL.
    SELECT * FROM zjptbupaassign
      INTO TABLE @gt_zmm_jptbupaassign_db
      WHERE
        matnr EQ @iv_matnr.                         "#EC CI_SUBRC

    gt_zmm_jptbupaassign_mem = gt_zmm_jptbupaassign_db.
  ENDIF.

ENDFUNCTION.
