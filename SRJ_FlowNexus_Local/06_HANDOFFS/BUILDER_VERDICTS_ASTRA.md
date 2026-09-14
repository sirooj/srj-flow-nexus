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

## VERDICT Astra-11 2026-09-14 - v21 stage-1 clearance (answers relay v21)

**Ruling-ID: `COUNCIL-v21-STAGE1-CLEAR-FP-LIMBSEAT-1-01`**

**Disposition: `FP-LIMBSEAT-1` CLEARED BY NAME by this responding stream for STAGE 1 ONLY.** This is one clearance receipt—not a representation that both streams have cleared v21. Prior receipts and standing state are taken as supplied, not independently verified.

### Ask 1 — Stage-1 clearance GRANTED

The frozen packet addresses the stated requirements **on paper sufficiently to authorize its diagnostic print set**:

- **F1:** General enumeration predicates, independent attribution, no timeframe widening, structural-justification requirement, and fail-to-blank-(b) routing.
- **F2:** A print-first discriminator with specified alternatives; blank (a) remains open. Neither S-A’s record basis nor S-B’s forming-limb premise is established merely by this clearance.
- **F3:** Provenance before replacement, row-local side authority, non-blocking 4H, and explicit separation of legacy trigger evidence from direction authority.
- **F4:** Single-resolver residency, bounded wick eligibility, mandatory source attribution, and scoped-exception containment.

**Authorized scope:** the frozen stage-1 print set—F2 discriminator, F3 provenance, and per-bar candidate/admission attribution. Diagnostic evaluation of proposed logic is not permission to ship that logic.

**Stage 2 remains HELD.** A further grading relay must evaluate the prints, structural justifications, and applicable preservation/regression obligations before any switch ships. Successor predictions are hypotheses to grade, not instructions to obtain those results. In particular, R1 requires the same ordinal path; the same level alone does not pass.

### Ask 2 — No clearance-time HALT; execution HALTs retained

No second design cycle or amendment is issued here. Unattributed admission, builder-filled blanks, HAND operands, timeframe widening, absent required records or fail-routes, and the specified **more-than-one-forming-limb** result remain blocking.

If the evidence cannot be assigned to a frozen discriminator outcome without inventing an interpretation, **HALT and relay**; do not silently complete the specification. This clearance does not certify that those conditions are absent in code or data.

### Ask 3 — CONFIRMED

Nothing else moves or commits. **RECON17 stays FROZEN; P-SEL-1 stays DEAD; P-SEL-2 stays DELIVERED; builds stay uncommitted.** Records ride the next authorized snapshot.

The approximately 80-minute full-window cost is acknowledged as supplied. **No run is authorized by this receipt alone:** execution requires the other stream’s explicit v21 clearance of **`FP-LIMBSEAT-1` BY NAME**, plus the operator’s affirmative run-cost authorization. No auto-advance.

## VERDICT Astra-12 2026-09-14 - v22 stage-1 verdict (answers relay v22; no Ruling-ID stated)

**Stage-1 record accepted as reported. R5’s proposed L1 mechanism is retired. Stage-2 clearance is withheld on this record alone.** This is one assessment—not an authenticated Astra-11 or Opus-v21 key, and not a substitute for either stream’s explicit clearance.

### Ask 1 — Stage 1

Accept the supplied record:
- D1–D3 PASS; R1/R2/R3 controls hold; stage-1 outcome byte-identity holds.
- R4 correctly follows **blank-(b)** routing. No F1 extension is justified.
- S1 is **S-A-LIVE** on both TFs; stage-1 non-reseating is consistent with its print-only scope.
- F3 provenance is delivered: the last-before-bar side producer was **DetectPoiRetest=LONG**, not a meter write. That establishes provenance, not correctness of the LONG.
- No reported REPORT+HALT condition fired.

This accepts the measurements you supplied; it is not an independent audit of the archive or source tree.

### Ask 2 — R5 ruling and named stage-2 scope

**R5: retire “L1 recovers the 16:15 lower limb.”** The reported neighbourhood test refutes that mechanism; L3 is unavailable under the stated definition. Do not force-fit admission, relax the definition, move the anchor, or silently reconcile the reference discrepancy.

Retain **FILED 1.16239@16:15** separately from **code-under-test 1.16238@16:05**. Redirect the unresolved discrepancy to reference/formation clarification. Shadow silence rejects the proposed recovery mechanism; it does not establish a replacement.

The scope awaiting clearance **by name** is:

**P-LIMBSEAT-1 STAGE-2 — frozen F1-switches-as-attributed + F2 S-A origin-limb + F3 resolver, including F3(5) + F4 single-exit wick + SCOPED_EXCEPTIONS.**

**F3(5) requirement:** promotion must not silently overturn a `POLARITY_MISMATCH` decline. Any permitted reevaluation must be explicitly specified, attributable, and predicted before the run; absent that authority, preserve the decline.

**Seven-bar prediction gate:** before the stage-2 run, freeze one prediction for each of **R1, R2, R3, R4, R5, S1, S2**, identifying expected change or non-change, side, candidate/stop identity where applicable, disposition, attribution, and failure route. Grade against those predictions without post-run reinterpretation. Apply the unrounded **R ≥ 1.0** rule on Dukascopy data.

