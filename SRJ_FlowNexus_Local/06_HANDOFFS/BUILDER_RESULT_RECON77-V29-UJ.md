# BUILDER RESULT RECON77-V29-UJ - DONE=PASSED, behavior-neutral PASS + lifecycle PROVEN (two accepted-wording corrections carried)

Run: RECON77-V29-UJ, DONE=PASSED 20:34:55 (journal `Test passed`, 0:48:09). Segment `06_HANDOFFS\RECON77-V29-UJ_JOURNAL.log` AABDBD53/6172800/32086 (542258 ticks / 2880 bars - same feed volume as RECON76). Binary proven: EA 977B0FB5/684499/12295 + ex5 451982B 12:39:13Z, both re-verified post-run, ex5 compiled post-repair from these exact bytes. Window proven by journal testing-line (`testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.06.01 00:00 to 2026.06.13 00:00`, 2x). VOID gates pass (bars=2880, PRE-SEND signals=2 same bars, takes=2 - not a 0/0 instrument void; test-stopped 0x).

## PASS A (got)

- Takes 2, row-identical to RECON76: 6/3 London LONG 09:10 159.932 TP 09:59 159.983 (tickets #2/#3) + 6/5 NY LONG 16:55 160.120 stopped 6/11 22:30 159.726 (tickets #4/#5). Balance 10027.13 identical. Full-tag census 77-vs-76 equal on every tag (ALERT 57, KILL 34, UJOPCONF 14, UJSBTELEM 214, UJRESEED 13, UJPOOLSTATE 11, PRE-SEND/TP/SL 2/1/1) except the designed delta: UJPROV 60 vs 0.
- Lifecycle PROVEN: 60 UJPROV rows, 10 distinct reseedBar values (9 real + 1970-unset); carry across passes (10:20 over 11 passes, 16:10 over 10 incl. overnight, 17:45 6/11 into 6/12); stale visible-by-design; admit-clear observed for the 6/5 take (8 unset passes 6/8 to 6/9 before the 6/9 10:05 reseed); 6/3 take clear unobservable (zero S2 passes 6/3 before the 6/4 reseed - the acceptance conditional). H1-expiry zero by two patterns (UJHOLDEXPIRE 0x + ABORT_HOLDER_EXPIRED 0x); the 3 EXPIRE hits are pre-existing SHADOW_EXPIRE session closes, not holder expiry.
- CORRECTION 1 (RECON76 prose, owned): its "6/5 TP_TOUCH 19:15" line is WITHDRAWN - both segments show the 6/5 position stopped 6/11 22:30 (rows quoted above, byte-identical across runs). Surviving conclusion unchanged: takes identical, behavior-neutral holds.
- CORRECTION 2 (acceptance wording, owned): "SET <=> UJRESEED 1:1 same-block" is corrected to survived-values - 7 same-block + 3 next-bar-carried + 3 churn-superseded-before-any-S2-pass (consistent with banked churn). All 10 surviving values observed; mechanism (set/carry/clear/stale) fully demonstrated.

## PASS B (should - his frame first, then EA rows)

- HIS 5 June London SHORT (register B1): owed entry 09:45 open 159.948 off Daily-POC, his rule 09:35 retest + 09:40 confirmation. EA unchanged (census-identical): 09:15 reseed then same-pass kill + 09:40 B_BODY refusal. Still missed, same rows as RECON76.
- HIS 11 June LONG (register B3): owed entry 14:40 open 160.524. Still missed, same rows (census-identical; 1-2pt margins + feed branch open, carried).
- HIS 5 June NY 16:15 (register B2): still no retest (detector gap carried).
- HIS "no improvement" CONFIRMED at take level (2 takes, B1-3 absent, register unchanged) and EXPECTED by design: this round is observation-only by construction (inserts + print, zero behavior), so takes could not move. The take-moving round is the v15 exemption, which needs this run's lifecycle proof + council ruling + a new key + his run word. No Hof improvement was ever on this run's acceptance.

## Grade vs register + vs RECON76

- Register: EU A1-7 untouched; UJ B1-3 all still missed (same bars); 8 June silent. NO-OVERFIT holds.
- vs RECON76: takes/balance/signals identical; novel evidence delivered (60 UJPROV rows, lifecycle join above). Behavior-neutral PASS.
- Next direction: v15 exemption packet via council route (CARRY evidence attached: values persist, clear on admit, stale visible). No build, no run, no key asked here. EU excluded.

(End of file - total 25 lines)
