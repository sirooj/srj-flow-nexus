# BUILDER VERDICTS — Sol stream (GPT 5.6, 4th council slot)

Operator word 2026-09-18: out of Opus credit, so the 4th slot is filled by GPT 5.6, called Sol only, until Opus returns. Same relay text, same asks, same filing discipline (verbatim bodies, marker counts, tail read-back). Standing seat-split applies unless he rules otherwise (analysis out, review-only, never keys).

## Sol answer - 2026-09-18 - answers v172 relay (packet v9) (amend-with-delta, 10 required deltas + Ask-A + Ask-B; first Sol verdict; no Ruling-ID stated, filed as entry SOL-V172-001)

**AMEND-WITH-DELTA — do not yet clear `PACKET_EXT1LIVE-001 v9`.**

### Required deltas

1. **Fix undefined-ext1 shadow semantics — P034 vs P036.**
   P034 says `slDistExt1 = MathAbs(currentPrice - pxExt1)` and describes `wouldGate` as the ext1 predicate, while P036 requires undefined-ext1 records to copy the live raw pair, ratio, and gate result and print `pxExt1='-'`. Specify an explicit branch before arithmetic: if defined, compute from `pxExt1`; otherwise copy `slDist`, `tpDist`, `rLive`, and `actualGate`. No sentinel may enter arithmetic.

2. **Make invalid/non-finite handling deterministic — P036, P042.**
   “Retained verbatim per the STAGE-1-recorded representation” is not an executable output contract, and `MathAbs(NaN)` plus formatting behavior may vary. Define finite checks and an exact representation before arithmetic/printing. At minimum:
   - raw finite operands: lossless numeric text;
   - non-finite operands or ratios: one fixed token such as `INVALID`;
   - zero-denominator guarded ratio: `-`;
   - `wouldGate` remains the literal complete-predicate Boolean;
   - any `wouldGate=1` with a non-finite operand/quotient is an independent failure.

3. **Resolve the acceptance contradiction for A1/A3 — P028, P042.**
   P028 correctly says entry-based table agreement is a prediction finding and not an automatic miss because the live gate uses `currentPrice`. P042 nevertheless requires A3 `rExt1=0.68`/`wouldGate=0` and A1 “likewise (1.38),” then says explanations do not permit acceptance. Those results are not guaranteed unless `currentPrice==entryPx` or the printed operands independently produce them. Make the mandatory requirement:
   - exact self-consistency from printed `currentPrice`, `tpPx`, and `pxExt1`;
   - table agreement within ±0.01 is prediction comparison only;
   - A1/A3 expected Booleans are mandatory only if an independently stated bound proves current-price movement cannot cross the gate.
   Otherwise a legitimate entry/current-price difference could fail an honest probe.

4. **Do not validate `actualGate` from entry-based archived operands — P042.**
   The live predicate uses `currentPrice` (P028/P034), but P042 calls archived `entry/sl/tp` sufficient. Validate each `actualGate` from that STOPRESOLVE record’s printed `currentPrice`, `slLive`, `tpPx`, and `gateConst`. Archive rows may validate the unchanged actual-path diagnostic contract, not the C-site Boolean unless they also contain the same `currentPrice`.

5. **Correct the claim that cap-path live behavior is identical — P032, P038.**
   Returning immediately after C necessarily suppresses downstream execution for the 20001st evaluation; behavior therefore differs from the uninstrumented EA on that evaluation. Replace “identical behavior with or without the probe” with: cap entry is an intentional failed-run emergency boundary; its downstream behavior is not evidence and must not be compared or accepted. Keeping exactly-once CAP, unload request, and proven void return is sound.

6. **Specify SCHEMA/CAP interaction — P034, P038, P042.**
   State whether `STOPRESOLVE_SCHEMA` is emitted before the cap test and whether CAP carries no 38-field record. The simplest invariant is: first uncapped C reach emits SCHEMA then record 1; reaches 2–20000 emit records; reach 20001 emits CAP only, sets the latch, requests unload, and returns.

7. **Name the actual enclosing handler and prove all inserted returns are type-valid — P032, P038.**
   “Proven void-return point” is an appropriate gate but underspecified. The build record must name the containing function, quote its signature, identify the exact inserted `return;`, and establish that no lambda/helper or nested non-void context intervenes. No caller cites are needed to prove return type; caller cites may document runtime consequence.

8. **Clarify `probe_bSaved=0` behavior — P032, P034.**
   P032 says C “emits `probe_bSaved=0` and halts grading,” but reading any other bare carries on that path would be undefined behavior. Require C to test `probe_bSaved` before reading `probe_sel`, prices, slots, or imbalances; on false, emit a dedicated failure record containing only safe initialized/site values, request unload, and return. Better still, definite-assignment failure should prevent compilation/build, while the runtime witness remains defensive.

9. **Reconcile the “no computation”/“print-only” wording — P032, P034, P038.**
   The probe performs shadow arithmetic, comparisons, counter updates, formatting, logging, an unload request, and possibly an early return. Use “no live-state mutation and no live selector/gate substitution,” instead of “no computation” or an unqualified “print only.” This avoids overstating observational transparency.

10. **Tighten the cap ordering against side effects — P032, P038.**
    The cap decision must occur before schema emission, shadow arithmetic, provenance joins, or any other probe call for evaluation 20001. Only the counter/latch check, CAP emission, unload request, and return should run there. This makes “one CAP line” and bounded work mechanically checkable.

### Analytic ask A — additional defects, gaps, or imprecision

- **P011:** `liveSel=-1` is not sourced by “512-valid-rung exhaustion” or “4000-slot truncation” in a mutually explanatory sense. Either bound may terminate a walk without finding selectable slots, but `-1` is directly caused by both selector predicates failing. Reword these as upstream reasons slots may remain absent.
- **P028:** “five other fires predicted identical because live stop already equals s1px” needs exact printed-price qualification. Since probe prices become lossless, identity should be judged from those values, not five-decimal archive displays.
- **P032/P038:** lexical purity permitting `ExpertRemove()` cannot itself establish “no mutation through calls”; the call intentionally mutates terminal/EA lifecycle state. Exempt it explicitly from the no-live-state claim and classify it as cap-only control action.
- **P034:** `entryPx` and `tpPx` availability is asserted later but their exact source symbols are not named on-page. STAGE-1 should name them and establish they refer to this same S5 evaluation.
- **P034/P036:** `extSideOk` and `extDistPts` must be computed only after `ext1Defined && finite(pxExt1) && finite(entryPx)`; otherwise output `-`. Definition alone does not ensure arithmetic validity.
- **P036:** `MathRound` returns a floating-point value. Specify the output type/format and overflow handling for `extDistPts`; otherwise “points” can appear integral while lacking an integer contract.
- **P036:** “17 significant digits” needs a canonical format rule including locale-independent decimal separator and no thousands separators. Compiler confirmation of a specifier alone does not prove parser-safe logs.
- **P036:** `wouldAdopt_monotone` calls `slLive` finite but also requires `pxExt1` finite; include `currentPrice` finite explicitly because both protective-side and distance predicates consume it.
- **P038:** “0/0 compile” is ambiguous. Say “zero errors and zero warnings,” and state which compiler/build configuration supplies the count.
- **P038:** producer-before-C must be established on every path reaching C, not merely by source-line order. The current wording gestures at this, but the gate should explicitly include dominance or equivalent control-flow proof.
- **P042:** A2 matching by “ordered occurrence” remains fragile if multiple S5 evaluations share bar, direction, and site. Since no new field is allowed, state that multiplicity greater than one for that key is an ambiguity and mandatory halt.
- **P042:** the baseline source for row-for-row diagnostic comparison should be named by digest in the acceptance clause, rather than only earlier prose, so the comparator cannot drift.
- **P042:** “A3 still present at actual-path R=1.62” conflicts with the earlier acceptance focus on seven rows and archived printed precision unless the exact baseline row is identified. Treat 1.62 as an archive comparison value with its source record, not a reconstructed invariant.
- **P042:** CAP behavior cannot simultaneously be an ordinary diagnostic-comparison divergence and its own independent miss. State that CAP short-circuits all downstream grading and fails the run immediately.
- **P007/P046:** the future live rule is intentionally hazardous because it may adopt a non-protective ext1. That is acceptable for this print-only probe, but clearance must expressly exclude semantic approval of section 1. The authorization name should say it clears only section-3 instrumentation, not the future rule.

