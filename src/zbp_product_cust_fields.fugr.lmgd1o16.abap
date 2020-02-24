*&---------------------------------------------------------------------*
*&      Module  ZUSREF_VORSCHLAGEN_A  OUTPUT
*&---------------------------------------------------------------------*
*       Vorlagenhandling NACH dem Modul REFDATEN_VORSCHLAGEN           *
*       War ursprünglich in allen PBO Modulen verteilt und wird        *
*       hier zusammengefaßt.
*----------------------------------------------------------------------*
MODULE zusref_vorschlagen_a OUTPUT.

* note 482447
  DATA reference_herkunft LIKE t130f-kzref.
  CLEAR reference_herkunft.

  CHECK t130m-aktyp EQ aktyph.
  CALL FUNCTION 'USRM1_SINGLE_READ'
    EXPORTING
      uname  = sy-uname
      bilds  = bildsequenz
    IMPORTING
      wusrm1 = usrm1_h.

* CHECK BILDFLAG IS INITIAL.               "cfo/3.1I
  CHECK NOT ( t133a-pstat CO 'C ' AND usrm1_h-sisel IS INITIAL ).


*--- Pruefen, ob Bild bereits prozessiert wurde ----------------
* CHECK BILDTAB-KZPRO IS INITIAL.        "cfo/3.1I

*--- Aufrufe der Vorlagehandling - FB's AFTER ------------------
  PERFORM zusref_vorschlagen_after_d USING reference_herkunft.

  PERFORM ref_user_exit_d.              "cfo/4.6C

*mk/21.07.95  - mk/24.08.95 am Ende des Vorlagehandlings
*Aufruf des Vorlagehandlings aus den übergeordneten Daten desselben
*Materials
  CALL FUNCTION 'MATERIAL_REFERENCE_ITSELF'
    EXPORTING
      flg_uebernahme  = flg_uebernahme
      flg_pruefdunkel = flg_pruefdunkel
      aktvstatus      = aktvstatus
      wmbew           = mbew
      marc_losgr      = marc-losgr
      mvke_prodh      = mvke-prodh
      mara_prdha      = mara-prdha
      marc_dismm      = marc-dismm  "mk/19.12.95
      marc_sbdkz      = marc-sbdkz  "mk/19.12.95
      wrmmg1          = rmmg1    "mk/19.12.95
    IMPORTING
      wmbew           = mbew
      marc_losgr      = marc-losgr
      mvke_prodh      = mvke-prodh
      marc_sbdkz      = marc-sbdkz  "mk/19.12.95
    TABLES
      fauswtab        = fauswtab
      mptab           = ptab.

  IF marc-werks IS NOT INITIAL.

    SELECT SINGLE xchpf INTO @DATA(lv_temp_mxchpf) FROM mara BYPASSING BUFFER WHERE matnr = @marc-matnr.
    IF sy-subrc = 0 AND lv_temp_mxchpf = 'X'.

      SELECT SINGLE xchpf INTO @DATA(lv_temp_xchpf) FROM v_marc_md
         WHERE werks = @marc-werks AND matnr = @marc-matnr.

      IF sy-subrc = 0 AND lv_temp_xchpf IS INITIAL.
        EXIT.
      ENDIF.
    ENDIF.

    IF rmmg2-flg_isbatch IS INITIAL OR gv_isbatch IS INITIAL. "Global flag
      "default

      IF mara-xchpf IS NOT INITIAL.
        IF cl_vb_batch_factory=>util( )->get_default_batch_handling( iv_plant = marc-werks ).
          marc-xchpf = mara-xchpf.
          marc-xchar = marc-xchpf.

        ELSE.
          CLEAR marc-xchpf.
          CLEAR marc-xchar.
        ENDIF.

        rmmg2-flg_isbatch = 'X'.
        gv_isbatch = 'X'.
      ENDIF.
    ELSE.
      IF mara-xchpf IS INITIAL.

        CLEAR rmmg2-flg_isbatch.
        CLEAR gv_isbatch.
      ENDIF.
    ENDIF.

  ENDIF.

ENDMODULE.                             " ZUSREF_VORSCHLAGEN_A  OUTPUT