I cannot certify that this restates the *original* prediction rule verbatim: the full frozen packet is not present. The exact F1 switches, F4 specification, SCOPED_EXCEPTIONS, and seven stage-2 predictions must be supplied or explicitly incorporated into both genuine clearance records. I will not invent them.

### Ask 3 — Execution lock

**Confirmed: nothing builds, runs, or commits until both streams explicitly name and clear the same stage-2 scope, and the operator supplies the run word.** Neither quoted stage-1 key grants stage-2 authority.

**RECON17 remains frozen; the build remains uncommitted.** The flagged approximately one-hour run remains unspent.

## VERDICT Astra-13 2026-09-14 - v23 stage-2 clearance (answers relay v23)

**Ruling-ID: GPT-v23-S2-001**
**Packet: BUILDER RELAY v23 — FROZEN STAGE-2 PACKET, S2-1–S2-7**
**Disposition: CLEARED at scope-review level; execution remains locked.**

**Ask 1 — ACCEPT.** §1 corrections are accepted without operator questions. The five-bar refutation concerns the builder rendering, not the specified three-candle mechanism; filed R5 remains authoritative. TF-side ownership is a defect correction, not a rule question. S-A-LIVE across two TFs remains one classification. S2-1–S2-7 is the complete authorized scope—no implied extensions.

**Ask 2 — CLEAR BY NAME.** I clear the named packet for **one build + one approximately one-hour run**, conditional on the required dual-key clearance and operator run word. This is scope clearance, not a claim that implementation or results have passed.

The frozen grading boundaries hold:
- F3 must produce the two declared LONG→SHORT changes; wrong-way or out-of-set deltas fail as specified.
- The promotion-over-decline assertion must be named, loud, independently summarized, and shipped before/with the resolver. The override table stays empty.
- F4 authorizes no behavioral change; any wick-path difference stops work and is reported.
- S2-6 reports whichever presence/absence branch the probe establishes—not both contradictory outcomes. Neither finding fails the mechanism probe, changes the filed stop, or authorizes a width change.
- R4’s report route does not exempt an out-of-set delta from the global HALT rule. No extension is authorized.

**Ask 3 — CONFIRM.** Nothing builds, runs, or commits on this relay. Execution requires **both designated streams naming this exact packet, plus the operator run word**. RECON17 stays frozen; D23505D4 stays uncommitted. This ruling supplies only my review; it does not impersonate or establish either designated stream’s return.

## VERDICT Astra-14 2026-09-14 - v24 build-2 clearance (answers relay v24)

**Ruling-ID: GPT-v24-S2-CLR-001**
**Disposition: ACCEPT record + CLEAR build-2 by name, conditional on dual-key and operator authorization.** This is a ruling on the supplied record, not independent inspection of the repository or run archive.

**Ask 1 — ACCEPT §1–§2.**
- RECON23 execution **PASSED**, but grading remains **BLOCKED — owned instrument defect**. Execution success does not validate the broken walk.
- P1/P2/P3/P5/P6-reseat remain **UNGRADABLE / VOID**, not failures or passes. No selection-design conclusion follows from those outputs.
- The separately verified, walk-independent clean record stands, including P6-origin and P8 passes, the S1 side flip, the R1 input-divergence decline, and P7’s S2 **FAIL-WITH-GAP**.
- R5’s probe presence does not establish P5 retention or satisfy C5’s antecedent. No divergence finding is manufactured from the void evidence.

**Ask 2 — CLEAR `build-2: L1–L7 + g_s2_tOByExi[7]`, exactly as quoted.**
This clearance covers L1’s cell-local count routing; L2–L5’s per-example anchor storage, publication and reset; and L6–L7’s first-leg protective-validity instrumentation and call-site operands. It clears restoration of the frozen design and closure of the filed auxiliary caveat—not any change to predictions, gates, width, scope, or live behavior.

The authorization envelope is **ONE build + ONE rerun**, same ini/range, **90-minute ceiling**, with the stated pre-hash, exact-diff, parity and 0/0 checks required. This supplies **only the GPT key**: matching second-stream clearance and the operator’s explicit run word remain prerequisites. Nothing builds or runs on this relay. Frozen grading and halt rules remain binding; a repair does not retroactively grade the void run.

**Ask 3 — CONFIRMED.**
RECON17 stays frozen. `e5a5cc24` and build-2 remain uncommitted absent an explicit commit token; build/run clearance is not that token.

## VERDICT Astra-15 2026-09-14 - v25 verdicts (answers relay v25)

**Ruling-ID: GPT-V25-S2-CLR-001**
**Disposition: Ask 1 accepted as the reported record; Ask 2 NOT CLEARED; Ask 3 confirmed.** No build, run, commit, or filesystem operation performed.

### Ask 1 — Record accepted, with an evidence boundary

I accept the reported **BLOCKED** disposition, the stated VOID list, and preservation of the clean record without laundering VOID into FAIL or PASS.

The accepted Opus §6 amendment applies: **funnel structural evidence stands; the four-line scope adjudication is VOID** because it depended on the broken walk's stops. The rerun grading rules remain binding; no oracle re-baselining is authorized.

The quoted C-a wiring, C-c purity argument, C-d diagnostic-only scope restriction, and C-e argument-position resolution are consistent with the relay. However, **I have not inspected e5a5cc24 or the on-disk receipts**; this accepts their reported status, not independent verification. C-b's stale-valid-cell concern is valid, but the proposed safeguards do not yet close it.

