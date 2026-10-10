# BUILDER RESULT B-153 - KEPT: clean store re-proves every zone, EA refuses the 4 June short, all else identical

Trader summary: your rule now proves itself on every zone. Each zone the machine counts prints its own range, its promotion candle and the exact candle that came back to it - and every one of those comebacks checks out against the run's own candles, 160 for 160. Seven ghost zones from the earlier read are gone: they were never touched after promotion. The one 3 June zone the old read counted is correctly absent - its first comeback came two hours after your entry. With that proof in place, the EA now refuses the 4 June short at its confirmation candle for the exact reason you gave - no promoted zone price came back to - while every one of your valid takes fires unchanged. The new pair stays on disk as the kept build. Nothing is asked.

## Relay order (B-153 KILL-0604 4 of 6: clean store, re-proof from scratch, EA refusal)

- Part 0 on builder/B-152 at 3a0033ed906c04625ed8e41ff3ba47d4c9a29f97 (backup ls-remote verified exact; builder/B-153 cut here). Branch fact after cut: HEAD builder/B-153 at 3a0033e; re-checked before commit below. Push via backup only.
- Skills loaded whole in order (relay, then strategy; .agents stub never opened).
- Reads: pointer; RESULT_B152 + SLICE_B152 (R0 lines, K1b diff, crash 1520:36, bar-0 rows); RESULT_B151 R1-R4 + SLICE_B151 R2 (six zones, 2510, 2566); RESULT_B150 + SLICE_B150 (K1 spots, K2 diff); RESULT_B147 R3 + SLICE_B147 R3; spec 1.2/3.5/3.5.1/3.6/9.9/10; register whole; DEALS packs (14 + 10); CONTEXT section 4 (B-88/B128/B129/B137/B142/B150/B151/B152 lines).
- Names per 0.4 (kept EA 585093BF/AB159DE7 at start, FlowLogic 956BF3E3/27B5F272, OrderblockMgr 5D14FCE2, B150K 0E9D5931/4156C29A, B152K 83289B4E/8367027F). Trial B153K: indicator src 78D3BFB1 / ex5 E0E98A3D; EA src 5A5BD1F0 / ex5 AFCEC04D (kept uncommitted = new kept build). B152PR tag kept; B150GATE + PROMO_RETURN_NONE printed. .preB153 backups with SHAs. Runs S1 RECON62-B153S1/JUNE0525-B153S1 (+S1b repair pair), stage-2 RECON62-B153/JUNE0525-B153 (1787702400/1788998400, 1779667200/1781308800). Ledger 1298, tag B153-KILL0604-CLEAN-STORE. Lane KILL-0604 (first B-150, 4 of 6).
- Start gate: log-1 = 3a0033e; status 619 (reported: 609 + B-152 run artifacts); committed-file diff vs 3a0033e EMPTY over every 0.3 file + ledger + skills + journal + register; disk SHAs all match 0.4; result-against-commit CONTEXT B152-PRINT-PROVES-ITSELF 1 + relay B-152 (kit PK-2) 1, HANDOFF - B-152: 1, ledger ^1297. 1, register B-152 RESTORED 1, pointer latest result B-152 1; pre-greps B153-NEW-SLOTS-START-CLEAN/^1298. 0. No STOP.
- Scope: R0 code read. K1 one edit to B152K copy (export + print only) + one repair each for a compile error (dup declaration) and a print defect (journal truncation at ~537 chars: single-line z= replaced by per-XOB z1= lines, same tag) + compiles; one run per window per print shape with EA untouched (S1b repair pair disclosed). K2-K4 + Part T ran after R1-R3 passed. Forbidden lines untouched (no XOB lifecycle/OrderblockMgr/buffer 0-47/input change; no date/price/symbol filter; no tolerance/distance/count; no question). Authority: his O1 KILL-FIRST (Orders 2026-10-10 (B-150); REFINEMENT-PHASE SCOPE). Legal results used: FOUND, NOT FOUND, SAME, DIFFERENT, MET, NOT MET, ACCOUNTED.

## Part B - banking

- No new rule words. Nothing appended.

## Part R0 - read the B152K store code (no edit; raw lines)

