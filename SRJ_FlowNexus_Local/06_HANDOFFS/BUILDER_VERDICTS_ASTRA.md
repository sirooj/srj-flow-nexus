# BUILDER VERDICTS — GPT Astra 6 stream (dual-rule process, one file per source)

## VERDICT Astra-1 2026-09-13 — P-ORIGIN-1 ISSUED (answers relay v10)

# P-ORIGIN-1 — ISSUED
**Print-only origin/provenance investigation; no selection change**

Issued on the supplied relay record. The reported closures below are accepted as entry evidence, not represented as independently inspected artifacts.

## 1. Authority and fixed boundaries

- **Frozen baseline:** RECON17, identified by the EA and FlowLogic digests in §1 of the relay.
- **Instrumentation base:** dormant local-only Rev075, identified by its EA digest in §1. This packet does not promote it to baseline.
- **Window:** 2026.08.26–09.10; expected coverage 3168 bars / 563338 ticks.
- **Mode/feed:** alert-only; Dukascopy throughout. Every HAND figure must carry its feed tag.
- **Selection:** unchanged. `InpAdoptExt1=false` throughout. No push, adoption, stop replacement, or threshold change; take iff R ≥ 1.0.
- **Identity:** `slot + barTime + px + imbCode`. Rung index is derived diagnostic output, never a key.

E49 restoration and its predicted **OFF_LADDER=2 / EXT_NONE=2 / OCCUPIED=0** split are **DONE on the supplied closure record**. Reference that evidence; do not spend a separate run reopening it.

Sep-8 feed/rule-consistency entry condition is likewise **MET on the supplied provenance record**. Do not reopen the contamination or fixed-distance branches.

## 2. Candidate and per-site origin declaration

**Candidate: recorded HAND entry origin (“his-entry origin”).**

For each HAND example, bind the candidate to that example’s previously recorded entry event and the exact origin fields consumed by the relevant computation. Do not substitute the HAND stop’s swing timestamp, a later alert, a memo writer’s timestamp, or whichever origin happens to reproduce the target.

Before the diagnostic run, freeze a **site-origin manifest** covering every relevant computing site, memo writer, and memo reader:

| Required field | Declaration |
|---|---|
| Site | Stable site ID and source location/function |
| Role | Compute, memo write, memo read/HIT, or reporting |
| Existing binding | Actual origin expression and resolved origin fields |
| Candidate binding | Exact mapping from the frozen HAND entry record to the computation’s origin inputs |
| Memo relationship | Writers/readers reachable from this site |
| Missing binding | Explicit diagnostic failure; no fallback |

The HAND entry is a semantic binding, not permission to guess an unspecified code field. Missing or ambiguous source-to-origin mappings block execution until declared.

Existing production computations retain their existing origins. Evaluate the candidate only in an **isolated diagnostic path**, with no writes into production memo state and no output consumed by selection. Provenance tags may be sidecar instrumentation; they must not change memo keys, lookup behavior, or replacement policy.

## 3. Regression gate — execute first

Freeze the **five already-reproducing HAND examples** from the existing record before execution. For each, record:

- Existing example/reference ID and Dukascopy feed tag.
- Recorded HAND entry and the resolved candidate-origin fields.
- Expected full identity: `slot + barTime + px + imbCode`.
- Expected stop price and the existing residual definition, units, and sign convention.
- Prior reproducing evidence reference.

No example substitution, omission, revised target, or post-result origin rebinding is permitted.

Re-grade all five under the declared candidate, printing expected versus observed origin, full identity, stop price, and residual.

**Pre-declared gate: PASS only if all five retain full identity match and resid 0.** A missing or ambiguous match is a failure, not a zero residual.

**If any example moves or fails, the candidate dies at this gate. Do not execute or score the Sep-8 candidate tests.** Preserve the failure evidence; any alternative origin requires a newly issued declaration.

## 4. Memo provenance and count reconciliation

At **every relevant memo write**, record:

- Run/event ID, memo key, and write/generation ID.
- Computing site and memo-writing site, separately if different.
- Actual computing-origin binding and resolved fields.
- Stored result identity and diagnostic payload needed to trace its use.

At **every HIT**, report:

- Requesting site and its requested origin.
- Stored computing site and stored computing-origin binding.
- The particular write/generation supplying the value.
- Memo key and returned identity.
- An explicit origin/site agreement or disagreement classification.

Do not infer stored provenance from the reader. Do not treat a disagreement as permission to invalidate the cache, recompute production values, or alter selection.

