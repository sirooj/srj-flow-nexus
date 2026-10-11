# BUILDER RESULT B-178 - One zone, one answer: the 2 July reaches were in the B-176 cut all along; standing-at-confirmation separates; print-only, restored

Trader summary: your 2 July long still fired on this print-only run, and the kept build is back byte-for-byte. Between a quarter past five and twenty-five to six, the evening candles came back into four live long zones up near 1.336, and all four were already dead before your 18:10 confirmation candle — two killed on the 17:25 candle, two killed on the 17:40 candle, including your 16:20 zone whose kill level sits at 1.33623 and whose 17:40 close printed at 1.33605 straight through it. Nothing of those four stood at 18:10. The earlier "no touch 17:15 to 18:10" line misread the machine's own cut, which held those six reach rows the whole time; the gap half of your 2 July row stands (no touched gap at 18:10). Graded zone by zone, the reading that refuses a trade whose reached zones are all dead at the confirmation candle holds every one of your takes and refuses only the 2 July long. Nothing is asked.

## R0 class (reported first): PRESENT-MISREAD
- Committed HISZONE_B176_GBP0629.csv HOLDS six B176HZ XOB_REACH side=B rows 17:15-18:10 (packs 764/765 bar 17:20; 774/775 bar 17:30; 782/783 bar 17:35; full rows in slice). Two differently-formed patterns agree (XOB_REACH side=B + bar=17:xx second form); ZERO-COUNT guarded.
- B-176 Part S line "no B-side REACH 17:15-18:10" misread its own cut. B-176 FVG half stands (GAP_TOUCH at the 18:10 bar all t=18:05).
- Day-log spans confirm byte-for-byte (20261011.log, one bounded forward-only pass 7750900-7751350 + 10467600-10468100, 32.1s, 63 hits): B176D lines byte-identical to cut; B177 span holds the identical six reaches with identical ranges/promos and identical LATEST B 18:10 (nLive=13, latestPromoT 17:15); B177HZ gate row 18:10 PASS (gapTouch 0.0, xobWin 1.0).
- B-177's reconciliation stands half-corrected: the census-miss claim stands; the "prints lacked" claim is refuted — the prints were in the committed cut. SEPARATOR_B177 "REACH 17:25" is the pass-time label of the 17:20 bar.
- No STOP from R0.

## Relay order (B-178 INPLAY-JUMP-0702 reopened relay 7, print-only, verdict RESTORED)
- Part 0 on builder/B-177 at 2cac14e (backup ls-remote exact; no remote builder/B-178 before push; builder/B-178 cut here; rev-parse HEAD = 2cac14e + branch builder/B-178 after cut, re-checked before commit below). Push via backup, never origin.
- Skills loaded whole in order (srj-relay; srj-strategy whole; .agents stub never opened).
- Reads in order: pointer; RESULT_B177 + SLICE_B177 (B176HZ print block + B177HZX hunk raw; T1 tables = baseline); SEPARATOR_B177.csv (22 rows; T0702 DIFFERENT); RESULT_B176 (Part S line) + SEPARATOR_B176.csv; REGISTER whole; spec v4.2 whole (3.5 L124-141, 3.5.1 L143-156, 3.6 L158-181 by line); CONTEXT section 4 whole. Grep only: HISZONE_B176_GBP0629.csv, ledger, AGENTS.md, .clinerules, Tester day logs. July journal never read.
- Names verified on disk: EA 794DD4B8 + ex5 3A55C566; indicator 7842A02E + ex5 10880847 (trial 9AD487F2/EA4D9473 restored away); OrderblockMgr 8BBF936B; BiasEngine 3B1D9D3D; HTFEngine D5FD5B06; ImbalanceMgr 568F4CE9; terminal.ini CF80083C; inis 1AAD5FF0/0C9D97D3/9C88E21D; Profiles/Charts 23 files. Indicator .B176HZ A22067AD (base of edit); .B177HZ ind 2AF9C6D3 on disk (slice L431 parenthetical ind-A22067AD accounted as typo, no STOP) + EA EB18717E (not used); .preB177 copies; .B171NIP present never committed (ACCOUNTED). Runs RECON62-B178P, JUNE0525-B178P, GBP0629-B178P. Print tags B176HZ (re-applied), B178ZL (new). Edited copy .B178ZL src 9AD487F2. Backups .preB178. Outputs: 15 day files ZONELIFE_B178_*_D<yyyymmdd>.csv; SEPARATOR_B178.csv; RESULT_B178; SLICE_B178. Ledger 1324 tag B178-ZONELIFE. Kit PK-2. Lane INPLAY-JUMP-0702 reopened relay 7; relay 8 = one kept trial if Part S SEPARATES (it does: HZ_B), else park final.
- Start gate: log-1 = 2cac14e; status 904 lines (dirty tree preserved). git diff 2cac14e EMPTY on both skills, register, pointer, CONTEXT, HANDOFF, spec, RESULT_B177, SLICE_B177, SEPARATOR_B176/177, HISZONE_B176_GBP0629. Disk SHAs per relay (all match; LF-normalized where text). Counts: ledger "^1323." = 1, "^1324." = 0 pre; "B178-" = 0 pre; HANDOFF "B-177:" = 1, "B-178:" = 0 pre. No terminal64. Python NOT FOUND (B-177 bounded forward-only switch-File streams instead, timings filed; never whole-file Get-Content).
- Scope kept: R0 greps; one print-only indicator edit (re-apply .B176HZ byte-for-byte + one B178ZL block); one compile; three runs; cuts; offline grades; text records; full restore. No EA edit; no include edit; no buffer/export/gate change; no store/kill/promotion/PROMO-gate/leg change; no tolerance/buffer/minimum/count/new number (spec 0); July journal never read; no question outside carried-note rule; no machine zone numbers or log references in trader summary (W1 L258).

