# V396 council grade - packet P-RECON78-UJ-EXEC-1 v8

Date: 2026-10-03
Relay: `BUILDER_RELAY_COUNCIL_v396-UJ-EXEC-6.md`, SHA-256 `F766F31C520EDAF4ECC6E7CD7DD0366BC19FFFCE9C83835DDAFE6975512D8E37` (162959 bytes / 1977 physical lines)
Packet: `PACKET_P-RECON78-UJ-EXEC-1v8.md`, SHA-256 `BAFC55650CC1289C4CDE5083131466AD40390085D9B6A7BFE60CA1F51AF918E3` (148563 bytes / 1968 physical lines)

## Intake and authority

The operator supplied one complete reply per required seat. Sonnet is filed whole at `BUILDER_VERDICTS_SONNET.md`, V396 OPEN/END lines 6985-7114; inbound attachment SHA-256 `3804FF9A3D5B93512C284C36DE78BF15A7AF7E2ABEC13AC32DA3D2C7F42AE9C6` (10483 bytes). GLM is filed whole at `BUILDER_VERDICTS_GLM.md`, V396 OPEN/END lines 10291-10369; inbound attachment SHA-256 `853CAA4B1AEEE010D0E0F964F489FEE4AB66020EFDE18A417CE63C5EDBAFA258` (14641 bytes). Both payloads were byte-compared to their supplied attachments; each correct file has exactly one OPEN and one END marker, and the other seat's marker is absent.

Sonnet reviewed P001-P1968 but did not compute packet digest or byte count. GLM reviewed P001-P1968. The V396 relay battery separately proves the twin; neither seat claims to have recalculated its digest. The intake digests bind the saved replies to the supplied attachments, not to a council platform's source messages.

Both seats keep Q2 closed. Neither grants or requests EA edits, build, tester run, key, live action, commit, or push authority. The prior one-run authorization remains consumed. No external message was sent.

## Tallies and dispositions

| Question | Sonnet | GLM | Grade under current TIE-FIXED rule |
| --- | --- | --- | --- |
| Q1 broker TP synchronization | DISCREPANCY | CONFIRM with Q1-C1 through Q1-C5 | CONDITIONAL-CONFIRM; GLM conditions bind and Sonnet objections remain to be resolved in the implementation packet |
| Q3 same-pass flip release | DISCREPANCY | CONFIRM with Q3-C1 through Q3-C6 | CONDITIONAL-CONFIRM; GLM conditions bind and Sonnet objections remain to be resolved in the implementation packet |
| Q2 June 5 NY 16:15 refusal | Not re-reviewed | Remains closed | Closed; no new tally |

`srj-council/SKILL.md` section 47 maps YES plus DISCREPANCY to CONDITIONAL-CONFIRM. This is not an unconditional two-seat CONFIRM and does not grant implementation or run authority. The two questions are tallied separately.

## Q1 grade

The shared design direction is supported: repair broker TP at the model retarget, retain per-position identity, verify modify retcode and normalized readback, preserve SL, keep TP_TOUCH distinct from broker execution, and prove the actual closing deal. The split is CONDITIONAL-CONFIRM only with the conditions below; the baseline does not show a successful modify or revised-target broker deal.

### Binding conditions for the implementation packet