For **481 versus 471+10**, provide a row-level reconciliation:

1. Define the counting unit, scope, and inclusion rule for each population.
2. Identify the 481 records and their membership in the proposed 471 and 10 partitions.
3. Demonstrate disjointness and exhaustive coverage, with zero unexplained duplicates or omissions.
4. State what the 10 actually represent; do not assume they are the ten stop comparisons merely because the counts coincide.

An arithmetic equality alone does not close this item. If the populations use different counting units, print the explicit relationship and reconciliation instead of asserting a partition.

**Provenance closure gate:** every relevant HIT is traceable to its supplying write and origin; all count differences are explained. Missing tags or unexplained records leave this item open.

## 5. Sep-8 forward prediction — only after regression PASS

Freeze these two targets before executing their candidate tests:

| HAND target | Feed | Expected stop swing |
|---|---|---|
| London second-swing placement | Dukascopy | 2026.09.08 09:40 at 1.16258 |
| NY second-swing placement | Dukascopy | 2026.09.08 16:20 at 1.16274 |

Attach each target’s existing entry record and full identity from the frozen evidence. Missing identity fields must be resolved from that evidence before execution, not filled from candidate output.

Apply **the same declared origin and diagnostic rule that passed the five-example gate**. Declare the executable interpretation of the documented second-swing rule before testing; no London/NY-specific repair, target-driven rung search, or retrospective rule adjustment is allowed.

The known ladder presence is corroboration only. It is **not** a forward-prediction success criterion. In particular, operator “second swing” must not be equated to `rungExt 1`: the supplied record places these levels at ext-index 0 and unindexed −1.

**New forward gate: PASS only if both candidate predictions independently produce resid 0 and the frozen full target identity.** Price-only agreement, merely finding the target somewhere in the ladder, or matching only one example is insufficient.

E46 residuals **−7/+85 remain the closed historical record**. Label these new results separately as P-ORIGIN-1 candidate results; do not overwrite, re-grade, or reinterpret E46.

## 6. Inertness, disposition, and suspension

Repeat the established inertness checks against the appropriate unchanged reference: **481/481 × 3 and 10/10, zero mismatch**, with clean joins and unchanged production identities. Diagnostic logs may expand; production behavior may not.

Report regression, provenance reconciliation, Sep-8 forward prediction, and inertness as separate gates. A regression failure makes Sep-8 **NOT REACHED**, not failed or passed. Complete closure requires all required gates to pass.

**The suspended run-B adoption delta remains suspended, not withdrawn, and untouched.** Do not rerun, re-derive, amend, or activate its four changed firings or its NEW Sep-4 10:40 SHORT R 1.21 under this packet.

**Issuance authorizes only the bounded instrumentation and diagnostic execution above. Even a complete PASS grants no adoption or selection-change authority.**

## VERDICT Astra-2 2026-09-13 — P-ORIGIN-1 outcome (answers relay v11)

## Council ruling — HALT AFFIRMED

**On the supplied record, accept P-ORIGIN-1’s diagnostic outcome; reject the candidate for advancement.** This is a ruling on the reported evidence, not independent verification of the archives or digests.

### 1. Kill accepted; Sep-8 NOT REACHED

The controlling result is **five regression rows, two MATCH, three MISS** (`rows=5 fail=3`). The heading “FAILS 2/5” should therefore read **“matches 2/5; fails 3/5.”**

The predeclared gate required retention of the currently reproducing identity. The candidate failed that gate and is dead under this issuance. Sep-8 was **gated out and unscored**, not a further failure, success, or partial validation. E46 −7/+85 remains the closed record.

The reported provenance closure and inertness PASS are accepted as separate diagnostic findings. They support attribution and noninterference; they do **not** rescue the origin rule.

### 2. R5: retain demand stands for this test

The Dukascopy HAND R5 result establishes a meaningful distinction:

- The diagnostic candidate exactly reproduces the **filed stop price and time**, 1.16239@16:15.
- Its skip-witness reproduces the documented 16:30 skip.
- It nevertheless misses the **retained identity** required by the frozen gate.

Accordingly, R5 supports implementation fidelity for that documented walk and exposes a potential conflict between two validation objectives: **retain the reproducing identity** versus **reproduce the filed stop**. It does not authorize substituting the latter objective after observing the result.

**No reopening of this test, no retroactive regrade, and no tolerance waiver.** Whether retention is the right criterion for a *future* test remains a specification question. Even changing R5’s criterion alone would leave R1 and R4 unresolved.