## Part B - banking (no new rule words; verify-only, counts with line numbers)
- W1 L258, W2 L259, W3 L260, his 2 July B2 L252 + B4 L254 (+ consequence), L41 FVG-validity, L127 SWEEP-TEST-STRICT, MOST-RECENT-XOB-TAG L244: each count 1.

## Part K - print-only indicator edit (B178ZL)
- K0 quotes: spec 3.5 L131 (in-play whole); 3.5.1 L147 (order) + L152 (promotion clears touch); 1.2 L54 (relevant = promoted); 9.9 (age never disqualifies); MOST-RECENT-XOB-TAG (several XOBs in play; most-recent = documentation only, never a gate); W2 + B4 (2 July must never be taken). Print changes no rule; no conflict, no carried note.
- K1 backups .preB178 (indicator src 7842A02E + ex5 10880847, terminal.ini CF80083C, Charts.preB178 23 files) with SHAs, before any edit/launch.
- K2 .B176HZ copied over indicator source; A22067AD confirmed.
- K3 spots (raw with real line numbers in slice): B176HZ reach loop indicator:1728-1782 (g_orderblocks / GetOB / isPromoted / promotionBar / isValid / isBullish) + LATEST :1779-1782; formation field = startBar (B162ORIGIN :1588/:1594 via SRJ_BarTimeStr); kill level = invalidationLevel + invalidationBar (SRJ_Types.mqh; OrderblockMgr:501-514 closedBeyondInvalidation test, B160K old line) FOUND and indicator-readable (includes SRJ_OrderblockMgr.mqh). KILL-LEVEL NOT FOUND not taken.
- K4 one additive print-only block, marker [B-178 B178ZL] exactly once, inside same if(barClosed) block right after B176HZ reach loop, same cadence. Per promoted XOB both sides, event times/prices saved when seen, never a bar index read later (B153): PROMO once (side/formT/promoT/range/kill), KILL once (side/formT/promoT/range + t/o/h/l/c), ALIVE every in-window bar (side/bar/n/list=formT/promoT/range). Identity = range + promotion candle (B152). Store: slots appended first-sight, every field initialized, exact-size growth, reset beside B176HZ resets in full-recalc block (B153). No buffer/export/include/threshold/count. Brace +8/+8 vs .B176HZ (balanced 120/120); marker count 1; compile 0 errors binary fresh (3 code-43: two pre-existing shifted + one new mirrored startBar cast); .B178ZL src 9AD487F2 / ex5 EA4D9473 kept uncommitted. Diff +291/-0 vs .preB178, raw in slice. Defect owned: journal message cap ~255 chars truncates long ALIVE lists (n= counts stand, lists cut); grading carried by PROMO+KILL rows per Part S, ALIVE-n as control; no rerun, no rule touched.
- K5 stamp: rows carry time[i] of the closed bar, as B176HZ does (B145).

