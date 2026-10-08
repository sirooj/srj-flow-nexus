# BUILDER SLICE B-91 - Part B greps, R1 census, R2 cells, R3, R4 65-pass table, R6; under 600 lines (single in-play condition, MEASURED)

Conventions: kept EA 137076D9; j45 BF03B8A2 (EU, EA 55D91C7E) / j46 9B2F44B6 (UJ). Picks = B-89 corrected trade-direction picks (zone, id, promoT) for R2/R3; pass-local same-dir prints for R4. IN PLAY = window-range overlap or stop extreme in zone + kill-held (OBPROV code=4). Touch = overlap + promoT≤candle. NO against term anywhere (his words). Row MET if either candle MET. Zero tolerance.

## Part B GREPS (before/after)

- Quote 1 ("what i meant by retrace and in play are the same thing"): skill 0→1, ledger 0. Quote 2 ("when i reexplain a rule..."): skill 0→1, ledger 0. Journal CSV both 0→0 NOT APPENDED (1066 lines).

## R1 CENSUS (register → label + counted candle on j45/j46, or ABSENT + grep)

- A: A1 09:55 SHORT BOTH / A2 16:45+17:25 LONG BOTH / A3 15:40+15:50 LONG BOTH / A4 09:00+09:10 LONG BOTH / A5 16:05+16:35 LONG BOTH / A6 10:00 SHORT PRIOR / A7 16:50 SHORT PRIOR (j45 B60C).
- B: B1 5 June London SHORT ABSENT (no B60C 09:40 j46; A6REFUSED SEEDBIAS_REFUSED 09:40 row instead); B2 16:00 LONG RETEST j46; B3 14:05+14:30 LONG BOTH j46.
- C: C3 09:00 LONG j46 (VALID-taken, must-keep); F1 14:20 LONG RETEST j46; F2 16:25 SHORT RETEST j45; F3 09:10+09:45 SHORT BOTH j46; F4 15:30 LONG RETEST j46; 4 Sep 10:40 SHORT ABSENT (no B60C 10:35-10:40 j45; 2-of-3 kill pre-confirmation); 1 Sep 15:30 → C-1530 (B60C bar=15:30 SHORT rt=15:25 RETEST j45); 28 Aug 16:25 nearest B60C bar=16:20 (16:05+16:15), 5 min prior, not R2-graded (E6-only era); 8 Sep 16:45 LONG ABSENT (no LONG B60C, only SHORT 16:40; correctly rejected); 8/28 news ABSENT (no bar on record; kill-all declined).
- R1 QUOTES (verbatim): XOBSUIT-1 §6-a3 (FINDING:91-94): "no, as long as the SL swing leg is touched or in play from the XOB projection price level that is still valid"; §6-a1 (:85-88): "no, only invalidation just like ordinary OB that got invalidated with a candle body closure beyond the midline"; 0604 s198: "at that candlestick there is not yet a valid bias for short, it is an invalid CQD divergence, and there is no retest of XOB in play."; 0602 s177-178: "there is no valid XOB retracement or touch there, so no setup ever forms for me." + "a touch I do not count"; spec §3.5 (in play, no recency), §3.5.1 (relevance→retracement→confirmation REQUIRED), §3.6 (opposing candle closes against; XOB touch permitted), §3.7 (stop = swing high/low, three-candle middle extreme).
- R1 FIRST-PENETRATION (pick id, obStartT → first UJBARMAP overlap): 2149 06:25→06:30, 2289 08-31 02:25→02:30, 2793 09-03 05:55→06:00, 3130 09-07 08:40→08:45, 3178 09-07 14:50→14:55, 2898 09-03 20:30→20:35, 3913 06-11 05:20→05:25, 2930 06-03 08:45→08:50, 3308 06-05 14:35→14:40, 2789 06-02 11:15→11:20, 1891 08-26 15:45→15:50, 2443 05-29 09:05→09:10, 3068 NONE in 71 walked. FOUND next-candle penetration every pick except 3068.

