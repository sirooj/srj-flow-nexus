# BUILDER SLICE B-90 - R1 table, R2 stop rows raw, R3 cells, R4 65-pass table, R6 raw function + census rows, greps (SL-leg PXS, MEASURED)

Conventions: kept EA 137076D9; j45 BF03B8A2 (EU, EA 55D91C7E) / j46 9B2F44B6 (UJ). Picks = B-89 corrected trade-direction picks (zone, id, promoT). SL leg = [S5 SLIMB stop swing, counted candle] inclusive, over UJBARMAP (tester feed bars). IN PLAY = leg-range overlap or stop extreme in zone + kill-held (OBPROV code=4). Touch = overlap + promoT≤candle. Retrace = AGAINST + in-play + promoT≤candle. Row MET if either candle MET. Zero tolerance.

## R1 QUOTES (verbatim, file+line)

- XOBSUIT-1 §6-a3 (BUILDER_FINDING_XOBSUIT-1.md:91-94): "no, as long as the SL swing leg is touched or in play from the XOB projection price level that is still valid".
- XOBSUIT-1 §6-a1 (:85-88): "no, only invalidation just like ordinary OB that got invalidated with a candle body closure beyond the midline" (touch never consumes).
- 0604-LDN-NOT-HIS (skill s198): "at that candlestick there is not yet a valid bias for short, it is an invalid CQD divergence, and there is no retest of XOB in play."
- 0602-NY-NO-SETUP (skill s177-178/s185): "there is no valid XOB retracement or touch there, so no setup ever forms for me" + "a touch I do not count".
- Spec §3.5: in-play = zone "penetrated by a bar's range or by a confirmed protective-side swing at any point within the current structural leg", "no recency requirement and no bar-count limit". §3.5.1: "Required order: relevance → retracement or opposing candle → confirmation candle." §3.6: XOB touch "permitted and never disqualifying". §3.7: "The stop is a swing high or low, not an order-block extreme" (three-candle middle-extreme pattern).

## R1 FIRST-PENETRATION TABLE (pick id, obStartT, W-F first UJBARMAP overlap, candles walked)

- 2149 obT 08-28 06:25 → first 06:30 (FOUND next-candle) | 2289 obT 08-31 02:25 → first 02:30 (FOUND) | 2793 obT 09-03 05:55 → first 06:00 (FOUND) | 3130 obT 09-07 08:40 → first 08:45 (FOUND) | 3178 obT 09-07 14:50 → first 14:55 (FOUND) | 2898 obT 09-03 20:30 → first 20:35 (FOUND) | 3913 obT 06-11 05:20 → first 05:25 (FOUND) | 2930 obT 06-03 08:45 → first 08:50 (FOUND) | 3308 obT 06-05 14:35 → first 14:40 (FOUND) | 2789 obT 06-02 11:15 → first 11:20 (FOUND) | 1891 obT 08-26 15:45 → first 15:50 (FOUND) | 2443 obT 05-29 09:05 → first 09:10 (FOUND) | 3068 obT 06-04 03:50 → NONE in 71 walked (NOT FOUND; PWF NOT MET too).

## R2 STOP ROWS (S5-conf-bar SLIMB by text; booked A6FIRED sl beside; journal 301 beside)

- Format: `SLIMB bar=<conf> site=S5 dir=<D> ... slRef=<px> slShiftT=<swing> ... chosenShiftT=<same>` (j45: 297 rows; j46: 180). SLSRC `src=OB_SWING obSwing=` + SL_REF prints at :6325/:6340/:6480.
- A1: (06:30, 1.16508) booked same | A2: (16:45, 1.15975) booked same = journal row 301 sl (only journal stop on record; all other rows NO ROW, never filled) | A3: (09-03 05:55, 1.15907) booked 1.15847 DIFFERENT | A4: (09-07 08:40, 1.16098) booked same | A5: (09-07 14:55, 1.16218) booked 1.16238 DIFFERENT | A6: (09-03 20:35, 1.16379) booked 1.16258 DIFFERENT | A7: same swing booked 1.16274 DIFFERENT | B3: (06-11 05:25, 160.488) booked 160.501 DIFFERENT | C3: (06-03 08:50, 159.905) booked 159.889 DIFFERENT | B2: (06-05 14:35, 159.881) booked 159.598 DIFFERENT | F1: (06-02 11:20, 159.678) booked 159.734 DIFFERENT | F2: (08-26 15:50, 1.16652) no fire | F3: (06-04 01:40, 160.012) booked 159.920 DIFFERENT | F4: (06-10 09:00, 160.325, S2POLL) no fire.
- Legs: A1 [06:30,09:55]; A2 [16:45,16:45]+[16:45,17:25]; A3 [05:55,15:40/15:50]; A4 [08:40,09:00/09:10]; A5 [14:55,16:05/16:35]; A6 [20:35,10:00]; A7 [20:35,16:50]; B3 [05:25,14:05/14:30]; C3 [08:50,09:00]; B2 [14:35,16:00]; F1 [11:20,14:20]; F2 [15:50,16:25]; F3 [01:40,09:10/09:45]; F4 [09:00,15:30].

