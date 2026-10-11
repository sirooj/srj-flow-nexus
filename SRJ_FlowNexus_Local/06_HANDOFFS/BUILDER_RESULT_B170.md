# BUILDER RESULT B-170 - WINLINE kept: trade-side retested lines are entry lines, 7 July holds past 15:30, A1/A2 unchanged

Trader summary: your rule is built and it does exactly what you said. Your 7 July short held straight through the 15:30 Weekly-POC break — the machine froze both your entry lines (Daily-POC and Weekly-POC) at 14:40 and the break could not exit it — and it went on to touch your 1.33747 target, closing at 16:50. Your 28 August still leaves at the 11:35 open (1.16464, your price) and your 1 September still leaves at the 17:50 open (1.15987, your price); every other entry and exit on all three windows sits on its candle at its price, lot for lot. Your 2 July long still fires — that fix is a separate trial and was kept out of this build on purpose. The build with your rule is kept on disk.

## Relay order (B-170 BLIND-GBP0706 5 of 6, WINLINE kept-build trial)

- Part 0 on builder/B-169 at 651ccc3 (backup ls-remote exact; no remote builder/B-170 before push; builder/B-170 cut here; rev-parse HEAD = 651ccc3 before commit). Push via backup, never origin.
- Skills loaded whole in order (srj-relay 97 lines + B-170 tighten line filed this turn; srj-strategy 255 lines; .agents stub never opened).
- Reads in order: pointer (24); RESULT_B169 (127) + SLICE_B169 (85); RESULT_B168 R3 Part S table; RESULT_B137 lot method (sizer EA:11201-11219, formula on each run's own equity); RESULT_B166 + B167 run settings (GBPUSD M5, 1782691200/1784332800, GBP0629-B162.ini / +Report keys B167, Profiles 4 charts); INDEX_B165R + -B165R packs; INDEX-B168F + W1/W2/W3; README; REGISTER whole (89); spec v4.2 whole (396); FINDING EXIT-BREAK-RETEST whole (28); RESULT_B125 (MEASURED, 5m rows) + RESULT_B126 (RESTORED, deferred-abort EA:8750-8764) both FOUND; CONTEXT §4 whole. Ledger, AGENTS.md, .clinerules, journal: grep only. July journal never asked, never read.
- Names per 0.4 verified (kept EA 1617DC1A/ex5 187A7202; ind 7842A02E norm 338FEF95/ex5 10880847EE593CB7E4D99E2FAE38F7F9DDEB519C23B373145CF7BACFC6292B21; OB 8BBF936B; Bias 3B1D9D3D; HTF D5FD5B06; terminal.ini CF80083C; run ini 9C88E21D; Profiles 4 charts). Baselines on Tester/logs/20261011.log: RECON62 + JUNE0525 per INDEX_B165R; GBP0629 j1078195-1556926. Hunk WINLINE; backups .preB170 (EA 1617DC1A / EX5 187A7202 / terminal.ini CF80083C) + content copies; edited copy .B170WIN (794DD4B8, never committed). Trial runs RECON62-B170 (1787702400/1788998400) → JUNE0525-B170 (1779667200/1781308800) → GBP0629-B170 (B-166 settings). Lane BLIND-GBP0706 (first B-166; 5 of 6). Ledger 1316, tag B170-WINLINE-TRIAL. Kit PK-2.
- Start gate: log-1 = 651ccc3; status 791 lines; git diff --quiet 651ccc3 EMPTY on all 0.5 paths. Counts: ledger "^1315." = 1, B169 tag present, "^1316." = 0, "B170-" = 0; HANDOFF B-169: = 1, B-170: = 0; pointer 4-of-6 = 1; skill "B4, his words" = 1; journal 1076 + row 324; CONTEXT B169 lessons 1/1 (X1b nothing to land), B170- = 0. SHAs per 0.4. No terminal64. No STOP.
- Scope per 0.6 (ONE EA edit, ONE compile, ONE run per window in order). No indicator/includes/HTF/OrderblockMgr/Bias edits; no entry/seed/retest/confirm/zone/stop/target/5m/sizer logic; no tolerance/buffer/number; 4 June/XOB-0604/KILL-0604/STOP-BASIS/S1 unreopened; July journal untouched. Legal results as listed.

## Part B - banking (verify-only; append nothing)

- Skill L36 ANCHOR-RANK (a) SAME-LINE-NO-EXIT + (b) HIGHER-BREAK-EXITS; L185-187 RETEST-DIES-BY-BODY-CLOSE-ONLY; L112 CONFIRMATION-CANONICAL; B1 L251 + B4 L254-255 (must-never 2 July); s28 day-close pin (L28 UNIVERSAL rule + 23:55-open EXECUTION PINNED); EXACT-PRICE-NO-LENIENCY L34. All FOUND, raw in slice.

## Part R - S3 settled from existing logs (read-only, before edit)

- R1 XOBINPLAY re-cut (two patterns `*XOBINPLAY bar=*` + regex `XOBINPLAY\s+bar=`, B-162 segments): ROWPACK/XOBINPLAY_REG-B170.csv — A6: `XOBINPLAY bar=2026.09.08 10:05 ... hits=1 ... legacyVia=BAR` (j=511215, :2); A7: `... bar=2026.09.08 16:50 ... hits=3 ...` (j=515549, :3); B3: `... bar=2026.06.11 14:35 ... hits=6 ... legacyVia=SWINGLEG` (j=1053625, :4); C-05-27: `... bar=2026.05.27 15:25 ... hits=2 ...` (j=912409, :5). INDEX lines = the :2-:5 refs above (nearest-to-confirm S3 rows; A7/C-05-27 use latest S3 pass at/below confirm).
- R2 final S3 (NO-SWING-ONLY-INPLAY; direct + commitVia + kept → under reading): 2/07 LONG — direct hits=0 (W1:6943) + SWING pass (W1:6949) + kept EXECUTED → REFUSED (his B4 must-never) CHANGES. A6 — direct hits=1 + BAR → same 10:10. A7 — direct hits=3 + BAR-at-16:50 → same 17:00. B3 — direct hits=6 + SWING → same 14:40. C-05-27 — direct hits=2 + SWING → same 15:35 (warm-up, never graded). A1/A2/A3/A4/A5/B2/C-06-03 — BAR/none paths → same candles. C-06-04/C-06-10/C-08-27/C-09-01-1530/C-09-04-1040/C-08-28-1625/C-09-08-1645 — still out (OTHER-GATEs per B-169 S1). UNKNOWN = 0. Overall S3: SEPARATES (2/07 refused; every A + owed B keeps its entry candle).
- B-171 decision: NO-SWING-ONLY-INPLAY goes to B-171 as its own kept trial (gate at the INPLAYCOMMIT commit site EA:9399/s31_inPlay EA:9006; must-holds: A rows + owed B same candle, 2/07 refused, C rows out). No edit for S3 here.

## Part S - separator on file

- B-169 S2 WINDOW-ENTRY-LINE (SEPARATES: 7/07 DIFFERENT; A1/A2 SAME; non-break exits SAME). A1/A2 windows rested on B60C rows only; this trial's WINLINE prints prove them; T STOPs on any move — no STOP fired.

## Part K - hunk WINLINE (ONE edit)

- K1 rule-conflict: L36(a) widened from "entry-anchor line" to every held entry line in the window (his B1: W-POC "also for the entry"); L36(b) untouched — every other line keeps rank-gate behaviour. No contradiction; his retest-death words bound the set (KILL).
- K2 backups: EA.mq5.preB170 1617DC1A + EX5.preB170 187A7202 + terminal.ini.preB170 CF80083C + run-ini.preB170 9C88E21D + Profiles.preB170 (4 charts). Located by text (raw in slice): g_rkLines/g_rkSide EA:2288-2289 + store EA:2319-2325; SrjRowkeyClear EA:8862 (+2292 decl); side test EA:2314-2317 + EA:2331-2333; anchor-rank gate EA:12593-12602 (P-EXITRANK-6); own-body gate EA:12603-12610 (B-136); EXITCENSUS EA:12580-12591; MTEXIT EA:12676-12687; hook site EA:8442 (`if(inWindow) SrjRowkeyUpdate(barShift)`); freeze site EA:11270-11284 (g_mtrade assignments); session enum EA:233 + CurrentTradingWindow EA:1889-1910.
- K3 the edit (4 insertions, one hunk; owned defect repaired in-turn: first application duplicated the gate block, +1 brace, 29 cascading errors incl phantom UjDayKey/UjDbl; caught by the new balance gate, duplication removed, balance 0 re-verified):
  (a) Held sets g_wlLong/g_wlShort[2][POI_NLINES] + counts + g_wlDay (file scope EA:2292+): WinlineUpdate(barShift, barTime, sess) hooked live in-window beside SrjRowkeyUpdate (EA:8442 site); OPEN on first trade-side hit of the session (RETESTBOOK inequalities verbatim), ADD later hits, KILL on body close through (c < L−EPS LONG / c > L+EPS SHORT, kept EPS form), clear on session change only.
  (b) WinlineFreeze(g_dir, sessionAtEntry, barTime) at entry after g_mtrade assignments (EA:11284 site); FREEZE prints per line (none if empty).
  (c) bool wlExempt at both gates (kept EA:12594 gate + own-body EA:12603 gate): exempt lines skip vBREAK; rest kept.
  (d) Prints WINLINE action=OPEN|ADD|KILL|FREEZE (bar/dir/line/val); EXITCENSUS gains exempt=0|1 (verdict kept-form).
- K4 compile: 0 errors, 0 warnings, binary fresh. EA 794DD4B82226CD6BA0C0414DA9DBB182DF3AD75C4026946BB6E3FB1252B8EB61; EX5 3A55C56685134C80E3D189C2C2EC680C27F5459C51288E35B9D543BFE0CB86D1 (differs from kept 187A7202 — the trial binary, deployed in place). Full hunk diff vs .preB170 (149+/25−, --ignore-cr) in slice. .B170WIN kept uncommitted.
- Skill tighten filed same turn (defect owned): srj-relay trial discipline gains the edit-application gate (brace-balance vs .preB<n> + single-marker-set check before compiling).

## Part T - runs (order fixed; no STOP fired)

- T0 per launch (no terminal64 pre-launch; .preB170 content copies; dates written + read back: RECON62 1787702400/1788998400, June 1779667200/1781308800, GBPUSD 1782691200/1784332800; script launches; wrapper killed after verify; PID-verified watchers; short polls).
- T1 RECON62-B170: `EURUSD,M5: 563338 ticks, 3168 bars ... Test passed in 0:03:18.318` (slot fix live; PRE_JOURNAL_LINES=2035655; terminal PID 20212, stopped after). Filed table vs DEALS_RECON62-B162 (entry candle/entry/exit bar/reason/exit/lots):

| deal | kept B-162 | trial B-170 | verdict |
|---|---|---|---|
| A1 in | 8/28 10:05 1.16466 2.38 | 8/28 10:05 1.16466 2.38 | SAME |
| A1 out | 11:35 1.16467 (MTEXIT 11:30 D-POC 1.16451 exit=1.16464) | 11:35 1.16467 (MTEXIT identical) | SAME — out on the 11:30 Daily-POC break at 1.16464 (his 11:35 open) ✓ |
| A2 in | 9/1 17:35 1.16024 2.04 | 9/1 17:35:01 1.16024 2.04 | SAME (same candle+price; fill second only) |
| A2 out | 17:50 1.15987 (MTEXIT 17:45 Y-POC exit=1.15987) | 17:50 1.15987 (MTEXIT identical) | SAME — out on the 17:45 Yearly-POC break (his 17:50 open) ✓ |
| A3 | 9/4 16:00 1.16019 / 23:55 1.16129 0.57 | identical | SAME (DAY_CLOSE) |
| A4 | 9/7 09:20 1.16138 / 10:53 1.16201 2.49 | 09:20 / 10:53:07 same prices/lots | SAME (TP; seconds only) |
| A5 | 9/7 16:45 1.16264 / 17:13 1.16315 4.05 | identical incl 4.05 | SAME (kept B-162 itself sends 4.05: PRE-SEND j=503368 lots=4.05 slPts=25 — no drift at all) |
| A6 | 9/8 10:10 1.16205 / 10:42 1.16102 1.95 | identical | SAME |
| A7 | 9/8 17:00 1.16220 / 17:26 1.16275 1.95 | identical | SAME |

No entry added/removed/moved; no exit moved. A1 FREEZE {Daily-VWAP} (j=2463417), window OPEN 09:55 D-VWAP 1.16490 (j=2463083). A2 FREEZE {Daily-VWAP, Weekly-VWAP, Monthly-VWAP} (j=2492626-28), NY window OPEN 14:20 LONG. Y-POC/D-POC breaks pass through because neither frozen set holds the exit line.

- T2 JUNE0525-B170: `USDJPY,M5: 740873 ticks, 4320 bars ... Test passed in 0:03:36.852` (PRE=2577697; PID 16552, stopped after). Table vs DEALS_JUNE0525-B162 (lots included): 5/27 15:35 159.344 / 20:08 159.535 1.08; 6/03 09:10 159.932 / 09:59:40 159.983 3.75; B2 16:15 160.065 / 19:16:32 160.298 0.35 (MTEXIT entry=160.059 exit=160.298, identical); B3 14:40:22 160.530 / 15:23:06 160.588 5.69 — all 8 cells SAME. No STOP.
- T3 GBP0629-B170: `GBPUSD,M5: 1386092 ticks, 4320 bars ... Test passed in 0:03:53.088` (PRE=3114599; PID 672, stopped after; settings exactly B-166: GBPUSD M5, GBP0629-B162.ini, 1782691200/1784332800, Profiles 4 charts). Table vs B-166/B-167: 2/07 buy 18:15 1.33716 / sell 19:07:53 1.33564 0.65 SAME (still firing — S3 untouched, expected, not a STOP); 7/07 sell 14:45 1.33863 1.28 SAME entry; 7/07 exit CHANGED: kept 15:35 buy 1.33901 (15:30 W-POC break) → trial 16:54:59 buy 1.33747, MTEXIT bar=16:50 TP_TOUCH entry=1.33863 exit=1.33747 (j=3507330) — the booked target (his nearest-valid rule), no other exit moves, volumes same. 7/07 FREEZE {Daily-POC, Weekly-POC} (j=3506444-45); window OPEN 14:20 SHORT D-POC (j=3506023; 11:20 OPEN is the LDN session set). FREEZE holds W-POC ✓, window opens 14:20 ✓ — no STOP.
- Lot note: zero drift anywhere (A5 4.05 = kept B-162's own 4.05); B-137 formula accounting not needed. 2/07 firing expected.
- Restores: terminal.ini + run ini + Profiles from .preB170 after each run (SHAs re-verified CF80083C/9C88E21D/4 charts); EA + EX5 stay trial (KEPT verdict).

## Part X - records (grep-first, 0 before, 1 after each)

- X1 CONTEXT §4 (relay text verbatim). X1b: both B-169 lessons present 1/1 — nothing to land (counts reported).
- X2 HANDOFF §3 (relay text with verdict KEPT).
- X3 ledger 1316, tag B170-WINLINE-TRIAL (B4/banking refs; R S3 table + B-171 decision; K hunk SHAs + owned-defect repair; T tables + markers; SHAs).
- X4 pointer rewritten (24 lines): latest B-170 KEPT; Lane BLIND-GBP0706 (first B-166, 5 of 6); build line = WINLINE trial (EA 794DD4B8/EX5 3A55C566); Next = B-171 per Part R decision (S3 trial), then a fresh GBPUSD run for his grading; O3 pending; goal open.

## Part F - file, push, reply

- F1 this result. F2 slice (raw rows; under 600 lines). F2b on KEPT: -B170 packs (RECON62 + June + GBPUSD) + INDEX_B170.md; FULL-B170 (every B-168 field).
- F3 ledger 1316. F4 pointer.
- F5 stages result, slice, F2b files, ledger, pointer, CONTEXT, HANDOFF, srj-relay skill (trial-discipline tighten this turn). Never EA, includes, indicators, ex5, journals, logs, inis or backups. (Strategy skill + journal CSV untouched this turn — no banking words.)
- F6 commit (rev-parse HEAD before commit), push via backup, ls-remote must return the commit.
- Reply line: B-170 is done, GitHub branch builder/B-170, commit <hash>, verdict KEPT.

## Final disk state (KEPT trial; WINLINE build on disk, verified, terminal closed)

- EA 794DD4B82226CD6BA0C0414DA9DBB182DF3AD75C4026946BB6E3FB1252B8EB61 + ex5 3A55C56685134C80E3D189C2C2EC680C27F5459C51288E35B9D543BFE0CB86D1 (pair matches; trial binary deployed); indicator 7842A02E + ex5 10880847 (pair matches, untouched); OB 8BBF936B; Bias 3B1D9D3D; HTF D5FD5B06; terminal.ini CF80083C June as-run (restored, verified); Profiles/Charts as-run (restored); no terminal64. Relay skill +1 gate; CONTEXT +1; HANDOFF +1; ledger +1 (1316); pointer rewritten; result + slice new; -B170 packs + INDEX_B170 + FULL-B170 new; helper scripts unstaged. No source/ex5 committed.

(No carried note — every record-first search found its ruling.)
