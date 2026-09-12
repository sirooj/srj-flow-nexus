# PACKET P-SWINGIMB — issued (council session 2026-09-12)

No canonical file is touched until the builder has the halt conditions in hand.

---

## Ruling 1 — the value-1 predicate

**Builder recommendation is ADOPTED with two amendments.** Alternative A rejected (a counter-direction gap inside the leg is not creation-side displacement; admitting it makes the buffer measure "a gap happened nearby"). Alternative B rejected on the operator's own partial-validity ruling. Alternative C is moot — no second leg anchor exists in state, and inventing one is forbidden.

Qualifying predicate, per swing slot:

- `imb.isBullish == (slot is a swing HIGH)` — the leg that made the apex pushed that way;
- `imb.startBar` inside `[legStart, apexBar]` inclusive, where `legStart` is derived from `g_s.structLegBoundary`;
- remainder alive by the refined rule `remTop > remBottom` (backfill L381-385).

**Amendment 1 — the buffer is graded, not boolean.** Write-once export can only record *creation-side fact as observed at the apex*. It cannot track later mitigation, so a bare 1/0 would silently claim a property it does not hold. Encode:

| value | meaning |
|---|---|
| `EMPTY_VALUE` | no swing in this slot |
| `0` | swing present, no qualifying imbalance found |
| `1` | qualifying imbalance, remainder alive at the apex |
| `2` | qualifying imbalance present at the apex, remainder already dead |
| `3` | leg boundary unset — predicate not evaluable |

`0` and `3` are different facts and must never be collapsed. This is the same discipline as `SRJ_SLC_UNKNOWN`: `0` may not later be read as "no structure existed." Value `2` costs nothing and makes the alive-term itself falsifiable in the same run — which is the only reason to accept an alive-term inside a write-once export at all.

**Amendment 2 — semantics are named in source.** The buffer is `alive at apex`, never `alive now`. Any consumer that needs current mitigation state must read it elsewhere; the operator's OB-validity term already lives in `FL_BUF_LTF_OB_VALID` and this export does not duplicate it.

Association is auditable without a new buffer: `FL_BUF_STRUCT_LEG_TIME` (30) already exports the boundary and the EA already reads it, so `legStart` is cross-checkable from the journal.

## Ruling 2 — discipline

**Confirmed.** No object pointer exists for a fractal; the flag is written in the same fractal branch, from the same bar data, into the slot the swing value goes into, in the same pass. Write-once satisfies the both-passes clause because every input is already settled at export time: creation is synchronous and backdated (`startBar = i-2`, `detectedAt = i`), export runs after fill (L881 → L884 → L909+), so provisional and settled passes compute the same value from the same array state.

**One correction.** Do not relocate the write to the L1062 export block to be near the `g_imbalances` iteration. Pairing with the swing write is the load-bearing invariant; scope is not. `g_imbalances` being iterated at L1062 is *evidence* the array is in scope in that pass, not a requirement to co-locate. **Halt condition:** if `g_imbalances` or `g_s.structLegBoundary` is not in scope at L968-976, halt and report — do not move the write and do not introduce an accessor.

**Index discipline:** mirror the swing buffer's own index expression character-for-character. Do not compute a second index.

## Ruling 3 — edges

- **Leg opened on the confirmation bar, scan empty → writes 0.** Signed off. `0` is correct, is distinguishable from `EMPTY_VALUE`, and is not a claim about structure. Must be counted separately in both censuses.
- **Apex-straddling gaps detectable a bar later.** Signed off, with the consequence named: the export **under-counts and never over-counts**. A record detected at `apex+1` carries `startBar = apex-1`, which is inside the leg, but the record does not exist at the apex write. The bias is one-directional, so a later 1-bar-lagged variant is comparable to this baseline rather than confounded by it. Logged as the next candidate edit; **not** in this packet.
- **Added edge, not in your list:** the census must self-audit slot-to-bar alignment. A swing value read at eval shift `s` should equal `iHigh(s)` / `iLow(s)` for its side. That is a one-token check (`latestApexMatch`) and it fails loudly if the fractal writes to a slot other than the apex's.

---

# BUILD PACKET P-SWINGIMB

Two edits. E1 adds data. E2 adds prints. **Neither may change a selection.** Expected result is an in-window no-op on every measured identity.

## E1 — FlowLogic export pair

