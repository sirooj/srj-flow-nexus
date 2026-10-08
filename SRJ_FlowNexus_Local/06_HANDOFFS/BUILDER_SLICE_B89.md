# BUILDER SLICE B-89 - R1 print rows + corrected picks, R2 quotes, R3 cells per window, R4 65-pass table, greps (trade-direction PXF, MEASURED)

Conventions: kept EA 137076D9; .B82C 55D91C7E; j45 BF03B8A2 (EU, EA 55D91C7E) / j46 9B2F44B6 (UJ); jB87 8EA948C5. B-88 pick = latest ZONEPICK print ≤ candle (any dir). Corrected pick = latest print ≤ candle with dir==trade. promoT = latest INPLAYCOMMIT print (buffer 33). Zero tolerance. PXF-touch = overlap + promoT≤candle. PXF-retrace = AGAINST + spec-in-play + promoT≤candle. BOTH: either MET. Walks over UJBARMAP (tester feed bars); swing half via B-83 P-cells; kill-held via OBPROV code=4.

## R1 PRINT ROWS (B-88 used vs corrected; census side = rows listing the zone)

- A1 09:55 SHORT: used Z@09:55 dir=SHORT 1.16492-1.16507 (census A1/A6/A7) | CORRECT same (SAME)
- A2 16:45 LONG: used Z@16:05 dir=SHORT 1.16081-1.16100 (census id 2495 "1.16081-1.161" under A6/A7 SHORT only) | CORRECT Z@08-31 16:30 dir=LONG 1.15855-1.15862 (census 2289 under A2; promo 08-31 02:35; xobInPlay=1, committed=1; 20h stale noted) (DIFFERENT)
- A2 17:25 LONG: used Z@16:05 SHORT (same as above) | CORRECT same 08-31 16:30 LONG (DIFFERENT; next 17:30 print carries 2549 1.15975-1.16013 promoT 17:25, touched by 17:25 - same-candle edge noted)
- A3 15:40 LONG: used Z@15:40 dir=LONG 1.15907-1.15933 (A3/A4/A5) | CORRECT same (SAME)
- A3 15:50 LONG: used Z@15:45 dir=LONG same zone | CORRECT same (SAME)
- A4 09:00 LONG: used Z@09:00 dir=LONG 1.16098-1.16109 (A4/A5) | CORRECT same (SAME)
- A4 09:10 LONG: used Z@09:00 LONG (same) | CORRECT same (SAME)
- A5 16:05 LONG: used Z@15:05 dir=SHORT 1.16362-1.16377 (census 2898 under A6/A7 only) | CORRECT Z@09:07 09:00 dir=LONG 1.16098-1.16109 (A4/A5; promo 08:55) (DIFFERENT)
- A5 16:35 LONG: used Z@16:15 dir=LONG 1.16229-1.16253 (A5) | CORRECT same (SAME)
- A6 10:00 SHORT: used Z@10:00 dir=SHORT 1.16362-1.16377 (A6/A7) | CORRECT same (SAME)
- A7 16:50 SHORT: used Z@16:50 dir=SHORT same zone | CORRECT same (SAME)
- B3 14:05+14:30 LONG: used Z@11:05 dir=LONG 160.489-160.504 (B3; next 14:35 same) | CORRECT same (SAME)
- C3 09:00 LONG: used Z@09:00 dir=LONG 159.906-159.913 (B2/B3/C3/F4) | CORRECT same (SAME)
- B2 16:00 LONG: used Z@15:55 dir=LONG 159.881-159.916 (B2/B3/F4; next 16:05 same) | CORRECT same (SAME)
- F1 14:20 LONG: used Z@11:55 dir=LONG 159.679-159.694 (C3/F1; unchanged thru 14:55+) | CORRECT same (SAME)
- F2 16:25 SHORT: used Z@11:55 dir=SHORT 1.16612-1.16640 (no zoned census row; next 17:00 same) | CORRECT same (SAME)
- F3 09:10 SHORT: used Z@06-03 18:50 dir=LONG 159.861-159.913 (no zoned row) | CORRECT Z@05-29 15:25 dir=SHORT 159.304-159.330 (promo 05-29 09:45; committed=1; 6d stale) (DIFFERENT)
- F3 09:45 SHORT: used Z@09:45 dir=SHORT 160.001-160.012 (F3) | CORRECT same (SAME)
- F4 15:30 LONG: used Z@10:25 dir=LONG --- (empty; next 15:50 differs) | CORRECT same empty (SAME)
- Planner readings verified: 2495-zone-under-A6/A7 FOUND; 2898-under-A6/A7 FOUND.
- B-88 PX re-grade on corrected: A2 NOT MET→MET; A5-16:05 candle NOT MET→MET (row stays MET); F3 MET→NOT MET. Rows changing: A2, F3.

