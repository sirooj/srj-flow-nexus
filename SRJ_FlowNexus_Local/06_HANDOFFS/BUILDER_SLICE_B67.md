# BUILDER SLICE B-67 - Part B landings, R1-R6 raws (no K/D/T: R6 STOP, MEASURED)

## Part B landing greps + rows
- Skill tags pre-append: 0904-NY-TARGET-LDNHIGH 0, 0908-NY-TARGET-YPOC 0, TARGETS-KEPT-BUILD-CORRECT 0, section-header 0, 4-Sep block 0. Post: section at end, SHA 62B90220.
- Journal existing rows raw: file line 278 row 277: "277,9/4/26,LDN,TF,Bull,Bear,Bear,??,,D VWAP,2,S LQ,[3 links],,0.92R [link],,,,,0.00...". File line 280 row 279: "279,,NY,TF,Bull,Bear,Bull,??,,Y AVP,3,S LQ,[3 links],,++[+zeros]". File line 286 row 285 (9/8 LDN). NO 9/8 NY journal row on record (SEP8 rows live in findings SEP8 review, not the journal).
- Journal appended rows 312 + 313 (UTF-8, byte-verified, 0 U+FFFD). 1065 lines, SHA 89CCF6EE.
- Register: section A row 3 + row 7 notes appended (cells unchanged).
- Ledger 1211: single-line item (^1211. count 1), both blocks verbatim + landing.

## R1 TGT_0904 raws (j28 EA D00F93BB vs j35 EA B8477361)
- j28 15:40-16:00 UJBARMAP (wvwap/close): 15:40 wvwap=1.16020 c=1.15990 (range 1.15920-1.16006); 15:45 wvwap=1.16019 c=1.16006 (range 1.15902-1.16016); 15:50 wvwap=1.16019 c=1.15996 (range 1.15978-1.16044, high wicks through); 15:55 wvwap=1.16019 c=1.16017 (range 1.15964-1.16023).
- j28: UJ1R 15:50 R3.39 PASS (tp=1.16302); UJ1R 15:55 R2.56 PASS; TP_ELECT 15:55 R1.66 (entry=1.16018 sl=1.15847); A6FIRED 15:55 LONG tp=1.16302 (memo wsrc=LOH); UJ1R FIRE R1.66 PASS.
- j35: TP_ELECT 15:55 R0.01 (tp=1.16019); ABORT TP_RR_FAIL (j35:43044); TPCENSUS #195/#196 winner=Weekly-VWAP best=1.16019 distPts=1.

## R2 TGT_0908 raws (j28 vs j35)
- j28: ANCHOR_ELECT 16:05 W-POC SHORT + 16:30 M-POC SHORT (j28:53798); UJ1R 16:35 R0.64 FAIL / 16:40 R0.60 FAIL (tp=1.16114); TP_ELECT 16:40 R0.68 shadow (sl=1.16359, his s47 bar); UJ1R 16:55 R0.67 FAIL; TP_ELECT 16:55 R1.96 (sl=1.16274); A6FIRED 16:55 SHORT tp=1.16114; UJ1R FIRE R1.96 PASS; UJMEMO_PASS wsrc=Yearly-POC; MTSNAP anchor=Monthly-POC entry=1.16220 sl=1.16274 tp=1.16114.
- j35: ANCHOR_ELECT 16:30 M-POC SHORT (j35:51368, same seed); UJ1R 16:35 R0.06 / 16:40 R0.04 FAIL (tp=1.16207); TP_ELECT 16:40 R0.04; ABORT TP_RR_FAIL (j35:52053); 16:55 re-attempt UJ1R R0.08 / TP_ELECT R0.24 / ABORT TP_RR_FAIL (j35:52501).
- B-65 R2 F_GAP row: 16:30 o=1.16224 h=1.16242 l=1.16206 c=1.16206 vs wvwap=1.16207 (body straddles; anchor M-POC + line VWAP; s137/s146 shape, measured only).

## R3 X27_KEPT rows (j28 EA D00F93BB)
- j28:12713 STATE S2->S3 17:05 SHORT W-VWAP; j28:12978 STATE S5->S3 17:15 (old-C touch refusal); j28:13566 ABORT LTF_MISALIGN 17:40 S4 W-VWAP SHORT. UJ1R POLLs pass/fail around (17:00 R1.58 PASS tp=1.16322; 17:05 R0.10 FAIL). No A6FIRED, no 17:05 deal. X27_KEPT = NO_FIRE.

## R4 BREAK_0611 raws
- Register B row 3 + B-52 correction (must-keep; entry owed 14:40 open; D-POC anchor HIS A2; 14:35 retest+confirmation; exit TP_TOUCH 15:20 at 160.587).
- Journal: file line 34 row 33 (6/11 LDN only); NO 11-June-NY row.
- j29 UJBARMAP 14:20-14:35 (dpoc/close): 14:20 dpoc=160.523 (o=160.525 h=160.530 l=160.520 c=160.526); 14:25 dpoc=160.525 c=160.524; 14:30 dpoc=160.523 c=160.522; 14:35 dpoc=160.523 c=160.526.
- Tag KEEP_BY_RECORD.

## R5 BREAK_0604 raws
- Journal: no 6/4 row on record. Register: no 6/4 row anywhere. Not CONFLICT.
- j29 09:10-09:50 UJBARMAP (dpoc=159.884 throughout): 09:10 o=159.876 h=159.888 l=159.866 c=159.879 (seed D-POC SHORT, sess=LONDON); 09:15 o=159.880 h=159.910 l=159.878 c=159.907 (23pts through); 09:20 c=159.903 (above); 09:25-09:45 closes 159.868/159.855/159.837/159.854/159.884; confirm 09:50, fire 09:55 entry 159.868 SL 159.920 tp 159.748 (j36 TP_ELECT R2.31).
- Tag DIES_BY_RECORD (s187 + s181-182; s87 POC-SUPREMACY is exit-hierarchy, superseded on this case by later 10-June words).

## R6 reading + STOP
- Readings tested: (i) live values + machine pointing bars: kills 6/11 at 14:25 (1pt). (ii) frozen at machine pointing bar: kills 6/11 at 14:30 (1pt). (iii) open-side traversal required: breaks 18:10 precedent (equal open killed). (iv) his-retest window (14:35 empty): lands everything, uncodeable generally (instance knowledge; LOGIC-IS-BUILDER'S bars asking).
- Conclusion: no codeable reading reproduces the table -> STOP before Part K. Carried note names 6/11 (breaking instance) + 6/4 (R2 stop row).
- Full instance table: in result R2 + R6 (13 LIVES with margins; DIES 6/4 23pts / 6/11 1pt-drift / 6/10 43pts / 18:05 through-up).
