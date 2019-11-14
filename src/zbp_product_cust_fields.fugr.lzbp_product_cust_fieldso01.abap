*----------------------------------------------------------------------*
***INCLUDE LZMM_PRODUCT_CUST_FIELDSO01.
*----------------------------------------------------------------------*

MODULE zz_get_hierarchlvl OUTPUT.
*  CLEAR: zzgv_ismhierarchlvl.
*
*  SELECT SINGLE zzismhierarchlvl FROM a_product
*    WHERE
*      product EQ @mara-matnr
*    INTO @zzgv_ismhierarchlvl.
ENDMODULE.

MODULE zz_bpassign_get_sub OUTPUT.
IF SY-UCOMM = 'PUSHID'.
*  CALL FUNCTION 'Z_MM_JPTIDCDASS_GET_SUB'
*    EXPORTING
*      iv_matnr            = rmmg1-matnr
*    IMPORTING
*      et_jptidcdassig_mem = zzgt_zmm_jptidcdassig_mem
*      et_jptidcdassig_db  = zzgt_zmm_jptidcdassig_db.
*
*  MOVE-CORRESPONDING zzgt_zmm_jptidcdassig_mem TO zzgt_bpassign.
ENDIF.
*}   REPLACE
ENDMODULE.

MODULE zz_bpassign_init_tc OUTPUT.

  IF rmmzu-einit IS INITIAL.
    rmmzu-einit = x.
    CLEAR: zzgv_bpassign_first_line.
  ENDIF.

  CLEAR: zzgv_bpassign_line_no.

*  DESCRIBE TABLE zzgt_bpassign LINES zzgv_bpassign_lines.
*
*  IF NOT flg_tc IS INITIAL.
*    REFRESH CONTROL 'ZZTC_bpassign' FROM SCREEN sy-dynnr.
*    zztc_bpassign-lines    = zzgv_bpassign_lines.
*    zztc_bpassign-top_line = zzgv_bpassign_first_line + 1.
*    zzgv_bpassign_topl_buf = zztc_bpassign-top_line.
*    ASSIGN zztc_bpassign TO <f_tc>.
*  ENDIF.

ENDMODULE.

MODULE zz_bpassign_display OUTPUT.

  zzgv_bpassign_current_line = zzgv_bpassign_first_line + sy-stepl.

*  READ TABLE zzgt_bpassign INTO zzgs_bpassign INDEX zzgv_bpassign_current_line.
*
*  IF sy-subrc = 0.
*    MOVE-CORRESPONDING zzgs_bpassign TO zjptidcdassig.
*  ENDIF.

ENDMODULE.

MODULE zz_bpassign_fieldselection OUTPUT.
  zzgv_bpassign_current_line = zzgv_bpassign_first_line + sy-stepl.

