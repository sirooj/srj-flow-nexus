# V397 council grade - packet P-RECON78-UJ-EXEC-1 v9

Date: 2026-10-03
Relay: `BUILDER_RELAY_COUNCIL_v397-UJ-EXEC-7.md`, SHA-256 `B26ADC8AE2F8734B3183277A2C2E30BD2BB61E41F51A7C0C32CF6DEF4867BF90` (177929 bytes / 2046 physical lines)
Packet: `PACKET_P-RECON78-UJ-EXEC-1v9.md`, SHA-256 `382DBB9913FC8477CBA5B0D51766319CD7FB743E5EF2F8AC2B6702ED30BA78E9` (159863 bytes / 2014 physical lines)

## Intake and authority

The operator supplied a complete V397 reply from each required seat. Sonnet is filed whole in `BUILDER_VERDICTS_SONNET.md` under V397-UJ-EXEC-7 OPEN/END; inbound SHA-256 `3CC7A650BED55B4E290C56B2E2D66DED35EB7201771706044787A80EB337CB26` (17695 bytes / 182 lines). GLM is filed whole in `BUILDER_VERDICTS_GLM.md` under the same OPEN/END marker pair; inbound SHA-256 `F788A07DAF68B78D4D2EF6A713FE38F0994745FBF9F85B3E1FF65BE579D4C49A` (30413 bytes / 80 lines). Each filed payload was byte-compared with its supplied attachment; correct-file OPEN/END counts are 1/1 and the other seat marker is absent. These hashes bind attachment-to-file intake, not the council platform's source messages.

Both seats treat the June 11 New York USDJPY 14:35 Daily-POC LONG retest+confirmation and 14:40 open 160.524 as settled operator rulings. Both keep Q2 closed. Neither authorizes an EA edit, build, tester run, key, live action, commit, or push. No external message was sent.

## Tallies

| Question | Sonnet | GLM | Grade under `srj-council` §47 TIE-FIXED |
| --- | --- | --- | --- |
| Q1 - broker TP revisions and day-close regression | DISCREPANCY | CONFIRM with Q1-C1 through Q1-C12 | CONDITIONAL-CONFIRM; GLM conditions bind and Sonnet X1/C1-C10 remain to disposition in the implementation packet |
| Q3 - June 11 valid LONG and same-pass release | DISCREPANCY | CONFIRM with Q3-C1 through Q3-C11 | CONDITIONAL-CONFIRM; GLM conditions bind and Sonnet X1/C1-C13 remain to disposition in the implementation packet |
| Q2 - June 5 NY 16:15 refusal | Not re-reviewed; kept closed | Kept closed | Closed, no new tally |

The two questions are graded separately. YES plus DISCREPANCY maps to CONDITIONAL-CONFIRM under §47. This is not an unconditional two-seat confirm and grants no edit, build, run, or deployment authority. It does not reopen Q2.

## Day-close fact and regression finding

The user's correction is adopted: the day-close behavior fired during the prior EU test. The cited RECON57 result independently records a real 4 September EURUSD position reaching DAY_CLOSE at 23:55, one live DAY_CLOSE event with a real position behind it, and a match to the prior modeled exit at 1.16093 (`BUILDER_RESULT_RECON57-DEMOGUARD-V1.md`, lines 41-44, 78, 94-96; packet v9 P1984, P1988-P1989). This makes the June 5 defect a regression of previously firing behavior, not a proposed new rule. The current defect mechanism is separately source-supported: model TP_TOUCH sets `MT_CLOSED` while the broker position remains open; the later EA 11846 state gate then suppresses further management. Sonnet's narrower evidence reservation remains for exact acceptance: the cited result does not publish the closing deal ticket, volume, or `DEAL_REASON`, nor fully establish the relationship between EA tree 98F6BBAC and RECON78 tree E80FF0C2. The implementation packet must not weaken the regression fact; it must supply the deal/build evidence where available and keep future acceptance exact.

## Q1 - binding implementation-packet conditions

The shared direction is accepted: a model exit cannot retire management of a still-open broker position; every eligible nearer closed-session target is synchronized per instance; model touch, broker synchronization, and actual broker exit remain distinct; and the previously working universal day-close must remain reachable. Carry the GLM Q1-C1-C12 and Sonnet X1/C1-C10 as individual conditions:

1. Resolve the contradictory section-scope language. Put the operative V8/V396 terms on the page: retry host/cap, closed retcode table, TARGET_PASSED, pending-broker-exit state/touch rows, unconditional identity fields, both O6 gates, and all V396 requirements. Do not rely on an off-page grade reference.
2. Exhibit `UjClosedSessionTarget`, validity/nearest-target guards, day-close computation, `MtCloseBrokerPosition`, and Friday/day-close flag selection. Reconcile the multiple-nearer-revisions rule with the old one-per-trade comment; define the effective instant when price has already crossed a proposed target and carry the executable-side TARGET_PASSED guard.
3. Specify one complete model/broker state machine. A model TP touch while the broker position is open remains managed; pending/failed sync, confirmed model-only touch, successful broker TP/SL, BREAK, DAY_CLOSE, and failure to market-close have distinct states/rows/alerts. Do not call a touch a fill; resolve retirement only against a same-PID closing deal. On failed BREAK/DAY_CLOSE market close, retain pending management, bounded retry, and terminal failure labeling. Keep MODE_ALERT_ONLY paper accounting separate.
4. State exact modify behavior: max three calls per revision, at most one per evaluated M5 bar per revision, immediate raw boolean/retcode capture, closed retry/fail retcode sets, `NO_CHANGES` only with equal TP readback, `POSITION_CLOSED` to deal resolution, all other codes consume cap; verify current MQL5 enum meanings. Require same PID/ticket, exact normalized TP, unchanged normalized SL, and preserve the no-market-close-on-sync-failure rule.
5. Reconcile TP-touch versus SHORT Ask-side fill. A bid-chart model touch without the broker Ask-side TP deal is MODEL_ONLY, not a sync failure; carry Ask evidence without inventing a spread-offset strategy rule. Scope deal acceptance to the operative revision at exit; superseded/original-price fills fail, with supersession rows for each revision.
6. State the full existing priority including HTF, and same-bar behavior when an unsynchronized model TP touch coincides with SL/BREAK/DAY_CLOSE. An unsynchronized touch is not a valid broker TP; other market exits remain reachable and resolve by same-PID deal.
7. Pin account/sync assumptions: hard-refuse the independent-instance model on netting; pin synchronous/asynchronous CTrade mode; use ticket overload only, nonzero ticket validation, correct symbol/session magic, immediate pre-call SL and unchanged SL readback including the no-SL case.
8. Move O6 before seed and before signal-side effects. Prove no sequence, admission, SIGNAL, A6Fired, or session-take side effect on a blocked candidate; preserve alert-only behavior; identify candidate session locally and include older same-session positions.
9. Migrate the complete `g_mtrade`/reset/fill/read/write/retirement and market-exit paths. A new London/NY instance cannot overwrite another open instance; resolve registry scope, one-take accounting, and instance retirement only after PID absence and deal resolution.
10. Keep the two proof branches separate. The 5 June NY TP branch and same-position 23:55 day-close branch cannot both be proved after one closes the position; prove day-close on a separate fixture (including the must-keep 4 September EURUSD fixture or a specified UJ fixture). Define verdict day, 23:55 bar/open reference, actual first-tick execution, same-PID full-volume close and EXPERT reason; ask the operator only if exact deal-price grading remains a strategy/record decision.
11. Acceptance must include the NY 160.298 / 0.41 and London 159.908 / 6.74 TP deals, same PID, `DEAL_ENTRY_OUT`, `DEAL_REASON_TP`, exact operative target after accepted modify/readback, unchanged SL (NY 159.726; London 159.972), and no old target or stop first. Start the downstream diff at 5 June London 12:05 through June 11 and journal end; include complete identity/attempt/state/retcode/readback/volume/reason rows and exclude idempotent skips from call counts.
12. Reconcile saved EA, EX5, run result, and build provenance. Keep unproven links labeled unproven; do not infer the running binary from saved-source excerpts.

## Q3 - binding implementation-packet conditions

The settled setup validity and exact 160.524 entry reference remain fixed; no spread tolerance, Ask relabel, rounding, or 14:45+ selection is allowed. Release must not waive normal confirmation or any guard. Carry GLM Q3-C1-C11 and Sonnet X1/C1-C13 individually:

1. Recover SEG 22656-22660 and 22662-22663 where available; add 14:30/14:35 OHLC and Daily-POC line value. If unavailable, state the exact gap and leave confirmation unproven. Do not infer the missing `UJSBTELEM` or confirmation result from its omission.
2. Map the operator's 14:35 retest+confirmation wording to EA bar roles: the 14:35 pass reads the 14:30 opposition/touch bar and 14:35 body bar. Show the ordinary candidate fire path and all normal confirmation/guard outputs; refusal of the settled valid setup is a separate defect, never a bypass.
3. Give a concrete same-pass state/scheduling map that preserves holder-first ordering and the same-bar tie, releases only the matching flip-killed SHORT, reaches the fresh IDLE seed exactly once, and completes the normal pipeline through function end. Resolve poll-before-seed memo availability without shifting the entry to 14:45 or rerunning prepass/incumbent work.
4. Census every return before and after the apply site through function end. Define what happens to pending aborts on early holder-return, S1WAIT/S2WAIT, yield, consume, and terminal branches; no stale abort and no hidden unreachable fresh seed.
5. Show every `g_evictBits*` write and its direction/day/session key. Prove a consumed SHORT Daily-POC abort cannot evict or block the LONG Daily-POC candidate.
6. Census and reset consumed-holder provenance/exemption globals (`s1g_seedBiasAl`, `s1g_legDir`, `g_ujOpReseedBarTime`, `g_ujOpReseedDir`, `g_s2_seedShift`) so SHORT state cannot leak into the new LONG and the June 9 never-reseeded refusal stays unchanged.
7. Make branch reasons exhaustive and mutually exclusive across yield, SIDE1C_PREEMPT, UJRESEED, ANCHOR_SUPERSEDE, consume, supersede/reseed, and early-return cases; name which path yields DROP versus consumes, with no stale pending abort.
8. Exhibit the F11 prologue, declaration, all abort writers, gates, and naming/source mapping; reconcile “5m structure-bias flip” with the `FL_BUF_HTF_LOW` buffer/name actually read.
9. Place O6 at both pre-seed and pre-side-effect sites. A blocked candidate must produce no SIGNAL/A6Fired/admission/sequence/session-use side effects and must preserve correct local session-to-magic mapping and execute-mode accounting.
10. Make pre-decision suppression a neutral observation-only label, not false `HELD`, `RELEASED`, or any control-flow change. Keep shadow polls read-only.
11. Prove scoped counters and event rows reconcile exactly once per `(barTime, phase, candidate identity)`: no doubled/lost `r2_evals`, `s1g_nSeed`, `s1g_nProf`, `s1g_nV3`, `s_t72_*`, `s_t73_*`; prepass and shadow poll once; branch table counts match one and only one branch.
12. Preserve the must-keep set: June 8/9 refusals with their observed `S2SEEDBIAS_KILL` reasons; June 5 London 09:45 SIGNAL/deal #4 at 159.948; June 3 09:10, seven EURUSD takes, one take per pair/session/day, and cross-session independence. Entry precedes all 14:45+ evidence.
13. Keep June 11 admission conditional on Q1's prior same-session broker close; if still open, O6 blocks correctly. Pin signal reference and actual deal acceptance at exactly 160.524 with no spread leniency, while reconciling source/build provenance.

## Close and next step

Q1 and Q3 are CONDITIONAL-CONFIRM, not unconditional clearance. The conditions above are the implementation handoff checklist. Q2 stays closed. The existing RECON78 one-run authorization is consumed. This grade authorizes no code edit, build, test, tester run, key, live action, commit, or push; an OpenCode implementation still requires the operator's separate authorization and an implementation packet that resolves the conditions above. `BUILDER_CONDITION_INVENTORY_V397-NOT-READY.md` records the conditions that remain to be resolved. It is not an implementation packet or OpenCode relay, and does not establish edit, build, or test readiness. Do not re-ask Sonnet or GLM to review unchanged V397 files.

## Evidence correction carried into V398

The prior paragraph above saying RECON57 had a “real ... exit” and “match” was imprecise and is superseded on this point by V398 packet section 14.1. Raw journal lines show MTEXIT/DAY_CLOSE model verdict at 2026.09.04 23:55 with closePx=1.16093 (line 13417), MTLIFE openAtDayClose=0 (13418), and alert only (13419). Broker deal #4 opened at 16:00 on 9/4; broker deal #7 closed on 9/7 at 11:12:27 for 1.16307. Thus DAY_CLOSE fired at model level while a real position existed, but broker flattening did not occur at the DAY_CLOSE event. The June 5 loss of DAY_CLOSE model evaluation after model TP_TOUCH remains a code regression because this model behavior fired in the EU test. Actual broker-close acceptance is a distinct future predicate. The older prose is retained for audit; this paragraph and V398 section 14.1 control its interpretation.