### Ask 2 — build-2′ NOT CLEARED by name

Three gaps in the quoted packet prevent clearance.

**1. M2 does not establish current-generation freshness.**

Its stamp test is only:

```cpp
g_s2_stampD <= 0
```

M3 assigns that stamp at the **consumer**, beside ForceEval/dump context selection. Consequently, a positive stamp demonstrates neither that the selected cell was materialized for that `D` nor that its generation matches the consumer. A stale nonnegative count can satisfy every quoted M2 condition.

**Required closure:** identify the materialization generation at the producer and compare it against the expected consumer generation. A shared generation marker is sufficient only if complete rebuild-before-consumption and publication ordering are established; otherwise use per-cell generation markers. Merely comparing a consumer-written stamp with that consumer's `D` is insufficient.

**2. M2 runs too late to protect L1 or reliably detect an unmaterialized cell.**

L1 reads:

```cpp
g_s2a_N[g_s2_cExi * 2 + g_s2_cTF]
```

before the quoted row-reader guard, without upper-bound or TF validation. Further, M1's sentinel `-1` can become `n`; a count-controlled walk can then execute no row reads, so **M2 never emits `STALE_CELL`**.

The claimed subsequent control-grade failure is not a substitute for validating the count access itself.

**Required closure:** validate stage-2 indices, producer freshness, and the nonnegative count **before L1's array access and before the walk can be bypassed**. Preserve a valid, freshly materialized zero-count cell as distinct from an unmaterialized cell.

**3. M4 is only a conditional equality check.**

```cpp
if(tO != 0 && g_s2_tOByExi[e] != tO)
```

does not detect recomputed `tO == 0` with stale nonzero storage. Yet L4 publishes that stored value to the variant's anchor filter.

**Required closure:** compare stored and recomputed anchors for equality including zero, with valid index and initialization ordering established. Matching zero values remain legitimate for unanchored cases.

These are instrumentation-integrity objections, **not strategy changes or a demand for parameter threading**. L6′/L7 are not the blockers on the supplied record. Any correction must return as an explicitly quoted amended packet; this ruling does not authorize edits or execution.

### Ask 3 — Gate confirmed

**Nothing builds, runs, or commits until both streams explicitly clear the same packet by name and the operator gives the run word.** This ruling supplies **no clearance key**.

RECON17 remains frozen; e5a5cc24 remains uncommitted; no commit is authorized without its token. Any subsequently cleared execution remains limited to **one build and one rerun**, the same ini/range, ceiling 90; **no third run; timeout → REPORT + HALT**. **No third run is authorized. Timeout ⇒ REPORT + HALT**, with no automatic retry, extension, or alternative run terms.

## VERDICT Astra-16 2026-09-14 - v26 verdicts (answers relay v26)

**Ruling-ID: GPT-V26-S2-CLR-001**
**Artifact reviewed: `build-2″`, exactly as quoted in §2.**
**Disposition: NO KEY — nothing cleared to build, run, or commit.**

### Ask 1 — Accepted as the carried record, not independently verified

I accept the declared **BLOCKED** disposition, the stated VOID list, and the clean-record standing as the relay’s governing record. I also accept the **mark-and-continue** declaration and the stated grading precedence: an instrumentation HALT makes the run VOID, except that a missed filed stop remains FAIL on that row.

The source files, prior verbatim rulings, and referenced **§6 split** are not present here. Consequently, I can acknowledge the supplied receipts and evidence claims, but cannot certify that I independently read-verified them.

### Ask 2 — `build-2″` is not cleared as written

The proposed design addresses the three earlier concerns in principle: a count-use guard before L1 consumption, generation checks, and unconditional anchor comparison. However, the literal artifact still has these clearance defects:

1. **L1′ uses two different identifier spellings.**
   It declares `s2_cellIdx`, but reads `g_s2_cellD[s2cellIdx]` and `g_s2a_N[s2cellIdx]`. The quoted delta does not declare `s2cellIdx`. This cannot be accepted as an executable, internally consistent patch. Use `s2_cellIdx` consistently; do not silently repair it during the authorized build.

2. **L1′ does not fully validate the cursor before consuming its count.**
   Checking `g_s2_cExi >= 0` and the flattened index’s bounds does not establish `g_s2_cExi <= 6` and `0 <= g_s2_cTF <= 1`. An invalid TF can alias another valid cell, allowing its generation and count to pass. M2′’s later TF check cannot repair that earlier count consumption—particularly if the aliased count is zero and no row read occurs.
   **Required:** validate both cursor components at L1′ before calculating/accessing the cell, then retain the flattened-index, stamp, generation, and sentinel checks.

3. **The named patch inventory is incomplete.**
   Ask 2 includes **M3′**, but §2 supplies no M3′ definition or explicit mapping to another quoted insertion. For clearance of one exact artifact, identify its literal replacement/insertion or explicitly state which quoted clause implements it. An unquoted inherited amendment is not covered by this ruling.

4. **M5’s stated freshness justification is insufficient.**
   Deriving `s2_dcell` from the row’s own exID establishes cell identity, **not generation freshness**. M5 checks the sentinel but not `g_s2_cellD`. Either compare against the dump’s authoritative expected generation without writing the consumer stamp, or supply the precise ordering/invalidation proof that makes stale-but-nonnegative storage unreachable there. This does **not** require restoring the rejected dump stamp writer.