## R3 CELLS (leg candles walked, first hit, stopInZone, touch, retrace, PXS; all picks kill-held, no OBPROV kill ≤ candle)

- A1 09:55: legN 42 first 06:30 stopIn F | t NOT MET r MET | PXS MET
- A2 16:45: legN 1 none stopIn F | t NOT MET r NOT MET | 17:25: legN 9 none | t NOT MET r NOT MET | PXS NOT MET
- A3 15:40: legN 406 stopIn T(1.15907=lo) | t MET r NOT MET(WITH) | 15:50: legN 408 | t NOT MET r MET | PXS MET
- A4 09:00: legN 5 first 08:40 stopIn T | t MET r MET | 09:10: legN 7 | t MET r MET | PXS MET
- A5 16:05: legN 15 none stopIn F | t NOT MET r NOT MET | 16:35: legN 21 first 14:55 | t MET r MET | PXS MET
- A6 10:00: legN 738 first 20:35 stopIn F | t NOT MET r MET | PXS MET
- A7 16:50: legN 820 first 20:35 stopIn F | t NOT MET r MET | PXS MET
- B3 14:05: legN 105 first 05:25 stopIn F | t NOT MET r NOT MET(WITH) | 14:30: legN 110 | t NOT MET r MET | PXS MET
- C3 09:00: legN 3 first 08:50 stopIn F(1.159905, 1pt under lo) | t MET r MET | PXS MET
- B2 16:00: legN 18 first 14:35 stopIn T(159.881=lo) | t MET r MET | PXS MET
- F1 14:20: legN 37 first 11:20 stopIn F(159.678, 1pt under lo) | t NOT MET r NOT MET(WITH) | PXS NOT MET
- F2 16:25: legN 296 first 15:50 stopIn F | t NOT MET r MET | PXS MET (beside)
- F3 09:10: legN 91 none stopIn F | t NOT MET r NOT MET | 09:45: legN 98 first 01:40 stopIn T(160.012=hi) | t NOT MET r MET | PXS MET
- F4 15:30: no pick | PXS UNKNOWN (beside)
- Row PXS: A1-A7 MET except A2 NOT MET; B3/C3/B2 MET; F1 NOT MET; F2 MET; F3 MET; F4 UNKNOWN.

## R4 65-PASS TABLE (pass: MACH vs PXS; stop = latest same-dir SLIMB ≤ pass bar)

EU 08-26 09:10: NOT MET/NOT MET SAME | 15:10: MET/MET SAME | 16:20: NO ROW/NOT MET DIFF | 16:50: NO ROW/NOT MET DIFF | 17:40: NO ROW/NOT MET DIFF | 17:55: NO ROW/NOT MET DIFF | 08-27 11:45: MET/MET SAME | 11:55: MET/MET SAME | 17:00: MET/MET SAME (F2) | 17:10: MET/MET SAME | 17:20: MET/MET SAME | 08-28 10:00: MET/MET SAME FIRE (A1) | 16:20: MET/MET SAME | 16:55: NOT MET/NOT MET SAME | 18:45: NOT MET/NOT MET SAME | 08-31 10:30: NOT MET/NOT MET SAME | 16:35: MET/MET SAME | 09-01 09:10: MET/MET SAME | 09:45: MET/MET SAME | 15:25: NOT MET/NOT MET SAME | 16:00: NOT MET/NOT MET SAME REFUSAL | 16:10: MET/MET SAME | 17:30: MET/NOT MET DIFF FIRE (A2) | 09-02 14:40: MET/MET SAME | 16:30: MET/MET SAME | 17:45: NOT MET/NOT MET SAME | 09-03 10:55: MET/MET SAME | 14:05: NOT MET/NOT MET SAME | 18:25: NOT MET/NOT MET SAME REFUSAL | 09-04 09:25: MET/MET SAME | 09:40: MET/MET SAME REFUSAL | 11:05: NOT MET/NOT MET SAME | 11:20: NOT MET/NOT MET SAME | 11:30: NOT MET/NOT MET SAME | 15:35: MET/MET SAME | 15:55: MET/MET SAME FIRE (A3) | 09-07 09:15: MET/MET SAME FIRE (A4) | 16:40: MET/MET SAME FIRE (A5) | 09-08 09:35: MET/MET SAME | 10:05: MET/MET SAME FIRE (A6) | 16:20: MET/MET SAME | 16:40: MET/MET SAME | 16:55: MET/MET SAME FIRE (A7)
UJ (22 passes): 05-27 15:30: MET/MET SAME FIRE | 05-29 10:45 NOT MET/NOT MET SAME | 14:05 MET/MET SAME | 15:05 MET/MET SAME | 06-01 10:40 MET/MET SAME | 11:05 NOT MET/MET DIFF | 15:00 MET/MET SAME | 06-02 15:30 NOT MET/NOT MET SAME FIRE (F1) | 06-03 09:05 MET/MET SAME FIRE (C3) | 14:55 MET/MET SAME | 16:05 MET/NOT MET DIFF | 06-04 09:50 MET/MET SAME FIRE (F3 fire) | 17:05 MET/MET SAME | 06-05 09:15 NOT MET/NOT MET SAME | 16:10 MET/MET SAME FIRE (B2) | 06-09 15:20 MET/NOT MET DIFF REFUSAL | 17:55 MET/NOT MET DIFF | 06-10 09:55 MET/MET SAME | 10:25 MET/UNKNOWN DIFF REFUSAL | 16:05 MET/UNKNOWN DIFF (F4) | 06-11 11:20 MET/MET SAME | 14:35 MET/MET SAME FIRE (B3)

