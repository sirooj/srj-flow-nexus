# BUILDER RESULT B-152 - K1c STOP: the self-proving print halted the indicator (array out of range), 0 deals; all restored

Trader summary: reading the old code first showed no leak - a touch can only be counted after promotion, on the zone's own number. So each zone was made to print its own proof: its range, its promotion candle, and the candle that came back to it. But that new print crashed the indicator partway through the first run - it asked for a candle by a number that wasn't on the chart - so the run finished with no trades at all, which proves nothing. Everything is restored byte-identical, and the 4 June short still fires on the kept build. The crash line and the reason it can happen are filed raw for the next relay. Nothing is asked.

## Relay order (B-152 KILL-0604 3 of 6: self-proving print, re-proof, then EA refusal)

- Part 0 on builder/B-151 at 41b3dabfd75c15f747316a416ebc4b105b5751d7 (backup ls-remote verified exact; builder/B-152 cut here). Branch fact after cut: HEAD builder/B-152 at 41b3dab; re-checked before commit below. Push via backup only.
- Skills loaded whole in order (relay, then strategy; .agents stub never opened).
- Reads: pointer; RESULT_B151 + SLICE_B151 (R1 lines, R2 table, R3, R4); RESULT_B150 + SLICE_B150 (K1 spots, K2 diff); RESULT_B147 R3 + SLICE_B147 R3; spec 1.2/3.5/3.5.1/3.6/9.9/10; register whole; DEALS packs (14 + 10); CONTEXT section 4 (B-88/B128/B129/B137/B142/B150/B151 lines).
- Names per 0.4 (kept EA 585093BF/AB159DE7, FlowLogic 956BF3E3/27B5F272, OrderblockMgr 5D14FCE2, B150K 0E9D5931/4156C29A). Trial B152K: src 83289B4E / ex5 8367027F (kept uncommitted). B150GATE/PROMO_RETURN_NONE never printed (K2-K4 never ran). .preB152 backups with SHAs. Stage-1b RECON62-B152S1 ran (crashed); JUNE0525-B152S1 never launched. Ledger 1297, tag B152-KILL0604-PRINT-PROVES. Lane KILL-0604 (first B-150, 3 of 6).
- Start gate: log-1 = 41b3dab; status 609 = 609 expected; committed-file diff vs 41b3dab EMPTY over every 0.3 file + ledger + skills + journal + register; disk SHAs all match 0.4; result-against-commit CONTEXT B151-VERDICT-NOT-IDS 1 + relay B-151 (kit PK-2) 1, HANDOFF - B-151: 1, ledger ^1296. 1, register B-151 STOP 1, pointer latest result B-151 1; pre-greps B152-PRINT-PROVES-ITSELF/B152PR/^1297. all 0. No STOP.
- Scope: R0 code read. K1 one edit to B150K copy (export + print only), one indicator compile, runs with EA untouched (second never launched - K1c STOP). Forbidden lines untouched (no XOB lifecycle/OrderblockMgr/buffer 0-47/input change; no date/price/symbol filter; no tolerance/distance/count; no question). Authority: his O1 KILL-FIRST (Orders 2026-10-10 (B-150); REFINEMENT-PHASE SCOPE). Legal results used: FOUND, NOT FOUND, SAME, DIFFERENT, MET, NOT MET, ACCOUNTED, STOP.

## Part B - banking

- No new rule words. Nothing appended.

## Part R0 - read the B150K export code (no edit; raw lines from B150K)

- Flag set (B150K:1473-1494): at loop bar i when barClosed, over g_orderblocks: skip null (1478), skip unpromoted (1480 `if(!b150ob.isPromoted)`), skip NA promotionBar (1481), skip i <= promotionBar (1482), skip NA zone (1483); on range overlap (1484) set g_b150Touched[objId]=true (1486-1491, grow +1024).
- Key: objId (1486/1489-1491), not array slot.
- (a) Touch at or before promotion: NOT FOUND - 1480 tests isPromoted at the touching candle and 1482 strictly excludes the promotion candle and everything before; isPromoted never cleared (only constructor false, Types.mqh:83); promotionBar stamped `= i` at both call sites (OrderblockMgr.mqh:894, :949).
- (b) Slot reuse across XOBs: NOT FOUND - keyed on identity; ids unique per run (Types.mqh:25-31); the only id restart (StateInit) runs in OnInit (:825, no flags yet) and the prevCalc==0 full-reset block (:988), which the flag reset covers (:1467-1472).
- (c) promotionBar time vs index: FOUND as bar index, like for like - long (Types.mqh:59), stamped `= i`, compared `(int)promotionBar` vs loop `i` (1482). Detail: 1481 SrjIsNa resolves to the double overload for long, so it is inert - harmless (1480 dominates), but any future code indexing by promotionBar must not rely on it.

## Part K1 - stage 1b indicator (EA untouched)