### 3. Next direction — DECLARED

**Accept that the documented second-protective-fractal-swing-back rule does not generalize across this five-example regression set. Keep HALT in force.**

Scope matters: the evidence rejects **this frozen rule** as a common explanation. It does not establish that *no possible* time-ordered rule could explain the five examples. “The five share no one time-ordered rule” is broader than this experiment supports.

This ruling issues:

- **No alternative origin rule.**
- **No per-trade exceptions or rule assignments.**
- **No further build or run authorization, including print-only work.**
- **No revival or re-derivation of the suspended run-B adoption delta.**

A future issuance would need to declare, before testing, the authoritative validation target—retained identity, filed stop, or an explicitly specified relationship between them—and an independently justified rule. R5 is evidence to preserve for that specification decision, not permission to infer one.

**Disposition:** provenance closed as reported; inertness passed as reported; origin candidate rejected; Sep-8 not reached; baseline unchanged. The origin explanation remains unresolved.

## VERDICT Astra-3 2026-09-13 — v12 disposition (answers relay v12)

## Council disposition — v12: adopt finding and close

**Select option 2. HALT AFFIRMED. No D3 proposition or execution packet issues.** This disposition assesses the supplied relay; it does not independently verify the referenced files, digests, or desk-work record.

### D1 accepted as clarification, not regrade

The filed-based comparison still fails at R1 and R4, so replacing retained prices with HAND-filed prices does not rescue the killed candidate.

R5’s filed barTime resolves the stated carriage unknown and supports evidence beyond price-only. It does **not** establish the complete identity tuple, authorize regrading, or reopen the candidate. The standing identity remains `slot+barTime+px+imbCode`; rung index is never a key.

### D2 accepted as description, not an exclusion rule

R1 is a clear depth outlier within the reported set. That observation does not independently justify excluding it.

**Council authorship cannot make a now-informed cutoff prospective.** We have already seen both the residual failures and the depth distribution. Selecting a threshold that removes R1 would therefore be a post-hoc hypothesis, not an independently justified eligibility criterion—even if written before another diagnostic.

Moreover, removing R1 alone leaves the reported R4 filed-price failure. D2 supplies no independently justified rule resolving that failure.

### Adopted finding

> On the supplied record, “second swing” as documented does not generalize across the required cases. No supported rule has been established that fixes origin without discretionary selection; origin therefore remains an undeclared free parameter in this proposition. Verdict-#8 HALT stands unchanged. Sep-8 remains gated, unreached, and unscored under the declared process. The origin investigation is closed pending an independently justified new rule.

“Unreachable” here is a statement about the **declared process**, not proof that every possible future rule must fail.

### Standing boundaries

- The candidate remains **DEAD**; retain stands. No reopening of closed findings.
- The R5 retained-versus-HAND discrepancy remains an open **baseline bookkeeping issue**, not permission to change the baseline.
- Run-B remains suspended and untouched.
- The per-trade ban and no-build constraint remain in force. **No build, run, token, or push is authorized.**

Any future reopening requires independent justification for an origin rule and any exclusions, followed by a jointly authorized packet with a prospective gate and evaluation that explicitly accounts for the already-inspected cases. **This disposition is not that packet.**

## VERDICT Astra-4 2026-09-13 — v13 planning (answers relay v13)

## Council disposition

**Both, with A amended.** Test a direct fractal-stop interpretation and investigate signal presence in **one combined print-only run**. Do not revive the walk/origin proposition.

The failed diagnostic establishes a mismatch between that machinery and the operator’s examples. It does **not** establish inconsistency in his rule. Equally, a replacement should not be called a verbatim implementation until its operative meaning has been fixed.

**This response is planning approval from this stream, not dual-key clearance. The standing HALT remains until the prerequisites below are satisfied and both streams explicitly clear the same packet.**

## Ask 1 — The path

### A: direct fractal-stop shadow, with its interpretation frozen first

“Second fractal extremity outward from the entry bar” introduces an interpretation not fully specified by “EXACTLY two swings away.” Before building, freeze:

- Which triangle-marker definition supplies the swings.
- Which swings are eligible for each side.
- Where counting starts, in what order swings are counted, and how ties or coincident markers are handled.
- When a swing becomes available to the decision surface, including fractal confirmation and any repainting behavior.
- Whether the entry decision uses a closed bar or an intrabar event.

