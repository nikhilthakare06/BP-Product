*&---------------------------------------------------------------------*
*&      Module  ZUSREF_VORSCHLAGEN_B  OUTPUT
*&---------------------------------------------------------------------*
*       Vorlagenhandling VOR dem Modul REFDATEN_VORSCHLAGEN            *
*       War ursprünglich in allen PBO Modulen verteilt und wird        *
*       hier zusammengefaßt.
*----------------------------------------------------------------------*
MODULE ZUSREF_VORSCHLAGEN_B OUTPUT.
  CHECK T130M-AKTYP EQ AKTYPH.
  CALL FUNCTION 'USRM1_SINGLE_READ'
       EXPORTING
           UNAME  = SY-UNAME
           BILDS  = BILDSEQUENZ
       IMPORTING
           WUSRM1 = USRM1_H.

* CHECK BILDFLAG IS INITIAL.               "cfo/3.1I
  CHECK NOT ( T133A-PSTAT CO 'C ' AND USRM1_H-SISEL IS INITIAL ).
*--- Pruefen, ob Bild bereits prozessiert wurde ----------------
* CHECK BILDTAB-KZPRO IS INITIAL.          "cfo/3.1I

  REF_MATNR     = RMMG1_REF-MATNR.

*--- Aufrufe der Vorlagehandling - FB's BEFORE -----------------
  PERFORM ZUSREF_VORSCHLAGEN_BEFORE_D.

ENDMODULE.                             " ZUSREF_VORSCHLAGEN_B  OUTPUT