1. `#property indicator_buffers 37` → `39`. `indicator_plots` **unchanged**.
2. Two new double arrays, registered `INDICATOR_CALCULATIONS` at indices **37** (swing-high flag) and **38** (swing-low flag). Names: `FL_BUF_SWING_HIGH_IMB`, `FL_BUF_SWING_LOW_IMB`.
3. Initialise both to `EMPTY_VALUE` in the same statement region that initialises buffers 6 and 7, mirroring their form exactly.
4. Helper `int SrjSwingImbCode(const int apexBar, const bool bullish)` implementing Ruling 1. Returns 0/1/2/3 only.
5. At L968-976: in the branch that writes buffer 6, write buffer 37 at the identical index; same for 7 → 38.
6. **NO new FlowLogic input.** The EA passes FlowLogic parameters positionally through `iCustom`; adding one changes that surface. If an existing diagnostic flag is available, emit a per-write `SWINGIMB` line behind it; if not, emit **only** the `OnDeinit` tally:

```
SWINGIMB_CENSUS writes=<n> highs=<n> lows=<n> code0=<n> code1=<n> code2=<n> code3=<n>
```

## E2 — SLIMB shadow census (EA, print-only)

1. `#define FL_BUF_SWING_HIGH_IMB 37`, `#define FL_BUF_SWING_LOW_IMB 38`. Add `#define SHADOW_SLIMB true` beside the existing `SHADOW_*` constants so a byte-identical silence is one flip away.
2. Read flags via **`ReadFlow`**, never `ReadBuf1`, at the **same eval shift** as the swing they describe. A flag read at a different shift than its swing is a defect, not a variant.
3. One line per `ComputeSlReference` invocation, both branches, gated `InpDebugLog && SHADOW_SLIMB`. Exactly **16 named tokens plus `fields=16`**, in this order:

`bar site dir branch obValid slRef slShift latestFlag latestShift latestAvail latestApexMatch chosenFlag chosenShift chosenAvail nuanceClass cands`

- `latest*` = the freshest confirmed protective-side swing (`shHigh`/`shLow` from `FindNearestSwing`).
- `chosen*` = the slot the returned `slRef` came from. `-1` where the branch does not expose one.
- `avail` = read succeeded **and** value is not `EMPTY_VALUE`.
- `nuanceClass` ∈ `{OB_VALID_LATEST_NOIMB, OB_VALID_LATEST_IMB, OB_DEAD_LATEST_IMB, OB_DEAD_LATEST_NOIMB, UNEVAL}`. This is the direct test of the standing hypothesis that the nuance's OB-validity term is already encoded in `FL_BUF_LTF_OB_VALID`: if `OB_VALID_LATEST_NOIMB` invocations already take the 1-swing branch today, the hypothesis holds and the wick carve-out is the only new content.
- `cands` = up to **6** tuples `shift:val:flag:W|B` from whichever walk ran (2-swing structure walk, or the Task-75 side-guard walk), else `-`. `W` = exceeds the running extreme by wick only; `B` = by body. Body extreme from `iOpen`/`iClose` at the swing's own eval shift.

4. No assignment to any working-set field, no new global except this instrument's own counters, no branch on any flag value.

## Gates

Same shape as TRIM. Full-window run, pilot ini **unchanged**, 3168 bars / 563338 ticks.

1. Both files compile clean under `#property strict`.
2. **Four-signal set verbatim:** 8/28 10:05 SHORT Daily-VWAP R=2.43 SL 1.16508 entry 1.16466; 9/4 16:00 LONG Yearly-POC R=2.56; 9/7 09:20 LONG R=1.76; 9/7 16:45 LONG R=1.25.
3. **Identities:** CQD DIV-first 170/308/263/165=906 (loose patterns that catch `CONFIRM_DIV_WAIT` are parser artifacts and are annotated, not accepted). WS161 fields=21 changes=205 mismatch=0. MTEXIT 4. Aborts 18/37/13/11/2/0/12. SLMEMO computes=471 hits=118 demands=589.
4. **SLIMB count — your stated gate is corrected.** `471` is the memoised-site subtotal, not the invocation total; `ComputeSlReference` is also called at `site=S5`, which the memo deliberately excludes. Gate as two directions:
   - `SLIMB(site=S2POLL) + SLIMB(site=S3ARM) = 471`, and separately 432 / 39;
   - `SLIMB(site=S5) = count(SL_REF site=S5) + count(S5_NO_SL_REF)`.
   A single `count=471` assertion would fail spuriously and be read as a defect in the edit.
5. `avail=1` on every SLIMB line, both limbs. Any `avail=0` halts the packet — it means the export pair and the swing pair disagree on occupancy, which is Ruling 2 broken.
6. `latestApexMatch=1` on every line where `latestAvail=1`. Any `0` halts: the fractal is not writing to the apex's slot and Ruling 1's `apexBar` term is unfounded.
7. Reconciliation: EA-side `avail=1` count ≤ FlowLogic `writes`; code histograms consistent between the two sides.
8. Spot-check that raising `indicator_buffers` moved nothing: `INPLAYCOMMIT`, `XOBPROMO` and `SWEPTMASK` lines identical to baseline on a sampled day.
9. Record new SHA256 + byte size for both files. **No commit** until 2 through 8 pass.