- K1a copies (*.preB152, SHAs): indicator src 956BF3E3 + ex5 27B5F272; EA src 585093BF + ex5 AB159DE7; terminal.ini AA4EA14B (20447 B); Charts tree 0 diffs. No terminal64 (0). B150K -> .B152K working copy byte-identical (0E9D5931 verified).
- K1b edit (export code + print only; R0 found no leak to correct): + `long g_b152cb[]` comeback-bar store (lockstep with flags, reset together); record bar i on flag transition; MET loop builds per-zone segments `id,dir,lo,hi,promoT,valid,cbT,cbH,cbL` (prices _Digits, times TIME_DATE|TIME_MINUTES); print renamed B150PR -> B152PR (`sym bar bull bear z=...`, `z=none` when empty). Buffers 48/49 unchanged in meaning; existing indices/inputs/lifecycle untouched. Diffs: vs B150K +28/-11; vs kept +106/-1 (the -1 is B-150's buffer-count line). Trial src 83289B4E. Compile once: 0 errors, 1 benign warning (long->int 1483:31, pre-existing cast shifted). Trial ex5 8367027F, binary fresh. .B152K src + .ex5.B152K kept uncommitted.
- K1c RECON62-B152S1 (ini EURUSD 1787702400/1788998400 written + read back; launch per srj-relay; watcher PID-verified + short DONE polls): PASSED 12:11:11 per wrapper (563338 ticks generated) BUT the indicator halted mid-run: `array out of range in 'SRJ_FlowLogic.mq5' (1520,36)` at tester bar 2026.08.27 19:55 (day-log line 667236), last B152PR 2026.08.27 19:45; 123574 B152PR rows only to 8/27; EA finished deal-less (0 deals vs 14 required; BIASCENSUS bars=527 vs 3168). Filed-trade table: EMPTY - DIFFERENT -> K1c STOP, restore. JUNE0525-B152S1 never launched.
- Crash forensics (raw): line 1520 col 36 = `time[b152cbB]` - the comeback-bar index was out of range. Paradox on file: flags and comeback bars are assigned as a pair (first-touch transition), yet the 8/27 heartbeat already showed bar-0 comebacks (e.g. 474/484/706 -> 2025.01.02 00:00 with non-overlapping 1.03514/1.03503) beside correct ones (305 -> 8/13 11:00 etc.). Paired assignment cannot produce flag-without-comeback; prime suspects: file-scope array desync across OnCalculate calls, or objId-slot mismatch on growth - mechanism UNKNOWN, named for the planner. Fix direction: store comeback primitive fields (time/h/l) at flag time, or verify the index before indexing. Stage-1b rows prove nothing (run invalid); R1/R2/R3 never graded.

## Part R - never graded (K1c STOP; no valid stage-1b rows)

## Part K2-K4 - never ran (K1c STOP)

## Part T - never ran (K1c STOP; T5 restore path taken, verdict RESTORED)

- T5 restore verified from *.preB152: indicator src 956BF3E3 + ex5 27B5F272; EA 585093BF/AB159DE7; OrderblockMgr 5D14FCE2 (never edited); terminal.ini AA4EA14B; Charts 0 diffs; no terminal64. Leftover PID 4456 stopped before grading. Trial .B152K (src 83289B4E/ex5 8367027F) + .preB152 kept uncommitted, never staged.

## Part X - records (grep-first, append once, verify count 1 each)

- X1 CONTEXT section 4 after B151-VERDICT-NOT-IDS: B152-PRINT-PROVES-ITSELF (verbatim). Count 1.
- X2 CONTEXT section 5: B-152 ClickUp Brain session line. Count 1.
- X3 HANDOFF section 3: B-152 line (verdict RESTORED). Count 1.
- X4 ledger 1297, tag B152-KILL0604-PRINT-PROVES (R0 a/b/c, K1 diffs/compile, K1c crash + restore; R/K2-K4/T never graded/ran). "^1297." = 1.
- X5 register section C after B-151 NOTE (grep B-152 0): "- NOTE 2026-10-10 (B-152 RESTORED): KILL-0604 K1c (B152PR halted the indicator, 0 deals); known open fire stands." Count 1.
- X6 pointer (35-line cap): latest B-152 RESTORED; SHAs restored; KILL-0604 first B-150 3 of 6; STOP-BASIS line kept; XOB-0604 line updated; O3 pending kept; goal open.

## Part F - file, push, reply

- F1 this result. F2 slice (R0 lines, K1 diffs, K1c crash + tables, restore; under 600 lines). F2b skipped (not KEPT). F3 ledger 1297. F4 pointer.
- F5 stages result, slice, ledger, pointer, PLANNER_CONTEXT.md, PLANNER_HANDOFF.md, register. Never EA/indicator/includes/ex5/*.B150K/*.B152K/logs/inis/profiles/charts/backups/TEMP scripts.
- F6 branch re-check from disk, commit, push via backup, ls-remote check. Reply RESTORED.

## Final disk state (RESTORED turn; B-137 kept build on disk, verified, terminal idle)

- Indicator src 956BF3E3 + ex5 27B5F272 (trial 8367027F + .B152K pair kept uncommitted; .preB152 kept). EA 585093BF/AB159DE7 never touched. OrderblockMgr 5D14FCE2 never touched. terminal.ini AA4EA14B; Charts 0/0; no terminal64. CONTEXT +2 lines; HANDOFF +1 line; ledger +1 item (1297); pointer rewritten; register +1 NOTE. Strategy/relay skills + journal untouched (Part B empty). REPORT/ untouched (no KEPT). No source/ex5 committed.

(No carried note - no question goes to him.)
