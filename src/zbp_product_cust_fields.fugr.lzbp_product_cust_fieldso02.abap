*----------------------------------------------------------------------*
***INCLUDE LZMM_PRODUCT_CUST_FIELDSO02.
*----------------------------------------------------------------------*

*{   INSERT         S4SK900317                                        1
*&---------------------------------------------------------------------*
*& Module ZZ_SET_IDCODE_FIELDS OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE zz_set_idcode_fields OUTPUT.
** SET PF-STATUS 'xxxxxxxx'.
** SET TITLEBAR 'xxx'.
*  CHECK rmmg1-matnr IS NOT INITIAL.
*  CALL FUNCTION 'Z_MM_JPTIDCDASS_GET_SUB'
*    EXPORTING
*      iv_matnr            = rmmg1-matnr
*    IMPORTING
*      et_jptidcdassig_mem = zzgt_zmm_jptidcdassig_mem
*      et_jptidcdassig_db  = zzgt_zmm_jptidcdassig_db.
*
**  ZJPTIDCDASSIG = zzgt_zmm_jptidcdassig_db[ xmainidcode = 'X' ].
**  READ TABLE zzgt_zmm_jptidcdassig_db INTO ZJPTIDCDASSIG WITH KEY xmainidcode = 'X'.
*  READ TABLE zzgt_zmm_jptidcdassig_mem INTO ZJPTIDCDASSIG WITH KEY xmainidcode = 'X'.
*
**  DESCRIBE TABLE zzgt_zmm_jptidcdassig_db LINES DATA(lv_count).
*  DESCRIBE TABLE zzgt_zmm_jptidcdassig_mem LINES DATA(lv_count).
*  IF lv_count GT 1.
*    LOOP AT SCREEN.
*      IF screen-group1 = 'ID1'.
*        screen-input = 0.
*        MODIFY SCREEN.
*      ENDIF.
*    ENDLOOP.
*  ENDIF.

ENDMODULE.
*}   INSERT

*{   INSERT         S4SK900317                                        2
*&---------------------------------------------------------------------*
*& Module ISM_SET_STATUS_9002 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE ism_set_status_9005 OUTPUT.

*  TYPES: BEGIN OF TAB_TYPE,
*           FCODE LIKE SY-UCOMM,
*         END OF TAB_TYPE.
*
*  DATA: LT_EXCL_CODE TYPE STANDARD TABLE OF TAB_TYPE
*                 WITH NON-UNIQUE DEFAULT KEY INITIAL SIZE 10,
*        LS_EXCL_CODE TYPE TAB_TYPE.
*
*  CLEAR LT_EXCL_CODE.
*
** by now no filter function
*    MOVE FCODE_ISMIDFI TO LS_EXCL_CODE-FCODE.
*    APPEND LS_EXCL_CODE TO LT_EXCL_CODE.
*** change documents
**    MOVE FCODE_ISMIDCD TO LS_EXCL_CODE-FCODE.
**    APPEND LS_EXCL_CODE TO LT_EXCL_CODE.
*
*
*  CASE GV_T130M_AKTYP.
*    WHEN CON_ACTYPE_DISPLAY.
*      MOVE FCODE_ISMIDDE TO LS_EXCL_CODE-FCODE.
*      APPEND LS_EXCL_CODE TO LT_EXCL_CODE.
**      MOVE FCODE_ISMIDCR TO LS_EXCL_CODE-FCODE.
**      APPEND LS_EXCL_CODE TO LT_EXCL_CODE.
**      MOVE FCODE_ISMIDMO TO LS_EXCL_CODE-FCODE.
**      APPEND LS_EXCL_CODE TO LT_EXCL_CODE.
*    WHEN CON_ACTYPE_CREATE.
**      MOVE FCODE_ISMBPSH TO LS_EXCL_CODE-FCODE.
**      APPEND LS_EXCL_CODE TO LT_EXCL_CODE.
*    WHEN CON_ACTYPE_CHANGE.
**      MOVE FCODE_ISMBPSH TO LS_EXCL_CODE-FCODE.
**      APPEND LS_EXCL_CODE TO LT_EXCL_CODE.
*  ENDCASE.
*
*  SET PF-STATUS CON_STATUS_1000 EXCLUDING LT_EXCL_CODE.
*  SET TITLEBAR  CON_TITLE_1000.

 SET PF-STATUS 'STATUS_9005'.
* IF sy-dynnr = '9002'.
*   SET TITLEBAR 'TIT_9002'.
* ELSE.
   SET TITLEBAR 'TIT_9005'.
* ENDIF.
ENDMODULE.
*}   INSERT
