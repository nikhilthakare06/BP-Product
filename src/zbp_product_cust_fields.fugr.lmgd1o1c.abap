*------------------------------------------------------------------
*        GET_DATEN_SUB
*
*- Holen der Materialstammdaten aus den U-WA´s in den Bildbaustein
* Falls keine Subscreens vorhanden sind, ist dies bereits schon im
* Modul get_daten_bild ausgeführt
* Die Daten werden nur beschafft, wenn das Bild nicht wiederholt
* wird oder das Bild bereits vollständig prozessiert wurde
*------------------------------------------------------------------
MODULE get_daten_sub OUTPUT.

  CHECK NOT anz_subscreens IS INITIAL.
*wk/4.0
  flg_tc = ' '.

*
*mk/1.2B Die temporären Daten müssen unabhängig vom Bildflag aus
*den Puffern geholt werden, damit z.B. nach einem Wechsel auf
*
  IF NOT kz_ein_programm IS INITIAL.
    IF NOT kz_bildbeginn IS INITIAL.
      CLEAR sub_zaehler.
*     IF BILDFLAG IS INITIAL OR NOT BILDTAB-KZPRO IS INITIAL
*        OR NOT RMMZU-BILDPROZ IS INITIAL.   mk/3.0D
*mk/07.02.96 bildtab-kzpro darf nicht mehr benutzt werden
*     IF BILDFLAG IS INITIAL OR NOT RMMZU-BILDPROZ IS INITIAL. mk/1.2B
      PERFORM zusatzdaten_get_sub.
      PERFORM matabellen_get_sub.
*     ENDIF.
    ENDIF.
  ELSE.
*   IF BILDFLAG IS INITIAL OR NOT BILDTAB-KZPRO IS INITIAL
*      OR NOT RMMZU-BILDPROZ IS INITIAL.
*   IF BILDFLAG IS INITIAL OR NOT RMMZU-BILDPROZ IS INITIAL.  mk/1.2B
    PERFORM zusatzdaten_get_sub.
    PERFORM matabellen_get_sub.
*   ENDIF.
  ENDIF.
  IF t130m-aktyp = aktyph.
    PERFORM zusatzdaten_get_sub.
  ENDIF.


ENDMODULE.