### Analytic ask B — better mechanism

A small probe-local record plus a single emitter helper would be safer than numerous loose carries, provided the helper takes values by value and is mechanically verified not to mutate live state.

- **Before L9626:** declare and initialize a probe record with only `incomingSlRef` and a `saved=false` witness.
- **After L9665, before L9666:** copy `s1x_sel`, slots, imbalances, and prices into the record; set `saved=true`.
- **After L9670:** first handle cap and `saved=false`; then call a pure-by-contract formatter/emitter with live values and the saved record.
- **No changes after L9670 beyond that call/block**, and no changes to L9661–L9670 themselves.

This touches the same three sites—pre-L9626, post-L9665, and post-L9670—but reduces definite-assignment risk, field-order drift, and accidental use of undefined carries. If introducing a struct/helper is considered excessive churn, the current scalar mechanism is acceptable after the deltas above; the essential improvement is early branching before any unsafe carry or undefined-ext1 arithmetic.

After these amendments, the envelope is otherwise proportionate and page-checkable: one instrumented build, one run, hard emission bound, no live selector substitution, and no re-run authority.

## Sol answer - 2026-09-18 - answers v173 relay (packet v10) (amend-with-delta, 20 defects + Ask-B; second Sol verdict; no Ruling-ID stated, filed as entry SOL-V173-001)

**amend-with-delta — do not build or run v10 as written.**

**Decisive defects / Ask A**

1. **P032, P034, P036, P038 — the probe's finite-value policy does not faithfully model the live gate.**
   The live predicate at **L9670** does not call `MathIsValidNumber`; it evaluates:
   `slDist > 0.0 && (tpDist / slDist) >= InpMinRewardRisk`.
   Yet P036 says finite checks "gate ALL arithmetic," while P034 says `wouldGate` has "identical short-circuit semantics" and may faithfully become true on a non-finite quotient. Those requirements conflict. Amend by separating:
   - `wouldGateRaw`: exact L9670 semantics, with no added finite guard; and
   - `shadowOperandsValid` / reporting validity: `MathIsValidNumber` checks used only to decide formatting and acceptance.
   Alternatively, explicitly define `wouldGate` as raw live-equivalent evaluation and state that finite checks never suppress its arithmetic. Current wording cannot implement both rules simultaneously.

2. **P034, P036 — undefined-ext1 policy contradicts independent price printing.**
   P036 first requires `pxExt1` to print independently in lossless form before invalid/denominator handling, but later requires undefined-ext1 records to print `pxExt1='-'`. Amend the first rule to apply only when `ext1Defined` and the value is finite, or expressly give the undefined-record override precedence over independent printing.

3. **P036 — "17 significant digits" is not a sufficient canonical serialization contract.**
   A `printf` format can provide 17 significant decimal digits, but "locale-independent '.'" is not established merely by selecting such a format. STAGE-1 compiler confirmation of the specifier does not prove decimal-separator behavior. Amend to either:
   - define an explicit canonical formatter that normalizes the separator and rejects grouping; or
   - drop the locale-independence claim and validate the actual emitted grammar before grading.

4. **P036, P042 — acceptance recomputation from printed values needs exact parsing rules.**
   The page defines `INVALID`, `-`, and numeric text, but not whether signed zero, exponent notation, leading `+`, or noncanonical `nan/inf` spellings are accepted. Because exact per-record Boolean recomputation is mandatory, freeze a numeric grammar and parse-failure rule before build.

5. **P032, P034, P038, P042 — CAP exactly-once is not fully guaranteed by the stated order.**
   The CAP branch says emit CAP, then set `probe_capped`, then request unload and return. If emission itself re-enters or faults, the latch has not yet been set. The safer ordering is: determine overflow, set `probe_capped=true`, emit the single CAP line, request unload, return. This still gives cap-first behavior and strengthens the exactly-once claim.

6. **P032, P038 — CAP boundary leaves `OnTick` continuing after `EvaluateClosedBar` returns.**
   The inline caller at **L11214-L11224** shows that a return from `EvaluateClosedBar` proceeds to `StoreWorkingSet`, `EvaluateManagedTrade`, and news hooks in the same tick. P032 correctly withdraws the claim that `ExpertRemove()` immediately stops the handler, but "immediate stop" and the emergency-boundary description remain imprecise: it stops only the current `EvaluateClosedBar`, not `OnTick`. Amend the packet to state that explicitly. If downstream-on-cap execution is unacceptable, the proposed insertion site cannot enforce it without touching the caller.

7. **P034 — `probe_bSaved=false` handling has the same caller-continuation limitation.**
   The failure branch unloads and returns only from `EvaluateClosedBar`; **L11215-L11223** can still execute. State this explicitly and classify everything after the failure record as non-evidence.

8. **P034, P038 — "C tests `probe_bSaved` before reading any other bare carry" is narrower than the required safety property.**
   The test must also precede every expression, formatting argument, helper call, or initializer that may reference a bare carry. Amend the lexical gate to verify zero syntactic references to the bare carries before the successful `probe_bSaved` branch.

9. **P034 — failure-record `emitSeq` semantics are underspecified.**
   It is unclear whether the defensive `probe_bSaved=0` record consumes/increments the ordinary record sequence, whether SCHEMA precedes it, and whether it counts toward the cap. Freeze this. Prefer treating it as a terminal failure line with its own record kind and the next reserved sequence number, subject to the same cap decision.

10. **P034 — STOPRESOLVE serialization is not unambiguously parseable.**
    `ladOriginSite` and identifiers are text, but escaping/delimiters are not specified. If values can contain whitespace, separators, quotes, or the literal sentinel tokens, field recovery can become ambiguous. Require key-value encoding with fixed escaping or a delimiter-safe representation.

11. **P028, P042 — table leg (b) is inconsistently described.**
    P028 calls entry-based table matching a finding and "never an auto-miss," whereas P042 says table values "reproduce ... or explain," then says explanations are findings rather than permission to accept a failed mandatory comparison. Clarify whether leg (b) can fail clearance. The coherent rule is: operand self-consistency and A1/A3 Booleans are mandatory; entry-based table mismatch is report-only when explained by printed `currentPrice != entryPx`.

12. **P028, P034, P042 — `entryPx` identity remains deferred to STAGE-1 but is used in mandatory/prediction grading.**
    P034 allows the field to be struck if exact symbol identity cannot be established, while P028 relies on entry-based comparisons and P036 uses it for `extSideOk`/`extDistPts`. Freeze the consequence: striking `entryPx` must strike all entry-based table matching, `extSideOk`, and `extDistPts` claims; it must not leave contradictory mandatory grading in place.

13. **P034, P036 — undefined ext1 copies `actualGate`, but raw live invalidity is unresolved.**
    If the live operands are non-finite, P036 requires raw fields/ratios to show invalid forms while also requiring `wouldGate=actualGate`. That is acceptable only if `actualGate` remains the literal already-computed Boolean and no finite guard is retroactively imposed. State this explicitly as part of the fix to item 1.

14. **P032, P038 — purity rules need to allow output calls explicitly and narrowly.**
    "ExpertRemove permitted as the sole termination-request call" does not enumerate the required print/format calls and any pure validation helpers. "No mutation through calls/references" is otherwise overly broad because output and string construction necessarily have side effects or allocations. Freeze an allow-list: formatting, validation, and print calls only, with no reference parameters pointing to live state.

15. **P038 — "Anything touching the live path forbids the build" is too broad and conflicts with the insertion itself.**
    The probe necessarily reads live locals/globals and introduces control exits on terminal failures. Replace it with the precise invariant: no strategy-state write, no selector/gate operand substitution, and no control-flow change except the two explicitly authorized terminal-failure branches.

