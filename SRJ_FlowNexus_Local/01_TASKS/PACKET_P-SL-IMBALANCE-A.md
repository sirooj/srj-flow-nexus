# PACKET P-SL-IMBALANCE-A — issued, with one determination corrected

First step only: the export contract, the EA-side shadow census, no selection change. Two files in one packet, and one part of the ask cannot be specified.

## 3.1 What I cannot issue, and why

**The FlowLogic edit spec.** I have never read FlowLogic — `F58E57A5` (59,714 B) has not been relayed in any turn. I cannot name the swing-confirmation site, the export loop's insertion point, or whether imbalance-to-swing association is even derivable there. Issuing an anchored edit against a file I have not read would be fabrication.

So this packet issues the **buffer contract and the gates**, and the builder either locates the site against the contract or relays FlowLogic for a specified edit. Council's recommendation is to relay it: the write-discipline requirement in 3.3 is exacting, and the file already carries the "same object pointer, same branch" pattern on buffers 22/23/31/33 that the new pair must join.

**One open feasibility question that governs the whole packet:** does FlowLogic know, at swing-confirmation time, which leg created the swing and whether a `CImbalance` sits on it? `SRJ_ImbalanceMgr.mqh` (`F830AE5A`) supplies the records and buffers 24/25/32 prove FVG data reaches the export layer, but the *association* is unestablished. If it is not derivable, this packet stops and the association becomes its own task.

## 3.2 Correction: interval-side is not exportable in this shape

Builder determination (d) asks the census to record both readings — creation-side and interval-side — so the data confirms or corrects. **Only one of the two can be exported as a per-swing buffer.**

- **Creation-side** is a static property of the swing: the leg that formed it either was a displacement leg or was not. That travels in a buffer slot alongside the swing value.
- **Interval-side** — an imbalance between the swing and the entry — depends on the *evaluation bar*, which FlowLogic does not know. Slot `s` would have to mean "imbalance between the swing at `s` and some bar the exporter cannot see." There is no encoding for that in a per-slot buffer.

Measuring interval-side needs a different shape entirely: a per-bar bitmask over recent imbalances, or an EA-side imbalance list, or a second indicator pass. None is small.

So **the first step measures creation-side only.** The census records interval-side as `imbInt=NA` with the reason, so the gap is visible in the data rather than silently absent. If creation-side contradicts your determination, interval-side becomes its own export packet — and the shadow-first discipline means you will know that before any selection changes.

Council reads (a) as settling the count direction outright: "higher or lower, more extreme price level" is outward steps, which is exactly what the existing `SL_STRUCT` walk's `exceeds` test already does. That half of (d) needs no measurement.

## 3.3 E1 — the FlowLogic export contract

Two buffers, at the next free indices, appended only.

```
FL_BUF_SWING_HIGH_IMB   — paired with FL_BUF_SWING_HIGH (6)
FL_BUF_SWING_LOW_IMB    — paired with FL_BUF_SWING_LOW  (7)
```

**Encoding.** `EMPTY_VALUE` = this slot is not a confirmed swing, or unset. `0` = swing present, no qualifying creation-side imbalance. `1` = swing present, creation-side imbalance present. Values 2 and above are reserved and unwritten — appended later if the operator's rule needs a grade rather than a predicate.

`EMPTY_VALUE` for "not a swing" and `0` for "swing without imbalance" is load-bearing: a zero that could mean either would be exactly the sentinel collapse the Task 160 contracts were written to eliminate.

**Write discipline, non-negotiable:**

- Written in the **same branch, from the same object pointer** as the paired swing value, so the flag can never describe a different swing than the value in the paired slot. This is the buffer 22/23/31/33 discipline verbatim.
- Written on **both** passes of the double write, so the settled slot carries the settled flag. Read via `ReadFlow` only, never `ReadBuf1`, so `FLOW_SHIFT_OFFSET` applies.
- Optional and diagnostic-only: a `CImbalance` objId pair, if it costs nothing. Skip if it costs anything.

**Builder confirms before executing:** the next free buffer indices on `F58E57A5`, and that `#property indicator_buffers` is raised to match. A silent index collision would move an existing export and the EA identities would move with it.

## 3.4 E2 — the SLIMB shadow census in the EA

**Placement:** inside `ComputeSlReference`, one emission per invocation, covering **both** branches, immediately before each `return true` and before the `return false` exits. Print-only, `InpDebugLog`-gated, writes nothing but its own counters.

**Declared population — this must reach the tabulation.** The census sits inside `ComputeSlReference`, so it fires on **computes (471), not demands (589)**. The 118 memo-hit bars emit no `SLIMB` line. That is correct rather than a gap: a hit shares `(barTime, dir)` with its compute, so the verdict is identical by construction. But a tabulation using 589 as the denominator will be wrong.

**Fields:**