Counts: 11 PXS-vs-MACH diffs (four 08-26 NO-ROWs→NOT MET; A2 MET→NOT MET FIRE; 06-01 11:05 NOT MET→MET; 06-03 16:05 MET→NOT MET; 09-02 17:45 NOT MET→MET; 09-04 09:25 MET→NOT MET; 06-09 15:20 MET→NOT MET REFUSAL; 06-10 10:25/16:05 MET→UNKNOWN, first a REFUSAL). Fires 13: MET 11 / NOT MET 2 (A2, F1). Refusals 5: MET 1 (09-04 09:40) / NOT MET 3 (09-01 16:00, 09-03 18:25, 06-09 15:20) / UNKNOWN 1 (06-10 10:25).

Note on R4 SAME lines: every non-DIFF pass was verified SAME (PXS==MACH) in pxs_r4.out; the DIFF list above is complete (11). A5/A6/A7/B3/C3/B2 fire passes read PXS MET on the same legs as R3.

## R6 RAW FUNCTION + CENSUS ROWS (four bias-differs candles)

```
 int SRJ_NearestPromotedOBIndex(const string bias)
   {
    int bestIdx   = -1;
    int bestStart = SRJ_NA_INT;
    int n = g_orderblocks.Total();
    for(int k=0; k<n; k++)
      {
       COrderblock *ob = GetOB(g_orderblocks,k);
       if(ob==NULL) continue;
       bool matches = (bias=="bullish" && ob.isBullish) ||
                      (bias=="bearish" && !ob.isBullish);
       if(!matches)         continue;
       if(!ob.isPromoted)   continue;   // must be an XOB
       if(!ob.isValid)      continue;   // still valid
       if(!ob.isActivated)  continue;   // still activated
       bool better = (bestIdx < 0) || (ob.startBar > bestStart);
       if(better) { bestIdx = k; bestStart = ob.startBar; }
      }
    return bestIdx;
   }
```
Trade-side census evaluation (promoT ≤ candle, no kill ≤ candle, printed valid/activated; nearest = max obStart): A2-16:45 LONG → 2545 (obStart 16:20, promoT 16:40) DIFFERENT from B-89 2289; A2-17:25 LONG → 2549 (obStart 16:45, promoT 17:25) DIFFERENT; A5-16:05 LONG → 3178 (obStart 14:50, promoT 15:30) DIFFERENT from B-89 3130-carry; F3-09:10 SHORT → 3107 (obStart 08:55, promoT 09:05) DIFFERENT from B-89 2443-carry. Re-grades: A2-17:25 + 2549 (1.15975-1.16013) touch MET (overlap + promoT 17:25 = candle; same-candle edge flagged) → A2 row MET → R5 WOULD change to SEPARATES on this alternative; A2-16:45 + 2545 UNZONED (no zone on record) → UNKNOWN; A5-16:05 + 3178 touch MET (row stays MET); F3-09:10 + 3107 UNZONED → UNKNOWN (row → UNKNOWN; never decides).
Buildability: stop/SL-leg FOUND (:5849 + :6325 + :6340/:6480 + :9690 S5); OHLC FOUND; promoT FOUND (side caveat); trade-direction pick NOT FOUND; kill state NOT FOUND (zero OBPROV). Verdict NOT-BUILDABLE (trade-direction pick zone; also kill state).

## GREPS (before/after)

- B1 phrase = 1; message = B-89 reply only → no new words.
- X1 `B-90-SL-LEG-INPLAY` 0→1; `relay B-90` §5 0→1. X2 `B-90:` §3 0→1. X3 `B90-SLLEG-INPLAY-READ` 0→1; `^1235.` 0→1. X4 pointer 20→20 lines.
- Gate: `git diff 6e9d484 --stat -- <paths>` EMPTY (all 0.3 files + ledger + register + skills + spec). Journal 1066. terminal.ini 5F0336A0 + 3 charts ACCOUNTED re-save noise (re-verified same drift).

(End of slice)