16. **P042 — archive recomputation of `actualGate` is conceptually mismatched if archived prices are rounded.**
    P042 requires exact Boolean validation from archived entry/sl/tp values, while the gate uses `currentPrice`, not entry, and archived displayed operands may lack lossless precision. This validation can only check rows where the archive contains the actual gate operands at adequate precision. Otherwise it must be "unproved/report," not a mandatory halt independent of the new per-record self-check.

17. **P028, P034 — provenance join key is insufficiently frozen.**
    "Same-bar SLEXT481 row" plus the lad-origin triple can still be ambiguous when multiple evaluations share bar, direction, and site. Define ordered-occurrence matching and multiplicity for this join as rigorously as P042 does for diagnostics. Ambiguity must halt.

18. **P034, P042 — SCHEMA content is not enough to verify record grammar.**
    Names and count validate order, but not format version, escaping, numeric grammar, or sentinel policy. Include `format=2` and a schema fingerprint/version in SCHEMA and every terminal failure/CAP line, or freeze these through an exact parser contract.

19. **P032 — the declaration types may be too narrow for an unbounded run model.**
    `unsigned int probe_seq` is adequate for cap 20,000, but "would exceed" should be implemented without overflow-sensitive addition. Compare `probe_seq >= 20000` before incrementing; do not compute `probe_seq + 1 > 20000`.

20. **P036 — `extDistPts` range policy is incomplete.**
    "Out-of-range prints INVALID" does not identify the target integer type/range or whether range testing occurs before conversion. Define the range explicitly and test the rounded `double` before any cast.

**Ask B — better mechanism**

Keep A and B at **pre-L9626** and **post-L9665**, but make C a single, probe-owned serializer call inserted immediately after **L9670**, supplied only by value. For example, construct a local probe snapshot after the `probe_bSaved` guard and pass scalar copies to a pure formatting/emission helper. This reduces repeated formatting logic and makes a write/reference audit tractable; it must not receive references or pointers to live state.

For robust emergency termination, the better control mechanism would be a probe-failure return status propagated from **EvaluateClosedBar L6607** to **OnTick L11214**, followed by an immediate return before **L11215-L11223**. That touches live control flow and is therefore **outside the present envelope**; do not add it to this probe without separate authorization. Within the current envelope, retain the local return but accurately document caller continuation.

Required touched sites for the cleared revision remain:
- declaration carry: before **L9626**;
- selector snapshot: after **L9665**, before **L9666**;
- guarded snapshot/emission: after **L9670**;
- no changes to **L9661-L9670** or downstream live behavior except terminal probe-failure returns already expressly authorized.

After the deltas above — especially the raw-gate/finite-format separation, unambiguous serialization, grading reconciliation, and caller-continuation wording — the one-build/one-run print-only scope is analytically clearable.

## Sol answer - 2026-09-18 - answers v174 relay (packet v11) (amend-with-delta, 12 defects + Ask-A + Ask-B; third Sol verdict; no Ruling-ID stated, filed as entry SOL-V174-001)

**amend-with-delta — do not clear PACKET_EXT1LIVE-001 v11 yet.**

### Required defects / gaps

1. **The probe is not actually gated by `InpDebugLog`.**
   P032 places insertion C unconditionally immediately after L9670, while P007/P032/P038 repeatedly characterize `InpDebugLog=true` as gating the run or provenance. The cited code shows that `InpDebugLog` guards only the origin-global writes at L8770–L8776 and the existing recorder at L9683. Consequently, with the wrong run input, C still emits records using stale/default origin globals until an offline mismatch is found.
   **Delta:** either:
   - place all of C under `if(InpDebugLog)` and update the siting, scope, diff, and cap assertions; or
   - state precisely that `InpDebugLog` gates **origin validity only**, not probe emission, and require a pre-run/build-record assertion of the effective run input before execution.
   **Lines:** P007, P032, P038; EA L8770–L8776, L9670–L9683.

2. **The cap count conflicts with the required schema-first ordering.**
   P032 increments `probe_seq` before emitting the once-only SCHEMA line. Therefore the first normal record gets `emitSeq=1`, but the counter has already advanced before schema emission. That is coherent only if “records emitSeq 1..20000” means normal records exclusively; however P032 calls the incremented value a “reserved emitSeq” for a possible BSAVE failure, and P038 says “records emitSeq 1..20000 pass” without excluding failure records. A BSAVE failure can consume sequence 1 without any normal record, making the stated cap semantics and total-emitSeq reporting ambiguous.
   **Delta:** define the cap unit explicitly as **every C-reaching evaluation/reserved sequence**, not normal records; state that BSAVE_FAIL consumes one sequence number and that gaps in normal-record sequences are terminal-only. Alternatively, increment only immediately before a normal record and give BSAVE_FAIL no sequence.
   **Lines:** P032 steps 2–4, P034, P038, P042.

3. **“SCHEMA-first” is not guaranteed on the already-capped branch.**
   P032 tests the cap before schema. If state corruption, restoration, or an unexpected initialization condition makes `probe_capped=true` before the first schema emission, the function silently returns with no SCHEMA, CAP, or failure line. Static initialization makes this unlikely in the intended fresh execution, but the page claims stronger, literal ordering and self-verification properties.
   **Delta:** narrow the claim to ordinary fresh-execution reachability, or treat `probe_capped && !probe_schema_done` as a typed terminal failure.
   **Lines:** P032, P038.

4. **The origin stamp comparison appears to use different bar identities.**
   `g_sl41_oStamp` is written as `iTime(..., barShift)` at L8776, whereas `barTime` is passed from `OnTick` as `currentBarTime = iTime(...,1)` at L11210 and then to `EvaluateClosedBar(1,currentBarTime)` at L11214. For the stated invocation this matches, but P032/P038 generalize the equality as a C-site invariant without limiting it to the one fixed caller and `barShift==1`.
   **Delta:** explicitly freeze the proof to the sole invocation `EvaluateClosedBar(1,currentBarTime)` and require the invocation census for `EvaluateClosedBar`, or compare the stamp to `iTime(_Symbol, PERIOD_CURRENT, barShift)` directly at C.
   **Lines:** P032, P038; EA L8776, L11210–L11214.

5. **The closed-enum claim for `ladOriginSite` is unsupported by the pasted region.**
   P036/P038 allow a build-time domain assertion, which is acceptable, but P007 additionally says `ladOriginSite` prints the L5489 local `site`, while the actual proposed probe reads `g_sl41_oSite`, written literally `"S5"` at L8775. These are distinct sources and should not be described interchangeably.
   **Delta:** define STOPRESOLVE `ladOriginSite` solely as `g_sl41_oSite`; reserve L5489’s `site` for the separate SLEXT481 join and require equality between the two sources.
   **Lines:** P007, P032, P034, P036, P038; EA L8775.

6. **The normal-record fingerprint is underspecified.**
   P042’s delta summary says format/version fingerprinting was adopted for SCHEMA, CAP, and BSAVE_FAIL, but P034’s 38-field normal record has neither `format` nor `pkt` among its fields. A parser can associate records with the preceding schema only by execution context, which weakens the claimed singular-schema/frozen-parser protection—especially with concatenated logs.
   **Delta:** require every STOPRESOLVE normal record to carry `format=2` and `pkt=PACKET_EXT1LIVE-001-v11` outside the counted 38 payload fields, or explicitly define these as a fixed record prefix excluded from `fields=38`.
   **Lines:** P032, P034, P036, P038, P042 delta summary.

7. **Delimiter/escaping is not frozen.**
   P036 freezes numeric grammar and enum domains but never states the record delimiter, key/value grammar, quoting, or escaping. “Field recovery stays unambiguous” does not follow merely from closed enum sets. Datetimes contain spaces, and textual identifiers could collide with a whitespace parser unless the serialization form is specified.
   **Delta:** freeze an explicit grammar, e.g. one line, fixed `key=value` order, ASCII space between fields, no spaces in encoded values, datetimes encoded in a specified space-free form, and no quoting; validate a complete sample normal record plus all three terminal record types.
   **Lines:** P032, P034, P036, P038.

