# BUILDER SLICE B-129 - raw spots, raw diff, raw rows (hunk C + XT trial, KEPT)

Scope: one EA edit set + one compile + RECON62 jT1 + June jT3 + keep (terminal.ini + Profiles restored). Indicator/includes/HTFEngine untouched.

## START GATE (raw)

- `git ls-remote backup builder/B-128` = `475606945ea3253bc20db087bbd6b0b6ffc2e3e8` (verified; cut builder/B-129 here).
- `git log -1` = `4756069 B-128 retest-carry XOB touch reading on added rows only (relay B-128); verdict MEASURED`.
- `git status --short` count = 481 (pre-existing + untracked, preserved, none staged).
- Eleven-path diff vs 4756069 EMPTY (pointer, RESULT_B128, SLICE_B128, ledger, PLANNER_CONTEXT, PLANNER_HANDOFF, register, both skills, spec, journal CSV).
- Ledger `^1273.`=1, B128-tag=1, `^1274.`=0, `B129-`=0 everywhere. PLANNER_CONTEXT `B128-ADDED-ROWS-ONLY`=1, `relay B-128`=1, `B129-KEEP-THE-KEPT-TERM`=0, `relay B-129`=0. PLANNER_HANDOFF `B-128:`=1, `B-129:`=0. Journal 1066 lines.
- SHAs: EA 137076D9CF85 (695359 B LF-only) / EX5 FA4C924978F6 / .B82C 55D91C7E / indicator 956BF3E3ADB7 / ind-ex5 27B5F272DCFA / HTFEngine D5FD5B063E75 / terminal.ini 4082A94F (all PASS). No terminal64 (0 both launches).

## PART B (counts)

- Operator message = B-128 reply line only. `no new rule words`; appended nothing.

## K1 SPOTS (authority; skill 205 lines; spec file em-dash path)

- Retest-carry: s107 SAME-CANDLE-PERMITTED (general separate-bars form); s112 CONFIRMATION-CANONICAL (touch-or-break, zero margin); s169-174 2026-10-07 ruling (flip kills formed setups only; 16:00 retest stays potential; 16:10 confirm; 16:15 open 160.059); s151 JUN05NY-ENTRY-1615 (16:15 open; 16:55 never his); s165-166 B-52 (M POC + M VWAP at 16:00); spec 3.6 L158.
- XOB gate: s177-178 his 2 June words (no valid XOB retracement or touch at 14:20; 15:35 answers a touch he does not count); s185 0602-NY-NO-SETUP; s202 B-91 (retrace-is-in-play, single condition); s205 NO-CASCADE; spec 1.2 L52 (relevant = promoted) + 3.5 L124 + 3.5.1 L143 (REQUIRED) + 10 L362; s115 GATE-AUTHORIZATION. Untouched: 5m (no LTF line in diff), validity s187 (S54 path untouched), kept confirm (touch :2536 byte-identical). No contradictor: edit authorized.

## K2 BEHAVIOR (his words only)

- (a) Port hunk C verbatim (decl/stamp/clear, C1 B60POT reseed at deferred LTF abort, retestShift at 3 call sites, B60C print). (b) One change: kept `bool touch = (h1 >= L - _Point && l1 <= L + _Point);` stays; NO `.B82C` overwrite; instead `touch = (touch || (uj60_tR && uj60_xt))` with XT = picked-XOB-at-barShift (lo+hi > 0) + promo < retest open + retest reach exact. (c) cSrc as graded + xt/zxob/xpromo on B60C. Kept prior path byte-identical; only adds.

## K3 SPOTS (kept EA 137076D9, located by text, raw with real line numbers)

- Decl :1111 `ENUM_SRJ_STATE   g_confirmFromState = ST_IDLE;` (+ FRESH comment :1112).
- Signature :2484-2486 (touch :2454 poll / :2532 gate; fail/surv :2533-2534; `return true;` :2535).
- ResetSequence :6832 `g_confirmFromState = ST_IDLE;` (+ P-BUILD3 :6833-6835).
- Seed :8422 `g_anchorBarTime = barTime;` (+ ReadBuf1 pr.topLine :8423; RK clear+plant :8415).
- Deferred apply :8750-8764 (`if(uj_saAbort)` :8751 + identity :8753 + UJDEFERAPPLY :8755 + GoAbort :8756 + return :8757 + DROP/else + clear :8763).
- Call sites :9340 carry / :9433 prebind (post-shift; was :9360) / :9622 S4 (was :9548).
- Zone source: ZONEPICK EA:8873-8883 + S3PICK bufs-22/23 EA:8800-8801 at barShift; promo buf-33 EA:8790; .B82C touch :2542-2547. Repeatable at barShift: YES.

