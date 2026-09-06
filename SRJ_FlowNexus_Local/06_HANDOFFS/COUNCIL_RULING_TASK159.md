# COUNCIL RULING — TASK 159

Task 160's specification.

Extracted verbatim from 06_HANDOFFS\REVISION_62_CONSOLIDATED_HANDOFF.md, section 10.5
(the Task 159 ruling): the twelve contracts with amendments, the twenty adjudicated
packet items, the terminator attachment table, and the eight ordinal re-expression
rows. Task 160's Form B cites this file as its specification. Revision 62, section 18,
action 5.

---

### 10.5 The Task 159 ruling — Task 160's specification

**All twelve contracts APPROVED.** Amendments only.

| Contract | Amendment |
|---|---|
| `SObjectRef` | **Unamended.** A-3 §5.4's `relevanceTime` is the same field as `promotionTime` |
| `SXobRecord` | **Unamended.** All six of A-3 §5.4's named backing-XOB fields present |
| `SFvgRecord` | **+ `parentXobRef`**, resolved reference, `UNKNOWN` until Task 163 derives it from the leg. `CImbalance` does not carry it. P15 governs |
| `SStructuralBundle` | **+ `bundleId`** immutable, engineering. **+ `legToken`** immutable at binding **or UNKNOWN** — the cross-run form of `legBoundaryBarAtLatch`; keep both. **+ `oppFvgRefs[]`** — A-3 §5.4's `oppFvgIds[]` with detection time, direction, validation state. **This is buffer 36's population and it belongs on the bundle.** Capacity is an engineering safety limit in the 500-slot precedent |
| `SMarketSnapshot` | Unamended |
| `SCandidate` | **+ `divergenceVerdict`, `divergenceConsumedBar`, MOVED here from `SHypothesis`.** A-3 §5.4 puts the divergence latch at candidate level and the build agrees — `g_divLatch` resets at EA 2233 beside `g_anchorBarTime` and `g_sessionAtEntry`. **Consequence for Task 162: siblings SHARE the divergence latch.** §5.6's *"it inherits nothing"* governs hypothesis-level fields — bundle, opposing candle, confirmation, 2-of-3 — not the candidate-level shared set |
| `SHypothesis` | Four amendments, below |
| `SStopReference` | `unionExtremeComponents` **mandatory with `UNKNOWN`**. **+ `unionExtremeAvailable`** boolean, `false` until Task 131. `selectionCause` is a **six-member** enumeration; `src=` measures three of them at Tier 1 — `FALLBACK_SIDE` 86, `OB_SWING` 66, `FALLBACK_EMPTY` 1 |
| `STargetReference` | `zoneDependent` → **immutable identity at latch**. `selectionCause` is a **five-member** enumeration |
| `SPendingEntry` | **+ `fillMode`** ∈ {`WICK_RETURN_ONLY`, `MARKET`}, immutable at creation. **+ `noChaseDominant`**, derived. A-3 §5.3's no-chase pending fills on wick return **only** — a different fill rule, so it is stored, not recomputed |
| `SDecision` | Unamended. Phase B's window decline is a separate record, not a Phase A verdict |
| `SDiagnosticEvent` | Unamended in shape. The six terminator literals are in the terminator table below |

**`SHypothesis`'s four amendments.**

1. `divergenceVerdict`, `divergenceConsumedBar` → **moved to `SCandidate`.**
2. `confluenceLatches` / `confluenceCount` → **RENAMED `adverseLatches` / `adverseCount`, constituent set ESTABLISHED** from A-3 §5.13 and §5.1:

```text
adverseLatches.inBiasObInvalidated     latched setup evidence + SObjectRef   <- buffer 34
adverseLatches.inBiasFvgInvalidated    latched setup evidence + SObjectRef   <- buffer 35
adverseLatches.opposingFvgValidated    latched setup evidence + SObjectRef   <- buffer 36

adverseCount = count of true members       derived
2-of-3 rule:  adverseCount >= 2  ->  T1 fires
evaluated:    binding -> SC inclusive (rejection), SC -> fill (cancellation, §5.11)
```

