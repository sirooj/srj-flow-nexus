# BUILDER RESULT B-151 - STOP: extra id 2510 flagged with no post-promotion touch on kept rows; nothing applied, all kept

Trader summary: your rule held on outcomes, 12 for 12 - every valid take has a zone price came back to after promotion, the 4 June short has none, on the kept build's own replay. But when every extra zone was accounted one by one, six zones the replay names have no comeback to them anywhere on the kept rows - the clearest is a 29 May zone, 55 pips under the 3 June entry, never touched again after its promotion, yet flagged. So the zone lists cannot be trusted to encode your rule, the EA trial never starts, and nothing on disk changed at all. The 4 June short still fires on the kept build. Nothing is asked.

## Relay order (B-151 KILL-0604 2 of 6: verdicts, not lists; then the EA refusal)

- Part 0 on builder/B-150 at 213edc1eb6d3c2137f0335830b97b77ff956908e (backup ls-remote verified exact; builder/B-151 cut here). Branch fact after cut: HEAD builder/B-151 at 213edc1; re-checked before commit below. Push via backup only.
- Skills loaded whole in order (relay, then strategy; .agents stub never opened).
- Reads: pointer; RESULT_B150 + SLICE_B150 (K1 spots, K2 diff, K4 table, K3 tables); RESULT_B147 R3 + SLICE_B147 R3 (MACH ids, method); RESULT_B142 R1 (B60C then TP_ELECT on every fired row); spec 1.2/3.5/3.5.1/3.6/6/9.9/10; register whole; DEALS packs (14 + 10); README + SETUPS_JUNE0525-B137 (20 lines, C-06-04 row verified); CONTEXT section 4 (B-88/B128/B129/B137/B142/B144/B145/B148/B150 lines).
- Names per 0.4 (kept EA 585093BF/AB159DE7, FlowLogic 956BF3E3/27B5F272, OrderblockMgr 5D14FCE2, B150K 0E9D5931/4156C29A, 20261010.log S1 rows, B150GATE/PROMO_RETURN_NONE never printed, .preB151 never created, B151 runs never launched). Ledger 1296, tag B151-KILL0604-PROMORETURN-TRIAL. Lane KILL-0604 (first B-150, 2 of 6).
- Start gate: log-1 = 213edc1; status 609 (594 expected; +15 B-150 run artifacts, all uncommitted; committed-file diff vs 213edc1 measured 0 lines over every 0.3 file + ledger + skills + journal + register + DEALS + REPORT R0 files); disk SHAs all match 0.4 incl .B150K pair (never rebuilt from memory); result-against-commit CONTEXT B150-KILL-BY-HIS-RULE 1 + B150-STOPBASIS-HIS-SWINGS-FIRST 1 + relay B-150 (kit PK-2) 1, HANDOFF - B-150: 1, ledger ^1295. 1, register B-150 RESTORED 1, strategy KILL-FIRST 2 (one section, O1 + amended point, accounted B-150), relay Setup report 1, pointer latest result B-150 1; pre-greps B151-VERDICT-NOT-IDS/B150GATE/PROMO_RETURN_NONE/^1296. all 0. No STOP.
- Scope: Part R read-only on existing 20261010.log rows (no stage-1 rerun). Part K gated on R1+R2 (R2 failed -> never ran). Authority: his O1 KILL-FIRST (Orders 2026-10-10 (B-150); REFINEMENT-PHASE SCOPE). Legal results used: FOUND, NOT FOUND, SAME, DIFFERENT, MET, NOT MET, STOP.

## Part B - banking

- No new rule words. Nothing appended (verified by the 0.5 pre-greps).

## Part R - re-proof on verdicts, ids accounted (read-only)

