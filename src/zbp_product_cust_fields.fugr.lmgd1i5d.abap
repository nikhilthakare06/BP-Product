*----------------------------------------------------------------------*
*       Module  AUFNEHMEN_TAXIM                                        *
* Aufnehmen des Steuerindikators Einkauf in die interne Tabelle        *
* STEUMMTAB, vorher Prüfung auf Gültigkeit gegen Tabelle TMKM1.        *
*----------------------------------------------------------------------*
MODULE AUFNEHMEN_TAXIM.

  CHECK T130M-AKTYP NE AKTYPA AND T130M-AKTYP NE AKTYPZ.

* CHECK NOT MG03STEUMM-TAXIM IS INITIAL.                   "BE/140396

*----Prüfen Eingabe-------------------------------------------------
  IF NOT MG03STEUMM-TAXIM IS INITIAL.  "BE/120496
    CALL FUNCTION 'TMKM1_SINGLE_READ'
         EXPORTING
              TMKM1_LAND1 = MG03STEUMM-ALAND
              TMKM1_TAXIM = MG03STEUMM-TAXIM
         IMPORTING
              WTMKM1      = TMKM1
         EXCEPTIONS
              NOT_FOUND   = 01.

    IF SY-SUBRC NE 0.
*----Steuerindikator zum Land nicht vorhanden-----------------------
      MESSAGE E019 WITH MG03STEUMM-ALAND MG03STEUMM-TAXIM.
    ENDIF.
  ENDIF.                               "BE/120496

*----Lesen aktuellen Eintrag----------------------------------------
  READ TABLE STEUMMTAB INDEX 1.

*----Aktualisieren interne Tabelle----------------------------------
  IF SY-SUBRC = 0.
    MOVE MG03STEUMM-TAXIM TO STEUMMTAB-TAXIM.
    MODIFY STEUMMTAB INDEX 1.
  ENDIF.

ENDMODULE.                             " AUFNEHMEN_TAXIM