---

# NEWS RULE — design, no packet

**Calendar probe: do not put it on the critical path.** Go straight to the pinned static event table with its own digest, operator-reviewed. Reasons: the tester's calendar surface is not part of any frozen baseline and cannot be made one; the pilot window must stay reproducible bar-for-bar; ruling (ii) already fixes the event set at three kinds and ruling (ii)'s timestamp anchor is the same one POI Marker uses for FOMC VWAP/POC, so the table and the anchor derive from one artifact. Run the throwaway `CalendarValueHistory` probe if you want the knowledge, but off the canonical path and blocking nothing. If live calendar ever enters, it enters as a print-only `CALXCHECK` cross-check and may not become a selection input until it agrees with the table across the pilot window.

**Window encoding — derive, never store.** Store `{eventTimeET, kind}` only. Blackout is `[barOpen(newsBar) − 1·PeriodSeconds, barOpen(newsBar) + 2·PeriodSeconds)`, where `newsBar` is the bar containing the event timestamp. On M5 that is 15 minutes and matches ruling (i) exactly, and it stays correct on any timeframe without a literal. **One predicate function, one call site each side** — the exit side and the entry side must not be able to disagree about the window.

**Sequencing: shadow → exit side → entry side, all after imbalance.** Your ordering is right, with one insertion: before either verdict moves, run a print-only `BLACKOUT` membership census over the pilot window so the population is known first. Then the exit side (MTEXIT baseline 4 is re-frozen after it), then the entry side (measured against the four-signal set).

**Three flats are three verdicts, not one.** Ruling (iii) names three distinct causes. Append `MT_EXIT_NEWS_FLAT`, `MT_EXIT_DAY_FLAT`, `MT_EXIT_WEEK_FLAT` by value, append-only. Collapsing them makes the census answer nothing. Priority on a same-bar collision: `SL`, `TP_TOUCH`, then the flats, then `POI_BODY_BREAK`, then `HTF_FLIP` — the price-triggered verdicts happened inside the bar, and every verdict still prints so the operator can re-judge any instance.

**The 60-minute Friday tolerance is an acceptance band, not a parameter.** Code the pinned time; the flat lands on the first evaluated bar at or after it. An early offset in source would be a tunable and Part A section 7 forbids it.

**Entry side placement is load-bearing.** Ruling (iv) suppresses firing only, and (v) is the rollback form — so:

- **No** blackout return at the top of `EvaluateClosedBar`. S1–S4 must keep evolving, and a bias flip or invalidation on the news candle must still kill the setup.
- The guard sits inside `ST_S5_GATE_CHECK`, **after** the divergence walk succeeds and **before** `g_latchedEntry` is written, rolling back to `g_confirmFromState` exactly as `CONFIRM_DIV_WAIT` does. The R latch is single-shot; a blackout bar must not spend it.
- The setup survives for a fresh post-blackout confirmation, which is what that rollback already gives you.

Awaiting the E1/E2 run. Halt and report rather than substitute on any of the three halt conditions above.

---

STATUS: ISSUED (council session 2026-09-12, relayed verbatim by operator).
Filed by builder to `SRJ_FlowNexus_Local\01_TASKS\PACKET_P-SWINGIMB.md`.
Predecessors: P-TRIM-S2POLL (EXECUTED AND VERIFIED, RECON6); P-SL-IMBALANCE-A
(feasibility proved, predicate ruled here, superseded by this packet).
S1 pre-hash this session: EA 57B2F9D3 266664 B PASS (no writes since).
BUILDER STATE 2026-09-12: EXECUTED. RECON7 PASSED then SUPERSEDED (E2
apex-frame instrument defect, mine); RECON8-SWINGIMB PASSED
("Test passed in 0:53:07.405", 563338/3168): gates 1-6, 8-9 PASS —
SLIMB 432+39=471 + S5 10=10+0, avail 481/481, exposed-chosen 140/140,
apex 481/481 (s+FLOW_SHIFT_OFFSET), all identities verbatim, acceptance
d=0 except +481 SLIMB. Gate 7 WAIVER REQUESTED (indicator-OnDeinit tally
dropped at tester unload; EA-side evidence complete). Cross-tab: branch
⟺ obValid deterministic; VALID_NOIMB=296 all 1-swing today. New baselines
EA 786CBDFF… (276074 B), FlowLogic 4B1B024E… (64782 B). Full gates +
measured rule data in `06_HANDOFFS\BUILDER_RESULT_RECON8-SWINGIMB.md`.
AWAITING council verdict.