Each carries an `SObjectRef`, **which is exactly what the three export buffers were built to supply.** The instrumentation detour turns out to have been building this field's evidence layer without the field being specified.

3. **The Part A §3.7 citation is withdrawn.** There is no "confluence" concept in the documents held. The 2-of-3 is the adverse triple. If Part A defines a separate positive-confluence set, it is a new open item and **Task 165 is not blocked on it.**
4. `zoneHi` / `zoneLo` → **reclassified from "RETIREMENT BLOCKED" to "derived from `bundle.xob`, supplied explicitly as a parameter."** Items 18 and 19 unblock it.

#### The twenty packet items

| # | Ruling |
|---|---|
| 1 | **APPROVED.** Scenario B's criterion is a bar-index relation against `legBoundaryBarAtLatch` as it stood on the binding bar. The bundle also carries `relevanceTime = xob.ref.promotionTime`; **cross-run scoring uses `relevanceTime`, never the bar index.** The latch is taken on a closed bar, satisfied by construction because `SMarketSnapshot.barClosed` is invariant-true on the EA path |
| 2 | **APPROVED**, superseded in scope by 19. A-3 §5.9 rules the one-swing branch must use the **union extreme of bound XOB and in-bias FVG**, and EA-108 establishes no buffer carries it. **The run's single signal took the one-swing branch (R-82, measured), so the record's only stop is wrong by §5.9** — independently of EA-145's instability and EA-177's unlatched close. Three defects on one field. `unionExtremeComponents` becomes mandatory-with-`UNKNOWN` plus `unionExtremeAvailable`, `false` until Task 131 exports it. **Corrected: the two-swing branch is not unreached — it fires 8 times, none on the signal** |
| 3 | **APPROVED, scope condition DISCHARGED** by open item 19 |
| 4 | **APPROVED for the EA side, EXTENDED for the tree.** HEADS-UP and STAND-DOWN become `SDiagnosticEvent` kinds and lose their emission path; SIGNAL moves to Phase B; the emitter takes the hypothesis as an argument. **The indicator's five dispatch sites stay and are out of Phase A/B scope by subject matter** — they announce market-structure facts, not candidate commitments. **Milestone 5's census is EA-only** |
| 5 | **APPROVED, now specifiable.** A-3 §5.3's no-chase test **dominates and is evaluated first**, so P4 is reachable only when `worse_price` is false. Ordering: no-chase → if worse, P1 creates at `P_dc` **wick-fill-only** and P4 is unreachable → if not worse, compute `R_dc` and `R_sc`, and P4 fires only when `R_dc > R_sc` and `R_dc` is valid. Superseded record latches `cancellationReason = SUPERSEDED_BY_BETTER_R` |
| 6 | **APPROVED**, quotable verbatim from A-3 §5.20. B4 is measured behaviour-neutral on the current signal set — no Tier 2 signal sits at 11:55 or 18:55 — so **its first live run should show zero declines and that zero is a result** |
| 7 | **APPROVED.** A-3 §5.1: *"the S3→S4 arming transition IS the binding point"* |
| 8 | **APPROVED, corroborated by measurement.** A-3 §5.6's *"a rejected setup consumes nothing"* plus zone `1.15794–1.15813` arming three times on 08.18 from three different candidates — reproduced at Tier 1 |
| 9 | **APPROVED**, with the re-expression table below |
| 10 | **RULED IN FULL. Open item 6's terminator half CLOSED.** Table below. Three corrections to Rev 60 §10.3 |

