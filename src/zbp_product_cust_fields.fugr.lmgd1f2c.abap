*------------------------------------------------------------------
* EANDATEN_BME.
* Es wird geprüft, ob EAN-Spezifische Daten zur bisherigen Basis-ME
* vorhanden sind.
*------------------------------------------------------------------
FORM EANDATEN_BME USING FLAG.

CLEAR FLAG.
IF ( NOT MARA-EAN11 IS INITIAL ) OR ( NOT MARA-NUMTP IS INITIAL ) OR
   ( NOT MARA-BRGEW IS INITIAL ) OR ( NOT MARA-GEWEI IS INITIAL ) OR
   ( NOT MARA-VOLUM IS INITIAL ) OR ( NOT MARA-VOLEH IS INITIAL ) OR
   ( NOT MARA-LAENG IS INITIAL ) OR ( NOT MARA-BREIT IS INITIAL ) OR
   ( NOT MARA-HOEHE IS INITIAL ) OR ( NOT MARA-MEABM IS INITIAL ) .
     FLAG = X.
ENDIF.

ENDFORM.
