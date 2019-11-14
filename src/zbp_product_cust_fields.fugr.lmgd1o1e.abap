*&---------------------------------------------------------------------*
*&      Module  FAUSW_BEZEICHNUNGEN  OUTPUT
*&---------------------------------------------------------------------*
* Ausblenden der Texte zu den unsichtbaren Feldern                     *
* insbesondere auch die Daten zum Einkaufswerteschlüssel, falls dieser
* ausgeblendet ist
*----------------------------------------------------------------------*
MODULE FAUSW_BEZEICHNUNGEN OUTPUT.

  DATA: HGROUP1 LIKE SCREEN-GROUP1.

  HGROUP1(1) = 'F'.
  LOOP AT SCREEN.
*   check screen-group1(1) eq 'T' and screen-input eq 0.
*mk/4.0A für Buttons sitzt input = 1
    IF SCREEN-GROUP1(1) EQ 'T'.
      HGROUP1+1 = SCREEN-GROUP1+1.
      READ TABLE FELDBEZTAB WITH KEY GROUP1 = HGROUP1.
      IF SY-SUBRC NE 0.
        SCREEN-INVISIBLE = 1.
        SCREEN-OUTPUT    = 0.
        SCREEN-INPUT     = 0.     "mk/4.0A
        MODIFY SCREEN.
        CONTINUE.
      ENDIF.
    ENDIF.
*   note 1611251: extend the logic also for SCREEN-GROUP2
    IF SCREEN-GROUP2(1) EQ 'T'.
      HGROUP1+1 = SCREEN-GROUP2+1.
      READ TABLE FELDBEZTAB2 WITH KEY GROUP1 = HGROUP1.
      IF SY-SUBRC NE 0.
        SCREEN-INVISIBLE = 1.
        SCREEN-OUTPUT    = 0.
        SCREEN-INPUT     = 0.     "mk/4.0A
        MODIFY SCREEN.
        CONTINUE.
      ENDIF.
    ENDIF.
  ENDLOOP.

ENDMODULE.                             " FAUSW_BEZEICHNUNGEN  OUTPUT

*&---------------------------------------------------------------------*
*&      Module  FELDAUSW_TEXTE  OUTPUT
*&---------------------------------------------------------------------*
* Ausblenden der Texte zu den unsichtbaren Feldern, wenn kein Lagerort *
* eingegeben (nur für Dynpro 2732)                                     *
*----------------------------------------------------------------------*
MODULE FELDAUSW_TEXTE OUTPUT.

  CHECK RMMG1-LGNUM IS INITIAL.                        "begin 783025
  LOOP AT SCREEN.
    CHECK SCREEN-GROUP1(1) EQ 'T'.
    SCREEN-INVISIBLE = 1.
    SCREEN-OUTPUT    = 0.
    SCREEN-INPUT     = 0.
    MODIFY SCREEN.
  ENDLOOP.                                               "end 783025

ENDMODULE.                                  " FELDAUSW_TEXTE  OUTPUT