- R1 verdict gate (B-147 R3 separator), B150PR rows re-confirmed present in Tester/logs/20261010.log (file:line), trade-direction verdict: A1 bear=1 MET (290363); A2 bull=1 MET (305459); A3 bull=1 MET (321027); A4 bull=1 MET (324334); A5 bull=1 MET (327286); A6 bear=1 MET (329484); A7 bear=1 MET (332020); B2 bull=1 MET (495434); B3 bull=1 MET (516345); C-06-03 bull=1 MET (484929); C-06-04 bear=0 NOT MET none (490911); C-05-27 bull=1 beside (460364). 12/12 as required. R1 PASSES (full rows in slice).
- R2 extra ids (B150PR present, B-147 R3 absent), all 27 FOUND in XOBDIAG incrementals (EU 12/12, UJ 15/15 + 2566): direction, formation (startT/createT), promotion (promoT), alive at C (valid=1 active=1 promoted=1 invalT=NA at barT C-1 for every id, kill level quoted) - table in slice. First post-promo touch o/h/l/c from kept UJBARMAP rows (same-run segments; EU 3168/3168 window bars, UJ 4320/4320 - complete coverage): NONE quotable for any extra. Twenty promos pre-date row coverage (May 8-14, Aug 13-24). Seven are in-coverage and checkable - all six tested prove absent (3491: 838 bars 0 hits; 2281: 479 bars 0 hits; 2706: 572 bars 0 hits; 2149: 41 bars 0 hits, corroborated by B-142 INPLAYCOMMIT hits=0; 3834: 248 bars, min low 160.425 vs zone hi 160.420; 2510: post-promo min low 159.181 vs zone hi 159.180, while 64 pre-promo overlaps exist). 2510 is the named instance: zone 159.141-159.180 promo 2026.05.29 19:10, flagged at C-06-03, yet no kept row after promotion ever enters the zone. Under the artifact mapping it is NOT a real post-promotion touch of a live, promoted XOB -> defect in the export per R2 rule: STOP before Part K. Alternative reading recorded for the planner: live numbering may diverge from the Oct-8 diagnostic numbering (live flags real under live numbering; B-147's 3052-class matches vs 2510-class mismatch undecidable offline - the export prints no live zone/promo per id). Either way the lists cannot encode his rule.
- R3 C-06-03 id 2566: FOUND (touch-bound): artifact zone 159.382-159.407 promo 2026.06.01 03:15, valid=1 active=1 promoted=1 @barT 09:00 level 159.3945 (alive, not the issue); kept UJBARMAP rows show no overlap after promotion through 09:05 (nor at entry bar 09:10 per B-150 col-2 pull). B-147's touch row is not reproducible on kept evidence. Does not gate: C-06-03 stays MET on 8 other ids.
- R4 window fact: B150PR rows run 2025.01.02 00:10 -> 2026.09.09 23:50 (RECON62-S1) and 2025.01.02 00:10 -> 2026.06.12 23:50 (JUNE-S1): the live replay reaches back ~20 months; B-147's scans used 2796 EU + 3920 UJ in-window log bars only. The replay side saw more history on every row.

## Part K - never ran (R2 STOP; gated on R1+R2)

- K0/K1/K2/K3/K4: not executed. No .preB151 created, no indicator copy, no EA edit, no compile, no launch, no terminal64 (count 0). SHA sanity (nothing applied): EA 585093BF/AB159DE7, FlowLogic 956BF3E3/27B5F272, OrderblockMgr 5D14FCE2 - all match 0.4.

## Part T - never ran (R2 STOP)

- T1/T2/T3/T4/T5: not executed. No filed-trade tables, no bar match, no refusal census. The freed-4-June-slot question is untested.

## Part X - records (grep-first, append once, verify count 1 each)

- X1 CONTEXT section 4 after B150-STOPBASIS-HIS-SWINGS-FIRST: B151-VERDICT-NOT-IDS (verbatim). Count 1.
- X2 CONTEXT section 5: B-151 ClickUp Brain session line. Count 1.
- X3 HANDOFF section 3: B-151 line (verdict STOP). Count 1.
- X4 ledger 1296, tag B151-KILL0604-PROMORETURN-TRIAL (R1-R4 with rows, K/T never ran). "^1296." = 1.
- X5 register section C after B-150 NOTE (grep B-151 0): "- NOTE 2026-10-10 (B-151 STOP): KILL-0604 trial R2 (2510-class extras lack any post-promo touch on kept rows); known open fire stands." Count 1.
- X6 pointer (35-line cap): latest B-151 STOP; SHAs unchanged kept; KILL-0604 first B-150 2 of 6; STOP-BASIS line kept; XOB-0604 line updated; O3 pending kept; goal open.

## Part F - file, push, reply

- F1 this result. F2 slice (R1 lines, R2 table, R3 rows, R4 fact, SHA sanity; under 600 lines). F2b skipped (not KEPT). F3 ledger 1296. F4 pointer.
- F5 stages result, slice, ledger, pointer, PLANNER_CONTEXT.md, PLANNER_HANDOFF.md, register. Never EA/indicator/includes/ex5/*.B150K/logs/inis/profiles/charts/backups/TEMP scripts.
- F6 branch re-check from disk, commit, push via backup, ls-remote check. Reply STOP.

## Final disk state (STOP turn; B-137 kept build on disk, verified, terminal idle; nothing applied)

- Indicator src 956BF3E3 + ex5 27B5F272. EA 585093BF/AB159DE7. OrderblockMgr 5D14FCE2. terminal.ini AA4EA14B (June window, B-150 restore state); Charts as restored B-150; no terminal64. .B150K pair + .preB150 kept uncommitted (B-150). B-151 added no files to disk except TEMP scripts (uncommitted) and the staged records. CONTEXT +2 lines (X1+X2); HANDOFF +1 line; ledger +1 item (1296); pointer rewritten; register +1 NOTE. No source/ex5 committed.

(No carried note - no question goes to him.)