Use existing authoritative records wherever they settle these points. Where competing interpretations remain, ask only concrete **yes/no bar+price questions** that distinguish them. Do not ask the operator to design an algorithm or annotate a new chart set.

The resulting implementation must contain **no walk, imbalance filter, depth adjustment, or example-specific exception**. Code slot and imbalance metadata may remain in provenance; they must not become additional stop-selection conditions.

### B: decision-surface presence probe in the same run

Instrument the evaluation path **before rows can be suppressed**, not just the existing 481-row output. At S1 and S2, report:

- Whether the relevant bar was processed.
- Whether a SHORT candidate was generated.
- Which sides were evaluated.
- Candidate count and the first exclusion point for any rejected SHORT.
- Relevant structure, entry, target, and side-state inputs at that point.

If no SHORT candidate is generated, trace that absence to its earliest observable cause. A repeated “no row” result is not a completed presence diagnosis.

This is a probe, not permission to force those trades into the candidate set.

## Ask 2 — The five-example gate

**Yes, for validating the stop-selection component in shadow; no, as sufficient evidence for adoption or the complete trading goal.**

Exact **barTime+price** is an acceptable comparison against HAND-carried evidence. HAND slot equality is neither available nor required. Record the selected code slot for provenance, and report any identity ambiguity rather than declaring full identity proved.

However, the reference table must be frozen before the run:

- **R2:** its stop-bar time is absent from this relay. Recover it from authoritative material, or obtain a concrete yes/no confirmation.
- **R5:** the filed `1.16239 @16:15` and retained `1.16238 @16:05` are different references. The stated depth also uses a different time basis from the filed bar. Preserve that distinction explicitly.
- **All five:** normalize instrument, year, timeframe, timezone, and price precision.

**“Four exact, one absorbed” cannot be converted into “five exact.”** If the filed R5 reference remains authoritative, it is the exact-match target. A miss means the implementation/reference mapping has not passed—not that the operator’s rule is inconsistent.

A missing reference makes the gate **not evaluable**, not passed. Resolve it before spending the run.

## Ask 3 — Must presence come first?

**Not before shadow validation of the stop component. Yes before declaring the overall selection goal met.**

The five mapped examples may validate stop selection while S1/S2 remain a named presence failure. The permissible conclusion is:

> Direct stop selection matches the five frozen mapped examples; the seven-example selection goal remains unmet because Sep-8 presence is unresolved.

Do not shorten that to “stops are solved.” Five positive examples establish agreement on those examples, not correctness everywhere or the absence of extra selections.

## Ask 4 — Preconditions and gates for the single run

After the interpretation and reference table are complete, both streams may explicitly clear **one print-only build and full-window run** with these gates frozen:

| Gate | Predeclared requirement |
|---|---|
| **Isolation** | Adoption remains off. No live selection change, execution, commit, or push. Existing protected baseline digests and selection outputs remain unchanged. |
| **Rule fidelity** | One common fractal-stop algorithm for both sides; no walk, imbalance requirement, depth discriminator, or per-example override. |
| **Causality** | Each shadow-selected swing was available at the actual decision time. Future-confirmed or retrospectively revised markers cannot silently enter the decision. |
| **Mapped-stop agreement** | R1–R5 each match the frozen authoritative stop barTime+price exactly. No absorption or post-run reference substitution. |
| **Decision accounting** | For each mapped example, print side, signal/entry bar, entry, target, stop, raw reward/risk, and threshold result. Apply `R >= 1.0` without deciding from a rounded display value. Identify unchanged inherited inputs separately from newly validated ones. |
| **Presence diagnosis** | S1/S2 each receive a complete pre-suppression trace establishing whether the required SHORT exists and, if absent, where it is first lost. |
| **Window census** | Account for all 481 baseline evaluations, plus pre-suppression opportunities outside that row set. Report stop changes, unavailable/invalid stops, reward/risk shifts, and shadow selections gained or lost against baseline. Census counts are descriptive, not proof of operator agreement. |

The packet must predeclare how unavailable swings, ambiguous identities, and invalid risk geometry are reported; none may silently fall back to the old stop blend.

### Result disposition

- **All stop gates pass, presence remains absent:** mapped stop-component pass; overall selection remains incomplete.
- **Stops pass and both Sep-8 signals appear in shadow:** assess all seven against available side, entry-bar, stop, and target references. Missing target evidence remains an evidence gap.
- **A fidelity, causality, or exact-match gate fails:** the tested implementation does not pass; no post-hoc tuning or automatic rerun is authorized.
- **Baseline isolation fails:** reject the run as valid print-only evidence and halt.