## R2 CELLS (candle: pick@printbar zone promoT verdict | touch | MACH-1 | WF-1 (walkF/PWF) | WP-1 (walkP/PWP) | PXS-1 (leg/stopIn))

- A1 09:55: 2149@09:55 06:40 v0 | t NOT MET | M1 NOT MET | WF MET (walk 42 first 06:30; PWF MET) | WP NOT MET (walk none; PWP NOT MET) | PXS MET (leg [06:30,09:55] hit 06:30)
- A2 16:45: 2289@08-31 16:30 v1 promo 08-31 02:35 | t NOT MET | M1 MET | WF MET (walk 460 first 02:30) | WP MET (walk 458 first 03:25) | PXS leg [16:45,16:45] single, no overlap, stop outside → NOT MET
- A2 17:25: same pick | t NOT MET | M1 MET | WF MET | WP MET | PXS leg [16:45,17:25] N=9 none → NOT MET
- A3 15:40: 2793@15:40 v1 promo 09-03 06:10 | t MET | M1 MET | WF MET | WP MET | PXS leg [05:55,15:40] stopIn (1.15907=lo) → MET
- A3 15:50: 2793@15:45 v1 | t NOT MET | M1 MET | WF MET | WP MET | PXS MET (stopIn)
- A4 09:00: 3130@09:00 v1 promo 08:55 | t MET | M1 MET | WF MET (walk 4 first 08:45) | WP MET (walk 1) | PXS MET (stopIn 1.16098=lo)
- A4 09:10: same pick | t MET | M1 MET | WF MET | WP MET | PXS MET
- A5 16:05: 3130@09:00 v1 promo 08:55 | t NOT MET | M1 MET | WF MET | WP MET | PXS leg [14:55,16:05] N=15 none, stop 1.16218 outside → NOT MET
- A5 16:35: 3178@16:15 v1 promo 15:30 | t MET | M1 MET | WF MET | WP MET | PXS MET
- A6 10:00: 2898@10:00 v0 promo 09-03 21:35 | t NOT MET | M1 NOT MET | WF MET (walk 738 first 20:35; PWF MET) | WP NOT MET | PXS leg [20:35,10:00] hit 20:35 → MET
- A7 16:50: 2898@16:50 v0 | t NOT MET | M1 NOT MET | WF MET | WP NOT MET | PXS MET
- B3 14:05: 3913@11:05 v1 promo 08:30 | t NOT MET | M1 MET | WF MET (walk 105 first 05:25) | WP MET (walk 67 first 10:05) | PXS leg [05:25,14:05] hit → MET
- B3 14:30: same pick | t NOT MET | M1 MET | WF MET | WP MET | PXS MET
- C3 09:00: 2930@09:00 v1 promo 09:00 | t MET | M1 MET | WF MET (walk 3 first 08:50) | WP MET (touch; walk 0) | PXS MET
- B2 16:00: 3308@15:55 v1 promo 15:40 | t MET | M1 MET | WF MET (walk 17 first 14:40) | WP MET (walk 4) | PXS MET (stopIn 159.881=lo)
- F1 14:20: 2789@11:55 v0 promo 11:30 | t NOT MET (22pts above) | M1 NOT MET | WF MET (walk 37 first 11:20; PWF MET) | WP NOT MET (walk none; PWP NOT MET) | PXS leg [11:20,14:20] hit 11:20 → MET
- F2 16:25: 1891@11:55 v0 promo 08-26 16:00 | t NOT MET | M1 NOT MET | WF MET (walk 296 first 15:50) | WP NOT MET | PXS leg [15:50,16:25] hit → MET
- F3 09:10: 2443@05-29 15:25 v0 promo 05-29 09:45 | t NOT MET | M1 NOT MET | WF MET (walk 1153 first 09:10) | WP MET (walk 1145 first 10:30) | PXS leg [01:40,09:10] N=91 none, stop outside → NOT MET
- F3 09:45: 3068@09:45 v0 promo 04:50 | t NOT MET | M1 NOT MET | WF NOT MET (walk 71 none; PWF NOT MET) | WP NOT MET | PXS leg [01:40,09:45] hit 01:40 + stopIn (160.012=hi) → MET
- F4 15:30: no pick (empty buffer) | all UNKNOWN
- C1530 15:25: 2289 SHORT v0 promo 08-31 02:35 | t NOT MET | M1 NOT MET | WF MET (walk obT→candle hit) | WP MET (walk promo→candle hit) | PXS leg [15:25,15:25] single no-overlap, stop 1.15943 outside → NOT MET
- All R2 picks kill-held at their candles (no OBPROV code=4 ≤ candle on any R2 id; kills 1205 j45 / 1336 j46 belong to other ids).

