# BUILDER RESULT B-156 - the walk works on screen but a later rule re-picks the stop: trial restored, lane parks

Trader summary: your outward walk ran inside the machine on every setup, and on screen it lands all seven of your stops exactly - including your 7 September 16:15 low 1.16239. But the booked 7 September stop stayed at the machine's 16:05 low 1.16238: a later rule of his own staging re-picks the stop after your walk runs, from its own rungs, and on that row it picks 16:05. Everything else is untouched - all 14 deals identical in side, date, time and price, the refused 16:40 short still refused at your 1.16359, no new fire anywhere. Because the one row that had to move did not move, the trial is restored and the stop lane parks with this evidence on file. Nothing is asked.

## Relay order (B-156 STOP-BASIS 6 of 6: 2xOB export + outward two-swing trial, RESTORED)

- Part 0 on builder/B-155 at ee0fbe376b56fa3d061e2797d09d585f4f6eff8f (backup ls-remote verified exact; builder/B-156 cut here). Branch fact from disk after cut: HEAD builder/B-156 at ee0fbe3; re-checked before commit below. Push via backup only.
- Skills loaded whole in order (relay, then strategy; .agents stub never opened).
- Reads: pointer; RESULT_B155 + SLICE_B155 whole (R2 walks, R3 table, R4, R5 spots, R6); CANDLES_B155 9 files; RESULT_B149 + SLICE_B149 (K3 spots, K4 B149OB2 diff, R1/R2/R4); RESULT_B153 (kept build, PROMO gate, pack/report shape); spec v4.2 whole (3.7 two-branch/swing/side/walk, 0 bound 500, 8 one flag); register whole; CONTEXT section 4 (B137/B148/B149/B150/B151/B152/B155 lines); INDEX_B153 + both DEALS + both SETUPS.
- Names per 0.4: kit PK-2; kept EA 5A5BD1F0/EX5 AFCEC04D + FlowLogic 78D3BFB1/E0E98A3D + OrderblockMgr 5D14FCE2 (never edited); trial B156K; print B156SL; runs RECON62-B156 then JUNE0525-B156 (June gated); ledger last 1300, new item 1301 tag B156-STOPBASIS6-OUTWARD-TRIAL; lane STOP-BASIS (first B-148) 6 of 6.
- Start gate: log-1 = ee0fbe3; diff vs ee0fbe3 EMPTY over every 0.3 file + ledger + both skills + journal + register; disk SHAs match 0.4; no terminal64; lookback 3000 live (InpFL_HtfLookbackBars=3000); result-against-commit CONTEXT B155 1+1, HANDOFF B-155 1, ledger ^1300 1 with B155 tag, pack 9 files, pointer latest B-155; pre-greps ^1301 0, B156- 0, B156SL 0 in EA+indicator. No STOP.
- Scope: TWO source edits (indicator export, EA selector), one compile each, one run per window. Backups .preB156 with SHAs first; terminal.ini + Charts content copies before launch. No tolerance/buffer/distance/size/bar-count/date/price rule; no existing buffer index or EA input touched; one-swing path, target race, PROMO gate, exits untouched; no question. Legal results used: FOUND, NOT FOUND, SAME, DIFFERENT, CALIBRATES (B-155 carry), KEPT-path, RESTORED.

## Part B - banking

- No new rule words. Grep-first; append nothing.

## Part S - separator table (committed B-155 R3 + pack lines; runs B-153, EA 5A5BD1F0)

- Per relay table: A1/A3/A4/A5/A6/A7/H3 W-O SAME (pack lines on file), A2/B2/B3/C-06-03 detectors, B1 + section C OTHER-GATE, W-P DOES NOT CALIBRATE, H5 UNKNOWN. (Full rows in SLICE_B155 R3.)

## Part K - kept-build trial (K0 checked first)

- K0: his words (SEP7 Appendix 3 EXACTLY-two-away; SLDEF5 Addendum 4 second-swing stops; Addendum 5 A2 first 09:55 NOT 09:45; SEP8 Two-swings-away; skill L47) + spec 3.7 (branches, side, walk, one flag) quoted with line numbers in slice. No contradiction with them; edited. (K0 missed the staged EA stop rule S1-LIVE-STOPFIX-001 below - defect owned, recorded in ledger item 1301.)
- K1 Indicator (FlowLogic only, +7/-1): buffer 51, decl g_buf2xOB, SetIndexBuffer(50), ArraySetAsSeries false, ArrayInitialize 0.0 in reset (new slots start empty), write g_s.isDoubleOB at target with the B150 pair's gate (the B149OB2 ltf2OB variable, FOUND in .B149D:1454, kept include untouched). No existing buffer/input/draw/computation touched. Spots + raw diff in slice. Compile 0 errors (+1 pre-existing benign warning). Trial src 1009A4EF / ex5 A5EB81B6, binary fresh.
- K2 EA (+100/-2): FL_BUF_B156_2XOB 50 define; SrjWalkOutward2Swing helper (chart-frame walk from confShift+1, strict triple, strict protective side, first + strictly-beyond second, 500 bound, chart highs/lows never buffer slots); S5-only wrapper at the stop step (reads buffer 50 + buffer 4 at the confirmation candle; two = 2xOB 1 AND fvg invalid/absent; only there W-O overrides slRef/slMode=2SWING; else kept result stands; B156SL print every S5 confirmation with bar/side/flags/branch/first/stop/kept/R/reason; abort preserved). S2POLL/S3ARM paths untouched. Spots + raw diff in slice (whitespace drift EA:3053-3054 owned + disclosed). Compile 0 errors 0 warnings. Trial src 4566BE74 / ex5 1480EC30, binary fresh. .B156K copies kept uncommitted (4 files).