*  READ TABLE zzgt_bpassign INTO zzgs_bpassign INDEX zzgv_bpassign_current_line.
*
*  IF sy-subrc = 0.
*
*    IF t130m-aktyp = aktypa OR t130m-aktyp = aktypz   "view
*       OR rmmg2-manbr NE space.                       "central authority
*
*      LOOP AT SCREEN.
*
*        READ TABLE fauswtab WITH KEY fname = screen-name BINARY SEARCH. "#EC CI_CONV_OK
*        IF sy-subrc = 0.
*          screen-active      = fauswtab-kzact.
*          screen-input       = fauswtab-kzinp.
*          screen-intensified = fauswtab-kzint.
*          screen-invisible   = fauswtab-kzinv.
*          screen-output      = fauswtab-kzout.
*          "don't set as required field
*          IF screen-group1(1) NE 'T' AND screen-group1 NE 'F02'.
*            screen-required    = fauswtab-kzreq.
*          ENDIF.
*        ENDIF.
*
*        screen-required = 0.
*        screen-input    = 0.
*
*        "central authority
*        IF rmmg2-manbr = manbr1.       "only read
*        ENDIF.
*        IF rmmg2-manbr = manbr2.       "no read
*          screen-invisible = 1.
*          screen-active    = 0.
*          screen-output    = 0.
*        ENDIF.
*        MODIFY SCREEN.
*      ENDLOOP.
*
*    ELSE.                              "create / modify
*
*      LOOP AT SCREEN.
*
*        READ TABLE fauswtab WITH KEY fname = screen-name BINARY SEARCH. "#EC CI_CONV_OK
*        IF sy-subrc = 0.
*          screen-active      = fauswtab-kzact.
*          screen-input       = fauswtab-kzinp.
*          screen-intensified = fauswtab-kzint.
*          screen-invisible   = fauswtab-kzinv.
*          screen-output      = fauswtab-kzout.
*
*          IF screen-group1(1) NE 'T' AND screen-group1 NE 'F02'.
*            screen-required    = fauswtab-kzreq.
*          ENDIF.
*        ENDIF.
*
*        MODIFY SCREEN.
*      ENDLOOP.
*    ENDIF.
*
*  ELSE.
*
*    "set empty lines as output only
*    IF t130m-aktyp = aktypa OR t130m-aktyp = aktypz  "view
*       OR rmmg2-manbr NE space.  "central authority
*
*      LOOP AT SCREEN.
*
*        READ TABLE fauswtab WITH KEY fname = screen-name BINARY SEARCH. "#EC CI_CONV_OK
*        IF sy-subrc = 0.
*          screen-active      = fauswtab-kzact.
*          screen-input       = fauswtab-kzinp.
*          screen-intensified = fauswtab-kzint.
*          screen-invisible   = fauswtab-kzinv.
*          screen-output      = fauswtab-kzout.
*          screen-required    = 0. "no required fields on an empty line
*        ENDIF.
*
*        screen-input       = 0.
*        screen-required    = 0.
*
*        IF rmmg2-manbr = manbr1.       "only view
*        ENDIF.
*        IF rmmg2-manbr = manbr2.       "no view
*          screen-invisible = 1.
*          screen-active    = 0.
*          screen-output    = 0.
*        ENDIF.
*        MODIFY SCREEN.
*      ENDLOOP.
*
*    ELSE.
*
*      LOOP AT SCREEN.
*        READ TABLE fauswtab WITH KEY fname = screen-name BINARY SEARCH. "#EC CI_CONV_OK
*        IF sy-subrc = 0.
*          screen-active      = fauswtab-kzact.
*          screen-input       = fauswtab-kzinp.
*          screen-intensified = fauswtab-kzint.
*          screen-invisible   = fauswtab-kzinv.
*          screen-output      = fauswtab-kzout.
*          screen-required    = 0. "no required fields on an empty line
*        ENDIF.
*
*        MODIFY SCREEN.
*      ENDLOOP.
*    ENDIF.
*  ENDIF.

ENDMODULE.

MODULE zz_bpassign_get_entries OUTPUT.
*  zzgv_bpassign_entries_c   = zzgv_bpassign_lines.
*  IF zzgv_bpassign_lines = 0.
*    zzgv_bpassign_first_line_c = 0.
*  ELSE.
*    zzgv_bpassign_first_line_c = zzgv_bpassign_first_line + 1.
*  ENDIF.
ENDMODULE.

MODULE zz_bpassign_set_sub OUTPUT.
*  CLEAR: zzgt_zmm_jptidcdassig_mem.
*
*  LOOP AT zzgt_bpassign INTO zzgs_bpassign.
*    MOVE-CORRESPONDING zzgs_bpassign TO zzgs_zmm_jptidcdassig_mem.
*    zzgs_zmm_jptidcdassig_mem-matnr = rmmg1-matnr.
*    zzgs_zmm_jptidcdassig_mem-mandt = sy-mandt.
*    INSERT zzgs_zmm_jptidcdassig_mem INTO TABLE zzgt_zmm_jptidcdassig_mem.
*  ENDLOOP.
*
*  CALL FUNCTION 'Z_MM_JPTIDCDASS_SET_SUB'
*    EXPORTING
*      iv_matnr            = rmmg1-matnr
*      it_jptidcdassig_mem = zzgt_zmm_jptidcdassig_mem.
ENDMODULE.
