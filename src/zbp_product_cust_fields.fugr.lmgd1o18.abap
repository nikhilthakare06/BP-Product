*------------------------------------------------------------------
*  Module SONFAUSW_IN_FGUPPEN.
*------------------------------------------------------------------
* Felder ,die in T130F zu einer Sonderfeldauswahlgruppe zusammenge-
* fasst wurden, werden in Abhaengigkeit von der Gruppennummer einer
* Sonderbehandlung unterzogen.
* Sonderregel 010 neu für Änderungsdienst                 QHBADIK001125
* mk/27.02.95: Festhalten der ausgeblendeten Felder, denen reine
* Anzeigetexte zugeordnet sind (Screen-Group1 gefüllt) in der
* internen Tabelle feldbeztab
*mk/1995: Feldauswahl für KMAT wird hier ebenfalls ausgeführt
*------------------------------------------------------------------
MODULE sonfausw_in_fgruppen OUTPUT.

*-------- Aufbauen Feldauswahl-Tabelle --------------------------------

* Tabelle FAUSWTAB wird in Module FELDAUSWAHL/ANF_FELDAUSWAHL aufgebaut

*mk/12.07.95 Aufbauen Fauswtab_Sond gemäß Fauswtab
  REFRESH fauswtab_sond.
*mk/3.1G/1.2B Tuning: fauswtab ist in der Regel kleiner als ftab_sfgrup
*(ftab_sfgrup ist sortiert)
* LOOP AT FTAB_SFGRUP.
*   READ TABLE FAUSWTAB WITH KEY FTAB_SFGRUP-FNAME BINARY SEARCH.
*   IF SY-SUBRC EQ 0.
*     FAUSWTAB_SOND = FAUSWTAB.
*     APPEND FAUSWTAB_SOND.
*   ENDIF.
* ENDLOOP.
  LOOP AT fauswtab.
    READ TABLE ftab_sfgrup WITH KEY fauswtab-fname BINARY SEARCH.
    IF sy-subrc EQ 0.
      fauswtab_sond = fauswtab.
      APPEND fauswtab_sond.
    ENDIF.
  ENDLOOP.

*-------- Aufrufen FB für Feldauswahl ---------------------------------

* Vereinigung der Sonderfeldauswahl-FB's Industrie + Retail  "BE/100197
* CALL FUNCTION 'MATERIAL_FIELD_SPECIAL_SELECT'              "BE/100197
ENHANCEMENT-SECTION     sonfausw_in_fgruppen_01 SPOTS es_lmgd1o18 INCLUDE BOUND.
*  CALL FUNCTION 'MATERIAL_FIELD_SPECIAL_SEL_NEW'             "BE/100197
*       EXPORTING
*            KZRFB               = KZRFB
*            ALT_STANDARDPR_ALLG = *MARA-SATNR  "ch zu 3.0C
*            ALT_STANDARDPRODUKT = *MARC-STDPD
*            FLGSTEUER_MUSS      = RMMG2-STEUERMUSS
**           flg_cad_aktiv       = flg_cad_aktiv mk/4.0A in RMMG2 integr.
*            MTART_BESKZ         = RMMG2-BESKZ
*            IMARA               = MARA "ch zu 3.0C
*            IMARC               = MARC
*            IMPOP               = MPOP
*            MPOP_PRDAT_DB       = *MPOP-PRDAT
*            IMYMS               = MYMS
*            IMBEW               = MBEW
*            IMLGT               = MLGT                 "4.0A  BE/140897
*            IRMMG1              = RMMG1
*            IRMMG2              = RMMG2
*            IRMMZU              = RMMZU
*            IT130M              = T130M
*            IT134_WMAKG         = T134-WMAKG                 "BE/100197
*            IT134_VPRSV         = T134-VPRSV
*            IT134_KZVPR         = T134-KZVPR
*            IT134_KZPRC         = T134-KZPRC
*            IT134_KZKFG         = T134-KZKFG  "ch zu 3.0C
*            OMARA_KZKFG         = *MARA-KZKFG  "ch zu 3.0C
*            LANGTEXTBILD        = LANGTEXTBILD
*            NEUFLAG             = NEUFLAG
*            QM_PRUEFDATEN       = MARC-QMATV
*            AKTVSTATUS          = AKTVSTATUS
*            KZ_KTEXT_ON_DYNP    = KZ_KTEXT_ON_DYNP
*            IT133A_PSTAT        = T133A-PSTAT                "BE/100197
*            IT133A_RPSTA        = T133A-RPSTA                "BE/240297
*            IV_MATFI            = MARA-MATFI "TF 4.6C Materialfixierung
*       IMPORTING
*            FLGSTEUER_MUSS      = RMMG2-STEUERMUSS
*            IMBEW               = MBEW
*       TABLES
*            FAUSWTAB            = FAUSWTAB_SOND
*            PTAB                = PTAB
*            STEUERTAB           = STEUERTAB
*            STEUMMTAB           = STEUMMTAB.




  "{ Begin ENHO AD_MPN_PUR2_LMGD1O18 IS-AD-MPN AD_MPN_IC }
  CALL FUNCTION 'MATERIAL_FIELD_SPECIAL_SEL_NEW'             "BE/100197
    EXPORTING
      kzrfb               = kzrfb
      alt_standardpr_allg = *mara-satnr  "ch zu 3.0C
      alt_standardprodukt = *marc-stdpd
      flgsteuer_muss      = rmmg2-steuermuss