## R1 BUILDABILITY (in-bias vs trade-direction)

- Indicator :1210 `if(!SrjIsNa(g_s.currentBias))` + :1212 `int xobIdx = SRJ_NearestPromotedOBIndex(g_s.currentBias);` + :1218-1230 publish zone/id/promo of the IN-BIAS pick (selector :1095-1100: bias match + isPromoted + isValid + isActivated; defaults EMPTY/0.0 at :1206-1209).
- EA reads 22/23 at any shift FOUND (:6911/:8800). Trade-direction content when bias side differs NOT FOUND (no per-side buffer; instances: A2-16:45/17:25, A5-16:05, F3-09:10 printed opposite-side picks).

## R2 QUOTES (record only)

- Bar-range test :7123-7125 (`bHi=iHigh(barShift); bLo=iLow(barShift); if(bHi>=zLo && bLo<=zHi) return true;`) covers the single evaluation barShift. Swing walk bounded: SL leg to stopRef (:7158-7167), stop-less two-swing/500-iteration depth (:7145-7156).
- Spec §3.5: penetration "at any point within the current structural leg" + "no recency requirement and no bar-count limit". §9.10: build consults eval bar + two swings. XOBSUIT-1 §6-a3: SL-leg walk, claims match with §3.5 (beside).
- Verdict DIFFERENT on coverage, no ruling.

## R3 CELLS (corrected pick id, obStartT, held, walkF(first)/walkP(first), PWF/PWP, touch, rWF, rWP, PXF, PXP)