This produces a decisive result for the tested selection proposal in one run. It does **not** pre-authorize adoption: the census lacks operator labels for additional or missing trades across the window.

**Next authorized action: complete and freeze the packet’s semantics and references. No build/run clearance yet; dual-key clearance must name that completed packet.**

## VERDICT Astra-5 2026-09-13 — v14 clearance (answers relay v14)

**This stream CLEARS named packet P-SEL-1 (E51–E56) for ONE print-only build and full-window run, with the binding decision-point clarification below. This is one clearance key only—not joint clearance and not adoption authority.** The other stream must explicitly clear the same scope and convention before work starts.

### Ask 1 — G1 reshape: APPROVED

G1 is exact **4/4 on R1/R3/R4/R5**, matching both stop barTime and price with one eligible variant.

R2 remains:
- A **must-decline anchor**: any branch taking it receives an adoption-blocking finding, not a run halt.
- Stop-only evidence against the operator’s **conditional 1.16299** reference. Its 09:30 timestamp remains CODE-side only and cannot become an operator-confirmed identity.

R5’s sole stop target is **1.16239 @16:15**. The retained code-under-test value is not an alternative acceptable match.

### Ask 2 — CQD scoping: APPROVED for observation only

Approve the frozen-CQD desk-check at R2 and CQD-state printing at all seven evaluation points. Distinguish the operator’s CQD-invalid ruling from what the unchanged repository actually computes; neither substitutes for the other.

**No separate CQD fix packet is required to execute this diagnostic packet.** Any proposed repo-CQD modification requires separate authorization. P-SEL-1 must not repair CQD or override its outcome to manufacture R2’s decline.

### Ask 3 — H1 accepted; decision point clarified

**H1 is accepted as a predeclared alternative**, not a fallback introduced after inspecting M5 results. Record the complete variant matrix before running; no post-result amendment within this authorization.

**“Eval-close” means the close of the signal/evaluation bar immediately preceding the referenced entry—not the close of the entry bar.** For S1/S2, anchor evaluation to the decision instant producing the referenced entry opportunity; do not silently reinterpret the supplied time as permission to use that bar’s completed OHLC.

Apply these constraints:
- Availability uses only information available at that decision instant, including H1 confirmation status.
- Preserve the actual source-fractal timestamp; no timestamp relabeling to obtain a match.
- A variant admitting unconfirmed fractals remains G1-ineligible even if its selected stops happen to be confirmed on these examples.
- If the logged time convention cannot be resolved from existing evidence, report the ambiguity; do not assume a favorable mapping.

### Ask 4 — Named clearance: GRANTED within that scope

The frozen gates stand. For avoidance of a disposition conflict, **G2 disagreement blocks later adoption but does not erase a valid G1 stop-component pass**; otherwise “G2 reported, not blocking G1” would have no effect.

No G1 passer means packet dead: no tuning or rerun. Isolation failure means rejected evidence and halt. Multiple G1 passers mean no winner declared. Missing Sep-8 presence means selection remains incomplete.

**Build/run remains locked until the second stream explicitly clears P-SEL-1 with this same decision-point convention.**

## VERDICT Astra-6 2026-09-14 — v15 clearance (build-2 + one rerun)

**Council disposition — v15**

**Ask 1: CLEAR build-2, narrowly scoped.** Permit only the specified `SEL52CTX` repair: pass `site` as the third argument to that one `StringFormat`. Before compilation, verify the source diff against cleared build-1 (`44D0923B…`) contains exactly that change. No logic, gate, scope, or other instrumentation changes. Record the resulting build’s identity; this clearance does not assert that the compiled binary remains bit-identical.

**Ask 2: CLEAR exactly ONE rerun, conditional on operator assent.** Use build-2 with the same ini and range. Clearance permits the run; it does not commit HIS time or authorize starting without his decision.

**Evidence standing:** RECON20-SEL1 remains **BLOCKED / incomplete**. `DONE=UNDETERMINED` is not success. Retain the reported E55 findings and partial measurements with their stated qualifications; G1/G2/G4/G5 and the isolation join remain unevaluable. No gate verdict is issued.

**Stop condition:** If the authorized rerun repeats the freeze → agent-death pattern without `Test passed`, return an infrastructure relay. No third run is authorized by this clearance. Agent-death cause remains unknown.

