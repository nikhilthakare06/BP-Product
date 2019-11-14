FUNCTION-POOL zmm_bpassign_db.            "MESSAGE-ID ..

DATA: gt_zmm_jptbupaassign_mem TYPE zmm_t_jptbupaassign,
      gt_zmm_jptbupaassign_db  TYPE zmm_t_jptbupaassign.

*CLASS lcl_bpassign_helper DEFINITION.
*
*  PUBLIC SECTION.
*    CLASS-METHODS:
*      get_db_delta
*        EXPORTING
*          et_zmm_JPTBUPAASSIGN_insert TYPE zmm_t_JPTBUPAASSIGN
*          et_zmm_JPTBUPAASSIGN_update TYPE zmm_t_JPTBUPAASSIGN
*          et_zmm_JPTBUPAASSIGN_delete TYPE zmm_t_JPTBUPAASSIGN.
*
*ENDCLASS.
