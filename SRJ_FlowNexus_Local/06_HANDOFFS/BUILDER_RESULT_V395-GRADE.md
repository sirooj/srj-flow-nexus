# V395 council grade - packet P-RECON78-UJ-EXEC-1 v7

Date: 2026-10-02
Relay: `BUILDER_RELAY_COUNCIL_v395-UJ-EXEC-5.md`, SHA-256 `7EC6E62BA4F468D08102DE5BD70F22788BAE8E1E55321192186001F32A425802` (49,689 bytes / 528 physical lines)
Packet: `PACKET_P-RECON78-UJ-EXEC-1v7.md`, SHA-256 `B2500DF5D4FB6CCD208BF3DB4C2DA56DF865EFEE137BC68AE71B4FC44C07E500` (44,915 bytes / 519 physical lines)

## Intake and authority

Complete V395 seat replies were supplied by the operator and filed whole under the V395 OPEN/END markers in `BUILDER_VERDICTS_SONNET.md` and `BUILDER_VERDICTS_GLM.md`. Source attachment digests: Sonnet `E816B9A6102A1A30129CBF0F11A1DCE173ADA13016A66F77A886398A60BFDCA8` (12,008 bytes); GLM `C2313D1D0BE0BA8C98A14EB517D0650692E2A5F789747A33947E0285626D2A71` (18,175 bytes). Each seat file has exactly one V395 OPEN and END marker. Sonnet reviewed P001-P519 as supplied and did not recompute metadata; GLM reviewed all P001-P519. The saved packet/relay binding remains the prior twice-green battery; this grade does not claim either seat recalculated the twin.

Q2 remains closed (both seats acknowledge). No build, source edit, tester run, key request, live action, commit, or push is authorized. The previous run word is consumed. No relay was sent by Codex.

## Tallies

| Question | Sonnet | GLM | Council disposition |
| --- | --- | --- | --- |
| Q1 broker TP synchronization design | DISCREPANCY | CONFIRM with binding C1-C12 and S1-S2 | DISCREPANCY (1-1 split) |
| Q3 same-pass flip release design | DISCREPANCY | CONFIRM with binding D1-D10 | DISCREPANCY (1-1 split) |
| Q2 June 5 16:15 seed-bias refusal | CONFIRM | CONFIRM | Closed; not reopened |

A conditional CONFIRM is retained as that seat's vote; its conditions are not represented as already satisfied. Neither Q1 nor Q3 has council clearance. GLM's implementation conditions are not authorization to build.

## Q1 grade

Both replies agree the baseline defect is real and that the broad goal is appropriate: model TP retargets were not synchronized to broker TP. Sonnet's disagreement identifies unresolved design and evidence gaps; GLM confirms only subject to C1-C12 and S1-S2. The split therefore leaves Q1 open as DISCREPANCY.

Before another council page can seek closure, it must resolve or explicitly disposition these items:

1. **Position identity and lifecycle.** Prove all `MtReset` callers and retry-host survival with an open broker position; prevent a second fill from replacing pending per-instance sync state, or move sync state to a pid/sequence ledger. GLM C1-C2 and Sonnet items 1, 3 converge here.
2. **Admission gates before side effects.** Place the same-session recheck before `LogSignal`/`A6Fired` as applicable, or define and evidence the intended asymmetry. Prove candidate blocking occurs before `g_mtrade` is overwritten. Name refusal/abort behavior and ensure a blocked candidate does not consume the session take. Sonnet items 2 and GLM C7.
3. **Unsynced TP touch and real exit.** Specify model state and operator-facing rows/alerts on pending and terminal FAIL; do not report a revised broker exit without the closing deal. Define broker-exit detection and history/deal identity. Sonnet item 4 and GLM C6/C11/S1.
4. **Complete modify contract.** State exact retcode classes, no-change/equal-readback idempotence, normalized TP equality, SL preservation including no-SL=0, retry counters/reset per target revision, attempt #1 location, retry ordering, debug-log independence, and target-already-crossed behavior. Reconcile Sonnet item 5-7 with GLM C4-C10/S2 rather than assuming the replies agree on retcode taxonomy.
5. **Source proof.** Add the missing touch-evaluation block, all relevant reset callers and retry callers, full resolver, `CTrade`/sync configuration and ticket semantics, and exit-detection site. Verify exact insertion order from saved source.
6. **Acceptance and audit.** For both London and NY independently require row identity (including ticket, retcode, readback TP/SL, volume and attempt/state), actual matching `DEAL_ENTRY_OUT` at the revised normalized target, unchanged SL, and no tolerance. Exclude skips from modify-call counts. Define the post-June-5 admission/signal/abort/deal diff and instance-scoped expectations. Keep the 159.725 vs 159.726 stop execution separate from target tolerance and preserve the 160.115 model vs 160.120 Ask/deal observations.

No June 5 revised-target broker deal is claimed in the baseline. The London original-target fill and NY June 11 stop remain defect evidence only.

## Q3 grade

Both seats accept the high-level consume-abort-then-fresh-seed design only conditionally, while Sonnet's open items and GLM's binding D1-D10 yield a split. Q3 remains DISCREPANCY (1-1); no June 11 LONG result is established.

The strategy record already answers the purported rule gap. `.opencode/skills/srj-strategy/SKILL.md` section 117 records `FLIP-KILLED-NEVER-VETOES` and states that the flip-plus-confirm same-bar tie is unexercised and keeps current order. Do not ask the operator to restate it. The design must preserve the existing holder evaluation order for that tie while ensuring a killed holder cannot continue vetoing a challenger; this ordering needs an explicit source trace in the next page.

A closure-ready design page must include:

1. Exact hook placement after the abort is set and before EA 8070 (`s1f_seedArmed`), before census/other state-derived locals as required; clear the consumed abort and fall through without returning.
2. Full source span for the intervening region and the 8094-8429 seed/confirmation path; prove no early return, stale locals, duplicate state evaluation, or double bar accounting.
3. The June 11 `UJSBTELEM` row and full `IsConfirmationCandle` semantics; distinguish holder poll from challenger normal-seed confirmation. Show whether the 14:35 LONG passes the ordinary path. If it does not, isolate that as a separate confirmation defect rather than attributing it to release.
4. Audit reset leakage (`uj_memo_valid`, `uj_saA/D/T`, `g_shadow*`), shadow read-only control-flow behavior, deferred apply/drop/yield rows, and the distinct consume row. Decide whether the legacy apply path remains as an idempotent stale-abort safety net.
5. Order the consume before the O6 live-position gate; derive magic from the local session. Keep the same-pair/session open-position block distinct from candidate-vs-candidate arbitration.
6. State the future-only acceptance precisely: Q1 exact broker close prerequisite, 14:35 retest+confirm evidence, 14:40 open exactly 160.524 without relabeling it Ask or allowing spread tolerance, no 14:45 selection, the June 8 and June 9 refusal mechanisms distinguished, June 5 London preserved, and instance-scoped take count. No future outcome is asserted.

## Next workflow state

V395 replies have been filed and graded. To continue, prepare a focused v8 design packet that addresses the open Q1/Q3 items, then perform the council battery before the operator carries any new version. Q2 stays closed. The operator's workflow remains Codex council stage -> operator carries replies/relay -> after an actual council disposition, the operator may take approved implementation work to OpenCode. Preserve the dirty tree; no source/build/run work occurred in this grade.