This is scope clearance based on the relay, not independent verification of the on-disk diff, hashes, or logs.

## VERDICT Astra-7 2026-09-14 - v16 result (answers relay v16)

## Council response to v16 — this stream’s ruling

**CLOSE P-SEL-1 as DEAD. No execution or snapshot authority granted.** This ruling accepts the measurements reported in the relay; I have not independently inspected the governing result file or journal. It supplies **one stream’s key only**, not dual-key clearance.

### Ask 1 — G1 FAIL stands

**Confirmed on the reported record: a machinery verdict against P-SEL-1’s frozen eligible variant space, not an observed data or harness failure.**

The completed run, defined cells, reported census, and passing RECON17 isolation join support accepting the result. No eligible variant satisfies the required **4/4 exact barTime+price matches**; the best is 2/4. G3 is therefore moot, and neither the monotone prediction nor O1≡O2 rescues the packet.

Two distinctions remain binding:

- **R4 is independently fatal:** every eligible variant misses it. The **10-point / 20-minute discrepancy describes the reported M5 result**, not a common discrepancy across all 24 variants; H1 produces a different miss.
- **R5 remains filed-authoritative:** matching the retained code stop earns no G1 credit. “Missed by design” explains the outcome but does not waive the gate or permit target substitution.

This rejects the tested selection machinery. It does **not** establish that the hand references are unreconstructible under every possible rule.

The missing edit-session backup remains a disclosed provenance limitation. This ruling neither upgrades the verification to a fresh byte-diff nor treats that limitation alone as grounds for another run.

### Ask 2 — next direction

**Close the P-SEL-1 selection search. A narrowly scoped, evidence-only R4 geometry packet is warranted for separate design consideration—not authorized for execution here.**

Its question should be: **What observable distinction makes the filed 08:40 triangle the second qualifying swing at R4’s decision instant, rather than the code-selected 08:20 triangle?**

A proposed packet should specify existing evidence needed to establish triangle identity, timestamp convention, confirmation availability, and counting order. It must preserve the exact-two-swings rule and forbid retrospective fitting. If existing records cannot answer the question, report the gap; do not silently convert scoping into instrumentation or a rerun.

**H1 earns no preferred standing from this result.** Its tested forms failed G1. Filed-versus-retained bookkeeping may be clarified separately, but must preserve both identities and cannot regrade R5 against the retained stop.

Any follow-up requires a separately frozen packet and fresh dual-key clearance, plus operator authorization where required. The v15 one-rerun assent is spent.

### Ask 3 — nothing commits

**Confirmed.** RECON17 remains frozen; build-2 remains uncommitted. No build, rerun, tuning, commit, push, or snapshot token is authorized. Records wait for the next authorized snapshot.

**Disposition: P-SEL-1 DEAD; failure gate enforced; await the other stream’s ruling.**

## VERDICT Astra-8 2026-09-14 - v17 clearance (answers relay v17)

## Council response — v17 / P-SEL-2

**Disposition: CLEAR named packet P-SEL-2 (E57–E59), with the scope clarifications below, for ONE print-only build + ONE full-window run.** This is this response’s clearance only—not a claim that both streams have cleared. Execution remains blocked until both streams explicitly clear **P-SEL-2 BY NAME** and the operator authorizes the stated ≈1-hour cost.

This review relies on the supplied relay; it does not independently verify the filed forensic record or source lines.

### Ask 1 — Scope accepted, with clarifications

- **R4:** E57/E58 address the right unresolved boundary: whether 08:40 is absent from the shadow’s consumed list or present but passed over by the walk. Do not promote the existing “counting/ordinal side” finding into a specific mechanism before that separation is observed.
- **R5:** Trace the actual encounter and disposition of 16:15 and 16:05. Distinguish encounter order from filtering or other existing selection behavior; do not infer the reason from the final selected stop alone.
- **S1:** Retain as a same-selection-path sample, with its notional-context qualification intact.
- **R1/R3:** Retain as controls. Agreement with HAND is context, not a diagnostic acceptance gate.
- **S2:** Accept exclusion from **E58**, but correct its rationale: `TARGET_UNSTATED` prevents complete target/R adjudication; it does **not** inherently prevent tracing stop selection. Its omission is an explicit scope limitation. It remains included in E57.
- **R2:** Likewise state explicitly that it is included in E57 but outside E58’s selected trace sample. Its frozen MUST-DECLINE expectation remains unchanged.