## Part T - runs (kept EA + trial indicator; RECON62, then June, then GBPUSD)
- T0 per launch: no terminal64; [Tester] DateFrom/DateTo spliced + read back (size 20447 preserved): 1787702400/1788998400, 1779667200/1781308800, 1782691200/1784332800; script-file launches (WMI PIDs 20848/7464/9536); windows verified in journal (EURUSD 8/26, USDJPY 5/25-6/13, GBPUSD 6/29-7/18); wrapper shells killed post-verify (terminals survived); watchers PID-verified (11184/15840/5300); short DONE polls (60s). Terminal closed after each run.
- T1 filed-trade tables (side/date/time/price vs B-177 T1; volumes shown, never a STOP): RECON62-B178P 14 deals #2-15, 14/14 SAME (marker 563338/3168; DONE PASSED); JUNE0525-B178P 8 deals #2-9 (4 June absent, PROMO holds), SAME (marker 740873/4320; DONE PASSED); GBP0629-B178P 4 deals SAME (#2 buy 18:15 1.33716, #3 sell 19:07:53 1.33564, #4 sell 14:45 1.33863, #5 buy 16:54:59 1.33747) — 2 July still fires (print-only, expected). Full tables in slice.
- STOPs right after tables: S1 pass all runs (no side/date/time/price diff, no deal added/lost); S2 pass (14/8/4 deals, no halt/array error); S3 pass (windows verified). No restore-on-STOP needed.
- T2 cut B176HZ + B178ZL + deal rows for every register day + 2/7 July, one pass per the whole log (2,957,887 lines, ~69s), columns pack_line,run,ea_sha,indicator_sha,journal_file,journal_line,server_date,server_time,tag,raw (CRLF, CSV-quoted, UTF8-no-BOM, pack_line per file from 1) to 15 day files ZONELIFE_B178_*_D<yyyymmdd>.csv (RECON62 6, JUNE 7, GBP 2), all under 900 KB. Time rule mirrors cut_b176.py (first t3/t/bar match) + PROMO promoT fallback + DEAL body timestamp. Week splits overflowed on ALIVE rows so day splits replace _W<k> (disclosed). Row counts per file filed in ledger.
- T3 restore .preB178 (indicator src 7842A02E + ex5 10880847, terminal.ini CF80083C, Profiles/Charts 23 files); verified; no terminal64. EA 794DD4B8/3A55C566 untouched throughout.