## R2 STOPS (S5-conf SLIMB pair = row-bound time+price; booked A6FIRED sl + journal beside)

- A1 (06:30, 1.16508) booked same | A2 (16:45, 1.15975) booked same = journal row 301 (only journal stop on record) | A3 (09-03 05:55, 1.15907) booked 1.15847 DIFFERENT | A4 (09-07 08:40, 1.16098) booked same | A5 (09-07 14:55, 1.16218) booked 1.16238 DIFFERENT | A6 (09-03 20:35, 1.16379) booked 1.16258 DIFFERENT | A7 same swing booked 1.16274 DIFFERENT | B3 (06-11 05:25, 160.488) booked 160.501 DIFFERENT | C3 (06-03 08:50, 159.905) booked 159.889 DIFFERENT | B2 (06-05 14:35, 159.881) booked 159.598 DIFFERENT | F1 (06-02 11:20, 159.678) booked 159.734 DIFFERENT | F2 (08-26 15:50, 1.16652) no fire | F3 (06-04 01:40, 160.012) booked 159.920 DIFFERENT | F4 (06-10 09:00, 160.325 S2POLL) no fire | C1530 (15:30 S3ARM, 1.15943 @15:25) S3ARM/S2POLL rows, no S5 (no fire).

## R3 (section C per grade vs his words; F-labels)

- F1 0602 ("no valid XOB retracement or touch"): MACH-1 NOT MET AGREES, WF-1 MET DIFFERENT, WP-1 NOT MET AGREES, PXS-1 MET DIFFERENT.
- F3 0604 ("no retest of XOB in play"): MACH-1 NOT MET AGREES, WF-1 MET DIFFERENT, WP-1 MET DIFFERENT, PXS-1 MET DIFFERENT; beside: row 13 no-short-bias (4H bear/1H bull/15m bull), W2 invalid CQD (blue-solid type-1 bullish).
- F2 beside 8/27-NY-INVALID (D VWAP below 1R, target-step); F4 beside 0610-NY-INVALID (15:45 body close); C1530 beside tester-only (absent from his 7); B1/4Sep/28Aug1625/8Sep1645/news ABSENT as R1.

## R4 65-PASS TABLE (pass: MACH-1/WF-1/WP-1/PXS-1; stop = row stop for register passes else latest same-dir SLIMB)

