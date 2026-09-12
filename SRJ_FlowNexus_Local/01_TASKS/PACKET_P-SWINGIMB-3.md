# PACKET P-SWINGIMB-3 — issued (council verdict session 2026-09-12: P-SWINGIMB-2 ACCEPTED)

RECON9-SWINGIMB2 is the new frozen baseline. Local commit cleared on gates
1-7. Do not hold this packet for the origin push — backup 0520417 plus tag
is sufficient custody, and credential refresh is operator-latency.

---

## Code-1 quoting restriction — LIFTED

`naAlive=0` over 51000 writes discharges the fail-open by measurement, not by argument. Code 1 may now be quoted as "remainder positively observed alive at the apex." Two boundaries stay attached: it is a measured fact over this window, not a theorem, so the token stays in the progress line; and `alive at apex` remains the semantic — never `alive now`.

## Q1 — adopt the exceeds idiom: YES

Builder recommendation adopted. The measured contradiction is decisive: 168 of 481 `slBase` values (16 same-turn ≤1pt, 152 tighter-direction) violate ruling (a) verbatim, "more extreme price level to place the SL," and ruling (b) verbatim, "wider stop, same method." A walk that is outward in slot index but inward in price is not the operator's rule. Both rulings fix the direction of movement in **price**, and index order is only a proxy that the data now shows to be wrong 35% of the time.

The idiom is the `SL_STRUCT` branch's own `exceeds` test against a running extreme, reused character-for-character. It introduces no new number — the 1-point separation is already this codebase's structural-distinctness limit in four places — and it brings the absorption semantics with it, which is what retires the 16 same-turn cases.

Three sub-rulings so the walk is fully specified and nothing is left to an else branch:

- **Anchor.** The chosen swing seeds the running extreme, regardless of its own flag. Same discipline as the live 2-swing branch's iteration-2 correction: the current turn anchors the walk and the qualification test applies to candidates, never to the anchor.
- **Extremity is structural, qualification is the flag.** A more-extreme swing updates the running extreme whether or not it carries code 1. The running extreme records how far price turned; the imbalance term decides only whether a turn may hold the stop. Count `extUpdatedByNonQual` so the alternative reading stays measurable without a rerun.
- **Zero-step case is explicit.** If the anchor itself carries code 1, the walk is length 0 and `slBase == slToday`. Ruling (b) walks further back only when the swing lacks an imbalance. `TEQB=0` in RECON9 is therefore suspicious and is covered by a gate below.

## Q2 — per-candidate side test: NO, with an assertion

Builder recommendation adopted, and the reason is worth recording because it is conditional rather than absolute. Under the extremity filter every candidate is strictly more extreme than the anchor, so the walk is monotone outward in price and cannot cross the entry. The side test is therefore redundant **given that the anchor is protective-side** — which both live branches already guarantee, buffer 27 through `obSwingSideOk` and the fallback through the Task-75 side guard.

That is an argument, not a measurement, so it gets a falsifier: print `sideViolations`, incremented whenever any of `slToday`, `slBase`, `slNuance` lands on the non-protective side of `slCurPx`. Gate it at 0. A nonzero count means the anchor assumption is wrong and the side test ships in the following edit — no reasoning required to discover it.

## Q3 — BASE_MOVED approved, and the defect class gets closed

Label approved. The recount from operands is accepted as measurement — the operands were truthful, so the partition needs no rerun: carve-held 106, BASE_MOVED 375, ALL3/TEQB/EXH/UNRES 0, skipSeen 302. It stands as the pre-filter measurement and is superseded as a verdict.

The instance fix is the label. The **structural** fix is that the class may no longer be produced by an if/else chain. Print the three relations as their own tokens — `todayEqBase`, `todayEqNuance`, `baseEqNuance` — and derive the class from a total mapping over all eight combinations, with `UNCLASSIFIED` occupying every cell you believe unreachable. A mislabel then requires a wrong table entry rather than a missing branch, and an unreachable cell that fires prints as `UNCLASSIFIED` instead of borrowing a neighbour's name. This is the same reason the contract enums carry explicit values with 0 as UNKNOWN: absence must be structural, never a plausible-looking default.

## Council finding — code 3 is 98% of history, and the walk will eventually reach it

`code3=49947 / 51000`. The predicate is unevaluable across nearly all exported history because `g_s.structLegBoundary` is unset before the bias engine initialises. In-window that is invisible — `f3=0/481` — and `exhausted=0` with `skipSeen=302` says no walk has reached that region yet. But the walk I just widened is unbounded outward, and a deeper walk on a thinner leg will reach it.

**Ruling: a code-3 encounter terminates the walk and is reported. It is never read as "no imbalance."** Add `code3Seen` and a class `WALK_UNEVALUABLE`. Treating code 3 as code 0 would silently walk past a swing whose qualification is unknown and place a stop further out on the strength of missing data — which is exactly the failure mode the five-value encoding was built to prevent.