| 11 | **APPROVED.** `lastValidObserved` separates EA-145's two readings; `lastFilledObserved` makes A-3 §5.15's forgetting rule observable rather than asserted |
| 12 | **APPROVED, both claims, and there are THREE vocabularies not two.** The EA's three-member window; `SRJ_GetSessionId`'s five-member session; and a **buffer-level** encoding — buffer 18's sweep tag `1`=AS.H … `8`=PM.L plus buffer 29's 14-bit mask, bits 0–9 swept per `sessbufs[]`, bits 10–13 live per Asia/London/NY/PM. **No two of the three may be compared** |
| 13 | **RULED: state the bound and stop. Do NOT establish array ordering.** Task 163 records `GONE` with `resolvedBar` and both last-observed fields, and states in source that FVG-path `GONE` chronology is `UNKNOWN`. No Form D |
| 14 | **NOTED, informational, independently corroborated.** A-3 §5.8's own wrapper — `LoadWorkingSet` / `HypothesisCascade` / `StoreWorkingSet`, *"zero return-site edits"*, signature migration withdrawn — matches Task 161's drafted adapter exactly |
| 15 | **CHOICE MADE: the instrument, smaller than drafted.** `selectionCause` is a five-member enumeration. Causes (702) mask and (708) tier are **already instrumented** by the existing `SWEPTMASK`/`TPCENSUS` pair. The other three — 617 empty/non-positive, 619 direction, 631 zone containment — live in `TpTargetUpdateBest`, 22 lines, and need **one print**, print-only, byte-identical gate, Task 144 pattern. Until it lands those three are `UNKNOWN` and `NO_TP_TARGET` may not be read as *"no structure existed"* |
| 16 | **SPLIT THREE WAYS, and the §3.7 citation was wrong.** Rev 56 §5.18 quotes §3.7 directly: two exclusions only — *"already swept as session liquidity"* and *"closed over"* — and it explicitly accepts movement. §3.7 is the **target-admissibility** section. Session-swept (EA 649) **RULED CORRECT**; session-live (EA 655) **NOT IN §3.7, requires R-Q12**; POI anchor-tier (EA 708) **NOT IN §3.7 and §3.7 does not exclude POI lines at all — newly unattributable.** Scenario G cannot be scored until R-Q12 returns. The comment at 670 remains inadmissible as classification |
| 17 | **RULED: the test's content is admissible; the ASYMMETRY is the defect.** A-3 §5.1's completion test enumerates *"bound bundle valid, opposing candle, DC, divergence, valid stop reference, valid target, ≥1R… and an execution bar inside a trading window."* Zone containment is not among them, but a target inside the entry zone is degenerate under any reading. **The test becomes unconditional via items 18 and 19 — same rule, both sides, one meaning.** Pre-binding it is vacuous by construction, not by a zeroed global. **Now measured on both halves (R-88): pre-binding zones are literally 0.0 on every sampled line; post-binding four `site=S5` evaluations carried live zones and had nothing to reject** |
| 18 | **YES — made explicit rather than ambient.** `TpTargetUpdateBest` takes the zone as a parameter. Pre-binding the caller passes an **explicit absence**, not `0.0`. Post-binding it passes the bundle's zone. `zoneDependent` becomes **immutable identity at latch**. §5.35's split strengthened: the **admission** target is hypothesis-owned and zone-dependent; the **post-fill** target is position-manager-owned and **not** zone-dependent, because after fill the zone is spent. **Zone retirement UNBLOCKED on the target side** |
| 19 | **YES — same treatment.** `ComputeSlReference` takes the zone as a parameter; both guards become unconditional with an explicit-absence zone pre-binding. On `selectionCause`: **`src=` is already in the build and covers every one-swing call at every site — 153 of 153, exceptionless.** The required print targets **the two-swing branch, which has no selection-cause instrumentation at any site** (R-83, R-91). Population: eight evaluations, all `site=S2POLL`, all `obValid=0`, dated 08.18 and 08.21. **Zone retirement UNBLOCKED on the stop side** |
| 20 | **RESOLVED AS INTENT, and EA-176 is PARTIALLY RETRACTED.** A-3 §5.9: *"Two-swing walk is the only branch that may land inside the zone."* The **zone guard's** absence on the two-swing branch is **ruled correct**. The **side guard's** absence is **not** covered — a stop on the wrong side of the entry reference is not a stop. That half stands. **Task 166 does not repair the zone-guard absence.** Recorded: no measured instance of a two-swing stop landing inside its zone; A-3 §5.9's permission was not exercised at Tier 1 |