EU 08-26 09:10: UNKNOWN/UNKNOWN/NOT MET/NOT MET 08.26 15:10: MET/MET/MET/MET 08.26 16:20: UNKNOWN/UNKNOWN/MET/NOT MET 08.26 16:50: UNKNOWN/UNKNOWN/MET/NOT MET 08.26 17:40: UNKNOWN/UNKNOWN/MET/NOT MET 08.26 17:55: UNKNOWN/UNKNOWN/MET/NOT MET 08.27 11:45: UNKNOWN/UNKNOWN/MET/NOT MET 08.27 11:55: UNKNOWN/UNKNOWN/MET/NOT MET 08.27 17:00: NOT MET/MET/NOT MET/MET 08.27 17:10: NOT MET/MET/NOT MET/MET 08.27 17:20: NOT MET/MET/NOT MET/MET 08.28 10:00: NOT MET/MET/NOT MET/MET FIRE 08.28 16:20: MET/MET/MET/MET 08.28 16:55: MET/MET/MET/MET 08.28 18:45: NOT MET/NOT MET/MET/NOT MET 08.31 10:30: NOT MET/NOT MET/NOT MET/NOT MET 08.31 16:35: MET/MET/MET/MET 09.01 09:10: MET/MET/MET/MET 09.01 09:45: MET/MET/MET/MET 09.01 15:25: NOT MET/MET/MET/NOT MET 09.01 16:00: NOT MET/MET/MET/NOT MET REFUSAL 09.01 16:10: NOT MET/MET/MET/MET 09.01 17:30: MET/MET/MET/NOT MET FIRE 09.02 14:40: MET/MET/MET/MET 09.02 16:30: NOT MET/MET/NOT MET/MET 09.02 17:45: NOT MET/MET/MET/NOT MET 09.03 10:55: MET/MET/MET/MET 09.03 14:05: NOT MET/MET/NOT MET/MET 09.03 18:25: NOT MET/MET/MET/NOT MET REFUSAL 09.04 09:25: MET/MET/NOT MET/MET 09.04 09:40: MET/MET/MET/MET REFUSAL 09.04 11:05: MET/MET/NOT MET/NOT MET 09.04 11:20: MET/MET/NOT MET/NOT MET 09.04 11:30: MET/MET/NOT MET/NOT MET 09.04 15:35: MET/MET/MET/MET 09.04 15:55: MET/MET/MET/MET FIRE 09.07 09:15: MET/MET/MET/MET FIRE 09.07 16:40: MET/MET/MET/MET FIRE 09.08 09:35: NOT MET/MET/MET/NOT MET 09.08 10:05: NOT MET/MET/NOT MET/MET FIRE 09.08 16:20: MET/MET/MET/MET 09.08 16:40: NOT MET/MET/NOT MET/MET 09.08 16:55: NOT MET/MET/NOT MET/MET FIRE
UJ 05-27 15:30: NOT MET/MET/MET/MET FIRE 05.29 10:45: UNKNOWN/UNKNOWN/NOT MET/NOT MET 05.29 14:05: UNKNOWN/UNKNOWN/MET/NOT MET 05.29 15:05: UNKNOWN/MET/MET/MET 06.01 10:40: NOT MET/MET/MET/MET 06.01 11:05: NOT MET/MET/NOT MET/MET 06.01 15:00: MET/MET/MET/MET 06.02 15:30: NOT MET/MET/NOT MET/MET FIRE 06.03 09:05: MET/MET/MET/MET FIRE 06.03 14:55: NOT MET/MET/MET/MET 06.03 16:05: NOT MET/MET/NOT MET/NOT MET 06.04 09:50: NOT MET/MET/MET/MET FIRE 06.04 17:05: MET/MET/MET/MET 06.05 09:15: NOT MET/MET/MET/NOT MET 06.05 16:10: MET/MET/MET/MET FIRE 06.09 15:20: UNKNOWN/UNKNOWN/NOT MET/NOT MET REFUSAL 06.09 17:55: NOT MET/MET/NOT MET/NOT MET 06.10 09:55: MET/MET/NOT MET/MET 06.10 10:25: UNKNOWN/UNKNOWN/UNKNOWN/UNKNOWN REFUSAL 06.10 16:05: UNKNOWN/UNKNOWN/UNKNOWN/UNKNOWN 06.11 11:20: MET/MET/MET/MET 06.11 14:35: MET/MET/MET/MET FIRE

Diffs vs old split (MACH/PXF-WF/PXF-WP/PXS): MACH-1 29, WF-1 12, WP-1 11, PXS-1 7 (named per-cell lists below; NO-ROW old cells excluded from counts). Fires 13 - MACH-1: MET 7/NOT MET 6; WF-1: MET 13; WP-1: MET 9/NOT MET 4 (A1, A6, A7, F1); PXS-1: MET 12/NOT MET 1 (A2). Refusals 5 - MACH-1: MET 1 (09-04 09:40)/NOT MET 2/UNKNOWN 2; WF-1: MET 3/UNKNOWN 2; WP-1: MET 3/NOT MET 1/UNKNOWN 1; PXS-1: MET 1 (09-04 09:40)/NOT MET 3/UNKNOWN 1.

