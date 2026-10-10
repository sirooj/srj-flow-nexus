# BUILDER SLICE B-154 - R0 rows, R1 quotes, R2 candle tables, R3/R4 tables, R5 (MEASURED)

Runs: RECON62-B153 + JUNE0525-B153 (EA 5A5BD1F0C97F0B9F3F8357A3290EE17E720660278454DE7AC1C372B46184D2B2, Tester/logs/20261010.log). Candles: UJBARMAP in that log (first-occurrence line cited; values identical across runs in the log). Strict swing per spec 3.7 (middle extreme strictly beyond both neighbours; equal is not a swing).

## R0 kept stops B-153 beside B-149 R3 machine (sl, sl_swing_bar, sl_branch_printed from SETUPS; pack lines from INDEX_B153)

- A1 SHORT 8/28: B153 sl 1.16508, swing NOT PRINTED, branch 2SWING (SETUPS_RECON62-B153.csv:15; INDEX_B153.md:3) | B149 machine 1.16508 (RESULT_B149.md:46) | SAME
- A2 LONG 9/1: 1.15975, NOT PRINTED, 1SWING (:13; INDEX:4) | 1.15975 (:47) | SAME
- A3/H1 LONG 9/4: 1.15847, NOT PRINTED, 1SWING (:28; INDEX:5) | 1.15847 vs 2nd 15:45 1.15902 (:48) | SAME (kept = B149 stop; verdict DIFFERENT stands on the spec-second)
- A4 LONG 9/7 LDN: 1.16098, NOT PRINTED, 1SWING (:2; INDEX:6) | 1.16098 vs 2nd 09:00 1.16103 (:49) | SAME
- A5 LONG 9/7 NY: 1.16238, NOT PRINTED, 1SWING (:4; INDEX:7) | 1.16238 vs 2nd 16:15 1.16239 (:50) | SAME
- A6/H2 SHORT 9/8 LDN: 1.16258, NOT PRINTED, 1SWING (:9; INDEX:8) | 1.16258 vs 2nd 09:50 1.16251 (:51) | SAME
- A7/H4 SHORT 9/8 NY: 1.16274, NOT PRINTED, 1SWING (:17; INDEX:9) | 1.16274 = 2nd 16:20 (:52) | SAME
- B2 LONG 6/5: 159.598, NOT PRINTED, 1SWING (SETUPS_JUNE0525-B153.csv:20; INDEX:11) | 159.598 vs 2nd 16:00 159.726 (:53) | SAME
- B3 LONG 6/11: 160.501, NOT PRINTED, 1SWING (:19; INDEX:12) | 160.501 (:54) | SAME
- C-06-03 LONG 6/3: 159.889, NOT PRINTED, 1SWING (:4; INDEX:14) | 159.889 (:55) | SAME
- H3 refused C-09-08-1645 SHORT 16:40: sl 1.16359, R 0.68 (RECON62 :16; INDEX:22) | B149 n/a (never graded) | beside only

## R1 his stop record (verbatim with file:line; A/B rows without his words marked)

- H1 HIS: BUILDER_FINDING_SLDEF5_FIVEEXAMPLES.md:21-24 "Sep-4 LONG ... SL 1.15847 HAND ("15:30 swing low"...)" + BUILDER_FINDING_SEP7_CHARTREAD.md:92-94 "vs his 15:30 swing low 1.15847". Journal row 312 (OPERATOR_TRADE_JOURNAL.csv:1064) names target only.
- H2 HIS: BUILDER_FINDING_SEP8_1010-LEVELS.md:7-10 "Stop: Two swings away at 9:40 candle high for 1.16258". Journal row 285 (CSV:286) names session/read only.
- H3 HIS: .opencode/skills/srj-strategy/SKILL.md:47 "SL 1.16359 is the two-swing high of his declined 16:45".
- H4 HIS: BUILDER_FINDING_SLDEF5_FIVEEXAMPLES.md:78-80 "Entry 17:00 open 1.16220 ... SL two swings: first 16:50, second 16:20 at 1.16274". Register SL 1.16275 [R60 G4] (REGISTER:27) differs by one point, noted beside. Journal row 313 (CSV:1065) names target only.
- H5 HIS (record only, outside windows): spec v4.2:212 (two-swing reference at 1.15835, strong-signal no-imbalance) + spec v4.2:346 (zone 1.15805-1.15843, stop 1.15835 inside).
- A1 HIS: SLDEF5_FIVEEXAMPLES.md:47 "YES - "it is at 6:30 high". SL 1.16508 ... HAND".
- A2 NO HIS STOP ON RECORD (FINDING greps for 1.15975: 0 HAND).
- A4 HIS: SLDEF5_FIVEEXAMPLES.md:25-26 "SL 1.16098 ... all HAND ("full agreement")".
- A5 HIS: SLDEF5_FIVEEXAMPLES.md:28-29 "SL 1.16239 HAND" + SEP7_CHARTREAD.md:22-25 (his 16:15 second-swing rule); kept 1.16238 differs by one point, noted beside.
- B2 NO HIS STOP ON RECORD. B3 NO HIS STOP ON RECORD (FINDING greps for 159.598/160.501: 0 HAND; code-prose hits only).

