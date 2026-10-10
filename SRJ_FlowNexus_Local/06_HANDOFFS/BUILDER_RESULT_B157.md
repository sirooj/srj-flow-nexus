# BUILDER RESULT B-157 - his outward stop as the last word: 7 Sep books your 16:15 low, lane closes kept

Trader summary: your two-swing stop is now the last word in the machine. On every setup where your panel shows the strong 2xOB state with no imbalance, the machine walks your outward walk - nearest finished swing first, each next one strictly beyond the last - and books the second one, after every older stop rule has had its say. Your 7 September New York long now books your 16:15 low 1.16239 instead of the machine's 16:05 low, and your other six stops book exactly your candles and prices as before. Every entry is identical, every exit is identical, the refused 16:40 short still refuses at your 1.16359, and June is untouched with the 4 June short still refused. The new pair stays on disk as the kept build. Nothing is asked.

## Relay order (B-157 STOP-BASIS reopen 7, one trial: last-word outward stop, KEPT)

- Part 0 on builder/B-156 at 5deb6c8b5c8a5080aaca991c957023a17031af1b (backup ls-remote verified exact; builder/B-157 cut here). Branch fact from disk after cut: HEAD builder/B-157 at 5deb6c8; re-checked before commit below. Push via backup only.
- Skills loaded whole in order (relay, then strategy; .agents stub never opened).
- Reads: pointer; RESULT_B156 + SLICE_B156 whole (K1/K2 diffs, 18 B156SL rows, G1-G4, S1X root cause EA:10775-10830, rungs EA:10820-10827, R-gate EA:10832, restore); RESULT_B155 + SLICE_B155 (R2 walks, R3 table, R5 spots); CANDLES_B155 9 files; spec v4.2 whole (3.7 branches/swing/side/walk, 0 bound 500, 8 one flag); register whole; CONTEXT section 4 (B137/B150/B151/B152/B155/B156 lines); INDEX_B153 + both DEALS + both SETUPS; ledger 1301 block (extended K0 skill-gate text).
- Names per 0.4: kit PK-2; kept EA 5A5BD1F0 (ex5 on disk D26AB572, B-156 recompile); indicator 78D3BFB1/E0E98A3D; OrderblockMgr 5D14FCE2 (never edited); .B156K copies on disk (ind 1009A4EF/A5EB81B6, EA 4566BE74/1480EC30); trial B157K; print B157SL; runs RECON62-B157 then JUNE0525-B157; ledger last 1301, new item 1302 tag B157-STOPBASIS-REOPEN-LASTWORD; lane STOP-BASIS parked 6 of 6 at B-156, reopened here on its key: relay 7, one trial only.
- Start gate: log-1 = 5deb6c8; diff vs 5deb6c8 EMPTY over every 0.3 file + ledger + both skills + journal + register; disk SHAs match 0.4 prefixes (kept + .B156K); no terminal64; lookback 3000 live; result-against-commit CONTEXT B156 1+1, HANDOFF B-156 RESTORED 1, ledger ^1301 1 with B156 tag, pack 9 files, pointer latest B-156; pre-greps ^1302 0, B157- 0, B157SL 0 in EA+indicator. No STOP.
- Scope: two source edits (indicator = .B156K re-applied byte-for-byte; EA = helper + override at the new site), one compile each, one run per window. Backups .preB157 with SHAs first; terminal.ini + Charts content copies before launch. No tolerance/buffer/distance/size/bar-count/date/price rule; no existing buffer index or EA input; one-swing path, target race, PROMO gate, exits untouched; S1X itself untouched (override runs after it); no question. Legal results used: FOUND, NOT FOUND, SAME, DIFFERENT, ACCOUNTED, KEPT.

## Part B - banking

- No new rule words. Grep-first; append nothing.

## Part S - separator table (unchanged B-155 R3; G2 of B-156 reproduced it in-machine to the point)

- W-O SAME on A1/A3/A4/A5/A6/A7/H3 with firsts per B-155; detectors A2/B2/B3/C-06-03; B1 + section C OTHER-GATE; W-P DOES NOT CALIBRATE; H5 UNKNOWN. 2xOB export proven 7/7 (B-156 G1).

## Part K - kept-build trial

