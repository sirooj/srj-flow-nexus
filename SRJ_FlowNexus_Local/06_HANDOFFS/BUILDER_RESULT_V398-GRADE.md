# V398 council grade - packet P-RECON78-UJ-EXEC-1 v10

Date: 2026-10-03
Relay `BUILDER_RELAY_COUNCIL_v398-UJ-EXEC-8.md`: SHA-256 92986CF076828C50A1A7031CE5EB4AA8CC4CF8DD91E32200A57435A7360D17E9 (190803 bytes / 2088 physical lines).
Packet `PACKET_P-RECON78-UJ-EXEC-1v10.md`: SHA-256 0F077CD4BCA840FB3213C6B2E21369CA0AA093B842AD72B3A39DEEF3468E3191 (174957 bytes / 2067 physical lines).

## Intake and authority

Sonnet reply: AF60BE09E56A5C5F5AD571ABCA6D2522BE71E9EC37CA434129942331D562FDEF (20401 bytes; 197 LF lines), filed whole/byte-exact in `BUILDER_VERDICTS_SONNET.md` under `V398-UJ-EXEC-8` OPEN/END SONNET. GLM reply: 6CD8F2FF87F7DE3FF5F4157B018CDFEF1436F49285A297AAB348D8B93931B423 (18467 bytes; 105 LF lines), filed whole/byte-exact in `BUILDER_VERDICTS_GLM.md` under the matching GLM markers. Each OPEN and END marker appears once in its correct file; attachment payload bytes match the saved excerpts. Neither seat grants implementation authority. Q2 remains closed.

## §47 TIE-FIXED tallies

| Question | Sonnet | GLM | Grade |
| --- | --- | --- | --- |
| Q1 - dynamic closed-session TP revisions and day-close regression | DISCREPANCY | YES / CONFIRM | CONDITIONAL-CONFIRM; GLM Q1 C1-C10 and Sonnet Q1 A1-A9/B conditions bind. |
| Q3 - June 11 settled LONG through same-pass entry | DISCREPANCY | DISCREPANCY | AMEND; resolve both seats' stated discrepancies. |
| Q2 - June 5 NY 16:15 entry | Not reviewed | Not reviewed | Closed; no new tally and no reopening. |

Apply §47 separately per question. Q1 conditional-confirm is not implementation clearance. Q3 amends because both required seats returned DISCREPANCY.

## Strategy authority controls Q3 interpretation

The governing `.opencode/skills/srj-strategy/SKILL.md` sections 7-8 state `TOUCH-OR-BREAK` / `CONFIRMATION-CANONICAL`: confirmation is a valid retest touch OR a candle-body close through the line; zero margin/tolerance; same-bar retest-plus-confirmation is permitted when the bar closes into setup-bias direction. The rule `PRIOR-CLOSE-IRRELEVANT` says the 14:30 close cannot invalidate the June 11 14:35 retest. Sections 8-9 and `BUILDER_FINDING_USDJPY-MISSES.md` Rulings-F/G settle 11 June USDJPY: 14:35 retest+confirmation; 14:40 open entry reference exactly 160.524; 14:45 is post-entry and cannot be selection evidence. Do not ask the operator to decide this settled setup again.

Both seats correctly identify that row 22660 reports `confC=0` / `A2_CLOSE_BREAK` in the LONG-contender evaluation. This proves the current code's A2 prior-close predicate failed; it does not overturn the settled strategy validity under touch-or-break. The same row does not publish the complete normal LONG confirmation/admission path. Current EA `IsConfirmationCandle` at source lines 2337-2372 requires `closeSideOk` and returns `A2_CLOSE_BREAK` at 2369 before evaluating body and touch. That current implementation is inconsistent with applying the operator's touch-or-break/irrelevant-prior-close ruling to the settled 14:35 case. The implementation must resolve the mismatch without tolerance, bypassing unrelated guards, or moving entry to 14:45. Keep the exact 160.524 entry-open reference and record the actual deal separately; no spread drift is waived. Missing 14:35 OHLC remains an evidence gap, not permission to reopen strategy validity.

## Q1 - conditional-confirm crosswalk

GLM confirms Q1; Sonnet marks DISCREPANCY. Required fold:

1. Exhibit rather than cite `UjClosedSessionTarget` EA 1893-1930, exit priority 11834-11842, day marks 12012-12019 and separate Friday/week-close path, complete `MtCloseBrokerPosition`, `vSL`/`vBREAK`/`vHTF`/`nextOpenPx` derivation, and fill-to-order path. Resolve `openAtDayClose=0` and Friday-flag meanings. RECON57 proves a model DAY_CLOSE verdict on a real-position instance at 23:55; deal #7 closed 9/7 later. Identify its DEAL_REASON only if history proves it.
2. Preserve the settled 23:55 verdict-day reference including Friday; state model time/reference separately from actual broker execution. Use a completely specified Monday-Thursday managed-position fixture with no eligible session target for isolated broker day-close proof. Actual market fill is reported separately. Universal day-close remains; no overnight hold by design.
3. HTF close/hold experiment remains open. Do not invent an HTF broker-close policy: an HTF model verdict cannot mark an open broker PID resolved or stop its management. Keep current non-executing HTF boundary pending the operator's eventual experiment ruling; likewise do not infer close policy for CANCEL_BIAS or MT_EXIT_REPLACED.
4. Define TARGET_PASSED and stops/freeze-level guard as a no-modify failed revision, visible managed state, no fill claim; internal guard reason is not a server retcode. Define supersession: operative target at deal time is last confirmed-synchronized revision; new revision gets a fresh capped budget; cancel old pending attempts; a fill at the last synchronized target remains legitimate while the newer revision is pending.
5. Define bounded deferral for MARKET_CLOSED / TIMEOUT / CONNECTION so session gaps do not consume three retries in one bar. Verify exhaustive retry/permanent retcode sets against current MQL5 reference before encoding. Pin CTrade synchronous mode (async off), ticket overload, exact TP readback and unchanged SL.
6. Restore MODE_ALERT_ONLY paper-exit behavior and guard broker calls behind current execute/tester/demo rules. Failed entry after snapshot/record creation must not leave phantom active management.
7. Put O6 before seed/admission, managed-record replacement/reset, and signal-side effects. Prove blocked candidate has no sequence/admission/SIGNAL/A6Fired/MarkSessionUsed side effects; include older same-pair/session positions and correct session magic.
8. Complete per-PID instance migration, close/deal resolution, retry states, and market-close failure rows. Unsynchronized TP cannot mask SL/BREAK/HTF/DAY_CLOSE. Bound market-close retries and separate TP and day-close fixtures.
9. TP acceptance remains NY 160.298 / 0.41 and London 159.908 / 6.74, same PID, exact TP readback, unchanged SL, full-volume DEAL_ENTRY_OUT / DEAL_REASON_TP at operative target, no old target or stop first. Explain that 159.908 is nearer to the 159.948 SHORT entry than 159.900 although numerically higher; include every later revision and London diff from 12:05 to journal end.
10. Keep all V396 conditions (a)-(i), model touch distinct from broker close, and corrected RECON57 evidence. These are future design/acceptance predicates, not proven code.

## Q3 - amendment crosswalk

1. Sonnet A1/B1 and GLM D1/D7: carry the settled `TOUCH-OR-BREAK`, `PRIOR-CLOSE-IRRELEVANT`, same-bar and 14:35/14:40 rules directly. `confC=0` for A2 alone is not the whole strategy decision. Add full 14:35 OHLC and line values if archive evidence has them; otherwise state unavailable. Do not treat that gap or A2 telemetry as grounds to re-ask or relabel the setup invalid.
2. Sonnet A2/A3 and GLM D2/D3: exhibit EA ~8477-10617 and ordinary S3-S5 gates/returns. Prove fresh same-pass memo/poll, freshness and divergence latch behavior without moving the entry to 14:45. Reset holder-scoped `s1_stopRef`, `s1_haveStop`, `uj_memo_*`, `g_divLatch` and contender locals before processing LONG. No latch transfer or repeated prepass.
3. Sonnet A4-A6 and GLM D2/D4-D7/D9: census every pre-resolver return, including F11, S1WAIT/S2WAIT and seed-gate returns; deterministically consume/drop pending aborts. Exhibit every eviction writer/day/session/direction key, provenance/exemption declaration/write/reset, all counters, and mutually exclusive yield/preempt/reseed/abort/consume/early-return taxonomy. Reconcile exactly one selected branch by (barTime, phase, candidate identity); suppression is neutral/read-only.
4. Sonnet A7 and GLM D8/D10: O6 before seed, managed-record replacement, and every signal side effect; correct pair/session magic and no side effects when blocked. June 11 remains conditional on Q1's same-session broker close.
5. Sonnet B1 and GLM exact acceptance: the operator has already fixed 160.524 as the 14:40 open reference and exact-price/no-leniency. Record the actual deal separately, but do not ask the operator to choose which one is accepted; fill drift remains a defect.
6. Preserve June 8 refusal under its observed S2SEEDBIAS_KILL, June 9 never-reseeded refusal, June 5 London 09:45 at 159.948, June 3 09:10, seven EURUSD takes, one take per pair/session/day, cross-session independence, and no 14:45+ selection. Reconcile EA/EX5/run provenance.

Both seats returned Q3 DISCREPANCY; the implementation-contract page needs amendment and another council review before any implementation handoff. Operator strategy validity is unchanged. Do not elevate missing telemetry or a model A2 term over the settled ruling.

## Close and authority

Q1 CONDITIONAL-CONFIRM; Q3 AMEND; Q2 closed. No edit/build/test/run/key/live/commit/push authority. RECON78's run authorization is consumed. No EA source was edited. Codex does not message Sonnet, GLM, OpenCode, or other people. Preserve dirty working tree.