These are instrumentation and artifact-definition issues, not requests to change strategy, gates, scope, or live behavior.

### Ask 3 — Confirmed

**Nothing builds, runs, or commits until both streams explicitly clear the same `build-2″` text and the operator supplies the run word.** This return supplies no such key.

RECON17 remains frozen; e5a5cc24 remains uncommitted; `build-2″` remains uncommitted without a token. Any eventual authorization remains limited to **one build and one rerun**, the same ini/range, ceiling 90, **no third run**, and **timeout → REPORT + HALT**.

## VERDICT Astra-17 2026-09-14 - v27 verdicts (answers relay v27)

**Ruling-ID: GPT-V27-S2-CLR-001**

**CLEAR build-2 TN** — this stream’s key for the exact S2 artifact, for **one build and one rerun**, subject to the stated build gates, the other stream’s identical artifact key, and the operator’s run word. This is not a claim that compilation or runtime validation has already passed.

### Ask 1 — Accepted as the stipulated record

Accept RECON23-STAGE2’s **BLOCKED** disposition, the stated P1/P2/P3/P5/P6-reseat void list, and the separately preserved clean record. Accept the numbered repair closures on the quoted text:

- L1″ validates cursor components before indexing and guards generation and materialization **at the count use**. Matching-generation zero remains legitimate.
- L3’ assigns distinct per-exemplar cells; the quoted construction does not support the –last bar wins every cell– objection.
- M3′ explicitly supplies the consumer-stamp writer and reset.
- M5′ validates against the dump’s own `D`, without publishing a consumer stamp.
- The identifier typo, inventory omissions, and derived-bound issues are addressed.

**Evidence boundary:** No source files or archives were supplied here for independent inspection. Acceptance of their contents, call-site census, and lookup totality therefore rests on the relay’s representations. The referenced **S6 split is not reproduced**, so I cannot independently attest its unspecified contents.

### Ask 2 — Artifact key granted

The key covers **only build-2 TN as quoted**, with repeated –quoted above– global references understood as inventory references—not additional declarations.

Two non-blocking wording qualifications:

- M5′ resets to a no-cursor state; it does **not** save and restore the previous cursor. Whether a stray read then halts depends on the enclosing S2RowRead branch, which is not quoted here. I do not certify that stronger claim.
- L6″ reports `UNGROUNDED_REPORT` for unknown/non-protective swing **when `fi == 1`**. Other imbalance states fall through to `IN_SCOPE`. The trailing note should be read with that qualification; this key authorizes no predicate change.

Exact-diff/parity checks, single-definition and identifier checks, and **EA+Flow compile 0/0 remain mandatory gates before the rerun**. A failed gate does not authorize an improvised repair under this key.

### Ask 3 — Confirmed

Nothing builds, runs, or commits on this relay. Execution requires both streams naming the identical artifact plus the operator’s run word. RECON17 stays frozen; e5a5cc24 and build-2 TN remain uncommitted absent a commit token. Same ini/range, ceiling 90; **no third run; timeout REPORT+HALT**.

The binding grading rules stand: enumerated oracles only; fresh scope measurement; landing comparison against the five filed stops plus S2 gap; stated void list retained; mark-and-continue; **any SEL61HALT → VOID, except a filed-stop miss → FAIL on that row**.

## VERDICT Astra-18 2026-09-14 - v28 verdicts (answers relay v28)

**Ruling-ID: GPT-V28-S2-RVW-001**
**Disposition: review-only; no build/run key issued.**

### Ask 1 — Accepted with a reservation

I accept the carried **BLOCKED** disposition, the stated void list, and preservation of the clean record as the relay’s stipulated history—not as independently inspected on-disk evidence. The referenced **S6 split is not reproduced here**, so I cannot independently confirm its contents.

V2’s quoted save/restore fix is satisfactory for the shown straight-through dump path. The bounds additions, direct empty-setting on dump guard-trips, single-insertion globals map, and qualified L6″ explanation address their stated review points.

**V1’s claimed –ANY call order– closure remains unproven**, for the reason below.

### Ask 2 — Withheld: producer-generation lifetime gap

M4″ tests:

```cpp
g_s2_cellD[e * 2] != 0
```

That establishes that a producer wrote the cell **at some earlier point**, not necessarily during the current evaluation lifecycle.

The quoted changes permit this state sequence unless an external lifecycle invariant excludes it:

1. An earlier `S2BuildAll` leaves `g_s2_cellD[e * 2]` nonzero.
2. A subsequent EndOfRun executes L5′, clearing `g_s2_tOByExi` but **not** `g_s2_cellD`.
3. `S2BuildAll` is skipped in that lifecycle.
4. Seat encounters a nonzero `tO`; M4″ sees the retained producer marker and compares it against the cleared anchor, producing `ANCHOR_MISMATCH`.

M1′ cannot prevent this sequence because its reset executes only when `S2BuildAll` runs.

This is **a structural proof gap, not a claim that the frozen rerun demonstrably reaches that sequence**. Close it by either:

- resetting producer-validity markers at the same pre-fill lifecycle boundary as the anchors, with the placement quoted; or
- supplying the call/lifetime evidence that excludes retained markers whenever BuildAll is skipped in the authorized execution.

