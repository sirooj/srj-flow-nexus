# BUILDER SLICE B-170 - raw rows behind every table (KEPT trial; hunk + 3 runs)

Base: builder/B-169 head 651ccc3 on builder/B-170. Gate per result (diff --quiet EMPTY; counts; SHAs; no terminal64). Day log Tester/logs/20261011.log; markers j541696/j1078194 (B-165R), j1556926/j2035651 (GBP B-166/B-167), j2577693 (RECON62-B170), j3114595 (JUNE-B170), j3593829 (GBP-B170).

## Part B (verify-only)

- L36 ANCHOR-RANK (`(a) SAME-LINE-NO-EXIT ... (b) HIGHER-BREAK-EXITS ...`); L185-187 RETEST-DIES-BY-BODY-CLOSE-ONLY; L112 CONFIRMATION-CANONICAL; L251 B1; L254-255 B4 + must-never consequence; L28 day-close (23:55-open EXECUTION PINNED); L34 EXACT-PRICE-NO-LENIENCY.

## Part R (S3 settle)

- XOBINPLAY_REG-B170.csv: :2 A6 `bar=2026.09.08 10:05 ... hits=1 ... legacyVia=BAR` (j=511215); :3 A7 `bar=2026.09.08 16:50 ... hits=3 ...` (j=515549); :4 B3 `bar=2026.06.11 14:35 ... hits=6 ... legacyVia=SWINGLEG` (j=1053625); :5 C-05-27 `bar=2026.05.27 15:25 ... hits=2 ...` (j=912409). Two patterns (`*XOBINPLAY bar=*` + `XOBINPLAY\s+bar=`) agreed on all 4.
- INPLAYCOMMIT mates: A6 BAR (j=511222); A7 BAR-at-16:50 (j=515562); B3 SWING hits=8 firstShift=40 (j=1053632); C-05-27 SWING hits=2 firstShift=97 (j=912423).
- S3 rows: 2/07 direct-0 + SWING → REFUSED (B4); A6/A7/B3/C-05-27 direct-alive → same; A1/A2/A3/A4/A5/B2/C-06-03 BAR/none → same; C-others OTHER-GATE. SEPARATES, 0 UNKNOWN.
- B-171 decision: S3 kept trial (commit site EA:9399 / s31_inPlay EA:9006; must-holds A + owed B same candle, 2/07 refused, C out).

## Part K (hunk + compile)

- Backups: EA.preB170 1617DC1A, EX5.preB170 187A7202, terminal.ini.preB170 CF80083C, run-ini.preB170 9C88E21D, Profiles.preB170 4 charts.
- Spots (raw): decls EA:2288-2291; store EA:2319-2325 (`for(...) { g_rkLines[i] = ...`); side test EA:2314-2317 (`longHit/shortHit`) + EA:2331-2333; SrjRowkeyClear EA:2292/8862; hook EA:8442 (`if(inWindow) SrjRowkeyUpdate(barShift);`); freeze EA:11270-11284 (g_mtrade assigns); gates EA:12593-12602 + EA:12603-12610; EXITCENSUS EA:12580-12591; MTEXIT EA:12676-12687; session enum EA:233 + EA:1889-1910.
- Hunk (149+/25− vs .preB170, --ignore-cr; .B170WIN 794DD4B8): decls+WinlineUpdate+WinlineFreeze+WinlineFrozenExempt (EA:2292+); hook call at EA:8442 site; freeze call at EA:11284 site; `bool wlExempt` + `&& !wlExempt` ×2 + `exempt=%d` at gates.
- Owned defect: first application duplicated the gate block (+1 brace → 29 cascading errors incl phantom UjDayKey/UjDbl); removed duplication, balance 0, skill gate added (srj-relay trial discipline).
- Compile: 0 errors, 0 warnings, binary fresh. EA 794DD4B8; EX5 3A55C566 (≠ kept 187A7202).

## Part T (no STOP)

- T1 marker `EURUSD,M5: 563338 ticks, 3168 bars ... Test passed in 0:03:18.318` (PRE=2035655, PID 20212). Deals #2-#15 all SAME vs DEALS_RECON62-B162 (table in result; A5 4.05 = kept's own PRE-SEND j=503368). A1 MTEXIT 11:30 D-POC exit=1.16464 ✓; A2 MTEXIT 17:45 Y-POC exit=1.15987 ✓. A1 FREEZE {Daily-VWAP} j=2463417, OPEN 09:55 D-VWAP 1.16490 j=2463083. A2 FREEZE {D,W,M-VWAP} j=2492626-28, NY OPEN 14:20 LONG.
- T2 marker `USDJPY,M5: 740873 ticks, 4320 bars ... Test passed in 0:03:36.852` (PRE=2577697, PID 16552). 8 deals SAME vs DEALS_JUNE0525-B162 incl lots (B2 MTEXIT entry=160.059 exit=160.298 identical).
- T3 marker `GBPUSD,M5: 1386092 ticks, 4320 bars ... Test passed in 0:03:53.088` (PRE=3114599, PID 672). Deals: 2/07 SAME (still firing, expected); 7/07 entry SAME 14:45 1.33863; exit 16:54:59 buy 1.33747, MTEXIT 16:50 TP_TOUCH entry=1.33863 exit=1.33747 j=3507330 (was 15:35/1.33901). FREEZE {Daily-POC, Weekly-POC} j=3506444-45; OPEN 14:20 SHORT D-POC j=3506023 (11:20 OPEN = LDN set).
- Restores after each run: terminal.ini CF80083C + run ini 9C88E21D + Profiles 4 charts re-verified; EA/EX5 stay trial (KEPT).

## F2b packs

- -B170 week packs + day dirs + INDEX_B170.md (translated (tag,date,time,occurrence)); FULL-B170 (every B-168 field).

(End of slice)
