*------------------------------------------------------------------
*      FELDHISTORIE
*
* Ein geändertes Feld wird beim Anzeigen der Änderungsbeleghistorie =
* MM13 helleuchtend.
*------------------------------------------------------------------
MODULE feldhistorie OUTPUT.

* check t130m-aktyp eq aktypz.

* loop at screen.
*   loop at positions
*       where fname eq screen-name+5(10).
*     screen-intensified = 1.
*     modify screen.
*   endloop.
* endloop.
* CHECK t130m-aktyp NE aktypa AND t130m-aktyp NE aktypz.
*  CHECK bildflag IS INITIAL.           "mk/21.04.95
*
*
*if rmmg2-chargebene <> chargen_ebene_0 and mara-xchpf = 'X'.
*    LOOP AT SCREEN.
*
*      IF screen-name EQ 'MARC-XCHPF'.
*
*        screen-invisible = '0'.
*        screen-active = '1'.
*        screen-input = '1'.
*
*        MODIFY SCREEN.
*      ENDIF.
*
*    ENDLOOP.
*    ELSEif rmmg2-chargebene <> chargen_ebene_0 and mara-xchpf <> 'X'.
*      LOOP AT SCREEN.
*
*      IF screen-name EQ 'MARC-XCHPF'.
*
*        screen-invisible = '0'.
*        screen-active = '1'.
*        screen-input = '0'.
*
*        MODIFY SCREEN.
*      ENDIF.
*
*    ENDLOOP.
*  ENDIF.

ENDMODULE.