Do not silently substitute either remedy into TN2: a code change requires an updated identical artifact for both streams.

### Ask 3 — Confirmed

Nothing builds, runs, or commits on this return. Authorization requires both streams to name the identical artifact with the prescribed key, followed by the operator’s run word. RECON17 remains frozen; e5a5cc24 remains uncommitted; no commit is authorized for TN2; no third run; timeout means **REPORT+HALT**.

I accept the binding grading rules as stated: enumerated oracles only; archive hash/count are provenance, not oracles; the stated STALE/ANCHOR void-versus-filed-miss failure treatment; landing reconciliation against the five filed stops plus S2 gap with the void list restated; fresh scope measurement; and declared P-c mark-and-continue.

## VERDICT Astra-19 2026-09-14 - v29 verdicts (answers relay v29)

**Ruling-ID: GPT-V29-S2-CLR-001**
**CLEAR build-2 TN3**

This is this stream’s key for **S2 exactly as quoted**, covering one build and one rerun under the stated gates—not an execution instruction or a finding that those gates have already passed.

### Ask 1 — Accepted as the supplied record

I accept the reported BLOCKED disposition, P1/P2/P3/P5/P6-reseat VOID list, and standing clean record as the basis for this clearance. The technical closures are sufficient:

- **Shared blocker / R1:** L5′-R1 closes the producer-lifetime gap. Resetting `cellD` together with `tO`, `stampD`, and `tOByExi` removes the earlier-lifecycle witness. Under the stated execution order and producer inventory, M4″’s nonzero test now witnesses a fill in the current lifecycle. This accepts the revised V1, not the old proof.
- **R2:** The count-site comparison against `T` and row-site comparison against `isH1` explicitly reject cursor/TF disagreement.
- **R3:** Given the reported whole-function inspection, normal completion reaches restore; there is no reported early-exit path requiring another restore. Tester abort remains run-voiding.
- **R4 / S-a:** The stated bounded producer/consumer loops and capacity guard support the indices. Separate bounds hardening is not a prerequisite for this repair.
- **M5″ / L6″:** Their qualifications stand. In particular, unreadable first-leg imbalance falling through to `IN_SCOPE` is **not** proof of the scope invariant; fresh scope measurement remains required.

**Evidence boundary:** I have reviewed the pasted relay, not the source tree, archive, or v28 original. The line inspections, byte counts, prior-record details, and –otherwise byte-identical– claim remain supplied evidence, not independently reproduced findings. The referenced **S6 split is not reproduced here**, so I cannot separately ratify its unstated content. Neither limitation expands the S2 clearance.

### Ask 2 — Exact authorization boundary

The key names only **build-2 TN3**, including its three specified micro-deltas and carried S2 text. Pre-hash, exact-diff/parity, identifier checks, HAND gate, no new price literal, `OrderSend` source count zero, and EA+Flow compile **0/0** remain required. A failed gate does not authorize the rerun.

### Ask 3 — Confirmed

Nothing builds, runs, or commits on this return alone. Both streams must name the identical artifact, followed by the operator’s run word. RECON17 stays frozen; e5a5cc24 and the resulting TN3 changes remain uncommitted absent a commit token.

Authorization is limited to the same ini/range, ceiling 90, **no third run**, and timeout **REPORT+HALT**. The stated oracle-only grading, STALE/ANCHOR void-versus-filed-miss failure distinction, landing-table comparison with the void list restated, fresh scope measurement, and P-c mark-and-continue rule remain binding.

## VERDICT Astra-20 2026-09-14 - v30 verdicts (answers relay v30)

**Ruling-ID: GPT-V30-S2-RUL-001**
**Disposition: REVIEW / GRADING ONLY — this stream’s ruling, not a build/run key.**

### 1. Record accepted
Accept the supplied RECON24-BUILD2TN3 run record, grades, clean-family comparisons, and scope findings **as reported**. The referenced handoff and underlying logs were not supplied here for independent inspection.

- **PASS:** P1–P5, P6-origin, P8.
- **FAIL:** P6-reseat under A3, without weakening or reinterpreting identity.
- **FAIL-with-gap:** P7; its pre-registered advancement halt remains binding.
- **C5 OPEN-SPEC-DIVERGENCE:** remains open; R5’s filed stop remains authoritative.
- Accept RECON23’s void-list closure through the reported clean RECON24 grading–not retroactive validation of RECON23.
- Scope’s four candidate violations remain **REPORT-only** with the supplied operands. The mechanism explanation remains a hypothesis, not an established finding.

The reported runner result **DONE=PASSED does not mean all acceptance gates passed or advancement is authorized.**

### 2. P6-reseat ruling: finding, not fix packet
**Retain the A3 FAIL as a recorded ineligible-row identity finding; no code movement or fix packet is required by this ruling.**

The controlling distinction is between **identity failure**, which occurred, and **selection consequence**, which the supplied record reports as zero: the changed S1 rows are ineligible, all 12 eligible S1 rows are identical, and no take, decline, G1 match, or halt was introduced. S2 remains REPORT-only under A4.

Accept that the enumerated C2 triggers were not met on this record. That does **not** override A3 or convert its FAIL to PASS. Any later evidence of eligible-row impact, a new admission, or a C2 trigger would require a fresh ruling.