- A1 09:55: 2149 obT 08-28 06:25 held | walkF 42 (06:30) walkP 39 (none) PWF MET PWP NOT MET | t NOT MET rWF MET rWP NOT MET | PXF MET PXP NOT MET
- A2 16:45: 2289 obT 08-31 02:25 held | walkF 460 (08-31 02:30) walkP 458 (03:25) PWF MET PWP MET | t NOT MET rWF MET rWP MET | PXF MET PXP MET
- A2 17:25: 2289 held | walkF 468 walkP 466 PWF MET PWP MET | t NOT MET rWF MET rWP MET | PXF MET PXP MET
- A3 15:40: 2793 obT 09-03 05:55 held | walkF 405 (09-03 06:00) walkP 402 (09-04 15:30) PWF MET PWP MET | t MET rWF NOT MET rWP NOT MET | PXF MET PXP MET
- A3 15:50: 2793 held | walkF 407 walkP 404 PWF MET PWP MET | t NOT MET rWF MET rWP MET | PXF MET PXP MET
- A4 09:00: 3130 obT 09-07 08:40 held | walkF 4 (08:45) walkP 1 (09:00) PWF MET PWP MET | t MET rWF MET rWP MET | PXF MET PXP MET
- A4 09:10: 3130 held | walkF 6 walkP 3 PWF MET PWP MET | t MET rWF MET rWP MET | PXF MET PXP MET
- A5 16:05: 3130 held | walkF 89 (08:45) walkP 86 (09:00) PWF MET PWP MET | t NOT MET rWF MET rWP MET | PXF MET PXP MET
- A5 16:35: 3178 obT 09-07 14:50 held | walkF 21 (14:55) walkP 13 (15:50) PWF MET PWP MET | t MET rWF MET rWP MET | PXF MET PXP MET
- A6 10:00: 2898 obT 09-03 20:30 held | walkF 738 (09-03 20:35) walkP 725 (none) PWF MET PWP NOT MET | t NOT MET rWF MET rWP NOT MET | PXF MET PXP NOT MET
- A7 16:50: 2898 held | walkF 820 walkP 807 (none) PWF MET PWP NOT MET | t NOT MET rWF MET rWP NOT MET | PXF MET PXP NOT MET
- B3 14:05: 3913 obT 06-11 05:20 held | walkF 105 (05:25) walkP 67 (10:05) PWF MET PWP MET | t NOT MET rWF NOT MET(WITH) rWP NOT MET | PXF NOT MET PXP NOT MET
- B3 14:30: 3913 held | walkF 110 walkP 72 PWF MET PWP MET | t NOT MET rWF MET rWP MET | PXF MET PXP MET
- C3 09:00: 2930 obT 06-03 08:45 held | walkF 3 (08:50) walkP 0 (touch candle itself) PWF MET PWP NOT MET | t MET rWF MET rWP NOT MET | PXF MET PXP MET
- B2 16:00: 3308 obT 06-05 14:35 held | walkF 17 (14:40) walkP 4 (16:00) PWF MET PWP MET | t MET rWF MET rWP MET | PXF MET PXP MET
- F1 14:20: 2789 obT 06-02 11:15 held | walkF 37 (11:20) walkP 34 (none) PWF MET PWP NOT MET | t NOT MET rWF NOT MET(WITH) rWP NOT MET | PXF NOT MET PXP NOT MET
- F2 16:25: 1891 obT 08-26 15:45 held | walkF 296 (08-26 15:50) walkP 293 (none) PWF MET PWP NOT MET | t NOT MET rWF MET rWP NOT MET | PXF MET PXP NOT MET
- F3 09:10: 2443 obT 05-29 09:05 held | walkF 1153 (05-29 09:10) walkP 1145 (05-29 10:30) PWF MET PWP MET | t NOT MET rWF MET rWP MET | PXF MET PXP MET
- F3 09:45: 3068 obT 06-04 03:50 held | walkF 71 (none) walkP 59 (none) PWF NOT MET PWP NOT MET | t NOT MET rWF NOT MET rWP NOT MET | PXF NOT MET PXP NOT MET
- F4 15:30: no pick (empty buffer) | UNKNOWN / UNKNOWN
- Row PXF-WF: A1-A7 MET, B3 MET (via 14:30), C3 MET, B2 MET, F1 NOT MET, F2 MET, F3 MET (via 09:10), F4 UNKNOWN.
- Row PXP: A1 NOT MET, A2 MET, A3 MET, A4 MET, A5 MET, A6 NOT MET, A7 NOT MET, B3 MET, C3 MET, B2 MET, F1 NOT MET, F2 NOT MET, F3 MET, F4 UNKNOWN.
- Beside B-83 (WF/WP/MACH): SAME on every R3 cell.
- Buffers 22/23 publish FOUND (:708 bind; :1206-1230). Post-invalidation publish NOT FOUND (2149 held 06:40-15:30+ through touches; no invalidated id still published).

## R4 65-PASS TABLE (pass: MACH X vs PXF-WF vs PXP; 43 EU + 22 UJ)