---

# BUILD PACKET P-SWINGIMB-3

Three edits, print-only, shadow-first. **No selection may change.** RECON9's SLIMBWALK line is deliberately not diffable after E8; its operand recount is the pre-filter record.

## E8 — walk repair

1. Running extreme seeded from the chosen swing. Candidate qualifies iff it `exceeds` the running extreme by more than `_Point` **and** carries code 1. Reuse the `SL_STRUCT` expression form verbatim.
2. Code 0 and code 2 are walked past; both update the running extreme. Code 3 terminates.
3. Zero-step case explicit: anchor flag 1 → `slBase = slToday`, `walkSteps = 0`.
4. Carve-out predicate unchanged, operands still printed, body extreme still through `ApexShift`.
5. New tokens: `extUpdatedByNonQual`, `code3Seen`, `sideViolations`. Existing tokens keep their names and order.

## E9 — class totality

Replace the class derivation with the three-boolean total mapping above. Class set: `ALL3_EQ`, `TODAY_EQ_BASE`, `TODAY_EQ_NUANCE`, `BASE_MOVED`, `CARVEOUT_FIRED`, `WALK_EXHAUSTED`, `WALK_UNEVALUABLE`, `UNRESOLVED`, `UNCLASSIFIED`. Emit the three booleans as tokens beside the class so any future mislabel is recomputable from the log without a rerun.

## E10 — the R-cost table

The decision surface the operator was promised. `slBase` and `slNuance` are computed inside `ComputeSlReference`, and the R terms exist only at the S5 latch, so bridge them with instrument-owned file-scope shadows stamped with `barTime` and `site`, refusing a stale read.

**Hard boundary:** these are instrument globals. They do not join `ResetSequence`, they do not join the working set, no gate reads them, and `WS161 fields` stays **21**. A `fields=22` in the census is a packet failure, not a finding.

At `site=S5` only, one `SLIMBR` line per invocation: `entry`, `tp`, then `sl` / `R` / `deltaPts` for each of today, base and nuance, plus the class token. Ten rows expected, four of them the firing set.

## Gates

Full window, pilot ini unchanged, 3168 / 563338.

1. Both compile clean under `#property strict`.
2. All RECON9 identities verbatim — CQD 906, WS161 **21**/205/0, SLMEMO 471/118/589, SL_REF 432/39/10, INPLAYCOMMIT 157/46, MTEXIT 4, aborts 18/37/13/11/2/0/12, PROMO 469, CONFIRMPOLL 555, SUPPRESSED 156. Four-signal set verbatim.
3. SLIMB 481, 432+39=471, S5 10, avail 481/481, apex 481/481, chosen exposure 481/481.
4. SLIMBWALK 481. `UNRESOLVED = 0`. `UNCLASSIFIED = 0`. `sideViolations = 0`. Any nonzero halts with its operands.
5. **Cross-tab `chosenFlag × class`, reported in full.** Named falsifier: `count(chosenFlag==1 AND class==BASE_MOVED) = 0`. A nonzero count is the zero-step case still missing, and it invalidates every `slBase` on the run.
6. Post-filter partition reported against the pre-filter recount, with the 168 contradicting cases individually accounted — each either absorbed, re-resolved further out, or terminated.
7. `SLIMBR` 10 rows, four matching the signal set on `entry`, `tp` and today's `R` to the values already on record.
8. Sampled-day spot check: `INPLAYCOMMIT`, `XOBPROMO`, `SWEPTMASK` identical to RECON9.
9. New SHA256 + byte size both files. No commit until 2 through 8 pass.

Halt rather than substitute on gate 4 and gate 5.

## What closes after this run

`SLIMBR` is the last measurement the imbalance rule needs. If `deltaPts` is zero across the firing set, the ruled rule is already what the code does and the imbalance work closes with an export and no selection change. If the 207 wider-protective cases carry into the firing set with a material R cost, the operator sees that cost against his own rule before anything ships, and the selection decision is his. Either way the next packet is a decision, not another instrument.

---

# NEWS

Sequencing unchanged. The static event table draft remains the one parallel item — `{eventTimeET, kind}`, CPI/NFP/FOMC only, own SHA256, same timestamp anchor as the FOMC VWAP/POC — and it is human-latency, so it should be in front of the operator before the RECON10 run finishes rather than after.

---

STATUS: EXECUTED 2026-09-12 (RECON10-SWINGIMB3: Test passed in 1:08:58.374,
563338 ticks / 3168 bars; wrapper TIMEOUT_60MIN at 13:27:37, manual archive
16634 lines; gates 1-9 PASS per BUILDER_RESULT_RECON10-SWINGIMB3.md;
firing-set R cost stated, operator decision pending). Verdict requested.
Filed by builder to `SRJ_FlowNexus_Local\01_TASKS\PACKET_P-SWINGIMB-3.md`.