### 3. Locks confirmed
**Nothing builds, runs, or commits on this relay.** RECON17 remains frozen; `703c3b0a` remains uncommitted; no third run is authorized; timeout remains **REPORT+HALT**.

This ruling supplies no execution authorization and does not substitute for the other stream’s independent ruling.

## VERDICT GPT-V31-RUL-001 2026-09-14 (answers relay v31)

**Ruling-ID: `GPT-V31-RUL-001`**
**Disposition: Ask 1 ACCEPTED; Ask 2 CONFIRMED; Ask 3 ISSUED by this stream only.** v30 remains closed. This ruling uses the record reproduced in this relay; it does not claim independent inspection of the named proof files.

### 1. S1 consequence — ACCEPTED

HAND first swing **09:50**, second **09:40 at 1.16258**, is already on record; it is not an outstanding request to the operator.

Against that authority, the reported walk counts nothing between the 10:05 decision close and 09:40. **The filed S1 consequence is accepted: a 09:50 limb-list absence, in the same diagnostic family as R4's missing 08:40 limb—not a pure off-by-one.** This does not establish that S1 and R4 share an implementation cause.

S-A's "origin = 09:40 itself" does not reconcile HAND's 09:50 first swing. Any interpretation requiring 09:50 to be the S-A origin limb must establish that relationship explicitly. Reconciliation is council design territory; the builder is not authorized to invent a rule.

### 2. Carried priority — CONFIRMED

The P4/C5-geometry-first flag remains **Opus-only historical priority**, not an agreed v30 ruling and not an earlier packet issuance. This stream adopts that ordering **prospectively for the packet below**, without rewriting the carried record.

### 3. Packet issuance

**ISSUE `ADOPTION-FIX-P4C5-FIRST-001`**

**Scope quoted back:**
> "replace-not-sidecar at the deployment bar (his rules REPLACE the old pipeline where they disagree; the sidecar era is over by his order), P4/C5 walk-vs-filed geometry first per the carried flag."

**Council-authored packet text**

1. **Replacement contract.** The adoption fix must make the authoritative manual rules the production decision path wherever they disagree with the legacy pipeline. A comparison harness may support validation; a parallel sidecar, legacy fallback that overrides those rules, or diagnostic-only adoption does not satisfy this packet. This is the required destination, not permission to change live selection now.

2. **First design gate: P4/C5 geometry.**
   - **P4/R4:** Reconcile filed **1.16098@08:40**, absent from both TF limb lists, against the walk's **1.16088@08:20**.
   - **C5/R5:** Reconcile the probe's **PRESENT@16:15** against the walk retaining **1.16238@16:05**, with filed **1.16239@16:15** authoritative.

   The design must identify the responsible construction, eligibility, ordering, retention, or consumption condition from evidence—not presume which mechanism failed. It must specify a general rule-derived correction. Fixture-specific timestamps, prices, and forced selections are not a correction.

3. **S1 reconciliation gate.** Account explicitly for HAND **09:50 → 09:40**, the missing 09:50 limb, and S-A's reported 09:40 origin. An index shift alone cannot close this gate while 09:50 remains absent. Preserve the authoritative stop **1.16258@09:40** without using that endpoint to conceal incorrect swing lineage.

4. **Rule preservation.** The replacement specification must preserve HTF-bias-only TF rows, most-recent-sweep-only MR rows, three-candle middle-extreme swings, the filed stop-distance and wick rules, and **unrounded Dukascopy R ≥ 1.0** eligibility. Preserve all filed stop authorities. Do not invent S2's missing TP information; report any resulting validation limit.

5. **Acceptance bar.** Closure requires journal coverage demonstrating matching side, entry bar, stop, target, and take/reject decisions: **every valid taken journal trade reproduced, no invalid setup signaled**. Legacy identity, seating success, or fixing P6 alone cannot establish adoption correctness.

6. **Build-clearance prerequisite.** The later relay must present the concrete replacement design, evidence-to-rule mapping, affected pipeline boundaries, and validation criteria under this exact packet name. Any unresolved semantic choice returns to council; issuance is not discretionary permission for the builder to supply one.

### Clearance and locks

This is **one issuance key**, not dual-key clearance. The other stream must independently **ISSUE `ADOPTION-FIX-P4C5-FIRST-001`** with identical scope; a different name or substantive scope requires reconciliation.

**NOTHING builds, runs, or commits on this relay.** A later relay must clear the named packet for build, and execution additionally requires the operator's run word. No hour is authorized here.

**RECON17 frozen; 703c3b0a uncommitted; no third run; timeout = REPORT+HALT; snapshot, push, and tag only on explicit token.**


## VERDICT GPT-V32-RUL-001 2026-09-14 (answers relay v32)

**Ruling-ID: `GPT-V32-RUL-001`**
**Disposition: naming-only issuance.**

### Ask 1 — Naming convention adopted

> 1. Fix packets take SCREAMING-KEBAB names with a three-digit suffix (`-001` first issuance, incrementing on re-issuance): e.g. `ADOPTION-FIX-P4C5-FIRST-001`.
> 2. Run/result archives keep the existing `RECONxx-NAME` convention (e.g. `RECON21b-SEL2`, `RECON24-BUILD2TN3`). The two namespaces never collide: packets are designed, runs are measured.
> 3. From here, issuance keys must quote the full decorated name exactly. Undecorated noun phrases are descriptions, not names, and do not match.

