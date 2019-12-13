
*{   INSERT         S4SK900317                                        1
*&---------------------------------------------------------------------*
*& Module ZZ_SET_IDCODE_FIELDS OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE zz_set_bpassign_fields OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
  CHECK rmmg1-matnr IS NOT INITIAL.

  CALL FUNCTION 'Z_MM_BPASSIGN_GET_SUB'
    EXPORTING
      iv_matnr             = rmmg1-matnr
    IMPORTING
      et_jptbupaassign_mem = zzgt_zmm_bpassign_mem
      et_jptbupaassign_db  = zzgt_zmm_bpassign_db.
  .


*  ZJbpassign = zzgt_zmm_jbpassign_db[ xmainidcode = 'X' ].
*  READ TABLE zzgt_zmm_jbpassign_db INTO ZJbpassign WITH KEY xmainidcode = 'X'.
*  READ TABLE zzgt_zmm_bpassign_mem INTO zrjpbupat1 WITH KEY xmainidcode = 'X'.

  IF zzgt_zmm_bpassign_mem IS NOT INITIAL.
    zzgv_bp_assigned = 'X'.
  ENDIF.


ENDMODULE.
*----------------------------------------------------------------------*
***INCLUDE LZMM_PRODUCT_CUST_FIELDSI01.
*----------------------------------------------------------------------*

MODULE zz_bpassign_get_sub INPUT.
  CALL FUNCTION 'Z_MM_BPASSIGN_GET_SUB'
    EXPORTING
      iv_matnr        = rmmg1-matnr
    IMPORTING
      et_bpassign_mem = zzgt_zmm_bpassign_mem
      et_bpassign_db  = zzgt_zmm_bpassign_db.
ENDMODULE.

MODULE zz_bpassign_get_line INPUT.

  zzgv_bpassign_current_line = zzgv_bpassign_first_line + sy-stepl.

ENDMODULE.

*MODULE zz_bpassign_check INPUT.
*
*  IF NOT ( t130m-aktyp = aktypa
*           OR t130m-aktyp = aktypz    "view
*           OR rmmg2-manbr NE space ). "central authority
*
*    IF zzgv_bpassign_current_line LE zzgv_bpassign_lines.
*      MODIFY zzgt_bpassign_pre FROM zzgs_bpassign INDEX zzgv_bpassign_current_line.
*    ENDIF.
*
*    zjptidcdassig-matnr = rmmg1-matnr. "needed, because in GUI MATNR is not available.
*    CALL FUNCTION 'Z_MM_JPTIDCDASS_CHECK_IDCODE'
*      EXPORTING
*        it_bpassign_gui  = zzgt_bpassign_pre
*      CHANGING
*        cs_jptidcdassig = zjptidcdassig
*      EXCEPTIONS
*        type_not_exist  = 1
*        cds_calculated  = 2
*        OTHERS          = 3.
*
*    IF sy-subrc EQ 1.
*      "message only for non empty lines
*      IF zjptidcdassig-idcodetype IS NOT INITIAL OR
*         zjptidcdassig-identcode IS NOT INITIAL.
*
*        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*      ENDIF.
*    ELSEIF sy-subrc EQ 2.
*      "message only for new entries
*      READ TABLE zzgt_zmm_jptidcdassig_db TRANSPORTING NO FIELDS "#EC CI_SORTSEQ
*        WITH KEY
*          idcodetype = zjptidcdassig-idcodetype
*          identcode  = zjptidcdassig-identcode ##PRIMKEY[TYPES_KEY].
*
*      IF sy-subrc NE 0.
*        CLEAR: zjptidcdassig.
*        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*          WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*      ENDIF.
*    ELSEIF sy-subrc NE 0.
*      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*    ENDIF.
*  ENDIF.
*
*
*ENDMODULE.

MODULE zz_bpassign_modify_tab INPUT.

  IF zrjpbupat1 IS NOT INITIAL.

    IF zzgv_bpassign_current_line > zzgv_bpassign_lines.
      APPEND zrjpbupat1 TO zzgt_bpassign.
      zzgv_bpassign_lines = zzgv_bpassign_lines + 1.
    ELSE.
      MODIFY zzgt_bpassign FROM zrjpbupat1 INDEX zzgv_bpassign_current_line.
    ENDIF.

  ENDIF.

ENDMODULE.

MODULE zz_bpassign_okcode INPUT.

  CHECK t130m-aktyp NE aktypa AND t130m-aktyp NE aktypz.
*  CHECK bildflag IS INITIAL.

*  CASE rmmzu-okcode.
  CASE sy-ucomm.
    WHEN zzgc_fcode_zbp. "delete entry

      bildflag = x.
      CLEAR rmmzu-okcode.

      GET CURSOR LINE zzgv_bpassign_line_no.
      zzgv_bpassign_current_line = zzgv_bpassign_first_line + zzgv_bpassign_line_no.

      READ TABLE zzgt_bpassign TRANSPORTING NO FIELDS INDEX zzgv_bpassign_current_line.
      IF sy-subrc = 0.
        DELETE zzgt_bpassign INDEX zzgv_bpassign_current_line.
      ENDIF.

  ENDCASE.
*}   REPLACE

