# BUILDER RESULT B-114 - June scoped coverage across audited cases, JUNE-SCOPED-EVIDENCE-COVERAGE-COMPLETE, MEASURED

Trader summary: your June record holds more than the three cases we started with, so this relay pulled every other audited June candle from the proven payload. The touch picture is now wider but still bounded: your valid 3 June take touches two of its zones like the 5 June retest does, while your valid 11 June retest touches none — same as every EU take. Touch repetition across your valid cases is therefore not proven, and nothing here generalizes or builds a gate.

## Relay order (B-114, read-only June coverage review)

- Part 0 fresh start on builder/B-113 at 3c8a10174d9d0c151856e1e9fa794b570bc75400, both skills loaded whole first.
- Part B banking (no new rule words). Part R coverage review (R1 cases, R2 table, R3 lifecycle, R4 matrix, R5 pattern, R6 authority, R7 readiness, R8 decision). Part X records (ledger 1259). Part F file + push builder/B-114 via backup.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67-line SKILL.md, known whole, untouched). Strategy skill loaded whole second (64 KB; consulted by prior greps on identical bytes, never edited).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-113` = `3c8a10174d9d0c151856e1e9fa794b570bc75400` (verified exact). Cut `builder/B-114` from it. Push via `backup`, never `origin`.
- 0.3 Read in order on `builder/B-113`: pointer (20 lines); RESULT_B113 head (88-line file, authored prior turn, unchanged); SLICE_B113 head (64-line file, authored prior turn, unchanged); RESULT_B112 head (81-line file, unchanged); RESULT_B111 head (64-line file: recompute + EU comparison, unchanged); RESULT_B110 head (68-line file: implementation + validation, unchanged); RESULT_B107 section (74-line file: separator + thin margin, unchanged); RESULT_B106 T-section (89-line file: recovery + classification, unchanged); PLANNER_CONTEXT section-4 tail (142-line file, B-113 lesson present); PLANNER_HANDOFF section-3 tail (82-line file, B-113 line present); relay SKILL.md whole; strategy SKILL.md whole (s178/B-70/B-91/JUN05NY/0605LDN word-lines re-verified by prior greps on identical bytes); spec v4.2 (35807 B, identical bytes, §§3.5/3.5.1/3.6/10 carried); register (11072 B, identical bytes: B rows 1-3, C rows incl. 3 June London LONG VALID-taken + 5 June London NOT VALID + 2/4/10 June rulings); `XOBPAYLOAD_JUNE.csv` confirmed present (150503937 B, header verified); `XOBDIAG_JUNE_TARGETS.csv` confirmed (126888 B, header + first row verified).
- 0.4 Names per relay: payload `XOBPAYLOAD_JUNE.csv` (SHA `63d5ddc4...` carried); target rows `XOBDIAG_JUNE_TARGETS.csv`; prior `RUNTIME-HANDOFF-DIAGNOSTIC-READY-LIVE-GATE-NOT-AUTHORIZED` item `1258`; this tag `B114-JUNE-SCOPED-COVERAGE`, item `1259`; kept EA `137076D9CF85` / EX5 `FA4C924978F6`; verdict MEASURED.
- 0.5 Start gate: `git log -1` = `3c8a101 B-113 runtime handoff boundary for scoped XOB diagnostic (relay B-113)` (verified head). `git diff 3c8a10174d9d0c151856e1e9fa794b570bc75400 --` EMPTY (every committed file named). `git status --short` = 440 lines (prior artifacts + B110-B113 files/scripts, preserved untouched). Kept EA disk `137076d9...` (LF-only, normalized identical) / EX5 `fa4c924978f6...` (prefixes match). Payload + target artifacts present (no NOT FOUND; no regen; fallback unneeded). No terminal64 launched, no compile, no tester run (read-only turn). No STOP.
- 0.6 Scope: read-only June coverage review + text records only.

## Part B - banking

- B1 The current operator message contains the B-114 relay order only; it carries no new trading-rule words. Record `no new rule words`; appended nothing.

## Part R - June scoped coverage review

- R1 Audited June cases identified from the register (no invented cases; adjacent candles never merged; exact payload epochs verified against the B-101 anchor 1779373200@05-21-14:20):
  - 2 June NY 14:20 LONG, ruled out (register C row 310 + s178 words; epoch 1780410000 = 06-02 14:20 UTC exact) - INCLUDED (B106/B107 classified).
  - 3 June London 09:00 LONG, VALID-taken (register C: blind-window entry 09:10 open 159.929, his 4-valid word; epoch 1780477200 = 06-03 09:00 UTC exact = B101 C3, 139 rows) - INCLUDED (direction LONG from register; relay's "New York" label corrected to the audited London session).
  - 4 June London 09:10 + 09:55 SHORT, ruled out (register C row 314 + B-70 veto + row 13; epochs 1780564200/1780566900 exact) - INCLUDED (B106/B107 classified).
  - 5 June NY 16:00 LONG valid retest (register B row 2 + JUN05NY words; epoch 1780675200 exact) - INCLUDED; 16:10 confirmation + 16:15 entry stay lifecycle context only (B107).
  - 5 June London 09:45 SHORT, NOT VALID (register B row 1 + line 47, 0605LDN-SHORT-NOT-VALID; message-C structure 09:35 retest + 09:40 confirmation + 09:45 open; epoch 1780652700 = 06-05 09:45 UTC exact = B101 B1, 137 rows) - INCLUDED as ruled-out class; candle role is entry-open context (the retest candles 09:35/09:40 were never extracted), reported as such, never as a retest.
  - 9 June NY: UNKNOWN - no register case provides it (record-first search of register/skill/journal finds no 9 June row); outside the comparison.
  - 10 June London 09:00: UNKNOWN - no register case provides it (only 10 June NY 16:10 INVALID exists; F4 ~15:30 is not an audited case candle and is excluded, never substituted).
  - 11 June NY 14:05 + 14:30 LONG, valid/owed (register B row 3: entry owed 14:40 open; retests at 14:20/14:25/14:30/14:35 + his 14:35 retest+confirmation rule; epochs 1781186700 = 06-11 14:05 + 1781188200 = 06-11 14:30 UTC exact = B101 B3a 160 / B3b 159 rows) - INCLUDED; B3b 14:30 is a named retest eval bar, B3a 14:05 is earlier context (not a named retest bar), reported as such.
- R2 Case table (B113 raw test exactly: promoted=1 + promoT present + promoT <= candle + valid=1 + direction match + range-intersect touch + non-touch preserved; no selected-only, no substitution, no bias aging, no kill relabeling; OHLC per B105 UJBARMAP for the six prior candles + newly pulled 09:00/09:45/14:05/14:30 bars, values identical across runs):

| case | pair | session | counted candle | direction | total XOB rows | relevant-valid rows | trade-direction rows | touch rows | non-touch rows | payload/source provenance | ruling status |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 2 June ruled out | USDJPY | NY | 06-02 14:20 | LONG | 123 | 30 | 30 | 0 | 30 | build 21:25:54 / payload 22:20:47, INC | ruled out (s178 + row 310) |
| 3 June valid-taken | USDJPY | LDN | 06-03 09:00 | LONG | 139 | 36 | 36 | 2 (ids 2928/2930 B) | 34 | same | VALID-taken (4-valid word) |
| 4 June ruled out | USDJPY | LDN | 06-04 09:10 | SHORT | 139 | 34 | 3 | 0 | 3 | same | ruled out (B-70 + rows 314/13) |
| 4 June ruled out | USDJPY | LDN | 06-04 09:55 | SHORT | 130 | 34 | 3 | 0 | 3 | same | ruled out (same) |
| 5 June London NOT VALID | USDJPY | LDN | 06-05 09:45 | SHORT | 137 | 36 | 3 | 0 | 3 | same | NOT VALID (0605LDN; entry-open context, not a retest) |
| 5 June valid | USDJPY | NY | 06-05 16:00 | LONG | 122 | 32 | 32 | 2 (ids 3150/3308 B) | 30 | same | valid path (B + JUN05NY) |
| 5 June context | USDJPY | NY | 06-05 16:10 | LONG | 123 | 32 | 32 | 0 | 32 | same | confirmation context only |
| 5 June context | USDJPY | NY | 06-05 16:15 | LONG | 123 | 32 | 32 | 0 | 32 | same | entry-open context only |
| 11 June context | USDJPY | NY | 06-11 14:05 | LONG | 160 | 44 | 42 | 0 | 42 | same | earlier context (not a named retest bar) |
| 11 June valid/owed | USDJPY | NY | 06-11 14:30 | LONG | 159 | 44 | 42 | 0 | 42 | same | valid/owed (B row 3; retest eval bar) |

New-candle OHLC (UJBARMAP day-log, values identical across runs): 06-03 09:00 159.927/159.927/159.905/159.910 (= register 09:10-entry neighborhood); 06-05 09:45 159.948/159.951/159.938/159.944 (= register 09:45 open 159.948, corroborates entry-open role); 06-11 14:05 160.515/160.534/160.514/160.527; 06-11 14:30 160.525/160.528/160.507/160.522. Touch rows row-verified: C3 ids 2928 (zone 159.912-159.894, promoT 1780476600) + 2930 (159.913-159.906, promoT = candle), both B relevant-valid, genuine intersections; B3b zero-touch independently rechecked (2 zones above + 42 below the 160.507-160.528 range, 0 intersecting - measured, not a script bug, same method as B104-A1).
- R3 Lifecycle roles kept separate (observed): counted retests (06-02 14:20, 06-03 09:00 per relay assertion beside entry-09:10-open wording, 06-04 09:10, 06-05 16:00, 06-11 14:30 as named retest eval bar) are the primary evidence points; 16:10 confirmation + 16:15/09:45 entry-opens + 14:05 earlier bar stay context, never replacement retests and never selection evidence; no later candle rewrites any retest; 5m bias flips never age validity (observed - no flip used anywhere in R2).
- R4 Coverage matrix (audited ruling = label source; XOB payload alone labels nothing valid/invalid):

| case | audited ruling | counted-candle evidence | trade-direction relevance | touch evidence | non-touch evidence | scoped label |
|---|---|---|---|---|---|---|
| 2 June 14:20 | ruled out | 123 rows, build 21:25:54 | 30 LONG relV | 0 touch | 30 non-touch | TOUCH-EVIDENCE-ABSENT |
| 3 June 09:00 | VALID-taken | 139 rows, same build | 36 LONG relV | 2 touch (2928/2930) | 34 non-touch | TOUCH-EVIDENCE-PRESENT |
| 4 June 09:10 | ruled out | 139 rows, same build | 3 SHORT relV | 0 touch | 3 non-touch | TOUCH-EVIDENCE-ABSENT |
| 4 June 09:55 | ruled out | 130 rows, same build | 3 SHORT relV | 0 touch | 3 non-touch | TOUCH-EVIDENCE-ABSENT |
| 5 June London 09:45 | NOT VALID | 137 rows, same build | 3 SHORT relV | 0 touch | 3 non-touch | TOUCH-EVIDENCE-ABSENT (entry-open context) |
| 5 June 16:00 | valid | 122 rows, same build | 32 LONG relV | 2 touch (3150/3308) | 30 non-touch | TOUCH-EVIDENCE-PRESENT |
| 11 June 14:30 | valid/owed | 159 rows, same build | 42 LONG relV | 0 touch | 42 non-touch | TOUCH-EVIDENCE-ABSENT |
| 9 June | UNKNOWN (no case) | NOT-IN-POPULATION | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |
| 10 June London 09:00 | UNKNOWN (no case) | NOT-IN-POPULATION (F4 excluded) | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |

- R5 June-only pattern matrix (5 June touch called repeatable only with same-label company; it has C3's company but not B3b's):

| reading | 5 June valid | all other known June valid cases | June ruled-out cases | unknown cases | result |
|---|---|---|---|---|---|
| TRADE-DIRECTION-RELEVANT | MET (32) | MET (C3 36, B3b 42) | MET (30, 3, 3, 3) | UNKNOWN (9JUN, 10JUN-LDN) | REPEATS-WITHIN-JUNE (fires on every class - precondition only, never a comparator; B107 non-separation carried) |
| TRADE-DIRECTION-TOUCH-AT-COUNTED-RETEST | MET (2) | PRESENT (C3 2) / ABSENT (B3b 0) | ABSENT (0/0/0/0: 2JUN, 4JUNx2, 5JUN-LDN) | UNKNOWN (9JUN, 10JUN-LDN, B3a-context) | DOES-NOT-REPEAT-WITHIN-JUNE (touch recurs at C3 but not at the valid 11 June retest bar - not uniform, so not repeatable) |
| TRADE-DIRECTION-NONTOUCH-AT-COUNTED-RETEST | MET (30) | MET (C3 34, B3b 44) | MET (all ruled-out) | UNKNOWN | REPEATS-WITHIN-JUNE (same precondition caveat) |

- R6 Authority boundaries (confirmed, no new words): 2/4 June words DIRECTLY-AUTHORIZED as case evidence only (conversion to universal prohibition refused); §3.6 + §10 DIRECTLY-AUTHORIZED (touching and non-touching both permitted; touch never required); B-91 one condition DIRECTLY-AUTHORIZED (split reopen refused); June lends no universal rule (C3-present + B3b-absent forbid it); EU stays out of the June result (populations separate per B112); production gate NOT-AUTHORIZED; project goal incomplete (observed, never claimed).
- R7 Readiness: June payload coverage READY-DIAGNOSTIC-ONLY (every requested candle present: 2JUN, 3JUN, 4JUNx2, 5JUN-LDN, 5JUN-NY + contexts, 11JUNx2); all audited June valid cases covered FOUND (3 June, 5 June NY retest + contexts, 11 June retest + context); June touch repetition NOT PROVEN (PRESENT at 5JUN1600 + C3, ABSENT at valid B3b - uniform repeatability fails); EU generalization NOT-AUTHORIZED; live EA gate NOT-AUTHORIZED; source edit NOT-AUTHORIZED.
- R8 Exactly one: `JUNE-SCOPED-EVIDENCE-COVERAGE-COMPLETE` - every known audited June case with an exact payload candle is reviewed (2JUN, 3JUN, 4JUNx2, 5JUN-LDN, 5JUN-NY + contexts, 11JUNx2) with unknowns (9JUN, 10JUN-LDN) explicitly listed. Evidence-coverage result only; authorizes no source edit, compile, run or gate.

## Part X - records

- X1 `PLANNER_CONTEXT.md` section 4 grep `B-114-JUNE-SCOPED-COVERAGE` = 0 -> appended exactly one lesson (verified 1). No duplicate.
- X2 `PLANNER_HANDOFF.md` section 3 grep `B-114` = 0 -> appended `- B-114: reviewed scoped XOB touch coverage across known audited June cases; no source edit, gate or trade grade was performed.` (verified 1). No duplicate.
- X3 Ledger grep `B114-JUNE-SCOPED-COVERAGE` = 0 and `^1259.` = 0 -> appended item `1259` (included cases, payload coverage, classification matrix, pattern result, authority boundaries, R8, no edit/compile/run/gate/grade). `^1258.` = 1 beside. No duplicate.
- X4 Pointer 20 -> 20 lines (cap 35): latest B-114 MEASURED, COMPLETE decision, kept EA/EX5 unchanged, no compile or runs, no gate and no project-complete claim, next follows R8 (coverage complete; lane continues evidence-only).

## Part F - file, push, reply

- F1 this result. F2 slice `BUILDER_SLICE_B114.md` (raw artifact checks, case coverage rows, classification matrix, pattern matrix, before/after lines; under 600 lines; no source diff, no run tables). F3 ledger 1259. F4 pointer per X4. F5 stages only the 6 relay files. F6 commit + push `builder/B-114` via `backup` + ls-remote check. Reply MEASURED.

## Final disk state (MEASURED turn; kept RKD build on disk, uncommitted)

- EA `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (695359 B, LF-only, verified-kept; never edited this turn) + all prior `.preB*`/`.B*` copies kept uncommitted. EX5 `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (verified-kept). Indicator src/ex5 at gate SHAs, untouched. No compile, no launch, no tester run, no terminal/config/chart modification (no analysis script file was written this turn; all classification ran in ephemeral commands). Strategy skill, journal CSV, register, spec untouched (all read-only; prior greps on identical bytes). No edit stands beyond the relay's text records.

No carried note (no STOP; nothing to ask him).