8. **Lossless formatting is asserted for price fields but not for `_Point` or the rounded-distance input.**
   `extDistPts` is recomputable only if `_Point` is independently frozen by the instrument/configuration. The 38 fields omit `_Point`, symbol, and digits. This does not block the shadow gate checks, but it prevents the output alone from settling every ext-distance question as claimed.
   **Delta:** either add `_Point` to the schema/fixed prefix or state that `_Point` is a build/run-record constant external to each record and must be filed before grading.
   **Lines:** P028, P034, P036, P038.

9. **`rLive` undefined/non-finite policy does not fully reconcile with its “identical inline form” claim.**
   P034 says rLive uses identical guarded arithmetic, while P036 says non-finite operands or ratios print INVALID and zero denominators print `-`. The live idiom elsewhere returns `0.0` on a failed denominator guard, while the probe display returns `-`. That is defensible diagnostically, but it is not “identical” at the result level.
   **Delta:** say the arithmetic branch and quotient are identical, while serialization deliberately distinguishes guard-blocked division from numeric zero.
   **Lines:** P028, P034, P036.

10. **The undefined-ext1 shadow policy can conceal an invalid live operand.**
    P036 mandates `wouldGate=actualGate` and shadow raw operands equal live operands when ext1 is undefined. If a live operand is non-finite, P034/P036’s general INVALID/undecided treatment must still override that literal copy. The current precedence statement mentions named-field overrides but does not explicitly resolve `actualGate=true` with INVALID live operands.
    **Delta:** state that undefined-ext1 copying occurs before validity classification, and any INVALID live/shadow operand makes the copied Boolean undecided or a separate invalid-operand failure under the same policy.
    **Lines:** P034, P036, P042.

11. **“No further probe work” on the capped branch is stronger than the proposed operations.**
    That branch necessarily evaluates the flag, may emit CAP, calls `ExpertRemove`, and returns. The intended meaning is evidently no schema/shadow/provenance/normal-record work, not literally no probe work.
    **Delta:** replace with “no schema, sequence increment, shadow/provenance computation, or normal/failure-record emission.”
    **Lines:** P032, P038.

12. **The run-range description is ambiguous at the endpoints.**
    “08-26 to 09-09” does not specify year, timezone, or inclusive/exclusive tester endpoints, despite row-level grading depending on exact bar membership.
    **Delta:** freeze full tester timestamps, timezone/broker time, and endpoint inclusivity in the build/run record.
    **Lines:** envelope preceding P001; P038, P042.

### Analytic ask A

The twelve items above are the defects, gaps, or imprecisions I find. Items 1, 2, 6, and 7 are clearance blockers because they affect the literal gate model, sequence/cap interpretation, and deterministic parsing. The others should be folded simultaneously to prevent another ambiguity round.

### Analytic ask B

A better mechanism is a **single probe emitter helper fed by one local snapshot struct**, while retaining A/B solely to capture values that leave scope:

- Before EA L9626: declare and initialize a probe snapshot carrying `incomingSlRef`; retain a `saved` witness.
- At EA L9665/L9666: populate selector outputs into that snapshot.
- Immediately after EA L9670: call one `ProbeStopResolve(snapshot, live operands, ext1 globals, origin globals, identifiers)` helper.
- The helper owns schema emission, cap state, canonical serialization, finite classification, and all record prefixes.

This reduces parallel field-order definitions and makes schema/record drift mechanically harder. It would touch the insertion sites around **EA L9626, L9665–L9666, and L9670–L9671**, plus one new probe-only helper near the diagnostics/helper region. The helper must return a typed status such as `PROBE_OK` or `PROBE_TERMINAL`; `EvaluateClosedBar` performs the authorized `ExpertRemove(); return;` itself, preserving the explicitly reviewed void-return boundary.

## Sol answer - 2026-09-18 - answers v175 relay (packet v12) (amend-with-delta, 18 defects + Ask-A + Ask-B; fourth Sol verdict; no Ruling-ID stated, filed as entry SOL-V175-001)

**amend-with-delta — do not clear PACKET_EXT1LIVE-001 v12 yet.**

### Required deltas

1. **Undefined-ext1 records can falsely certify equality with the live path.**
   **P034, P036, P042.** P036 mandates copying `rLive`, the live raw pair, and `actualGate` into the ext1-shadow fields when ext1 is undefined. But P034/P042 then permit ordinary shadow self-consistency analysis. This is not a computed ext1 counterfactual and should not be represented as one. Add an explicit rule that undefined-ext1 records are **fallback-class only**, excluded from ext1 shadow/gate prediction grading and source-change conclusions; grade only that the copied fields equal their corresponding live fields and that ext1 sentinels are correct.

2. **The canonical-number grammar admits noncanonical forms despite being called canonical.**
   **P034, P036, P038.**
   `^-?(\d+\.?\d*|\.\d+)([eE][+-]?\d+)?$` accepts forms such as `01`, `1.`, `.5`, `00.0`, `1e+03`, and both `e`/`E`. Therefore grammar acceptance cannot prove a unique canonical serialization. Either:
   - rename this a numeric acceptance grammar and separately require exact reserialization equality to the selected formatter’s output; or
   - specify one actual canonical language, including exponent letter, exponent sign, exponent leading zeros, leading integer zeros, decimal-point rules, and zero/negative-zero spellings.
   Sample testing alone does not establish this for all emitted values.

3. **`StringFormat("%.17g", x)` is not tied to the stated grammar strongly enough for all finite outputs.**
   **P034, P036, P038.** The packet freezes a candidate formatter but does not normatively define normalization if the runtime emits a plus sign in the exponent, uppercase/lowercase differences, locale artifacts, or implementation-specific exponent padding. P034 expressly allows exponent signs, including `+`, while P003/P028 describe “plus-sign grammar” as withdrawn/“minus-only,” creating an internal contradiction. State unambiguously whether `e+NN` is accepted. If plus signs are forbidden, normalize positive exponents before emission and validate parse-back after normalization.

4. **The “one ordered definition” serializer requirement is underspecified relative to the allowed insertion.**
   **P032, P034, P038.** P032 says the prefix, schema names, and record order come from one ordered definition, but insertion C is described only as an emit block, while the exact helper allow-list excludes a dedicated serializer helper and no array/struct representation is specified. “Hand-verified single definition” does not define a checkable construction. Freeze the mechanism—for example, one ordered key array plus one ordered value array consumed by both SCHEMA and normal-record formatting—or weaken the claim to an explicit token-by-token equality gate. Do not claim singular-source construction without specifying it.

5. **`probe_dead` is not set for all instrument-invalid states.**
   **P032, P038, P042.** Provenance stamp/join mismatch, serialization/SCHEMA failure, invalid mandatory operands, and other runtime acceptance failures are described as “halt grading,” but only cap and `bSaved` set the shared latch. If these are offline-only failures, say explicitly that the EA continues emitting and “halt” means offline rejection only. If immediate probe silence is intended, they need online detection plus `probe_dead`, terminal record, unload, and return. The current text mixes structural terminal silence with offline grading halt.

6. **CAP sequencing has an off-by-one description.**
   **P032, P038.** The specified first action checks `probe_seq >= 20000` before increment. Thus sequences 1–20000 are reserved normally, and the **next C reach** produces CAP. Calling this “overflow” is inaccurate; it is cap exhaustion. More importantly, the text alternates between “on overflow” and “a 20001st reaching evaluation.” Freeze the latter semantics and replace “overflow” throughout with “cap exhausted before reservation.”

7. **Terminal-line cardinality is weaker than the structural claim.**
   **P032, P042.** “At most one CAP xor one BSAVE_FAIL” allows zero terminal records, which is normal, but “xor” conventionally requires exactly one true operand. Replace it with: zero or one terminal record total; if present, its type is exactly one of CAP or BSAVE_FAIL; no later STOPRESOLVE-family emission. Also define whether pre-existing non-probe diagnostics after terminal return count as “probe silence” (they should not).