## Part T - runs (RECON62 first; June gated)

- T1 RECON62-B156 (terminal.ini EURUSD 1787702400/1788998400 written + read back; launch script file; WMI PID; window verified 8/26 progression; wrapper shell killed post-verification; watcher PID-verified; DONE genuine RESULT=PASSED 16:24:04).
- T2 Gates after filed table (14/14 SAME side/date/time/price/volumes, deals #2-#15): G1 PASS (flag2xOB=1.0 at all 7 confirmations = B-149 R1 ltf2OB; fvg halves match too). G2 PASS (every TWO stop/first = Part S W-O cell to the point; first = his first on A1/A5/A6/A7). G3: entries identical SAME; exits identical SAME; no absent fire SAME; H3 still refused at his 1.16359 R 0.68 SAME; A5 booked stop 1.16238 (terminal take-profit line `sl: 1.16238`, TP_ELECT + A6FIRED sl 1.16238) DIFFERENT from ordered 1.16239 -> G3 MISS (no entry lost, no new fire). G4 EMPTY (no booked stop changed anywhere; H3 refusal rows identical).
- Root cause: S1-LIVE-STOPFIX-001 live rewire (EA:10775-10830, Luna-cleared staged rule) reselects slRef at S5 AFTER the B156K hook from ext-1/s0/s1 rungs (EA:10820-10827); on A5 it picks 16:05 1.16238 over the S5 16:15 1.16239 (other six rows agree, so the override is invisible there). Reopen key: place the outward override downstream of the S1X rewire (just before R-gate slDist EA:10832). Side notes: B156SL kept_stop_px reads pre-rewire (A3 1.15907, A6/A7 1.16379 vs latched kept); A6FIRED mode flips to 2SWING on two-branch rows at same prices (inert for fills); ORIGINREG A5 match=0 is its frozen retain-diagnostic (print-only, EA:8982-8985).
- T3 June: NOT RUN (RECON62 did not pass every gate).
- T4 RESTORED: sources restored from .preB156 SHA-verified (EA 5A5BD1F0, indicator 78D3BFB1); indicator ex5 restored from .ex5.B153K (E0E98A3D verified); EA ex5 had no kept backup so recompiled from restored source, 0/0, D26AB572 (build-stamp difference only, source-identical, disclosed); terminal.ini (F017D32D) + Charts (26 files) restored; no terminal64 remains. .B156K copies + full diffs in slice.

## Part X - records (grep-first, append once, verify count 1 each)

- X1 CONTEXT section 4 after B155 line (verbatim). Count 1.
- X2 CONTEXT section 5 after B-155 line (verbatim). Count 1.
- X3 HANDOFF section 3 after - B-155: line (verbatim, RESTORED filled). Count 1.
- X4 ledger 1301, tag B156-STOPBASIS6-OUTWARD-TRIAL (K0-K2, T tables, G1-G4, verdict). "^1301." = 1.
- X5 register: none (RESTORED, not KEPT).
- X6 pointer (35-line cap): latest B-156 RESTORED with SHAs (EA ex5 note); STOP-BASIS PARKED 6 of 6 (W-O calibrates 7/7; reopen key: S1X rewire overwrites S5 override on A5); KILL-0604/XOB-0604 CLOSED kept; SILENT6 parked kept; O3 pending kept; Next: next unresolved fidelity item; goal open.

## Part F - file, push, reply

- F1 this result. F2 slice (spots, both diffs, filed table, 18 B156SL rows, G4; under 600 lines). No F2b (not KEPT). F3 ledger 1301. F4 pointer.
- F5 stages result, slice, ledger, pointer, PLANNER_CONTEXT.md, PLANNER_HANDOFF.md. Never EA/indicator/includes/ex5/.preB156/.B156K/journals/logs/inis/profiles/charts/TEMP scripts.
- F6 branch re-check from disk, commit, push via backup, ls-remote check. Reply RESTORED, no carried note.

## Final disk state (RESTORED turn; B-153 kept build on disk, verified, terminal idle)

- EA src 5A5BD1F0 (verified) + ex5 D26AB572 (recompiled from restored source, 0/0); indicator src 78D3BFB1 + ex5 E0E98A3D (both verified); OrderblockMgr 5D14FCE2 untouched; no terminal64. CONTEXT +2; HANDOFF +1; ledger +1 (1301); pointer rewritten. Trial .B156K copies kept uncommitted. No source/ex5 committed.

(No carried note - no question goes to him.)
