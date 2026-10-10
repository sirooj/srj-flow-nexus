# BUILDER SLICE B-155 - R1 quotes, R3 table, R4 rows, R5 raw spots, R6 lines (MEASURED)

Runs: RECON62-B153 + JUNE0525-B153 (EA 5A5BD1F0C97F0B9F3F8357A3290EE17E720660278454DE7AC1C372B46184D2B2, Tester/logs/20261010.log). Pack: ROWPACK/CANDLES_B155/ (9 files, pack_line = candle pack line cited in R3).

## R1 his stop record (verbatim, file:line)

- A1 28 Aug SHORT stop 06:30 high 1.16508; first 09:55 "NOT 09:45": SLDEF5_FIVEEXAMPLES.md:47 (Q1 "it is at 6:30 high", SL 1.16508 HAND) + SLDEF5_FIVEEXAMPLES.md:140-147 (Addendum 5 A2: first 09:55 NOT 09:45, second 06:30; skip-witness 09:55/1.16491; monotone-outward PREDICTION note).
- A3 4 Sep LONG 15:30 swing low 1.15847: SLDEF5_FIVEEXAMPLES.md:21-24 (item 2, HAND, two-away quote) + SEP7_CHARTREAD.md:141-143 (Appendix 3: EXACTLY two swings away, Sep-4 15:30 low 1.15847; no imbalance requirement, no walk).
- A4 7 Sep London LONG 8:40 low 1.16098 "full agreement": SEP7_CHARTREAD.md:108-111 + SLDEF5_FIVEEXAMPLES.md:25-26 (item 3). No first/second words on record: FOUND as stated (none).
- A5 7 Sep NY LONG 16:15 low 1.16239, first 16:30: SEP7_CHARTREAD.md:20-25 ("It should be 16:15 low, from two swings away; first swing is 16:30.") + SEP7_CHARTREAD.md:141-143 (Appendix 3: skip 16:30, use 16:15).
- A6 8 Sep London SHORT first 9:50, second 9:40 at 1.16258: SLDEF5_FIVEEXAMPLES.md:72-77 (Addendum 2 A) + SLDEF5_FIVEEXAMPLES.md:97-108 (Addendum 4: second-swing stops) + SEP8_1010-LEVELS.md:7-10 ("Stop: Two swings away at 9:40 candle high for 1.16258").
- A7 8 Sep NY SHORT first 16:50, second 16:20 at 1.16274: SLDEF5_FIVEEXAMPLES.md:78-80 (Addendum 2 B) + SLDEF5_FIVEEXAMPLES.md:97-108 (Addendum 4).
- H3 8 Sep 16:40 refused SHORT: srj-strategy SKILL.md:47 ("SL 1.16359 is the two-swing high of his declined 16:45").
- H5 17 Aug: spec v4.2:208 (stop 1.15835 inside zone 1.15805-1.15843) + spec v4.2:212 (named two-swing instance) + spec v4.2:346 (9.7 zone); record only, 0 UJBARMAP hits for 08-17 (B-154).
- A2, B2, B3, C-06-03: NO HIS STOP ON RECORD (B-154 R1); change detectors only.
- R-AT-OPEN: srj-strategy SKILL.md:31 (verbatim "entry open."). 1R floor inclusive: strategy skill section 2.

## R3 calibration table (pack_line = candle pack line; entry open = entry_ref per R-AT-OPEN)

- A1 SHORT conf 8/28 10:00 entry 10:05 open 1.16466 | his first 09:55 | his stop 06:30 1.16508 | panel two (B-149 R2) | kept 1.16508 | W-P first 09:55 pack 44 / stop 09:45 1.16481 pack 42 | W-O first 09:55 / stop 06:30 1.16508 pack 3 | W-P DIFFERENT (first SAME, stop differs) | W-O SAME | W-O most-extreme beside: YES (06:30 tops the 06:30-09:55 walked span)
- A3 LONG conf 9/4 15:55 entry 16:00 open 1.16018 | his first - | his stop 15:30 1.15847 | panel two | kept 1.15847 | W-P first 15:45 1.15902 pack 10 / stop 15:30 pack 7 | W-O first 15:45 / stop 15:30 | W-P SAME | W-O SAME | most-extreme beside: YES (15:30 lowest of the two)
- A4 LONG conf 9/7 09:15 entry 09:20 open 1.16135 | his first - (none,FOUND) | his stop 08:40 1.16098 | panel two | kept 1.16098 | W-P first 09:10 1.16102 pack 11 / stop 09:00 1.16103 pack 9 | W-O first 09:10 / stop 08:40 1.16098 pack 5 | W-P DIFFERENT | W-O SAME | most-extreme beside: YES (08:40 lowest in 08:40-09:10 walked span)
- A5 LONG conf 9/7 16:40 entry 16:45 open 1.16261 | his first 16:30 | his stop 16:15 1.16239 | panel two | kept 1.16238 (16:05, see R4) | W-P first 16:30 1.16240 pack 26 / stop 16:15 1.16239 pack 23 | W-O first 16:30 / stop 16:15 | W-P SAME | W-O SAME | most-extreme beside: YES (16:15 lower by a point)
- A6 SHORT conf 9/8 10:05 entry 10:10 open 1.16205 | his first 09:50 | his stop 09:40 1.16258 | panel two | kept 1.16258 | W-P first 09:50 1.16251 pack 12 / stop 09:40 pack 10 | W-O first 09:50 / stop 09:40 | W-P SAME | W-O SAME | most-extreme beside: YES
- A7 SHORT conf 9/8 16:55 entry 17:00 open 1.16220 | his first 16:50 | his stop 16:20 1.16274 | panel two | kept 1.16274 | W-P first 16:50 1.16233 pack 96 / stop 16:20 pack 90 | W-O first 16:50 / stop 16:20 | W-P SAME | W-O SAME | most-extreme beside: YES
- H3 SHORT refused conf 9/8 16:40 entry ref 16:45 open 1.16213 | his first - | his stop 09:05 1.16359 | panel UNKNOWN (refused row never in B-149 R2) | row sl 1.16359 R 0.68 refused | W-P first 16:20 1.16274 pack 90 / stop 16:05 1.16250 pack 87 | W-O first 16:20 / stop 09:05 1.16359 pack 3 | W-P DIFFERENT | W-O SAME | most-extreme beside: YES (09:05 tops the 09:05-16:20 walked span)
- H5: UNKNOWN (record only).
- CALIBRATION: W-P DOES NOT CALIBRATE (breakers A1, A4, H3). W-O CALIBRATES (SAME on all 7 deciding rows; H5 UNKNOWN record-only).
- Spec quote beside (not a test): SLREF-1.md:11-13 (his quote via spec 3.7 L202: a valid swing NOT tied to an order block, NOT the most structurally extreme, still takes the stop).