ENDMODULE.

MODULE zz_bpassign_set_first.
  "scroll in table-control
  IF NOT flg_tc IS INITIAL.
    zzgv_bpassign_first_line = zztc_bupa_assign-top_line - 1.
    IF zztc_bupa_assign-top_line NE zzgv_bpassign_topl_buf.
      zzgv_bpassign_topl_buf = zztc_bupa_assign-top_line.
      PERFORM param_set.
    ENDIF.
  ENDIF.
ENDMODULE.

MODULE zz_bpassign_set_sub INPUT.
*{   REPLACE        S4SK900317                                        1
*\  CLEAR: zzgt_zmm_bpassign_mem.
*\
*\  LOOP AT zzgt_bpassign INTO zzgs_bpassign.
*\    MOVE-CORRESPONDING zzgs_bpassign TO zzgs_zmm_bpassign_mem.
*\    zzgs_zmm_bpassign_mem-matnr = rmmg1-matnr.
*\    zzgs_zmm_bpassign_mem-mandt = sy-mandt.
*\    INSERT zzgs_zmm_bpassign_mem INTO TABLE zzgt_zmm_bpassign_mem.
*\  ENDLOOP.
*\
*\  CALL FUNCTION 'Z_MM_JPTIDCDASS_SET_SUB'
*\    EXPORTING
*\      iv_matnr            = rmmg1-matnr
*\      it_bpassign_mem = zzgt_zmm_bpassign_mem.
* IF rmmzu-okcode = 'ENTR'.
  CASE sy-ucomm.
    WHEN 'ENTR'.
      CLEAR: zzgt_zmm_bpassign_mem.

      LOOP AT zzgt_bpassign INTO zzgs_bpassign.
*        MOVE-CORRESPONDING zzgs_bpassign TO zzgs_zmm_bpassign_mem.
        zzgs_zmm_bpassign_mem-partner = zzgs_bpassign-bu_partner.
        zzgs_zmm_bpassign_mem-rltyp = zzgs_bpassign-bu_rltyp.
        zzgs_zmm_bpassign_mem-date_from = zzgs_bpassign-date_from.
        zzgs_zmm_bpassign_mem-date_to = zzgs_bpassign-date_to.
        zzgs_zmm_bpassign_mem-order_role = zzgs_bpassign-order_role.
        zzgs_zmm_bpassign_mem-matnr = rmmg1-matnr.
        zzgs_zmm_bpassign_mem-client = sy-mandt.
        INSERT zzgs_zmm_bpassign_mem INTO TABLE zzgt_zmm_bpassign_mem.
      ENDLOOP.

      CALL FUNCTION 'Z_MM_BPASSIGN_SET_SUB'
        EXPORTING
          iv_matnr             = rmmg1-matnr
          it_jptbupaassign_mem = zzgt_zmm_bpassign_mem.

      zzgv_bp_assigned = 'X'.

      SET SCREEN 0.
      LEAVE SCREEN.
    WHEN 'EABR'.
      SET SCREEN 0.
      LEAVE SCREEN.
    WHEN OTHERS.
  ENDCASE.
*}   REPLACE
ENDMODULE.
