# BUILDER RESULT B-149 - 2xOB printed from the indicator; one stop agrees, seven do not

Trader summary: your two-branch stop rule is graded at last. The 2xOB state lives only on screen, so a print-only line was added to the indicator that writes it per candle, both windows were run with every deal byte-identical, and everything was restored. Of your ten kept stops, one follows your rule (1 September: valid block with imbalance, one swing), seven do not (they sit on the one-swing branch while your rule - strong 2xOB state plus no imbalance - puts them two swings out, at strictly-proven candles), and two can't be graded (3 June: your panel state isn't strong there; the builder names the rows). Every recomputed risk clears your 1R floor, so no take is refused by this - the stops alone move. Nothing is kept changed, and nothing is asked.

## Relay order (B-149: STOP-BASIS 3 of 6; print-only indicator diagnostic + two runs, always restored)

- Part 0 on builder/B-148 at 65f683350927c6dff99431c12b9c1ae26b3e1ae1 (backup ls-remote verified exact). Branch repair first (relay-authorized git steps only): fetched backup; deleted local builder/B-147 (carried the B-148 commit by the B-148 checkout defect); recreated it from backup builder/B-147; rev-parse = 727411ea463eb0688b2086cc2b23e0e650f4413d exact. No other branch touched, no force-push, dirty tree preserved (581 lines before and after). Cut builder/B-149 at 65f6833; disk-fact rev-parse after cut (HEAD builder/B-149 at 65f6833) and again before commit (below).
- Skills loaded (relay whole; strategy whole-read last turn + verified byte-identical via EMPTY diff). Reads: pointer; RESULT_B148 + SLICE_B148; RESULT_B141 R2 + SLICE_B141; RESULT_B142 R4; spec v4.2 (3.4/3.5.1/3.7/8/10; 3.7 lines 195-200/210, 8 line 319 quoted in R); register whole; DEALS packs (14 + 10 rows verified); CONTEXT B141/B145/B147 lines.
- Start gate: log-1 = 65f6833; status 581; committed-file diff vs 65f6833 measured 0 lines; EA 585093BF.../EX5 AB159DE7.../FlowLogic 956BF3E3/27B5F272 match (+ includes BiasEngine 3B1D9D3D/HTFEngine D5FD5B06/Panels 4335F703 reported); result-against-commit CONTEXT B148 x2 + relay B-148 + HANDOFF B-148 + ledger 1293 + pre-grep B149 lines/B149OB2 all verified 1/0. No STOP.
- Scope: one print-only indicator edit + compile + one run per window, always restored. EA never edited/recompiled (bindings byte-identical: no input/buffer touched). No Include/HTFEngine edit; no tolerance/count/distance; no question to him.

## Part B - banking

- No new rule words. Nothing appended.

## Part K-D - print-only indicator diagnostic

- K1: a print changes no trading rule. Reads only (state values into a log line); no assignment, no gate, no buffer, no input touched. Checked against banked words first: REFINE-ONLY/NO-CASCADE unaffected (nothing computed, drawn or exported changes).
- K2 content copies (*.preB149, SHAs): indicator src 956BF3E3 + ex5 27B5F272; EA ex5 AB159DE7 (src untouched); terminal.ini AA4EA14B; Charts 20 files. No terminal64 running (count 0).
- K3 spots pasted raw: EA SL_REF sites EA:6383 (1-swing) + EA:6523/EA:6585 (2-swing) - located only, never edited. Indicator insertion anchor FlowLogic.mq5:1437-1444 (export block end, in-loop after DecisionBlock 1052 + all passes; HTF RunAll at 1446 runs once post-loop). Writer convention proven from code: BarClosed(i) = i < rates_total-1 (SRJ_Draw.mqh:42-45) so the printed time[i] IS the closed bar (not the next); LTF g_s.* final for it; HTF e.* structs hold latest engine state as of the tick (no per-bar HTF final exists in-loop - named, not hidden). prevCalc>0 skips the initial full-history pass (stale HTF); strong-flip-this-bar variable does not exist (doStrongFlip is BiasEngine-local) - omitted per relay.
- K4 one edit in FlowLogic.mq5 only (+20 lines, pure addition; full diff in slice): one PrintFormat B149OB2 per closed bar, ungated like the B96 export (no InpDebugLog exists indicator-side; g_htfDebugLog defaults false and the EA does not pass it). Fields: sym, bar, ltf2OB, ltfBull, ltfBear, then H4/H1/M15 (EnumToString of g_htfHighTF/MidTF/LowTF) each with 2OB + bull/bear counts. Edited src 606063E4; trial copy Indicators/SRJ_FlowLogic.mq5.B149D kept uncommitted.
- K5 one indicator compile: 0 errors, 0 warnings, binary fresh. Trial ex5 7AE02D9F. EA EX5 still AB159DE7 (not recompiled, verified).

