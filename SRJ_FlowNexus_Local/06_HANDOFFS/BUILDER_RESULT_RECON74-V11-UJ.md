# BUILDER RESULT RECON74-V11-UJ (2026-09-29; v26 tree 8C6468F4 first run; DONE=PASSED 13:35:45, Test passed 0:45:29, 542258 ticks / 2880 bars, window 06-01 to 06-13 proven; binary re-verified 8C6468F4 at grade)

## PASS A (got: 4 admissions, run-wide count exact)

- T1 6/3 09:10 LONG 159.929 / 159.889 / 159.983 R1.35 wsrc=ASH: A-SL1 IDENTICAL (entry/bar/values + TP_TOUCH 09:55). PASS.
- T2 6/5 09:45 SHORT 159.948 / 159.972 / 159.900 R2.00 wsrc=LIVE: A-S2P venue TAKEN (B1/prebind route: BYPASS + PREBIND at 09:40-bar, fire 09:45; TP_TOUCH 12:15). First-ever 6/5 take. PASS (values grade-read per acceptance).
- T3 6/5 16:55 LONG 160.115 / 159.726 / 160.723 R1.56 wsrc=DH20260430: A-FB mechanism LATE (seed parked from 16:35, RETESTBOOK 16:45 hits=2, CONFIRMPOLL 16:50 confirm=1, S5 same pass, fire 16:50/admit 16:55; exit POI_BODY_BREAK 6/8). Same chain + same commissioned target, wrong bars: UJ-SIGNALBAR (not extra-venue).
- T4 6/8 09:35 SHORT 160.294 / 160.353 / 160.089 R3.47 wsrc=PML: tester-only FALSE (UJ-EXTRA). Mechanism: RETESTBOOK 09:25 hits=2 Weekly-POC dS, SEED Weekly-POC refused REJECT-BIAS-TIMING, yet S2PROMOTE_M15 fired on M15-align and the candidate ran S3-S5 to a TP_TOUCH 11:50 win. Promotion does not consume the seedbias verdict. Invalid winner: rejected per NO-OVERFIT, never progress.
- MISS 6/11 14:40 (A-POIV, UJ-NOADMIT): no LONG contender existed at the 14:40 pass (zero LONG CONFIRMPOLL rows 14:30-14:39; last LONG seed 11:05 CONSIDER, next 15:00). The SHORT holder correctly deferred (UJDEFERABORT 14:35) and aborted 14:40:22 on identity (S-a fires as designed); S-b correctly idle with no contender (YIELD 0x run-wide). Upstream defect, not a v26-fence defect: LONG seed-formation gap 11:05 to 15:00 despite RETESTBOOK 14:35 hits=2 dL. Owed diagnosis: why no LONG seed 14:20-14:35 (seedbias? invalidation? zone-gating?) - next packet material via council route.
- Run-wide: exactly 4 admissions (L-final count bound passes); UJALIGN_BYPASS 7x, CONFIRM_PREBIND 7x, UJDEFERABORT 23x, no STALE prints; C-silence holds (no register-invalid take on the UJ window).

## PASS B (should: register + goal ledger)

- UJ blind B1 (6/5 09:45 SHORT): TAKEN at the owed fill (09:45 open off 09:40 confirmation; register "owed 09:40 open" reads signal-bar, fill per his TIMING-N/N+1). First blind-venue take since the work began.
- UJ blind B2 (6/5 16:15 LONG): MISSED at bar, taken late (T3). Seed-persistence + late-retest mechanism named above.
- UJ blind B3 (6/11 14:40 LONG): MISSED (seed gap above).
- Blind score: 1/3 at bar + 1 late + 1 miss + 1 false. RECON72 stood 0/3 at bar (+6/3 preserve). Goal displacement: +1 venue (B1), mechanism-proven (BYPASS+PREBIND rows on the 09:40-bar, S5 same pass).
- EU register untouched (this run proves UJ venues only; EU battery needs its own run).
- No selectivity question is owed (valid losers taken-or-missed by mechanism, invalid winner rejected; floor intact; replicate-all stands).
- Deployment bar UNMET (full-journal open; D-design future; seed-formation + promotion-bias gaps named for council).

## 6/5 venue route proof (death-row flips, all on-segment)

- Z-venue: UJLTFHOLD CARVE + BYPASS rows at the 09:40-bar (death-row flip on the absent verdict); promotions 09:05 + 09:30 retained; UJALIGN_NOMATCH absent on the confirmed pass; fire 09:45 entry 159.948.
- S-venue: SUPPRESSED/HELD every pass by SHORT S4 squatter (14:20-14:35); SHORT holder ABORT 14:40:22 (UImDeferApply on identity); no YIELD (no contender); LONG seeds 11:05/15:00 only.
- Q2-venue: UJDTTERMS rows present 16:05/16:10 + 16:45/16:50 (term census, never predicates); TPFALLBACK + UJHISTPOOL DH20260430 present; no admission at 16:15 (detector question answered by the late completion, mechanism second).

## Record

- Segment 06_HANDOFFS\RECON74-V11-UJ_JOURNAL.log (7.3MB, DONE=PASSED); binary proof re-verified at grade (8C6468F4 - run graded, never attributed by lineage).
- His "success" call CONFIRMED on disk (correct window, Test passed, DONE marker; balance 10711.87 vs RECON72 10118.27 on identical tick volume).
- Next: EU August sibling run (his word banked; needs its own Luna key scope - memo ships, no build); seed-formation + promotion-bias packets via council route.

(End of file)