## R2 candle census (UJBARMAP, Tester/logs/20261010.log; log line = first occurrence)

H1 LONG entry 16:00 open 1.16019 (retest 15:40, conf 15:55). All lows protective (below entry).
- 15:25 o1.16233 h1.16270 l1.16232 c1.16258 (L1297292) no (left neighbour for triple)
- 15:30 o1.16260 h1.16260 l1.15847 c1.15945 (L1297333) SWING HIS (1.15847<1.16232,<1.15914; right 15:35 closed before conf)
- 15:35 o1.15946 h1.16018 l1.15914 c1.15964 (L1297415) no
- 15:40 o1.15964 h1.16006 l1.15920 c1.15990 (L1297847) no [retest]
- 15:45 o1.15990 h1.16016 l1.15902 c1.16006 (L1297917) SWING (right 15:50 closed before conf)
- 15:50 o1.16007 h1.16044 l1.15978 c1.15996 (L1298114) no
- 15:55 o1.15997 h1.16023 l1.15964 c1.16017 (L1298298) SWING [conf] (right 16:00 closes after conf: unconfirmed at conf)
- 16:00 o1.16018 h1.16037 l1.15989 c1.15990 (L1298755) no [entry]
- 16:05 o1.15990 h1.16007 l1.15968 c1.15982 (L1298797) no (right neighbour for 16:00)

H2 SHORT entry 10:10 open 1.16205 (retest 09:40, conf 10:05). All highs protective (above entry).
- 09:35 o1.16228 h1.16233 l1.16211 c1.16230 (L1317577) no (left neighbour)
- 09:40 o1.16230 h1.16258 l1.16230 c1.16248 (L1317886) SWING HIS (1.16258>1.16233,>1.16250; right closed before conf)
- 09:45 o1.16247 h1.16250 l1.16232 c1.16240 (L1317934) no
- 09:50 o1.16238 h1.16251 l1.16227 c1.16232 (L1317979) SWING (right closed before conf)
- 09:55 o1.16233 h1.16233 l1.16210 c1.16210 (L1318020) no
- 10:00 o1.16210 h1.16229 l1.16198 c1.16223 (L1318053) no
- 10:05 o1.16222 h1.16232 l1.16206 c1.16207 (L1318116) SWING [conf] (right 10:10 closes after conf: unconfirmed at conf)
- 10:10 o1.16205 h1.16206 l1.16177 c1.16190 (L1318541) no [entry]

H4 SHORT entry 17:00 open 1.16220 (retest 16:45, conf 16:55). Highs protective.
- 16:15 o1.16236 h1.16241 l1.16226 c1.16234 (L1320933) no (left neighbour)
- 16:20 o1.16232 h1.16274 l1.16232 c1.16252 (L1321158) SWING HIS/KEPT (right closed before conf)
- 16:25 o1.16252 h1.16263 l1.16219 c1.16224 (L1321363) no
- 16:30 o1.16224 h1.16242 l1.16206 c1.16206 (L1321395) no
- 16:35 o1.16206 h1.16230 l1.16187 c1.16217 (L1321469) no
- 16:40 o1.16217 h1.16224 l1.16202 c1.16212 (L1321671) no [H3 conf]
- 16:45 o1.16213 h1.16225 l1.16197 c1.16217 (L1322163) no [A7 retest; H3 entry ref]
- 16:50 o1.16218 h1.16233 l1.16208 c1.16225 (L1322206) SWING (right 16:55 closes with conf: boundary)
- 16:55 o1.16226 h1.16230 l1.16210 c1.16220 (L1322274) no [conf]
- 17:00 o1.16220 h1.16248 l1.16219 c1.16241 (L1322690) no [entry]