## Part S - separator from B-178 prints only (REPORT/SEPARATOR_B178.csv, 22 rows)
- Same 22 confirmation candles as SEPARATOR_B177; OTHER-GATE rows stay OTHER-GATE. gap_half as B-177, unchanged. HZ_A (control) reproduces B-177 incl T0702 FIRED.
- HZ_B (spec 3.5 + 3.5.1, window from latest trade-side promotion; reach after own promotion + standing at C): every A row + owed B rows MET (A1 via gap_half; A3 via four 9/03-promo zones standing — PROMO on full-log rows, zero KILL anywhere in run, same-day no-kill airtight); T0702 NOT MET (all four 17:20-17:35 reaches killed 17:25/17:40, none standing at 18:10); must-never C rows silenced. T0707 MET (change detector, reported only). HZ_B SEPARATES.
- HZ_C (window from reached zone's own promotion only): DOES NOT SEPARATE — T0702 MET via 03:15-06:20 reaches of the 03:10-promo zone standing (no KILL).
- HZ_L (HZ_C + reach after last 5m flip into trade direction; flips from kept UJPROBE ltf rows, all 13 found, one log pass 7.9s/4320 rows): DOES NOT SEPARATE — B2 NOT MET (only reach 16:00 predates the 16:05 flip, his words).
- Each reading OR'd with gap_half. Readings sit side by side; none picked as his rule here.
- S-0702 table (candle words): four long zones reached 17:20-17:35, none standing at 18:10 —
  - formed 16:35, promoted 17:15, 1.33661-1.33767, kill 1.33714, KILL t=17:25;
  - formed 17:00, promoted 17:15, 1.33660-1.33766, kill 1.33713, KILL t=17:25;
  - formed 16:05, promoted 17:15, 1.33555-1.33697, kill 1.33626, KILL t=17:40;
  - formed 16:20, promoted 16:40, 1.33562-1.33684, kill 1.33623, KILL t=17:40 FOUND (his 16:20 zone per his B2; 17:40 close 1.33605 through 1.33623).
  ALIVE long at 18:10 n=13 holds none of the four (pack 1025). PROMO packs 900/938/939/940; KILL packs 954/955/980/981.
- S-BUILD (read-only): HZ_B rides one additive export (B-156 shape): per-zone standing-at-confirmation flag from the B178ZL store loop (indicator reach-loop site, :1752ff), consumed at the EA confirmation-divergence pass beside B153K (the B177HZ site EA:9971; both roads pass it per B-177 K3). Bar-count/distance/size fields never separators (spec 0).

## Part X - records (grep-first: 0 before, 1 after)
- X1 CONTEXT section 4 +1 (B178-STANDING-AT-CONFIRMATION, verbatim); X1b section 5 +1 (2026-10-11 ClickUp Brain B-178).
- X2 HANDOFF section 3 +1 (B-178 line, verdict RESTORED).
- X3 ledger 1324 tag B178-ZONELIFE (R0 class + rows, K0 quotes, diff stat, SHAs, T1 tables, Part S verdicts, S-0702 table, restore proof). "^1324." = 1.
- X4 pointer rewritten (35-line cap): latest B-178; Lane INPLAY-JUMP-0702 reopen relay 7; Next = one kept trial of HZ_B (relay 8, final) or PARKED FINAL; then his grading of a fresh GBPUSD run; O3 pending; goal open.
- X5 register untouched.

## Part F - file, push, reply
- F1 this result. F2 slice (348 lines, under 600). F3 ledger 1324. F4 pointer.
- F5 stages RESULT_B178, SLICE_B178, REPORT/SEPARATOR_B178.csv, REPORT/ZONELIFE_B178_*_D<yyyymmdd>.csv (15 day files), ledger, pointer, PLANNER_CONTEXT.md, PLANNER_HANDOFF.md. Never EA, includes, indicators, ex5, journals, logs, inis, profiles, backups or helpers. Superseded cutter revs (week-split + combined ZONELIFE files) deleted, not staged.
- F6 rev-parse checks, commit, push via backup; ls-remote builder/B-178 must return the commit.
- Reply line: B-178 is done, GitHub branch builder/B-178, commit <short hash>, verdict RESTORED.

## Final disk state (RESTORED; B-170 kept build on disk, verified, terminal closed)
- EA 794DD4B82226CD6BA0C0414DA9DBB182DF3AD75C4026946BB6E3FB1252B8EB61 + ex5 3A55C566 (pair matches; never edited); indicator 7842A02E + ex5 10880847 (pair matches; trial 9AD487F2/EA4D9473 reverted); OB 8BBF936B; Bias 3B1D9D3D; HTF D5FD5B06; ImbalanceMgr 568F4CE9 untouched; terminal.ini CF80083C; inis 1AAD5FF0/0C9D97D3/9C88E21D; Profiles/Charts restored (23 files); .B171NIP present never committed ACCOUNTED; .preB178 + .B178ZL copies kept uncommitted (trial re-appliable); no terminal64. CONTEXT +2; HANDOFF +1; ledger +1 (1324); pointer rewritten; result + slice + separator + 15 day cuts new; helpers + launchers + STATUS/DONE + work files unstaged. No source/ex5 committed.

(No carried note - HZ_B SEPARATES; no conflict at K0.)
(End of file)