### Ask 2 — Issuance

**ISSUE `ADOPTION-FIX-P4C5-FIRST-001`**

Scope, verbatim:

> replace-not-sidecar at the deployment bar (his rules REPLACE the old pipeline where they disagree; the sidecar era is over by his order), P4/C5 walk-vs-filed geometry first per the carried flag

The v31 contents identified in S2 carry forward unchanged as stipulated. This issuance reconciles naming only; it does not reopen v31, draft packet text, alter substantive rules, or clear a build or deployment.

### Clearance and locks

This return supplies **one stream's issuance only**. Dual issuance requires the other stream independently to ISSUE the identical full name and quote the identical frozen scope. Only that match permits subsequent packet-text drafting; build clearance requires a later relay.

All stated locks remain: **NOTHING builds, runs, or commits on this relay.** RECON17 frozen; 703c3b0a uncommitted; no third run; timeout REPORT+HALT; snapshot, push, and tag only on explicit token. The operator's run word (~1h) is not spent here.


## VERDICT GPT-V33-RUL-001 2026-09-14 (answers relay v33)

**Ruling-ID: `GPT-V33-RUL-001`**

**APPROVE `ADOPTION-FIX-P4C5-FIRST-001`**

This approval covers the exact S1 text, A1–A6 followed by O1–O4, without corrections, substitutions, or merged wording.

**Ask 1 — Carry:** No inconsistency identified within the supplied relay. The text preserves separate source attribution, diagnostic-before-mechanism ordering, the pre-flip differential, and distinct build and deployment clearings. P4/C5-first ordering remains attributed to Opus, not recast as council-agreed. Verbatim fidelity to the cited proof files is **not independently verified** because their contents were not supplied.

**Ask 2 — Text approval only:** This return supplies one stream's approval, not dual approval. Filing on the later relay remains subject to both streams approving identical text; any correction returns to both streams.

No build, run, deployment, commit, snapshot, push, or tag is authorized. RECON17 remains frozen; 703c3b0a remains recorded as uncommitted. No third run; timeout means REPORT+HALT. The operator's run word is not spent here.


## VERDICT GPT-V34-RUL-001 2026-09-14 (answers relay v34)

**Ruling-ID: `GPT-V34-RUL-001`**

**CLEAR `ADOPTION-FIX-P4C5-FIRST-001` — SHA256 `ED72CCAFA58288B0C72316F029F5F3092A1FCCDE37CA16158960E374F41561B0`, 6032 B — for ONE build plus ONE run, subject to all v34 locks.**

This ruling covers the full relay, on the supplied account of the closed v33 dual approval; I have not independently inspected the packet or proof files.

- **Specification:** replace-not-sidecar at the deployment bar; P4/C5 geometry first; A1–A6 then O1–O4, fixed order, single-source attribution, pairings unmerged. Those ten approved contents are the build specification. No replacement design is invented at the bench; unresolved semantic choices return to council.
- **Build gates:** before any write, STAGE-1 pre-hash verification of the current tree against the stated EA baseline (`703c3b0a`, 514584 B); single definitions; HAND six literals fixture-only; `OrderSend-src 0`, alert-only; both compiles **0 errors, 0 warnings**. Report parity and isolation join versus RECON17; neither is a gate for this behavior-changing build.
- **Run envelope:** `RECON25-ADOPT`, same RECON ini/range, ceiling 90. ONE build, ONE run; no third run. Timeout **REPORT+HALT**.
- **State locks confirmed:** RECON17 remains frozen. Nothing commits on the cleared run: no snapshot, push, or tag without an explicit token.

**Clearance only—not execution authorization.** Both streams must clear this identical packet; either stream halts. The operator's run word remains **UNSPENT**: this relay authorizes no hour, and nothing builds, runs, or commits now. Build and run execute only on his word after dual clearance.


## VERDICT GPT-V35-RUL-001 2026-09-14 (answers relay v35)

**Ruling-ID: `GPT-V35-RUL-001` — NON-CLEARANCE; no key issued.**

Reviewed the full relay, including the inline packet. The three stated v34 corrections are present: inline body, exploratory/observation framing with an expected A6 halt, and explicit observation acceptance. This ruling does not reopen v34.

**One clearance-boundary conflict remains:** A6 expressly makes a concrete replacement design, evidence-to-rule mapping, affected pipeline boundaries, and validation criteria prerequisites for build clearance. S0 instead requests an O1-only diagnostic build before that design exists, with any A6 boundary encountered reported afterward. The exploratory framing and narrower acceptance do not expressly exempt that build from A6’s prerequisite. O3 permits build-and-measurement clearance distinct from deployment, but does not expressly waive A6.

This is a sequencing ambiguity for council, not a semantic choice for the builder. **I therefore withhold clearance rather than infer an exception.**

The narrow correction is an explicit council-approved clarification that **O1-only, print-only instrumentation and its observation run may precede A6’s replacement-design gate**, while A6 remains mandatory before any replacement implementation or selection-path change. That clarification must follow the packet’s approval and identity protocol; the builder must not supply it.

**Ask 2 — confirmed as authorization limits, not independently verified repository facts:**
- Nothing builds, runs, or commits on this relay; no snapshot, push, or tag without an explicit token.
- RECON17 remains frozen; adoption stays OFF; selection remains untouched.
- The requested ceiling remains one build and one observation run, with no additional or third run authorized.
- Timeout means REPORT+HALT. The operator’s run word remains **UNSPENT**.
- The listed pre-hash, source, compile, fixture-only, and reporting requirements remain intact.

