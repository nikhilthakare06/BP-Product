*------------------------------------------------------------------
*           Sonderregel
*   Bild dunkel prozessieren, wenn FLGDARK sitzt
*mk/30.03.95 Sonderlogik für MARC-STDPD hierher verlagert - war
* bisher im separaten Module STDPD_SONDERHANDLING, das speziell auf
* demjenigen Dispobild ablief, auf dem MARC-STDPD vorhanden ist:
* Falls das Bild zur Konfigurationsbewertung mit F15=Beenden verlassen
* wird, wird das aktuelle Bild (vom dem die Konfigurationsbewertung
* aufgerufen wurd) dunkel prozessiert und der Fcode 'Ende' gesetzt.
* Falls außerdem ein Error innerhalb der Konfigurationsbewertung
* festgestellt wurde, wird der Cursor auf das Feld MARC-STDPD gesetzt
* (Set Cursor ist wirkungslos, wenn Feld nicht auf dem Bild vorhanden -
* ohne Fehler)
*------------------------------------------------------------------
MODULE SONDERFAUS OUTPUT.

  IF NOT FLGDARK IS INITIAL.
    OK-CODE = T130M-FCODE.
    SUPPRESS DIALOG.
  ENDIF.
* Sonderhandling für Standardprodukt ----------------------------------
  IF CFCODE = FCODE_15.
    CLEAR CFCODE.
    OK-CODE = FCODE_ENDE.
    SUPPRESS DIALOG.
  ENDIF.

  IF NOT ERROR_KONF IS INITIAL.
    CLEAR ERROR_KONF.
    SET CURSOR FIELD 'MARC-STDPD'.
  ENDIF.

ENDMODULE.