## Part T - runs (launch-then-stop per srj-relay; script files uncommitted)

- T1 RECON62-B149D: terminal.ini [Tester] written + read back (EURUSD 1787702400/1788998400, Period M5). Launched (WMI 19764, exited alone); window verified on journal (8/31-9/02 progression); B149OB2 rows printing (sample 8/31 13:50 in STATUS). Watcher by PID 24260 (verified); wrapper already exited, nothing to kill; DONE verified genuine (RESULT=PASSED 06:02:32). B149OB2 rows: 3168 (= window bar count), first 2026.08.25 23:55, last 2026.09.09 23:50.
- T2 filed-trade table vs DEALS_RECON62-B137.csv (14 deals): every side/date/time/price IDENTICAL (seconds match where the pack carries them; volumes identical 2.38/2.04/0.57/2.49/3.9/1.95 - sizer-identical, never a STOP class). No STOP. Full table in slice.
- T3 JUNE0525-B149D: ini written + read back (USDJPY 1779667200/1781308800). Owned defects, both repaired same turn: (1) terminal.ini edit deleted the Period=5 line (regex ate the CR; 10 bytes lost) - found by size check, restored byte-exact from preB149 (20447 bytes), T1 validity unaffected (damage came after); (2) T3 first launch REFUSED_TERMINAL_BUSY on leftover PID 7000 (B-43: launched without stopping it) - stopped, relaunched clean. Run PASSED 0:03:33 (740873 ticks, 4320 bars). 10/10 deals identical (side/date/time/price; volumes identical). B149OB2 rows: 4320, first 2026.05.22 23:55, last 2026.06.12 23:50. No STOP.
- T4 restored + verified: indicator src 956BF3E3 + ex5 27B5F272; EA ex5 AB159DE7 + src 585093BF; terminal.ini = preB149 bytes (AA4EA14B; only auto timestamps had drifted); Charts 20 files 0 diff 0 extra (run-created chart05/06 removed; first copy pass had missed Default files - re-copied per-file, verified). No terminal64 remains. Verdict RESTORED.

## Part R - grade every kept stop (runs B149D, EA 585093BF; pack lines per B-141/B-143)

### R1 B149OB2 rows at the ten confirmation candles (one row each, no duplicates)

- A1 10:00 8/28: ltf2OB=1 bull=0 bear=1; H4 1/0/1, H1 1/1/0, M15 1/1/0. A2 17:30 9/1: 1, 0/0; H4 0, H1 1(1/1), M15 1(0/1). A3 15:55 9/4: 1, 0/0; H4 1, H1 1, M15 1 (all zero counts). A4 09:15 9/7: 1, 0/1; H4 1, H1 0(1/1), M15 1(0/1). A5 16:40 9/7: 1, 0/0; H4 0, H1 1, M15 1. A6 10:05 9/8: 1, 1/1; H4 1, H1 1, M15 1. A7 16:55 9/8: 1, 0/0; H4 1, H1 1(1/1), M15 0. B2 16:10 6/5: 1, 0/0; H4 1, H1 1, M15 1. B3 14:35 6/11: 1, 0/0; H4 1, H1 1(1/0), M15 0. C-06-03 09:05 6/3: 0, 0/1; H4 1, H1 0(0/1), M15 1(0/0).

### R2 spec branch (spec 3.7:199-200/210; LTF panel row graded, HTF beside)

- Rule used: one-swing ⟺ obValid=1 AND fvgValid=1 (valid OB with imbalance); two-swing ⟺ ltf2OB=1 AND fvgValid=0 (strong + no imbalance); else UNKNOWN. Imbalance halves per B-148 R4 (SIDE1Q pairs).
- A1 two (1 + 0/0); A2 one (1/1); A3 two; A4 two; A5 two; A6 two; A7 two; B2 two; B3 one (1/1); C-06-03 UNKNOWN (2xOB=0, fvg=0 - neither branch).

### R3 table (SAME = branch match AND stop = branch swing: one-swing first protective swing from OB; two-swing second plain swing walk-back)