No files were inspected or changed, and no build or run was executed.


## VERDICT GPT-V36-RUL-001 2026-09-14 (answers relay v36)

**Ruling-ID: GPT-V36-RUL-001**

**APPROVE**
O1-only, print-only instrumentation and its observation run may precede A6's replacement-design gate, while A6 remains mandatory before any replacement implementation or selection-path change.

**CLEAR ADOPTION-FIX-P4C5-FIRST-001** for **ONE exploratory print-only build plus ONE observation run**, RECON25-ADOPT, same ini/range, ceiling 90, within the scope stated in this relay.

This return supplies this stream’s approval and key only—not the other stream’s approval. The clarification requires both streams’ approval of the identical sentence; execution additionally requires the operator’s run word under the stated print-only amendment. That word remains **UNSPENT**. Nothing builds, runs, or commits on this relay.

Clearance binds **packet name + stated scope**, not independently verified file contents, digests, byte counts, or prior rulings. The stated mechanical checks remain mandatory.

All locks stand: O1 print-only instrumentation, adoption OFF, no selection-path or emitted-decision change, RECON17 frozen, no third run, timeout REPORT+HALT, and no commit without an explicit token. A6 halt is an accepted observation outcome; Amendment-4 validation is deferred, not waived.

The parity join must be read post-run, with placement evidence and parity output returned to both streams. A non-identical trade set invalidates the observation premise; identical trades alone do not establish that control flow was unchanged.


## VERDICT GPT-V37-A6-001 2026-09-14 (answers relay v37)

**Ruling-ID: GPT-V37-A6-001**
**Disposition: record accepted as reported; replacement A6 design authored below. No build, run, commit, or release clearance.**

### 1. Record grading

Accept the reported RECON25-ADOPT result, O1 evidence, isolation read, and stated caveats as the v37 evidentiary record. This accepts the supplied account; it does not claim independent inspection of the archive or result file.

- **Observation objective: satisfied as reported.** The completed run yielded the table without an A6 halt. That establishes that no halt-triggering semantic choice was encountered—not that replacement semantics were exercised or validated.
- **Isolation: supported by the reported comparisons**, within their measured scope.
- **R4:** live-1SWING is **PRESENT-and-chosen**, filed-exact. FRACTAL-candidate space is separately **ABSENT** at 08:40. Combining those into an undifferentiated “R4 absent” would be incorrect.
- **S1:** the 09:50 limb is present and qualified in the reported series/buffer evidence; the relevant decision row is missing. Candidate absence is therefore not the supported diagnosis.
- **Consumption bounds:** neither the loopless R4 path nor S1’s unrelated same-date row supplies a relevant captured consumption loop. `NO_LOOP_CAPTURED` is a measurement limitation, not proof of rejection or non-consumption.

### 2. Authored replacement A6 design

**A6’s governing rule is: establish decision identity, resolve the operative path, then evaluate candidates within that path. Cross-path absence cannot override positive evidence from the operative path. Candidate existence cannot manufacture a trading decision.**

#### R4 — operative live path governs

For the observed 09:15 decision, A6 walks the **live-1SWING path**, because the decision row explicitly selected that path—not because its price happens to match the filed target.

The recorded `1SWING 1.16098 ok=1` establishes the observed selection. The buffer evidence supports availability. A loop capture is not required to recognize an explicit selection on a path that has no loop.

The absent 08:40 FRACTAL event and walk to 08:20 remain a **separate fractal-path finding**. They do not trigger fallback, substitution, or correction of this live decision. Any proposal to change the operative path to FRACTAL would be a separate semantic change requiring fresh authorization.

#### S1 — decision creation is independent of candidate discovery

A6 requires a decision record **whenever an independently established strategy decision trigger occurs**, including when no candidate is selected. Record creation must not depend on candidate-loop entry or successful selection.

That record must identify the decision’s instrument, side, time, trigger, and operative path. A same-date row is not a substitute.

For S1:

1. Establish whether the expected 10:05 decision had a valid trigger under the governing strategy. The supplied evidence does not establish that trigger.
2. **If established:** the absent row is a decision-record creation failure. The replacement design requires that decision record and evaluation of candidates available and qualified **as of that decision**, through the applicable path and existing selection gates.
3. **If not established:** retain **expected decision unresolved**. Do not invent a decision or trade from the buffered limb, the hand account, or the ordinal mismatch.

The 09:50 limb is not automatically selected merely because it exists or offers 46-point risk versus the reported 53-point stop. Its as-of qualification and applicable ranking still govern. Preserve the observed ordinal shift, but correlate by timestamps and candidate identity—not by forcing code #1 to equal hand #1.

### 3. Authority boundary

This return authors the replacement semantics above; it does **not** declare them implemented or tested. S1’s trigger remains an explicit unresolved factual prerequisite, not a semantic choice delegated to Builder.

The v36 loop remains closed; its allowance and run word remain spent. RECON17 stays frozen; `51DF542D…` stays uncommitted. No third run, snapshot, push, or tag is authorized. Further implementation or execution requires a fresh packet relay and the applicable explicit authorization.