**Instrumentation constraint:** E57 must print the actual bounded list consumed by the walk—not a reconstructed or independently filtered approximation. E58 must associate each scanned event with its actual disposition and applicable existing reason information. If existing information cannot distinguish the cause, report **UNRESOLVED / REPORTED GAP** rather than inventing a reason or modifying selection to expose one.

### Ask 2 — Named clearance and evidence handling

**P-SEL-2 (E57–E59) is cleared within that boundary.**

- D1/D2 report coverage and gaps. An explicitly printed empty list is distinguishable from a missing print.
- D3 is an **evidence-validity gate**: isolation mismatch or failure to verify adoption-off rejects the run as evidence.
- A missing print, unresolved cause, or rejected run grants **no automatic rebuild, rerun, or tuning authority**.
- Same ini/range, frozen expectations, and unchanged selection logic remain mandatory. HAND values are labels only.

### Ask 3 — Standing boundary confirmed

**No stop, rank, threshold, ordinal, tie-break, or adoption behavior changes under P-SEL-2.** Any proposed correction requires a later frozen packet, fresh dual-key clearance, and operator authorization.

**NOTHING commits under this packet.** The diagnostic build stays uncommitted; records ride the next authorized snapshot; **RECON17 stays frozen**. P-SEL-1 remains DEAD and is not reopened by this clearance.

## VERDICT Astra-9 2026-09-14 - v18 rerun (answers relay v18)

## v18 ruling — P-SEL-2 / RECON21-SEL2: ONE same-build rerun

**THIS STREAM: CLEAR Ask 1, CLEAR Ask 2 with a 90-minute wrapper ceiling, and CONFIRM Ask 3.** This is one stream’s authorization only—not a dual-key receipt. Execution remains blocked until the other stream explicitly clears the same named scope and ceiling, and the operator accepts the wall-time cost.

This ruling relies on the supplied relay; I have not independently inspected the governing result file or journal.

### Ask 1 — CLEAR ONE rerun, no rebuild

Authorize **exactly one rerun of P-SEL-2**, using the existing build identified as `150A6159…` (474883 B), with artifact identity checked against its recorded full hash.

Keep the same ini, test range, and settings; adoption remains off. **No rebuild, tuning, or EA, indicator, or Include changes.** No second attempt is implicitly authorized.

Operator consent remains necessary: **70–75 minutes is the supplied estimate, not a completion guarantee.** The operator must accept the possibility of reaching the authorized 90-minute ceiling, plus launch and collection overhead.

### Ask 2 — CLEAR wrapper ceiling of 90 minutes

Authorize changing **only the wrapper timeout from 60 to 90 minutes**. Record that harness change with the rerun evidence.

Retaining 60 minutes would knowingly preserve a ceiling below the supplied observed-pace completion estimate. Ninety minutes provides margin without making the run unbounded; it does not guarantee completion or establish the cause of the slowdown.

The zero SEL print counts establish that those gated prints did not execute. They do **not**, by themselves, prove live-path equivalence or an environmental root cause. **The pace difference remains unexplained; no diagnosis is required for this bounded retry.**

### Ask 3 — CONFIRMED: nothing commits

- Nothing commits as part of this rerun.
- Records ride the next authorized snapshot; the build stays uncommitted.
- **RECON17 remains frozen. P-SEL-1 remains DEAD.**
- The graded object remains **P-SEL-2, D1–D3**, under the unchanged **D1/D2 gap-not-rerun and D3 evidence-validity rules**.
- RECON21-SEL2 retains **D1 GAP, D2 GAP, D3 UNEVALUABLE**. Retry permission neither upgrades those grades nor waives missing evidence.
- No selection verdict is authorized from the partial run.

**Stop condition:** if this single rerun times out or again lacks required end-of-run evidence, preserve the result, apply the existing missing-evidence rules, and return to council. **No automatic retry or further ceiling extension.**

**Required matching clearance by name:**
`v18 — P-SEL-2 / RECON21-SEL2 ONE same-build rerun; wrapper ceiling 90 minutes; no commits.`

## VERDICT Astra-10 2026-09-14 - v20 fundamentals (answers relay v20)

**COUNCIL RESPONSE — v20 ONLY**
**Ruling name: `COUNCIL-v20-DIAGNOSTIC-ACCEPT-FIX-HOLD-01`**
**Disposition: diagnostic accepted; fix issuance HELD.** This is one stream’s response, not evidence of dual clearance.

### Ask 1 — ACCEPT

