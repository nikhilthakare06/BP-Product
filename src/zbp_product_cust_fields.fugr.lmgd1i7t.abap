*----------------------------------------------------------------------*
***INCLUDE LMGD1I7T .
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  MARA-CMREL  INPUT
*&---------------------------------------------------------------------*
* TF 4.6C Materialfixierung
*----------------------------------------------------------------------*
MODULE mara-cmrel INPUT.
  CALL FUNCTION 'MARA_CMREL'
    EXPORTING
      if_wmara                = lmara
      if_lmara                = mara
    EXCEPTIONS
      CHANGE_NOT_ALLOWED      = 1
      OTHERS                  = 2
            .
  IF sy-subrc <> 0.
    MESSAGE ID SY-MSGID TYPE 'S' NUMBER SY-MSGNO
          WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    bildflag = 'X'.
  ENDIF.

ENDMODULE.                 " MARA-CMREL  INPUT

"{ Begin ENHO DIMP_GENERAL_LMGD1I7T IS-A DIMP_GENERAL }
*TF Variable Objektidentifikation/46C2==================================
*&---------------------------------------------------------------------*
*&      Module  prepare_varid_pai  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE prepare_varid_pai INPUT.
  data: okcode_sav like rmmzu-okcode.
  okcode_sav = rmmzu-okcode.
  CALL FUNCTION 'BZID_TRANSMIT_OKCODE'
       CHANGING
            okcode  = rmmzu-okcode.
  if okcode_sav <> rmmzu-okcode.
    bildflag = 'X'.
  endif.
ENDMODULE.                 " manage_varid  INPUT
*&---------------------------------------------------------------------*
*&      Module  SAVE_VARID_PAI  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE SAVE_VARID_PAI INPUT.
data: gv_varid_must type c.
data: gv_varid_filled type c.
CALL FUNCTION 'BZID_CHECK_MUST'
  EXPORTING
    appl                 = '0001'
    guid                 = mara-varid
  IMPORTING
    FLG_MUST             = gv_varid_must
    FLG_NOT_FILLED       = gv_varid_filled.
  if not gv_varid_must is initial and not gv_varid_filled is initial.
    message e065(mgv).
  endif.
  CALL FUNCTION 'BZID_CHECK_CHANGE_FLAG'
    IMPORTING
      E_CHANGE_FLG       = rmmg2-vb_varid.
ENDMODULE.                 " SAVE_VARID_PAI  INPUT
*TF Variable Objektidentifikation/46C2==================================
"{ End ENHO DIMP_GENERAL_LMGD1I7T IS-A DIMP_GENERAL }

ENHANCEMENT-POINT LMGD1I7T_01 SPOTS ES_LMGD1I7T STATIC INCLUDE BOUND.
