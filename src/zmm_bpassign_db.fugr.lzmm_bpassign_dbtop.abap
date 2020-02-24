* regenerated at 26.12.2019 13:07:45
FUNCTION-POOL ZMM_BPASSIGN_DB            MESSAGE-ID SV.

DATA: gt_zmm_jptbupaassign_mem TYPE zmm_t_jptbupaassign,
      gt_zmm_jptbupaassign_db  TYPE zmm_t_jptbupaassign.

*TYPES: lcl_bpassign_helper TYPE xxxxxx.

CLASS lcl_bpassign_helper DEFINITION.

  PUBLIC SECTION.
    CLASS-METHODS:
      get_db_delta
        EXPORTING
          et_zmm_jptbupaassign_insert TYPE zmm_t_jptbupaassign
          et_zmm_jptbupaassign_update TYPE zmm_t_jptbupaassign
          et_zmm_jptbupaassign_delete TYPE zmm_t_jptbupaassign.

*      message_write_dark
*        IMPORTING
*          iv_matnr      TYPE matnr
*          iv_tranc      TYPE transcount
*          iv_max_errors TYPE t130s-anzum
*        CHANGING
*          ct_amerrdat   TYPE merrdat_tt
*          cv_errcount   TYPE tbist-numerror
*        EXCEPTIONS
*          too_many_errors,
*
*      modify_idcode_memory_from
*        IMPORTING
*          is_jptidcdassig_checked TYPE zjptidcdassig_ueb,
*
*      insert_idcode_memory_from
*        IMPORTING
*          is_jptidcdassig_checked TYPE zjptidcdassig_ueb,
*
*      delete_old_idcode_from_memory
*        IMPORTING
*          it_jptidcdassig_checked TYPE zmm_ts_jptidcdassig_ueb,
*
*      db_post_from_memory
*        IMPORTING
*          iv_change_record TYPE abap_bool
*          iv_update_task   TYPE abap_bool.

ENDCLASS.
  INCLUDE LSVIMDAT                                . "general data decl.
  INCLUDE LZMM_BPASSIGN_DBT00                     . "view rel. data dcl.
