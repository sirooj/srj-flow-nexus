---
name: srj-goal
description: Ultimate-goal guard for SRJ Flow Nexus. The EA must reproduce the operator's manual discretionary decisions, same trades same reasons. Load before planning any run, relay, packet, or diagnosis; blocks goal-blind work and spin without metric movement.
---

# srj-goal - the goal is the gate

Role: every block of work answers to the deployment bar first. Process wins (clean relays, green batteries, passing probes) are not goal wins. A month of iterations that moves no goal metric is spin, and this skill exists to stop it (ordered 2026-09-20 after RECON48 graded instrument-PASS with the goal still unmet).

## 1. The goal (his words, never paraphrased into softer shape)

- "The EA is working off SRJ Flow Logic but it is not up to my standard. I have a manual discretionary trading that I want to automate but the current EA does not take the same trades that I would take." (`00_CURRENT_WORKING\GOAL_STATEMENT.md` lines 4-6, recorded 2026-09-08)
- THE GOAL: the EA must reproduce the OPERATOR'S MANUAL DISCRETIONARY DECISIONS - the same trades, for the same reasons.
- THE DEPLOYMENT BAR (his Amendment 4, `GOAL_STATEMENT.md` lines 154-166): EVERY valid (TAKEN) trade in `OPERATOR_TRADE_JOURNAL.csv` must be reproduced by the EA, and no invalid/rejected setup may be signaled, before deployment is even considered. The Tier-1 window is a SAMPLE, not the goal. The work is the FULL-JOURNAL RECONCILIATION. Deployment stays OFF THE TABLE until the bar is met. ALERT-ONLY stands regardless.

## 2. The scoreboard (re-join after every run; every snapshot labels its date)

- Format per window: his TAKEN rows (date, session, direction, line, gain) vs tester takes (entry match? take? exit match?) plus his REJECTS (silent? alerted? taken?) plus misses plus falses plus unruled takes.
- Snapshot 2026-09-20, window 08-26 to 09-09 (RECON48, full join in ledger 468): entries 4/4 signaled; takes 3/4 (9/4 +0.84 winner signaled at his exact entry, refused on tester lot floor); exits differ once (8/28: his +0.10 vs tester stop, exit model unbuilt); 1 false take (9/8 16:45 declined, lost); 1 false alert (8/28 New York news bar, no take); 1 valid-setup miss (9/8 17:00 NODIR); 1 unruled take (9/8 London, no ruling on record).
- Snapshot 2026-09-20, window 08-26 to 09-09 (RECON50, result BUILDER_RESULT_RECON50-EXT1LIVE-V38.md 29FB9F11/19113/286): entries 4/4 signaled (unchanged); takes 4/4 (9/4 +0.84 now takes 0.56 lots, chain complete; RECON48 3/4 retired by RECON50); exits differ by RULE (8/28: his 11:35 body-break exit vs tester 10:45 touch exit; his break-retest rule of 2026-09-20 governs managed exits - touch/retest nothing post-entry, body-break flips bias; TP-touch scope open at council); false take 9/8 16:45 retired by RECON50 (killed: no signal, R 0.68, sel=2, slot91); false alert 8/28 New York news bar persists (A1 still signals and takes 1.29 lots under his kill-all decline; owner-override divergence, not EA defect); 9/8 17:00 ruled VALID on record (SEP8 manual review) and now signals (goal hit); 9/8 London 10:10 ruled VALID on record (SEP8 London ruling) and now takes (goal hit). Deployment bar UNMET (A1 reject taken, exit-engine touch-vs-break open at council, full-journal open).
- Honesty baseline from the spec (Part A v4.2 section 9.5): recall 1/12, precision 1/10, structural agreement 0/12. Never report a process PASS as goal progress.
- Snapshot 2026-09-22, window 08-26 to 09-09 (RECON52, result BUILDER_RESULT_RECON52-EXITMODEL2-V12.md 7A3FF988/9177/47): takes 1/7 - REGRESSION from RECON51 7/7. His four valid rows all blocked at the 1R floor by F1-nearest booking (8/28 London R 0.17, 9/4 New York R 0.99, 9/7 London R 0.62, 9/7 New York R 0.39; all machine-recomputed, census-proved; 8/28 New York never valid - A1 kill-all decline, corrected 2026-09-22); sole take 9/8 London tester-only (TP_TOUCH win R 1.94). Rejects silent. Miss mechanism diagnosed same block (nearest targets 2-26pts imply sub-1R; spec 3.7 + spec L297 abandon-quote + charter L28 jointly predict it). D1 correction same turn: no selectivity question is owed (floor KEEP per spec 3.7 + v141; valid set replicate-all per v141 + goal + journal 257/277/281/285; kill mechanism pre-diagnosed v142 L198) - withdrawn from the result file, reconciliation is builder/council design work. Correction 2026-09-22 (his word): journal 9/4 0.84 retired flawed (his day-close exit unimplemented); 9/4 exit reference TBD by day-close model; R boundary inclusive (flat 1.0 valid). Deployment bar UNMET.
- Snapshot 2026-09-22, window 08-26 to 09-09 (RECON53, result BUILDER_RESULT_RECON53-VALIDITY-V1.md DC1006D5/8638/41): takes 4 (was 1/7). HIT 9/4 New York entry (15:55 LONG R1.66; exit diverges: tester POI_BODY_BREAK 16:10 vs his day-close hold, TBD model) + 9/7 London (09:15 LONG R1.76 TP_TOUCH) + 9/8 London ruled site (10:10 SHORT R1.94 TP_TOUCH); MISS 8/28 London + 9/7 New York (both renewal-lost, zero take-cost - RECON52 had them floor-blocked) + 9/8 17:00 New York (floor R0.68); tester-only 9/4 10:40 SHORT Daily-POC (new via re-seed, hypothesized vs journal row 277, no question). Rejects silent. Deployment bar UNMET (full-journal open).