8. **SCHEMA-before-BSAVE consumes output after an invalid save witness.**
   **P032.** The fixed order emits SCHEMA before testing `probe_bSaved`. That is coherent but weakens “terminal activity with no SCHEMA is void” as an instrument-health discriminator and means a broken A/B path can still advertise a schema without any valid normal record. Better order: terminal check → reserve sequence → `bSaved` check/terminal → SCHEMA → normal emit. If SCHEMA-first is intentional, explicitly state that SCHEMA is metadata, not evidence that the normal-record path is valid.

9. **The claimed build-time zero-reference check is syntactic but inadequately bounded.**
   **P032, P038.** “Before any syntactic reference” needs a precise range: from the start of insertion C through the successful branch boundary, after preprocessing/macro expansion or in raw source. Since formatting expressions may be hidden in macros, freeze raw-source prohibition plus no macros containing carry identifiers, or require preprocessed-token inspection.

10. **`probe_bSaved` is not a runtime proof against crossed same-evaluation assignments.**
    **P032, P034.** It detects omission of B but not partial/crossed assignments if B executes. The `liveSel=-1` equality check covers only one branch. Add universally gradeable carry identities:
    - `probe_sel=0 ⇒ slLive=s0px` and saved slot/imb are the selected s0 tuple;
    - `probe_sel=1 ⇒ slLive=s1px` and saved slot/imb are the selected s1 tuple;
    - `probe_sel=-1 ⇒ slLive=incomingSlRef`;
    - recompute `probe_sel` from saved predicates.
    The last and `-1` checks exist, but the selected-price identities do not appear as mandatory checks.

11. **Integer conversion from imbalance buffers remains unchecked.**
    **P011, P028, P034, P038; EA L9648–L9655.** The live code casts `double` flow values to `int`. The probe saves resulting ints, but the packet refers to “raw native ints,” which can obscure that they were converted from doubles. Clarify that they are post-cast selector values, not raw buffer values; source-identity conclusions involving imbalance cannot prove the original flow value was integral.

12. **The origin join’s datetime formatter is not fully frozen.**
    **P028, P032, P034, P036.** Normal probe datetimes use minute precision and a replaced separator. The legacy SLEXT481 line also displays minute precision. Ordered matching can therefore collide if multiple evaluations share the same minute/key. The packet partly handles multiplicity, but origin equality should specify comparison of parsed minute values, not textual encodings, and acknowledge that seconds are unobservable. Dual-stamp checks at C should use native datetime equality before serialization.

13. **The site domain assertion cannot be checked from the provided page.**
    **P034, P038.** `dir` can plausibly be bounded through `DirName`, but the packet does not enumerate the closed values for `site` or `ladOriginSite`; it delegates this to STAGE-1. That is acceptable as a disk gate, but page clearance should not call the grammar complete until the build record enumerates the domains. Require the exact enum strings in the build record and rejection/encoding rules for any value outside them.

14. **`entryPx` remains needlessly strikable despite an apparent page-level mapping.**
    **P034, P036; EA L8751–L8753.** The page identifies `currentPrice=nextOpenPx` as the S5 entry reference while separately warning that archived TP_ELECT entry identity is unasserted. Either define probe `entryPx=currentPrice` and keep table-entry comparison as a separate archived operand, or name another candidate entry local. Leaving `entryPx` strikable makes `extSideOk`, `extDistPts`, and the key protective-side diagnostic disappear together, undermining the probe’s stated purpose and P007 hazard visibility.

15. **`extDistPts` sign prose is internally wrong.**
    **P028, P036.** With the formulas:
    - LONG: `(entryPx-pxExt1)/_Point`
    - SHORT: `(pxExt1-entryPx)/_Point`
    a protective stop is positive and a non-protective/favorable-side stop is negative. P036 says “negative means favorable-side magnitude,” which is ambiguous and conflicts with the field being described as “protective-positive.” Replace with: positive = protective-side displacement, zero = rounded at-entry, negative = non-protective-side displacement. “Magnitude” should not describe a signed negative number.

16. **`wouldAdopt_monotone` direction appears opposite to adverse-only tightening.**
    **P036, P046.** For a protective stop, a SHORT stop is above price; a higher stop increases risk and is more adverse, while a LONG stop below price becomes more adverse when lower. The predicate given—SHORT `pxExt1` higher, LONG lower—is adverse-only, not monotone risk reduction. The name and P046’s “Monotone-adverse-only adoption” should explicitly say monotone **risk expansion/adversity**, otherwise “monotone” is likely to be misread as stop tightening.

17. **Normal-record count and SCHEMA count are not explicitly reconciled with terminal reservation.**
    **P032, P038, P042.** Require offline invariants:
    - normal-record count + BSAVE_FAIL count = highest reserved `emitSeq`;
    - sequence starts at 1 and is strictly contiguous until a terminal reservation;
    - no duplicates;
    - CAP has no sequence and can occur only after reserved sequence 20000;
    - SCHEMA exactly once iff C was reached at least once.
    Current prose implies parts of this but does not freeze the complete count check.

18. **The packet cannot be fully re-cleared while acknowledged review input is unseen.**
    **P001, P046 and the delta paragraph.** “Opus D1-rest through D20 OWED-UNSEEN” means v12 expressly does not fold all of the cited v174 review. Either remove Opus from the folded-review claim and clear v12 solely against received material, or wait for the remainder and fold it. The title’s `Opus-D1partial` is accurate, but calling this re-clearance while known requested review deltas remain unseen creates avoidable process ambiguity. This is not a technical blocker if the authorization authority explicitly declares the unseen review non-gating; that declaration is absent.

### Analytic ask A

The defects and imprecisions are the 18 items above. Items **2–5, 10, 14, 15, and 18** are clearance-blocking because they affect serialization validity, the claimed safety/latch model, mandatory carry integrity, the central side diagnostic, or review completeness. The remainder should also be folded to avoid ambiguous grading.

### Analytic ask B

A better mechanism is a **single local probe snapshot plus one serializer**, without altering the live selector:

- **Before EA L9626:** declare a local `ProbeSnapshot` value object containing incoming `slRef`, selector outputs, ext1 tuple, provenance, observed gate operands, and status flags.
- **Inside EA L9626–L9665:** populate only the selector portion after selection.
- **After EA L9670:** validate the snapshot, reserve sequence, and pass it to one pure serializer that owns the ordered field specification and emits SCHEMA from that same specification.
- **At EA L6607 / terminal branches:** retain the immediate `return` and shared terminal latch.
- **No changes to EA L9661–L9670 live selection/gate statements.**

This touches only the proposed A/B/C sites around **EA L9626, L9665–L9666, and post-L9670**, plus a new pure serializer/type definition in a non-runtime helper region. It is superior because definite assignment becomes constructor-visible, schema/record order has one actual source, selected-price invariants can be validated centrally, and formatting normalization is testable independently. If adding a helper is rejected, use parallel fixed arrays of 38 names and 38 values in insertion C and generate both SCHEMA and the normal line from those arrays; that still provides a genuine singular serialization definition.

## Sol answer - 2026-09-18 - answers v176 relay (packet v13) (AMEND-WITH-DELTA, 15 defects + Ask-A + Ask-B; fifth Sol verdict; no Ruling-ID stated, filed as entry SOL-V176-001)

**AMEND-WITH-DELTA — do not yet clear `PACKET_EXT1LIVE-001 v13`.**

### Required defects / gaps

1. **SCHEMA construction is internally impossible as specified** — **P032, P034, P038**.
   P032/P038 require one ordered key array *and one ordered value array* to be consumed by both SCHEMA and NORMAL formatting. SCHEMA needs field **names**, while NORMAL needs per-evaluation serialized **values**. A single value array cannot serve both without either populating it differently or adding a second construction path.
   **Delta:** require one immutable 39-key array and one per-record 39-value array; SCHEMA consumes only the key array, NORMAL consumes both in matching indices. Assert one key-array definition and one normal-value population site.