| row | conf | spec | machine (B-141) | stop + swing | verdict |
|---|---|---|---|---|---|
| A1 | 8/28 10:00 | two | 2-swing | 1.16508 (06:30) vs 2nd plain 09:45 1.16481 (strict; machine's own SH series names it 2nd) | DIFFERENT |
| A2 | 9/1 17:30 | one | 1-swing | 1.15975 (16:45, SLSRC OB_SWING + triple + zone equality) | SAME |
| A3 | 9/4 15:55 | two | 1-swing | 1.15847 vs 2nd 15:45 1.15902 (jln 46504; triple 15:40/15:50) | DIFFERENT |
| A4 | 9/7 09:15 | two | 1-swing | 1.16098 vs 2nd 09:00 1.16103 (jln 49763; triple 08:55/09:05) | DIFFERENT |
| A5 | 9/7 16:40 | two | 1-swing | 1.16238 vs 2nd 16:15 1.16239 (jln 52379; triple 16:10/16:20) | DIFFERENT |
| A6 | 9/8 10:05 | two | ext-1/1SWING | 1.16258 vs 2nd 09:50 1.16251 (jln 55235; triple 09:45/09:55) | DIFFERENT |
| A7 | 9/8 16:55 | two | 1-swing print | 1.16274 = 2nd 16:20 (triple B-141; branch mismatch decides) | DIFFERENT |
| B2 | 6/5 16:10 | two | 1-swing print | 159.598 vs 2nd 16:00 159.726 (jln 117288; triple 15:55/16:05) | DIFFERENT |
| B3 | 6/11 14:35 | one | 1-swing | 160.501 triple but first-from-OB unverified (SLSRC FALLBACK_SIDE; nearest protective 14:30 160.507) | UNKNOWN |
| C-06-03 | 6/3 09:05 | UNKNOWN | superseded | 159.889 | UNKNOWN |
| C-06-04 | beside | - | - | sl 159.920 (09:20 swing) | never graded |

### R4 DIFFERENT rows (entry OPEN per R-AT-OPEN skill L31; booked per B-141 R2; no tolerance/count)

- A1: spec stop 09:45 1.16481; R = 102/15 = 6.80. A3: 15:45 1.15902; R = 284/116 = 2.45. A4: 09:00 1.16103; R = 65/32 = 2.03. A5: 16:15 1.16239; R = 54/22 = 2.45. A6: 09:50 1.16251; R = 103/46 = 2.24. A7: 16:20 1.16274; R = 106/54 = 1.96. B2: 16:00 159.726; R = 664/333 = 1.99. All >= 1.0 inclusive: zero admission flips apart.
- (R-AT-OPEN, skill section 1 line 31, verbatim "entry open.": the 1R floor is measured from the entry open price.)

### R5 counts

- 1 SAME (A2) / 7 DIFFERENT (A1, A3, A4, A5, A6, A7, B2) / 2 UNKNOWN (B3, C-06-03). Admission flips apart: none. STOP-BASIS stays open (needs all SAME). Next relay drafts a Part S table from the DIFFERENT rows; no edit drafted here.

## Part X - records (grep-first, append once, verify count 1 each)

- X1 CONTEXT section 4: B149-BRANCH-FROM-DISK + B149-PANEL-STATE-PRINT appended after B148-STOP-BRANCH-INPUT (verbatim). Counts 1/1.
- X2 CONTEXT section 5: B-149 session line appended. Count 1.
- X3 HANDOFF section 3: B-149 line appended (verdict RESTORED). Count 1.
- X4 ledger 1294, tag B149-STOPBASIS3-2XOB-PRINT (branch repair, K3-K5, T tables, R1-R5). "^1294." = 1.
- X5 pointer (26 lines): latest B-149 RESTORED; SHAs after restore; STOP-BASIS 3 of 6 lane line; R5 1/7/2; local B-147 repaired; XOB-0604 parked kept; 4 June known open fire; goal open.

## Part F - file, push, reply

- F1 this result. F2 slice (K3 spots, K4 diff, filed-trade tables, B149OB2 confirmation rows, swing triples; under 600 lines). F3 ledger 1294. F4 pointer (35-line cap).
- F5 stages result, slice, ledger, pointer, PLANNER_CONTEXT.md, PLANNER_HANDOFF.md. Never EA/indicator/.B149D/includes/ex5/journals/logs/inis/profiles/charts/backups/TEMP/launch scripts.
- F6 re-check branch from disk (0.3), commit, push via backup, ls-remote check. Reply RESTORED, no carried note.

## Final disk state (RESTORED turn; B-137 kept build on disk, verified, terminal idle)

- Indicator src 956BF3E3 + ex5 27B5F272 (trial 7AE02D9F + .B149D copy kept uncommitted; .preB149 copies kept). EA 585093BF/AB159DE7 never touched. terminal.ini = preB149 bytes (AA4EA14B); Charts 20/0/0; no terminal64. CONTEXT +2 lines; HANDOFF +1 line; ledger +1 item (1294); pointer rewritten (26 lines). Launch/watch/STATUS/DONE/TEMP scripts uncommitted, unstaged. No source/ex5 committed.

(No carried note)