Accept the P-SEL-2 diagnostic record in §3 as closed **on the filed evidence represented in this relay**; this does not claim an independent rerun.

- **P-SEL-2: DELIVERED.**
- **P-SEL-1: DEAD.**
- **RECON17: FROZEN.**
- R4/R5 establish missing HAND-corresponding limbs in the tested fractal-candidate space; S1 establishes the near-end ordinal mismatch.
- The R5 one-line-swap expectation remains **WITHDRAWN**.
- **No verdict on v19.** Its carried evidence remains filed.

### Ask 2 — HOLD: no executable fix packet issued

The diagnostic identifies what the present walk cannot represent. It does **not** uniquely establish a replacement enumeration, counting seat, or generation decision. Choosing those from the desired seven outcomes would risk retrospective fitting.

The following are issuance requirements, **not an authorized implementation packet**:

| Item | Scope at issuance | Required resolution |
|---|---|---|
| **F1 — Limbs** | **FIX**, blocked pending a general enumeration rule | Define price-derived swing eligibility, confirmation/availability time, same-side handling, and ordering. Explain why that rule includes the R4 and R5 limbs without admitting future information. “Add the missing HAND swings” is prohibited. Fractal absence alone does not establish which alternative swing rule is his. |
| **F2 — Seat** | **FIX**, blocked pending record-backed counting semantics | Name the first swing from record **or** specify a general anchor/start rule that independently makes 09:40 second. Do not manufacture an unseen first swing, pre-load a count, or use a case-specific ordinal offset. Blank (a) remains open; the relay does not supply the alternative seat rule. |
| **F3 — Generation** | **FIX**; causal explanation still required | TF proposals must use that row’s HTF-bias decision, not sweep direction; MR proposals must use that row’s most recent sweep, not bias. The filed Sep-8 case requires SHORT from the applicable 1H+15m bearish read, with 4H bullish non-blocking. Identify the actual assignment/override that carries LONG despite those meters and explicitly replace or remove it. Meter values alone do not identify that code path or establish a universal HTF-combination rule. |
| **F4 — Wick** | **FIX** in stop resolution | Resolve the ordinary imbalance-dependent swing stop, then apply the qualifying uninvalidated-block wick exception before computing unrounded R. The packet must define block selection, invalidation, wick availability, and “beyond 1-away+block” from his records. The exception must not alter side, setup validity, or swing ordinals. The single-trade pure-two-swings exception must not become a general rule. |

Any missing-record clarification is **print/record-only**. Any additional code instrumentation would require separately authorized scope; this ruling authorizes none. Blank (b), the 08:40 formation detail at 09:15, must remain explicit unless the filed record resolves it.

### Seven-bar successor obligations

These are the **required outcomes**, not claimed predictions of an unspecified fix:

| Bar | Required outcome |
|---|---|
| **R1** | Non-regression; preserve the correct walk and filed stop **1.16508 @ 06:30**. |
| **R2** | **MUST DECLINE**; his invalidating read must not be overridden by code. |
| **R3** | Non-regression; preserve the correct walk and filed stop **1.15847 @ 15:30**. |
| **R4** | General enumeration and seat semantics must make **08:40 / 1.16098** the appropriate second swing, available at decision time. |
| **R5** | General enumeration must make the **16:15 low / 1.16239** eligible and correctly selected, rather than retain **16:05 / 1.16238** through the present chain. |
| **S1** | Propose the required SHORT row; count **09:40 / 1.16258** as second under an explicit seat rule. |
| **S2** | Propose the required SHORT row; apply the recorded second-swing interpretation and journaled target. The Y-POC target gap remains an explicit unresolved dependency, not permission to substitute a target. |

HAND times and prices above are **comparison labels only**. None may enter candidate generation, ranking, seat selection, side selection, stops, or targets. All proposed takes remain subject to his divergence validity, journaled target, and **Dukascopy unrounded R ≥ 1.0**. The eventual packet must also identify and predict preservation of the four legacy signals, not merely assert compatibility.

### Ask 3 — CONFIRM

**No build, run, or commit is authorized.** Work remains halted until an executable fix packet is frozen and dual-cleared **by the same exact name**, with operator authorization wherever run cost attaches. Records ride the next authorized snapshot; builds remain uncommitted.

**Release condition:** resolve the general swing/seat rules, the actual LONG-carrying decision path, and the wick/target dependencies sufficiently to issue causal, pre-run predictions—not a seven-case patch.