2. **The prescribed `StringReplace` datetime expression cannot be a direct formatter argument in MQL5** — **P034, P038**.
   `StringReplace` mutates a string by reference and returns the replacement count, not the transformed string. The current wording can lead to encoding the integer count.
   **Delta:** explicitly require a probe-owned temporary: assign `TimeToString(...)`, call `StringReplace(temp," ","-")`, then serialize `temp`; include this mutation in the lexical allow-list as a write only to probe-owned storage.

3. **CAP terminal cardinality conflicts with the top-level terminal check** — **P032, P042**.
   After the first CAP, `probe_capped || probe_dead` returns silently on later calls, so CAP is exactly once within the still-loaded instance. But P042 says CAP occurs “only after reserved sequence 20000,” which is weaker and permits malformed late placement; P032 says the 20001st C-reaching evaluation is CAP.
   **Delta:** require CAP, if present, to be the first C-reaching evaluation after emitSeq 20000, with no intervening C-reaching reservation or NORMAL/BSAVE record; state this is structurally checked from the sequence and source proof because silent post-terminal calls are not observable.

4. **The claimed volume invariant is not runtime-verifiable after terminal latching** — **P032, P042**.
   “One normal-or-terminal probe record for each non-dead C-reaching evaluation” is fine, but later dead/capped C-reaching evaluations are silent and their count cannot be derived from output. “Probe silence after terminal” therefore cannot prove that no later invocation reached C; it proves only no later probe emission.
   **Delta:** narrow the output claim to emissions through the first terminal event and make post-terminal behavior source-structural only.

5. **Undefined-ext1 origin grading is underspecified and can force a false stale-provenance failure** — **P032, P036, P042**.
   P036 correctly prints the origin quadruple on undefined rows, but P032 says the triple is joined to the same-bar SLEXT481 row and any mismatch halts. It does not state whether SLEXT481 is guaranteed to exist for undefined ext1 or how undefined-row origin fields are represented there.
   **Delta:** define the exact undefined-row SLEXT481 join and expected origin values, or grade only stamp/site freshness for undefined rows and reserve ext1 provenance matching for defined rows.

6. **Site-field grammar is confused with direction grammar** — **P034, P038**.
   P034 calls `dir` a “text identifier field,” but the same paragraph requires it to be the locally encoded integer 0/1. This creates two incompatible decoding domains.
   **Delta:** classify `dir` exclusively as decimal integer with domain `{0,1}`; enumerate closed sets only for textual `site`/`ladOriginSite` fields actually emitted.

7. **The envelope grammar does not fully define packet/base identifiers** — **P032, P034**.
   CAP and BSAVE_FAIL require packet/base identifiers, while the fixed prefix includes only `pkt`; no authoritative key name or value grammar for `base` is given. SCHEMA likewise says “pkt, base tree” without an exact base field.
   **Delta:** freeze an exact common envelope, for example
   `STOPRESOLVE format=2 pkt=PACKET_EXT1LIVE-001-v13 base=6C2E4028 type=...`,
   including exact order and allowed character set for every non-payload token.

8. **The declared fixed envelope and listed order conflict** — **P032, P034**.
   P032 describes “type=CAP + format=2,” while P034 freezes `format=2 pkt=... type=...`. Although likely prose shorthand, terminal exactness is an acceptance requirement.
   **Delta:** state that all descriptions defer byte-for-byte to the single P034 envelope order, including CAP and BSAVE_FAIL.

9. **NORMAL line length is not bounded against platform truncation** — **P036, P038**.
   “Read back at worst-case field widths” is useful but no maximum source string/log-line length or truncation criterion is frozen. Text enum values and numeric exponents determine that bound.
   **Delta:** compute and file the maximum encoded NORMAL/SCHEMA/terminal length, verify it is below the observed platform limit with margin, and reject any readback not byte-identical to the emitted constructed string.

10. **Canonical numeric validation is circular unless locale is forced or independently checked** — **P034, P036, P038**.
    The producer and validator both relying on `StringFormat("%.17g")` can agree while violating the intended ASCII numeric grammar under locale behavior. The grammar parse helps, but the packet should explicitly require an independent byte-level grammar check of actual log tokens.
    **Delta:** require the log-readback parser—not the EA formatter—to verify ASCII `.` only, no grouping, canonical reserialization, and binary64 round-trip for every numeric token, not merely a sample.

11. **`MathIsValidNumber` fallback would change the authorized diff without a fixed implementation** — **P007, P038**.
    The packet authorizes A+B+C only, yet says the build may “substitute an explicit finite test” if the predicate surprises and then restate P007. That is an unspecified design change during the authorized build.
    **Delta:** if any of the three predicate checks fails, halt before build consumption and issue a new packet naming the explicit finite predicate; do not permit builder-time substitution under v13.

12. **The exact arithmetic reproduction requirement needs compiler-operation constraints** — **P034, P042**.
    Offline binary64 reconstruction is required to preserve EA subtraction, absolute value, division, and comparison order, but compiler optimization/extended precision behavior is not pinned. Exact Boolean agreement remains valid; exact intermediate token recreation may not be portable.
    **Delta:** grade `actualGate` and `wouldGate` by the printed raw operands using the language/compiler’s documented double semantics, while treating a one-ULP boundary ambiguity at exactly `gateConst` as an explicit halt-with-operands—not an ordinary mismatch.

13. **The normal-record sequence reservation precedes SCHEMA, producing non-log-order semantics** — **P032, P042**.
    On the first successful evaluation, emitSeq is reserved before SCHEMA, but SCHEMA is printed before NORMAL. This is coherent, yet “sequence starts at 1” could be misread as sequence ordering across all STOPRESOLVE lines.
    **Delta:** explicitly state that SCHEMA is unsequenced and precedes NORMAL emitSeq=1 in log order; sequence contiguity applies only to NORMAL and BSAVE_FAIL records.

14. **Acceptance does not explicitly require exactly 39 NORMAL keys, each once** — **P034, P042**.
    Ordered names and parse-back imply it, but terminal exactness warrants a direct invariant.
    **Delta:** require every NORMAL line to contain exactly the 39 payload keys in the specified order, no duplicates, omissions, or unknown keys, plus the exact envelope keys.

15. **`entryPx == currentPrice` “textually equal” can be defeated by independently formatting signed zero or invalid values** — **P034, P036, P038**.
    Both are the same source value, but separate formatting paths could drift; mandatory finite-input policy also does not expressly say a non-finite currentPrice prevents NORMAL acceptance before side diagnostics.
    **Delta:** populate both fields from one canonical token generated once; non-finite `currentPrice` is a mandatory live-input failure, regardless of textual equality.

### Analytic ask A

The fifteen items above are the defects, gaps, and imprecisions I find. The principal clearance blockers are **1, 2, 5, 7, and 11**; the remainder should be folded because this packet makes exact serialization and terminal behavior part of acceptance.

### Analytic ask B — better mechanism

Use one probe-owned serializer block at **Insertion C after EA L9670**, without a new helper or any live-path write:

- At **pre-L9626**, keep only the automatic carries and witness.
- At **post-L9665/pre-L9666**, keep the nine capture assignments.
- At **post-L9670**, define:
  - one immutable ordered 39-key array;
  - one 39-element per-evaluation canonical-token array;
  - one probe-owned line string;
  - probe-owned datetime temporary strings transformed by `StringReplace`;
  - a single index-driven NORMAL assembler;
  - a separate index-driven SCHEMA assembler using only the same key array.
- Construct each canonical token once and reuse it where identity is required—especially `entryPx/currentPrice` and aliased raw denominators.
- Compare the assembled line length against a frozen maximum before `Print`; inability to serialize exactly should take the existing BSAVE-style terminal-failure path under a newly named terminal reason/type, which would require a fresh packet because v13 currently authorizes only CAP and BSAVE_FAIL.