## 3. Action contract (every block moves a named metric)

- No run is requested unless it returns goal evidence no prior run did (entries, takes, exits, rejects on his rows), stated bar-for-bar in the relay. Instrument-only runs ride only as riders on a goal run, never alone.
- No relay goes out whose acceptance section grades only the instrument. Every acceptance grades his rows: which TAKEN rows reproduce, which REJECT rows stay silent, what moved since the last run.
- Diagnosis before halts: any miss, false, or mismatch found in a run is diagnosed read-only on the segment the SAME block (proximate death per spec section 9.4, mechanism with lines). A result that lists a miss without its cause is unfinished work, never a stopping point.
- Read-only diagnosis is always authorized (segments, journals, code reads, counts). It never needs a token and never waits for a word.
- Canonical edits still need council packets and tokens (AGENTS.md invariant 1, unchanged). This skill does not route around it: the action it demands inside authority is diagnosis plus a named, estimated next packet - never an unbuilt build.
- No question may contradict the deployment bar: any take-rate/floor/booking ask whose answer could shrink his valid set or move the kept 1R floor is D1 - re-read the strategy-skill settled pins (D1-V7) plus v141/v142 first; a question the pins answer is withdrawn, never asked. (2026-09-22 RECON52 lesson: the selectivity ask contradicted replicate-all plus KEEP.)

## 4. Halt conditions (stop only here)

- His-carrier boundaries only: strategy rules, money and goals, his transports, token run-words, record verdicts. (Standing no-friction order, unchanged.)
- Never halt on: a green battery, a filed result, a completed todo list, an unverified suspicion, or the end of a turn while goal work remains open.
- A block ends with: scoreboard re-joined, misses diagnosed or named-undiagnosable with the exact missing evidence, ledger plus pointer current. Anything less is spin.

## 5. Standing limits

- This skill never invents strategy, never edits canonical files, never retires his declines, never reschedules his windows. His rulings outrank every metric.
- Feed divergence bounds every external comparison (spec section 9.1): bias and divergence disagreements exclude feed before attributing to logic.
- Gains are entry plus exit discipline and only entry is built (spec section 9.2). Gain magnitudes never grade the entry pipeline. Recall and precision on his rows are the valid metrics.

## 6. Learning loop

- After every run: re-join the scoreboard, bank each new mismatch class with its bar and mechanism, retire fixed classes with the run ID that fixed them.
- After every operator correction: check whether these sections already covered it; if yes, cite the section in the report instead of adding text; if no, tighten here the same turn (D1-V6 pattern).
- This file is the goal memory: update it the turn the goal picture changes, never carry goal lessons in chat alone.