## Change detectors (beside only, no verdict)

- A2 LONG conf 17:30 entry 17:35 1.16022 kept 1.15975 | W-P first 16:55 1.15980 pack 6 / stop 16:45 1.15975 pack 4 = kept | W-O first 16:55 / stop 16:45 = kept.
- B2 LONG conf 6/5 16:10 entry 16:15 160.059 kept 159.598 (6/4 07:30) | W-P first 16:00 159.726 pack 97 / stop 14:55 159.830 (06-05 pack 84) | W-O first 16:00 / stop 6/4 07:30 159.598 (06-04 pack 91) = kept candle+price.
- B3 LONG conf 14:35 entry 14:40 160.524 kept 160.501 (10:30) | W-P first 14:30 160.507 pack 79 / stop 14:00 160.508 pack 73 | W-O first 14:30 / stop 11:15 160.501 pack 40 (same price as kept, earlier candle).
- C-06-03 LONG conf 09:05 entry 09:10 159.929 kept 159.889 (08:35) | W-P first 08:50 159.905 pack 5 / stop 08:35 159.889 pack 2 = kept | W-O same = kept.

## R rows where a walk stop differs from kept (R at entry open to booked target B-141 R2/B-149 R4; floor inclusive)

- A1 W-P 09:45 1.16481: 102/15 = 6.80, floor held (booked 1.16364; kept R 2.43 held).
- A4 W-P 09:00 1.16103: 65/32 = 2.03, held (booked 1.16200).
- H3 W-P 16:05 1.16250: 99/37 = 2.68, clears the floor (row refused at kept/his R 0.68; the W-P stop would NOT refuse - flips the refusal).
- B2 W-P 14:55 159.830: 664/229 = 2.90, held (booked 160.723; kept 1.44 held).
- B3 W-P 14:00 160.508: 63/16 = 3.94, held (booked 160.587).
- B3 W-O 11:15 160.501: same price as kept, R 2.74 as kept, held.

## R4 kept A5 stop

- Candle 7 Sep 16:05 low 1.16238 (09-07 pack line 21, log 1906595). Strict swing YES (pack flag 1: 1.16238 below 16:00 1.16246 and 16:10 1.16243). Beside his 16:15 low 1.16239 (pack 23, log 1906678: one bar later, one point higher) and his first swing 16:30 (pack 26, log 1907138, low 1.16240).

## R5 kept walk read (kept EA 5A5BD1F0, located by text)

- FindNearestSwing EA:3044-3058 (first non-empty swing-buffer slot back from the eval shift, 500 bound, no side test).
- 1-swing: OB-anchored primary (buffer-27 extreme + obSwingSideOk guard, EA:6400-6409) with Task-75 fallback walk (protective-side test EA:6328); print EA:6388 (branch=1-swing obValid=1).
- 2-swing: previous-structure-top walk EA:6443-6474 (comment: first swing anchors runExt REGARDLESS of side; same-turn absorbed; EXCEEDING-by->1pt = candidate; side test on candidate EA:6514-6515; exhaustion fallback to runExt); walk EA:6475-6552; prints EA:6528 + EA:6590 (branch=2-swing obValid=0).
- Finished-wait: NOT FOUND in the walk lines (no bar-closed test at EA:3044-3058 or EA:6475-6552); finished-ness, if any, lives in the indicator's per-slot exports.
- Outward pass: YES (EA:6503-6510: same-turn swings absorbed into runExt; only an exceeding swing becomes the stop candidate).
- A1 on kept 2-swing: first anchors on the 09:55-top cluster (EA:6470-6472: newest-first 1.16491/1.16481/1.16482/1.16479 form ONE structure top); first older exceeding swing = 06:30 1.16508. A1 is the only kept row with obValid=0, hence the only row on this branch (all others print 1-swing per B-154 R0).

## R6 branch input buildability (kept indicator 78D3BFB1 + EA 5A5BD1F0)

- 5m 2xOB state: NOT FOUND (indicator 0 hits on isDoubleOB|2xOB|DoubleOB and on is2OB|htfIsDouble|DOUBLE_OB; EA 0 hits on isDoubleOB|2xOB|DoubleOB|InBiasCount|OBInvCount - paired patterns; drawn, never exported - B-148 R2 stands on the kept pair).
- Imbalance presence: FOUND (EA:174 defines FL_BUF_LTF_FVG_VALID 4; EA:2645 + EA:7744/7748 read it at the bar; kept runs print SIDE1Q fvgValid per B-141 R1).
- Verdict: NOT FOUND overall (spec 3.7:210 needs both halves; the 2xOB half is missing - spec section 8: one flag).

(End of slice)