This touches only the authorized sites around **EA L9626, L9665–L9666, and immediately after L9670**. It is cleaner than a helper because it preserves the three-hunk scope, but it makes key/value ownership, datetime mutation, token reuse, and exact line construction mechanically auditable.

## Sol answer - 2026-09-18 - answers v177 relay (packet v14) (AMEND-WITH-DELTA, 15 defects + Ask-A + Ask-B; sixth Sol verdict; no Ruling-ID stated, filed as entry SOL-V177-001)

**AMEND-WITH-DELTA — do not yet clear `PACKET_EXT1LIVE-001 v14`.**

### Required defects / gaps

1. **The declared 39-field wire order conflicts with the stated `emitSeq` position.**
   At **P034**, counting the listed payload fields puts `emitSeq` at **position 34 only if counting from zero**; under the ordinary one-based convention it is **field 35**:
   - 33 `actualGate`
   - 34 `emitSeq` only under zero-based indexing
   - 35 under one-based indexing
   Yet P034 says “position 34 of 39,” while `ladOriginStamp` is correctly described as position 39 under one-based counting. This makes the schema/order assertion internally inconsistent.

   **Required delta:** change P034 to say **“emitSeq appears exactly once, at position 35 of 39”** and ensure all schema fixtures and parsers use that order. No code-mechanism change is otherwise required.

2. **`fields=39` is described as a payload field in one place but as envelope metadata elsewhere.**
   At **P034**, the SCHEMA template says “envelope … + fields=39 + names=…,” while the common envelope is separately frozen as only `format`, `pkt`, `base`, and `type`. This is resolvable, but the wording “envelope type=SCHEMA + format=2 + pkt + base + fields=39” can be read as duplicating envelope keys or changing their order.

   **Required delta:** define each literal non-normal template as one complete ordered token sequence, e.g.
   `[SRJ-EA] STOPRESOLVE format=2 pkt=… base=… type=SCHEMA fields=39 names=…`
   and state once that `fields` and `names` are **SCHEMA metadata after the common envelope**, not part of the 39 NORMAL payload and not common-envelope keys.

3. **The SCHEMA ordering specification is contradictory.**
   At **P032**, the composite order says the key array is part of C’s declarations, but step 4 says emit SCHEMA and step 5 says shadow computation into the value array. At **P038**, the construction-order assertion says “terminal checks, reservation, bSaved check, THEN key array,” despite P032 describing `probe_keys[39]` among declarations at insertion C. In MQL, declaration and population are distinct operations, but the page alternates between “key array” meaning declaration and population.

   **Required delta:** distinguish them explicitly:
   - declarations may occur at C entry without initializers that invoke helpers or read carries;
   - after terminal/reservation/BSAVE checks, populate the 39 keys;
   - emit SCHEMA;
   - perform shadow computations and populate values;
   - emit NORMAL.

4. **The no-pre-branch carry-reference condition is narrower than the actual safety requirement.**
   At **P032/P038**, the scan forbids “bare carry” references before the successful branch. This does not expressly forbid references through a macro, alias, aggregate initializer, pointer/reference alias, or renamed temporary populated from a carry. The page separately excludes macros containing carry identifiers, but not aliases introduced after A/B.

   **Required delta:** state that before `probe_bSaved` succeeds there may be **no direct or indirect value read** from any A/B carry, including through aliases, aggregate initializers, function arguments, references, macros, or copied temporaries. The only permitted carry read before success is `probe_bSaved`.

5. **The CAP path’s “first probe statement” and static initialization language remain ambiguous.**
   At **P032**, the terminal check must be first, yet the C block first declares initialized statics and automatic strings. Static initialization is execution semantics even if trivial. The intended restriction is evidently “first executable probe decision after declarations,” not literally first probe statement.

   **Required delta:** replace “terminal check FIRST” with **“after declaration-only statements with constant/default initialization and before every helper call, carry read other than `probe_bSaved`, sequence reservation, schema population, arithmetic, or emission, execute the terminal check.”**

6. **`StringFormat("%.17g", x)` is called “lossless,” but 17 significant digits guarantee round-trip, not necessarily shortest or unique textual representation.**
   At **P034/P036**, canonicality is ultimately defined correctly as byte equality to the compiler formatter, but repeated use of “lossless form” could be mistaken for shortest-round-trip formatting.

   **Required delta:** replace “lossless form” with **“compiler-canonical round-trip form”** or explicitly state that shortest representation is not required; byte equality to the tested build compiler’s `%.17g` output governs.

7. **Bit equality is required without freezing the offline method.**
   At **P028/P034/P038/P042**, `ladOriginPx == currentPrice` is a mandatory bit-equality check, but the record contains decimal strings, not raw bits. Canonical 17-digit round-trip generally reconstructs binary64, so this is feasible, but the page does not state whether equality means:
   - identical canonical tokens,
   - parsed binary64 numeric equality, or
   - identical reconstructed IEEE-754 bit patterns.
   These differ for `-0` versus `0`.

   **Required delta:** define the check as **identical reconstructed IEEE-754 binary64 bit patterns after parsing canonical tokens**, including signed zero; alternatively require token identity. State the chosen method in P034/P042.

8. **`s0px`/`s1px` poison initialization is overwritten at B even when no candidate exists, weakening the advertised poison guarantee.**
   At **P032**, the outer carries start at `-1e308`, but B always copies inner `s1x_s0px/s1x_s1px`, whose absent values are `0.0` under **L9629-L9630**. Thus the poison proves B was skipped, while `probe_bSaved` already proves that; it does not distinguish absent selector candidates from legitimate zero values. P034/P036 later exempt `0.0`, so this is coherent but the claim that all eight poison values make a concealed bypass fail loudly is overstated.

   **Required delta:** narrow the claim: poison values plus `probe_bSaved` detect failure to execute B or incomplete/crossed B assignments; absent candidate state after successful B is intentionally represented by slot `-1` and price `0.0`.

9. **The acceptance rule for NORMAL count versus C reaches is not independently observable after latch termination.**
   At **P032/P042**, post-terminal C reaches intentionally emit nothing. Therefore “probe silence after terminal” is observable, but total later C reaches are not. The page partly acknowledges this, yet phrases such as one record per non-dead C-reaching evaluation may be read as runtime-verifiable rather than source-structural.

   **Required delta:** label the post-terminal no-emission property and any post-terminal C-reach cardinality as **source-structural only**; output can verify only that no later STOPRESOLVE-family records appeared.

10. **“CAP unreachable by bar count” is not proven solely by the cited invocation census.**
    At **P032/P038**, approximately 3,200 closed bars implies fewer than 20,000 calls only if each closed bar is evaluated at most once in the tester execution. `s_lastBarTime` at **L11209-L11214** establishes once per distinct observed `currentBarTime` during uninterrupted runtime, but restarts/reinitializations could reset the static and the probe sequence together; this remains harmless but should be stated.

    **Required delta:** qualify the bound as applying to a **single uninterrupted tester execution**, with both `s_lastBarTime` and probe statics resetting together on reinitialization; any reinitialization or multiple execution segment must be recorded and fails the one-run equivalence unless expressly permitted.

11. **`entryPx == currentPrice` as a “FREE” textual check is redundant but its token-sharing implementation can mask independent mapping errors.**
    At **P034/P038**, both fields are deliberately populated from `probe_tokPx`. This proves serialization consistency, not that two independently mapped values agree. The page says it is free, which is correct, but occasionally describes the equality as an availability/mapping check.

    **Required delta:** consistently label it only as a **schema/duplication invariant**, never a mapping or runtime-value check. The distinct `ladOriginPx` comparison remains the real check.

12. **The required A1 record-at-C is named mandatory, but the mandatory A3 record-at-C wording is indirect.**
    At **P042**, A3 shadow self-consistency necessarily requires a record, but the explicit mandatory list says “A3 shadow self-consistency,” unlike “A1 record-at-C plus self-consistency.”

    **Required delta:** state symmetrically: **“A3 record-at-C plus shadow self-consistency.”**

