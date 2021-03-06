*&---------------------------------------------------------------------*
*&      Form  LESEN_MLGN_SEQ2
*&---------------------------------------------------------------------*
*       Lesen der Tabelle MLGN sequentiell
*------------------------------------------------------------------
FORM LESEN_MLGN_SEQ2.

  CALL FUNCTION 'MLGN_READ_WITH_MATNR_AKT_DB'
       EXPORTING
            MATNR                = HMARA-MATNR
*           KZRFB                = ' '
*           SPERRMODUS           = ' '
*           STD_SPERRMODUS       = ' '
            LHME                 = X   "//br030397 zu 1.2B ( P30 OK )
       TABLES
            MLGN_AKT_TAB         = HMLGN_TAB
*           MLGN_DB_TAB          =
       EXCEPTIONS
            NOT_FOUND            = 1
            LOCK_ON_MLGN         = 2
            LOCK_SYSTEM_ERROR    = 3
            ENQUEUE_MODE_CHANGED = 4
            OTHERS               = 5.
  CHECK SY-SUBRC = 0.
  LOOP AT HMLGN_TAB.
    MOVE HMLGN_TAB-LVSME TO HMEINH.   "cfo/3.3.97 hmlgn_tab statt hmlgn
    PERFORM PRUEFEN_MEINH USING 'MM' 025 HMLGN_TAB-LGNUM SPACE SPACE.
  ENDLOOP.

* CFO/09.01.96/umgestellt auf Puffer
*      SELECT * INTO HMLGN
*           FROM MLGN
*           WHERE MATNR = HMARA-MATNR.
*              MOVE HMLGN-LVSME TO HMEINH.
*              PERFORM PRUEFEN_MEINH.
*      ENDSELECT.

ENDFORM.
