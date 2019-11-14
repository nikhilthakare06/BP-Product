*******************************************************************
*   System-defined Include-files.                                 *
*******************************************************************
  INCLUDE LZBP_PRODUCT_CUST_FIELDSTOP.       " Global Declarations
  INCLUDE LZBP_PRODUCT_CUST_FIELDSUXX.       " Function Modules

*******************************************************************
*   User-defined Include-files (if necessary).                    *
*******************************************************************
* INCLUDE LZMM_PRODUCT_CUST_FIELDSF...       " Subroutines
* INCLUDE LZMM_PRODUCT_CUST_FIELDSO...       " PBO-Modules
* INCLUDE LZMM_PRODUCT_CUST_FIELDSI...       " PAI-Modules
* INCLUDE LZMM_PRODUCT_CUST_FIELDSE...       " Events
* INCLUDE LZMM_PRODUCT_CUST_FIELDSP...       " Local class implement.
* INCLUDE LZMM_PRODUCT_CUST_FIELDST99.       " ABAP Unit tests

* DIESES INCLUDE NICHT MEHR AENDERN!                                 *
* NEUE INCLUDES IN BESTEHENDE INCLUDES AUFNEHMEN!                    *

*------------------------------------------------------------------
*           PBO-Module
*------------------------------------------------------------------
  INCLUDE lmgd1oxx.     "zentrale PBO-Module Bildbausteine
  INCLUDE lmgd1o01.     "PBO-Module für Kurztexthandling
  INCLUDE lmgd1o02.     "PBO-Module für Steuerhandling
  INCLUDE lmgd1o03.     "PBO-Module für Verbrauchswerte
  INCLUDE lmgd1o04.     "PBO-Mdoule Mengeneinheiten
  INCLUDE lmgd1o05.     "PBO-Module für Prognosewerte
  INCLUDE lmgd1o06.     "PBO-Module für EAN
  INCLUDE lmgd1o07.     "PBO-Module für Langtexte
  INCLUDE lmgd1o08.     "PBO-Module für Table-Control Steuerung
  INCLUDE lmgd1o1k.     "PBO-Modul für Klassif.-Subscreen
*------------------------------------------------------------------
*           PAI-Module
*------------------------------------------------------------------
  INCLUDE lmgd1ixx.     "zentrale PAI-Module Bildbausteine
  INCLUDE lmgd1iyy.     "Gemeinsame PAI-Module Bildbaustein/Trägerprogramm
  INCLUDE lmgd1i01.     "Prüfmodule Datenbilder  MARA, MAKT (Kopfbaustein)
  INCLUDE lmgd1i02.     "Prüfmodule Datenbilder  MARC, MARD, MPGD
  INCLUDE lmgd1i03.     "Prüfmodule Datenbilder  QM-Daten (MARA/MARC)
  INCLUDE lmgd1i04.     "Prüfmodule Datenbilder  MBEW
  INCLUDE lmgd1i05.     "Prüfmodule Datenbilder  MFHM
  INCLUDE lmgd1i06.     "Prüfmodule Datenbilder  MLGN, MLGT
  INCLUDE lmgd1i07.     "Prüfmodule Datenbilder  MPOP
  INCLUDE lmgd1i08.     "Prüfmodule Datenbilder  MVKE
  INCLUDE lmgd1i09.     "Prüfmodule für Kurztexthandling
  INCLUDE lmgd1i10.     "PAI-Module für Steuerhandling
  INCLUDE lmgd1i11.     "PAI-Module für Verbrauchswerte
  INCLUDE lmgd1i12.     "PAI-Module Mengeneinheiten
  INCLUDE lmgd1i13.     "PAI-Module für Prognosewerte
  INCLUDE lmgd1i14.     "PAI-Module EAN
  INCLUDE lmgd1i15.     "PAI-Module für Langtexte
  INCLUDE lmgd1i17.     "PAI-Module für TC-Steuerung
  INCLUDE lmgd1i7o.     "PAI-Module für Klassif.-Subscreen
  INCLUDE lmgd1ihx.     "Eingabehilfen Bildbausteine
*------------------------------------------------------------------
*
*           FORM-Routinen
*
*------------------------------------------------------------------
  INCLUDE lmgd1fxx.        "zentrale Formroutinen Bildbausteine
  INCLUDE lmgd1fyy.        "Gemeinsame Form-Routinen Bildbaustein/Tägerpr.
  INCLUDE lmgd1fsc.        "zentrale Blätterroutinen   Bildbausteine
  INCLUDE lmgd1f01.        "Form-Routinen Kurztexthandling
  INCLUDE lmgd1f02.        "Form-Routinen Steuerhandling
  INCLUDE lmgd1f03.        "Form-Routinen I Verbrauchswerte/Prognosewerte
  INCLUDE lmgd1f06.        "Form-Routinen II Verbrauchswerte/Prognosewerte
  INCLUDE lmgd1f04.        "Form-Routinen Mengeneinheiten
  INCLUDE lmgd1f05.        "Form-Routinen EAN

*
  INCLUDE lmgd1fhx.       "spezielle Eingabehilfen Bildbausteine
  INCLUDE lmgmmfhx.       "allg. Routinen Eingabehilfen
* generierte Form-Routinen für Bildbausteine
  INCLUDE mmmgxguw.        "Holen der Daten auf den Bildbaustein
  INCLUDE mmmgxsuw.        "Übergeben der Daten vom Bildbaustein
  INCLUDE mmmgxrbd.        "Zus. Vorschlagshandling before  Dialog
  INCLUDE mmmgxrad.        "Zus. Vorschlagshandling after   Dialog

  INCLUDE lmgd1i7k.

*INCLUDE LMGD1F2F.

  INCLUDE lmgd1o1j.

  INCLUDE lmgd1i7q.

  INCLUDE lmgd1ov0.

  INCLUDE lmgd1i7t.

* DIESES INCLUDE NICHT MEHR AENDERN!                                 *
* NEUE INCLUDES IN BESTEHENDE INCLUDES AUFNEHMEN!                    *

  INCLUDE lmgd1o20.

  INCLUDE lmgd1o21.

INCLUDE LZBP_PRODUCT_CUST_FIELDSI01.
*  INCLUDE lzmm_product_cust_fieldsi01.

INCLUDE LZBP_PRODUCT_CUST_FIELDSO01.
*  INCLUDE lzmm_product_cust_fieldso01.
*{   INSERT         S4SK900317                                        1
*
INCLUDE LZBP_PRODUCT_CUST_FIELDSI02.
*INCLUDE lzmm_product_cust_fieldsi02.
*}   INSERT
*{   INSERT         S4SK900317                                        2
*
INCLUDE LZBP_PRODUCT_CUST_FIELDSO02.
*INCLUDE lzmm_product_cust_fieldso02.
*}   INSERT

INCLUDE lzbp_product_cust_fieldsi03.
