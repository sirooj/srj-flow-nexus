# BUILDER SLICE B-128 - raw spots, raw rows, R3 population table (retest-carry XOB, MEASURED)

Scope: reads + text records only. No edit, no compile, no run. Indicator/includes/HTFEngine untouched. XOB fence: kept-path confirmations (cSrc=PRIOR/BOTH, kept confirm=1) never graded.

## START GATE (raw)

- `git ls-remote backup builder/B-127` = `6bea3a95a54075f0b37b3a77c4f309caedce4994` (verified; cut builder/B-128 here).
- `git log -1` = `6bea3a9 B-127 5 June 16:10 confirmation candle line-by-line reading (relay B-127); verdict MEASURED`.
- `git status --short` count = 481 (pre-existing + untracked, preserved, none staged).
- Eleven-path diff vs 6bea3a9 EMPTY (pointer, RESULT_B127, SLICE_B127, CENSUS_B127, ledger, PLANNER_CONTEXT, PLANNER_HANDOFF, register, both skills, spec, journal CSV).
- Ledger `^1272.`=1, B127-tag=1, `^1273.`=0, `B128-`=0 everywhere. PLANNER_CONTEXT `B127-WHOLE-PATH-BEFORE-HUNK`=1, `relay B-127`=1, `B128-ADDED-ROWS-ONLY`=0, `relay B-128`=0. PLANNER_HANDOFF `B-127:`=1, `B-128:`=0. Journal 1066 lines.
- SHAs: EA 137076D9CF85 (695359 B LF-only) / EX5 FA4C924978F6 / .B82C 55D91C7E / .B126FLIPRT 9C1F8D33 / indicator 956BF3E3ADB7 / ind-ex5 27B5F272DCFA / HTFEngine D5FD5B063E75 / terminal.ini 4082A94F (all PASS). Journals: j45 BF03B8A2 / j46 9B2F44B6 / j39 408E5073 / j40 1D968931 / j43 8EDD1254 / j44 113541CF (all PASS, 06_HANDOFFS/).

## PART B (counts)

- Operator message = B-127 reply line only. `no new rule words`; appended nothing.
- Banked words: B-65 heading 1 (s176) + `no valid XOB retracement or touch there` 1 (s178); B-91 heading 1 (s201) + retrace pin 1 (s202); NO-CASCADE 1 (s205); CONFIRMATION-CANONICAL 1 (s112); SAME-CANDLE-PERMITTED 1 (s107). Nothing appended.

## R2 RAW SPOTS (kept EA 137076D9; .B82C 55D91C7E)

- Defines EA:206-207 `FL_BUF_XOB_ZONE_HIGH 22` / `FL_BUF_XOB_ZONE_LOW 23`; EA:2048 `FL_BUF_XOB_OBJ_ID 31`; EA:2063 `FL_BUF_XOB_PROMO_TIME 33`.
- Reads at shift: EA:6904 objId; EA:6911-6912 zone hi/lo; EA:8775 objId (S3PICK, pairs with promo by bar); EA:8790 promoT + EA:8792 XOBPROMO print (bar/site/xobId/raw/promoT); EA:8800-8801 zone hi/lo (S3PICK).
- ZoneInPlay EA:7118-7169 (signature + bar-overlap EA:7125 + nearest-swing EA:7131 + SL-leg walk EA:7158-7167; silent EA:7113).
- ZONEPICK EA:8873-8883 (bar/dir=g_dir/haveFvg/fvgInPlay/haveXob/xobInPlay/downgraded/fvg/xob; census note EA:8860). INPLAYCOMMIT EA:9286-9306 (bar/dir/zoneSrc/zoneLo/zoneHi/promoT/applied/bounded/scanned/swings/hits/firstShift/firstVal/commitVia/legacy/legacyVia/committed/changed/haveStop).
- .B82C:2542-2547 (retestShift guard + iHigh/iLow at retestShift; uj60_tR exact :2544; uj60_tP prior exact :2545; touch=(tR||tP) :2546; cSrc :2547); B60C print :2552-2557 (rt/rSh/rBar/cSrc); stamp :8447/:8801; clear :6856; call sites :9392/:9413/:9602 (iBarShift on stamped time).

## R1 RAW ROWS (strategy skill + journal)

