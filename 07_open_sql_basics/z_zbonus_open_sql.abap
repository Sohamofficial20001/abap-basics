REPORT z_zbonus_open_sql.

*----------------------------------------------------------------------
* Program – Open SQL Basics
*
* Covers:
* 1) SELECT SINGLE
* 2) SELECT into work area
* 3) SELECT into internal table
* 4) WHERE + ORDER BY
* 5) Aggregate functions
* 6) Proper SY-SUBRC validation
* 7) Basic input validation
*
* Tables used: SCARR, SFLIGHT, SPFLI
*-----------------------------------------------------------------------

PARAMETERS: p_carrid TYPE scarr-carrid DEFAULT 'LH'.

"----------------------------------------------------------------------
" 0) Input validation
"----------------------------------------------------------------------

WRITE: / '--- INPUT VALIDATION ---'.

IF p_carrid IS INITIAL.
  WRITE: / 'Carrier ID cannot be blank'.
  STOP.
ENDIF.

"----------------------------------------------------------------------
" 1) SELECT SINGLE with SY-SUBRC check
"----------------------------------------------------------------------

WRITE: / ' ', / '--- SELECT SINGLE DEMO ---'.

DATA: ls_scarr TYPE scarr.

SELECT SINGLE *
  FROM scarr
  INTO ls_scarr
  WHERE carrid = @p_carrid.

IF sy-subrc = 0.
  WRITE: / 'Airline found: ', ls_scarr-carrid, ls_scarr-carrname.
ELSE.
  WRITE: / 'No airline exists with ID:', p_carrid.
ENDIF.

"----------------------------------------------------------------------
" 2) SELECT ... INTO work area
"----------------------------------------------------------------------

WRITE: / ' ', / '--- SELECT INTO WORK AREA (SPFLI) ---'.

DATA: ls_spfli TYPE spfli.

SELECT *
  FROM spfli
  INTO ls_spfli
  UP TO 1 ROWS.

IF sy-subrc = 0.
  WRITE: / 'Sample Connection:', ls_spfli-carrid, ls_spfli-connid.
ELSE.
  WRITE: / 'No entries exist in SPFLI table.'.
ENDIF.

"----------------------------------------------------------------------
" 3) SELECT INTO INTERNAL TABLE with loop
"----------------------------------------------------------------------

WRITE: / ' ', / '--- SELECT INTO INTERNAL TABLE (SFLIGHT) ---'.

DATA: lt_sflight TYPE STANDARD TABLE OF sflight,
      ls_sflight TYPE sflight.

SELECT *
  FROM sflight
  INTO TABLE lt_sflight
  WHERE carrid = @p_carrid.

IF sy-subrc <> 0.
  WRITE: / 'No flight data found for carrier:', p_carrid.
ELSE.
  WRITE: / 'Total flights fetched:', lines( lt_sflight ).

  LOOP AT lt_sflight INTO ls_sflight.
    WRITE: / ls_sflight-carrid,
            ls_sflight-connid,
            ls_sflight-price.
  ENDLOOP.

ENDIF.

"----------------------------------------------------------------------
" 4) WHERE + ORDER BY with validation
"----------------------------------------------------------------------

WRITE: / ' ', / '--- WHERE + ORDER BY Example ---'.

DATA: lt_sorted TYPE STANDARD TABLE OF sflight,
      ls_sorted TYPE sflight.

SELECT *
  FROM sflight
  INTO TABLE lt_sorted
  WHERE carrid = @p_carrid
    AND price > 0
  ORDER BY price DESCENDING.

IF lt_sorted IS INITIAL.
  WRITE: / 'No priced flights found for:', p_carrid.
ELSE.
  LOOP AT lt_sorted INTO ls_sorted FROM 1 TO 5.
    WRITE: / 'Top price:',
            ls_sorted-carrid,
            ls_sorted-connid,
            ls_sorted-price.
  ENDLOOP.
ENDIF.

"----------------------------------------------------------------------
" 5) Aggregate function (COUNT) with proper check
"----------------------------------------------------------------------

WRITE: / ' ', / '--- AGGREGATE FUNCTION: COUNT ---'.

DATA: lv_count TYPE i.

SELECT COUNT( * )
  FROM sflight
  INTO @lv_count
  WHERE carrid = @p_carrid.

IF sy-subrc = 0 AND lv_count > 0.
  WRITE: / 'Number of SFLIGHT records for', p_carrid, ':', lv_count.
ELSE.
  WRITE: / 'No SFLIGHT records found for:', p_carrid.
ENDIF.

"----------------------------------------------------------------------
" 6) Example of NOT FOUND handling using IF NOT INITIAL
"----------------------------------------------------------------------

WRITE: / ' ', / '--- VALIDATION USING IF INITIAL / NOT INITIAL ---'.

CLEAR ls_scarr.

SELECT SINGLE carrid carrname
  FROM scarr
  INTO CORRESPONDING FIELDS OF ls_scarr
  WHERE carrid = @p_carrid.

IF ls_scarr IS INITIAL.
  WRITE: / 'Carrier validation failed: ID does not exist.'.
ELSE.
  WRITE: / 'Carrier is valid:', ls_scarr-carrname.
ENDIF.

*----------------------------------------------------------------------
* END OF PROGRAM
*----------------------------------------------------------------------