*     flg_cad_aktiv       = flg_cad_aktiv mk/4.0A in RMMG2 integr.
      mtart_beskz         = rmmg2-beskz
      imara               = mara "ch zu 3.0C
      imarc               = marc
      impop               = mpop
      mpop_prdat_db       = *mpop-prdat
      imyms               = myms
      imbew               = mbew
      imlgt               = mlgt                 "4.0A  BE/140897
      irmmg1              = rmmg1
      irmmg2              = rmmg2
      irmmzu              = rmmzu
      it130m              = t130m
      it134_wmakg         = t134-wmakg                 "BE/100197
      it134_vprsv         = t134-vprsv
      it134_kzvpr         = t134-kzvpr
      it134_kzprc         = t134-kzprc
      it134_kzfff         = t134-kzfff
      it134_kzkfg         = t134-kzkfg  "ch zu 3.0C
      omara_kzkfg         = *mara-kzkfg  "ch zu 3.0C
      langtextbild        = langtextbild
      neuflag             = neuflag
      qm_pruefdaten       = marc-qmatv
      aktvstatus          = aktvstatus
      kz_ktext_on_dynp    = kz_ktext_on_dynp
      it133a_pstat        = t133a-pstat                "BE/100197
      it133a_rpsta        = t133a-rpsta                "BE/240297
      iv_matfi            = mara-matfi "TF 4.6C Materialfixierung
    IMPORTING
      flgsteuer_muss      = rmmg2-steuermuss
      imbew               = mbew
    TABLES
      fauswtab            = fauswtab_sond
      ptab                = ptab
      steuertab           = steuertab
      steummtab           = steummtab.
  "{ End ENHO AD_MPN_PUR2_LMGD1O18 IS-AD-MPN AD_MPN_IC }

*  IF rmmg2-chargebene NE chargen_ebene_0.
*    IF mara-xchpf <> 'X'.
*      CLEAR marc-xchpf.
*    ENDIF.
*  ENDIF.

END-ENHANCEMENT-SECTION.


ENHANCEMENT-POINT lmgd1o18_01 SPOTS es_lmgd1o18 INCLUDE BOUND.

*-------- Modifizieren Screen über Feldauswahl-Tabelle ----------------
  CLEAR feldbeztab. REFRESH feldbeztab.
  CLEAR feldbeztab2. REFRESH feldbeztab2.                 "note 1611251

  LOOP AT SCREEN.