| Field | Content |
|---|---|
| `bar` `site` `dir` | the usual join keys |
| `obValid` | already read in the function; the 1-swing/2-swing discriminator |
| `branch` `chosen` `src` | today's outcome, unchanged |
| `avail` | did the imbalance buffers read populated — **0 means the export is absent, visibly** |
| `walk` | compact token list, outward on the protective side: `shift:value:imbCreate` per distinct swing |
| `wbRef` `wbShift` | first outward swing with `imbCreate=1` — the walk-back reading, ruling (b) |
| `newerMoreExtreme` | is there a more-extreme swing newer than `wbRef` |
| `exceedWickOnly` | did that newer leg exceed by wick with its body not through |
| `nuanceRef` | the tighter choice when the nuance applies, ruling (c) |
| `agreeWb` `agreeNuance` `wbEqNuance` | the three cross-checks |
| `imbInt` | `NA`, per 3.2 |

**Walk bound:** the existing protective-side idiom — outward distinctness by `_Point`, bounded by the 500-slot safety limit and history exhaustion. Same limits as `FindNearestSwing`, the 2-swing branch and the t133 walk. Safety limits, not thresholds; Part A section 7 is not engaged.

## 3.5 The nuance (ruling c), parsed as a falsifiable reading

Operator (c) describes: OB still valid, latest leg more extreme but with no imbalance, **only the current leg's wick is higher** → take the one-swing stop anyway, tighter.

Council's reading: **the discriminator is wick versus body.** A newer, more-extreme leg that exceeds the imbalance-backed swing **by wick only** does not push the stop outward. A leg that exceeds it **by body** does. That reading has three things going for it:

1. It is threshold-free — a side test, no distance.
2. It is the codebase's own established idiom. `DetectPoiRetest` splits wick from body; the exit rule is ruled "it must be body"; `MtIsBreakTrigger` tests body close. A wick-only carve-out is native to this system, not imported.
3. It explains why the operator calls it "more nuance" rather than a different rule: the leg is real, its wick is real, but a wick did not invalidate anything.

The census measures it directly through `exceedWickOnly` and `nuanceRef`.

**Hypothesis on OB validity, which council will not specify and recommends measuring.** The nuance says "an OB with imbalance but it has not been invalidated." Today `FL_BUF_LTF_OB_VALID` is already the exact discriminator that sends selection down the 1-swing branch. If `obValid` *is* "the imbalance-backed OB is still valid," then the nuance's validity term is **already encoded**, and the only new content in ruling (c) is the wick-only carve-out. That would make this a much smaller change than it reads.

`obValid` is in the census on every line, so the data settles it. Specifying the definition now would risk minting a second validity concept whose agreement with the first is unestablished — the EA-173 failure mode this codebase has already paid for once.

## 3.6 Gates

- Compile 0/0 on **both** files. The log line is the instrument.
- Full-window run, unchanged `RECON1_P1.ini`, 3168 bars / 563338 ticks.
- **The four-signal set verbatim vs RECON6**: 8/28 10:05 SHORT Daily-VWAP R=2.43 SL 1.16508 entry 1.16466; 9/4 16:00 LONG Yearly-POC R=2.56; 9/7 09:20 LONG R=1.76; 9/7 16:45 LONG R=1.25.
- Every EA identity verbatim vs RECON6: CQD 906 = 170/308/263/165 (DIV-first), WS161 `fields=21 changes=205 mismatch=0`, BIASCENSUS 1554/1614 ×2, ZONECENSUS 3168/1056 fvgOnly=0, XOB-PROMO 469, CONFIRMPOLL 555, SUPPRESSED 156, MTEXIT 4, aborts 18/37/13/11/2/0/12, `SLMEMO` computes=471 hits=118 demands=589, all 157 `INPLAYCOMMIT` verdicts bar-for-bar.
- **`SLIMB` line count = 471**, matching computes. Any other value means the emission sites are wrong.
- **`avail=1` on every line.** `avail=0` means the export is absent or misaligned and the run answers nothing about the rule.
- No working-set field added. `fields=21` or the edit reached further than specified.
- Acceptance: journal diff against RECON6 clean except new `SLIMB` lines and timing values.
- New EA and FlowLogic digests reported with byte counts. No git action, no `02_TASK_CHECKPOINTS` write, ALERT-ONLY preserved — no order path added.

**Two declared costs.** FlowLogic's digest moves for the first time since P-FVGVALIDITY, so the "unchanged upstream" argument no longer covers it and the identity gate above is doing that work. And the census adds debug-gated buffer reads plus an outward swing walk on 471 invocations, so debug-on wall time rises slightly. Debug-off is untouched.

---

STATUS: ISSUED (council relay 2026-09-12; CQD confirmed + TRIM verified in same relay).
Filed by builder to `SRJ_FlowNexus_Local\01_TASKS\PACKET_P-SL-IMBALANCE-A.md`.
Predecessor: PACKET_P-TRIM-S2POLL.md (EXECUTED AND VERIFIED, RECON6).
BUILDER STATE 2026-09-12: S1 pre-hash PASS (EA 57B2F9D3 266664 B; all four
baselines match AGENTS.md §9). E1 feasibility PROVED — see
`06_HANDOFFS\BUILDER_FINDING_SLIMB-FEASIBILITY.md` (site L968-976, free
indices 37/38 → buffers 39, no-lag proof, remainder-alive test). E1
PREDICATE open (semantic; relayed to council with recommendation:
structLegBoundary window + direction match + remTop>remBottom). NO EDITS
made (predicate unspecified; fabrication forbidden). E2 pre-mapped, blocked
on E1 spec. Awaiting council ruling.
