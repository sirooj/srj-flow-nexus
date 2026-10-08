# BUILDER SLICE B-86 - raw R1 locates, R2 rows, R3 pick-only table, R4 readings (readable XOB diagnostic, MEASURED)

Conventions: kept EA 137076D9 (695359 B, verified at every locate below; hunk C absent: 5-param IsConfirmationCandle, zero hunk-C identifiers). j46 = JUNE0525-B82_JOURNAL.log 9B2F44B6 (diag June, EA 55D91C7E); j44 113541CF (kept). No edit, no compile, no runs, no j47/j48.

## R1 RAW LOCATES (kept EA, by text)

- Selected XOB zone at a shift FOUND: :6911 `bool haveXob = ReadFlow(FL_BUF_XOB_ZONE_HIGH, xobHi, barShift) && xobHi != EMPTY_VALUE &&` (+ :6912 _LOW; same pair :8800-8801). Singular pick-zone only.
- Selected XOB promotion time at a shift FOUND: :8790 `if(!ReadFlow(FL_BUF_XOB_PROMO_TIME, t123_promoT, barShift)) t123_promoT = -1.0;` (pick's only).
- Selected XOB object id FOUND (once, for the record): :6904/:7529/:8775 `ReadFlow(FL_BUF_XOB_OBJ_ID, ...)` (pick's only; defines :2048/31).
- ZoneInPlay for a supplied zone FOUND: :7118 `bool ZoneInPlay(int barShift, double zHi, double zLo,` (shift-callable per given zone).
- Candle OHLC at arbitrary shift FOUND: :2289 `double o = iOpen(_Symbol, PERIOD_CURRENT, barShift);` + :2290 `double h = iHigh(...);` (pattern throughout; l/c same call).
- Confirmation machinery FOUND: :2481 `bool IsConfirmationCandle(const int barShift, const int anchorLine,` + :2482 `const ENUM_SRJ_DIR dir, string &failTerm, const bool allowReclaim = false)` (kept 5-param form; zero `retestShift|g_b61RetestTime|B60C|uj60_` identifiers on disk).
- Runtime loop over every live trade-direction XOB: NOT FOUND (absence confirmed: `for(... < ...XOB` hits 0; all 27 `POI_NLINES` loops iterate POI lines only).
- Runtime kill/invalidation state per XOB: NOT FOUND (absence confirmed: `OBPROV` hits 0; also `obInval|promoBar|KillBar` 0 useful; SXobRecord :748 lives in cross-run scoring bundle SStructuralBundle, used once at :809, not runtime state).

## R2 ROWS (already-recorded counted-touch examples; provenance beside each)

- 2 June (j46 EA 55D91C7E): B60C 15:30 LONG poi=Monthly-POC rt=14:20 rSh=15 cSrc=RETEST; RETESTBOOK 14:20 o=159.721 h=159.727 l=159.716 c=159.727, hits=3 D/W/M-POC all dL; closes 14:25-15:30 all above anchor 159.717 (lowest 14:45 c=159.730); ANCHOR_ELECT 14:20 M-POC rank 6 tier 3 LONG; XOB rows at rt NO ROW; ZONEPICK/INPLAYCOMMIT only at 15:30 (xob 159.679-159.694, committed=0); ROWKEY key M-POC own all-three; TP_ELECT ref 159.771 R25.73 tp 160.723; A6FIRED 15:30; entry 15:35 open; MTEXIT 19:20 TP_TOUCH 159.771->159.900.
- 5 June (j46 EA 55D91C7E): B60C 16:10 LONG poi=Monthly-POC rt=16:00 rSh=3 cSrc=RETEST; RETESTBOOK 16:00 hits=6 all dL; UJBARMAP 16:00 o=160.216 h=160.262 l=159.726 c=160.034; closes 16:05 (160.008) + 16:10 (160.058) above anchor M-POC 159.885; B60POT 16:00 LONG M-POC ltf=-1.0 (C1 seed, no ANCHOR_ELECT print: NO ROW); XOB rows at rt NO ROW; ZONEPICK/INPLAYCOMMIT only at 16:10 (xob 159.881-159.916, committed=0); ROWKEY key M-POC own all-six; TP_ELECT ref 160.059 R1.44 tp 160.723; A6FIRED 16:10; ENTRY_TICKET 16:10 (16:15 open); MTEXIT 19:15 TP_TOUCH 160.059->160.298.

## R3 PICK-ONLY TABLE

| date | session | direction | counted touch candle | confirmation candle | machine-selected XOB zone | machine-selected promotion time | selected-zone in-play at counted candle | opposing candle touches selected zone | machine fire | operator ruling | source build SHA | source journal/run |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 2026.06.02 | NY | LONG | 14:20 o=159.721 h=159.727 l=159.716 c=159.727 | 15:30 | 159.679-159.694 (latest pick at-or-before 14:20 = 11:55 bar; unchanged through 14:55+) | 2026.06.02 11:30 (11:55 INPLAYCOMMIT) | NOT in play (ZONEPICK xobInPlay=0; INPLAYCOMMIT committed=0 at 11:55) | NO: 14:20 range above zone (l=159.716 > hi=159.694, 22 pts); 15:30 range [159.752,159.769] above zone | FIRED 15:30 tp=160.723 r=25.73 sl=159.734 (deal 15:35) | INVALID: no valid XOB retracement or touch at 14:20, no setup; 15:35 buy INVALID (s177-178/s185; journal row 310) | EA 55D91C7E | j46 JUNE0525-B82 |
| 2026.06.05 | NY | LONG | 16:00 o=160.216 h=160.262 l=159.726 c=160.034 | 16:10 | 159.881-159.916 (15:55 pick; ZONEPICK xobInPlay=1) | 2026.06.05 15:40 (15:55 INPLAYCOMMIT) | IN PLAY by pick verdict (xobInPlay=1; INPLAYCOMMIT committed=0 alongside - both prints raw beside) | YES: 16:00 range covers zone (h=160.262 >= 159.881 and l=159.726 <= 159.916); 16:10 range [159.981,160.062] above zone | FIRED 16:10 tp=160.723 r=1.44 sl=159.598 (deal 16:15 open) | VALID long: entry 16:15 open (s151); M POC + M VWAP at 16:00 (s166); 16:00 retest / 16:05 flip / 16:10 confirm / 16:15 160.059 (s169-174) | EA 55D91C7E | j46 JUNE0525-B82 |
Machine-selected distinguished from every-live-XOB: this table uses the pick only; the full map (B-83 R3, 126 live at F1's candle) is NOT re-decided here. Selected-zone result distinguished from full-map result: pick verdicts above; full-map verdicts stay in SLICE_B83. Ruling distinguished from result: ruling column quotes banked words; result columns quote rows.

## R4 READINGS (evidence beside each)

A. PICK-XOB-IN-PLAY (selected zone in play at the counted candle):
- 2 June 14:20: FAIL. Evidence: pick 159.679-159.694 with xobInPlay=0 + committed=0 (11:55 prints, latest at-or-before 14:20). The selected XOB is not in play at the counted candle.
- 5 June 16:00: PASS. Evidence: pick 159.881-159.916 with ZONEPICK xobInPlay=1 (15:55 print). INPLAYCOMMIT committed=0 printed alongside (both raw above); the pick verdict reads in play.
B. PICK-XOB-TOUCH-OPTIONAL (touch informational; both admissible; never reject touching, never require touch):
- 2 June 14:20: PASS (admissible). Evidence: no overlap (22 pts above zone) - and the reading does not reject on that ground; touch is not required either.
- 5 June 16:00: PASS (admissible). Evidence: overlap covers the zone - and the reading does not reject touching rows.
Neither reading is a full implementation of his XOB rule (R5/R7): the full live-XOB requirement is UNKNOWN/NOT READABLE (B-84 K3; R1 items 6-7 absent above).

## R6 COMPARISON (quote banked words, point at rows; never re-decide)

- 2 June: his words (s177-178) "no valid XOB retracement or touch there, so no setup" + "a touch I do not count"; s185 INVALID; row 310 whole. Reading A FAILS the row (pick not in play) - same direction as INVALID (no setup); reading B PASSES it admissible (admissibility only, never a setup verdict). No contradiction: B never promotes a row to a setup.
- 5 June: his words s151 (16:15 open), s166 (M POC + M VWAP at 16:00), s169-174 (16:00 retest / 16:05 flip / 16:10 confirm / 16:15 160.059); register B row 2 (owed 16:15); journal row 306 (VALID LONG off old high 160.723, entry 16:15). Readings A + B both PASS. Agreement.
- No unruled row in this table (both rows ruled; F3/F4 and the population live in SLICE_B83 R4).

## R7 BUILDABILITY (measurement result, not permission)

- BUILDABLE-PICK-ONLY: pick zone (buffers 22/23), pick promo (:8790 buffer 33), candle OHLC (iHigh/iLow), ZoneInPlay (:7118) and confirmation (:2481) are all shift-readable - the pick-only diagnostic above reproduces per row with provenance.
- NOT-BUILDABLE-FULL-XOB-MAP: full live-XOB zones, promotion times and kill states at the counted candle remain NOT READABLE (R1 absences 6-7; B-84 K3 stands).
- BLOCKED-MISSING-RECORD: none (every requested row + provenance present).

## B-85 X1/X2 OUTCOME (for the ledger)

- X1/X2 of this relay are the PLANNER_CONTEXT lesson + history lines (Part X below), not B-85's.

(End of slice)
