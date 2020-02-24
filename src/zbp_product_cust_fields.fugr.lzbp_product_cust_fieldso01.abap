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
  IF sy-ucomm = 'ZBP_CALL'.
    CLEAR zzgt_bpassign.
    CALL FUNCTION 'Z_MM_BPASSIGN_GET_SUB'
      EXPORTING
        iv_matnr             = rmmg1-matnr
      IMPORTING
        et_jptbupaassign_mem = zzgt_zmm_bpassign_mem
        et_jptbupaassign_db  = zzgt_zmm_bpassign_db.

*    MOVE-CORRESPONDING zzgt_zmm_bpassign_mem TO zzgt_bpassign.
    LOOP AT zzgt_zmm_bpassign_mem INTO DATA(ls_bpassign_mem).
*      MATNR
      APPEND INITIAL LINE TO zzgt_bpassign ASSIGNING FIELD-SYMBOL(<ls_bpassign>).
      <ls_bpassign>-bu_partner = ls_bpassign_mem-partner.
      <ls_bpassign>-bu_rltyp   = ls_bpassign_mem-rltyp.
      <ls_bpassign>-order_role = ls_bpassign_mem-order_role.
      <ls_bpassign>-date_from  = ls_bpassign_mem-date_from.
      <ls_bpassign>-DATE_to    = ls_bpassign_mem-date_to.
*ORDER_ROLE
*NODE_KEY
*ADR_KIND
*TEXT
    ENDLOOP.

  ENDIF.
ENDMODULE.

MODULE zz_bpassign_init_tc OUTPUT.

  IF rmmzu-einit IS INITIAL.
    rmmzu-einit = x.
    CLEAR: zzgv_bpassign_first_line.
  ENDIF.

  CLEAR: zzgv_bpassign_line_no.

  DESCRIBE TABLE zzgt_bpassign LINES zzgv_bpassign_lines.

  IF NOT flg_tc IS INITIAL.
    REFRESH CONTROL 'ZZTC_BUPA_ASSIGN' FROM SCREEN sy-dynnr.
    zztc_bupa_assign-lines    = zzgv_bpassign_lines.
    zztc_bupa_assign-top_line = zzgv_bpassign_first_line + 1.
    zzgv_bpassign_topl_buf    = zztc_bupa_assign-top_line.
    ASSIGN zztc_bupa_assign TO <f_tc>.
  ENDIF.

ENDMODULE.

MODULE zz_bpassign_display OUTPUT.

  zzgv_bpassign_current_line = zzgv_bpassign_first_line + sy-stepl.

  READ TABLE zzgt_bpassign INTO zzgs_bpassign INDEX zzgv_bpassign_current_line.

  IF sy-subrc = 0.
    MOVE-CORRESPONDING zzgs_bpassign TO zrjpbupat1.
    PERFORM get_bp_text.
    PERFORM get_role_text.
  ENDIF.

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
  zzgv_bpassign_entries_c   = zzgv_bpassign_lines.
  IF zzgv_bpassign_lines = 0.
    zzgv_bpassign_first_line_c = 0.
  ELSE.
    zzgv_bpassign_first_line_c = zzgv_bpassign_first_line + 1.
  ENDIF.
ENDMODULE.

MODULE zz_bpassign_set_sub OUTPUT.
  CLEAR: zzgt_zmm_bpassign_mem.

  LOOP AT zzgt_bpassign INTO zzgs_bpassign.
    MOVE-CORRESPONDING zzgs_bpassign TO zzgs_zmm_bpassign_mem.
    zzgs_zmm_bpassign_mem-matnr = rmmg1-matnr.
*    zzgs_zmm_bpassign_mem-mandt = sy-mandt.
    INSERT zzgs_zmm_bpassign_mem INTO TABLE zzgt_zmm_bpassign_mem.
  ENDLOOP.
*
  CALL FUNCTION 'Z_MM_BPASSIGN_SET_SUB'
    EXPORTING
      iv_matnr             = rmmg1-matnr
      it_jptbupaassign_mem = zzgt_zmm_bpassign_mem.

ENDMODULE.


*&---------------------------------------------------------------------*
*&      Module  GET_BP_TEXT  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM get_bp_text.

  IF zrjpbupat1-bu_partner IS NOT INITIAL.
*    BREAK thak04.
    DATA lv_partner_name TYPE bus000flds-descrip.
    CALL FUNCTION 'BUP_PARTNER_DESCRIPTION_GET'
      EXPORTING
        i_partner         = zrjpbupat1-bu_partner
        i_xmemory         = 'X'
        i_xwa             = 'X'
*       I_VALDT           = SY-DATLO
      IMPORTING
        e_description     = lv_partner_name
*       E_DESCRIPTION_NAME =
      EXCEPTIONS
        partner_not_found = 1
        wrong_parameters  = 2.
    zrjpbupat1-bupa_bez = lv_partner_name.
  ENDIF.

ENDFORM..
*&---------------------------------------------------------------------*
*&      Module  GET_ROLE_TEXT  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM get_role_text.
  IF zrjpbupat1-bu_rltyp IS NOT INITIAL.
*    BREAK thak04.
    SELECT SINGLE rltitl
      FROM tb003t
      INTO zrjpbupat1-role_bez
      WHERE spras = sy-langu
        AND role  = zrjpbupat1-bu_rltyp.
  ENDIF.
ENDFORM.