- M1 diffs (29): 08-26 09:10 NOT MET→UNKNOWN; 08-27 11:45/11:55 MET→UNKNOWN; 08-27 17:00/17:10/17:20 MET→NOT MET; 08-28 10:00 MET→NOT MET (A1); 08-28 16:55 NOT MET→MET; 09-01 16:10 MET→NOT MET; 09-02 16:30 MET→NOT MET; 09-04 11:05/11:20/11:30 NOT MET→MET; 09-08 09:35/10:05/16:40/16:55 MET→NOT MET (latter three incl. A6, A7 fires); 05-27 15:30 MET→NOT MET; 05-29 10:45 NOT MET→UNKNOWN; 05-29 14:05/15:05 MET→UNKNOWN; 06-01 10:40 MET→NOT MET; 06-03 14:55/16:05 MET→NOT MET; 06-04 09:50 MET→NOT MET; 06-09 15:20 MET→UNKNOWN REFUSAL; 06-09 17:55 MET→NOT MET; 06-10 10:25/16:05 MET→UNKNOWN (first REFUSAL).
- WF diffs (12): 08-27 11:45/11:55 MET→UNKNOWN; 08-28 16:55 NOT MET→MET; 09-01 15:25 NOT MET→MET; 09-03 14:05 NOT MET→MET; 09-04 11:05/11:20/11:30 NOT MET→MET; 05-29 14:05 MET→UNKNOWN; 06-02 15:30 NOT MET→MET (F1); 06-03 16:05 NOT MET→MET; 06-05 09:15 NOT MET→MET.
- WP diffs (11): 08-26 16:20/16:50/17:40/17:55 NOT MET→MET; 08-28 16:55 NOT MET→MET; 08-28 18:45 NOT MET→MET; 09-01 15:25 NOT MET→MET; 09-01 16:10 NOT MET→MET; 09-03 18:25 NOT MET→MET REFUSAL; 06-01 10:40 NOT MET→MET; 06-05 09:15 NOT MET→MET.
- PXS diffs (7): 08-27 11:45/11:55 MET→NOT MET; 08-28 16:55 NOT MET→MET; 09-03 14:05 NOT MET→MET; 09-08 09:35 MET→NOT MET; 05-29 14:05 MET→NOT MET; 06-02 15:30 NOT MET→MET (F1).

## R6 INPUTS (EA line by text; B-89/B-90 findings carried, no new verdict)

- Trade-direction pick zone: read FOUND (:6911/:8800) but trade-side content when bias differs NOT FOUND (no per-side buffer; B-89 R1 instances). PromoT (33) FOUND (:8790, same side caveat). Formation time NOT FOUND (no obStart export; buffers 30/39 are leg/swing times, EA reads :7076/:5015 - checked different). OHLC FOUND (:2289+). Swings FOUND (6/7 reads :7128/:6082/:6133). B60C candle FOUND (.B82C :9392/:9413/:9602 + :2551). Kill state NOT FOUND (zero OBPROV consumers).
- MACH-1 input note: verdict prints (ZONEPICK :8873/INPLAYCOMMIT :9286) exist only at evaluated bars - hence the 13 R4 UNKNOWNs; same coverage caveat as B-89 R6.

## GREPS (before/after)

- Part B: Quote 1 skill 0→1, ledger 0; Quote 2 skill 0→1, ledger 0; journal 0→0 NOT APPENDED (1066 lines).
- X1 `B-91-RETRACE-IS-IN-PLAY` 0→1; `relay B-91` §5 0→1. X2 `B-91:` §3 0→1. X3 `B91-INPLAY-ONE-READ` 0→1; `^1236.` 0→1. X4 pointer 20→20 lines.
- Gate: `git diff d360537 --stat -- <paths>` EMPTY. terminal.ini 5F0336A0 + 3 charts ACCOUNTED re-save noise (re-verified same drift).

(End of slice)