1. **Pre-signal gate side effects.** V8 P654-P664 begins at EA 10608 and shows `g_slext_lostN` and `SLEXTLOST` work before `LogSignal` at EA 10618. Sonnet identifies the omitted S5-entry-through-10608 region as unproven. Exhibit that full range and census sequence/admission writes and all side effects before the O6 gate, or place the gate earlier. A blocked candidate must not burn a sequence, admission record, SIGNAL, A6Fired, or session take.
2. **Pending-exit state and market legs.** V8's `EXIT_PENDING_BROKER` state must continue to evaluate BREAK, DAY_CLOSE, and SL legs. Specify what happens if one closes at market while TP modification is pending, and require PID-matched broker-deal resolution before retirement. No market close may be introduced as a sync-failure fallback.
3. **Correct touch alert.** `EXIT-UNSYNCED` applies to pending or failed sync. A confirmed TP with no closing deal is `MODEL_ONLY`, not unsynced. Name the confirmed-case row/alert and keep the exact deal as the only broker-exit proof.
4. **Complete instance migration map.** Include the repeated reset near EA 10215, the fill writes at EA 10702-10704, all `g_mtrade` reads/writes, and SL/BREAK/DAY_CLOSE close paths. State how ordinary unrevised-target touches are logged and how each instance retires only after its closing deal is resolved. Resolve whether the PID/sequence registry is inside the accepted defect-fix scope or is staged separately; a pending instance may not be silently overwritten.
5. **O6 gate behavior.** Check `PositionGetTicket` returned a nonzero ticket before using the selected position. Emit `UJPOSITION_BLOCKED` only when a real candidate reaches the gate, not on every IDLE bar. Define block cleanup without calling `GoAbort(ABORT_CONCURRENCY)` if it would mislabel the event as `A6REFUSED class=ABSENT_DECLINED` or emit an unrelated STAND-DOWN. At the pre-signal gate prove the candidate session is still `g_sessionAtEntry`, or map magic from the stored candidate session. Show the execute-mode `MarkSessionUsed` site and confirm a blocked candidate does not consume it.
6. **Modify result handling.** Capture `g_trade.ResultRetcode()` immediately after `PositionModify`. `TRADE_RETCODE_NO_CHANGES` is a skip only when normalized TP readback equals the target; otherwise it is a failed attempt. Preserve the finite retry cap and reconcile all `PositionModify` calls against target revisions.
7. **Deployment assumptions and rows.** Pin async configuration and netting/hedging account mode before relying on readback timing or ticket identity. Make `UJRETARGET` unconditional for acceptance. Add full migration and exit-leg exhibits, including unchanged-target touch behavior.
8. **Acceptance delta.** Begin the classified downstream diff at the earliest relevant behavior change: June 5 London 12:05 (12:00 retarget bar's pass), not only June 5 NY 19:15. For each target revision reconcile all modify calls; the closing `DEAL_ENTRY_OUT` must occur after successful modification, have `DEAL_REASON_TP`, full volume, same PID, and exact revised target. Preserve model 160.115 and Ask/deal 160.120 as separate observations; no tolerance is granted.

GLM's Q1-C1 through Q1-C5 bind as well: pre-signal session mapping; async/margin-mode verification; unconditional retarget row; full reset/fill/exit migration; and execute-mode one-take accounting. No binding condition is represented as already implemented.

## Q3 grade

The shared direction is supported: preserve incumbent evaluation and SIDE1C_YIELD ordering, consume only a still-matching flip-killed holder, run one fresh normal candidate pipeline, keep the broker-open-position gate separate, preserve POC-over-VWAP ranking, and do not infer a June 11 LONG outcome. The split is CONDITIONAL-CONFIRM; no June 11 signal, admission, confirmation, or deal is established.

### Evidence reconciliation

V8 P553 describes the baseline as having no `UJSBTELEM` row, while the section 10 source at EA 8442 (P1848) prints that row when `InpDebugLog` is enabled. The supplied journal excerpts jump from SEG 22655 to SEG 22658 and then SEG 22661 (P506-P508), leaving SEG 22656-22660 unspliced. Other debug rows are present. GLM's suggestion that the run binary predates the source's Fix S3 is a plausible inference, not proven run-build provenance. Until the omitted physical rows and the exact run-source/build identity are reconciled, phrase this as no LONG-confirm evidence in the supplied evidence; do not assert the row is absent from the full journal or infer `confC`, a confirmation cause, or a June 11 result.

### Binding conditions for the implementation packet

1. **Pipeline boundary.** Factor the incumbent phase, resolver, and candidate continuation through function end, not only through `EmitAlert` at EA 10625. Include managed-record replacement, alert-only accounting/return, and execution after that line. Census the full region's returns, including seed/S1/S2 paths and the continuation after EA 8478. Show no bypass of resolution, duplicate prepass/incumbent evaluation, or fall-through into the old tail.
2. **Return and holder coverage.** For each early return state whether a matching pending abort can still reach resolution. Publish the F11 state-coverage map, including S1WAIT/S2WAIT retention paths and any broader release attribution in the future diff. Preserve current holder evaluation and SIDE1C_YIELD precedence.
3. **Eviction state.** Exhibit all `g_evictBits*` write sites and prove the SHORT Daily-POC holder's consumed identity cannot block the LONG Daily-POC candidate; the map is line-and-direction keyed.
4. **Suppression diagnostic.** Since the census runs before contender evaluation, use a neutral pending label such as `ABORT_PENDING` or prove another observation-only label that cannot falsely claim HELD or RELEASED before yield is known.
5. **Authority and confirmation evidence.** Quote the settled FLIP-KILLED-NEVER-VETOES and same-bar tie rulings in the implementation packet. Retrieve the missing SEG 22656-22660 rows and identify the RECON78 run binary's source/build provenance. Supply normal-path confirmation diagnostics; distinguish absence from this excerpt from absence in the full journal. If the 14:35 LONG does not pass normal confirmation, keep that as a separate confirmation defect; release may not waive it.
6. **Exact acceptance.** Preserve the operator-set June 11 14:40 open at 160.524 and exact-price/no-leniency. If LONG Ask/deal differs from 160.524, acceptance fails; do not relabel the open as Ask or waive spread. Keep June 8's observed S2SEEDBIAS_KILL distinct from a 5m-flip event. Keep June 9 refusal, London 09:45, and instance-scoped one-take predicates distinct and future-only.
7. **Counters and joint gates.** Scope phase counters to `(barTime, phase, candidate identity)` and prove no double/lost count. Consume before O6; the local session must map the correct magic. Keep yield/drop and abort/consume row sets mutually exclusive as specified by the packet.

GLM's Q3-C1 through Q3-C6 bind as well: full return census; run/source version reconciliation; resolver generality and F11 state coverage; observation-only suppression relabel; counter scope; and factoring that prevents duplicate work. Each remains a build-packet condition, not evidence of a June 11 outcome.

## Close-out and next stage

V396 has a council disposition for Q1 and Q3, each CONDITIONAL-CONFIRM under the current tie rule. No new council relay is needed solely to repeat these same votes. The implementation handoff must carry every condition above and preserve the operator's strategy authority. The operator may choose to take that condition set to OpenCode under separate authorization; this grade grants no EA edit, build, tester run, key, live action, commit, or push. Q2 remains closed. Preserve the dirty working tree.