H3 SHORT refused, entry ref 1.16213 (conf 16:40 per SETUPS :16). Stop triple: 09:00 o1.16309 h1.16343 l1.16297 c1.16342 (L1317280); 09:05 o1.16344 h1.16359 l1.16311 c1.16312 (L1317313) SWING HIS; 09:10 o1.16311 h1.16311 l1.16286 c1.16301 (L1317350). Conf 16:40 (L1321671), entry bar 16:45 (L1322163). Four protective-side swings lie strictly between on the same log: 09:40 (L1317886), 09:50 (L1317979), 10:05 (L1318116), 16:20 (L1321158); so 09:05 is k>=5 under any walk from 16:30/16:40/16:45 (exact k UNKNOWN; full 93-candle enumeration not printed).

H5 record only: UJBARMAP bar=2026.08.17 in 20261010.log = 0 hits (NOT FOUND); no grade.

A2 control triple: 16:40 l1.15981 (L1266893); 16:45 o1.16013 h1.16013 l1.15975 c1.15990 (L1266922) SWING; 16:50 l1.15986 (L1266965). OB 1.15975-1.16013 (SETUPS :13): stop = OB low = swing, OB-anchored k=1.

## R3 count readings (inclusive plain walk: strict swings at or before the start candle, nearest first; reproduces B-149 R3 seconds; skip = protective-side only - identical here since every listed swing is protective)

| row | a-conf skip | a-conf no-skip | b-retest skip | b-retest no-skip | c-entry skip | c-entry no-skip | kept k |
|---|---|---|---|---|---|---|---|
| H1 his 15:30 | 3 | 3 | 1 | 1 | 3 | 3 | SAME (kept = his) |
| H2 his 09:40 | 3 | 3 | 1 | 1 | 3 | 3 | SAME |
| H3 his 09:05 | >=5 (exact UNKNOWN) | >=5 (UNKNOWN) | >=5 (UNKNOWN) | >=5 (UNKNOWN) | >=5 (UNKNOWN) | >=5 (UNKNOWN) | SAME price on refused row |
| H4 his=kept 16:20 | 2 | 2 | 1 | 1 | 2 | 2 | SAME |
| A2 OB-anchored | 1 from OB | 1 from OB | 1 from OB | 1 from OB | 1 from OB | 1 from OB | SAME (B-149 one-swing) |

## R4 calibration (CALIBRATES = his stop k=2 on every two-swing instance AND A2 k=1; H5 graded UNKNOWN)

- a-skip: H1 3, H2 3, H3 >=5, H4 2, H5 UNKNOWN, A2 plain-UNKNOWN (OB 1) = DOES NOT CALIBRATE (breakers H1, H2, H3)
- a-no: same values = DOES NOT CALIBRATE (breakers H1, H2, H3)
- b-skip: H1 1, H2 1, H3 >=5, H4 1 = DOES NOT CALIBRATE (breakers H1, H2, H3, H4)
- b-no: same = DOES NOT CALIBRATE (breakers H1, H2, H3, H4)
- c-skip: H1 3, H2 3, H3 >=5, H4 2 = DOES NOT CALIBRATE (breakers H1, H2, H3)
- c-no: same = DOES NOT CALIBRATE (breakers H1, H2, H3)
- Beside: H1 kept SAME, H2 kept SAME, H3 refused-row SAME, H4 kept SAME (register 1.16275 DIFFERENT by one point), H5 n/a. No FEED (every his price is a strict swing on the tester candles).

## R5 outcome

Nothing calibrates. Every one of the six readings breaks on H1/H2 (k=3 inclusive from conf/entry; k=1 from retest), on H3 (k>=5 everywhere), and on the retest start for H4 (k=1). Next record-first search before any Part S: his walk-origin/exclusion rule - (1) does his two-swing walk exclude the confirmation/entry candle itself; (2) does it admit only swings whose right neighbour had closed before confirmation; (3) which intermediate swings does he skip between 09:05 and 16:40 and why. Sources in order: strategy skill walk/skip lines, SEP7/SEP8 findings, journal rows 277/285/312/313, spec 3.7:195-214. No edit drafted.

(End of slice)