*   read table fauswtab_sond with key screen-name binary search. mk/4.0A
    READ TABLE fauswtab_sond WITH KEY fname = screen-name BINARY SEARCH.
ENHANCEMENT-SECTION     lmgd1o18_03 SPOTS es_lmgd1o18 INCLUDE BOUND .
    IF sy-subrc EQ 0.
*     read table fauswtab with key screen-name binary search. mk/4.0A
      READ TABLE fauswtab WITH KEY fname = screen-name BINARY SEARCH.
      IF sy-subrc EQ 0.
        fauswtab = fauswtab_sond.
        MODIFY fauswtab INDEX sy-tabix.
      ENDIF.
      screen-active      = fauswtab_sond-kzact.
      screen-input       = fauswtab_sond-kzinp.
      screen-intensified = fauswtab_sond-kzint.
      screen-invisible   = fauswtab_sond-kzinv.
      screen-output      = fauswtab_sond-kzout.
      screen-required    = fauswtab_sond-kzreq.

*     note 1358288: override columns set by TC_VIEW customizing
      IF <f_tc> IS ASSIGNED.
        READ TABLE <f_tc>-cols INTO tc_col WITH KEY screen-name = screen-name.
        IF sy-subrc = 0.
*         If field is set by table control to invisible and it is not
*         required due to material field selection, then hide the field.
*         Otherwise make sure, that the field is not hidden.
          IF tc_col-invisible = cx_true AND screen-required = 0.
            screen-invisible = 1.
            screen-active    = 1.                          "note 1575018
            screen-output    = 1.                          "note 1575018
            screen-input     = 0.
          ELSEIF screen-invisible = 1.
            screen-active    = 1.                          "note 1575018
            screen-output    = 1.                          "note 1575018
            tc_col-invisible = cx_true.
          ELSE.
            tc_col-invisible = cx_false.
          ENDIF.
          tc_col-screen = screen.
          MODIFY <f_tc>-cols FROM tc_col INDEX sy-tabix.
        ENDIF.
      ENDIF.

      MODIFY SCREEN.

*mk/4.0A wieder in FB integriert
*mk/3.0F Butttons Prognose-/Verbrauchswerte ausblenden (keine
*SFGRUP in T130F) beim Planen von Änderungen
*     if screen-name = marc_verb or screen-name = mpop_prgw.
*..............
*     endif.
    ENDIF.
END-ENHANCEMENT-SECTION.
* Festhalten der nicht ausgeblendeten Felder, denen Bezeichnungen
* zugeordnet sind
    IF ( screen-invisible = 0 OR screen-output = 1 ) AND NOT
       screen-group1 IS INITIAL.
      feldbeztab-name   = screen-name.
      feldbeztab-group1 = screen-group1.
      APPEND feldbeztab.
    ENDIF.
*   note 1611251: extend the logic also for SCREEN-GROUP2
    IF ( screen-invisible = 0 OR screen-output = 1 ) AND NOT
       screen-group2 IS INITIAL.
      feldbeztab2-name   = screen-name.
      feldbeztab2-group1 = screen-group2.
      APPEND feldbeztab2.
    ENDIF.

  ENDLOOP.

ENHANCEMENT-POINT lmgd1o18_02 SPOTS es_lmgd1o18 INCLUDE BOUND.
  SORT feldbeztab.
  SORT feldbeztab2.                                       "note 1611251

  IF t130m-aktyp EQ aktyph AND NOT rmmg1_ref-matnr IS INITIAL.
*  Prüfen, ob Feld ein für das Vorlagematerial relevantes Währungsfeld
*  ist. In diesem Fall wird das  KZCURR in der Fauswtab gesetzt
    CALL FUNCTION 'MATERIAL_CURRFIELD_REF'
      TABLES
        rptab    = rptab
        fauswtab = fauswtab.
  ENDIF.



ENDMODULE.
