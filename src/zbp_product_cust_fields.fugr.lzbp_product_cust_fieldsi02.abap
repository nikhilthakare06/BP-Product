*----------------------------------------------------------------------*
***INCLUDE LZMM_PRODUCT_CUST_FIELDSI02.
*----------------------------------------------------------------------*

*{   INSERT         S4SK900317                                        1
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9003  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9003 INPUT.
* DATA: lt_zmm_jptidcdassig_insert TYPE zmm_t_jptidcdassig,
*       lt_zmm_jptidcdassig_update TYPE zmm_t_jptidcdassig,
*       lt_zmm_jptidcdassig_delete TYPE zmm_t_jptidcdassig.
*       ls_jpdid TYPE zjptidcdassig.
*BREAK THAK04.
   IF  sy-ucomm = 'ZBP_CALL'.
    CALL SCREEN '9005' STARTING AT 06 04
                       ENDING   AT 88 24.

*  CALL SCREEN con_dynpro_1000 STARTING AT 06 04
*                              ENDING   AT 88 24.
   ENDIF.
**CHECK ZJPTIDCDASSIG-IDCODETYPE IS NOT INITIAL AND ZJPTIDCDASSIG-IDENTCODE IS NOT INITIAL.
*
*CASE sy-ucomm.
*  WHEN 'BU'.
**    CALL FUNCTION 'Z_MM_JPTIDCDASS_GET_DB_DELTA'
**      IMPORTING
**        et_zmm_jptidcdassig_insert = lt_zmm_jptidcdassig_insert
**        et_zmm_jptidcdassig_update = lt_zmm_jptidcdassig_update
**        et_zmm_jptidcdassig_delete = lt_zmm_jptidcdassig_delete.
*      READ TABLE zzgt_zmm_jptidcdassig_db INTO DATA(ls_jpdid) WITH KEY IDCODETYPE = ZJPTIDCDASSIG-IDCODETYPE
*                                                                       IDENTCODE = ZJPTIDCDASSIG-IDENTCODE.
**      ls_jpdid = zzgt_zmm_jptidcdassig_db[ IDCODETYPE = ZJPTIDCDASSIG-IDCODETYPE IDENTCODE = ZJPTIDCDASSIG-IDENTCODE ]. "XMAINIDCODE = 'X'
*    IF sy-subrc NE 0.
*
*        READ TABLE zzgt_zmm_jptidcdassig_db INTO ls_jpdid WITH KEY XMAINIDCODE = 'X'.
*        IF sy-subrc EQ 0.
*          CLEAR ls_jpdid-xmainidcode.
*          INSERT ls_jpdid INTO TABLE lt_zmm_jptidcdassig_update.
*        ENDIF.
*        zjptidcdassig-mandt       = sy-mandt.
*        zjptidcdassig-matnr       = rmmg1-matnr.
*        zjptidcdassig-xmainidcode = 'X'.
**        INSERT ZJPTIDCDASSIG INTO TABLE lt_zmm_jptidcdassig_insert.
*        INSERT ZJPTIDCDASSIG INTO TABLE lt_zmm_jptidcdassig_update.
**        CALL FUNCTION 'Z_MM_JPTIDCDASS_DB_POST'
**          EXPORTING
**            it_zmm_jptidcdassig_insert = lt_zmm_jptidcdassig_insert
**            it_zmm_jptidcdassig_update = lt_zmm_jptidcdassig_update
**            it_zmm_jptidcdassig_delete = lt_zmm_jptidcdassig_delete.
*        CALL FUNCTION 'Z_MM_JPTIDCDASS_SET_SUB'
*          EXPORTING
*            iv_matnr                  = rmmg1-matnr
*            it_jptidcdassig_mem       = lt_zmm_jptidcdassig_update
*                  .
*
*
*     ENDIF.
**  WHEN .
*  WHEN OTHERS.
*ENDCASE.
ENDMODULE.
*}   INSERT

*{   INSERT         S4SK900317                                        2
*&---------------------------------------------------------------------*
*&      Module  ISM_OKCODE_EABR  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE ism_okcode_eabr INPUT.
  CASE sy-ucomm.
    WHEN 'EABR'.
     SET SCREEN 0.
      LEAVE SCREEN.
  ENDCASE.
ENDMODULE.
*}   INSERT