- s177-178 his verbatim 2 June paragraph (14:20 no valid XOB retracement or touch, no setup; 15:35 answers a touch he does not count; 5m never ages/kills a retest) + s185 0602-NY-NO-SETUP. s201-205 B-91 (retrace-is-in-play verbatim s202; NO-CASCADE s205). s112 + s107 + s151 + s165-166 + s169-174 (as B-127). Spec 1.2 L52 + 3.5 L124 + 3.5.1 L143 (REQUIRED) + 3.6 L158 (XOB touch PERMITTED never disqualifying) + 10 L362. Register C 2 June row. Journal row 310 (file 1062, INVALID 15:35 LONG 159.774, his ANSWER 6/2 words) + row 306 (file 1058, VALID 5 June 16:15 open 160.723) + row 309 (file 1061, B-52 M POC + M VWAP at 16:00).

## R3 POPULATION (every cSrc=RETEST B60C; BOTH/PRIOR counted only)

- Counts: j45 20 RETEST / 22 BOTH / 5 PRIOR; j46 8 / 14 / 1; j39 19 / 21 / 5; j40 8 / 14 / 1 (verified on disk; j46-vs-j40 ZERO set differences). Pick dir == trade dir on every printed pick (ZONEPICK dir carries g_dir); no DIFFERENT row. Retest-bar zone prints ABSENT on every multi-bar row (verified 16:00/14:20/16:25 + all rSh>1 rows carry conf-bar prints only); same-bar rows (rSh=1) carry conf==rt prints.
- Columns: run conf dir anchor rt=rSh | retest o/h/l/c | pick lo-hi dir id promoT | SAME | promoBefore(YES/NO/UNK) | XT-TOUCH(YES/NO/UNK) | XT-INPLAY(MET/NOT MET/UNK) | outcome.
- j46 (hunk C RKD): `05-29 10:45 LONG D-VWAP rt10:45 rSh1 | 159.288/159.298/159.262/159.292 | 159.180-159.194 LONG id2385 promo00:35 | SAME | YES | NO(above) | MET(comm1,conf==rt) | NO FIRE (end UNK)`.
- j46 `06-01 10:40 LONG M-VWAP rt10:05 rSh8 | 159.454/159.465/159.433/159.448 | 159.382-159.407 LONG id2566 promo03:15 | SAME | YES | NO | UNK | NO FIRE (S54KILL same-line diff-rt 10:10 noted)`.
- j46 `06-01 15:00 LONG M-POC rt14:05 rSh12 | 159.460/159.469/159.459/159.465 | 159.382-159.407 LONG id2566 promo03:15 | SAME | YES | NO | UNK | NO FIRE (S54KILL diff-rt 14:10 noted)`.
- j46 `06-02 15:30 LONG M-POC rt14:20 rSh15 | 159.721/159.727/159.716/159.727 | 159.679-159.694 LONG id2789 promo11:30 | SAME | YES | NO(22pts above) | UNK | FIRED entry 15:35 159.774 (A6FIRED R25.73)`.
- j46 `06-03 16:05 LONG D-POC rt15:50 rSh4 | 159.891/159.930/159.877/159.921 | pick NONE printed | n/a | UNK | UNK | UNK | NO FIRE (refused S5 DIV_FALLBACK 16:10)`.
- j46 `06-05 16:10 LONG M-POC rt16:00 rSh3 | 160.216/160.262/159.726/160.034 | 159.881-159.916 LONG id3308 promo15:40 | SAME | YES | YES(through) | UNK | FIRED entry 16:15 160.059 (A6FIRED R1.44)`.
- j46 `06-09 17:55 LONG W-POC rt17:30 rSh6 | 160.186/160.198/160.179/160.181 | pick NONE printed | n/a | UNK | UNK | UNK | NO FIRE (refused S5 DIV_FALLBACK 18:00; IDCHANGE xob 3491->3672 at 17:55)`.
- j46 `06-10 16:05 LONG D-POC rt15:30 rSh8 | 160.421/160.468/160.333/160.392 | 160.325-160.344 LONG id3780 promo09:30 | SAME | YES | YES | UNK | NO FIRE (S54KILL same-line+rt at bar 15:45, lineage UNK)`.
- j40 (hunk C old; B60C sets identical; OHLC+picks re-extracted identical on deciding bars, OHLC identical on rest): deciding rows same numbers as j46 (5 June id3308-class zone+promo identical, id not pulled; 2 June id2789-class identical); other six rows same OHLC/picks as j46 (ids UNK, XOBPROMO not pulled on j40); 06-03/06-09 zoneless on j40 too; FIRED 06-02 (deal #4 buy 159.774) + 06-05 (ref 160.059 fill 160.065 tp 160.723 exit 19:16 160.298); rest NO FIRE (ends UNK on j40).
- j45 (hunk C RKD; 20 rows): `08-26 09:10 SHORT W-POC rt09:10 rSh1 | 1.16639/1.16643/1.16617/1.16623 | 1.16660-1.16682 SHORT id1833 promo08:55 | SAME | YES | NO | MET(comm1) | NO FIRE (ABORT S5 DIV_FALLBACK 09:15)`.
- j45 `08-26 15:10 LONG W-POC rt14:35 rSh8 | 1.16651/1.16657/1.16640/1.16646 | pick NONE | n/a | UNK | UNK | UNK | NO FIRE (ABORT S5 DIV_FALLBACK 15:15)`.
- j45 `08-26 16:20 SHORT W-POC rt15:50 rSh7 | 1.16640/1.16652/1.16578/1.16607 | 1.16612-1.16640 SHORT id1891 promo16:00 | SAME | NO(after rt) | YES | UNK | NO FIRE (nearest same-line+dir ABORT 18:15 LTF_MISALIGN S3; lineage UNK)`.
- j45 `08-26 16:50 SHORT W-POC rt15:50 rSh13 | same rt | same pick id1891 | SAME | NO | YES | UNK | NO FIRE (same 18:15 note)`.
- j45 `08-26 17:40 SHORT W-POC rt15:50 rSh23 | same | same | SAME | NO | YES | UNK | NO FIRE (same 18:15 note)`.
- j45 `08-26 17:55 SHORT W-POC rt15:50 rSh26 | same | same | SAME | NO | YES | UNK | NO FIRE (same 18:15 note)`.
- j45 `08-27 11:45 SHORT W-POC rt10:45 rSh13 | 1.16550/1.16554/1.16544/1.16546 | 1.16612-1.16640 SHORT id1891 promo08-26 16:00 | SAME | YES | NO | UNK | NO FIRE (SESSION_CLOSED 12:05 S3 same-line+dir)`.
- j45 `08-27 11:55 SHORT W-POC rt10:45 rSh15 | same rt | same pick | SAME | YES | NO | UNK | NO FIRE (same 12:05 note)`.
- j45 `08-27 17:00 SHORT W-VWAP rt16:25 rSh8 | 1.16577/1.16598/1.16561/1.16583 | 1.16612-1.16640 SHORT id1891 promo08-26 16:00 | SAME | YES | NO(below) | UNK | NO FIRE (refused S5 TP_RR_FAIL 17:00 R0.20/0.35)`.
- j45 `08-27 17:20 SHORT W-VWAP rt17:05 rSh4 | 1.16524/1.16578/1.16515/1.16557 | 1.16612-1.16640 SHORT id1891 promo08-26 16:00 | SAME | YES | NO | UNK | NO FIRE (later LTF_MISALIGN 18:10+ same-line+dir; lineage UNK)`.
- j45 `08-28 16:55 SHORT D-POC rt16:55 rSh1 x2 rows | 1.16420/1.16470/1.16377/1.16379 | 1.16492-1.16507 SHORT id2149 promo06:40 | SAME | YES | NO | MET(comm1) | NO FIRE (ABORT S5 TP_RR_FAIL 17:00)`.
- j45 `08-28 18:45 SHORT Y-POC rt18:05 rSh9 | 1.16134/1.16134/1.16060/1.16099 | 1.16010-1.16103 SHORT id2224 promo18:45 | SAME | NO(at conf) | YES | UNK | NO FIRE (ABORT S5 DIV_FALLBACK 18:50)`.
- j45 `08-31 10:30 LONG M-VWAP rt10:10 rSh5 | 1.15863/1.15890/1.15863/1.15885 | pick NONE | n/a | UNK | UNK | UNK | NO FIRE (ABORT S5 DIV_FALLBACK 10:35)`.
- j45 `09-01 09:45 SHORT Y-POC rt09:15 rSh7 | 1.16066/1.16081/1.16056/1.16057 | pick NONE | n/a | UNK | UNK | UNK | NO FIRE (ABORT S5 DIV_FALLBACK 09:50)`.
- j45 `09-01 15:25 SHORT M-POC rt15:25 rSh1 | 1.15931/1.15943/1.15920/1.15922 | 1.15855-1.15862 SHORT id2289 promo08-31 02:35 | SAME | YES | NO(above) | NOT MET(comm0) | NO FIRE (ABORT 15:30 LTF_MISALIGN S5)`.
- j45 `09-03 10:55 SHORT D-POC rt10:55 rSh1 | 1.16045/1.16067/1.16031/1.16038 | 1.16044-1.16063 SHORT id2825 promo10:45 | SAME | YES | YES | MET(comm1) | NO FIRE (ABORT S5 DIV_FALLBACK 11:00)`.
- j45 `09-04 11:05 SHORT D-POC rt10:10 rSh12 | 1.16277/1.16286/1.16259/1.16259 | 1.16245-1.16275 SHORT id2973 promo11:00 | SAME | NO(after rt) | YES | UNK | NO FIRE (end UNK, no ABORT located)`.
- j45 `09-04 11:20 SHORT D-POC rt10:10 rSh15 | same rt | same pick | SAME | NO | YES | UNK | NO FIRE (end UNK)`.
- j45 `09-04 11:30 SHORT D-POC rt10:10 rSh17 | same rt | same pick | SAME | NO | YES | UNK | NO FIRE (end UNK)`.
- j39 (hunk C old; 19 rows; OHLC+picks+promos re-extracted identical to j45 for all shared bars; ids: 17:00 id1891 verified, rest UNK): `08-27 17:00 SHORT W-VWAP rt16:25 rSh8 | 1.16577/1.16598/1.16561/1.16583 | 1.16612-1.16640 SHORT id1891 promo08-26 16:00 | SAME | YES | NO | UNK | FIRED entry 17:05 1.16524 (A6FIRED R2.73, tier-skipped D-VWAP booked Y-VWAP)`; other 18 rows same values as j45 analogues, all NO FIRE (ends UNK on j39, not traced).
- j45 FIRED among RETEST rows: NONE (7 fires are kept-path: 08-28 10:00, 09-01 17:30, 09-04 15:55, 09-07 09:15/16:40, 09-08 10:05/16:55). j39 FIRED among RETEST: 08-27 17:00 only. j46/j40 FIRED among RETEST: 06-02 15:30 + 06-05 16:10 only.

## R4 GRADES (added rows only; non-fired reported not counted; kept-path never graded)

- XT-TOUCH: 5 June PASS (YES) + 2 June FAIL (NO) = necessary test MET. Other FIRED: 27 Aug j39 FAIL (NO) = consistent ruled-out-fails. No breaker. Verdict: SEPARATES.
- XT-INPLAY: 5 June UNK + 2 June UNK + 27 Aug UNK (no retest-bar verdict printed anywhere for multi-bar rows; same-bar printed rows never fired). Necessary test cannot complete. Verdict: UNKNOWN.
- 4 June 09:55: kept path, out of scope (kept confirm=1 at 09:50 on j44/j46/j40; no RETEST row; B-127 CF-C breaker retired by X1 added-rows-only fence).

## R5 SITES (code only)

- XT-TOUCH readable YES (zone/id/promo any shift bufs 22/23/31/33 + retest OHLC any shift; exact overlap, no new export). XT-INPLAY readable YES (ZoneInPlay shift-parameterized pure read; S1 stop-ref at retest shift is the one integration term, noted unsolved).
- Narrowest site (XT-TOUCH separates): .B82C:2544 uj60_tR term + :2546 touch=(tR||tP) - gate tR with retest-XOB touch. Kept path byte-for-byte unchanged: YES (uj60_tP :2545 + all BOTH/PRIOR flows untouched).

## RECORD LINES (exact)

- X1 s4: `- B128-ADDED-ROWS-ONLY (planner lesson 2026-10-09): a term that only adds confirmations is graded on the rows it adds (kept confirm=0 turned 1) and the fires those rows produce, never on kept fires; B-127 counted the 4 June 09:50 kept same-bar confirmation as a CF-C breaker and graded 2 June 15:30 CF-A PASS though the kept prior-candle test refused it (C_TOUCH), which left 2 June as the only real breaker of the retest-carried touch.`
- X2 s5: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-128; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).`
- X3 s3: `- B-128: measured his 2 June words ("no valid XOB retracement or touch there") on the retest-carried confirmation path only: retest-candle XOB touch and in play on every hunk-C cSrc=RETEST row, deciding rows 5 June 16:10 and 2 June 15:30; no source edit or run.`
- X4 ledger `1273.` (tag `B128-RETEST-CARRY-XOB-READING`; banking + R0-R5 + journal SHAs; no rule invention).
- X5 register: untouched. X6 pointer (cap 35).
- Pre-commit: X1/X2/X3 counts 1; X4 counts 1; `^1272.`=1; staged = 6 relay files; no source/EX5/journal/log/settings diff.

(End of slice)