13. **The page has inconsistent terminology for terminal behavior.**
    At **P042**, phrases such as “non-probe diagnostics after terminal return” remain, despite **P030-P032** explicitly removing all terminal returns and using latch-and-continue.

    **Required delta:** replace every “after terminal return” occurrence with **“after terminal latch/emission”** or **“after the terminal record.”**

### Analytic ask A

The fifteen items above are the defects, gaps, and imprecisions I find. The principal clearance blockers are **1, 2, 5, 14, and 15**; the remainder should be folded because this packet makes exact serialization and terminal behavior part of acceptance.

### Analytic ask B — better mechanism

The current outer carries plus B capture are acceptable once amended; no materially safer mechanism is necessary for this one probe. A single probe struct would reduce the crossed-assignment surface, but it would enlarge the reviewed delta and add little because the witness and universal identities already validate the scalar carries.

If adopted later, the struct mechanism would touch only:
- **before L9626:** declare and poison-initialize one automatic capture struct;
- **after L9665, before L9666:** populate all capture members and set `saved=true`;
- **at EA L6607 / terminal branches:** retain the immediate `return` and shared terminal latch.
- **No changes to EA L9661–L9670 live selection/gate statements.**

For v14, retain A/B/C and amend the specification defects above; do not alter the future selector, gate, or live path.
## V354-UJFIX3-1 OPEN SOL
Q1 verdict: OBJECT - rule precedence and the confirmation-bar mapping are not sufficiently specified to select (a), (b), or (c) as a complete ruling. R01-R08 establish a reseed followed by a kill and a separate shadow confirmation refusal; they do not establish which gate the operator's rule authorizes changing. Relevant page references: H1 P172-P212, B2 P125-equivalent, B_BODY P234-equivalent.

Q2 verdict: OBJECT - feed divergence versus term design remains unresolved, and the UJ-RERESEED predicate and offline arm derivation are not stated sufficiently to confirm them as grade procedure. R09-R12 establish the logged contender refusals and retest availability, but not the chart comparison or the exact predicate calculation. Relevant page references: H3sub P232-P256 and S3TELEM P154-P165.

These objections are independent. They concern the new questions' specification and evidentiary reach; they do not reopen the carried v13 rulings or authorize any build, run, key use, or money movement.

Q1 change-sentence: Specify whether an operator-qualified reseed may survive a subsequent seedbias refusal, define the `al=0 && ok=1` disposition at each gate, and map the operator's retest and confirmation times to the actual bars before changing B_BODY.

The row-level findings are:

- R01-R03: H1 accepts a SHORT reseed with `al=0 ok=1`, then B2 kills promotion on that same pass. R01 therefore demonstrates reseed acceptance, not surviving admission. The meanings of `al` and `ok`, and their authority over B2, cannot be inferred from their names. At H1 P172-P212 and B2 P125-equivalent, explicit handling must distinguish permission to replace a holder from permission to promote or admit.
- R05-R07: The 09:40 execution evaluates the bar labeled 09:35. Seedbias rejects it, B2 kills promotion, and the shadow poll reports `bodyDir=0 confirm=0`. This supports two recorded refusals. It does not prove that eliminating either refusal alone would produce the owed take.
- R07 versus His words: The operator specifies a 09:35 retest, 09:40 confirmation, and 09:45 entry open. The packet calls the 09:40 pass on the 09:35 bar "his confirmation read." That equivalence needs an explicit timestamp convention. If his chart labels bars by opening time, the 09:40 confirmation bar would ordinarily finish at 09:45; R07 concerns the preceding bar. If his labels use another convention, state the mapping. B_BODY P234-equivalent cannot be ruled against the intended chart candle until that identity is established.
- R02 versus R04: `opConf=0` with `opTerm=A2_CLOSE_BREAK` and a shadow `confirm=1` are different reported evaluations. They are not automatically contradictory. H1 P172-P212 and B_BODY P234-equivalent need a stated relationship between those predicates before either output can substitute for the other.
- R08, R01-R03, and R05-R07 show refusals at selected bars. The Takes sheet's claim of rejection on every SHORT bar from 09:05 through 09:35 is a supplied segment summary, not something these selected rows independently demonstrate.

B_BODY disposition: unresolved between term design, feed divergence, and a bar-mapping discrepancy. R07 establishes the implementation's reported result for its evaluated bar. It does not establish the operator chart's candle direction or prove that the predicate itself is wrong.

Better mechanism: At H1 P172-P212, carry an explicit reseed qualification and its provenance into the subsequent decision. At B2 P125-equivalent, apply a named precedence rule to that qualification, rather than treating successful reseeding as an implicit override. Preserve the carried fail-closed rule unless this new specification explicitly defines an authorized exception. At B_BODY P234-equivalent, compare the exact intended closed candle with the operator's confirmation rule before proposing a direction-predicate change. This is a mechanism proposal, not an adopted exception.

Q2 change-sentence: Grade the two disputed confirmations using matched chart and EA bars plus the exact frozen predicates, adopting a stated UJ-RERESEED predicate and a reproducible offline arm derivation before assigning feed divergence, term design, or both.

The row-level findings are:

- R09: The LONG contender exists, but its reported terminal reason is B_BODY. `arm=1` does not show that the arm branch was eligible or evaluated. The Takes sheet's "arm inapplicable" statement requires the branch-order rule at H3sub P232-P256; it is not established by the telemetry field alone.
- R10: The LONG contender again exists and reports `termC=A2_CLOSE_BREAK`, with `confC=0`. The displayed prices are consistent with the packet's stated small-margin explanation, but the exact strict inequality, reclaim inequality, point unit, precision, and evaluation order are not supplied here. Consequently, the stated "1pt" and "2pts" failures cannot serve as a independently reproduced predicate proof.
- R10 and S3TELEM P154-P165: `c0` needs a defined source and sampling instant. If it is a current-bar value sampled at 14:40:22, substituting a final chart close in an offline derivation would evaluate different information. The grade procedure must preserve the value available at the decision instant.
- R11: The SHORT holder's abort is deferred past evaluation. This establishes the reported ordering, not that the LONG contender was otherwise admissible or that displacement occurred.
- R12: Two LONG retests are recorded. This supports detector availability for the 11 June event, unlike the separately reported 5 June 16:15 detector gap. Retest availability alone does not establish confirmation or admission.
- Q2's change-sentence and verdict requirement name a "UJ-RERESEED predicate," but no formula or precise carried reference identifying that predicate appears in this text. R01's `UJRESEED` event is not a definition of a rere-seed predicate. H1 P172-P212 and H3sub P232-P256 are the relevant cited ranges, but selecting a formula from them would be invention.
- "Offline arm derivation" is likewise named without its algorithm or required inputs. Confirmation as a grade procedure requires the branch eligibility rule, exact inequalities, arm origin and lifetime, point handling, price precision, and sampled values.

Better mechanism: Freeze the existing H3sub P232-P256 predicate, reproduce its decisions offline using decision-time inputs, and compare those inputs with the operator's chart after aligning symbol/feed, timezone, bar labels, line value, and precision. Classify a demonstrated input mismatch as feed divergence; classify a requested change to the reproduced predicate as term design; use "both" only when both are demonstrated. S3TELEM P154-P165 should expose any inputs needed for that reproduction that are currently absent, while remaining diagnostic-only under the carried fence.

Two additional page defects remain:

- The final Takes sheet says Q1/Q2 rule all three owed misses, but neither question specifies a remedy for the 5 June 16:15 detector gap. That miss remains outside the proposed H1/B2/B_BODY and H3sub decisions.
- The Close estimates a future June window at "~50m" while citing a measured RECON76 duration of `1:12:30`. State whether these describe different workloads; as written, the cited measurement does not support the estimate.

The provided record supports the reported take-level regression and identifies decision points worth resolving. It does not yet support a determinate override of B2, a B_BODY predicate change, or confirmation of the proposed Q2 grading procedures.
## V354-UJFIX3-1 END SOL