- K0(a) his words (SEP7 Appendix 3; SLDEF5 Addendum 4 + 5 A2; SEP8 levels; skill L47/L31) + spec 3.7 quoted with line numbers in slice; S1X authorization: council-staged (ADD10 gate SATISFIED, Luna V112 re-clear dual-key), no his-words authorize it over his two-swing words -> proceed, S1X untouched.
- K0(b) census (kept EA): S5 stop step EA:9847 (SL_REF sites 6383-6409/6443-6611 inside); P-ADOPT E50 dormant EA:9880 (inert); S1X live rewire EA:10686-10741 (writes EA:10732/10737/10738); R gate reads EA:10743; order send EA:11372/11374. No other slRef write between. Chosen site: override block just before EA:10743 (after the last writer). Spots raw in slice.
- K1 Indicator: .B156K re-applied byte-for-byte (SHA 1009A4EF verified; ex5 A5EB81B6 copied, no recompile). No other change.
- K2 EA: from .preB157, FL_BUF_B156_2XOB 50 define + SrjWalkOutward2Swing helper unchanged re-applied; ONE override block pre-R-gate (reads buffer 50 + buffer 4 at the confirmation candle; two = 2xOB 1 AND imbalance invalid/absent; only there W-O replaces the stop; NO_SECOND keeps S1X value; R gate + downstream read post-block; rest byte-for-byte kept; B157SL print per R-gate arrival with bar/side/flags/branch/first/wo/kept(S1X)/booked/R/reason). Compile 0 errors 0 warnings, binary fresh. Trial src 1617DC1A / ex5 187A7202. .B157K copies kept uncommitted. Raw diff vs .preB157 in slice (minus-check: zero removals; anchor-whitespace tool-quirk repaired same turn, verified).
- Compiles: indicator copy-verified; EA 0/0 fresh.

## Part T - runs (RECON62 first, June gated on RECON62)

- T1 RECON62-B157 (ini EURUSD read back; script-file launch; window verified; wrapper killed; watcher PID-verified; DONE genuine RESULT=PASSED).
- T2 Gates after filed table (14 deals #2-#15, side/date/time/price SAME all 14): G1 PASS (flag2xOB=1.0 all 7 = B-149 R1). G2 PASS (first_bar + wo_stop = Part S cells to the point; firsts A1/A5/A6/A7 his). G3 PASS last word (booked=wo every TWO row; A5 order stop 1.16239 on terminal order line + TP_ELECT + A6FIRED + ELIGSTATE slRef 1.16239 rLive 2.45). G4 PASS (entries/exits identical; H3 still refused R 0.68; 9/1 15:25 silent; no absent fire; A5 volume 3.9->4.05 drift from new risk ACCOUNTED via sizer). G5: H3 kept R 0.68 vs trial R 0.68 SAME (sole refused TWO row; booked unchanged); no refused row changed.
- T3 JUNE0525-B157 PASSED (ini USDJPY read back; same discipline; DONE genuine): filed 8/8 SAME (#2-#9, volumes identical); G1 PASS (B2 1.0, B3 1.0, C-06-03 0.0 = B-149 R1); G2/G3 B2 PASS (first 16:00 159.726, wo=booked=kept 6/4 07:30 159.598, R 1.44); 4 June 09:55 refused PROMO_RETURN_NONE SAME (+11:05 event SAME); 2 June/10 June/5 June London silent SAME; no absent fire SAME.
- T4 KEPT (every gate both runs). Trial pair stays on disk uncommitted (EA 1617DC1A/187A7202; indicator 1009A4EF/A5EB81B6); kept ex5s backed as .ex5.B157K; .B156K copies kept. terminal.ini June window as-run; Charts as-run; no terminal64.

## Part X - records (grep-first, append once, verify count 1 each)

- X1 CONTEXT section 4 after B156 line (verbatim). Count 1.
- X2 CONTEXT section 5 after B-156 line (verbatim). Count 1.
- X3 HANDOFF section 3 after - B-156: line (verbatim, KEPT filled). Count 1.
- X4 ledger 1302, tag B157-STOPBASIS-REOPEN-LASTWORD (K0 census, K1/K2, T tables, G1-G5, verdict). "^1302." = 1.
- X5 register NOTE under section A row 5 (verbatim with EA sha). KEPT so applied.
- X6 pointer (35-line cap): latest B-157 KEPT with SHAs; STOP-BASIS CLOSED KEPT B-157; KILL-0604/XOB-0604 CLOSED kept; SILENT6 parked kept; O3 pending kept; Next: next unresolved fidelity item; goal open.

## Part F - file, push, reply

- F1 this result. F2 slice (K0 spots, both diffs, filed tables, every B157SL row, G5; under 600 lines).
- F2b row packs (6 week files + DEALS + 26 day files + INDEX_B157) + 2 SETUPS (sl/swing/branch/R/source lines per relay) committed.
- F3 ledger 1302. F4 pointer.
- F5 stages result, slice, packs/report and register (KEPT), ledger, pointer, PLANNER_CONTEXT.md, PLANNER_HANDOFF.md. Never EA/indicator/includes/ex5/.preB157/.B157K/.B156K/journals/logs/inis/profiles/charts/TEMP scripts.
- F6 branch re-check from disk, commit, push via backup, ls-remote check. Reply KEPT, no carried note.

## Final disk state (KEPT turn; B-157 trial pair on disk as the new kept build, verified, terminal idle)

- EA src 1617DC1A + ex5 187A7202 (verified) + indicator src 1009A4EF + ex5 A5EB81B6 (verified); OrderblockMgr 5D14FCE2 untouched; no terminal64. CONTEXT +2; HANDOFF +1; ledger +1 (1302); pointer rewritten; register +1 NOTE. No source/ex5 committed.

(No carried note - no question goes to him.)
