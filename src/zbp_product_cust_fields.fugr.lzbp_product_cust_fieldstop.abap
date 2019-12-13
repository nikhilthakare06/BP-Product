FUNCTION-POOL zbp_product_cust_fields
                   MESSAGE-ID m3.

INCLUDE <icon>.
INCLUDE mmmgtrbb.
INCLUDE mmmgbbau.

* titles
CONSTANTS:
  con_title_1000(4)   TYPE c           VALUE '0001'.

* GUI-status
CONSTANTS:
  con_status_1000     LIKE sy-pfkey    VALUE '1000'.

* dynpros
CONSTANTS:
  con_dynpro_1000     LIKE sy-dynnr    VALUE '1000'.

* application object
CONSTANTS:
  con_bupa            TYPE bu_objap    VALUE 'BUPA'.

* assignment type
CONSTANTS:
  con_ism001 LIKE ztjpbpvalidrltyp-assi_typ VALUE 'ISM001'.

* activity types for maintenance of business partner
CONSTANTS:
  con_bupa_actype_create  LIKE tbz0k-aktyp  VALUE '01',
  con_bupa_actype_change  LIKE tbz0k-aktyp  VALUE '02',
  con_bupa_actype_display LIKE tbz0k-aktyp  VALUE '03'.

* function codes
CONSTANTS: fcode_change_bupa_assign(4) VALUE 'BPAS',
           fcode_eabr(4)               VALUE 'EABR'.
*           FCODE_ENTR(4)               VALUE 'ENTR'.

* business partner role types
CONSTANTS:
    con_publisher_msd LIKE ztjpbpvalidrltyp-assi_typ VALUE 'ISM030'
  .

CONSTANTS: zzgc_fcode_zbp TYPE string VALUE 'ZBP'. "delete id-code in table-control

DATA: zzgt_zmm_bpassign_mem TYPE zmm_t_jptbupaassign,
      zzgt_zmm_bpassign_db  TYPE zmm_t_jptbupaassign,
      zzgs_zmm_bpassign_mem TYPE zjptbupaassign.


***&SPWIZARD: DATA DECLARATION FOR TABLECONTROL 'TC_bpassign'
*&SPWIZARD: DEFINITION OF DDIC-TABLE
TABLES:   zrjpbupat1.
TABLES:   ztjpbpvalidrltyp.

*&SPWIZARD: TYPE FOR THE DATA OF TABLECONTROL 'TC_bpassign'
*TYPES: BEGIN OF zzty_s_bpassign,
*         idcodetype  LIKE zbpassign-idcodetype,
*         identcode   LIKE zbpassign-identcode,
*         xmainidcode LIKE zbpassign-xmainidcode,
*       END OF zzty_s_bpassign.

*&SPWIZARD: INTERNAL TABLE FOR TABLECONTROL 'TC_bpassign'
DATA: zzgt_bpassign TYPE TABLE OF zrjpbupat1,
      zzgs_bpassign TYPE zrjpbupat1.

*&SPWIZARD: INTERNAL TABLE FOR TABLECONTROL 'TC_IDCODES'
DATA: "zzgt_bpassign    TYPE zrjpbupat1 OCCURS 0,
      zzgt_bpassign_pre TYPE zrjpbupat1 OCCURS 0.
      "zzgs_bpassign     TYPE zrjpbupat1.

*&SPWIZARD: DECLARATION OF TABLECONTROL 'TC_bpassign' ITSELF
CONTROLS: zztc_bupa_assign TYPE TABLEVIEW USING SCREEN 9006. "#EC CI_CONV_OK

*&SPWIZARD: LINES OF TABLECONTROL 'TC_bpassign'
*DATA: zzgv_bpassign_lines           TYPE sy-tabix,
*      zzgv_bpassign_topl_buf        TYPE sy-stepl,

DATA: zzgv_bpassign_topl_buf        TYPE sy-stepl,
      zzgv_bpassign_lines           TYPE sy-tabix,

      zzgv_bpassign_line_no         TYPE sy-tabix,
      zzgv_bpassign_current_line    TYPE sy-tabix,
      zzgv_bpassign_first_line      TYPE sy-tabix,
*
      zzgv_bpassign_first_line_c(3) TYPE c,
      zzgv_bpassign_lines_per_page  TYPE sy-loopc,
      zzgv_bpassign_entries_c(3)    TYPE c,
      zzgv_bp_assigned              TYPE atass.

DATA:  GS_RMMG1       LIKE RMMG1.

DATA:  GS_MARA        LIKE MARA.

DATA:  GS_MAKT        LIKE MAKT.

*DATA: zzgv_ismhierarchlvl TYPE zismhierarchlvl.
