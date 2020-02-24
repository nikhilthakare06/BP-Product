*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 26.12.2019 at 13:07:45
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZJPVTJPBPVLDRLTY................................*
TABLES: ZJPVTJPBPVLDRLTY, *ZJPVTJPBPVLDRLTY. "view work areas
CONTROLS: TCTRL_ZJPVTJPBPVLDRLTY
TYPE TABLEVIEW USING SCREEN '0001'.
DATA: BEGIN OF STATUS_ZJPVTJPBPVLDRLTY. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZJPVTJPBPVLDRLTY.
* Table for entries selected to show on screen
DATA: BEGIN OF ZJPVTJPBPVLDRLTY_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZJPVTJPBPVLDRLTY.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZJPVTJPBPVLDRLTY_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZJPVTJPBPVLDRLTY_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZJPVTJPBPVLDRLTY.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZJPVTJPBPVLDRLTY_TOTAL.

*.........table declarations:.................................*
TABLES: TB001                          .
TABLES: TB002                          .
TABLES: TB003                          .
TABLES: TB003T                         .
TABLES: ZTJPBPVALIDRLTYP               .
