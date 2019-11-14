FUNCTION z_mm_bpassign_read_data.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IS_RMMG1) TYPE  RMMG1
*"     REFERENCE(IV_AKTYP) TYPE  T130M-AKTYP
*"----------------------------------------------------------------------
  IF lines( gt_zmm_jptbupaassign_db ) IS INITIAL.
    SELECT * FROM zjptbupaassign
      INTO TABLE @gt_zmm_jptbupaassign_db
      WHERE
        matnr EQ @is_rmmg1-matnr.                         "#EC CI_SUBRC

    gt_zmm_jptbupaassign_mem = gt_zmm_jptbupaassign_db.
  ENDIF.

ENDFUNCTION.