#### Terminator attachment, ruled — three corrections to Rev 60 §10.3

| Terminator | A-3 §5.10 text | Attaches to | Diagnostic literal |
|---|---|---|---|
| **T1** | bound structure invalidated | **any bound state, H1 → P8 inclusive.** Rejection before SC, cancellation after (§5.11). **NOT S5-only** | `TERM_T1_STRUCTURE_INVALIDATED` |
| **T2** | bias flips against direction | **same span.** §5.11 names it a pending-entry cancellation too | `TERM_T2_BIAS_FLIP` |
| **T3** | TP or SL reached before fill | `SPendingEntry` edge **P6** — pre-attached, confirmed | `TERM_T3_REACHED_BEFORE_FILL` |
| **T4** | divergence validates at entry or better → **execute** | **NOT A TERMINATOR.** Edge **H6**, then Phase B's §5.20 test | `ADV_T4_DIVERGENCE_CONSUMED` |
| **T5a** | target level no longer valid | `HYPOTHESIS_WAITING_TARGET_VALIDITY` | `TERM_T5A_TARGET_INVALID` |
| **T5b** | RR no longer satisfied | `HYPOTHESIS_WAITING_RR` | `TERM_T5B_RR_FAIL` |

**Correction 1.** §10.3's H9 listed T4 among its rejection triggers. Wrong — T4 advances.
**Correction 2.** §10.3 scoped T1/T2 to the S5 states. A-3 §5.1 puts the 2-of-3 at binding→SC inclusive and §5.11 extends it to pending-entry cancellation, so **T1 and T2 span H1 through P8** as one rule expressed as two edges.
**Correction 3, the payoff.** **The build's T5 is two terminators sharing one abort path** — `ABORT_NO_TP_TARGET` at 2894 and `ABORT_TP_RR_FAIL` at 2917, both above the divergence check at 2921. That is the mechanical justification for the three-way `ST_S5_GATE_CHECK` split, from source rather than drafting preference.

**And `HYPOTHESIS_WAITING_DIVERGENCE` has no terminator of its own.** Its only exits are T4 and the two global adverse edges. So a `SESSION_CLOSED` death at S5 with `divLatch=0` is **always** the divergence state — which makes the Tier 2 fixture (`wouldHold=1`, 1 instance across 5,472 bars) attributable for the first time.

#### Item 9 — the eight ordinal sites, re-expressed

| Line | Expression | Becomes | Owner |
|---|---|---|---|
| 1426 | `!= ST_IDLE` | a candidate exists | candidate registry |
| 1727, 2124, 2172 | `> ST_IDLE && != ST_ABORT` | a live non-terminal candidate exists | candidate registry |
| 1788 | `>= ST_S3_ZONE_WAIT && <= ST_S5_GATE_CHECK` | **spans the binding point → TWO tests** | candidate OR hypothesis |
| 1924 | `>= ST_S2_LTF_ALIGN && < ST_S4_ARMED` | pre-binding only | candidate only |
| 1931 | `>= ST_S4_ARMED && <= ST_S5_GATE_CHECK` | post-binding only | hypothesis only |
| 1937 | `>= ST_S2_LTF_ALIGN && <= ST_S5_GATE_CHECK` | **spans → TWO tests** | candidate OR hypothesis |
| 2005 | `>= ST_S1_REGIME` | any candidate past admission | candidate only |

**1937 is the one that matters.** It encloses Task 142's only permitted site at 1946 **and** `ComputeSlReference`'s S2 poll at 1949. Re-expressing it touches two queued tasks. **`160-PreK` STAGE 6b decides whether this is a rewrite or a renumbering** — whether the comparisons rest on declaration order or on assigned enum values.