EU 08-26 09:10: NOT MET/UNKNOWN/NOT MET DIFF | 15:10: MET/MET/MET SAME | 16:20: NOROW/UNKNOWN/NOT MET DIFF | 16:50: NOROW/UNKNOWN/NOT MET DIFF | 17:40: NOROW/UNKNOWN/NOT MET DIFF | 17:55: NOROW/UNKNOWN/NOT MET DIFF | 08-27 11:45: MET/MET/MET SAME | 11:55: MET/MET/MET SAME | 17:00: MET/MET/NOT MET SAME (F2) | 17:10: MET/MET/NOT MET SAME | 17:20: MET/MET/NOT MET SAME | 08-28 10:00: MET/MET/NOT MET SAME FIRE (A1) | 16:20: MET/MET/MET SAME | 16:55: NOT MET/NOT MET/NOT MET SAME | 18:45: NOT MET/NOT MET/NOT MET SAME | 08-31 10:30: NOT MET/NOT MET/NOT MET SAME | 16:35: MET/MET/MET SAME | 09-01 09:10: MET/MET/MET SAME | 09:45: MET/MET/MET SAME | 15:25: NOT MET/NOT MET/NOT MET SAME | 16:00: NOT MET/MET/MET DIFF REFUSAL | 16:10: MET/MET/NOT MET SAME | 17:30: MET/MET/MET SAME FIRE (A2) | 09-02 14:40: MET/MET/MET SAME | 16:30: MET/MET/NOT MET SAME | 17:45: NOT MET/MET/MET DIFF | 09-03 10:55: MET/MET/MET SAME | 14:05: NOT MET/NOT MET/NOT MET SAME | 18:25: NOT MET/MET/NOT MET DIFF REFUSAL | 09-04 09:25: MET/MET/NOT MET SAME | 09:40: MET/MET/MET SAME REFUSAL | 11:05: NOT MET/NOT MET/NOT MET SAME | 11:20: NOT MET/NOT MET/NOT MET SAME | 11:30: NOT MET/NOT MET/NOT MET SAME | 15:35: MET/MET/MET SAME | 15:55: MET/MET/MET SAME FIRE (A3) | 09-07 09:15: MET/MET/MET SAME FIRE (A4) | 16:40: MET/MET/MET SAME FIRE (A5) | 09-08 09:35: MET/MET/MET SAME | 10:05: MET/MET/NOT MET SAME FIRE (A6) | 16:20: MET/MET/MET SAME | 16:40: MET/MET/NOT MET SAME | 16:55: MET/MET/NOT MET SAME FIRE (A7)
UJ 05-27 15:30: MET/MET/MET SAME FIRE | 05-29 10:45: NOT MET/UNKNOWN/NOT MET DIFF | 14:05: MET/MET/MET SAME | 15:05: MET/MET/MET SAME | 06-01 10:40: MET/MET/NOT MET SAME | 11:05: NOT MET/MET/NOT MET DIFF | 15:00: MET/MET/MET SAME | 06-02 15:30: NOT MET/NOT MET/NOT MET SAME FIRE (F1) | 06-03 09:05: MET/MET/MET SAME FIRE (C3) | 14:55: MET/MET/MET SAME | 16:05: MET/NOT MET/NOT MET DIFF | 06-04 09:50: MET/MET/MET SAME FIRE (F3 fire) | 17:05: MET/MET/MET SAME | 06-05 09:15: NOT MET/NOT MET/NOT MET SAME | 16:10: MET/MET/MET SAME FIRE (B2) | 06-09 15:20: MET/UNKNOWN/NOT MET DIFF REFUSAL | 17:55: MET/MET/NOT MET SAME | 06-10 09:55: MET/MET/NOT MET SAME | 10:25: MET/UNKNOWN/UNKNOWN DIFF REFUSAL | 16:05: MET/UNKNOWN/UNKNOWN DIFF (F4) | 06-11 11:20: MET/MET/MET SAME | 14:35: MET/MET/MET SAME FIRE (B3)

Counts: 14 PXF-vs-MACH diffs. Fires 13: WF MET 12 / NOT MET 1 (F1); WP MET 9 / NOT MET 4 (A1, A6, A7, F1). Refusals 5: WF MET 3 (09-01 16:00, 09-03 18:25, 09-04 09:40) / UNKNOWN 2; WP MET 2 / NOT MET 2 / UNKNOWN 1.

## R6 INPUTS (EA line by text; counted candle .B82C)

- Trade-direction pick zone: read FOUND (:6911/:8800) but trade-side content when bias differs NOT FOUND (no per-side buffer). PromoT (33) FOUND (:8790, same side caveat). Formation time NOT FOUND (no obStart export; buffers 30/39 are leg/swing times, EA reads :7076/:5015 - checked different). OHLC FOUND (:2289+). Swings FOUND (6/7 reads :7128/:6082/:6133). B60C candle FOUND (:9392/:9413/:9602 + :2551).
- Verdicts: W-F NOT-BUILDABLE (trade-direction pick zone; also formation time). W-P NOT-BUILDABLE (trade-direction pick zone).

## GREPS (before/after)

- B1 phrase = 1; message = B-88 reply only → no new words.
- Direction prints: A2-16:05 SHORT vs A2-LONG (FOUND); A5-15:05 SHORT vs A5-LONG (FOUND); 2495-under-A6/A7 (FOUND); 2898-under-A6/A7 (FOUND).
- X1 `B-89-TRADE-DIRECTION-PICK` 0→1; `relay B-89` §5 0→1. X2 `B-89` §3 0→1. X3 `B89-PICKF-INPLAY-READ` 0→1; `^1234.` 0→1. X4 pointer 20→16 lines.
- Gate: `git diff 04a2f5e --stat -- <paths>` EMPTY (all 0.3 files + ledger + register + skills + spec). Journal 1066. terminal.ini 5F0336A0 + 3 charts ACCOUNTED re-save noise (re-verified same drift).

(End of slice)