- Every ArrayResize of the stores: reset 1472-1473 (`ArrayResize(g_b150Touched, 0)` + `ArrayResize(g_b152cb, 0)`); grow 1494-1495 (`ArrayResize(g_b150Touched, idx+1024)` + `ArrayResize(g_b152cb, idx+1024)`), then flag+cb assigned as a pair (1497-1501). No initialization of new elements anywhere.
- (a) New slots after grow: NOT set by the code (FOUND the planner's hypothesis: grow path 1494-1495 assigns nothing; leftover-true flags = B-151's extras; leftover cb = B-152's bar-0 rows and crash).
- (b) Grow together: NOT FOUND as a defect in code (adjacent lockstep resizes, identical sizes; reset together).
- (c) Comeback stored as bar index i (1500), read back (1515) and indexed into time/high/low at print (1518-1521) with no range check: FOUND the crash mechanism (live line 1520:36).
- (d) Kept-code arrays growing the same way: NOT FOUND (kept indicator has no ArrayResize; kept includes' grows are immediately filled/runtime-sized, never sparse flag stores).
- Bar-0 rows (474/484/706 -> 2025.01.02 00:00): explained by (a) for the flag side; the (true,0) pairing mechanism UNKNOWN from code alone (paired assignment forbids it) - runtime array behavior implicated, eliminated regardless by K1b.

## Part K1 - stage 1b indicator (EA untouched)

- K1a copies (*.preB153, SHAs): indicator src 956BF3E3 + ex5 27B5F272; EA src 585093BF + ex5 AB159DE7; terminal.ini AA4EA14B (20447 B); Charts tree 0 diffs. No terminal64 (0). B152K -> .B153K working copy byte-identical (83289B4E verified).
- K1b edit (export + print only): declaration swap to touched + comeback time/high/low arrays; reset all four; grow all four + explicit init of every new slot (false/0/0.0/0.0); save time[i]/high[i]/low[i] on flag transition; MET loop prints saved primitives (never a stored index). Print repair: B152PR summary (bull/bear/nz) + one z1= line per MET XOB (same tag; journal truncates single lines at ~537 chars). Buffers 48/49 unchanged in meaning; existing indices/inputs/lifecycle untouched. Diffs: vs B152K +37/-20 (then print repair to +114/-1 vs kept final); trial src-COMPILE1 39A5C68A failed (dup declaration, owned, repaired same turn); trial src 78D3BFB1. Compile: 0 errors, 1 benign warning (pre-existing long->int cast). Trial ex5 E0E98A3D, binary fresh. .B153K src + .ex5.B153K kept uncommitted.
- K1c runs (ini written + read back; launch per srj-relay; watcher PID-verified + short DONE polls; wrapper shell killed post-verification per discipline, terminal+watcher survived): RECON62-B153S1 PASSED (first print shape; 14/14 deals identical) + RECON62-B153S1b PASSED (repair shape; 126215 summaries one/bar 2025.01.02->2026.09.09, 88184 z1, 0 errors, 14/14 identical). JUNE0525-B153S1 PASSED (10/10 identical) + JUNE0525-B153S1b PASSED (108057 summaries, 130505 z1, 0 errors, 10/10 identical). Filed-trade tables in slice. No STOP (EA unchanged; volumes identical).

## Part R - re-proof from scratch on the run's own rows (S1b pair)

- R1 verdicts (B152PR summaries, day-log file:line): A1 bear=1 MET (1240387); A2 bull=1 MET (1267470); A3 bull=1 MET (1298295); A4 bull=1 MET (1305875); A5 bull=1 MET (1310896); A6 bear=1 MET (1318114); A7 bear=1 MET (1322271); C-05-27 bull=1 beside (1506652); C-06-03 bull=1 MET (1557863); C-06-04 bear=0 NOT MET none (1570349); B2 bull=1 MET (1583808); B3 bull=1 MET (1634897). 12/12 as required (B-150 verdicts unchanged - no row moved).
- R2 self-proof, every trade-direction MET segment at the 12 candles: 160 rows, each (i) comeback strictly after promotion, (ii) saved comeback high-low overlaps printed zone, (iii) isValid=1, (iv) UJBARMAP same high/low where in-window: 160/160 PASS (77 full PASS incl. UJBARMAP match, 83 n/a-window pre-window comebacks proved by saved primitives). Zero FAIL/UNKNOWN. Full table in TEMP r_direct.txt (slice carries compact form).
- R3 named cases (match by zone+promo, never number): 2510 (159.141-159.180 @5/29 19:10) NOT MET anywhere (absent all 12 rows) - B-150's flag was leftover-true; R0 explains it (no init after grow; 64 pre-promo overlaps, none after). 2566 (159.382-159.407 @6/01 03:15) NOT MET at C-06-03, MET at B2/B3 with cb 6/03 11:30 (h 159.790/l 159.368, overlap PASS) - R0 does not explain B-147's C-06-03 inclusion (first touch 11:30 > C; B-147's touch row irreproducible, carried). 2149 MET at A6/A7 only (cb 8/28 14:00), correctly absent A1 (touch after C) - matches B-147 MACH exactly. 2281/2706/3491/3834 + 474/706 absent everywhere (leftover-true, R0 explains). comebacks quoted in slice.

## Part K2-K4 - EA refusal (R1-R3 passed)

- K2 B153K src+ex5 copied into place, SHAs verified (78D3BFB1/E0E98A3D). EA content copy from K1a.
- K3 spots pasted raw (slice): confirmation decision = S5 block (EA:9643, IsConfirmationCandle 9623 -> S5; B60C print in ShadowConfirmPoll 2568 called 8387/8392); B60C then TP_ELECT/A6Fired (10961/11059) on every fired row (B-142 R1); EA zone-source decision FOUND with FVG path (buffers 24/25 read 6957/8874; FVG-preferred tiebreak; zoneSrc idiom `haveFvg?"FVG":haveXob?"XOB":"none"` at 9121; FVG-leg empty on kept runs per 9066 comment); FL_BUF map EA:172-209 + 2025-2066 (48/49 free); closed-bar pattern ReadFlow = CopyBuffer(shift+1) (1999-2071; settled slot describes evaluated bar per Task-20 comment).
- K4 one EA edit (+37/-0, purely additive): FL_BUF_B150_BULL 48 + FL_BUF_B150_BEAR 49 defines; ABORT_PROMO_RETURN_NONE define; S5 gate after div-decided (before NEXTOPEN/TP): read trade-direction value at confirmation barShift via ReadFlow, zoneSrc by EA idiom, print B150GATE (bar/side/value/src/forbar) every S5-div-passed confirmation; refuse XOB+0 via GoAbort (ABORT + A6REFUSED rows) + return. Every kept test byte-identical (B129). Compile once: 0 errors 0 warnings, binary fresh. Trial src 5A5BD1F0 / ex5 AFCEC04D; .B153K kept uncommitted. Diff raw in TEMP b153_ea_diff.txt (slice carries summary).

## Part T - runs (RECON62 first, then June)

- T1 RECON62-B153 (ini EURUSD written + read back; watcher + wrapper-kill + DONE 13:03:03): 563338 ticks, 3168 bars, 0:02:43, balance 10434.21. Filed-trade table vs DEALS_RECON62-B137: 14/14 identical side/date/time/price/volumes. No deal added. No STOP.
- T2 bar match: EU 7/7 B150GATE (value 1.0 src XOB forbar == candle = R1); June 5/5 (1.0/1.0/0.0/1.0/1.0, forbars equal). B-88 holds by construction (same settled slot the reading graded) and empirically. No mismatch.
- T3 JUNE0525-B153 (ini USDJPY written + read back; DONE 13:10:39): 740873 ticks, 4320 bars, 0:03:21, balance 10505.22. Filed-trade table vs DEALS_JUNE0525-B137: deals #6 (sell 4 Jun 09:55 159.868) and #7 (10:40 exit) ABSENT with PROMO_RETURN_NONE at the 09:50 confirmation quoted (B150GATE 2167157 value=0.0 src=XOB forbar 09:50; ABORT 2167158 + A6REFUSED 2167159 at the 09:55 pass); every other deal identical in side/date/time/price (deal# renumbered 6/7/8/9 by the tester); no new deal anywhere (freed 4 June London slot empty - the only other 4 June candidate, 11:00 SHORT Daily-VWAP, refused PROMO_RETURN_NONE at 2168220/2168221 and removes nothing). Volumes: pre-removal deals identical (1.08/3.75); post-removal 0.35 (was 0.34) + 5.69 (was 5.63) from the higher balance (avoided 4 June loss) - ACCOUNTED per B137-VOLUME-IS-NOT-A-TAKE, never a STOP. No other difference.
- T4 refusal census (B128): RECON62 zero PROMO rows. June two events: (1) 4 June 09:50-conf SHORT Daily-POC (ABORT+A6REFUSED+STAND-DOWN 2167158-60) - the ordered kill, removes tester-only C-06-04 (no register A/B row, no valid kept deal); (2) 4 June 11:00-conf SHORT Daily-VWAP (ABORT+A6REFUSED 2168220-21) - removes nothing (no kept deal, no register row; kept build also never fired it). No event removes a register A/B row or a kept valid deal. Listed, never wins.
- T5 ON PASS: B153K indicator (78D3BFB1/E0E98A3D) + B153K EA (5A5BD1F0/AFCEC04D) stay on disk as the new kept build (relay T5 names B152K - typo for this relay's B153K pair per 0.4/K4/X5). Verdict KEPT. New SHAs reported. F2b packs + INDEX_B153.md (tags add B152PR/B150GATE/PROMO_RETURN_NONE) + REPORT/SETUPS_RECON62-B153.csv (28 rows, 7 EXECUTED) + REPORT/SETUPS_JUNE0525-B153.csv (20 rows, 4 EXECUTED; C-06-04 REJECTED/NOT MET/PROMO_RETURN_NONE; 11:00 row register NONE) per Setup report (README + B153 addendum).

## Part X - records (grep-first, append once, verify count 1 each)

- X1 CONTEXT section 4 after B152-PRINT-PROVES-ITSELF: B153-NEW-SLOTS-START-CLEAN (verbatim). Count 1.
- X2 CONTEXT section 5: B-153 ClickUp Brain session line. Count 1.
- X3 HANDOFF section 3: B-153 line (verdict KEPT). Count 1.
- X4 ledger 1298, tag B153-KILL0604-CLEAN-STORE (R0 a-d, K1 diffs/compiles, K1c tables, R1-R3, K2-K4, T tables, census). "^1298." = 1.
- X5 register section C after B-152 NOTE (grep B-153 0): "- NOTE 2026-10-10 (B-153 KEPT, EA 5A5BD1F0C97F0B9F3F8357A3290EE17E720660278454DE7AC1C372B46184D2B2, indicator 78D3BFB1767AEC819A6C9A35B6342FEB199E606DEE762BD29A130CB620526938): 4 June 09:55 short refused at the 09:50 confirmation by PROMO_RETURN_NONE (no promoted live short XOB price came back to after promotion); known open fire CLOSED." Count 1.
- X6 pointer (35-line cap): latest B-153 KEPT; new kept pair SHAs; "KILL-0604 CLOSED KEPT B-153"; STOP-BASIS paused 3 of 6 kept; XOB-0604 CLOSED; O3 pending kept; goal open.

## Part F - file, push, reply

- F1 this result. F2 slice (R0 lines, K1 diffs, filed tables, R1 lines, R2 compact table, R3 cases, K3 spots, K4 diff summary, bar-match rows, census; under 600 lines). F2b row packs (6 week files + 2 DEALS + 26 day files + INDEX_B153 + 11 EXITS) + 2 B153 reports.
- F3 ledger 1298. F4 pointer.
- F5 stages result, slice, ledger, pointer, PLANNER_CONTEXT.md, PLANNER_HANDOFF.md, register, REPORT/ files (2 CSVs + README), row packs (F2b set). Never EA/indicator/includes/ex5/*.B150K/*.B152K/*.B153K/logs/inis/profiles/charts/backups/TEMP scripts.
- F6 branch re-check from disk, commit, push via backup, ls-remote check. Reply KEPT.

## Final disk state (KEPT turn; B153K pair is the new kept build on disk, verified, terminal idle)

- Indicator src 78D3BFB1 + ex5 E0E98A3D (B153K pair on disk = live). EA src 5A5BD1F0 + ex5 AFCEC04D (B153K EA on disk = live). OrderblockMgr 5D14FCE2 untouched. terminal.ini June window (as-run); Charts as-run; no terminal64. Old trial files .B150K/.B152K/.preB150/.preB152/.preB153 kept uncommitted. CONTEXT +2 lines; HANDOFF +1 line; ledger +1 item (1298); pointer rewritten; register +1 NOTE; REPORT/ 2 new CSVs + README addendum; ROWPACK/ 6 week + 2 DEALS + 26 day + INDEX + 11 EXITS new. No source/ex5 committed.

(No carried note - no question goes to him.)