## K5 BACKUPS (raw SHAs)

- `.preB129` src `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` + ex5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5`; terminal.ini.preB129 `4082A94F`; Profiles.preB129 131 files (content copies). Terminal64 0 before both launches.

## K6 DIFF (complete, .preB129 vs edited EECDF0BC; 9 hunks; kept touch :2536 + poll :2457 byte-identical)

- H1 decl (after :1111): +3 `//--- [B-61 C2] ...` + `datetime g_b61RetestTime = 0;` (verbatim .B82C:1112-1114).
- H2 signature: ` bool IsConfirmationCandle(... allowReclaim = false)` -> `   bool IsConfirmationCandle(... allowReclaim = false,` + `const int retestShift = -1)` (verbatim .B82C:2484-2486, incl indent).
- H3 touch block (after kept :2536, which STANDS): +C2/C3 retest read (uj60_hR/lR, tR exact, tP exact for print) +XT block (`uj129_zHi/zLo/promo` via bufs 22/23/33 at barShift; haveZone; `uj129_xt = (promo < g_b61RetestTime && hR >= zLo && lR <= zHi)`; xtPr 1/0/-1) + `touch = (touch || (uj60_tR && uj129_xt));` (NOT .B82C's overwrite) + cSrc (as .B82C) + kept C_TOUCH/surv (untouched) + B60C print + `xt=%s zxob=%s-%s xpromo=%s` + `([B-61 C2][B-129 XT])`.
- H4 reset (:6832): indent 3->4sp + `g_b61RetestTime = 0; //--- [B-61 C2]...` (verbatim .B82C).
- H5 seed (after :8422): +`g_b61RetestTime = barTime; //--- [B-61 C2]...` (verbatim .B82C:8447).
- H6 C1 reseed (after GoAbort :8756): +27-line B60POT/reseed block incl RK seam + double return (verbatim .B82C:8782-8809).
- H7/H8/H9 call sites: +retestShift line + extended call (verbatim .B82C:9392-9393/:9413-9414/:9602-9603 shape at kept :9340/:9433/:9622).
- Scope: 42 marker lines, all in K2 ranges (verified line-number confinement 1114/2551-2576/6876/8467/8802-8829/9412-9434/9622-9623). Zero 5m/regime/CQD/target/stop/exit/concurrency/number/tolerance/buffer lines. `.B129XT` = EECDF0BC identical bytes.

## K7 COMPILE (raw)

- `Result: 0 errors, 0 warnings, 11626 ms elapsed, cpu='X64 Regular'`; ok=true; binary_fresh=true. Trial EX5 `504665AEAEDCEBD2EC98EC15D3D93871D8130C966076254C4F25ACB85B9AE1E4A` (468920 B). Indicator ex5 still 27B5F272DCFA.

## T1 RECON62-B129 (raw proof)

- Launch `launch_recon62_b129.ps1` (mirrors b126); WMI_PID=13692 RC=0; RUNNING 08-26 verified; window `testing ... from 2026.08.26 00:00 to 2026.09.10 00:00`; wrapper killed (terminal 23868 survived); watcher 15712 3-arg PID-verified; genuine DONE `RUN=RECON62-B129 RESULT=PASSED DONE=2026-10-09 15:14:34`.
- Completion `EURUSD,M5: 563338 ticks, 3168 bars ... Test passed in 0:02:48.126` (same scale).
- Deals (tester convention, vs B125 #2-#15): #2 S 08-28 10:05:00 1.16466 + #3 B 11:45:02 1.16440 (A1 identical, 2.38); #4 B 09-01 17:35:01 1.16024 + #5 S 17:51:04 1.15975 (A2 identical, 2.05); #6 B 09-04 16:00 1.16019 + #7 S 23:55 1.16129 (A3 identical, 0.57); #8 B 09-07 09:20 1.16138 + #9 S 10:53:07 1.16201 (A4 identical, 2.5); #10 B 09-07 16:45 1.16264 + #11 S 17:13:30 1.16315 (A5 identical, 3.91); #12 S 09-08 10:10 1.16205 + #13 B 10:42:46 1.16102 (A6 identical, 1.95); #14 S 09-08 17:00 1.16220 + #15 B 17:26:29 1.16275 (A7 identical, 1.95). j45 third column: same 7 (MTEXIT rows identical). Must-never: zero (only #2-#15 in window).
- B60C: BOTH 22 / PRIOR 6 / RETEST 2 (xt 24x0 + 6x1). RETEST rows: 09-01 15:25 xt=0 (kept-prior carried; retest above pick) + 09-03 10:55 xt=1 (no fire; S5 DIV_FALLBACK 11:00 analogue).

## T3 JUNE0525-B129 (raw proof)

- Launch `launch_june0525_b129.ps1` (mirrors b126); WMI_PID=6828 RC=0; RUNNING 05-25 verified; window `testing ... from 2026.05.25 00:00 to 2026.06.13 00:00`; wrapper killed (terminal 4028 survived); watcher 1988 3-arg PID-verified; genuine DONE `RUN=JUNE0525-B129 RESULT=PASSED DONE=2026-10-09 15:22:38`.
- Completion `USDJPY,M5: 740873 ticks, 4320 bars ... Test passed in 0:03:30.155` (same scale).
- Deals (vs B117, j46 third column): #2 B 05-27 15:35 159.344 + #3 S 20:08:14 159.535 (27 May identical); #4 B 06-03 09:10:00 159.932 + #5 S 09:59:40 159.983 (C3 identical); #6 S 06-04 09:55:00 159.868 + #7 B 10:40:20 159.920 (4 June kept-path identical); #8 B 06-05 16:15:00 160.065 + #9 S 19:16:32 160.298 (B2 OWED fires; TP_ELECT ref 160.059 R1.44; 16:55 gone); #10 B 06-11 14:40:22 160.530 + #11 S 15:23:06 160.588 (B3 identical). Must-never: zero (no 2 June 159.774, no 10 June, no 5 June London).
- 5 June rows: `B60POT 16:00 LONG M-POC ltf=-1.0` -> `STATE S3->ABORT + ABORT->S1` 16:05 -> `STATE S1->S2->S3` 16:10 -> `CONFIRMPOLL 16:10 opp1 body1 49pts touchAttr0 confirm0` (kept shadow refuses) -> `B60C 16:10 cSrc=RETEST xt=1 zxob=159.881-159.916 xpromo=15:40` -> `TP_ELECT ref 160.059 R1.44` -> `A6FIRED 16:10` -> `ENTRY_TICKET 16:10` -> deal #8.
- 2 June rows: seed 14:20 M-POC LONG (ANCHOR_ELECT) -> `CONFIRMPOLL 15:30 opp1 body1 13pts touchAttr0 confirm0` -> NO B60C (xt=0 kills carry; kept refuses) -> FRESHSKIP S3-held 15:30/15:35/16:00 -> died 17:40 ABORT FRESH_OB_DEAD. Never fired.
- B60C: BOTH 15 / PRIOR 2 / RETEST 2 (xt 14x0 + 4x1 + 1xNA).

## T4 VERDICT LINES + T5 KEEP (raw SHAs)

- (a) YES (7/7 EU). (b) YES (B3/C3/27May). (c) YES 16:15 (fill 160.065; 16:55 gone). (d) YES (no must-never). (e) YES (4 June #6/#7 identical). (f) K4 HELD all paths (EU=j45-minus-nothing; June=j46-minus-2-June; beyond-set: none opened). KEPT.
- T5: terminal.ini 4082A94F + Profiles 131/131 restored-verified; terminal 4028 stopped (0 running). Kept: EA `EECDF0BC9FB8EFACCA02E2309FD94813D4A95C201789454E70315FC209D4CCA8` + EX5 `504665AEAEDCEBD2EC98EC15D3D93871D8130C966076254C4F25ACB85B9AE1E4A` (re-verified; never committed). Indicator/HTFEngine untouched.

## RECORD LINES (exact)

- X1 §4: `- B129-KEEP-THE-KEPT-TERM (planner lesson 2026-10-09): ...` (full text in result X1).
- X2 §5: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-129; ...`.
- X3 §3: `- B-129: kept-build trial of hunk C with the retest-carried touch ...`.
- X4 ledger `1274.` (tag `B129-RETEST-XOB-TOUCH-TRIAL`; K1-K7/T/verdict/SHAs/runs).
- X5 register: KEPT -> row-2 TAKEN line under section B (verbatim shape per relay).
- X6 pointer (cap 35): latest B-129 KEPT; T4 (a)-(f); new kept SHAs; 4 June status; goal open.
- Pre-commit: X1/X2/X3 counts 1; X4 counts 1; `^1273.` = 1; staged = 7 relay files (result, slice, ledger, pointer, CONTEXT, HANDOFF, register); no source/EX5/journal/log/settings diff.

(End of slice)
