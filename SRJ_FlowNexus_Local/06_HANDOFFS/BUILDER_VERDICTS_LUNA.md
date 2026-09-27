# BUILDER VERDICTS — LUNA stream (key seat; merits text filed verbatim here, keys never interpreted here)

## Luna answer - 2026-09-18 - answers v178 relay (packet v15) (AMEND-WITH-DELTA; page-only, not a key; no Ruling-ID stated, filed as entry LUNA-V178-001)

**Verdict: AMEND-WITH-DELTA — do not consume the build/run authorization yet.**

The packet is otherwise internally disciplined: the probe is explicitly print-only, the A→B→C carry mechanism is well fenced, terminal behavior is latched rather than control-flow altering, and the future live rule is cleanly separated from the probe. The amendment is primarily a proof/grammar correction, not a mechanism change. 

### Analytic ask A — defects, gaps, and imprecisions

**1. The 1024-character ceiling arithmetic is definitely off by one.**
P038 says the 38 payload-key names total **339** characters and therefore key structure is **415**; but the actual 38 names listed in P034 total **340** characters. With the packet's own stated value maximum of 526 and envelope length 83, the arithmetic is therefore:

`83 + (340 + 38 + 37 + 1) + 526 = 1025`

not 1024. The journal and verification paragraphs repeat the 1024 figure, so this is not merely a prose typo: the page currently claims a transport bound that its own field list disproves.   

**Required delta:** recompute the complete maximum-length ledger from the exact 38-key list and make the micro-check's observed ceiling and filed bound authoritative. At minimum, 1024 must become 1025; because the integer-width subledger is also not independently reproducible from the page, I would not hard-code 1025 until that ledger is recomputed.

**2. The “13 integer fields = 42” line is not auditable against the 38-field schema.**
The field list contains 15 non-floating/non-datetime positions if Boolean encodings are counted with integer-like serialized fields (`dir`, `liveSel`, `ext1Defined`, `ext1Imb`, `wouldGate`, `ext1Slot`, `s0slot`, `s0imb`, `s1slot`, `s1imb`, `extSideOk`, `wouldAdopt_monotone`, `actualGate`, `emitSeq`, plus `extDistPts` as an integer-valued numeric). So the page does not explain which two positions are excluded from its “13 integer fields” bucket or how the stated 42 was derived. 

This does not prove the final true maximum is 1028 because some field maxima are mutually exclusive, but it **does** mean the 526 ledger cannot currently be independently reconstructed from the page. That is exactly the sort of thing the line-ceiling gate is supposed to eliminate.

**3. The archive-vs-probe price comparison rule is underspecified in the general comparator.**
P028 explicitly gives A2 an archive-precision comparison rule, but P042 later says general TP_ELECT price operands must match “exact at printed precision” while the two sources use different representations: archived values are five-decimal display values, whereas probe prices are `%.17g` binary64 round-trips. The contract needs to say explicitly whether the probe operand is rounded/formatted to archive precision before comparison, or whether both are reconstructed and compared under a defined tolerance. Otherwise two reasonable graders can implement different comparisons.  

This is an acceptance-contract ambiguity, so it should be closed before the run.

**4. P034 momentarily calls `dir` part of “booleans as 0/1,” then correctly treats it as a signed integer domain.**
The later grammar is clear: native `(int)g_dir`, domain `{1,-1,0}`, with `0` halting and `-1` parser-valid-only. But the earlier wording “booleans as 0/1” is contradictory when read literally. It should say “Boolean fields as 0/1; `dir` as decimal integer.” 

This is minor, but the packet is explicitly freezing a byte-level grammar, so the terminology should be exact.

**5. The future-live hazard is real and correctly flagged, but remains an unresolved semantic defect outside this probe.**
P007 explicitly says the future rule can adopt a defined finite ext1 without a protective-side condition, even though the landed selector's `s0/s1` arms enforce protective-side candidates. That means the future rule can structurally admit a non-protective stop. The packet acknowledges this as an open hazard and says the validity-guard choice is deferred to the live-activation relay. 

I am **not** treating this as a blocker to the print-only probe because the packet explicitly excludes live activation from this authorization; it must, however, remain a hard item in the later live relay.

**6. The downstream-ordering evidence is correctly out of probe scope, but it remains source-mapped rather than reproduced here.**
The packet explicitly freezes the intended order as selector → R-gate → veto → latch → SIGNAL → session mark and says the last portion is source-mapped, not probe-proven. That is coherent with the declared scope, so I would not convert it into a probe blocker. It should simply remain exactly as stated: a source-proof obligation, not something the STOPRESOLVE output is allowed to “prove.” 

### Analytic ask B — better mechanism

I do **not** see a materially better probe mechanism for the stated selector→stop→R-gate→shadow goal.

The current A/B/C architecture is appropriately narrow: A captures the pre-selector value, B copies the selector result after the existing selection block, and C observes the already-computed live gate quantities without rewriting the live path. The packet also explicitly prevents pre-success carry reads and uses the witness plus selected-price identities to catch skipped/crossed assignments. 

The one mechanism improvement I would make is **not to change the probe code at all**, but to make the synthetic pre-build serializer test the authoritative source for the maximum-line bound. Generate the exact 38-key NORMAL record from the same key/value construction, fill every field with the filed maximum-width token for its field type, measure the actual resulting byte length, and file that number. Then P038's arithmetic becomes explanatory rather than a second, manually maintained proof path. This would touch only the existing pre-build micro-check/verification machinery, not the strategy source region around L9626-L9670. 

### Clearance action

So the disposition is:

**AMEND-WITH-DELTA.**

The minimum required amendments are:

1. Recompute the 38-key length and the full value-max ledger; retire the currently stated **1024** until that recomputation is filed.
2. Make the archive/probe price comparison rule explicit in P042.
3. Correct the `dir` grammar wording.

After those textual/proof deltas, I see no remaining page-level defect that warrants a halt to the proposed **single print-only build + single run**. The packet's own decision question and ask structure confirm that this is the exact disposition being requested.

## Luna answer - 2026-09-18 - answers v179 relay (packet v16) (CLEAR one print-only probe build plus one run; page-only, not a key; no Ruling-ID stated, filed as entry LUNA-V179-001)

## Verdict: **CLEAR**

**Clear `PACKET_EXT1LIVE-001 v16` by name for exactly one print-only probe build plus one run under the stated envelope.** No amendment is required for this run, and nothing here clears the future rule or live activation. The scope is explicitly limited to section-3 probe instrumentation, with live activation reserved for a later relay and explicit authorization.  

The decisive point is that the probe is structurally observational: A carries the pre-selector `slRef`, B snapshots the completed selector outputs, and C sits after the actual R-gate without replacing the live selector/gate path. The packet also fixes the terminal-latch behavior, field grammar, shadow arithmetic, and mandatory cross-checks before the build is spent.  The cited landed selector itself confirms the relevant ordering: selector at EA L9661-L9665, R-gate at L9670, then the recorder region begins. 

### Analytic A — defects, gaps, and imprecisions

**1. P038 slightly overstates the 1023 figure as a true “worst-case.”**
The arithmetic `83 + 416 + 524 = 1023` is internally correct, including the 15 one-to-five/six-character integer fields and the 16/4/3 type buckets. The weakness is that `ext1Slot <= 4` is stated in the maxima ledger, while the page explicitly proves the selector walk's offset cap at 4000 but does not independently spell out the producer-side upper bound for `g_sl41_slot`. The packet itself acknowledges that the producer and selector walks do not terminate identically.  

This is **not a clearance blocker**, because the packet explicitly makes any wider-than-filed token/line an acceptance failure rather than silently accepting it, and the transport micro-check is only a defensive bound. Still, “worst-case NORMAL” would be more precise as “worst-case under the filed producer-slot width assumption,” or the build gate could explicitly assert `ext1Slot <= 9999`.

**2. P038 delegates the exact formatter/parser implementation identity to the build record rather than pinning it in the packet.**
The packet requires a named reference formatter implementation and staged fixture/readback validation, which is sufficient as an operational gate, but the page itself does not identify the implementation/version/hash. That is a **verification dependency**, not a logical defect in the probe specification. 

**3. The packet is intentionally dependent on pre-build disk assertions for several page-level claims.**
That is appropriate under this relay's rules, but it means claims such as the 165-site `InpDebugLog` purity census, exact publication dominance, and the compile-time `MathIsValidNumber` behavior are requirements on the build gate rather than facts independently established by the page. The packet correctly makes those failures halt conditions rather than silently assuming them. 

**4. The 17:00/16:55 evidence remains asymmetric by design.**
The dated `2026.08.27 17:00` post-gate presence is actually evidenced, while other 17:00 instances and the 16:55 S5 case depend on the existing diagnostic contract. That is clearly labeled rather than conflated, so this is a **scope limitation, not a defect**. 

**5. The future rule retains a known non-protective-side hazard.**
The future semantics explicitly allow any defined-and-finite ext1, while the existing selector enforces protective-side candidates. The packet correctly flags that distinction and keeps it outside this probe's clearance. That remains a substantive live-relay issue, but it does **not** justify withholding this print-only probe authorization. 

I see **no additional page-level defect that warrants converting this to amend-with-delta or halt**.

### Analytic B — better mechanism

For the **probe objective**, I do not see a materially better mechanism than A/B/C.

The current mechanism is well matched to the stated question:

`existing producer → existing selector → snapshot completed selector → existing R-gate → shadow recorder`

It avoids a second resolver call, avoids changing selector/gate operands, avoids live-state writes, and uses the already-published ext1 tuple. The landed code confirms the selector is a self-contained block ending at L9666, followed by the untouched gate calculation at L9668-L9670. 

For the **future live activation**, I would prefer a typed/tagged result propagated directly from the resolver rather than relying on globals as the carrier: effectively return `{defined, px, slot, barTime, imb, source}` from the producer and carry that explicit result into the L9626-L9665 selection site. That would touch the `ComputeSlReference` interface/publication around EA L5291-L5497, the S5 call at L8779, the selector at L9626-L9665, and the downstream selection at L9670. The tradeoff is a materially larger live-path delta, so I would **not** substitute it for this probe.

### Final ruling

**CLEAR — `PACKET_EXT1LIVE-001 v16` by name, exactly one print-only probe build plus one run.**

The acceptance contract is sufficiently closed to make the single run meaningful; the remaining issues are explicitly contained as build-gate dependencies or future-relay matters, not unresolved defects requiring another packet revision. The requested answer form and scope are exactly those stated in the relay. 
## Luna answer - 2026-09-18 - answers v180 relay (packet v17) (CLEAR one print-only probe build plus one run; page-only, not a key; no Ruling-ID stated, filed as entry LUNA-V180-001)

## CLEAR

**Verdict: clear** for exactly **one print-only probe build plus one run** under the stated envelope. I do not see a page-level defect that warrants an amend or halt. The authorization remains limited to section-3 instrumentation; the future live rule and downstream ordering remain uncleared exactly as stated.

The decisive point is that the probe is observationally separated from the live selector/gate path: A captures the incoming `slRef`, B captures the selector result after the existing L9661-L9665 logic, and C sits after the unchanged L9670 gate. The packet also explicitly forbids returns/unload behavior and keeps terminal behavior as probe-owned latching rather than strategy control-flow change.

### Analytic ask A — defects / gaps / imprecisions

**A1 — “all record types” direction wording is broader than the actual templates.**
P001 says `dir {1,-1} all record types`, but SCHEMA and CAP do not carry `dir`; P034 correctly narrows the domain to record types that actually carry it, namely NORMAL and BSAVE_FAIL. This is a wording defect only, because the authoritative field rule is already narrower.

**A2 — the 1024-byte ledger components are not named with a uniquely mechanical decomposition.**
The current text gives `1024 = 83 + 416 + 525`, while the historical delta records a `415 + 526` decomposition. Both sum correctly to 1024, so there is no arithmetic failure; the imprecision is that the page does not make the boundary between “key structure” and “value maxima” explicit enough to explain the one-byte transfer. The total and the micro-check requirement remain intact.

**A3 — a few prerequisites are asserted as builder/disk facts rather than page-provable facts.**
The page relies on the build record for the exact `MathIsValidNumber` behavior, the complete 165-site purity census, the effective-input manifest, the exact formatter behavior, and the detailed field-width ledger. That is not a clearance blocker because v180 expressly defines those as STAGE-1/disk gates and separately says chat review is page-only. It does mean this **CLEAR is conditional on those stated disk gates remaining true**, not an independent verification of them.

**A4 — `ext1Imb=3` is wider than the inline selector comment shown on the page.**
P036 permits `-999,-1,0,1,2,3`, while the pasted selector comment at EA L9679 describes the older `0/1/2` flow-code set. The packet says the wider domain is established from the FL133-139 source/build evidence, so this is an evidence-dependency/imprecision rather than a reason to halt.

**A5 — the terminal parser contract could explicitly reject trailing whitespace.**
The grammar specifies one ASCII space *between* fields and no internal whitespace, but it does not state an explicit “no trailing whitespace before EOL” rule. The actual constructor appears to avoid it, and the byte-identity checks reduce the practical risk, so I regard this as a minor grammar-tightening point, not a clearance blocker.

**A6 — the future live rule has a known protective-side hazard, and the page correctly leaves it open.**
The packet itself flags that the future rule would currently adopt any defined+finite ext1 without the existing `SlimbProtectiveSideOk` protection. That is a real open live-relay issue, but it is explicitly outside this probe authorization and is already carried forward for the later live relay.

Those are the page-level issues I would record. None changes the v180 probe clearance.

### Analytic ask B — better mechanism

For **this probe**, I would **not replace the current A/B/C mechanism**. It is deliberately minimal: it captures the actual selector inputs/outputs instead of refactoring the live selector, while C mirrors the R-gate arithmetic without substituting anything into the live path. The code neighborhood is exactly the relevant one: EA **L9626-L9665** for the selector, **L9668-L9670** for the live gate, and the new probe C immediately after L9670.

The only architectural improvement I would consider for the **later live-activation relay** is a pure selector helper returning a structured result such as `(sel, s0, s1, slots, imbalances)`, with the live path and diagnostic path consuming the same helper. That would touch the selector block at **EA L9626-L9665** and the future replacement site at **EA L9661-L9665**, but I would **not** introduce that refactor into this print-only build: it expands the live change surface precisely when the current packet's purpose is to observe the landed behavior, not rewrite it. The packet already makes that separation explicit.

**Final ruling: CLEAR — v17 by name, one print-only build, one run, under the frozen envelope; no amend-with-delta and no halt.**
## Luna answer - 2026-09-19 - answers v181 relay (packet v18) (CLEAR one print-only probe build plus one run; page-only, not a key; no Ruling-ID stated, filed as entry LUNA-V181-001)

**CLEAR**

On the page itself, I see no defect that requires blocking the one authorized print-only build + one run. The probe scope is explicitly confined to selector → selected stop → R-gate → shadow, with live activation and downstream ordering excluded; A/B are the only executable insertions, C is instrumentation specification, and the run is fenced by the stated STAGE-0/STAGE-1, exact-diff, purity, arity, canonical-format, predicate, ceiling, and 0/0 compile gates.

### Analytic ask A — defects, gaps, imprecisions

1. **C terminology is still internally inconsistent.**
   L3 says "A and B as text; C as specification," while L13 says "exact-diff = insertions A+B+C only," and P030 again calls C "specification-only." The intended rule is recoverable, but the literal wording should be normalized to: **A+B are inserted source text; C is specification-only, checked by exact source-diff against that specification at STAGE-1.** This is a wording defect, not a run blocker.

2. **The wire-prefix parser rule is referenced rather than reproduced.**
   P034 requires stripping the terminal's "documented timestamp/thread prefix" in its exact form, but the actual prefix grammar is said to be documented at STAGE-1 rather than stated on the page. That is acceptable as a builder-gate dependency, but it weakens the claim that the page alone completely specifies transport parsing.

3. **The closed enum set is likewise delegated to the build record.**
   P034/P038 require exact closed-enum strings for site/state fields but leave the actual enumeration to STAGE-1. Again, this is explicitly gated rather than silently assumed, so I do not treat it as clearance-blocking; it is a page-completeness limitation.

4. **`walkEnd` remains a deliberate future-facing schema ambiguity.**
   P034 freezes 38 payload fields but says `walkEnd` is "RECOMMENDED" as a 39th field, with the council still to dispose of that alternative. Because acceptance is explicitly against the frozen 38-field form, this does not block v18; it should simply remain out of this run's grading surface.

5. **The future-live side condition remains materially open.**
   P007 expressly says the future rule currently does **not** require `SlimbProtectiveSideOk`, even though the landed s0/s1 selector arms enforce protective-side selection. That is a real semantic hazard for later live activation, but the packet explicitly keeps it outside this probe and carries the issue forward. It therefore does not block the v18 print-only clearance.

6. **The page correctly distinguishes page proof from disk proof, but that distinction is essential here.**
   The clearance is justified by the fact that the page makes the disk assertions explicit gates rather than pretending the chat itself proves hashes, compiler behavior, census results, or log transport. That is sound; it means my CLEAR is specifically a **rule-page clearance**, not independent verification of those machine facts.

I do **not** see a hidden contradiction in the 1024-byte ledger: the stated 83-byte envelope + 416-byte key structure + 525-byte value maxima totals exactly 1024, and the poison-inclusive margin is separately stated as 1056. The payload field count and `emitSeq=34` / `ladOriginStamp=38` placement are also internally consistent on the page.

### Analytic ask B — better mechanism

For the **print-only probe**, I do **not** see a better mechanism that is safer than the current A/B/C design without enlarging the live-code touch surface. The current arrangement captures the selector outputs at B, then performs the shadow mirror only after the actual R-gate operands exist at C, while the packet separately requires the selected-price identities, operand reconstruction, origin join, and external SIDE1E/SIDE1X checks.

For the **later live activation**, the mechanism I would preserve is the one already carried in P046: reuse the existing `SlimbProtectiveSideOk` predicate at the selector boundary rather than inventing a second side test, touching the selector region around EA **L9627-L9660 / L9661-L9665**. That keeps the already-landed protective-side invariant as the source of truth.

### Final ruling

**CLEAR — PACKET_EXT1LIVE-001 v18 may proceed to exactly one print-only probe build plus one run under the frozen envelope.** No delta is necessary for the probe. The five/six items above are non-blocking page imprecisions or explicitly deferred live-relay matters, not reasons to amend or halt this authorization. The packet itself says the next new build/run requires fresh authorization.

The requested answer form is therefore:

**CLEAR.**
## Luna answer - 2026-09-19 - answers v182 relay (packet v19) (CLEAR one print-only probe build plus one run; page-only, not a key; no Ruling-ID stated, filed as entry LUNA-V182-001)

**CLEAR — PACKET_EXT1LIVE-001 v19.** The page supports one print-only probe build plus one run under the frozen envelope, with clearance limited to section 3 insertions A/B/C; it does not clear the future live rule or live activation.

The core probe boundary is coherent: A captures the pre-selector value, B captures the selector result without computation, and C sits after the existing R-gate, with the terminal-latch ordering and no-return/no-unload behavior explicitly frozen.  The landed selector/gate neighborhood is also consistent with the stated placement: selector closes at EA L9666, R-gate is EA L9670, and the existing diagnostic recorder begins at EA L9683.

### Analytic ask A

I do **not** see a blocking defect that should turn this into an amend or halt. I do see these non-blocking imprecisions/gaps:

1. **P028's interval formula is stated too generally.**
   The formula `[(n-1)/(d+1), (n+1)/(d-1)]` requires `d > 1`; otherwise the upper endpoint is undefined. Every actually filed denominator here is well above 1, so this does not affect this run, but the sentence should technically say "for d>1."

2. **P011's heading overstates one item in its list.**
   It says "Why slots go absent," but then includes the `ReadFlow` failure at L9649/L9655 where a slot is already populated and the consequence is failure of the imbalance predicate, not slot absence. The body itself correctly distinguishes that case, so this is terminology, not a mechanism defect.

3. **P034's "emitted ... first" wording could be read as multiple emissions.**
   The literal C implementation actually formats into `probe_vals[]` and emits one assembled NORMAL line at the end; the page does clarify that "printed independently" means formatting precedence within one record. I regard the clarification as sufficient for this clearance, but the prose could be made sharper.

4. **The producer-to-global handoff remains intentionally disk-gated rather than page-proven.**
   That is acceptable under the standing review rule because the relay explicitly makes STAGE-1 responsible for proving that the S5 call at EA L8779 is the last `ComputeSlReference` exit before C and that publication at L5496-L5497 is reached and is the consumed tuple. This is a verification dependency, not an unresolved page defect.

5. **The future live rule still carries the known protective-side hazard.**
   P007 expressly says the future condition is only `ext1Defined && finite slExt1` and does not yet include `SlimbProtectiveSideOk`; it also explicitly carries that as a live-relay FLAG. Because this packet clears instrumentation only, that is correctly out of scope rather than a probe blocker.

6. **The downstream ordering claim is deliberately source-mapped, not probe-proven.**
   That limitation is explicit and consistent: selector → R-gate → shadow is the probe's evidentiary surface; veto/latch/SIGNAL/session-mark remain source-mapped, with the two site-snapshot fields strikeable only if symbol identity cannot be established. That is an appropriate boundary for this packet, not a missing proof.

Nothing in those six points requires changing the frozen A/B/C literal before this single probe.

### Analytic ask B

I do **not** see a better mechanism that I would substitute for this probe.

The current array-based C design is deliberately verification-heavy but mechanically constrained: one 38-key array, one 38-value array, interleaved stores, one SCHEMA construction, one NORMAL construction, explicit poison/witness handling, and fixed terminal ordering. Changing that to a helper/struct/shared resolver would enlarge the verification surface rather than improve this particular print-only objective.

The only plausible architectural alternative already named in the packet is the shared rung-pair/helper approach, but that would touch the live selector at EA L9627-L9660, the shadow walk at L9685-L9718, and the resolver around L5457-L5461. The packet correctly keeps that as a separate live-relay matter.

**Verdict: CLEAR.** One print-only build plus one run is authorized for `PACKET_EXT1LIVE-001 v19`, and only for section-3 A/B/C instrumentation under the stated STAGE-0/STAGE-1 envelope. The future ext1 adoption rule and live activation remain uncleared.

---

## Luna answer - 2026-09-19 - answers v183 relay (packet v20) (amend-with-delta, 1 blocking + gaps + wording; page-only, not a key; no Ruling-ID stated, filed as entry LUNA-V183-001)

**Verdict: amend-with-delta — do not build or run v20 yet.**

The packet is very close, but there is one page-provable blocking defect in the frozen C literal, plus two narrower consistency gaps worth folding into the same delta.

### Blocking defect

**1. `ladOriginStamp` is never populated.**
At P032, the 38-key array correctly defines field 37 as `ladOriginStamp`, but the value population contains no `probe_vals[37] = ...` assignment. The prefill loop therefore leaves field 37 as `"?"` on every NORMAL record.

That directly contradicts P036/P038, which require the origin quadruple — including `ladOriginStamp` — to print on every record and require the stamp comparison as the freshness falsifier.

It also means the claimed **38+38** construction is not actually present on the page: the 38 keys are populated, but only 37 value fields are explicitly populated after the 38-value prefill.

**Required delta:** add the missing field-37 store using the existing `probe_tmpA`, e.g. immediately after the origin-site population or at the field-37 position in the fixed 5b order:

```text
probe_tmpA = TimeToString(g_sl41_oStamp, TIME_DATE|TIME_MINUTES);
StringReplace(probe_tmpA, " ", "-");
probe_vals[37] = probe_tmpA;
```

Then re-check the claimed 38-value count and the exact-diff construction-order assertion. This does **not** require a live-path change.

### Additional defects/gaps

**2. The stated non-finite shadow-distance serialization rule is stronger than the literal C code.**
P036 says a non-finite *constructed* `slDistExt1` must become `INVALID`.

But P032 only sets `probe_shadowOk` from the finiteness of `g_sl41_px` and `currentPrice`; after `MathAbs(currentPrice - g_sl41_px)`, the serialization of `rawDenExt1` does not independently test `probe_slDistExt1` for finiteness. Likewise `rExt1` is formatted without a finiteness test on the quotient itself.

This is an extreme-domain edge rather than an ordinary FX-path expectation, but the packet explicitly claims coverage for it. Either add the intermediate/result finite checks to the literal, or narrow the P036 rule to exactly what the code proves.

**3. The same quotient-result issue exists for `rLive`.**
The literal checks finite `slDist` and `tpDist`, then formats `tpDist / slDist` directly. It does not test whether the evaluated quotient itself is finite before serialization.

P038, however, calls a non-finite evaluated live quotient an independent acceptance failure, while P036 says non-finite ratios serialize as `INVALID`.

That contract should be made mechanically identical: either test the quotient before storing it, or explicitly define the compiler's non-finite quotient token as an accepted diagnostic token. The current wording and literal are not identical.

**4. Minor wording imprecision: "literal source text" has a stated exception.**
The opening repeatedly says A/B/C are cleared as the literal source text in P032, while P032 itself admits that the two veto/session RHS bindings are supplied by the STAGE-1 build binding rather than literally reproduced on the page.

The exception is explicitly bounded, so this is **not independently blocking**. The cleaner wording is "literal source text, except the two explicitly named STAGE-1-bound RHS expressions."

### Analytic ask B — mechanism

I would **not replace the key/value-array mechanism**. Given the stated goal, the arrays plus exact-diff gate are a defensible verification surface.

For the missing provenance field, the better mechanism is simply to complete the existing design rather than add another helper or storage surface: reuse `probe_tmpA`, serialize `g_sl41_oStamp`, store it at `probe_vals[37]`, and add a STAGE-1 assertion that every index `0..37` has exactly one post-prefill population in the NORMAL branch. The only source touched is the probe C insertion around its existing value-population code; the live selector/gate/downstream lines remain untouched.

So this is **amend-with-delta**, not a redesign and not a reason to withdraw the probe. The missing stamp assignment must be folded, and the quotient-finiteness wording/code should be reconciled before v20 receives build/run clearance.

---

## Luna answer - 2026-09-19 - answers v184 relay (packet v21) (CLEAR one print-only probe build plus one run; page-only, not a key; no Ruling-ID stated, filed as entry LUNA-V184-001)

**Clear.**

The page supports clearance of `PACKET_EXT1LIVE-001 v21` for the single print-only probe build + single run under the stated envelope. The scope is explicitly limited to section-3 instrumentation; it does not authorize the future live rule or live activation.  The probe construction has a fixed A→B→C arrangement, explicit terminal/reservation ordering, 38-field schema, no return/unload path, and the stated build-time exact-diff/definite-assignment/no-write gates.  Acceptance is also explicit about mandatory self-consistency, provenance joins, A1/A2/A3 checks, terminal cardinality, and the downstream-ordering boundary.

### Analytic ask A — defects, gaps, and imprecisions

1. **Stale history wording.** L8 says "this packet v1 through v19" and "relays v162 through v182," while this relay is v184 and explicitly folds v183 material; v20 is also explicitly described as withdrawn. This is documentary inconsistency, not a probe-logic defect.

2. **Runtime-vs-build wording for string domains.** P034 says closed-enum strings are subject to "rejection at build," but `g_sl41_oSite` and the two strikable snapshot values are runtime values. The actual protection is the combination of source/domain binding plus run-time token validation. That distinction should be stated more literally. This does not block because P034/P036 already make parser rejection and strike behavior explicit.

3. **"Identical shape on all four types" is too broad.** The four records share the fixed envelope/type discriminator, but SCHEMA, CAP, BSAVE_FAIL, and NORMAL do not have identical full wire shapes. "Common envelope shape" would be more exact. Non-blocking wording issue.

4. **`entryPx` "always available" is semantically loose.** It is always sourced from `currentPrice`, but `currentPrice` itself can be non-finite and serialize as `INVALID`; "field is never strikable" is the precise invariant.

5. **The gate-constant wording is slightly awkward.** P038 says `gateConst` "must parse to 1.0" while the filed canonical token is anticipated to be `1` under `%.17g`. Numerically those are identical, but the sentence should distinguish numeric value from canonical token more cleanly. Non-blocking.

6. **"Far from 1.0" is qualitative where a numeric condition already exists.** The four non-fire rows are explicitly given, so the stronger wording is simply that they are outside the exact grading boundary/interval. Again, this is precision of prose, not a logic gap.

7. **Evidence boundary remains deliberately external to the page.** The dominance proof, exact bound/RHS bindings, 165-site debug census, and disk hashes are asserted as STAGE-1/disk gates rather than page-proven facts. That is an explicit contract of this relay, not a reason to halt; it just means the clearance is conditional on those gates actually being executed as written.

I do **not** see a remaining page-level semantic defect in the A/B/C probe mechanism that warrants an amend-with-delta or halt. The major prior failure classes are explicitly described as withdrawn/adopted, and the carried live-side alternatives remain outside this authorization.

### Analytic ask B — better mechanism

For **this probe**, I see no materially better mechanism that preserves the frozen scope. The current carry-and-save arrangement is deliberately conservative: A captures the incoming value, B saves the selector outputs before the selector scope closes, and C performs all shadow/serialization work after the live R-gate without substituting into live control flow.

For the **future live-activation relay**, the only mechanism I would consider cleaner is the already-carried shared rung-pair resolver: one common implementation used by the live selector and the shadow path, rather than maintaining two structurally parallel walks. That would touch the live selector at EA L9627-L9665, the shadow walk at L9685-L9718, and the producer/resolver neighbourhood at L5457-L5461. The packet correctly keeps that out of this clearance because it changes live code and therefore needs its own authorization.

**Decision line:** **CLEAR — PACKET_EXT1LIVE-001 v21, one print-only probe build + one run under the stated envelope.** The clearance does not itself spend the separate run word or authorize live activation.

---

## Luna answer - 2026-09-19 - answers v185 relay (packet v22) (CLEAR one print-only probe build plus one run; page-only, not a key; filed as entry LUNA-V185-001)

[BUILDER FILING NOTE 2026-09-19: the "Luna:" label in the operator transport message is his source framing, not verdict text. Body below is the pasted verdict whole.]

## Review-seat verdict: **CLEAR**

Clear `PACKET_EXT1LIVE-001 v22` by name for exactly **one print-only probe build plus one tester run** under the frozen envelope. I do not see a remaining page-level defect that warrants another probe-code delta before this run. The authorization remains limited exactly as the packet states: section-3 instrumentation only; no future rule, no live activation, no trading, and no downstream source-map claims being converted into probe proof.

The core instrumentation is sufficiently constrained: A/B are carries only, C is post-gate, the terminal latch is silence-only, `probe_bSaved` is tested before other carry reads, sequence reservation occurs after that test, the schema is once-only, and the 38-field assembly is fixed in P032/P034.  The STAGE-1 contract then supplies the necessary exact-diff, scope, purity, no-write, publication, join, input, compile, and line-length gates before execution.

### A — remaining defects, gaps, or imprecisions

**1. “No prior run printed C-site shadow operands” is too broad.**
The NOVEL-EVIDENCE sentence says no prior run printed “C-site shadow operands.” That is not literally true given the packet's own carried archive context: the older `SIDE1E_STOPSHADOW` diagnostics already exist in the post-gate C neighbourhood. What is genuinely novel is the **new 38-field `STOPRESOLVE` C recorder** and its full shadow/live/provenance payload. This is documentation-only, not a probe blocker.

**2. The standing history sentence is stale by one version.**
The project brief says “this packet v1 through v21” although the present relay is v185 carrying packet v22. Again, administrative wording only; it does not affect the executable contract.

**3. The two site-snapshot RHS bindings are not page-self-contained.**
P032 deliberately leaves `probe_vals[14]` and `[15]` as the sole STAGE-1-bound RHS exceptions. That means those two exact source bindings are not independently reviewable from the pasted literal alone. The packet nevertheless makes the build-time exact-diff/scope/definite-assignment checks mandatory, so this is a **reviewability dependency on STAGE-1**, not a clearance blocker under the stated review model.

**4. `wouldGate` wording could be tighter around invalid shadow inputs.**
The code uses the literal live-equivalent predicate, but when `probe_slDistExt1` is non-finite or otherwise invalid, the expression is still syntactically evaluated against the initialized diagnostic state and the packet separately classifies that row as invalid/unavailable for grading. The acceptance text does cover this, but “literal predicate” should be read as **literal on valid shadow operands**, not as a claim that invalid-input output is meaningful evidence. This is already bounded by P034/P036; no delta is required for this run.

**5. The future live rule still has an explicit side-guard hazard.**
P007 expressly says the future defined+finite ext1 adoption is not yet protective-side guarded, while the landed selector's `s1x_sel` 0/1 arms are structurally protective-side filtered. That remains a real **future live-relay defect/decision point**, but it is correctly fenced outside this probe authorization. It must not be silently treated as resolved by the probe.

**6. The future relay should carry the C-site direction-domain precondition forward explicitly.**
This packet does gate `g_dir` at C to `{DIR_LONG, DIR_SHORT}` and halts on `0`, but that requirement is a probe contract rather than a complete statement of the future live selector semantics. The future relay should explicitly preserve that precondition rather than relying on the probe's domain assertion. Again, not a v22 blocker.

Those are the residual issues I would record. None changes the one-run decision.

### B — is there a better mechanism?

**Not for this particular one-run authorization.** The A/B/C carry design is deliberately more auditable than introducing another helper or refactoring the live selector. It captures the selector outputs at the only useful boundary, then observes the already-computed live gate operands immediately after the gate, without substituting the rule being tested.

A genuinely cleaner architectural alternative would be to centralize selector/shadow calculation into one shared pure helper so the live selector and shadow path cannot drift. That would touch the selector neighbourhood around **EA L9626-L9666**, the existing shadow/recorder neighbourhood around **EA L9683 onward**, and the relevant ext1/ladder-resolution code around **EA L5457-L5461**. P046 already carries that sort of mechanism as a future alternative. It is **not better for v22**, because it creates a larger source delta and a new review surface precisely when the purpose here is a narrowly observational, no-control-flow-change probe.

So I would **not amend v22 for B**.

### Final disposition

**CLEAR — `PACKET_EXT1LIVE-001 v22`**

Scope: **one print-only build + one run only**, under the exact v22 envelope.

---

## Luna answer - 2026-09-19 - answers v186 relay (packet v23) (CLEAR one print-only probe build plus one run; page-only, not a key; filed as entry LUNA-V186-001)

[BUILDER FILING NOTE 2026-09-19: the "Luna:" label in the operator transport message is his source framing, not verdict text. Body below is the pasted verdict whole.]

**CLEAR.** I find no page-level defect that requires an amend-with-delta or halt for the specifically authorized **one print-only build plus one tester run**. The authorization remains limited to section-3 instrumentation; it does not clear the future live rule or live activation.

The core construction is internally coherent: A captures the pre-selector value, B saves the post-selector state before the selector scope closes, and C is reached after the existing R-gate without replacing its operands or control flow. The packet also freezes the reservation/terminal ordering, 38-key/value schema, transport ceiling, and pre-build exact-diff gates.

### Analytic ask A — defects, gaps, imprecisions

**1. The two STAGE-1-bound assignments are not actually visible in the cleared source text.**
The packet says the only exception to the literal C text is the two RHS expressions for `vetoStateAtSite` and `sessionUseAtSite`, but the page shows the literal assignments as `"-"` and delegates the real RHS to an addendum. The page does specify the permitted slots and says the complete RHS, type/domain, width, formatter, and purity constraints must be filed at STAGE-1. That makes this **non-blocking**, but it is the least self-contained part of the authorization.

**Recommended delta:** state explicitly that the only mutable C-text positions are `probe_vals[14]` and `[15]`, and that any other difference from the pasted literal invalidates the exact-diff gate.

**2. “Every C-reaching evaluation” is slightly too broad for the reservation language.**
The C terminal latch deliberately makes later C reaches silent; those post-terminal evaluations do **not** reserve an `emitSeq`. Elsewhere the packet correctly distinguishes reserved evaluations from subsequent probe-silent C reaches. The specification should consistently say **pre-terminal C reaches** when describing the reservation unit. This is wording only.

**3. The diagnostic-comparison boundary around newly discovered S5 rows could be sharper.**
The acceptance text says a newly visible S5 evaluation is discovery evidence whose disposition depends on the diagnostic comparison, while later saying differences outside the contract's row set are out of scope. Those statements can coexist, but the transition is implicit. I would state: **new row → discovery; map to an in-scope contract row or explicitly classify out-of-scope; never silently coerce either way.**

**4. “Undecided” versus “run-failing” is occasionally compressed into one sentence.**
For example, an INVALID operand can make a particular shadow prediction undecidable while still being an overall acceptance failure. The packet does distinguish those concepts elsewhere, but the prose could say “prediction classification = undecided; run acceptance = fail” to remove any possible parser disagreement.

**5. The 1024/1056 ledger is sound as written, but the authority hierarchy could be stated once.**
The page contains both the conservative 1024 ceiling and the poison-inclusive 1056 ceiling, plus historical bucket totals. It ultimately says the 1024 figure is the authoritative normal-line bound and 1056 is the poison-inclusive transport check. That is enough, but a one-line declaration such as **“1024 = normal transport bound; 1056 = prefilled-poison rejection bound; neither is a runtime allowance”** would eliminate historical-register noise.

**6. The future live rule retains a substantive side-condition hazard, but it is explicitly out of this clearance.**
The future adoption rule in P007 is intentionally not protected by `SlimbProtectiveSideOk`; the packet itself flags that adopting a defined finite ext1 can therefore remove the protective-side invariant enforced by the landed selector. That is a genuine future-relay issue, not a reason to block this print-only probe.

**7. No page-level contradiction appears in the A/B/C mechanics themselves.**
The 38 key stores, 78 value stores, one prefill, the three loops, and four emission sites are mechanically consistent with the pasted literal; I independently counted the literal's indexed key/value assignments and obtained **38 keys and 78 value stores**. That supports clearing the stated instrumentation rather than reopening the old census disputes.

### Analytic ask B — better mechanism

For **this probe**, I would not replace the frozen mechanism. The current A/B/C design gives a narrow verification surface and directly tests the selector output without changing the live selector or R-gate.

For the **future live activation relay**, the cleaner mechanism is already identified in P046: route the ext1 candidate through the existing `SlimbProtectiveSideOk` predicate rather than inventing a second side-test, with the adoption condition immediately around the existing selector region at **EA L9661-L9665**. The live relay should then re-site the B capture after that replacement and re-prove its dominance; P009 already warns that the present B location cannot be silently reused.

### Final disposition

**CLEAR — one print-only build and one run under the stated envelope.**
No page-level blocker found. The six wording/precision points above are non-blocking; none changes the cleared probe's allowed source surface or acceptance contract. The future side-guard issue remains explicitly carried to the live-activation relay.

---

## Luna answer - 2026-09-19 - answers v187 relay (packet v24) (CLEAR one print-only probe build plus one run; page-only, not a key; filed as entry LUNA-V187-001)

[BUILDER FILING NOTE 2026-09-19: the "Luna:" label in the operator transport message is his source framing, not verdict text. Body below is the pasted verdict whole.]

**clear**

I find no page-level defect that warrants blocking this one print-only build plus one run. The packet sharply limits the authorization to section 3, preserves the existing live selector/gate path, and makes the two live-relay hazards explicit rather than silently resolving them here.

### Analytic ask A — defects, gaps, imprecisions

**1. P042 uses “IFF” too broadly.**
L60 says the run should halt for the diagnostic-comparison check *iff* the compared set diverges, but the same paragraph immediately defines other independent mandatory failures. The intended meaning is clearly “the **diagnostic-comparison component** halts iff the compared set diverges.” This is wording, not a gating defect.

**2. The transport/sink sentence is malformed.**
P038 contains the fragment “tester-log sink equivalence asserted by name with post-run actuals validating) chars filed here.” It is understandable from context, but grammatically incomplete and should be repaired in the next textual revision. It does not change the stated gate.

**3. “Diagnostic comparison” should be labeled as contractual, not whole-record equivalence.**
The P042 comparator deliberately checks selected keys/fields for SIGNAL, TP_ELECT, VETOCLEAR, SESSION_LIMIT, and S5 seed/presence rows; it is not claiming byte-for-byte equivalence of every diagnostic payload. The packet mostly says this correctly, but the terminology should consistently say **contractual diagnostic equivalence** to prevent over-reading.

**4. `wouldGate=0` on shadow-invalid rows is semantically overloaded.**
The literal mirror can leave `wouldGate` at `0` when the shadow calculation is unavailable, while P036/P042 correctly say that value is **undecidable**, not a computed false gate. The distinction is documented, so this is not a clearance blocker; it is a parser/reporting sharp edge.

**5. The future side-guard hazard remains genuinely open.**
The packet explicitly records that the future rule can adopt a defined finite ext1 without the landed protective-side predicate, and carries the `SlimbProtectiveSideOk` remedy to the live-activation relay. That is a live-relay issue, not a reason to block this probe because the packet expressly says this authorization does not clear live activation.

I do **not** see a contradiction in the 38-field schema, reservation/latch order, 1024/1056 ceiling, provenance join, or A/B/C dominance story that rises to a build/run blocker on the page. The actual A/B/C literal and the stated STAGE-1 exact-diff boundary are explicitly fixed.

### Analytic ask B — better mechanism

For the **future live relay**, the cleaner mechanism is to carry one candidate-local ext1 result directly from `ComputeSlReference` into the S5 selector instead of publishing `g_sl41_*` globals and later reconstructing provenance through a diagnostic join.

The relevant touch points would be **EA L5291-L5497** for the producer/result contract and **EA L8779/L9627-L9665** for consumption. The protective-side decision should reuse the already-landed `SlimbProtectiveSideOk` predicate at **EA L9637**, rather than introducing a second side-test definition. That would reduce the stale-global/publication/join surface; it is appropriately outside this packet and needs its own live-relay token.

So the requested review answer is:

**CLEAR — no amend required for v24’s stated probe clearance.**
The five points above are wording/precision notes; the protective-side issue remains explicitly deferred to the live-activation relay. The packet itself asks only for the section-3 probe build/run authorization.

---

## Luna answer - 2026-09-19 - answers v188 relay (packet v25) (CLEAR one print-only probe build plus one run; page-only, not a key; filed as entry LUNA-V188-001)

[BUILDER FILING NOTE 2026-09-19: the "Luna:" label in the operator transport message is his source framing, not verdict text. Body below is the pasted verdict whole.]

I reviewed the packet as a page-only code review, using the packet’s own terminology and stated verification split.

**VERDICT: CLEAR**

Clear `PACKET_EXT1LIVE-001 v25` by name for **exactly one print-only probe build plus one tester run under the frozen envelope**. This clearance applies only to the section-3 probe instrumentation; it does not clear the future ext1 rule or live activation. That scope is explicit in the packet and the standing project brief.

I do **not** see a page-level defect that requires an amend-before-build. The packet has already converted the material objections into explicit build-time/run-time gates, hard failures, or deliberately carried live-relay items. The selector/gate/recorder construction is also internally coherent: A captures the incoming reference, B captures the selector result, and C runs after the existing R-gate without replacing it.

### Analytic A — defects, gaps, and imprecisions

**1. Future live rule still has an unresolved protective-side hazard — non-blocking for this probe.**

The packet itself correctly flags that the future rule uses `ext1Defined && finite slExt1` without the landed code’s protective-side invariant. The landed selector admits only protective-side candidates on the `s1x_sel` 0/1 paths via `SlimbProtectiveSideOk`, while the proposed future adoption could accept a defined finite ext1 that is not protective-side. That is a real future-relay hazard, but it is explicitly outside this authorization and is not silently being treated as settled. The packet carries it forward.

Relevant EA lines: **L9637**, **L9661-L9665**, with the future adoption semantics discussed at packet P007/P009.

**Disposition:** no amendment to v25; retain as a mandatory opening item for the live-activation relay.

---

**2. “Live-equivalent” for `wouldGate` needs to be read as predicate equivalence, not validity equivalence.**

The probe's `probe_wouldGateV` deliberately mirrors the live predicate:

`(probe_slDistExt1 > 0.0 && (tpDist / probe_slDistExt1) >= InpMinRewardRisk)`

without adding a finite guard. The packet later distinguishes this from the independent validity grading: an invalid/non-finite ratio can therefore produce a Boolean while still constituting an acceptance failure. The construction is coherent, but the phrase “live-equivalent” can be misread as saying the shadow validity policy is identical to the live-input validity policy. It is not; only the gate predicate is mirrored.

Relevant EA line: **L9670**.

**Disposition:** wording imprecision only; no amend needed because the subsequent acceptance rules explicitly separate `wouldGate` self-consistency from non-finite operand failures.

---

**3. “First probe statement after the gate test” is slightly imprecise.**

C is described as beginning immediately after L9670, but the literal then has declarations/initializations before the terminal-control check. The packet elsewhere correctly states the stronger operational rule: the terminal check is first **after declaration-only statements** and before helper calls, carry reads other than `probe_bSaved`, sequence reservation, serialization, or emission. The actual rule is clear; the shorter phrase is merely imprecise.

Relevant EA lines: **L9670 onward**.

**Disposition:** no amend; the detailed ordering rule governs.

---

**4. “CAP fails immediately” must not be read as “the tester execution stops immediately.”**

The C literal correctly sets `probe_capped` and `probe_dead`, emits the CAP line, and falls through without `return`/`ExpertRemove`. Later acceptance wording says CAP “fails the run immediately on sight,” but the same section says the affected probe acceptance stops while the actual-path diagnostic comparison may continue. The intended meaning is “probe acceptance fails immediately,” not “tester execution aborts.”

Relevant EA area: **C immediately after L9670**.

**Disposition:** semantic imprecision only; no amend because the literal control flow and the surrounding acceptance text resolve it.

---

**5. The `probe_bSaved` witness is only a detector, not a proof of correct wiring — correctly handled, but worth keeping explicit.**

The packet acknowledges that poison values plus `probe_bSaved` detect a skipped B, but do not detect every coherent miswire. It separately makes the exact B assignments and domination proof mandatory STAGE-1 gates. That is the right separation.

Relevant EA lines: **L9629-L9630**, **L9661-L9666**.

**Disposition:** no defect; this is a correctly bounded falsifier.

---

**6. The 1024/1056 transport figures are internally consistent.**

The packet’s normal-line arithmetic is coherent: envelope 83 + key structure 416 + value maxima 525 = 1024, with poison-inclusive 1056. The field maxima and domain constraints are tied to an explicit halt-on-overwidth parser rule and a pre-build synthetic-line/byte-identity check, rather than being asserted from the archive’s shorter observed lines.

**Disposition:** no defect.

---

**7. Provenance freshness is properly bounded rather than overclaimed.**

The mandatory `ladOriginPx == currentPrice` comparison is not presented as sufficient freshness by itself; the packet also uses `ladOriginStamp == barTime` as the staleness falsifier and binds the single S5 invocation path and publication path. The S5 origin tuple is written at **L8773-L8776**, the S5 `ComputeSlReference` call is at **L8779**, and publication is at **L5496-L5497**.

**Disposition:** no defect.

---

### Why the build/run gate is clear

The decisive part for me is that the packet does not ask the probe to prove what it cannot prove.

The probe is explicitly bounded to selector → effective stop → R-gate → shadow. Downstream veto/latch/SIGNAL/session-mark ordering remains source-mapped, not inferred from print proximity. The existing R-gate remains the live `tpOk` computation at **L9670**; C reads it rather than substituting a new gate.

The provenance chain is likewise bounded: the origin tuple is written before the S5 resolver call, the ext1 tuple is published by the resolver path, and the packet requires both STAGE-1 dominance/publication proof and same-bar `SLEXT481` corroboration. The packet explicitly says the corroboration does not replace the source proof.

The existing archive evidence also supports that C is reachable on the important cases: the A2 S5 row has post-gate `SIDE1E`/`SIDE1X` records with slot 13 and ext1 1.16299, while A1/A3 have corresponding post-gate rows.

### Analytic B — better mechanism

For **this probe**, I do not see a better mechanism that materially improves the stated goal without enlarging the verification surface. The frozen A/B/C carry plus key/value arrays, explicit parser grammar, exact-diff gate, and offline comparison contract are already aimed at preventing semantic drift.

For the **future live relay**, the better mechanism is the one already carried in P046: reuse the existing protective-side predicate rather than inventing a second side test:

`(ext1Defined && finite slExt1 && SlimbProtectiveSideOk(g_dir, slExt1, currentPrice)) ? slExt1 : existing selector`

The principal live-path touch is the former selector region **EA L9661-L9665**, using the already-existing protective-side test at **EA L9637**. That keeps the future rule aligned with the invariant the landed selector already enforces instead of creating a second, independently maintained side-test definition. The packet itself carries this as the live-relay alternative rather than folding it into v25.

### Final ruling

**CLEAR — one print-only build, one run, under the stated envelope.**

No pre-build amend is required from the page. The only substantive unresolved item is the explicitly acknowledged **future live protective-side hazard**, which belongs in the separate live-activation relay and is already carried there. The remaining issues above are wording/interpretation boundaries that the packet’s detailed acceptance rules already resolve.

---

## Luna answer - 2026-09-19 - answers v189 relay (packet v26 + RECON47) (AMEND-WITH-DELTA, 9 contract/wording deltas, no new build/run; filed as entry LUNA-V189-001)

[BUILDER FILING NOTE 2026-09-19: the "Luna:" label in the operator transport message is his source framing, not verdict text. Body below is the pasted verdict whole.]

**amend-with-delta**

RECON47 should be closed as an **execution pass with an acceptance partial-pass / transport-limited grade**. The observed prefix is usable evidence, but the missing suffix prevents a full-row acceptance. The v26 transport contract is sound in direction, but it needs a few explicit deltas before it is internally closed. The packet itself asks exactly this disposition.

The important distinction is:

> **No run failure is established. Full-record acceptance is not established. The unresolved item is transport completeness, not the probe logic demonstrated by the received prefix.**

### Why the partial-pass is supportable

The run did produce one complete SCHEMA, 13 NORMAL records, 13 SIDE1E records, 13 SIDE1X records, and 13 SLEXT481 records, with no CAP or BSAVE_FAIL, no received `?` survivors, no received `INVALID`, 13/13 `wouldGate` agreement, and valid direction values. That is enough to grade the received prefix and establish that the recorder was operating.

But every NORMAL record is transport-truncated before the suffix. The packet explicitly says fields 24–38 are withheld. Those fields include the provenance tail, `emitSeq`, raw numerator/denominator fields, and `actualGate`; therefore several obligations declared mandatory by P042 cannot actually be closed from this run.

That means the right grade is **partial-pass**, not a failed run and not a complete acceptance.

## Required v26 deltas

### 1. Separate execution status from acceptance grade

L453 says `DONE=PASSED`, while the same line says the NORMAL payload is truncated and the suffix is withheld. L455 then says the council has not yet ruled the grade. Those statements can coexist only if `PASSED` means **tester execution completed successfully**, not **contract acceptance passed**.

**Delta:** make the terminology explicit:

> `EXECUTION=PASSED; ACCEPTANCE=PARTIAL-PASS-TRANSPORT-LIMITED; FULL-ROW ACCEPTANCE=UNPROVEN.`

### 2. Do not call 489/537 a measured sink capacity

The current evidence contains three different figures: `468` as the segment-reported longest NORMAL payload, `489` as the as-wire NORMAL payload, and `537` as the longest journal line including the surrounding journal material. L453 itself contains all three references.

More importantly, the 1024/1056 numbers are **serialization-width ledger ceilings**, not a measurement of the sink's physical maximum. The packet itself says the derived 1024/1056 figures exceed the landed observation and came from a pre-build micro-check.

**Delta:** replace the transport claim with something like:

> `Observed run transport: NORMAL payloads are received only through the present prefix, with observed maximum 489 characters; corresponding journal-line maximum is 537 characters. These observations establish a truncation boundary in this run, not an independently measured sink-capacity maximum. The 1024/1056 figures remain source-serialization ledger ceilings and are not transport bounds.`

That is the cleanest interpretation of the narrowed contract.

### 3. Define exactly what “present prefix” means

This is the biggest remaining precision gap.

The A1/A3 examples stop cleanly after `ladOriginPx`, but the A2 as-wire example visibly ends in the middle of `ladOriginBarTime=2026.09.04-1...`. So the transport does not merely omit a suffix; it can leave a **partial final token**.

Therefore “present-prefix grading” needs one mechanical rule:

> Only complete `key=value` fields ending before the first incomplete token are gradeable. The incomplete terminal token is treated as missing transport, never as a value, INVALID, mismatch, or evidence; all later fields are withheld.

Without that rule, a truncated date/string can accidentally enter the parser as though it were an observed value.

### 4. Explicitly mark the mandatory suffix obligations as ungraded, not failed

P042 calls `gateConst/actualGate` self-consistency mandatory and makes A2 provenance mandatory. But the run does not deliver `actualGate`, the origin stamp, the full origin-time/site tail, or the remaining suffix.  

The proper status is:

**not observed → not gradeable → not a miss.**

That distinction should be stated once and made authoritative for this transport-limited run.

### 5. The A2 acceptance statement needs the same partial qualifier

A2 does establish the received `pxExt1` and slot 13, and the archive/post-gate evidence supports the reduction. 

But the full provenance contract requires more than the visible price: the packet separately relies on origin time/site/stamp semantics. Those are in the omitted suffix. So A2's **price/slot portion is graded**, while its **full freshness/provenance portion remains transport-withheld**.

### 6. “wouldGate sign agreement” is imprecise

L453 calls the result “wouldGate sign agreement 13/13.” `wouldGate` is Boolean, not a signed numeric quantity. 

**Delta:** call it **Boolean/value agreement 13/13**.

### 7. Do not use “zero `?`” or “zero INVALID” as completeness evidence

Those observations are valid for what actually arrived, but they cannot prove the omitted suffix was populated correctly. A transport cut removes fields rather than replacing them with `?`. Likewise, zero `INVALID` in the present region says nothing about hidden fields. L453 already partly scopes `INVALID` to the present region; make the same scope explicit for `?` and all completeness claims.

### 8. The sequence invariants are not closed by this run

P042 requires contiguous `emitSeq`, highest-sequence/count equality, and duplicate/ordering checks. Those obligations depend on `emitSeq`, which is in the withheld suffix. 

The count of 13 NORMAL rows can still be reported, but it is **not equivalent to proving `emitSeq=1..13`**.

So the packet should label:

> `NORMAL-count=13: observed; emitSeq-contiguity: transport-ungraded.`

That prevents the count from being silently promoted into a sequence proof.

### 9. Make the v25→v26 provenance explicit

The actual wire examples are stamped `pkt=PACKET_EXT1LIVE-001-v25`, while this relay is v26. That is expected given L455's statement that v26 is folding the already-spent v25 build/run rather than rebuilding. 

Still, the contract should explicitly say:

> `RECON47 wire evidence was emitted by v25; v26 is the post-run clearance/transport contract applied to unchanged code. The v25 packet ID in the wire is expected and is not itself a mismatch.`

Otherwise a later parser could incorrectly treat the packet-ID difference as a transport defect.

---

## Analytic Ask B — better mechanism

For the stated goal, the stronger mechanism is **transport framing rather than trying to prove a single-line sink maximum**.

The current C recorder builds one 38-field NORMAL line beginning immediately after the L9670 gate.  A better probe would retain the existing 38-field arrays but emit them as **several bounded frames per `emitSeq`**, each carrying:

`emitSeq`, `part`, `partsTotal`, `fieldStart`, `fieldCount`, payload fields, and a small integrity token/length.

Then the offline reader can require all parts before treating a NORMAL record as complete. A missing or truncated part becomes mechanically detectable instead of becoming an ambiguous sink-cap inference.

The code surface is confined to the probe C region after L9670—the current NORMAL assembly/`Print` section—rather than touching the live selector, R gate, veto, latch, SIGNAL, or session-mark code. The packet already isolates this area as probe-owned.  

A still smaller follow-on mechanism would be a one-time sink-calibration sequence in the same probe region using known-length sentinel records, but that measures an observed truncation threshold; it still does not make a single-line sink ceiling intrinsically trustworthy. Framing the records removes that dependency altogether.

## Final council ruling

**AMEND-WITH-DELTA.**

The deltas are contract/wording changes only; they do not authorize a new build or run.

**RECON47:** execution completed successfully; evidence establishes a valid **present-prefix partial pass**.

**Full NORMAL rows:** **transport-halted/unproven**, not failed.

**1024/1056:** retain as **serialization ledger ceilings**, not sink-capacity claims.

**Observed transport:** report the 489-character NORMAL payload / 537-character journal-line observations as run evidence, while explicitly saying they establish an observed truncation boundary, not a physical sink maximum.  

**Downstream veto/latch/SIGNAL/session-mark ordering:** stays source-mapped as requested; the probe does not turn that into probe proof.

This is clearance for the probe build/run only; it does not authorize live activation or alter the separate live-relay requirements.

No live-rule clearance. No activation clearance. No downstream veto/latch/SIGNAL/session-order certification by probe proximity. Those remain source-mapped questions exactly as the packet states. The requested verdict/asks are themselves the final section of the relay.

---

## Luna answer - 2026-09-19 - answers v190 relay (packet v27 + RECON47) (AMEND-WITH-DELTA, transport-bound wording + exact prefix-boundary deltas, no new build/run; filed as entry LUNA-V190-001)

[BUILDER FILING NOTE 2026-09-19: the "Luna:" label in the operator transport message is his source framing, not verdict text. Body below is the pasted verdict whole.]

## Verdict: **AMEND-WITH-DELTA**

The RECON47 evidence supports the proposed **`EXECUTION=PASSED` + `FULL-ROW ACCEPTANCE=UNPROVEN` + prefix-only partial grade**. The packet is not describing a failed instrument; it is describing a successful probe whose 38-field records were transport-truncated.

I would **not halt** the packet. I would amend a small set of transport/grade statements before treating the sink-cap bound and prefix grade as finally settled.

### Why the grade split is valid

The run actually produced the expected probe family: one SCHEMA, 13 NORMAL, 13 SIDE1E, 13 SIDE1X, and 13 S5 SLEXT481 records, with zero CAP/BSAVE_FAIL and 13/13 `wouldGate` sign agreement. The important limitation is explicit: the NORMAL records were cut before fields 24–38 could be transported, so full-row acceptance cannot be claimed.

The packet also correctly separates the two kinds of evidence: the seven TP_ELECT fire rows and the A1/A2/A3 checks can still be graded where their operands are actually available, while missing downstream STOPRESOLVE fields remain unproved rather than being silently inferred.

That is the right evidentiary treatment.

## Analytic ask A — defects, gaps, and imprecisions

**1. The 468 / 489 / 537 terminology is still internally ambiguous.**
L453 calls 468 the “longest NORMAL payload,” then also says the longest NORMAL payload is 489; L457 later explains that 468 is the segment-tabulator payload, 489 is the as-wire STOPRESOLVE message, and 537 is the journal line including the 48-character wrapper. The underlying measurements may be compatible, but the noun *payload* is being used for two different layers.

**Delta:** rename these explicitly as `segment payload=468`, `as-wire STOPRESOLVE=489`, `journal line=537`.

**2. “537 hard cap” is stronger than the page actually proves.**
The page establishes an observed/inferred cutoff boundary at 537 characters for this journal path. It does not independently demonstrate that 537 is a universal hard capacity of the underlying sink. The packet itself has already partially recognized this with “inferred-cap,” but the ruling should make that distinction explicit.

**Delta:** rule the bound as **“observed 537-character journal-line cutoff on this transport path; exact universal sink capacity not independently proven.”**

**3. The prefix grade needs an exact field boundary, not “near key 23.”**
This is the most important wording defect. The A1 as-wire example ends during `ladOriginPx`, before `ladOriginBarTime`. Therefore the *last complete transported key/value* is earlier than the prose “keys 24–38 withheld” suggests. A partial final token must be explicitly excluded from the graded prefix.

**Delta:** define the partial-pass over **complete canonical tokens only**, and state the actual last complete field per row or the common last-complete field if the cutoff is uniform. A partial `ladOriginPx=...` token must not count merely because its key began.

**4. “Prefix partial-pass” is conceptually right but not fully formalized as a grade set.**
The contract says “present-prefix evidence earns a partial-pass,” but the exact set of fields constituting that prefix depends on canonical stripping of the cut tail. That should be a deterministic parser rule rather than an interpretive phrase.

**Delta:** define `graded_prefix = all complete key=value tokens before the first incomplete token`; everything from that incomplete token onward is `WITHHELD`.

**5. “Zero '?' survivors” / “zero INVALID” must be scoped to transported complete tokens.**
Because the transport cut occurs before the final fields, absence of `?` or `INVALID` in the visible portion cannot say anything about omitted fields. The packet mostly handles this correctly with “present region,” but the summary sentence should carry the same qualification.

**6. “Headroom measured-two-runs” is asserted but not surfaced as evidence in this relay.**
L459 says that headroom was measured over two runs, while the inline run-evidence section presents RECON47 as the operative run and gives its 537/489 measurements. There is no second run identifier or measurement in the visible evidence block.

**Delta:** either name the two measurements/runs that establish the headroom statement or change it to a historical/asserted cross-check rather than current evidence.

**7. “Sink cap measured on the wire” should distinguish message truncation from journal wrapping.**
537 is the journal-line length; 489 is the STOPRESOLVE message before the 48-character terminal/journal prefix. Calling 537 “on the wire” without naming the layer risks implying the EA emitted 537 characters when the actual STOPRESOLVE payload was 489.

**8. The 1024/1056 ledger is a serializer-length bound, not a transport-capacity bound.**
The packet correctly computes a worst-case NORMAL length of 1024 and poison-inclusive 1056, while RECON47 demonstrates a much shorter transport cutoff. Those are different properties and should remain explicitly separated.

I do **not** see a blocking contradiction in the actual grading logic after making those distinctions. The packet already expressly keeps full-row acceptance unproven, keeps missing operands missing, and prevents a prefix result from being silently promoted to certification.

### Required delta, minimally

I would amend only these areas:

`L453-L457`: normalize the 468/489/537 terminology and state the 537 result as the **observed transport cutoff for this journal path**, not a universally proven hard capacity.

`L457`: replace “cut near key 23 / keys 24–38 withheld” with an exact **complete-token prefix rule**, explicitly discarding the incomplete terminal token.

`L453/L459`: qualify zero-`?`/zero-`INVALID` as **complete transported-prefix observations** and either substantiate or relabel the “headroom measured-two-runs” claim.

Everything else in the grade split can remain.

## Analytic ask B — better mechanism

The better mechanism is **bounded multi-line record chunking**, rather than trying to force all 38 fields through one journal line.

Touch only the current C serializer after EA **L9670** / the C insertion described in P032; do not touch the selector, R-gate, veto, latch, SIGNAL, or session logic.

A robust form would be:

`emitSeq + chunkIndex + chunkCount + field-range + key=value...`

with every chunk deliberately kept below a conservative transport size, e.g. ~400 characters. Never split a `key=value` token. The parser then requires exactly one complete set of chunks for each `emitSeq`, reconstructs all 38 fields, checks the fixed schema/field order, and only then upgrades the record from prefix/incomplete to full-row grade.

That solves the actual failure mode without changing the live strategy path. It is materially stronger than merely increasing the current 1024/1056 ledger or assuming the inferred 537 sink limit is universal.

**Council ruling:** **AMEND-WITH-DELTA**, limited to the transport-bound wording, exact prefix boundary, and the unsupported “two-run headroom” statement. The underlying RECON47 execution and the proposed incomplete/prefix-partial grading disposition stand.
---

## Luna answer - 2026-09-19 - answers v191 relay (packet v28 + 3-part shape) (AMEND-WITH-DELTA, envelope-106 blocking delta, no new build/run; filed as entry LUNA-V191-001)

[BUILDER FILING NOTE 2026-09-19: the "Luna:" label in the operator transport message is his source framing, not verdict text. The trailing operator instruction after the verdict close (single-model credit note) is operator text, not verdict text, and is not filed here. Body below is the pasted verdict whole.]

## Verdict: AMEND-WITH-DELTA.

The v28 design is sufficiently specified to clear after one narrow textual correction, but I would **not clear the packet exactly as written** because the transport-budget arithmetic contains a live contradiction that should be removed before the STAGE-1 build.

### Primary blocking delta

**L328, L461–L463, and P034/L52.**

The current v28 NORMAL envelope is not 83 bytes. The literal in P032 is:

`[SRJ-EA] STOPRESOLVE format=2 pkt=PACKET_EXT1LIVE-001-v28 base=6C2E4028 type=NORMAL part=N/3 emitSeq=`

Its fixed prefix is **101 bytes before the emitSeq value**, and with the maximum five-character `emitSeq=20000`, the complete envelope is **106 bytes**.

That matters because P038/L328 still says:

> `1024 = envelope 83 + ...`

and P034's parser rule says the total journal cap is `537 - N - 83`.

Those figures belong to the old single-record geometry. They are inconsistent with the v28 three-part literal. The actual v28 ledger elsewhere implicitly uses **106**: the stated totals

* part 1: 116 + 217 + 106 = **439**
* part 2: 156 + 110 + 106 = **372**
* part 3: 144 + 198 + 106 = **448**

are internally correct.

The transport conclusion itself therefore remains usable: **439, 372, and 448 are all below the measured 489-character STOPRESOLVE message ceiling**, with margins 50, 117, and 41 respectively.

But the stale `83` must not remain in the authoritative transport formula, because it creates a contradictory budget if someone recomputes it from the 537-character journal-line ceiling.

**Required delta:** make the transport arithmetic explicitly distinguish:

* journal-line ceiling = **537**
* measured terminal/thread prefix = **48**
* STOPRESOLVE message ceiling = **489**
* v28 NORMAL envelope = **106 at emitSeq=20000**
* v28 per-part maxima = **439 / 372 / 448**
* therefore margins against the **489 message ceiling** = **50 / 117 / 41**

and delete/replace the old `537-N-83` and `1024 = 83 + ...` language wherever it is presented as current v28 transport arithmetic.

This is a documentation/gate-consistency defect, not evidence that the three-part literal itself exceeds the measured 489-byte transport ceiling.

---

## Analytic ask A — defects/gaps/imprecisions

### 1. Stale 83-byte envelope arithmetic — **blocking**

**L328, P034/L52, L461–L465.**

As above, the current literal's NORMAL envelope is 106 bytes at maximum `emitSeq`, not 83. The current bucket totals themselves are consistent with 106, but the prose transport formula is not.

### 2. "1024/1056 ceiling" remains ambiguously authoritative — **non-blocking after #1**

**L328, L461, L465; P038.**

The 1024/1056 figures are historical sizing for the former single-line 38-field record. v28 has explicitly changed the transport representation to three NORMAL parts. The packet should label 1024/1056 as **historical/legacy single-record sizing**, not leave it adjacent to the operative v28 per-part ceiling.

Otherwise a later builder can legitimately ask which ceiling is authoritative.

### 3. The measured 489 ceiling should be explicitly scoped to each v28 part — **non-blocking**

**P034/L52; L453, L457, L463–L465.**

The evidence establishes a measured 489-character STOPRESOLVE message ceiling on the transport path. The new design relies on that same ceiling applying independently to each Print-generated part. That is reasonable from the stated transport model, but the packet should say explicitly:

> each NORMAL part is an independent STOPRESOLVE message and must individually satisfy the measured 489-character message ceiling.

The current ledger strongly implies this, but does not state it as cleanly as it could.

### 4. `actualGate` remains unobserved in RECON47 — correctly classified, but don't let the new contract accidentally inherit old "finding" language

**P034/L52; P042; L453, L461.**

This is actually handled correctly: the packet explicitly says the RECON47 `actualGate` comparison was unavailable because position 33 was cut, rather than treating the external `SIDE1X livePass` as a substitute.

The important point for v28 is that the new three-part shape makes `actualGate` transportable. The next run must therefore grade the actual printed field rather than carrying forward the RECON47 substitution.

### 5. Sequence proof changes from "observed" to genuinely gradeable only after the v28 run

**P034/L52; P032; L453, L461.**

This is correctly acknowledged, but it is worth keeping sharp: RECON47's 13 rows do **not** prove sequence contiguity because `emitSeq` was cut. The v28 contract properly makes the three part envelopes carry the same sequence. No issue with the design; just ensure the run grader does not accidentally inherit the old 13-row structural assumption.

### 6. The v28 tag rule is internally coherent but needs the build-generation distinction preserved

**P001/L19, P034/L52, L461.**

The packet correctly distinguishes the **clearing packet version** from the **wire build-generation tag**. RECON47 legitimately carried `-v25` because it was the v25 build. The new v28 build must carry `-v28`; the exact-diff gate should enforce that. This is already stated, so I would not amend the substance.

### 7. Historical 1024/1056 figures and current 439/372/448 figures should not both be described simply as "ceiling"

**L328, L461–L465.**

Use terminology such as **historical monolithic-record sizing** versus **operative v28 per-part transport maxima**. That removes an avoidable semantic collision.

### 8. The packet is otherwise unusually explicit about transport failure

**P034/L52, P042, P046.**

The FAILED-transport treatment is properly separated from execution status: RECON47 executed successfully but did not establish full-row acceptance because the sink cut the record. The packet also explicitly rejects treating a surviving prefix as partial acceptance. That contract is internally consistent.

---

## Analytic ask B — better mechanism

For the **stated probe goal**, I would keep the v28 three-part mechanism rather than introduce a helper/refactor.

The important mechanism is already present:

1. one 38-key schema;
2. one 38-value array;
3. one shared `emitSeq`;
4. three fixed contiguous field ranges;
5. one `Print()` per part;
6. identical envelope + sequence on all three parts.

That is preferable to another live-path helper or another producer-side hunk because it keeps the probe instrumentation isolated from the strategy path.

The one improvement I would make is **purely mechanical**: define the transport constants in the review contract rather than repeatedly deriving them from prose:

* `MESSAGE_CAP = 489`
* `JOURNAL_PREFIX = 48`
* `NORMAL_ENVELOPE_MAX = 106`
* `PART_MAX = 439/372/448`

No EA helper is necessary. The code literal can remain unchanged except for the already-authorized two STAGE-1-bound RHS expressions.

---

## Clearance disposition

**AMEND-WITH-DELTA, then clear v28 by name once that arithmetic wording is corrected.**

I would **not** reopen:

* the three-part shape,
* the 38-field schema,
* the shared `emitSeq`,
* the BSAVE_FAIL/CAP terminal model,
* the transport FAILED grade for RECON47,
* the selector instrumentation,
* hunk D,
* the future live rule,
* or downstream veto/latch/SIGNAL/session ordering.

The substantive v28 architecture survives review. The one thing I would require before spending the build clearance is that the **83-byte legacy envelope arithmetic be removed from the operative v28 transport contract**, because the actual v28 literal is 106 bytes and the current wording otherwise gives two incompatible transport calculations.
---

## Luna answer - 2026-09-19 - answers v193 relay (packet v30 + 3-part shape) (ACCEPT, clear v30 by name, no delta, no halt; filed as entry LUNA-V193-001)

[BUILDER FILING NOTE 2026-09-19: operator-relayed under the new 3-seat format (Luna + Sonnet + GLM 5.3). Body below is the Luna text whole.]

**ACCEPT — YES. Clear PACKET_EXT1LIVE-001 v30 by name.**

The ten folds are internally consistent with the existing 3-part transport contract and do not change the operative design.

| Fold | Ruling                                                                                                                                                                                                 | Line anchor                                             |
| ---- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------- |
| 1    | **Accept.** `537-N-106` is the correct per-part payload allowance once the operative NORMAL envelope is 106; the added independent-per-part 489-character requirement closes the ambiguity.            | **P034**; prior filed anchor L52                        |
| 2    | **Accept.** `pkt=` remains the **build-generation tag**, so v30 may carry `-v28`; only an actual C-literal tag change rolls the four envelopes and forces STAGE-1 exact-diff again.                    | **P034 / P042**; prior anchors L52 and L60              |
| 3    | **Accept.** `106 = 83 + 9 + 14` is exact, and relabeling the 83/1024/1056 material as **historical monolithic sizing only** correctly prevents it being mistaken for the operative transport envelope. | **P038**; prior anchor L56                              |
| 4    | **Accept.** The 38/25 positions are explicitly 1-based while 37/24 remains the historical 0-based notation; no semantic conflict.                                                                      | **P046**; prior anchor L64                              |
| 5    | **Accept.** `80 + 41 = 121` is correct. Here the 41 includes the field separator preceding the payload; the raw `reservedTotal=20000 reason=CAP_EXHAUSTED` text itself is 40 characters.               | **P042**; prior anchor L60                              |
| 6    | **Accept.** Changing the historical sentence from v27 to v29 correctly tracks the latest C-literal generation without altering the v30 packet identity.                                                | **P042 / re-emit clause**; prior transport rule at L60  |
| 7    | **Accept.** The `tpTarget` census is correctly scoped: zero writes in the operative window, with the lone initialization at **EA L8754**, outside the window.                                          | **P038; EA L8754–L9670**; prior anchor L56              |
| 8    | **Accept.** The L9623 comment is subordinate to the executable gate; the operative imbalance test is at **EA L9662**, with the surrounding selector structure at L9607–L9670.                          | **P011**; prior anchor L29                              |
| 9    | **Accept.** Prefix determination per **part-line**, followed by aggregation to logical-record `INCOMPLETE`, matches the independent NORMAL-part transport model.                                       | **P038**; prior anchor L56                              |
| 10   | **Accept.** v30 is the packet/status identity; `-v28` remains the operative wire tag. No contradiction.                                                                                                | **header / P034 / P042**                                |

### Contract ruling

**FAILED-transport grade: ACCEPTED AS STATED.** The transport failure remains a transport-grade finding, not an instrument defect or grading strike: execution passed, while full-row acceptance was unproven because the former single-line shape exceeded the measured 489-character message ceiling. The surviving prefix findings remain findings rather than being promoted to acceptance.

**3-part record shape: ACCEPTED.** The operative NORMAL message is now three independent STOPRESOLVE part-lines with one shared `emitSeq`, carrying 13/13/12 payload fields. The operative envelope is **106**, and the authoritative worst-case part sizes are **439 / 372 / 448**, each below the measured **489-character message ceiling**. The old 83/1024/1056 figures remain historical sizing only.

**Wire-tag rule: ACCEPTED.** `pkt=-v28` is not a contradiction with packet v30; it names the cleared C-literal/build generation. A literal tag change is the event that requires rolling the four envelopes and repeating STAGE-1 exact-diff.

**Final ruling: ACCEPT. No amendment delta. No halt.** The v30 contract is clearable exactly as requested: **FAILED-transport grade + 3-part shape + operative 106 envelope + P042-conformant build-generation tag rule.**

## Luna-V194-001 (AMEND-WITH-DELTA on v194/v31, pasted 2026-09-20, whole)

## Verdict: **AMEND-WITH-DELTA**

The v31 **print-only probe itself is close to clearable**, but I would not issue a clean “accept” because the page currently overstates what G1/G2/G3/G4 establish, and the D3 future rule contains a known safety-critical semantic gap.

### 1. Required ruling

**D1/D2 probe build + one run:** amend, then clear.

P050 correctly places LOTDIAG after the floor calculation and before the `volMin` abort, with only a print insertion. 

P052 likewise preserves the existing D2 control flow: the WINDOW and RETEST wrappers return exactly as before, and D2c only prints inside the existing SESSION path. 

But the acceptance language needs tightening before the token is spent.

**D3 future rule:** amend, not accept as presently written.

P007 explicitly says the future rule is currently **not side-guarded** and that adoption of a non-protective ext1 is an open hazard.  P046 carries the better formulation already: require `SlimbProtectiveSideOk(g_dir, slExt1, currentPrice)` before adoption. 

The specific 2026-09-08 16:40 counterfactual is internally consistent: ext1 `1.16359`, shadow R about `0.68`, versus actual live R `1.62`, so **that particular fire would be killed** provided the future rule adopts that protective ext1. 

**D4:** amend the acceptance wording, not necessarily the code.

The existing EXITVERDICT/MTEXIT/MTLIFE evidence is sufficient to support a post-run join, but “joins every per-bar `curTp` value ... against his +0.10 row bar-for-bar” is not formally defined enough to be a hard gate. 

---

## Analytic ask A — defects, gaps, imprecisions

### A1. P050 overclaims `wouldTake=1`

P050 says `wouldTake=1` plus LOT_TOO_SMALL “proves signal-valid floor-refused.” 

The expression is only:

`slDistanceReal > 0 && tickSize > 0`

That proves the lot-calculation branch was reached with a positive stop distance and tick size. The **ABORT reason** proves the actual refusal was `LOT_TOO_SMALL`. The `wouldTake` field alone does not prove the whole upstream strategy candidate was otherwise signal-valid.

**Delta:** rename the semantic claim to something like “lot calculation reached / floor-refused,” or explicitly state that signal validity comes from the adjoining S5 diagnostics, not LOTDIAG itself.

### A2. P050's two-decimal lot print is weaker than the rest of the packet's exactness standard

`flooredLots=%.2f`, `volMin=%.2f`, and `volStep=%.2f` can hide distinctions below 0.01. 

That may be adequate for this EURUSD run if the proven broker volume granularity is 0.01, but the packet presents the diagnostic as a measured proof rather than a display-only convenience.

**Delta:** either explicitly scope G1 to the filed 0.01-volume environment, or print the values with enough precision to make the comparison lossless.

### A3. G1's “4/4 at signal level” is not formally defined on the page

P050 asserts a 4/4 take join, but the supplied raw rows show the two LOT_TOO_SMALL aborts and four PRE-SEND takes; the page does not define the exact key joining those six observations to the four intended trade rows.  

**Delta:** define the join key explicitly, e.g. exact evaluated-bar timestamp + direction + POI, or call the 4/4 statement a secondary report-only finding.

### A4. D2 does not cover the `g_state != ST_IDLE` failure mode

The new diagnostics all live inside:

`if(g_state == ST_IDLE)`

and therefore only distinguish WINDOW / SESSION / RETEST **after the evaluator has entered the IDLE seed head**. 

A 17:00 seed absence caused because that condition is false produces **no SEEDDIAG at all**.

The packet's G2 therefore cannot literally guarantee that every 17:00 seed miss gets a named branch. P052 describes the three branches as exhaustive, but they are exhaustive only conditional on reaching L7679. 

**Delta:** either weaken G2 to “one of the three S1-head refusal branches, conditional on `g_state==ST_IDLE`,” or instrument the `g_state != ST_IDLE` case too.

### A5. D2's “exactly one per day” claim is conditional, not absolute

The mutual exclusion among WINDOW / SESSION / RETEST is sound, but only once the S1 IDLE block is entered. The packet should not describe the family as universally bounded to one diagnostic for every 17:00 evaluation without that condition. 

### A6. D3's wording conflates the counterfactual stop with the actual stop

P054 says the bar “takes ruleStop 1.16359 ... for liveStop 1.16274.” 

Those are two different states. The cited rows show:

* actual live stop = `1.16274`
* counterfactual ext1/rule stop = `1.16359`

The packet understands that distinction elsewhere, but this sentence blurs it.

**Delta:** say “counterfactual future stop would be 1.16359; current live stop is 1.16274.”

### A7. G3's “no other table row flips” is conditional, not independently proven

Section 2 calls several unchanged results **predictions**, conditioned in part on producer-vs-selector equality being only open-empirical. P042 explicitly says those relationships are not universal proof. 

Yet G3 is phrased as a council confirmation that the future rule flips no other row. 

For the supplied page, the defensible statement is:

> the cited A3 counterfactual is below the gate; the claimed no-other-row result remains conditional on the stated producer/equality assumptions.

That distinction matters because this is a future behavior decision.

### A8. The side-guard hazard is already admitted, so it cannot simultaneously be treated as closed

P007 calls the missing side guard a “known open hazard,” while P054 asks for the future rule itself to be ruled.  

That is the principal reason I would not issue plain ACCEPT. The packet already contains its own better answer in P046: use `SlimbProtectiveSideOk`. 

### A9. G4's join criterion is underspecified

P056 gives the source streams, but it does not define exactly what “against his +0.10 row” means mathematically, nor the primary join key when there are multiple bars. 

The `EXITVERDICT` side has an exact bar timestamp; the journal row shown at line 395 is a compound row with several numeric fields. 

**Delta:** define:

1. primary key = exact `EXITVERDICT bar`;
2. trade identity = the 8/28 morning entry/latch;
3. expected journal field = the exact named column/value represented by “+0.10”;
4. missing/multiple matches = explicit failure, not interpretation.

### A10. “Between entry TP and exit” is not itself the join proof

A value lying numerically between `1.16322` and `1.16459` does not establish that it belongs to the corresponding journal bar. The temporal join and the numeric range check are different assertions.

**Delta:** grade them separately: **bar identity** and **price relationship**.

---

## Analytic ask B — better mechanisms

### B1. Better D1 mechanism

At **EA L10109-L10110**, retain the single insertion but print the actual comparison explicitly:

`flooredLots`, `volMin`, plus `floorBelowMin = (lots < volMin)`.

That makes the diagnostic directly answer the floor question instead of using `wouldTake` as a proxy. Current D1 site is exactly the right location. 

### B2. Better D2 mechanism

At **EA L7677-L7699**, instrument one mutually exclusive branch variable for the whole seed head:

`STATE`, `WINDOW`, `SESSION`, or `RETEST`.

That eliminates the blind spot where `g_state != ST_IDLE` currently yields silence. The current D2 wrappers only cover the latter three. 

### B3. Better D3 mechanism

At **EA L9661-L9665**, use the already-carried mechanism from P046:

`ext1Defined && finite slExt1 && SlimbProtectiveSideOk(...)`

then ext1 adoption; otherwise retain the existing selector. 

That fixes the exact hazard the packet itself flags without inventing a new side predicate.

### B4. Better D4 mechanism

Prefer an **exact post-run relational join** using the existing `EXITVERDICT.bar` timestamp, anchored to the 8/28 `latchBar`/entry event, and then join MTEXIT/MTLIFE by the same trade instance. The existing EXITVERDICT site is EA L11169-L11180 and the existing MTEXIT is L11192. 

Only add EA fields if the existing timestamps cannot uniquely identify the trade. A new trade identifier would then be the proper code-level improvement rather than trying to infer identity from price values.

---

### Final ruling

**AMEND-WITH-DELTA.**

The requested **D1+D2 print-only probe can proceed after the acceptance-language deltas**, because the insertions themselves are effect-preserving as specified. P050/P052 are structurally sound as instrumentation. 

The **specific D3 09-08 16:40 kill is supported as a counterfactual calculation**, but the **general future live-activation rule is not ready to be accepted without the protective-side guard** already identified in P007/P046.  

The **D4 goal is measurable**, but its bar-by-bar join needs an exact key and comparison definition before it should be a hard acceptance gate. 

So I would send back a **delta packet, not a halt**: narrow G1, make G2 exhaustive or conditional, relabel D3 as counterfactual and add the side guard, and formalize the G4 join. 

## Luna-V195-001 (AMEND-WITH-DELTA on v195/v32, pasted 2026-09-20, whole)

## amend-with-delta

**v32 is not a halt.** The D1/D2 print-only delta is materially corrected from v31, and the P046 protective-side guard fixes the substantive D3 hazard. The remaining issues are wording/coverage issues in the acceptance contract, not a reason to reject the probe build itself.

The minimum amendments are in **P052, P054, and P056**, with two smaller diagnostic-precision notes in **P050/P058**.

### Clearance ruling

| Item               | Ruling                                           | Relevant lines           |
| ------------------ | ------------------------------------------------ | ------------------------ |
| D1 LOTDIAG v2      | **Clearable**                                    | P050; EA L10102-L10110   |
| D2a/D2b/D2c        | **Clearable, scoped**                            | P052; EA L7679-L7699     |
| D3 future rule     | **Semantically corrected, not yet live-cleared** | P007, P009, P054         |
| D4 exit-layer join | **Clearable after join wording is tightened**    | P056                     |
| Overall v32        | **AMEND-WITH-DELTA**                             | P050/P052/P054/P056/P058 |

The underlying lot path is exactly the sequence the packet relies on: calculate `lots`, floor at EA L10109, then reject at L10110-L10111.  Likewise, the S1 seed head has the three refusal exits at L7681, the SESSION block, and L7699. 

---

# Analytic ask A — every remaining defect, gap, or imprecision

### 1. G3 still overclaims the “no other row” result

**P054.**

The page says:

> “Acceptance G3: council confirms on the cited rows that the future rule kills this fire and flips no other section-2 table row.”

That is stronger than the evidence contract actually established.

P007 still explicitly says the producer-vs-selector implementation equality is **open-empirical**, and P054's section-2 prediction depends on that relationship for the unchanged rows. The v32 wording removed the earlier explicit condition from G3.

So the packet should not convert the conditional table analysis into an unconditional council fact.

**Required delta:** change G3 to:

> “council confirms on the cited section-2 rows, conditional on the stated N-2 producer-equality evidence, that the future rule kills A3 and no other listed row changes fire status.”

Or, alternatively, make every row independently recomputable from the printed producer fields and remove the condition.

**Severity:** contract overclaim, not probe hazard.

---

### 2. G4 still calls a trade-level journal row a “bar-for-bar” join

**P056.**

This is improved over v31 because the page now says the primary key is the exact `EXITVERDICT` bar and the trade identity is the 8/28 latch. That part is good.

The remaining imprecision is:

> “joins every per-bar curTp value ... against his +0.10 row bar-for-bar”

The journal row is one **trade-level row**, not a ten-row expected `curTp` series. Therefore the journal row can validate **trade identity / terminal outcome**, but it cannot independently validate each individual `curTp`.

The proper separation is:

**Per-bar layer:** exact EXITVERDICT bar identity + `curTp` relationship to entry TP.

**Trade layer:** 8/28 latch/entry identity + MTEXIT/MTLIFE terminal values + journal row 257 Gain `0.10`.

**Required delta:** replace “bar-for-bar to his +0.10 row” with “bar-for-bar to the same 8/28 trade instance; terminal MTEXIT/MTLIFE then joins that trade instance to journal row 257.”

The existing EXITVERDICT series is in fact per-bar, while MTEXIT/MTLIFE are trade-lifecycle records. 

**Severity:** join-model imprecision.

---

### 3. G1 should not grade the printed `rawLots` token itself as exact sub-floor evidence

**P050.**

`rawLots=%.4f` can round a value slightly below `0.01` to `0.0100`.

So the statement:

> “rawLots below volMin”

is not universally provable from the printed rawLots token alone.

The exact field is actually `belowMin`, which is computed from the unrounded `lots`:

`((lots < volMin) ? 1 : 0)`

That is the stronger witness.

**Required delta:** grade:

* `belowMin=1`, and
* `flooredLots < volMin` at the printed resolution,

while treating `rawLots` as diagnostic context rather than the exact inequality witness.

This is particularly important because the packet itself claims the diagnostic distinguishes the two floor refusals.

**Severity:** display-precision wording only.

---

### 4. P050's “bit-identical” claim is stronger than the page proves

**P050.**

The new print re-evaluates:

`riskMoney / lossPerLot`

rather than preserving the pre-floor result from EA L10105.

That expression is logically the same calculation, but the page does not itself prove a **bit-identical** floating-point evaluation merely by saying it is the same expression.

The stronger claim should be “same-input deterministic recomputation,” unless the build gate independently establishes binary identity.

**Required delta:** replace “bit-identical pure arithmetic” with “same-input pure recomputation of the pre-floor lot expression.”

The clean underlying alternative would be to capture the value before EA L10109, but that would no longer be the current one-line insertion contract.

**Severity:** proof-language precision only.

---

### 5. D2 is still not exhaustive for every possible 17:00 seed miss

**P052.**

This is now honestly disclosed, which is good:

> the three wrappers are exhaustive only conditional on reaching the S1 IDLE head.

But the stated goal is “17:00 seed-miss print.” A miss caused by `g_state != ST_IDLE` still produces **no SEEDDIAG**.

The packet therefore proves:

> “Which of WINDOW / SESSION / RETEST rejected the seed, given `g_state == ST_IDLE`.”

It does **not** prove:

> “Why every 17:00 seed attempt failed.”

The filed 9/8 case has the IDLE precondition, so this does not block this particular run, but it remains a coverage gap in the general goal.

**Severity:** scoped coverage gap; non-blocking for the explicitly preconditioned G2.

---

### 6. G2's control-bar claim is correctly scoped, but the phrase “seed succeeded” should refer to state passage, not the diagnostic family

**P052.**

For 8/27, zero SEEDDIAG is expected because no refusal branch fired. That is consistent with the supplied `IDLE -> S1_REGIME` / `S1_REGIME -> S2_LTF_ALIGN` rows. 

But zero diagnostic output by itself does not prove successful seed creation; the state-transition evidence does.

So the clean wording is:

> “zero SEEDDIAG, with independent STATE passage establishing successful seed.”

**Severity:** evidence-separation precision.

---

### 7. P058's line-length rule does not define the measurement unit

**P058.**

It says the new lines are below 160 and that any new line at or above the STOPRESOLVE maximum 525 voids the run.

It does not specify whether the max-length pull measures:

* characters,
* bytes,
* encoded bytes including non-ASCII,
* or the displayed log line excluding newline.

For these particular ASCII-only diagnostic families this is unlikely to change the outcome, but the gate is written as an instrument-level rule.

**Required delta:** define the unit once, preferably “log-line character count excluding line terminator,” or “UTF-8 byte count excluding line terminator.”

**Severity:** gate-definition imprecision.

---

### 8. P007/P009 still leave a genuine future-relay metadata obligation open

**P009.**

The future ext1 branch replaces the existing s0/s1 selection, but P009 itself says `s1x_sel` / `kin` require a future-relay decision because downstream code may otherwise interpret the ext1 branch as if it were an s0/s1 selection.

That is correctly identified, but it means the future live relay is **not fully specified yet**.

This does **not** prevent v32's print-only clearance, because P003 explicitly excludes live activation. But it should remain a mandatory future-relay item.

**Severity:** future implementation dependency.

---

### 9. D3 is now correctly side-guarded, but the packet should distinguish “rule corrected” from “rule behavior proven”

**P007/P054.**

The v32 amendment changes the rule to:

`ext1Defined && finite slExt1 && SlimbProtectiveSideOk(...)`

which resolves the known non-protective-side adoption hazard.

But D3 is still a **counterfactual**. No new live code executes it in this probe. P054 says that, but G3's council-confirmation language can read as though the new behavior has already been executed.

**Required delta:** label G3 consistently as a **source-level counterfactual ruling**, not a runtime confirmation.

**Severity:** evidence-status precision.

---

# Analytic ask B — better mechanisms

### Better D1 mechanism

For the exact pre-floor value, the cleanest instrument point is **EA L10105**, immediately when:

`lots = riskMoney / lossPerLot`

is created.

Then EA L10109 can remain the floor operation.

That would eliminate the recomputation claim entirely. The tradeoff is that it changes the current “single pure insertion after L10109” contract.

For this v32 run, I would **not reopen the instrumentation** merely for that improvement; the exact `belowMin` witness already solves the substantive goal.

---

### Better D2 mechanism

For a genuinely exhaustive 17:00 seed-miss diagnostic, add a state branch immediately around **EA L7679**:

```text
if(g_state != ST_IDLE && 17:00)
    SEEDDIAG branch=STATE
```

Then the diagnostic family becomes genuinely exhaustive:

`STATE / WINDOW / SESSION / RETEST`.

For this packet, however, the filed 9/8 case already has the required `state=IDLE` precondition, so this is a future coverage enhancement rather than a reason to stop v32.

---

### Better D3 mechanism

Keep the P046 guard exactly as adopted in **P007**, at the future selector site **EA L9661-L9665**:

```text
ext1Defined
&& finite(slExt1)
&& SlimbProtectiveSideOk(g_dir, slExt1, currentPrice)
```

Otherwise retain the old selector unchanged.

The one additional future-relay task is then to settle the downstream meaning of `s1x_sel` / `kin` rather than silently inheriting their old semantics. P009 already identifies that correctly.

---

### Better D4 mechanism

Make the join explicitly two-stage at **EA L11169-L11192**:

**Stage 1:** `EXITVERDICT.bar` → exact 8/28 trade instance via latch bar / entry.

**Stage 2:**
`EXITVERDICT` per-bar `curTp` → range/relationship check, independently;
`MTEXIT/MTLIFE` → terminal trade result;
terminal trade → journal row 257.

That preserves the lifecycle distinction the packet is trying to expose instead of making the single journal row appear to contain the per-bar trajectory.

---

## Bottom line

**AMEND-WITH-DELTA — not halt.**

The delta is narrow:

1. **P054:** restore the N-2 producer-equality condition to G3 and label it explicitly counterfactual/source-level.
2. **P056:** separate the per-bar EXITVERDICT check from the trade-level journal-row join.
3. **P050:** make `belowMin=1` the exact lot-floor acceptance witness; treat `rawLots=%.4f` as contextual.
4. **P058:** define the line-length measurement unit.
5. **P052:** retain the explicit `g_state==IDLE` limitation as part of G2's formal scope.

With those wording deltas, **D1/D2 can be cleared for the one print-only build + one run; D3 remains future-rule text only; D4 becomes a clean two-layer join contract.** 

## Luna-V196-001 (AMEND-WITH-DELTA on v196/v33, pasted 2026-09-20, whole)

**amend-with-delta**

The v33 round successfully closes the substantive v195 deltas, and I do **not** see a new build-safety defect that warrants a halt. The remaining issues are about exactly what G1/G4 prove and one residual future-rule edge case.

## 1. Clearance by component

**D1 — ACCEPT for the one print-only build.**
P050 now uses `belowMin` as the exact witness rather than the old `wouldTake` tautology. The placement immediately after the floor operation and before the `volMin` refusal is correct as specified in the page. 

**D2 — ACCEPT, with the stated scope.**
P052 now explicitly limits G2 to the filed `g_state==IDLE` case, so the previous overclaim is gone. The three branch wrappers remain mutually exclusive and each only adds diagnostic work before the existing return. 

**D3 — ACCEPT as a future-rule counterfactual only.**
The side guard is now actually incorporated into the future rule, not merely flagged. P054 also correctly labels the A3 result counterfactual and conditions the no-other-row statement on N-2 producer equality.  

**D4 — ACCEPT in structure, but one acceptance-definition delta remains.**
P056 now separates per-bar EXITVERDICT identity from the terminal MTEXIT/MTLIFE → journal-row join. That fixes the v195 join-model problem. 

So the packet is **not a halt**, but I would still require the small deltas below before treating it as a clean unconditional clearance.

---

# 2. Analytic ask A — remaining defects / gaps / imprecisions

### A1. G4 still lacks a substantive pass criterion for the `curTp` values

**P056 / L20.**

The new G4 correctly says the run must:

* identify each exact `EXITVERDICT` bar,
* attach those rows to the same 8/28 trade,
* join the terminal MTEXIT/MTLIFE result to journal row 257.

But there is still no defined rule saying **what makes the `curTp` series correct**.

The report will tabulate:

> `bar, curTp, delta vs entry TP 1.16322, divergence class`

yet the packet does not define a required divergence value/class for each bar. An arbitrary but correctly joined `curTp` sequence could therefore satisfy the current G4 unless it triggers the separate “outside range” finding.

That makes G4 primarily an **observability/completeness test**, not a semantic test of the TP-management layer.

**Delta:** explicitly state one of these:

> “G4 is a print/join completeness grade only; `curTp` correctness is not graded.”

or define the expected per-bar relationship/divergence criterion.

This is the biggest remaining contract ambiguity.

---

### A2. The “10th” EXITVERDICT row is internally awkwardly described

**P056 / L20.**

The packet says:

> “morning chain 9 ... plus exit 1.16459 at 10:45; census 10th on 8/28 is the 16:25 manage bar ... outside morning scope”

So the cited morning lifecycle is **nine rows**, while the overall 8/28 EXITVERDICT census is ten, with the tenth at 16:25.

Calling this the “full EXITVERDICT chain on the 8/28 morning bars” and then conditionally including a later 16:25 bar makes the scope ambiguous.

**Delta:** distinguish:

* **morning lifecycle set:** 9 rows through 10:45;
* **file-wide 8/28 EXITVERDICT set:** 10 rows;
* **16:25 row:** include only if the trade-identity join proves it belongs to the same lifecycle.

---

### A3. P056 should say whether the 16:25 row is expected to belong to the same trade before grading it

**P056 / L20.**

It currently says the 10th row is “joined by the same rules if in window.”

That makes membership itself conditional and post-run.

A stronger contract is:

> attempt the exact trade-identity join; if the 16:25 row joins to the 8/28 10:05 trade, grade it; if it does not, classify it as a separate trade, not as an unexplained missing row.

Otherwise a reader could interpret “10 rows” as an expected ten-row lifecycle.

---

### A4. “rawLots sub-floor margin” is still slightly overstated

**P050 / P058, L17 and L21.**

The v33 wording correctly warns that `%.4f` can round a sub-floor value to `0.0100`. That means the printed `rawLots` is **not itself an exact margin measurement**.

The exact witness is `belowMin=1`, computed before formatting from unrounded `lots`.

Therefore P058's wording:

> “rawLots sub-floor margin as the genuinely new evidence”

should preferably be:

> “rawLots rounded diagnostic context for the sub-floor case; belowMin is the exact witness.”

This is a terminology issue, not a run blocker.

---

### A5. “lossless for flooredLots” is valid only under the separately frozen `volStep=0.01` premise

**P050 / L17.**

The page says `%.2f` is lossless for `flooredLots` because the output is quantized to `volStep 0.01`.

That is fine **only for this run's proven volume-step value**. A generic statement about the print representation would not be valid for another step such as 0.001.

The current packet is already scoped to this terminal/run environment, so this is minor.

**Delta:** say “lossless for this run's filed `volStep=0.01`.”

---

### A6. The future helper still has an explicit DIR_NONE residual

**P007 / L14; also the residual note in the same line.**

The helper is:

```text
return ((dir == DIR_LONG) ? (refV < curPx) : (refV > curPx));
```

Thus the helper itself does not independently reject every non-LONG/non-SHORT direction. For `DIR_NONE`, it takes the second arm.

The packet does separately require the build/run C-site domain to be `{DIR_LONG, DIR_SHORT}`, and the future relay has the residual helper-equivalence item recorded. So this does **not** block the print-only build.

But for the eventual live relay, the safe semantic statement should be either:

`dir` is proven to be LONG/SHORT before the helper, **or** the helper itself has an explicit direction-domain guard.

---

### A7. G3 is now properly conditional, but still does not establish producer/selector equality itself

**P054 / L19; P007 / L14.**

This was correctly softened from v32. G3 now says the no-other-row result is conditional on N-2 producer equality.

That is correct, but it should remain clearly classified as a **conditional counterfactual**, not a proof produced by the v33 run itself. The packet otherwise does make that distinction, so I regard this as adequately handled rather than a substantive defect.

---

### A8. P058's “novel evidence” sentence should distinguish evidence produced by the run from evidence merely made visible

**P058 / L21.**

For D2, the branch name is genuinely new runtime evidence.

For D1, `belowMin=1` is new runtime evidence.

For D4, the run will produce the missing join, so that is also genuinely new.

But P058's wording groups `rawLots` as the evidence rather than the more exact `belowMin` + floored-lot relationship.

Again, minor wording only.

---

# 3. Analytic ask B — better mechanisms

### D1

Current placement is acceptable. The only stronger mechanism would be capturing the actual pre-floor `lots` value at **EA L10105**, immediately after the division, and printing that saved value after the floor. That would eliminate the recomputation wording completely.

I would **not reopen v33 for this**; `belowMin` already gives the exact acceptance witness.

### D2

For a truly exhaustive seed-miss diagnostic, add a fourth diagnostic at the **EA L7679 state gate** for `g_state != ST_IDLE`:

`branch=STATE`.

That would make `STATE / WINDOW / SESSION / RETEST` exhaustive.

For this packet, the 9/8 case has the explicitly filed IDLE precondition, so this is a future completeness improvement rather than a blocker.

### D3

The current future rule should remain at **EA L9661-L9665** with:

`ext1Defined && finite(slExt1) && SlimbProtectiveSideOk(...)`

followed by ext1 adoption; otherwise retain the old selector.

The remaining future-relay work is the metadata semantics identified at **P009** and the helper-domain issue above. Do not infer old `s1x_sel` semantics for the ext1 arm.

### D4

The cleanest mechanism is the one v33 now specifies at **EA L11169-L11192**:

`EXITVERDICT.bar` → exact trade instance → per-bar `curTp` analysis

and independently:

`MTEXIT/MTLIFE` → same trade instance → journal row 257.

That separation is now the right architecture. The only missing piece is defining whether G4 is purely observational or whether it is supposed to validate a prescribed `curTp` behavior.

---

## Final ruling

**AMEND-WITH-DELTA.**

The v33 packet has corrected the actual v195 defects: D1 has an exact floor-refusal witness, G2 is properly scoped to the IDLE precondition, D3 carries the protective-side guard and is explicitly counterfactual, and D4 now has the correct two-layer join model. 

The remaining amendment is narrow: **make G4 explicitly observational/completeness-only, or define the expected `curTp` correctness criterion; clean up the 9-vs-10 row wording; and downgrade “rawLots sub-floor margin” to rounded diagnostic context.** The DIR_NONE point remains a future live-relay obligation, not a v33 probe blocker. 

## Luna-V197-001 (ACCEPT on v197/v34, pasted 2026-09-20, whole)

## accept

**PACKET_EXT1LIVE-001 v34 is clear for exactly one print-only probe build and exactly one run under the stated envelope.** I do not see a remaining defect that requires another pre-build delta or a halt. The v34 changes address the v196 objections without changing the literals, envelope, or gate. 

### G1 — ACCEPT

P050 now uses `belowMin` as the actual floor-refusal witness, separates it from rounded `rawLots` context, and explicitly freezes the `volStep=0.01` premise for the run. The two target evaluations are joined to the same-tick ABORT/A6REFUSED pair, while signal validity is deliberately sourced from the adjoining S5 evidence. That is the correct evidentiary separation. 

One terminology point remains, but it is not a blocker: P050 calls the `lots` value at L10110 “unrounded lots.” It is actually the **post-MathFloor, unformatted** `lots` value. The exact witness is still correct because L10110 tests that stored post-floor value. 

### G2 — ACCEPT

P052 now explicitly states the necessary precondition: the 9/8 17:00 evaluation is known to reach the `ST_IDLE` seed head, and only then are WINDOW/SESSION/RETEST exhaustive. It also correctly makes the 8/27 zero-SEEDDIAG case a separate STATE-passage observation. 

The remaining `g_state != ST_IDLE` blind spot is therefore acknowledged rather than hidden. That is sufficient for the **specified G2 run**, which has the filed IDLE precondition.

### G3 — ACCEPT

This is now correctly expressed as a **source-level counterfactual**, not a runtime result, and the no-other-row conclusion is explicitly conditioned on the stated N-2 producer-equality evidence. The helper's strict inequality is also directly supplied: SHORT requires `refV > curPx`, so A3's 1.16359 against 1.16213 passes the guard.  

The live relay itself remains outside this clearance, exactly as the packet requires. 

### G4 — ACCEPT

The v34 formulation is now materially complete.

It identifies nine morning T1 rows, separately identifies the 16:25 T2 row, defines the primary key as the exact EXITVERDICT bar, separates per-bar `curTp` analysis from terminal lifecycle joining, and explicitly says `curTp` correctness is **not** being graded by G4. The terminal T1 join to journal row 257 and the no-journal T2 disposition are also separated. 

That resolves the earlier ambiguity over the “10th row.”

---

# Analytic ask A — remaining defects, gaps, or imprecisions

### 1. “Unrounded lots” is the wrong term

**P050 / L17.**

The literal executes after:

`lots = MathFloor(lots / volStep) * volStep`

so the `lots` tested by `belowMin` is already **floored**.

Better wording:

> “the in-memory post-floor `lots` value, before string formatting”

rather than “unrounded lots.”

This does not affect G1 correctness.

---

### 2. `rawLots` is contextual, not necessarily a literal “sub-floor margin”

**P050/P058 / L17, L21.**

The packet has correctly downgraded `rawLots` from acceptance evidence to rounded diagnostic context. But “sub-floor margin” is still slightly loose terminology because the raw value is merely the pre-floor computed quantity; the exact refusal condition is `lots < volMin`.

The exact witness is `belowMin=1`. `rawLots` is supporting context.

---

### 3. G1's “flooredLots below volMin at printed resolution” is weaker than `belowMin`

**P050 / L17.**

This is not wrong, but it is redundant and potentially confusing.

A printed `flooredLots` comparison is display-level evidence. `belowMin=1` is the direct Boolean generated by the actual EA operand.

For grading, I would treat:

`belowMin == 1`

as authoritative, with `flooredLots`, `volMin`, and `volStep` as explanatory fields.

---

### 4. G2 remains deliberately non-exhaustive outside the IDLE precondition

**P052 / L18.**

The page says this correctly, so I am not calling it a defect in the clearance. But the goal title “17:00 seed-miss print” is broader than what the instrumentation actually guarantees.

A future version seeking universal 17:00 refusal attribution would need a `g_state != ST_IDLE` branch.

---

### 5. G4 is completeness-only by design, so it cannot certify TP correctness

**P056 / L20.**

This is now explicitly disclosed and therefore no longer a defect. It is nevertheless important to preserve the distinction:

G4 proves **presence + identity + join completeness**; it does not prove that `curTp` itself was algorithmically correct.

That is exactly what the amended contract now says.

---

### 6. The 16:25 T2 classification depends on trade-instance identity rather than a unique global trade ID

**P056 / L20.**

The page uses the 8/28 16:25 signal's entry/SL/TP and lifecycle records to establish T2. That is adequate for this run, but it is a composite identity rather than an explicit immutable trade identifier.

Because G4 explicitly makes the 16:25 row a separate expected T2 instance, this is not a blocker. It would only matter if another trade could share the same identity tuple in the same dataset.

---

### 7. The future helper retains the DIR_NONE fallback question

**P007 / L14.**

The helper itself is:

`LONG ? refV < curPx : refV > curPx`

so a non-LONG value reaches the SHORT comparison. The packet correctly carries this as a **future live-relay residual** and says that relay must either prove `g_dir ∈ {LONG,SHORT}` or guard the helper.

Because v34 authorizes only the print-only probe and does not clear live activation, this is **not a v34 blocker**. 

---

### 8. The future selector metadata issue remains open

**P009 carried into P007 / L14.**

The future ext1 arm replaces the s0/s1 selector, while `s1x_sel` and related metadata have downstream semantics. The packet correctly says the future relay must resolve that rather than pretending an ext1 adoption was an s0/s1 selection.

Again: future-relay issue, not probe-clearance issue. 

---

### 9. The “all unchanged surroundings” claim is not independently checkable from the page

**L6-L8, L42.**

This is properly handled by the verification split: the packet says disk digests/build checks establish genuineness, while the review seat is to rule on the page. Nothing here should be converted into a model-level claim that the hashes actually match.

That is not a defect; it is an important evidentiary boundary that should remain intact.  

---

# Analytic ask B — better mechanisms

### D1

The best future instrumentation point would be **EA L10105**, immediately after the original `riskMoney / lossPerLot` calculation. Capturing that value once would eliminate the repeated-expression wording entirely.

I would **not** reopen v34 for it. The current `belowMin` witness is sufficient.

### D2

For a universally exhaustive seed diagnostic, instrument the **L7679 state entrance** with an additional `branch=STATE` case for `g_state != ST_IDLE`.

That would turn:

`WINDOW / SESSION / RETEST`

into:

`STATE / WINDOW / SESSION / RETEST`.

For this run, the filed IDLE precondition makes the existing v34 form sufficient. 

### D3

Keep the future selection at **EA L9661-L9665** with the three-part guard already adopted:

`ext1Defined && finite(slExt1) && SlimbProtectiveSideOk(...)`

and leave the legacy selector as the fallback. The remaining work belongs in the eventual live relay: explicit direction-domain handling and downstream selector metadata.

### D4

The v34 two-layer mechanism is the right one:

`EXITVERDICT bar → T1/T2 instance → per-bar curTp table`

then independently:

`MTEXIT/MTLIFE → same instance → journal row`.

No code change is needed for this probe goal; the existing **EA L11169-L11192** reporting layer is sufficient under the stated completeness-only G4 contract. 

## Final

**ACCEPT — PACKET_EXT1LIVE-001 v34.**

The remaining observations are non-blocking precision/future-relay notes, not clearance defects. **G1, G2, G3, and G4 are each sufficiently bounded for the one specified print-only build + one run.** 

## Luna-V198-001 (ACCEPT on v198/v35, pasted 2026-09-20, whole)

## accept

**PACKET_EXT1LIVE-001 v35 is clear for exactly one print-only probe build and exactly one run under the stated envelope.** I do not find a remaining blocking defect in the amended contract. The v35 deltas address the v197 issues: the D1 wording now separates the exact `belowMin` witness from rounded `rawLots`, and G4 now has explicit T1/T2 instance handling and a completeness-only grade. 

### G1 — ACCEPT

P050 now puts LOTDIAG after the actual `MathFloor` assignment and before the `volMin` abort, and makes `belowMin=1` the exact witness computed from the in-memory `lots` operand. It also explicitly limits `%.4f rawLots` to rounded diagnostic context. 

The two named refusals are appropriately joined to the same-tick ABORT/A6REFUSED pair, while signal validity is kept separate and sourced from the S5 evidence. That is the correct evidentiary separation.

### G2 — ACCEPT

P052's three branches are explicitly scoped to the filed `ST_IDLE` precondition, and the packet no longer claims universal attribution for a 17:00 miss occurring before that head. The 8/27 zero-diagnostic control is independently supported by the state-passage evidence. 

That is sufficient for the specified 9/8 17:00 target.

### G3 — ACCEPT

P007 now carries the protective-side requirement into the future rule, and P054 correctly calls the 9/8 16:40 result a **counterfactual**, not runtime evidence. The no-other-row statement is explicitly conditioned on the open-empirical N-2 producer-equality evidence. 

The helper itself is also explicit: LONG requires `refV < curPx`; otherwise the expression requires `refV > curPx`. The filed A3 SHORT comparison therefore satisfies the guard. 

### G4 — ACCEPT

This is now sufficiently specified.

The page identifies **nine morning T1 rows**, separately identifies the 16:25 **T2** row, and defines the three layers:

1. exact EXITVERDICT bar → trade instance;
2. per-bar `curTp` table → diagnostic completeness;
3. MTEXIT/MTLIFE → trade instance → journal row where one exists.

It also explicitly classifies T2's absent journal counterpart as expected rather than as a failed join. 

The nine morning rows are individually enumerated and reconcile to the stated eight `1.16364` rows plus the 10:45 exit row. 

---

# Analytic ask A — remaining non-blocking observations

### 1. P050 still calls `lots` “unformatted” rather than clearly “post-floor”

**P050 / L17.**

`lots` has already undergone:

`MathFloor(lots / volStep) * volStep`

at L10109. So “in-memory unformatted lots value” can be read as the pre-floor quantity, when it is actually the **post-MathFloor, unformatted** `lots` value. The exact witness is still correct because L10110 tests that stored post-floor value. 

### 2. `rawLots` is contextual, not necessarily a literal “sub-floor margin”

**P050 / L16; P058 / L21.**

The packet correctly says `rawLots` is rounded context, but “carries the sub-floor margin” remains slightly loose terminology because a four-decimal print can collapse distinct raw values into the same displayed value.

`belowMin=1` is the exact witness; `rawLots` is explanatory.

### 3. The `volStep=0.01` premise is run-specific

**P050 / L16.**

The statement that `%.2f` is lossless for `flooredLots` is valid under the packet's explicitly filed 0.01 environment. It should not be generalized beyond that run. The packet already scopes it correctly enough for this clearance.

### 4. G2 remains intentionally non-exhaustive for `g_state != ST_IDLE`

**P052 / L18.**

This is a real coverage limitation, but it is explicitly disclosed and does not block the stated G2 acceptance because the target row carries the required IDLE precondition.

### 5. The future helper's DIR_NONE behavior remains a future-relay issue

**P007 / L14; helper L2578-L2581.**

The helper uses LONG-versus-other-direction branching, so `DIR_NONE` is not independently rejected inside the helper. The packet expressly leaves this to the future live relay, which must prove the adoption-site domain is `{LONG,SHORT}` or add the guard. 

That is outside this print-only authorization.

### 6. The future ext1 metadata semantics remain open

**P007 / L14 and carried P009 material.**

The ext1 branch is not an s0/s1 selection, so downstream `s1x_sel`/`kin` semantics still need to be settled in the eventual live relay. Again, no v35 probe code relies on the future adoption.

### 7. G4 intentionally does not grade TP correctness

**P056 / L17.**

The packet now expressly defines G4 as a **print/join completeness grade** and says `curTp` correctness is not graded. That is not a defect, but it is an important boundary: a passing G4 proves the requested reporting/join layer, not the underlying TP-management algorithm.

---

# Analytic ask B — better mechanisms

**D1:** The only materially stronger instrumentation point would be **EA L10105**, immediately after the original `riskMoney / lossPerLot` calculation. Capturing that value once would eliminate the repeated `riskMoney / lossPerLot` expression entirely. I would not reopen v35 for it.

**D2:** For universal 17:00 attribution, add a `branch=STATE` diagnostic at the **L7679 state entrance** for `g_state != ST_IDLE`. That would make the diagnostic family genuinely exhaustive: `STATE / WINDOW / SESSION / RETEST`. The current target is already covered by the filed IDLE precondition.

**D3:** Keep the future adoption site at **EA L9661-L9665** with `ext1Defined && finite(slExt1) && SlimbProtectiveSideOk(...)`, and resolve the DIR_NONE/metadata points in the separate live relay. The current v35 packet properly excludes that live activation. 

**D4:** The existing **EA L11169-L11192** reporting layer is now the appropriate mechanism. The T1/T2 separation in P056 is preferable to adding a new trade identifier solely for this probe. 

## Final ruling

**ACCEPT — PACKET_EXT1LIVE-001 v35.**

One print-only build, one run, same `RECON44_DEMO_P1` envelope, with G1-G4 graded exactly as amended. The remaining points are non-blocking precision/future-relay notes, not reasons for another pre-build delta. 

## Luna-V199-001 (AMEND-WITH-DELTA on v199/v36, pasted 2026-09-20, whole)

## amend-with-delta

**I would not spend the v36 live-build/run key yet.** The E-hunk is narrowly constructed and the intended A3 runtime effect is well specified, but v36 still has **one material live-scope defect plus several contract imprecisions** that should be corrected before authorizing the live selector.

### Clearance summary

| Component                         | Ruling                   | Lines                         |
| --------------------------------- | ------------------------ | ----------------------------- |
| E-hunk confinement / fallback     | **Accept**               | P009 / L14                    |
| Protective-side + direction guard | **Accept**               | P007 / P009 / L14             |
| `s1x_sel=2` metadata              | **Accept**               | P007/P009 / L14               |
| D1/G1 wording                     | **Amend**                | P050 / L16                    |
| Runtime A3 rule                   | **Accept conditionally** | P054 / L18                    |
| Live producer/debug dependency    | **Amend — material**     | P007 / L14                    |
| Overall v36                       | **AMEND-WITH-DELTA**     | P001/P003/P007/P050/P054/P058 |

---

# 1. Material issue: the “LIVE” E-hunk still depends on debug-gated publication

**P007 / L14; P058 / L21; EA L5494-L5497 and L8779.**

The E-hunk reads:

`g_sl41_def`, `g_sl41_px`, `g_sl41_slot`, etc.

Those globals are published at L5496-L5497, but the packet explicitly carries forward that their publication is inside the `InpDebugLog` gate. P058 also freezes the run with `InpDebugLog=true`. 

That means the new selector is not actually independent of the diagnostic setting:

* `InpDebugLog=true` → the new ext1 selector can execute.
* `InpDebugLog=false` → the producer globals are not refreshed, so the E-hunk falls back.

The run envelope explicitly forces `InpDebugLog=true`, so **the proposed RECON50 run can test the intended live branch**. But the packet calls this a general **LIVE activation**, not merely “live while debug logging is enabled.” 

That distinction matters because this is no longer a print-only probe.

### Required delta

State the rule as either:

> “The live ext1 selector is authorized only with `InpDebugLog=true`.”

or make the candidate publication available independently of the diagnostic gate.

For this one-run authorization, I would accept the former, provided the live scope is explicitly constrained.

**This is the main reason for AMEND rather than ACCEPT.**

---

# 2. P050 contains a logical contradiction in the G1 acceptance wording

**P050 / L16.**

It says:

> “any belowMin=1 halts with operands + with flooredLots at or above volMin and no ABORT/A6REFUSED lot pair on any bar”

But `belowMin=1` is computed as:

`lots < volMin`

and `lots` is already the post-floor value.

Therefore the two conditions:

`belowMin=1`

and

`flooredLots >= volMin`

cannot simultaneously hold.

The intended meaning appears to be:

> if any `belowMin=1` occurs, halt with its operands; normal acceptance requires `flooredLots >= volMin` and no matching ABORT/A6REFUSED pair.

### Required delta

Split those into separate clauses.

This is a real contract defect, although it does not affect the E-hunk itself.

---

# 3. “Sole new live write” is too literal

**P009 / L14.**

The E-hunk adds:

`slRef = g_sl41_px`

and also:

`s1x_sel = 2`.

The latter is a new executable assignment, albeit to a block-local metadata variable rather than strategy state.

So:

> “Sole new live write: slRef”

is only correct if “live write” means **strategy-state-affecting stop write**.

### Required delta

Change to:

> “Sole new strategy stop-state write: `slRef` on the ext1 arm; `s1x_sel=2` is local arm metadata.”

That removes an unnecessary literal ambiguity.

---

# 4. `currentPrice` is not explicitly included in the ext1 validity conjunction

**P007 / L14; P009 / L14.**

The adoption test is:

`domain && g_sl41_def == 1 && MathIsValidNumber(g_sl41_px) && SlimbProtectiveSideOk(...)`

There is no explicit:

`MathIsValidNumber(currentPrice)`

guard.

The normal tester path presumably supplies a valid price, and the downstream R-gate will expose malformed arithmetic, but the live rule claims a validity condition and currently only proves finite `slExt1`.

A sufficiently abnormal `currentPrice` could make the side helper behave unexpectedly before the R calculation rejects the result.

### Better formulation

Add:

`&& MathIsValidNumber(currentPrice)`

or explicitly carry a pre-existing `currentPrice` validity invariant into the live rule.

This is a **live robustness gap**, not a reason to reject the intended A3 case.

---

# 5. The future-rule residual is now closed for DIR_NONE, but only because the domain check is ahead of the helper

**P007 / L14; EA L2578-L2581.**

This part is sound.

The E-hunk requires:

`g_dir == DIR_LONG || g_dir == DIR_SHORT`

before calling `SlimbProtectiveSideOk`.

Therefore the helper's “everything else behaves as SHORT” implementation cannot be reached on the adoption arm. The previous DIR_NONE issue is genuinely resolved for this E-hunk.

No delta needed.

---

# 6. The A3 runtime claim is properly counterfactual-to-runtime upgraded, but the causal wording should stay precise

**P040/P054 / L18.**

P054 is now appropriately a **runtime** rule:

* ext1 stop = `1.16359`;
* shadow R = `0.68`;
* TP_ELECT does not fire;
* no SIGNAL.

That is the correct runtime acceptance chain. 

However, P040's wording that the A3 kill is “proven by the absent SIGNAL” is too narrow. Absence of SIGNAL alone is not the causal proof. The stronger evidence is:

`SIDE1X liveStop 1.16359`
→ `TP_ELECT R 0.68 non-fire`
→ no SIGNAL.

That is the evidence chain already present elsewhere in P054.

### Delta

Use “no SIGNAL corroborates the preceding TP_ELECT non-fire” rather than making absence of SIGNAL alone the causal proof.

---

# 7. G3's six-fire statement should be called “runtime result target,” not baseline

**P042 / L15 plus P054 / L18.**

Once v36 activates the selector, the old seven-fire baseline is historical. The packet replaces it with six runtime fires.

Calling six the “Actual-path baseline” can therefore blur:

* historical RECON49 baseline,
* predicted v36 runtime result,
* actual RECON50 result.

The packet otherwise separates those states well.

### Delta

Rename that heading to:

> “v36 runtime target/result”

or equivalent.

Non-blocking.

---

# 8. USD envelope itself is acceptable, but G1 should distinguish signal invariance from money-management invariance

**P050/P058 / L16/L21.**

Changing JPY → USD and retaining a 10,000 deposit can materially alter money-management quantities. That is the purpose of the new envelope.

The packet correctly says the signal path is expected to be lot-independent and requires runtime comparison against RECON49. 

The important distinction should remain:

* **selection/gate invariance** is the no-drift comparison;
* **lot/deal behavior** is expected to change because the account-currency envelope changed.

No code delta is required, but the grading report should never treat a lot/deal difference as signal-path drift.

---

# 9. `InpAdoptExt1=false` is properly retained as a dormant-path safety condition

**P007 / L14; EA L8807-L8813.**

The packet explicitly keeps the old adoption block dormant and says the new E-hunk is the only authorized live adoption site. 

That is correct for this authorization.

One useful wording refinement would be to say that the dormant block remains a **configuration hazard if someone later enables `InpAdoptExt1`**, because there would then be two ext1 writers. But with the stated false input, it does not block v36.

---

# Analytic ask B — better mechanisms

### 1. Best fix for the debug dependency

The cleanest architecture is to make the S5 ext1 tuple available independently of diagnostic emission.

Instead of:

`ComputeSlReference → debug-gated global publication → E-hunk`

use a candidate/result path such as:

`ComputeSlReference → ext1 out-state → E-hunk`

while leaving the SLEXT481 printing under `InpDebugLog`.

That would keep the live selector independent of logging.

The relevant current sites are **EA L5494-L5497 and L8779**, with the consumer at **L9663-L9667**.

### 2. Minimal safe delta if the current architecture must remain

Keep the current producer exactly as-is, but make the live envelope explicitly require:

`InpDebugLog=true`.

That is the smallest change and preserves the no-new-writer constraint.

### 3. D1

The current L10109 insertion is adequate. A stronger mechanism remains capturing the original pre-floor `lots` at **L10105**, but I would not reopen the literal for that now.

### 4. D2

A universal seed diagnostic would still require a `STATE` branch at the **L7679** state entrance. The current G2 is correctly scoped to the filed IDLE case, so this remains future work.

---

## Final ruling

**AMEND-WITH-DELTA.**

The actual E-hunk logic is otherwise well formed: it has the explicit LONG/SHORT domain guard, finite ext1 check, protective-side test, `s1x_sel=2` metadata, exact fallback preservation, and it sits before the unchanged R-gate/veto chain. 

But because this is the first **LIVE** activation, I would require the packet to resolve the **debug-gated producer dependency** explicitly, and fix the **P050 `belowMin` / `flooredLots >= volMin` contradiction**. Those are narrow deltas; they do not call for a halt.

## Luna-V200-001 (ACCEPT on v200/v37, pasted 2026-09-20, whole)

## accept

**PACKET_EXT1LIVE-001 v37 is clear for exactly one live build of the E-hunk and exactly one RECON50-EXT1LIVE-V36 run under the stated USD envelope.** The v37 page closes the substantive v199 deltas: the E-hunk has the explicit direction, ext1-defined, finite-price, finite-currentPrice, and protective-side conjunction; fallback remains effect-identical; `sel=2` is reserved for the ext1 arm; and the probe capture remains outside the replaced selector region. 

### G1 — ACCEPT

The G1 split is now properly separated between the exact `belowMin` witness and the send-preparation outcome. A `belowMin=1` row is explicitly a halt condition, while `rawLots` is only contextual; the USD `volStep=0.01` premise is scoped to the execution environment. 

The 4/4 send-preparation target is likewise defined independently from the lot-floor diagnostic, so the currency change does not silently turn lot evidence into signal-path evidence.

### G2 — ACCEPT

The 17:00 diagnostic remains correctly conditional on reaching the IDLE seed head, and the non-fire control case is supported independently by state passage. No new run behavior is smuggled into the three diagnostic branches. 

### G3 — ACCEPT

This is now a genuine **runtime** test rather than the v35 counterfactual. The live adoption arm is explicit, the protected-side helper is strict, and DIR_NONE is excluded by the E-hunk's domain conjunct before the helper can become relevant. 

The helper itself is:

* LONG → `refV < curPx`
* SHORT → `refV > curPx`

with equality failing. 

The A3 target is therefore well specified: runtime `sel=2`, `slLive == pxExt1 == 1.16359`, `TP_ELECT` R `0.68`, and no 16:45:01 SIGNAL. 

### G4 — ACCEPT

The T1/T2 split is now clean.

T1 has nine morning EXITVERDICT rows; T2 is the separate 16:25 instance. The grade is explicitly completeness/join completeness, not TP-algorithm correctness, and the journal join occurs only at the terminal trade-instance layer. 

The nine morning rows are actually enumerated, with eight `curTp=1.16364` rows followed by the 10:45 exit-bar `curTp=1.16459`, so the stated 9-row census is internally consistent. 

---

# Analytic ask A — remaining defects / gaps / imprecisions

### 1. There is one live citation drift: L8779 vs L8780

**P007 / P058.**

P007 repeatedly identifies the S5 `ComputeSlReference(...)` call as **EA L8779**, while the v37 deciding-code evidence shows:

`L8779: g_o1_maxS = -1;`

and the actual call begins at **L8780**:

`if(!ComputeSlReference(...))`

The packet itself recognizes L8780 in P058. 

This is a citation defect, not a logic defect. It should be corrected in the next textual maintenance pass so the adoption-site provenance does not carry two line identities.

### 2. The debug-gated producer remains a deployment residual

**P007 / P058, L14-L15.**

The live E-hunk consumes `g_sl41_*`, whose publication is under the effective `InpDebugLog=true` condition. v37 therefore authorizes this run only with that setting true. That is sufficient for this clearance, because the packet explicitly freezes that envelope. 

For a later genuinely independent live deployment, the producer/publication dependency on debug logging should be removed or otherwise proven safe under `InpDebugLog=false`. Otherwise the intended selector behavior becomes configuration-dependent.

**Non-blocking for v37 because the authorization expressly requires `InpDebugLog=true`.**

### 3. The producer-vs-selector relationship remains empirical rather than structurally proven

**P007 / P054 / P058, L14, L21.**

This is honestly preserved as the N-2 condition rather than hidden. The new E-hunk intentionally consumes the producer global, so the runtime test will tell you whether the producer-selected ext1 behaves as expected; it does not magically turn the previously open structural equivalence into a proof.

That is why the G3 conditioning is appropriate.

### 4. The P050 wording should continue to distinguish post-floor value from pre-floor raw value

**P050 / L16.**

The wording is now good enough, but the cleanest terminology is:

* `rawLots` = pre-floor calculation, rounded for display;
* `lots` at the diagnostic site = post-floor in-memory value;
* `belowMin` = exact Boolean test against `volMin`.

The packet already functionally does this; this is just terminology preservation.

### 5. G4 does not certify `curTp` correctness

**P056 / L17.**

This is now explicitly stated and therefore not a flaw in the acceptance contract. G4 certifies that the per-bar series is present and joined to T1/T2 correctly; it does **not** establish that the underlying TP-management calculation is correct. 

### 6. G2 remains intentionally non-exhaustive for non-IDLE 17:00 misses

**P052 / L18.**

This is explicitly disclosed. A 17:00 miss caused before the IDLE seed head still produces no SEEDDIAG. It is therefore a scope limitation, not an undisclosed gap.

### 7. The dormant `InpAdoptExt1` writer remains a future configuration hazard

**P007 / P058, L14-L15.**

The dormant block at EA L8807-L8813 can independently write `slRef`, but `InpAdoptExt1=false` is frozen for this run and the packet makes that condition part of the STAGE-1 contract. 

So it is not a v37 blocker. It remains an explicit future configuration constraint.

### 8. The “same terminal / new USD envelope” is correctly isolated from signal-path grading, but that isolation must be honored

**P001 / P058, L13-L15.**

The packet explicitly says currency changes are allowed to affect lot/deal evidence while selection/gate invariance is graded separately. That is the right separation. A lot/deal difference under USD must not be reclassified as signal drift, and a signal-path difference must not be excused as a currency effect.

---

# Analytic ask B — better mechanisms

### E-hunk

The current mechanism is already the minimal clean implementation:

**EA L9663-L9669**

`ext1Take` is calculated once, then either the producer ext1 is adopted with `s1x_sel=2`, or the old selector executes unchanged. That is preferable to modifying the producer or adding another stop-selection stage. 

### Producer/debug separation

For a future production-grade live relay, the stronger architecture would publish the required `g_sl41_*` tuple independently of `InpDebugLog`, while retaining diagnostics under the debug gate. The relevant producer publication region is **EA L5494-L5497**, with the S5 invocation at **EA L8780**.

That removes the deployment dependency without changing the E-hunk itself.

### D2 exhaustiveness

For a future universal 17:00 seed diagnostic, add the already-identified `g_state != ST_IDLE` branch at the **EA L7679** entrance. The current v37 run does not require it because G2 carries the IDLE precondition.

### G4

No new code is needed. The existing **EA L11172-L11194** reporting chain plus T1/T2 trade-instance join is the appropriate mechanism for the stated completeness goal. 

---

## Final ruling

**ACCEPT — PACKET_EXT1LIVE-001 v37.**

Authorize exactly the stated **one build + one run**, with:

* E-hunk `-v36`;
* D1/D2 carried literals `-v32`;
* `InpDebugLog=true`;
* RECON50-EXT1LIVE-V36 / USD envelope;
* G1-G4 graded under the v37 wording;
* any `DEAL` row treated as an adherence failure;
* no commit without the separate token.

The only concrete textual defect I find is the **L8779/L8780 citation mismatch**; it does not warrant another clearance round.

## Luna-V201-001 (ACCEPT on v201/v38, pasted 2026-09-20, whole)

## accept

**PACKET_EXT1LIVE-001 v38 is clear for exactly one live build and exactly one RECON50-EXT1LIVE-V38 run under the stated USD envelope.** I see no remaining blocker that requires another amend or a halt. The v38 page materially closes the v200 deltas without reopening the probe literals or changing the run envelope beyond the expressly defined USD configuration. 

### G1 — ACCEPT

The lot-floor witness is now properly separated from the send-preparation criterion. `belowMin=1` is the operative refusal witness; rounded `rawLots` is context; and the packet separately permits the expected `volMax` cap artifact. 

The important boundary is preserved: lot/deal behavior is graded under G1 and is not allowed to masquerade as signal-path drift. P058 makes that separation explicit. 

### G2 — ACCEPT

The G2 clause remains correctly scoped to the IDLE precondition rather than pretending that WINDOW/SESSION/RETEST covers a `g_state != ST_IDLE` refusal. The v38 packet also carries the non-fire control as separate state evidence. 

No new strategy-state mutation is introduced by these diagnostics.

### G3 — ACCEPT

The live E-hunk is now correctly specified as:

`domain-valid && ext1Defined && finite(pxExt1) && finite(currentPrice) && protective-side`

before adoption. DIR_NONE cannot enter the adopt arm because the direction-domain conjunct is evaluated first. 

The helper's strict inequality is explicit in the supplied EA evidence, so equality is rejected rather than treated as protective. 

The A3 runtime target is also properly converted from the old counterfactual into a live-runtime acceptance criterion: `sel=2`, adopted stop equal to the producer ext1, TP_ELECT at 0.68, and no 16:45:01 SIGNAL. 

### G4 — ACCEPT

The T1/T2 distinction is now clean and the 10-row 8/28 census has an explicit owner for every row. The terminal join remains separate from the per-bar completeness table, and the journal applies only to T1. 

That is the right contract for this goal.

---

# Analytic ask A — remaining defects, gaps, or imprecisions

There is **one concrete residual defect** and several non-blocking implementation notes.

### 1. P058 still contains a slightly confusing selector citation chain

**P058 / L21.**

It says the selector is:

> “L9663-L9669 (B L9668)”

while the surrounding citation map separately describes the old-to-new mapping and the live R-gate as L9671-L9673.

This is understandable, but the canonical live-selection range should be stated once as:

**E-hunk L9663-L9667; probe B L9668; closure L9669; R-gate L9671-L9673.**

This is documentation precision, not a logic defect.

### 2. The debug-gated producer remains a live configuration dependency

**P007 / P058, L14-L15.**

The E-hunk consumes `g_sl41_*`, whose publication occurs under the `InpDebugLog` gate. v38 explicitly authorizes the live arm only with `InpDebugLog=true`, so the current run is well defined. 

But this means the future live behavior is still configuration-dependent: with debug logging false, `g_sl41_def` remains at its defaults and the E-hunk falls back.

That is not a v38 blocker because the envelope explicitly freezes `InpDebugLog=true`; it remains a production-architecture note.

### 3. The dormant `InpAdoptExt1` writer remains present

**P007 / P058, EA L8807-L8813.**

The packet correctly keeps `InpAdoptExt1=false` as the dormant condition. The existing block can write `slRef` later in the function if enabled. 

Under the frozen false input, this does not create a runtime conflict. For a future unrestricted deployment, that configuration dependency should remain explicitly guarded.

### 4. The producer/selector equality is still not a structural theorem

**P007/P054/P058, L14-L15 and the G3 condition.**

The packet correctly treats N-2 equality as an evidence condition rather than silently upgrading it to proof. That is the correct status.

It means the v38 runtime run is doing useful work here: it actually tests the producer value consumed by the E-hunk rather than relying solely on old selector equivalence.

### 5. G2 is still not universal outside the IDLE precondition

**P052 carried in P001/P058, L13/L21.**

A 17:00 refusal before the IDLE seed head still produces no SEEDDIAG. This is explicitly disclosed, so it is not an acceptance defect for the stated target.

A future “all 17:00 misses” goal would still need a `STATE` branch at the L7679 entrance.

### 6. G4 remains completeness-only

**P056 / L17.**

The packet correctly says `curTp` correctness is not graded. Therefore G4 should not later be cited as proof that TP-management itself is correct. It proves the requested reporting/join completeness only. 

### 7. The D1 raw-lot terminology could still be made more exact

**P050 / L16.**

At the diagnostic site, `lots` has already passed through `MathFloor`. So the precise terminology remains:

* `rawLots`: pre-floor calculation, rounded for output;
* `lots`: post-floor in-memory value;
* `belowMin`: exact comparison result.

The packet functionally honors that distinction; this is wording only. 

---

# Analytic ask B — better mechanisms

### E-hunk

The current mechanism is the right minimal change at **EA L9663-L9669**: calculate one `ext1Take` predicate, adopt with `s1x_sel=2`, otherwise execute the legacy selector unchanged. This avoids touching the producer or the downstream R-gate. 

No better mechanism is needed for this run.

### Producer publication

The stronger future architecture would decouple the `g_sl41_*` publication at **EA L5494-L5497** from the `InpDebugLog` diagnostic gate, while leaving diagnostic printing gated. That would eliminate the configuration dependence without changing the E-hunk.

### D2

For universal 17:00 attribution, add a `branch=STATE` diagnostic at **EA L7679** for `g_state != ST_IDLE`. The existing v38 instrumentation is sufficient for the explicitly filed IDLE target.

### G4

No code change is preferable. The existing **EA L11172-L11194** reporting chain plus T1/T2 trade-instance join is the appropriate mechanism for the stated completeness goal. 

## Final ruling

**ACCEPT — PACKET_EXT1LIVE-001 v38.**

Authorize exactly:

**one live build of the E-hunk v2 (`-v37`) + carried A/B/C/D1/D2 literals + one RECON50-EXT1LIVE-V38 run under `RECON50_DEMO_USD`, `InpMode=1`, `InpDebugLog=true`.**

The remaining observations are documentation/future-deployment notes, not blockers to this authorization. The packet's own adherence contract also provides the required hard stop if a `DEAL` row appears.

---

## Luna-V202-001 (amend-with-delta on v202, pasted 2026-09-20, whole)

## Verdict: **amend-with-delta — gate E-b to the booked TP touch only**

Under the quoted rule, the engine should **not keep the nearest-recompute touch exit**. The post-entry touch rule says that a line's touch or retest does nothing once entered; the stated exception is the ordinary take-profit touch. The 8/28 evidence makes the intended distinction concrete: the trade's booked TP was **1.16322**, while the 10:45 recomputed target **1.16459** was a different session-level value, and the page explicitly records that touch as early under the break-retest rule.   

The delta should therefore be:

**E-b (`vTP`) fires only when price touches the latched/booked `tpRef`; non-booked nearest-target touches are ignored. `vBREAK` remains unchanged and continues to provide the early exit on a qualifying body-close break.**

### Exact code impact

At **L23**, `MtNearestTpTarget(...)` currently recomputes `curTp` on every evaluation. At **L32-L36**, E-b then defines TP as touch of that current recomputed value. That is the semantic defect. 

The minimal change is therefore at **L32-L36**:

* retain `MtNearestTpTarget(...)` only as diagnostic/census information if useful;
* make `vTP` test the trade's **booked `tpRef`**, not `curTp`;
* preserve the existing long/short touch semantics.

Then at **L129-L131**, the TP exit price should be the booked TP value (`tpRef`), rather than the recomputed `curTp`. The SL → TP → BREAK → HTF priority itself does not need to change. 

The candidate-set function at **L10911-L10948** can remain for whatever other purpose legitimately requires a nearest target, but it should no longer define the post-entry TP-exit trigger merely because it is the nearest current candidate. 

---

## Why the current implementation does not fit the quoted rule

The critical sequence is:

1. `haveTp` is calculated from `MtNearestTpTarget(...)` on the current bar using `nextOpenPx` as the price reference. 
2. That function walks **18 session buffers**, applies the swept-mask filter, then adds authority-filtered POI lines, selecting a best candidate dynamically. 
3. E-b then exits on touch of whichever candidate is currently nearest. 
4. On the cited 10:45 bar, that recomputation produced **1.16459**, which was touched and immediately classified as `TP_TOUCH`. 
5. But the trade's recorded/booked TP was **1.16322**, and the page expressly says the 1.16459 touch was early under the break-retest rule. 

So the issue is not merely that the nearest target happened to be the wrong number on one bar. The mechanism itself allows the exit target to **change after entry**, whereas the quoted rule makes the relevant distinction between a booked TP touch and a touch/retest of other lines. 

---

# Analytic A — defects, gaps, and imprecisions

### 1. **E-b conflates "current nearest target" with "booked TP."**

**Lines L23 and L32-L36.**

The comment calls `curTp` the "CURRENT nearest valid target" and makes its touch an exit. That is materially broader than the stated post-entry rule. 

### 2. **The TP trigger is mutable after entry.**

**Lines L23, L157-L184.**

Because the candidate walk is performed afresh, the target against which E-b tests can change from bar to bar. The session-buffer set and the authority-filtered POI set are dynamic inputs to that recomputation. 

That creates precisely the unwanted behavior demonstrated at 10:45: a later, closer candidate can terminate the trade even though it was not the booked TP. 

### 3. **The rule-to-code terminology is underspecified around "normal take-profit."**

**Lines L32-L36 versus L16-L17 and L191-L217.**

The page says normal TP exits are valid for session liquidity, POC, or VWAP targets, but the current candidate mechanism also ranges across the larger session-buffer and POI candidate set. The page establishes the intended outcome for the cited trade, but it does not explicitly define whether every candidate ever produced by `MtNearestTpTarget` can become a booked TP at admission, or whether only a separately latched `tpRef` has that status. The requested delta resolves that ambiguity by making the **latched booked TP** the post-entry touch trigger.

### 4. **The exact `tpRef` latching/binding is not shown in this page.**

The question names `tpRef` as the desired booked-TP source, while this evidence region exposes `curTp` and the resulting exit. The page does not include the declaration and admission-time assignment of `tpRef`. Therefore the semantic amendment is clear, but the page alone does not prove the precise storage location or latching statement for `tpRef`.

That is a source-bound gap, not a reason to halt.

### 5. **`MtIsBreakTrigger(k)` is treated as authoritative but its definition is outside the supplied region.**

**Lines L62, L79-L83.**

The break path is otherwise explicit: line must be a trigger, behind the trade, and body must strictly cross it. But the page does not show which POI categories `MtIsBreakTrigger` includes. 

So I can rule that the **break mechanism remains**, but cannot independently verify from this page that its trigger universe exactly equals every line intended by the quoted "POC or AVP" wording.

### 6. **The equality rule is precise for body-break, but unrelated equality behavior for TP touch is not stated.**

**Lines L50-L67 versus L35-L36.**

The page explicitly specifies strict inequality for a body break and states that exact equality never breaks. 

The TP path, by contrast, uses ordinary `>=` / `<=` touch semantics. That is coherent with "exit on touch," but the document does not expressly state whether exact equality at the booked TP is intended to count. It is the natural reading of touch, but this is an imprecision in the specification rather than a defect in the proposed gate. 

### 7. **`nextOpenPx` deserves an explicit semantic label.**

**Lines L23-L24 and L54-L60.**

`nextOpenPx` is used as the reference price both for selecting the nearest TP candidate and for deciding whether a POI line is "behind." The supplied comments identify the body as open → next open under the T161K convention, so this may be intentional. But the page does not spell out that `nextOpenPx` is deliberately the reference for candidate selection as well as break positioning.  

That becomes less consequential once E-b is gated to a latched TP.

### 8. **`curTp` would become diagnostically different from the actual TP exit source after the amendment.**

**Lines L112-L120 and L130.**

`EXITVERDICT` currently prints `curTp`, and the current close path uses it. After gating, `curTp` may remain useful as a diagnostic comparison, but it must no longer be presented in a way that suggests it is the booked TP. Otherwise the logs could continue to blur "nearest candidate" and "actual exit target." 

---

# Analytic B — better mechanism

The cleaner mechanism is **two separate concepts**:

**Booked exit target:** latched once for the managed trade as `tpRef`.

**Dynamic line census:** `MtNearestTpTarget(...)` may still compute `curTp` for diagnostics or research, but it is not an exit authority after admission.

That gives:

```text
booked tpRef
   |
   +-- touch --> vTP --> MT_EXIT_TP_TOUCH

dynamic nearest candidates
   |
   +-- touch/retest --> no exit

behind trigger line
   |
   +-- strict body-close break --> vBREAK --> MT_EXIT_POI_BODY_BREAK
```

The code changes are consequently narrow:

**L32-L36:** replace the E-b touch test against `curTp` with the booked `tpRef`.

**L112-L120:** preferably label/log both values distinctly if `curTp` remains printed, e.g. booked TP versus nearest diagnostic candidate.

**L129-L131:** TP exit price should come from `tpRef`.

**L151-L188:** no semantic change required if `MtNearestTpTarget` is retained as diagnostic/candidate computation; otherwise it can eventually be removed from the exit engine, but that would be a larger change than necessary.

The body-break path at **L39-L83** stays intact, including its strict body-cross rule and the requirement that the line be behind the trade. 

The final priority at **L126-L131** also remains intact: SL first, booked TP touch second, body-break third, HTF flip fourth. 

## Final ruling

**AMEND-WITH-DELTA**

**Gate E-b to the booked `tpRef` touch only, at L32-L36, and use that same booked value at L130. Keep `vBREAK` unchanged at L39-L83 and preserve the existing exit priority at L126-L131.**

The current nearest-recompute touch behavior conflicts with the quoted "touch or retest does nothing once entered" rule as demonstrated by the 10:45 **1.16459** exit versus the booked **1.16223** TP.  

No halt is warranted from the page: the defect is local, the intended correction is specific, and the existing body-break mechanism can remain untouched.

---

## Luna-V203-001 (ACCEPT on v203/packet v1 with key, pasted 2026-09-20, whole)

## **ACCEPT — CLEAR PACKET_P-EXITGATE-1 v1**

I clear **`PACKET_P-EXITGATE-1 v1`** by name for **exactly one build plus exactly one tester run** under the stated RECON51 envelope. The E-b change is a direct implementation of the v202 ruling: the exit-touch authority moves from mutable `curTp` to the booked `tpRef`, while the body-break path remains intact. The packet also keeps the nearest-target walk as a measurement rail rather than an exit authority.

**Volunteered key:** `Luna-V203-001 — CLEAR`

This is my seat's clearance only; it does **not** supply the separate run word or token, and it authorizes no build/run/commit by itself.

### G1 — **PASS as a test criterion**

The six suppressed cases and one booked-TP touch are internally consistent with the old records supplied.

The old engine exited the six non-booked cases at prices different from their recorded booked `tp=` values, while the 2026-09-07 17:10 case exited exactly at its booked `1.16315`. Under the new E1 logic, those six become `tpRecomputeTouch && !tpBookedTouch`, while the 17:10 case sets `tpBookedTouch` and therefore `vTP`. The equality-as-touch treatment is also explicit in the packet.

The critical logic is correctly separated:

```text
recompute touch + no booked touch  -> suppression counter only
booked TP touch                    -> vTP
booked TP touch + recompute touch  -> vTP, no suppression
```

### G2 — **PASS as a run gate**

The supplied eight entry-identity counters and their exact RECON50 reference values make this a checkable regression gate:

`SIGNAL 7, TP_ELECT 12, SIDE1X 14, SIDE1E 14, STOPRESOLVE 43, LOTDIAG 7, SEEDDIAG 6, SESSION_LIMIT 7`.

The packet correctly makes entry behavior a must-match condition rather than allowing the exit amendment to alter upstream birth/selection behavior.

### G3 — **PASS as a run gate**

The requested rail is appropriately diagnostic rather than behavioral: `tpB`, `h`, `l`, and `sup` are added to `EXITVERDICT`, with no new alert kind and the existing counts preserved. That is directly aligned with the stated purpose of measuring booked-vs-recompute divergence without creating another decision path.

### G4 — **PASS as a run gate**

The STAGE-1 exact-diff requirement, 0/0 order-send constraint, post-hash recording, and unchanged close-out requirement are appropriate guards for this packet. The stated envelope is also narrow: one build and one tester run, same date range, same mode, same logging, same terminal.

---

# Analytic A — defects, gaps, and imprecisions

### 1. `g_n1_tpRecomputeSupp` is a cumulative counter, but the log field `sup` does not say so

**E4 declaration at L1054-L1055; E4 LOG in the supplied replacement block.**

The counter increments on each suppressed recompute touch but is then printed on every `EXITVERDICT` row. Therefore `sup=6` means six cumulative suppressions up to that point, not necessarily one suppression on that bar.

This is not a correctness defect for G1, because the packet explicitly describes it as a counter. It is a **logging-semantic ambiguity**.

A better field name would distinguish cumulative from per-bar, e.g. `supTot`, or add a separate per-bar boolean/count.

### 2. `tpB` is not self-describing when `tpRef` is unset

**E4 LOG replacement.**

`curTp` already prints `"none"` when unavailable, but the new `tpB` uses:

```text
DoubleToString(g_mtrade.tpRef, _Digits)
```

without a validity rendering. The E1 gate correctly checks `tpRef != EMPTY_VALUE && tpRef > 0.0`, so the execution logic is sound. The instrumentation, however, can expose the raw sentinel rather than `"none"`.

Non-blocking, but worth cleaning.

### 3. The packet does not show the admission-time provenance/latching of `tpRef`

**E1/E2 concern; no supplied line in the packet establishes the write site.**

The amendment correctly consumes `g_mtrade.tpRef`, but this page does not independently show where the booked TP is established and whether it is immutable thereafter.

That is not a reason to halt this probe because the requested change is specifically the **exit gate**, and the packet treats `tpRef` as the existing booked-target field. It is nevertheless the principal semantic dependency of the amendment.

### 4. The relationship between `curTp` and the live exit path is now conceptually split

**E1 NEW and E3 keep-walk.**

After the amendment, `MtNearestTpTarget()` still runs and `curTp` is still printed, but neither determines `vTP`. That is correct, yet the surrounding diagnostic terminology could make a future reader mistake `curTp` for the operative TP.

The comments should consistently call it **diagnostic recompute target** rather than simply `curTp`/current target.

### 5. The E1 comment is slightly over-broad

**E1 NEW comment.**

> "only body-close break (E-c) exits early"

Taken literally, that omits the independently existing SL and HTF exit paths. The actual code does not make that mistake; it only concerns non-booked **line touches/retests**. The prose would be more precise as: non-booked line touch/retest does nothing; the existing body-close break remains an early line exit.

### 6. The packet does not explicitly restate same-bar exit priority in G1

**E1/E2 versus the existing priority chain.**

The code preserves `SL -> TP -> BREAK -> HTF`, so the amendment itself does not disturb priority. But G1 is primarily an exit-fidelity fixture, and the packet could state that the expected booked-TP touch is evaluated within the existing priority rather than as an absolute override.

Again, non-blocking because E2 changes only the TP exit price source.

### 7. E2 should use `tpRef` exactly as specified — and it does

**E2 OLD/NEW at L11195.**

This is worth calling out because it closes a subtle residual bug: changing the trigger to booked TP while leaving the actual exit price at `curTp` would have produced a mixed-semantic exit record. The supplied E2 amendment correctly removes that possibility.

### 8. The retained nearest-target walk remains potentially expensive, but that is a measurement choice

**Candidate walk / E3.**

The packet deliberately retains the walk so the divergence can be measured. That is reasonable for this one controlled probe. For production code, continuously recomputing a target that is no longer an exit authority would be unnecessary work, but removing it now would defeat the stated diagnostic purpose of the packet.

---

# Analytic B — better mechanism

The **semantic mechanism in v1 is already the right one**:

```text
tpRef
  └─ touch -> vTP -> MT_EXIT_TP_TOUCH

MtNearestTpTarget/curTp
  └─ touch -> diagnostic only

behind trigger + strict body cross
  └─ vBREAK -> MT_EXIT_POI_BODY_BREAK
```

That is preferable to trying to "freeze" `curTp`, because freezing a recomputed candidate would preserve the wrong abstraction. The authoritative object should be the already-booked TP itself.

The only refinement I would make is instrumentation:

**E1:** optionally set a per-bar `bool/int tpRecomputeSuppHit` when the recompute touch is suppressed.

**E4 declaration:** retain `g_n1_tpRecomputeSupp` as the cumulative total.

**E4 log:** print both `supHit` and `supTot`, and print `tpB=none` when `tpRef` is invalid.

That would remove the only meaningful ambiguity in the new rail without changing exit behavior.

## Final ruling

**ACCEPT — `PACKET_P-EXITGATE-1 v1` cleared by name for exactly one STAGE-1 exact-diff-gated build and one RECON51-EXITGATE-V1 tester run.**

The requested E-b gate is correctly localized to the booked `tpRef` at the supplied E1 lines, the exit price is correctly switched to `tpRef` at **L11195**, and the recompute walk remains available for measurement rather than authority. No halt condition is exposed by the page.

## Luna-V204-EXITGATE-001 (AMEND-WITH-DELTA on v204/packet v2, pasted 2026-09-20, whole)

**AMEND-WITH-DELTA**

**Clearance status:** Not yet clear for the requested one-build/one-run envelope. The packet is sufficiently bounded for a mechanical amendment; I see no halt-level contradiction or live-money exposure in the stated scope.

**Volunteered key:** `Luna-V204-EXITGATE-001`

### Analytic A — defects, gaps, and imprecisions

**1. G1 does not actually prove all six named suppressions.**
**Packet L33.**
G1(i)–(iii) can all pass while one of the six named cases simply exits by some other mechanism rather than being suppressed by the booked-TP gate. The aggregate `sup` counter is expressly forbidden from having a predicted value under G1(iv), and the EXITVERDICT rail does not identify which of the six rows generated a suppression. Therefore the stated claim “six suppressed, one kept” is stronger than the executable grading rule.

**Required delta:** add a row-level observable for the six named cases, or explicitly require each named case to show a suppression event with its bar/time, direction, booked TP, recompute-touch basis, and no MTEXIT from that candidate. A permitted same-bar booked-TP touch remains conformant exactly as stated.

**2. `sup` semantics are under-specified.**
**Packet L25, L33.**
The declaration and log field are specified, but not the precise increment event. It is not stated whether a bar can increment `g_n1_tpRecomputeSupp` more than once, whether increments are per evaluation or per completed bar, or the reset scope. G1 says it “counts bars, not trades,” but that does not uniquely define the counter.

**Required delta:** define `sup` as an explicit bar-counting rule: the exact condition that constitutes one suppressed bar, maximum one increment per bar, and the reset boundary.

**3. G1(ii) identifies the retained trade by time/price but does not state the identity key used for matching.**
**Packet L33.**
The grading text says “the 9/07 17:10 trade” and compares prices, while the packet separately supplies `entryPrice`, `fillBarTime`, and `signalBarTime` in the admission latch at **EA L10053-L10066**. The rule should state which lifecycle fields identify the trade so a later cascade cannot accidentally satisfy the check using another trade at the same price.

**Required delta:** define the G1 trade match using the supplied lifecycle identity, preferably `fillBarTime`/`signalBarTime` plus direction, rather than price alone.

**4. Price equality is not defined at the comparison layer.**
**Packet L33; EA L10053-L10066; P25 EXITVERDICT ternary.**
The packet says equality counts as touch, while the instrumentation serializes prices with `_Digits`. It does not say whether the grading equality is exact numeric equality of the stored doubles, equality after `_Digits` normalization, or equality of the logged strings.

**Required delta:** state the comparison rule explicitly. This should not introduce a tolerance.

**5. G2's “traced to the still-open trade” exception is not sufficiently checkable.**
**Packet L34.**
It correctly identifies the 09/07 09:20 held trade crossing the 16:45 admission as an intended lifecycle consequence, but “traced to” does not define the evidence required to distinguish that consequence from an unrelated entry-path drift.

**Required delta:** require the blocked admission to show the active managed trade as the sole blocking condition, with the affected bar/time and lifecycle state recorded. No broader divergence should be excused merely because a trade was open.

**6. G4's line-count rule is not by itself sufficient, although the exact-diff gate largely fixes this.**
**Packet L36.**
`+14` is a useful secondary invariant, but line count alone cannot establish that the four intended hunks are the only edits. The packet does say STAGE-1 is exact-diff gated, so this is not a halt issue; the wording should make the exact-diff allowlist primary and `+14` a secondary invariant.

### Analytic B — better mechanism for the stated goal

I do **not** see a need to replace the basic mechanism. The booked-TP provenance is correctly anchored by the admission latch at **EA L10053-L10066**, with `g_mtrade.tpRef = tpTarget` at **L10062**, and the E4 rail is correctly re-anchored beside the actual N1 counters at **EA L1054-L1055**.

The one mechanism improvement I would make is **row-level suppression attribution rather than aggregate-only counting**. The existing EXITVERDICT rail at **EA L11176-L11187** and its v2 extension can carry the needed fields; the additional instrumentation would touch that EXITVERDICT site and the E-b suppression branch/counter site, without changing S5 admission, `tpRef` latching, R-gating, or the exit decision itself. The current design can therefore remain the mechanism, with instrumentation made sufficient to prove the six named cases individually.

### Other checks

The **TPREF provenance** supplied at **EA L238-L257** and the admission latch at **EA L10053-L10066** are internally coherent: `tpRef` is presented as the admission value rather than a recomputed mid-trade value.

The **E4 re-anchor** is materially corrected versus v203: the supplied true anchor is **EA L1054-L1055**, and the new diagnostic counter is inserted after that anchor as stated. I see no defect in that re-anchoring itself.

The stated **+14 line budget** in **Packet L36** is arithmetically consistent with the four listed hunk deltas: `11 + 1 + 0 + 2 = 14`.

I therefore grade the packet **AMEND-WITH-DELTA**, not halt. After the two G1/G2 grading clarifications above—especially row-level proof for the six suppressions—the requested one-build/one-run clearance envelope is sufficiently specified for this review.

## Luna-V205 (AMEND-WITH-DELTA on v205/packet v3, no key volunteered, pasted 2026-09-20, whole)

**AMEND-WITH-DELTA**

The core E-b mechanism is coherent: it changes the TP-touch decision from the recomputed target to the booked `tpRef`, preserves the recompute path as diagnostic-only, and changes the logged exit price to the booked value. The packet is not quite ready for clearance because the grading language overstates what the new `sup` counter proves, and G2/L40 contain an avoidable semantic mismatch.

### G1 — amendment required

**Defect 1 — `sup` is a call counter, not a bar counter.**

The new increment is:

* E1 NEW, after `tpRecomputeTouch`: `if(tpRecomputeTouch && !tpBookedTouch) g_n1_tpRecomputeSupp++;`
* Packet L33 says `sup` “counts bars” and defines the increment as running “at most once per `EvaluateManagedTrade` call.”
* Packet L40 describes the novel evidence as six predicted **TP-exit suppressions** and says the run measures where booked-vs-recompute divergence occurred.

Those statements are not equivalent. The code increments once per **function call**, with no per-`barTime` latch. If `EvaluateManagedTrade()` can execute more than once while the same bar is current, the same suppressed divergence can increment `sup` repeatedly. Nothing on the page establishes one invocation per bar.

That matters directly to the “six predicted suppressions” claim. Six named bars can produce `sup > 6`, and the counter can no longer be treated as a bar count.

**Required delta:** either:

1. change L33/L40 to define `sup` explicitly as cumulative `EvaluateManagedTrade`-call count, and stop using it as proof of “six bars”; or
2. preferably, make the counter genuinely bar-based by adding a per-bar latch keyed by `barTime` at the E4 declaration area and incrementing only on the first qualifying recompute divergence for that bar.

The second mechanism is the cleaner fit to the stated evidence objective.

### G1 — smaller precision fixes

**Defect 2 — criterion (ii) should carry the packet's own trade-identity key explicitly.**

L33 says the required 09-07 17:10 row may come from either admission, then separately says trade matching is by `fillBarTime/signalBarTime + direction`, never price alone. The criterion itself names time/reason/price but does not explicitly incorporate that identity key.

**Delta:** make the required-row test explicitly use `(signalBarTime, fillBarTime, direction)` before checking `reason=TP_TOUCH` and `exit=1.16315`. That removes any remaining ambiguity.

**Defect 3 — the `sup == 0` rail-floor rule is only meaningful if the counter has a defined unit.**

L33's rail floor is sound as a diagnostic concept, but it depends on Defect 1 being fixed. Otherwise “suppressed exits existed but `sup==0`” is not strictly a bar-count wiring failure; it is a failure of a call-count-based instrument to observe the event.

### G2 — amendment required

**Defect 4 — L40 says “entry behavior must reproduce exactly,” while L34 explicitly permits a blocked later admission.**

L34 says the held-trade case can be **conformant-annotated** where the active managed trade is the sole blocker. L40 nevertheless states:

> “entry behavior must reproduce exactly.”

Those are different propositions at the admission level. The new exit gate can intentionally keep a trade open longer, which can legitimately block a later admission under the single-trade lifecycle. The packet itself acknowledges that exact situation.

The clean formulation is:

* signal/entry-predicate behavior remains identical;
* any changed **admission** is conformant only when the active managed trade is the sole lifecycle blocker, with the specified annotation.

That is consistent with L34 and with the stated “gate sits downstream of the S5 commit.”

**Defect 5 — aggregate counts alone do not prove entry identity.**

L34 presents the diagnostic counts and says the rows are identical to RECON50, which is stronger than counts alone, but the grading rule itself is written principally as count equality plus one special-case annotation.

For a true identity claim, the page should require exact row identity for the entry diagnostics, not merely equal totals. At minimum, that should include the row's existing identifying fields rather than only the seven/equivalent totals.

### E-b / TP mechanism

The actual E1/E2 change itself is internally consistent:

* E1 L11097-L11102 is replaced by the booked-TP touch decision plus the diagnostic recompute test.
* E2 L11195 changes `exitPrice` from `curTp` to `g_mtrade.tpRef`.
* The `tpRef` provenance you supplied is coherent: declaration at L249, flat reset at L285, single admission write at L10062, read in MTLIFE at L10979.

I do **not** see a defect in the basic “booked target governs TP touch; recomputed target is diagnostic only” mechanism.

### Additional contract gap worth amending

**Defect 6 — the packet proves a `tpRef` write path, but does not state the invariant that every active managed trade reaching E-b has a valid booked `tpRef`.**

E1 deliberately refuses to create a booked-touch from `haveTp` when `tpRef` is absent/invalid:

`g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0`

That is correct for the stated rule, but it means an active trade with an invalid/missing `tpRef` can silently lose TP-touch behavior entirely.

The packet currently says the field is written once at admission, which is evidence for the intended lifecycle, but not the explicit invariant:

`g_mtrade.active == true  =>  valid booked tpRef exists`.

For a production-grade gate, I would add that invariant to the page and make its violation a diagnostic/build/run failure rather than an implicit “no TP.”

### E4 log / diff review

I do **not** see a line-budget defect in the v3 arithmetic presented:

* E1: +11
* E4 declaration: +2
* E2: +0
* E4 log: +0
* total: **+13**, post-build **11248**

The withdrawn v2 `+14 / 11249` figure is correctly identified as superseded on the one miscount point. Packet L36 is internally consistent on that matter.

The log expansion at L11176-L11187 is also logically sufficient to expose `tpB`, `h`, `l`, and `sup` without changing the exit decision.

### Better mechanism

For the stated goal, I would keep the booked-TP gate exactly as proposed and improve only the instrumentation:

**Touch decision:** keep E1/E2 as written.

**Suppression counter:** make it explicitly one-per-bar, keyed by `barTime`, rather than one-per-`EvaluateManagedTrade()` call. The declaration belongs at the E4 anchor around L1054-L1055; the increment site is the E1 new block around L11097-L11102.

That gives a directly checkable invariant:

`sup == number of distinct bars on which recompute-touch was true while booked-touch was false`.

Then G1's “six predicted suppressions” becomes a testable statement instead of an inference from invocation frequency.

For G2, change the grading language to distinguish **entry predicate identity** from **admission identity under lifecycle blocking**. No change to the exit mechanism is necessary for that correction.

### Verdict

**AMEND-WITH-DELTA**, specifically:

* fix the `sup` unit/once-per-bar issue — **L33, L40, E1 L11097-L11102, E4 L1054-L1055**;
* make the required 09-07 17:10 identity test explicit — **L33**;
* reconcile “entry behavior must reproduce exactly” with the allowed held-trade blocker — **L34, L40**;
* tighten “entry identity” from aggregate counts to row identity — **L34**;
* state the active-trade → valid-`tpRef` invariant — **L33/L34 plus the tpRef provenance at L249/L285/L10062/L10979**.

**Volunteered key:** none.

## Luna-V206 (AMEND-WITH-DELTA on v206/packet v3.1, no key volunteered, pasted 2026-09-20, whole)

**AMEND-WITH-DELTA — not clearable yet. No halt-level code-safety defect is evident from the page, but the clearance contract still has two material specification gaps. No key volunteered by this review seat.**

### G1 — AMEND-WITH-DELTA

**E1 L11097–11102, E2 L11195, E4 L11176–11187, packet P33 and P40.**

The booked-TP mechanism itself is internally coherent:

* E1 now computes `tpBookedTouch` from the latched `g_mtrade.tpRef`.
* `vTP` is driven only by `tpBookedTouch`.
* E2 writes `exitPrice = g_mtrade.tpRef`.
* The recompute path is diagnostic-only through `g_n1_tpRecomputeSupp`.

The remaining defect is in the **evidence rule**, not the exit logic.

P33 says the six suppression proof must rest on **MTEXIT/MTLIFE rows, never on `sup`**. But for a successfully suppressed case there is, by definition, no MTEXIT at that early bar. MTEXIT/MTLIFE can establish:

* the trade existed and its booked TP;
* there was no exit at the old early price.

They do **not, by themselves, establish that the new run actually encountered the recompute-touch condition** at that bar. That requires the new-run `EXITVERDICT` evidence (`curTp`, `tpB`, `h`, `l`) or an equivalent event-specific diagnostic.

This is especially important because P40 expressly says the novel evidence is the booked-vs-recompute divergence measured through `sup` plus `tpB/h/l`.

**Required delta:** for each of the six named suppression cases, require a new-run `EXITVERDICT` observation at the relevant bar showing the recompute-touch basis from `curTp`/`h`/`l`, together with the booked `tpB`, and separately require the absence of an MTEXIT for that admission. `sup` remains corroborative and cumulative, not the sole proof.

That preserves your stated rule that the recompute source buffer need not yet be identified.

### G2 — ACCEPT

**P24 and P34.**

This gate is sufficiently defined.

The exact-row-identity requirement is stronger than totals alone, and the sole-blocker exception is narrowly bounded to the stated single-trade lifecycle. The 08-28 16:25 and 09-07 16:45/09:20 collision cases are explicitly handled rather than being granted a broad “trade was open” exemption.

No amendment needed.

### G3 — AMEND-WITH-DELTA

This is the clearest page-level omission.

The request asks for **G1–G4**, but the supplied v3.1 packet text contains explicit rules for **G1, G2 and G4 only**. There is no G3 rule in the v3.1 material you supplied.

That means a fresh reviewer cannot grade G3 from the page-only contract you told me to use.

**Required delta:** insert the complete G3 text, or explicitly carry it forward by an exact immutable reference that identifies the source artifact, marker and digest and states that its wording is unchanged. Merely saying “unamended” is not enough for this fresh-session/page-only review.

### G4 — ACCEPT WITH ONE CLARIFYING DELTA

**G4 restatement and P40.**

The commit/token discipline is clear: exact-diff primary, budget secondary, no commit without token.

One imprecision remains:

> “Build 0/0”

That is undefined and sits awkwardly beside the explicit requirement for **one build plus one tester run**. It appears likely to mean zero live orders / zero order-send events, but the page does not define it.

**Required delta:** replace it with the exact intended zero metric, e.g. the already-stated `OrderSend 0/0` or the precise build/run quantity intended. Do not leave “Build 0/0” open to interpretation.

---

## Analytic A — every defect / gap / imprecision I see

**1. G3 is absent.**
Location: the v3.1 packet text as supplied; P33/P34/P40 cover G1/G2/G4, but no G3 appears.
Impact: G1–G4 cannot all be graded page-only.

**2. G1’s proof basis is internally mismatched.**
Location: **P33**, especially the “proof resting on MTEXIT/MTLIFE rows, never on sup” language, versus **P40(b)**.
Impact: absence of MTEXIT proves no emitted exit; MTLIFE proves the booked target; neither alone proves that the recomputed target actually touched on the new run.

**3. EXITVERDICT identity is not fully specified for the cumulative-call instrument.**
Location: **P24**.
You explicitly corrected `sup` to “cumulative EvaluateManagedTrade-call count,” but P24 still frames EXITVERDICT row-count grading around “per-exit-event” versus “per-managed-bar.” It does not define whether multiple `EvaluateManagedTrade` calls on the same bar are expected to yield multiple rows, nor the exact row identity when that happens. That can matter when interpreting cumulative `sup`.

**4. The phrase “Build 0/0” is ambiguous.**
Location: **G4 / P40**.
It conflicts lexically with the one-build requirement unless its metric is explicitly named.

**5. The invalid-`tpRef` invariant is stated but not promoted to an explicit graded run gate.**
Location: **P33**, plus the TPREF provenance section.
You say an invalid `tpRef` reaching E-b is a diagnostic failure and never a silent no-exit. That is good, but the G1 grading text does not explicitly say what observable row/condition constitutes the pass/fail check for this invariant during the run. The four-location provenance makes the invariant structurally credible, but the runtime grading contract could be sharper.

I do **not** see a further mechanism error in the actual E-b change from the supplied text. In particular, E1/E2 are aligned: booked TP determines `vTP`, and the emitted TP exit price is the same booked TP rather than `curTp`.

---

## Analytic B — better mechanism

For the **behavioral mechanism**, I would keep the current E1 design. It is simpler and correctly separates:

`booked TP touch → actual exit`
`recomputed TP touch → diagnostic only`

For the **evidence mechanism**, a cleaner design is an event-scoped diagnostic emitted exactly when:

`tpRecomputeTouch && !tpBookedTouch`

and containing, in one record:

`barTime, signalBarTime, fillBarTime, dir, tpB, curTp, h, l`

plus a monotonically increasing suppression sequence.

That would touch the existing E-b instrumentation at **EA L11097–11102** and the log rail at **EA L11176–11187**. It would make each suppression directly observable instead of reconstructing it from a cumulative counter plus absence of an exit. I would treat that as a **better future rail**, not as necessary to change the exit behavior itself.

### Clearance disposition

**Overall: AMEND-WITH-DELTA.**

The minimum page fixes before clearance are:

1. **Add G3 in full** or bind it by an exact immutable carry reference.
2. **Repair P33 G1** so each suppression has direct new-run recompute-touch evidence; keep `sup` cumulative/corroborative as already intended.
3. **Define “Build 0/0”** precisely.
4. Preferably sharpen P24’s EXITVERDICT row identity for multiple `EvaluateManagedTrade` calls.

**No key volunteered.**

## Luna-V207 (AMEND-WITH-DELTA on v207/packet v3.2, no key volunteered, pasted 2026-09-20, whole)

**Verdict: AMEND-WITH-DELTA — PACKET_P-EXITGATE-1 v3.2 is not cleared for the build/run on this verdict. No key volunteered.**

The E1/E2 design itself is internally coherent: `vTP` is gated by the booked `tpRef`, while recompute-touch is retained diagnostically. The blocking issues are in the **run-proof/grading contract**, not the basic TP gate.

### G1 — AMEND-WITH-DELTA

**P33** is the main problem.

1. **Criterion (i) is effectively tautological after E2.**
   **EA L11195 / P33(i):** E2 now writes:
   `g_mtrade.exitPrice = g_mtrade.tpRef;`

   Therefore every `MT_EXIT_TP_TOUCH` row produced through this path will log the booked TP by construction. Checking `MTEXIT exit == MTLIFE booked tp` no longer independently proves that the booked price was the touched line. The real proof is the `tpBookedTouch` condition in E1, or reconstructing it from the logged `tpB/h/l/dir`.

2. **The required 09-07 17:10 row is not sufficient by itself.**
   **P33(ii):** requiring `TP_TOUCH` + `exit=1.16315` does not independently prove the touch occurred. Because E2 stamps the booked target into `exitPrice`, the required row should also require the direction-specific touch inequality from the `EXITVERDICT` evidence: for LONG, `h >= tpB`; for SHORT, `l <= tpB`.

3. **The six-case 08-28 16:25 branch conflicts with actual lifecycle semantics.**
   **P33 / P34 + EA L10041-L10053:** the active trade is not “blocked”; it is **closed/replaced** by `MTCOLLISION`, followed by `MtReset()`. Therefore the stated “no-MTEXIT because the held trade blocked the later admission” proof form does not describe what the code does.

4. **P33's “no-MTEXIT annotation attaches to the holding trade's own exit row” can be impossible.**
   On the replacement path there may be no MTEXIT row for the holding trade; the observable terminal evidence is the `MTCOLLISION` path. The packet needs a replacement-specific proof form, or an explicit ordering rule requiring the old trade to reach E-b before replacement.

5. **“Six suppressed, one kept” needs an explicit uniqueness definition.**
   **P33(iv):** `sup` increments once per `EvaluateManagedTrade()` call, with no per-bar latch. Multiple evaluations of the same trade on the same bar can increment it more than once. The six cases therefore cannot be defined by `sup`; they need a unique case key such as trade identity + evaluation bar + direction, with `sup` remaining corroborative only.

### G2 — AMEND-WITH-DELTA

**P34** has the same lifecycle mismatch.

* **EA L10041-L10053:** signal-while-managing **replaces** the managed record.
* **P34:** repeatedly calls the affected situation a **blocked admission / sole blocker**.

That exception should be rewritten as **replacement/collision attribution**, not blockage. In particular, the 09-07 09:20 → 16:45 example and the 08-28 10:05 → 16:25 example need to be graded according to the actual replacement mechanism.

The underlying claim that the predicate emitters are upstream of the collision site is coherent: **P34** / cited sites L7691, L9735, L9749, L9929-L9930 are upstream of L10041. So the predicate-identity portion can remain.

### G3 — ACCEPT, with one precision amendment

**P35 / P24 / EA L11176-L11187** correctly put `tpB/h/l/sup` onto each EXITVERDICT print.

One imprecision remains:

* **P24:** “barTime plus call sequence within the bar” is not a field emitted by the shown `EXITVERDICT` format. It is reconstructable as the **ordinal occurrence of EXITVERDICT rows within that bar**, but the packet should say that explicitly rather than implying a printed/runtime sequence identifier.

No new alert-kind issue is apparent.

### G4 — ACCEPT

**P41 / P36 / P03:** the procedural gate is coherent: exact-diff primary, budget secondary, 0-errors/0-warnings as the post-build condition, token required for commit.

This does not cure the G1/G2 grading defects, so it cannot produce a clearance for v3.2 as written.

---

## Analytic A — every defect/gap/imprecision I see

| Location                       | Finding                                                                                                                                                                                     |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **P33(i), EA L11195**          | `exitPrice=tpRef` makes booked-vs-exit-price equality non-independent evidence.                                                                                                             |
| **P33(ii)**                    | Required 09-07 17:10 MTEXIT row needs explicit direction-specific `h/l` vs `tpB` evidence, not just reason and stamped exit price.                                                          |
| **P33, P34; EA L10041-L10053** | “blocked admission” does not match actual replace-on-collision behavior.                                                                                                                    |
| **P33**                        | “no-MTEXIT annotation attaches to holding trade's own exit row” is not generally satisfiable on the replacement path.                                                                       |
| **P34**                        | Same collision/blocked-admission mismatch affects the G2 exception language.                                                                                                                |
| **P33(iv)**                    | `sup` is per call, not per unique trade/bar case; no latch means duplicates are possible.                                                                                                   |
| **P24**                        | “call sequence within bar” is not directly emitted; define it as ordinal EXITVERDICT occurrence or add a sequence field.                                                                    |
| **E1 NEW comment, EA E1 site** | “only body-close break (E-c) exits early” is overbroad as written; other exit predicates such as SL/HTF can also terminate a trade. Narrow the statement to non-booked-target-line touches. |
| **P33 six-case proof**         | A predicted old exit bar can coincide with a collision/replacement before E-b evaluation; ordering therefore needs to be explicit for those cases.                                          |
| **P33(iii)**                   | The early-price coincidence rule is ultimately safe only because the per-case `tpB/h/l` proof exists; the price-only MTEXIT observation is not independently probative after E2.            |

### Analytic B — better mechanism

For the stated goal, I would keep the **E1/E2 booked-TP mechanism** and make the instrumentation directly observable rather than inferential.

At the **E1 site** (the new 17-line block), retain the existing booleans and expose them in the rail:

* `tpBookedTouch`
* `tpRecomputeTouch`
* `tpRef`
* `curTp`
* `h`
* `l`

Then the EXITVERDICT row can say explicitly which predicate fired, instead of making G1 reconstruct `tpBookedTouch` from the other fields.

At **EA L10041-L10053**, I would not change the replace semantics merely to satisfy the test. Instead, make the diagnostic record explicitly represent **collision replacement**: old trade identity, old `tpRef`, replacement bar, and the fact that the old managed record was terminated as `MT_EXIT_REPLACED`. Then P33/P34 can grade the actual lifecycle rather than a hypothetical blocker.

**Net:** v3.2 is close, but I would not clear it until the **P33 G1 proof is made non-tautological** and the **P33/P34 blocker language is reconciled with L10041-L10053 replacement semantics**.

## Luna-V208 (AMEND-WITH-DELTA on v208/packet v3.3, no key volunteered, pasted 2026-09-20, whole)

**Verdict: AMEND-WITH-DELTA. No key volunteered.**
The packet is close, but two contract-level defects prevent a clean clearance as written: one is a direct G2 grading contradiction, and one makes required G1 evidence impossible for several predicted suppression cases.

### G1 — Amend required

The main defect is the interaction between the six suppression proofs and the replacement mechanism.

The packet requires **each of the six suppressed cases** to have an `EXITVERDICT` at its relevant old-exit bar showing the recompute-touch basis.

But the collision block is explicitly **upstream of the E-b walk**: when a signal arrives while a trade is managing, the old trade is closed/replaced before the E-b evaluation can produce that trade's `EXITVERDICT`.

That creates an impossible requirement for at least these three predicted suppressions:

* 08-28 16:25
* 09-04 16:00
* 09-08 17:00

Those are simultaneously listed as replacement bars for the held trade and as old-exit bars whose suppression must be evidenced.

So the page currently asks for an observation that the stated execution ordering cannot produce.

**Required delta:** for a named case whose old exit bar is also a replacement/collision bar, replace the “`EXITVERDICT` at the old exit bar is mandatory” requirement with a collision-time evidence rule. The conformant proof should use the `MTCOLLISION` row plus whatever direct booked-vs-recompute touch evidence is actually available before replacement; it must not demand an `EXITVERDICT` for an object that has already been replaced.

### G2 — Amend required

There is a direct internal contradiction in the row-identity grading.

P34 first says all eight diagnostic families, **including `LOTDIAG` and `SESSION_LIMIT`**, must be exactly row-identical to RECON50 with no exception. It then says `LOTDIAG` and `SESSION_LIMIT` **may diverge** when the difference is caused by the held-trade cascade/replacement.

Those cannot both be the operative grading rule.

**Required delta:** explicitly divide the families into:

* upstream/predicate families that must remain row-identical;
* downstream families (`LOTDIAG`, `SESSION_LIMIT`) that may diverge only under the named replacement/extended-lifetime cascade.

Everything else in G2 can remain as written.

### G1 identity wording also needs one tightening

The 09-07 17:10 required row is said to be acceptable from “whichever admission” produced it, including the possibility of the held 09:20 admission. But the same packet states that the 09:20 trade is replaced by the 16:45 admission. Under the packet's own replace semantics, a 09:20 trade cannot still be the managing trade at 17:10 after that 16:45 replacement.

**Required delta:** make the 17:10 identity rule deterministic: once the 16:45 admission occurs, the 17:10 TP-touch must belong to that replacement admission. Keep the general “whichever admission” wording only if the packet allows a trace in which the later admission does not occur.

### G1 baseline provenance is slightly under-specified

The seven baseline rows give booked TP and old exit price, but the table does not explicitly state the **baseline exit reason** for each row. Since the new proof is specifically about suppressing the old TP-touch behavior, stating that these baseline rows were `MT_EXIT_TP_TOUCH` under RECON50 would make the suppression cases independently well-defined rather than inferred from the surrounding text.

This is an imprecision rather than a code defect.

### G3 — Substantively sound

The new `EXITVERDICT` rail has the required `tpB`, `h`, `l`, and `sup` observables, and the packet explicitly retains row-key and divergence rules.

One minor improvement would be to make admission identity part of the emitted row rather than relying on reconstruction from other records, but that is not necessary to make the packet internally coherent.

### G4 — Sound on the page

The requested build is exact-diff gated, the packet keeps the +13/post-11248 budget constraint, and the compile requirement is explicitly zero errors/zero warnings.

Nothing in the v3.3 text itself gives me a reason to halt G4.

### Better mechanism

For the stated goal, the cleanest code-level mechanism is a **read-only pre-replacement E-b snapshot** at the collision site, immediately before the old trade is marked closed.

The relevant existing collision region is **EA L10038-L10053**, while the actual E-b logic is **EA L11097-L11102 → new L11099-L11115**.

That snapshot would record, for the old admission, the booked `tpRef`, recomputed target, current bar `h/l`, and the two boolean touch tests immediately before replacement. It would directly establish the otherwise-unobservable three collision-bar suppressions without pretending that a post-replacement `EXITVERDICT` belongs to the old trade.

I would keep that as an **instrumentation-only rail**, not a second exit path.

### Clearance disposition

So the page is **not a halt**: the behavior design and the E-b implementation are coherent, and the defects are repairable at the grading-contract level. But it is **not yet clearable as v3.3** because the G1 evidence rule conflicts with the stated collision ordering, and G2 contains contradictory acceptance criteria.

**Final: AMEND-WITH-DELTA. No key.**

## Luna-V209 (AMEND-WITH-DELTA on v209/packet v3.4, no key volunteered, pasted 2026-09-20, whole)

**Verdict: AMEND-WITH-DELTA.**

The E-b mechanism itself is internally coherent on the page: the booked target is latched once at admission (`L10062`), cleared by `MtReset` at `L285`, used for the new TP-touch gate in the E1 literal, and used again as the TP exit price in E2. The instrumentation adds `tpB/h/l/sup` without changing the alert taxonomy. I do **not** see a code-logic defect in those stated literals that requires a halt.

The amendments are record/grade-precision items, not a change to E1/E2/E4 code.

### G1–G4

**G1 — AMEND-WITH-DELTA, not halt.**

The seven-case grading logic is substantially sound, including the 09-07 17:10 non-vacuity floor, identity-first matching, exact `_Digits` equality, the six-case suppression reconstruction, and the special treatment of the three replacement bars.

The imprecision is in **P24 / P33**, where the prose can be read as requiring a new-run `EXITVERDICT`/`vTP 1→0` observation for all six old-exit bars. Your own ordering rule says that is impossible for the three replacement cases because the prior trade is closed by the collision/admission block before `EvaluateManagedTrade` runs. For those bars the evidence is **MTCOLLISION + no E-b evaluation**, not a new-run `EXITVERDICT` row.

**Delta:** state explicitly that the `vTP 1→0` cross-run comparison applies only where a new-run `EXITVERDICT` row exists; the three replacement-bar cases are graded exclusively by the stated MTCOLLISION/R2 rule.

**G2 — AMEND-WITH-DELTA.**

The replace semantics are clear and the upstream/downstream distinction is materially useful. The six upstream admission families are tied to explicit sites, and `LOTDIAG` is identified at `L10116`.

The gap is **P34**: `SESSION_LIMIT` is included in the downstream carve-out, but its actual emission site is not named. That leaves one claimed downstream family without the same page-level ordering proof given for the others.

**Delta:** add the `SESSION_LIMIT` emission line/range and state explicitly whether it is before or after the `L10041` collision site. No change to the grading rule is needed.

**G3 — AMEND-WITH-DELTA.**

The payload definition is good: `tpB/h/l/sup` are new-run instrumentation, shared fields are cross-run diffed, and the `EXITVERDICT` is per evaluation rather than an event-count device.

The needed wording fix is again the **P35** sentence that describes shared-field `vTP 1→0` changes “at the six old-exit bars.” That is not literally true on the three predicted replacement bars because the new run has no `EXITVERDICT` there.

**Delta:** narrow that clause to “at shared-row old-exit bars,” and cross-reference the three replacement-bar exception in P24.

**G4 — ACCEPT as written.**

The stated exact-diff-first / budget-secondary discipline is clear, the +13/post-11248 budget is explicitly secondary, and the compile requirement is unambiguous. Nothing in G4 needs a semantic change.

### Other page defects / gaps / imprecisions

**P03:** The packet alternates between “pre-build tree” line numbers and the post-build map in P24. The distinction is described, but a reader can still mistake a post-build location for the source anchor. I would make every site reference carry an explicit **PRE** or **POST** qualifier.

**P24:** The “tracked-set counts” are adequately fenced by the exact-diff rule, but the page should say explicitly that the loose substring counts are **sanity checks only**, never acceptance criteria by themselves. The later exact-diff language implies this, but one direct sentence would remove ambiguity.

**P24 / P33:** `sup` is correctly described as cumulative and non-event-counting, but the packet could be even tighter by saying that **no expected numeric value of `sup` exists**. Three of the six suppressed baseline cases are replacement-bar cases and therefore cannot contribute a suppression increment at that old exit bar.

**E1 NEW comment:** “only body-close break (E-c) exits early” is slightly overbroad when read literally because the existing SL path remains an independent exit mechanism. The intended meaning appears to be that **touch/retest of a non-booked target does not create an early TP exit; E-c remains the early target-break mechanism**. This is comment precision, not code behavior.

**P33:** The phrase “booked equality kept” is understandable, but the stronger mechanical statement is that after E2 the TP exit price is `tpRef`, while the independent touch proof comes from `h/l` versus `tpB`. That distinction is already present later in the paragraph; moving it earlier would make the seven-row rule easier to audit.

**P34:** The statement “sole-blocker conformant form is unreachable on this code and is converted to a halt” is logically consistent with the supplied collision code, but it would be cleaner to say explicitly that the collision block **replaces and therefore cannot furnish sole-blocking evidence**, then separately state that any attempted sole-blocker interpretation is a halt.

### Better mechanism for the stated goal

For **this packet**, I would keep the mechanism as-is. The combination of the latched `tpRef`, the E1 dual observation (`tpBookedTouch` versus `tpRecomputeTouch`), the E2 price change, and per-evaluation `EXITVERDICT` is sufficient to establish the requested booked-TP behavior without introducing another live-state latch.

For a future instrumentation packet, a stronger rail than cumulative `g_n1_tpRecomputeSupp` would be a **per-trade suppression latch**, because it would make “this admission experienced a recompute-touch/non-booked-touch divergence” a direct property rather than something reconstructed from a cumulative counter. The natural touch points are the trade struct at **L238-L257**, reset at **L285**, admission at **L10062**, the E1 calculation around **L11097-L11114**, and the E4 log around **L11176-L11187**. That is a better observability mechanism, but I would keep it deferred exactly as the packet currently does rather than expand this run.

### Clearance disposition

So the packet is **not a halt on substance**. It needs a small textual delta covering:

1. the three replacement-bar `EXITVERDICT` absence cases in **P24/P35**;
2. the missing `SESSION_LIMIT` emission site/order in **P34**;
3. explicit PRE/POST labeling for mixed site references; and
4. the narrow wording of the E1 comment / `sup` semantics.

After those deltas are folded, the stated **one-build + one-run** scope is otherwise internally consistent with the page.

**Key:** no key volunteered.

## Luna-V210 (AMEND-WITH-DELTA on the v210 transport, no key volunteered, pasted 2026-09-20, whole; seat version labels filed verbatim)

**Verdict: AMEND-WITH-DELTA.**

The E-b mechanism itself is internally coherent on the page: the booked target is latched once at admission (`L10062`), cleared by `MtReset` at `L285`, used for the new TP-touch gate in the E1 literal, and used again as the TP exit price in E2. The instrumentation adds `tpB/h/l/sup` without changing the alert taxonomy. I do **not** see a code-logic defect in those stated literals that requires a halt.

The amendments are record/grade-precision items, not a change to E1/E2/E4 code.

### G1–G4

**G1 — AMEND-WITH-DELTA, not halt.**

The seven-case grading logic is substantially sound, including the 09-07 17:10 non-vacuity floor, identity-first matching, exact `_Digits` equality, the six-case suppression reconstruction, and the special treatment of the three replacement bars.

The imprecision is in **P24 / P33**, where the prose can be read as requiring a new-run `EXITVERDICT`/`vTP 1→0` observation for all six old-exit bars. Your own ordering rule says that is impossible for the three replacement cases because the prior trade is closed by the collision/admission block before `EvaluateManagedTrade` runs. For those bars the evidence is **MTCOLLISION + no E-b evaluation**, not a new-run `EXITVERDICT` row.

**Delta:** state explicitly that the `vTP 1→0` cross-run comparison applies only where a new-run `EXITVERDICT` row exists; the three replacement-bar cases are graded exclusively by the stated MTCOLLISION/R2 rule.

**G2 — AMEND-WITH-DELTA.**

The replace semantics are clear and the upstream/downstream distinction is materially useful. The six upstream admission families are tied to explicit sites, and `LOTDIAG` is identified at `L10116`.

The gap is **P34**: `SESSION_LIMIT` is included in the downstream carve-out, but its actual emission site is not named. That leaves one claimed downstream family without the same page-level ordering proof given for the others.

**Delta:** add the `SESSION_LIMIT` emission line/range and state explicitly whether it is before or after the `L10041` collision site. No change to the grading rule is needed.

**G3 — AMEND-WITH-DELTA.**

The payload definition is good: `tpB/h/l/sup` are new-run instrumentation, shared fields are cross-run diffed, and the `EXITVERDICT` is per evaluation rather than an event-count device.

The needed wording fix is again the **P35** sentence that describes shared-field `vTP 1→0` changes “at the six old-exit bars.” That is not literally true on the three predicted replacement bars because the new run has no `EXITVERDICT` there.

**Delta:** narrow that clause to “at shared-row old-exit bars,” and cross-reference the three replacement-bar exception in P24.

**G4 — ACCEPT as written.**

The stated exact-diff-first / budget-secondary discipline is clear, the +13/post-11248 budget is explicitly secondary, and the compile requirement is unambiguous. Nothing in G4 needs a semantic change.

### Other page defects / gaps / imprecisions

**P03:** The packet alternates between “pre-build tree” line numbers and the post-build map in P24. The distinction is described, but a reader can still mistake a post-build location for the source anchor. I would make every site reference carry an explicit **PRE** or **POST** qualifier.

**P24:** The “tracked-set counts” are adequately fenced by the exact-diff rule, but the page should say explicitly that the loose substring counts are **sanity checks only**, never acceptance criteria by themselves. The later exact-diff language implies this, but one direct sentence would remove ambiguity.

**P24 / P33:** `sup` is correctly described as cumulative and non-event-counting, but the packet could be even tighter by saying that **no expected numeric value of `sup` exists**. Three of the six suppressed baseline cases are replacement-bar cases and therefore cannot contribute a suppression increment at that old exit bar.

**E1 NEW comment:** “only body-close break (E-c) exits early” is slightly overbroad when read literally because the existing SL path remains an independent exit mechanism. The intended meaning appears to be that **touch/retest of a non-booked target does not create an early TP exit; E-c remains the early target-break mechanism**. This is comment precision, not code behavior.

**P33:** The phrase “booked equality kept” is understandable, but the stronger mechanical statement is that after E2 the TP exit price is `tpRef`, while the independent touch proof comes from `h/l` versus `tpB`. That distinction is already present later in the paragraph; moving it earlier would make the seven-row rule easier to audit.

**P34:** The statement “sole-blocker conformant form is unreachable on this code and is converted to a halt” is logically consistent with the supplied collision code, but it would be cleaner to say explicitly that the collision block **replaces and therefore cannot furnish sole-blocking evidence**, then separately state that any attempted sole-blocker interpretation is a halt.

### Better mechanism for the stated goal

For **this packet**, I would keep the mechanism as-is. The combination of the latched `tpRef`, the E1 dual observation (`tpBookedTouch` versus `tpRecomputeTouch`), the E2 price change, and per-evaluation `EXITVERDICT` is sufficient to establish the requested booked-TP behavior without introducing another live-state latch.

For a future instrumentation packet, a stronger rail than cumulative `g_n1_tpRecomputeSupp` would be a **per-trade suppression latch**, because it would make “this admission experienced a recompute-touch/non-booked-touch divergence” a direct property rather than something reconstructed from a cumulative counter. The natural touch points are the trade struct at **L238-L257**, reset at **L285**, admission at **L10062**, the E1 calculation around **L11097-L11114**, and the E4 log around **L11176-L11187**. That is a better observability mechanism, but I would keep it deferred exactly as the packet currently does rather than expand this run.

### Clearance disposition

So the packet is **not a halt on substance**. It needs a small textual delta covering:

1. the three replacement-bar `EXITVERDICT` absence cases in **P24/P35**;
2. the missing `SESSION_LIMIT` emission site/order in **P34**;
3. explicit PRE/POST labeling for mixed site references; and
4. the narrow wording of the E1 comment / `sup` semantics.

After those deltas are folded, the stated **one-build + one-run** scope is otherwise internally consistent with the page.

**Key:** no key volunteered.

## Luna-V211 (AMEND-WITH-DELTA, no key, v211 transport returns, pasted 2026-09-20, whole; seat version labels filed verbatim)

**Verdict: AMEND-WITH-DELTA.**

The E1/E2/E4 mechanics are internally coherent on the page, and I do not see a code-literal defect that requires a halt. The main issue is a grading-spec ambiguity in the `EXITVERDICT` row-presence/pairing rule, plus two smaller wording issues. I would not volunteer a clearance key from this seat.

### G1–G4

| Gate   | Verdict   | Reason |
| ------ | --------- | ------ |
| **G1** | **PASS**  | E1 gates TP on the booked `tpRef`; E2 makes `exitPrice` equal that booked value; the suppression counter is explicitly corroborative rather than an event count; the six-case proof has the necessary no-concurrent-exit conditions. |
| **G2** | **PASS**  | The replace semantics are consistently carried through admission, collision, MTLIFE and downstream LOTDIAG. The predicted replacement bars and attribution rules are explicit. |
| **G3** | **AMEND** | P35 says there is “exactly one row per closed bar per run,” but the described logger only emits when a managing trade is actually evaluated. The caller is once-per-closed-bar; the `EXITVERDICT` row is therefore **at most one**, not necessarily one. |
| **G4** | **PASS**  | Exact-diff-first, +13 budget, compile 0/0, one build/one run, and no commit without token are all clearly stated. |

## Analytic A — defects, gaps, and imprecision

**1. P35 — `EXITVERDICT` row count is overstated.**
The sentence:

> “EXITVERDICT cross-run pairing key is barTime alone (exactly one row per closed bar per run)”

conflicts with P24/P35's own description that the print occurs when a **managing trade is evaluated**, and with the stated no-verdict return. The once-per-bar property proves the function is evaluated at most once per closed bar; it does not prove an `EXITVERDICT` row exists on every closed bar.

**Required delta:** change this to something like:

> “EXITVERDICT rows are keyed by barTime alone; the single-caller `s_lastBarTime` guard guarantees at most one EXITVERDICT row per closed bar per run, and a row exists only when a managing trade reaches the logging site. Cross-run pairing is by barTime for rows that exist; absence is graded separately, not treated as a duplicate.”

This is the one defect I regard as clearance-relevant.

**2. P24/P35 — row-absence semantics should be stated once, explicitly.**
The packet is otherwise very careful about missing EXITVERDICT rows in the replacement-bar cases, but the general cross-run rule does not say whether an absent row on one side is simply a missing observation or an automatic divergence. That becomes important because G3 says “cross-run diff” while also saying the logger is per-evaluation.

This is a specification gap rather than a code flaw. The clean rule is: pair existing rows by `barTime`; handle expected absence through the already-defined lifecycle/attribution rules; unexpected absence halts.

**3. P33 — “TP-touch-eligible bar” with invalid `tpRef` is not precisely defined.**
The sentence:

> “a TP-touch-eligible bar on a trade with invalid tpRef and no TP exit grades diagnostic failure”

needs a formal basis for “eligible.” The packet should identify it explicitly as the E1 recompute-touch predicate: LONG `h >= curTp`, SHORT `l <= curTp`, with `haveTp=true`.

Otherwise, “eligible” could be read as referring to the booked target, which is unavailable by definition in the invalid-`tpRef` case.

**4. P33 — the “bars above tpB remain marked prediction” sentence is directionally ambiguous.**
The record-closable paragraph says:

> “bars above tpB remain marked prediction.”

For LONG, a bar with `h >= tpB` is exactly a booked-target touch; for SHORT, the analogous condition is `l <= tpB`. Once `h/l` are actually present in the new `EXITVERDICT`, that is observable evidence rather than a prediction. The intended meaning appears to be that **offline/base-run bars lacking h/l remain prediction-only until the new run exposes the per-bar evidence**.

That should be rewritten to avoid a directional contradiction.

**5. P40 — “first measurement that booked-vs-recompute divergence occurred and at what prices” should keep the evidentiary roles separated.**
The text already says this later, but the strongest formulation is: `tpB/h/l` establish the per-evaluation price relation; `sup` is only cumulative corroboration. Nothing should read as though a positive `sup` identifies the bar or price by itself.

This is minor because P33/P35 already substantially correct for it.

## Analytic B — better mechanism

For the stated goal, the cleanest stronger mechanism would be a **per-evaluation suppression boolean**, rather than relying on the cumulative `g_n1_tpRecomputeSupp` counter as the primary rail.

At **E1 L11097–L11115**, define the event directly:

```text
bool tpRecomputeSupp = tpRecomputeTouch && !tpBookedTouch;
```

Then use that boolean both for the counter increment and for the `EXITVERDICT` log at **E4 L11176–L11187**, e.g. an explicit `supp=%d` field.

That gives each qualifying bar its own directly observable suppression predicate and avoids asking the cumulative counter to carry any event-identity burden. The existing booked-target exit path remains untouched, and the existing `tpRef` admission latch remains the authoritative target. The counter can remain exactly what the packet says it is: cumulative corroboration, not an event count.

I would **not** widen the production exit logic beyond the current E1/E2 change merely to solve these grading issues. Most of the needed correction is contract wording and instrumentation attribution, not another behavioral change.

### Minimum amendment

I would make the v3.6 text-only delta at **P35**, with the associated clarification at **P24/P33**:

1. replace "exactly one row per closed bar per run" with **"at most one row per closed bar per run, and only when a managing trade reaches the logging site."**
2. state that **missing rows are handled by the existing lifecycle/attribution rules and are not themselves duplicate rows.**
3. define P33 "TP-touch-eligible" explicitly from the E1 recompute-touch predicate.
4. clarify the P33 "bars above tpB" sentence as prediction-only **where h/l are unavailable**, not where the new-run EXITVERDICT has already exposed the touch relation.

**No code-literal change is required by this review. No clearance key volunteered.**

## Luna-V212 (AMEND-WITH-DELTA, no key, v212 transport, pasted 2026-09-21, whole)

**Verdict: AMEND-WITH-DELTA — v3.7 should not be cleared as written.**
This is not a halt-level design failure. The E-b logic itself is coherent; the amendments are in the grading contract and evidence semantics.

### G1 — AMEND

**Required delta 1 — L33, G1(iv): incomplete termination fallback.**

The predicted-collision absence rule says the prior held trade may explain a missing predicted `MTCOLLISION` only through:

> “SL, BREAK, or TP_TOUCH at booked — or run-end lifecycle state”

But the same packet’s G2 explicitly brings **SESSION_LIMIT** into the replacement-semantics universe at the stated `L7691` site, and the text elsewhere allows HTF-driven eventual-exit rows as family-(b) cases.

So the absence fallback is narrower than the lifecycle actually permitted by the packet.

**Required wording correction:** the “earlier termination” fallback must enumerate every legitimate non-REPLACED terminal path capable of ending the held trade before the predicted replacement bar, including at least `SESSION_LIMIT` and any actual HTF terminal exit reason that is in the EA’s exit universe.

This is a real grading gap, because otherwise a legitimate earlier termination can incorrectly escalate to operator halt.

**Required delta 2 — L33, G1(iv): make `tpB=1.16315` explicit for the 09-07 17:10 required row.**

The row test currently requires `reason=TP_TOUCH`, `exit=1.16315`, and an inequality such as `h>=tpB`. Since E2 makes `exitPrice=tpRef`, the intended equality is logically recoverable, but the grade should not rely on that implication.

Require explicitly:

`tpB == 1.16315` and `LONG h >= tpB`

for that required row, with the admission identity established first.

**Minor precision — L33, G1(iii):**

“the six early prices do not recur as TP_TOUCH exits” is too broad because the same paragraph explicitly permits a recurrence when that number is the trade’s own booked TP.

The precise rule is:

> no TP_TOUCH exit may use one of the six early prices **unless that price is the booked TP for that admission**; such a coincidence is annotated.

**Minor precision — L33/L40: `sup` terminology.**

The actual code at EA `L11097-L11102` increments `g_n1_tpRecomputeSupp` whenever:

`tpRecomputeTouch && !tpBookedTouch`

It does **not** require `vSL=0`, `vBREAK=none`, or `vHTF=0`.

The packet correctly says the six-case proof must impose those no-concurrent-exit conditions, but the variable/comment:

> `suppressed recompute touches`

can be read as though `sup` itself counts actual suppressed exits.

It does not. It counts recompute-touch/booked-touch divergence evaluations, including evaluations where some other exit predicate may also be true.

The clean wording is:

> `sup` is a cumulative count of evaluations satisfying `tpRecomputeTouch && !tpBookedTouch`; it is corroborative only and is never itself an event/suppression count.

That matches the code exactly.

**Minor wording issue — L33, G1(i):**

“proves booked-TP touch basis from EXITVERDICT” followed by “independently from its EXITVERDICT” is internally awkward. The intended distinction is plainly that the proof must be based on the **price relation** (`h/l` versus `tpB`), not merely the `vTP` boolean.

That should say “independent of the `vTP` flag” rather than “independently from its EXITVERDICT.”

### G2 — AMEND

**L34, G2: internal wording contradiction.**

It says:

> “seven upstream families row-identical with no exception”

and immediately provides a **LOTDIAG carve-out**.

“No exception” therefore cannot literally be true.

There is also tension between “MTLIFE exit-path-only” and the broader “row-identical” phrasing, because E2 intentionally changes the logged `exitPrice` on TP exits at EA `L11195` from `curTp` to `tpRef`.

This does not indicate a code defect. It is a contract-language defect.

**Suggested grading wording:** distinguish **row identity / lifecycle semantics** from **intentionally changed fields**. For example, say that replacement semantics remain row-identical across the defined upstream families, subject to the explicitly named LOTDIAG carve-out and the intentional TP exit-price/log changes.

### G3 — PASS with one documentation caveat

**L35, G3 is logically coherent.**

The shared-field cross-run comparison correctly excludes the new `tpB/h/l/sup` payload, while retaining `vTP` as a behaviorally meaningful shared field. The bar-time pairing is also coherent **under the stated single-active-trade / once-per-closed-bar premise**.

The packet explicitly identifies that premise through the stated OnTick ordering and sole-call claim (`L6607`, `L11229`). Under your verification split, I treat that as the stated disk-established premise rather than attempting to re-prove it here.

### G4 — PASS

The scope is clean:

* one build;
* exact-diff gate;
* stated +13 budget;
* E1/E2/E4 only;
* one tester run;
* 90-minute ceiling;
* alert-only;
* no commit without token.

Nothing in the page authorizes a live trade or funded-money action.

---

## Analytic A — all defects / gaps / imprecisions I see

**1. L33 G1(iv): termination-fallback list is incomplete.**
The concrete inconsistency is SESSION_LIMIT in G2 versus its omission from the predicted-collision absence escape.

**2. L33 G1(ii): required 17:10 row should explicitly require `tpB=1.16315`.**
The intended value is inferable from E2, but deterministic grading is cleaner when the row itself carries the exact booked target being asserted.

**3. L33 G1(iii): “do not recur” overstates the rule.**
Coincidental booked-price recurrence is expressly allowed.

**4. L33/L40 plus EA L11097-L11102: `sup` name/description is broader in code than “suppressed exit” language suggests.**
The packet already partially recognizes this, but the normative definition should be one exact Boolean predicate.

**5. L33 G1(i): “independently from its EXITVERDICT” is ambiguous.**
The intended independence is from the `vTP` verdict flag, not from the `EXITVERDICT` row as an evidence source.

**6. L34 G2: “no exception” conflicts with the explicit LOTDIAG carve-out.**

**7. L34 G2: “row-identical” needs qualification because E2 deliberately changes TP-exit price fields.**
Lifecycle/replacement identity is the invariant, not byte-for-byte identity of every emitted field.

**8. L20 / EA L11176-L11187: the packet explains the new EXITVERDICT payload but does not itself present an exhaustive use-site proof that changing `g_mtrade.exitPrice` at EA L11195 has no other behavioral consumers.**
That is an evidence-completeness gap on the page, not evidence of an actual hidden consumer. Given your stated disk-verification split, I would not halt on it, but it is the one material semantic-use-site dependency that the page leaves implicit.

**9. L33 G1(iv): the “absence of predicted MTCOLLISION” fallback should be phrased as an exhaustive lifecycle condition, not a partial reason list.**
That avoids the same problem recurring when another legitimate terminal reason is added later.

I do **not** see a defect in the core E1/E2 mechanics shown: `tpRef` is latched once at admission (`L10062`), cleared only by `MtReset` (`L285`), read by MTLIFE (`L10979`), and E2 now reports that booked value at `L11195`. The booked-touch predicate itself is separated cleanly from the recompute-touch predicate at `L11097-L11102`.

## Analytic B — better mechanism for the stated goal

A cleaner future mechanism would make the **per-evaluation suppression condition explicit**, rather than requiring the grader to reconstruct it from `curTp`, `tpB`, `h`, `l`, and the other verdict fields.

At the exit-verdict site around **EA L11176-L11187**, derive a strict instantaneous flag after all exit predicates are known:

`tpRecomputeOnly = tpRecomputeTouch && !tpBookedTouch && !vSL && !vBREAK && !vHTF`

Then log that Boolean directly, while retaining `sup` only as optional cumulative corroboration. The touch calculations remain at **EA L11097-L11102**; the diagnostic counter anchor is **EA L1054-L1055**.

That would make each six-case grade directly observable and eliminate most of the current admission/bar/absence inference burden without changing the exit behavior itself.

**Key:** none volunteered.

## Luna-V213 (ACCEPT, no key, v213 transport, pasted 2026-09-21, whole)

## Verdict: ACCEPT

**PACKET_P-EXITGATE-1 v3.8 is clear by name for exactly one build plus exactly one tester run under the stated RECON50 envelope.**

This is a **content verdict only**. It does not itself build, run, commit, or authorize spending. Your standing execution conditions remain: **dual-key clear + his run word + token; no commit without token**.

**Volunteered key:** none.

### G1 — ACCEPT

**Packet L33.**

The v3.8 G1 rule is internally coherent with the supplied E1/E2/E4 design:

* **EA L11097-L11102:** TP eligibility is now `tpBookedTouch` against `g_mtrade.tpRef`; the recompute-touch path is separately observable.
* **EA L11194-L11197 / packet L23:** TP exits record `g_mtrade.tpRef`, so the logged TP exit price is the booked target.
* **EA L11176-L11187 / packet L35:** `tpB`, `h`, `l`, and cumulative `sup` are exposed on each EXITVERDICT row.
* The packet correctly makes **`h/l` versus `tpB` the touch proof**, not `exit==booked`.
* The required **2026-09-07 17:10** row is grounded by the supplied RECON50 records: EXITVERDICT `curTp=1.16315`, MTEXIT `exit=1.16315`, and the 16:45 MTLIFE booked `tp=1.16315`.
* The six-case suppression proof is no longer resting on `sup` alone; it requires per-case EXITVERDICT evidence plus no-concurrent-exit and lifecycle attribution.
* The replacement-bar exception is properly handled: the **replacing admission** owns the evaluation duty, not the prior replaced trade.
* The `sup` rail floors and the exhaustive collision-fallback treatment are explicit rather than silent-pass rules.

I see **no remaining G1 defect that warrants withholding this single-run clearance**.

### G2 — ACCEPT

**Packet L34.**

The replace semantics are sufficiently specified:

* SIGNAL / TP_ELECT / SIDE1X / SIDE1E / STOPRESOLVE / SEEDDIAG / SESSION_LIMIT are treated as admission-side identities.
* **EA L10038-L10053** explicitly replaces rather than blocks.
* The packet correctly separates **SESSION_LIMIT at EA L7691** from trade termination and ties that boundary to the ST_IDLE admission gate.
* LOTDIAG is isolated as the permitted downstream cascade effect.
* MTLIFE is correctly treated as exit-path output rather than an admission-side identity.
* Unnamed row-kind divergence defaults to halt, which prevents an implicit “known exception” from swallowing an unexplained change.

No G2 condition is presently under-specified enough to block the one run.

### G3 — ACCEPT

**Packet L35.**

The instrumentation contract is complete enough for this run:

* EXITVERDICT is per evaluation, at most once per closed bar under the supplied **EA L11229 / `s_lastBarTime`** premise.
* The new `tpB/h/l/sup` payload is explicitly exempt from the cross-run shared-field diff.
* The vTP `0→1` conversion is attributed to the booked-touch categories instead of being left unattributed.
* No new alert kind is introduced.

The remaining pairing weakness noted below is real, but the current single-trade / once-per-bar / replacement lifecycle makes the run-grade reconstructible.

### G4 — ACCEPT

**Packet L36.**

The build gate is sufficiently constrained:

* **exact-diff allowlist primary; line budget secondary**
* `11235 + 13 = 11248`
* E1 +11, E4 declaration +2, E2 +0, E4 log +0
* the withdrawn `+14 / 11249` figure is explicitly retired
* 0 errors / 0 warnings is the stated build criterion
* commit remains token-gated

No G4 clearance defect remains on the page.

---

# Analytic A — defects, gaps, or imprecisions

I see **four non-blocking issues**. None changes the present ACCEPT.

### 1. G3 pairing key is weaker than G1's own case key

**Packet L33 vs L35.**

L33 says the case key is **admission identity + evaluation bar + direction**.

L35 then says cross-run EXITVERDICT pairing is **`barTime` alone**.

Those are not the same abstraction. `barTime` alone is sufficient only because the packet also relies on the stronger current premises: one active trade, one EXITVERDICT per bar, identical admission semantics, and replacement attribution elsewhere.

That is acceptable for this run, but it is a genuine robustness gap.

**Better wording:** make the operative pairing key **admission identity + barTime + direction**, while allowing barTime-only physical row pairing only as the first join step.

### 2. “Deterministic” is too strong for the 17:10 requirement

**Packet L33.**

The packet calls the 2026-09-07 17:10 row “deterministic,” but the row is still a **grade-time measured outcome in the new run**. What is deterministic is the logic-derived expectation conditional on identical inputs, admission identity, and unchanged upstream behavior.

The packet elsewhere correctly calls the broader six/one set a prediction, so this is terminology, not a substantive grading defect.

**Better wording:** “required predicted row under identical upstream/admission conditions.”

### 3. LOTDIAG is described as one of the “two qualifications” to the seven-family identical set

**Packet L34.**

That is slightly structurally awkward. The seven-family set excludes LOTDIAG, while qualification 1 is expressly about LOTDIAG.

It would read more precisely as:

> “exactly two named exceptions to the overall row-identity expectation: LOTDIAG cascade divergence, and intentional E2/E4 payload changes.”

Again, wording only.

### 4. EXITVERDICT admission identity is normative but not directly carried in the shown payload

**Packet L33/L35; EA L11176-L11187.**

The packet requires admission-keyed evidence, but the shown EXITVERDICT payload itself carries:

`bar, dir, entry, curTp, vSL, vTP, vBREAK, vHTF, scope, htfH/M/L, want, anti, tpB, h, l, sup`

It does **not** directly carry `signalBarTime`, `fillBarTime`, or another stable admission identifier.

Under the stated single-trade lifecycle, the admission can be reconstructed from the surrounding admission/replacement/MTLIFE record. So this is **not a blocker here**. But it is the weakest point in the current forensic design because the normative case key is stronger than the row's own explicit identity fields.

---

# Analytic B — better mechanism

The strongest improvement for the stated goal is the one already parked for a future packet:

### Per-evaluation instantaneous suppression flag

Instead of making the cumulative `sup` counter do double duty as the only compact diagnostic rail, retain the counter but also materialize the actual per-evaluation predicate:

```cpp
bool tpRecomputeOnly = (tpRecomputeTouch && !tpBookedTouch);
if(tpRecomputeOnly) g_n1_tpRecomputeSupp++;
```

Then emit `tpOnly=%d` in EXITVERDICT.

**Code touched:**

* **EA L11097-L11102** — define `tpRecomputeOnly` directly from the two predicates.
* **EA L11176-L11187** — log `tpOnly` alongside `tpB/h/l/sup`.

That would make the suppression event itself row-local and immediately attributable, instead of deriving it from a cumulative counter plus reconstruction. The existing `sup` could remain as a corroborative cumulative rail.

A second, stronger forensic improvement would be to add an explicit admission identifier (`fillBarTime` or `signalBarTime`) to EXITVERDICT at **EA L11176-L11187**, but that is a larger instrumentation change and is appropriately deferred for a future packet rather than folded into v3.8.

## Final disposition

**ACCEPT — v3.8.**

**G1:** clear.
**G2:** clear.
**G3:** clear.
**G4:** clear.

**No volunteered key.** The only findings are the four non-blocking precision/forensic-strength issues above; none requires an amend before the single build + single RECON51 run.

## Luna-V213-NUDGE1 (ACCEPT restated, no key, nudge reply, pasted 2026-09-21, whole)

Agreed. The record establishes that the key was **invited, not required**, and Luna's explicit answer was **“No volunteered key.”**

So there is no prompt defect or missing-input defect here. The v213 verdict remains:

**ACCEPT — PACKET_P-EXITGATE-1 v3.8.**

No key was volunteered, and I would not infer, manufacture, or treat one as owed. Any later key would have to be volunteered by the seat, or the key rule would have to be changed separately by the operator's process.

## Luna-V214 (AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

**AMEND-WITH-DELTA — PACKET_P-EXITMODEL-2 v1 is not clear exactly as written.** The scope and the requested one-build/one-run envelope are otherwise coherent, but there is one concrete control-flow defect plus several audit-language gaps that should be folded before clearance.

### Blocking delta

**1. F2's "one-line re-enable restores the spec default" is not true under the F3 code as written.**

Relevant lines: **P30, P32; EA L11030-L11032, L11165-L11187, L11202-L11210.**

The F3 arm is gated by:

```text
!vSL && !vTP && !vBREAK && g_news_init ...
```

It does **not** test `!vHTF`. The final priority is:

```text
SL -> TP -> BREAK -> DAY_CLOSE -> HTF
```

Therefore, if `MT_HTF_EXIT` is changed back to `true` and an HTF flip and the day-close mark occur on the same evaluated bar, both verdicts can be true, and **DAY_CLOSE wins over HTF_FLIP**. That is not the prior HTF priority.

There is a second, narrower wording issue in the same place: re-enabling `MT_HTF_EXIT=true` still leaves the new F3 DAY_CLOSE leg in the program, so it cannot literally restore the pre-packet behavior for mean-reversal-bearing trades.

**Minimal delta:** make the F3 verdict gate explicitly exclude an already-fired HTF verdict:

```text
&& !vHTF
```

and change the P30 wording from "one-line re-enable restores the spec default" to wording that says it restores the **HTF flip leg**, not the entire pre-packet behavior.

**For literal full rollback of pre-packet behavior**, the stronger mechanism would be to make the new DAY_CLOSE experiment conditional on the no-flip experiment being active, e.g. conceptually `!MT_HTF_EXIT && ...`. That is cleaner if "re-enable" is intended as a true behavioral rollback rather than merely restoring HTF exits.

### Analytic A — defects / gaps / imprecisions

**2. Fill-time precision is underspecified.**
Relevant: **P17, P32; EA L10330-L10342 and the F3 comparison using `g_mtrade.fillBarTime`.**

The rule is stated as "the first 16:55 mark at/after the fill," but the implementation compares `fillBarTime` to the mark. The page does not establish that `fillBarTime` is the **actual fill timestamp** rather than the opening timestamp of the fill bar.

That matters at the exact boundary: a fill occurring during the 16:55–17:00 M5 bar after 16:55 would still satisfy `fillBarTime <= 16:55` if `fillBarTime` is merely the bar-open time.

This is a **specification gap**, not necessarily a demonstrated code defect. The acceptance section should either state the bar-open-fill invariant explicitly or add one boundary case proving "fill after 16:55 does not consume that day's mark."

**3. G2's exemptions are broader than its attribution rule.**
Relevant: **P41, P47.**

`TP_ELECT`, `TPCENSUS`, and `LOTDIAG-signal-lots` are exempted where the winner changes, and TP_RR_FAIL attribution is mentioned, but the page does not define a complete orphan-check for those exempt rows.

For auditability, the exemption should be keyed explicitly by something like **admission + bar + direction**, with the changed booked target / winner and any TP_RR_FAIL transition attached. Otherwise a changed row can technically fall inside an exempt family without proving that its change came from F1.

Your later sentence "attributed bar-for-bar, never hidden" gives the intended standard, but the operative G2 wording should make the join requirement explicit.

**4. G1's F3 budget wording is imprecise.**
Relevant: **P40 versus P32.**

P40 calls the new evaluation a "9-line eval," while the literal F3 block presented in P32 is more than nine physical source lines once continuation lines/braces are counted.

Because P40 says exact-diff is primary and budget is secondary, this is not a behavioral blocker. It is an audit-counting ambiguity. Define whether the budget counts logical statements, non-comment lines, or physical diff lines.

**5. P30's rollback wording conflates the F2 toggle with the whole packet state.**
Relevant: **P30, plus F3 in P32.**

As written, "one-line re-enable (true) restores the spec default" sounds stronger than what the combined edit set actually does. Even after the minimal `!vHTF` delta, F3 remains installed. The wording should distinguish:

* restoring the HTF-flip experiment's default setting; versus
* restoring the entire pre-P-EXITMODEL execution model.

The current text supports only the first interpretation.

### Analytic B — better mechanism

For the stated goal, the cleaner mechanism is to make the experiment controls **orthogonal and self-contained** rather than relying on comments to describe a rollback:

**F2:** `MT_HTF_EXIT` controls only whether the HTF verdict is produced.
**F3:** a separate compile-time experiment condition controls whether DAY_CLOSE is eligible.
**Priority:** retain one explicit verdict order and make mutually competing verdicts deterministic.

That would touch **EA L129-L132, L11030-L11032, L11165-L11187, and L11202-L11210**. It also makes the "turn F2 back on" operation unambiguous: changing one toggle changes only F2, rather than implying that F3 disappears.

### What otherwise checks out on the page

The F1 replacement is logically consistent with the stated "nearest regardless of family" rule: the old POI-first/fallback branch is removed and both candidate pools feed the same `TpTargetUpdateBest` reduction at **P28 / EA L2321-L2359**.

The F3 mark definition is also internally consistent with the supplied 16:55 ET definition at **EA L10330-L10342**, and the stated `fillBarTime <= mark <= barTime` condition does select the earliest qualifying mark because the marks are traversed in order.

The proposed exit precedence is explicit at **P32 / EA L11030-L11032 and L11202-L11210**, and the new enum/name pairing at **P32 / EA L151-L161 and L259-L272** is internally consistent.

### Verdict

**AMEND-WITH-DELTA.**

The required delta is:

1. **Fix F3's interaction with `vHTF`** so re-enabling HTF cannot be silently overridden by DAY_CLOSE.
2. **Tighten the P30 rollback wording.**
3. Preferably make the **fill-time boundary invariant** explicit and make the **G2 exemption join** formally keyed.

After those amendments, the requested scope remains suitable for **exactly one build plus one tester run under the stated envelope**, with G1-G4 used exactly as the acceptance rail and no execution implied by the review text itself.

**Volunteered key:** none. I am not supplying or inventing a key; keys remain with the designated key seat.

## Luna-V215 (AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

## Verdict: AMEND-WITH-DELTA

I would **not clear PACKET_P-EXITMODEL-2 v2 yet**. The code-change concept is mostly coherent, but the page has two material acceptance/attribution defects and two narrower specification imprecisions that should be corrected before the requested one-build/one-run clearance.

### Mandatory deltas

| # | Finding                                                                                                                                                 | Lines                                                                     | Why it matters                                                                                                                                                                                                                                        | Required delta                                                                                                                                                                                                                                                     |
| - | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 1 | **G2 only attributes later-admission changes to F1 exit reordering.**                                                                                   | P41; F2 P16; F3 P17/P32; EA L11165-L11210                                 | Turning HTF exits off can keep a trade open longer; DAY_CLOSE can close it earlier/differently. Either can alter later `SESSION_LIMIT`, lots, admission rows, and `MTLIFE` identities. Thus the stated "row-identical" downstream gate is incomplete. | Expand the attribution clause from **F1 exit-reorder** to **F1/F2/F3 exit-reorder**, with the same admission+bar+direction causal join. Explicitly allow the resulting `SESSION_LIMIT` / lot / admission differences when causally downstream of the changed exit. |
| 2 | **"TPCENSUS winner==booked proof on all admissions" is not mechanically guaranteed by the stated code.**                                                | P15, P22, P47(a); F1 EA L2321-L2359; `MtNearestTpTarget` EA L10913-L10950 | Admission booking says **anchor admitted**; the separately described recompute path says **anchor skipped**. Therefore an admission whose winning target is the admitted anchor cannot be proven by a recompute census that excludes the anchor.      | Either narrow the claim to non-anchor bookings plus a separate anchor-proof row, or add a booking-time census/result using the exact admission race. The latter is the cleaner mechanism if "all admissions" must remain literal.                                  |
| 3 | **DAY_CLOSE is called "day-close-minus-5," but the implemented event is actually first qualifying evaluation after the 16:55 mark, with `nextOpenPx`.** | P17; P32(c)-(f); EA L11204-L11210                                         | In an alert-only/closed-bar engine, the recorded exit-price reference is the next bar's open, not a 16:55 execution price. That may be intentional, but the acceptance wording currently conflates the mark with the evaluation/price reference.      | Define the semantic explicitly as: **"first closed-bar evaluation whose `barTime` qualifies the 16:55 mark; `exitPrice=nextOpenPx`."** Grade the run against that invariant, not an implied 16:55 execution.                                                       |
| 4 | **The 8/28 16:25 G3 prediction is conditional on the priority rules, but is written as unconditional.**                                                 | P42; priority in P32(g); EA L11202-L11210                                 | On a shared evaluated bar, `SL` beats `DAY_CLOSE`. So "16:25 BOTH → DAY_CLOSE … ahead of the 17:00 SL" is only possible if that SL is not a same-bar firing verdict in the new run.                                                                   | Change the prediction to **DAY_CLOSE only when no higher-priority verdict fires on the qualifying mark bar**. Do not alter the stated priority order.                                                                                                              |

### Analytic A — every defect, gap, or imprecision I see

**1. G2 causal coverage is incomplete.**
This is the clearest page defect. P41 says later admission changes are attributed where "an **F1 exit-reorder** changes a later admission." But P16 explicitly changes HTF exits, and P17/P32 adds a new exit leg. Both can change the time/state at which a later setup is admitted. This needs to be generalized to F1/F2/F3.

**2. `SESSION_LIMIT row-identical` is too absolute as presently written.**
That statement in P41 is inconsistent with the acknowledged downstream effects of holding or closing trades differently. It should be "row-identical except causally attributable downstream changes from F1/F2/F3 exit timing," with the existing zero-unpredicted-families rule preserved.

**3. The "all admissions" TPCENSUS proof is internally mismatched with the anchor treatment.**
P15 says admission booking has anchor admitted. P22 says `MtNearestTpTarget` remains anchor-skipped. Therefore the same function cannot establish a universal `winner==booked` proof for anchor wins. This is not a disk-truth issue; it follows directly from the stated mechanisms.

**4. The day-close terminology is more precise than the implementation actually is.**
The actual invariant is mark detection plus next-open price reference. Since this is alert-only, that distinction is especially important because `exitPrice` is explicitly a target/log figure, not a realized fill. P47 acknowledges that generally, but the F3 wording still reads like an actual 16:55 exit.

**5. G3 has one outcome statement that is over-specified relative to its own priority rule.**
P42 predicts the 8/28 16:25 BOTH trade reaches `DAY_CLOSE` "ahead of the 17:00 SL." P32 and L11202-L11210 say SL wins whenever both fire on the same evaluation. The acceptance text should therefore make DAY_CLOSE conditional on the higher-priority verdicts being false on that bar.

**6. The page does not explicitly prove that the POI side of the new F1 race independently enforces every named "swept/live" validity predicate.**
The new literal at EA L2321-L2359 directly shows the authority-rank check plus `ReadBuf1`, while P28 claims direction/in-zone/swept/live/tier-rank validity is retained. Direction/in-zone are plausibly inside `TpTargetUpdateBest`; the supplied F1 literal does not itself show a separate EA-26/EA-51 swept/live predicate for POI lines. This is a **verification gap in the page**, not enough by itself for a halt, provided the existing helper/buffer contract is already established elsewhere on disk.

**7. `EXITVERDICT` is no longer a complete "all verdicts" representation.**
P21 deliberately freezes the EXITVERDICT format while `vDAY` travels through `MTEXIT`/`MTLIFE`. That is internally consistent with the chosen delta, but it means any language elsewhere implying that EXITVERDICT itself captures every verdict is no longer literally true. The packet partly acknowledges this, so I regard it as an observability limitation rather than a blocker.

**8. The acceptance page mixes prediction and acceptance language.**
P42 is labeled "Exit deltas predicted," while P48 makes G1-G4 authoritative. That is acceptable only if predictions remain hypotheses and the run decides them. The 8/28 wording currently reads closer to an expected result than a conditional hypothesis, which is why item 4 above should be tightened.

### Analytic B — better mechanism for the stated goal

For the **nearest-booking proof**, the cleanest mechanism is a **booking-time census record emitted from the same unified race that sets `best/haveBest`**, rather than relying on `MtNearestTpTarget` later. That touches the F1 booking site around **EA L2321-L2359** and records, at admission, the winning source/line, target value, and tie-break source. Then `TPCENSUS` can remain unchanged as the **recompute** census at **EA L10913-L10950**, and the two measurements have unambiguous meanings:

`BOOKCENSUS = what was actually booked at admission`
`TPCENSUS = what the current nearest recomputation says later`

That also resolves the anchor-admitted/anchor-skipped mismatch without changing exit behavior.

For the **day-close leg**, a slightly cleaner implementation would resolve the first qualifying mark once and store its index/identity when the trade is admitted, then test only that mark during management. The current scan over up to 32 ascending marks is functionally workable, but a stored mark makes the "first mark at/after fill" invariant explicit and makes the join key for G3 simpler. This would touch the trade-state declaration/reset and the admission/evaluation sites around **EA L10038-L10053, L10062-L10066, L10330-L10355, and L11189-L11210**.

### G1-G4 disposition

**G1:** conditionally sound, but not yet clearable because the packet's exact-diff gate cannot be verified from chat, and the acceptance arithmetic should remain secondary to the literal diff as stated.

**G2:** **AMEND REQUIRED** because its causal attribution language omits F2/F3 downstream admission effects.

**G3:** conceptually coherent, but amend the 8/28 prediction to respect the stated priority and tighten the day-close timing semantics.

**G4:** sound as a goal, but the "TPCENSUS winner==booked on all admissions" evidence claim needs the anchor-proof correction above.

### Clearance/key

**No clearance token is warranted from this review.** The packet is **AMEND-WITH-DELTA**, so it should not proceed to the requested build/run on this verdict alone.

**Volunteered key: none.** No seat key appears in the supplied v215 material, and I would not invent or relay one.

## Luna-V216 (AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

## Verdict

**AMEND-WITH-DELTA — PACKET_P-EXITMODEL-2 v3 is not cleared as written.**

The packet is otherwise internally coherent, and I do **not** see a halt-level defect. One concrete code/page mismatch must be corrected before the requested one-build/one-run clearance can be issued.

### Required delta

**F3 priority implementation — P32(f), P32(g), and EA L11204-L11210 replacement site.**

The packet's priority header says:

> SL → TP_TOUCH → POI_BODY_BREAK → **HTF_FLIP** → DAY_CLOSE

and P17/P32 explicitly says HTF beats DAY_CLOSE on a shared bar.

But P32(f) specifies the assignment as:

```cpp
if(vSL)         ...
else if(vTP)    ...
else if(vBREAK) ...
else if(vDAY)   ...
else            { ... HTF ... }
```

So the literal assignment order is **DAY_CLOSE before HTF**, not HTF before DAY_CLOSE.

The current `!vHTF` guard in P32(d) makes `vDAY` and `vHTF` mutually exclusive, so this does **not currently create a different runtime result**. It is nevertheless an actual priority-contract inconsistency: the implementation does not express the priority the header claims, and it would reverse the stated ordering immediately if that guard were ever widened or changed.

**Amend the chain to make the declared priority literal:**

```cpp
if(vSL)         { ... }
else if(vTP)    { ... }
else if(vBREAK) { ... }
else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP; g_mtrade.exitPrice = nextOpenPx; }
else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE; g_mtrade.exitPrice = nextOpenPx; }
```

That is the only code delta I regard as required for clearance.

---

## Analytic A — defects, gaps, and imprecisions

### 1. Priority-chain/header mismatch — **required**

**Packet P32(f)-(g); EA L11204-L11210.**

Described above. The guard currently masks the mismatch, but the page should not claim one literal priority while specifying another literal chain.

### 2. New enum value needs a broader consumer check than the packet explicitly states — **verification gap**

**Packet P32(a), P32(b), P36 S1; EA L151-L161 and L259-L272.**

Adding `MT_EXIT_DAY_CLOSE = 8` is safe in the shown enum/name switch, and P36 says there is no exit-reason-indexed `[8]` table. But "no `[8]` table" does not by itself exclude:

* loops assuming reasons are `0..7`,
* array bounds or counters keyed by the enum,
* other switches with an implicit/default assumption,
* numeric comparisons against the old maximum.

That is a **coverage gap in the stated S1 assertion**, not evidence that such code exists. A stronger S1 statement would be an exhaustive consumer audit of `ENUM_MT_EXIT`, not just the table check.

### 3. P15 wording over-bundles the validity filters — **non-blocking imprecision**

**Packet P15 and P28.**

P15 reads as though all four filters apply uniformly to both pools:

> direction, in-zone guard, swept/live mask, tier-rank filter

P28 later makes the intended scope precise: **swept/live applies to session/PD candidates only**, while POI uses direction/in-zone/tier-rank.

That should be stated directly in P15 so the rule does not momentarily imply a broader POI mask than the code actually applies.

### 4. DAY_CLOSE observability is intentionally incomplete — **disclosed gap, not a clearance blocker**

**Packet P21, P32(d), P42-P47.**

The packet explicitly freezes `EXITVERDICT`, so `vDAY` is carried through `MTEXIT/MTLIFE` while the EXITVERDICT rail is not exhaustive for DAY_CLOSE.

That is internally acknowledged and therefore not a hidden defect. It does, however, mean the run's DAY_CLOSE proof depends on the stated **mark-join grading** rather than a single exhaustive verdict record. Your packet already says that; I would retain that limitation exactly as a known observability property.

### 5. The "day-close-minus-5" name can be read as an execution-time claim — **semantic imprecision**

**Packet P17, P32(d)/(f), P47.**

The trigger is the first closed-bar evaluation whose `barTime` is at/after the 16:55 mark, but the recorded `exitPrice` is `nextOpenPx`.

The packet does expressly say this is **not** an implied 16:55 execution, which resolves the implementation semantics. The only remaining issue is naming: "day-close-minus-5 exit" sounds like an execution at 16:55, whereas the supplied mechanism is "16:55 trigger, next-open target/log price."

Not a blocker, but the wording should remain explicit in any downstream report.

### 6. G2's attribution rule is sophisticated but has a broad downstream carve-out — **grading precision gap**

**Packet P41.**

The packet permits downstream `SESSION_LIMIT`, lots, admissions, and exit timing differences when attributable to F1/F2/F3 reorder.

That is reasonable, but the hard boundary is somewhat procedural rather than exhaustive: "attributed-by-design exactly where" depends on the stated join key and attached transition evidence.

The strongest formulation is already close to what you have: **same admission + bar + direction + changed target/winner + TP_RR_FAIL transition**, or a demonstrable later-admission causal chain from an F1/F2/F3 exit reorder. Anything outside that should remain unpredicted and therefore fail G2.

---

## Analytic B — better mechanism

The best small improvement is to make the F3 priority decision **structurally explicit** rather than relying on the `!vHTF` exclusion to enforce the header.

**Touch:** EA **L11204-L11210** only for the immediate priority fix.

A cleaner longer-term mechanism would be a small helper around the new day-close test, conceptually:

```cpp
bool FindFirstDayCloseMark(datetime fillBarTime,
                           datetime barTime,
                           datetime &mark)
```

**Touch:** the F3 evaluation block around **EA L11188**, using the existing `g_news_dayMarks` built at **L10330-L10355**.

That would centralize the "first qualifying mark" predicate and make the mark itself available for future census/verdict instrumentation without changing the booking or exit-state semantics. I would **not** add that helper to this clearance unless the operator elects to reopen the scope; the current scan is adequate for the stated goal.

---

## G1-G4 grading

With the single priority-chain amendment above:

**G1:** Acceptable as specified. The arithmetic is consistent: F1 `-24`, F3 `+13`, F2 `0`, yielding **11237 physical non-blank lines**, assuming the quoted exact-diff set is what lands.

**G2:** Acceptable as specified, with the attribution boundary in P41 enforced literally. TP-derived changes and downstream reorder effects are appropriately carved out; unpredicted families remain a hard gate.

**G3:** Acceptable as specified. The conditional DAY_CLOSE behavior, no-flip construction, 9/7 validity branches, 9/8 17:05 time boundary, and Friday next-open handling are internally consistent on the page.

**G4:** Acceptable as specified. The stated join is factual/mechanical rather than magnitude-based, and the deployment bar remains shut.

**F0-F3:** F0 is a record-only fold; F1/F2/F3 are within the declared scope. The sole amendment is the F3 literal priority chain.

### Clearance state

**AMEND-WITH-DELTA, not yet cleared for the build/run.**

After the one amendment, the requested envelope remains exactly one build plus one tester run, with the existing STAGE-1 exact-diff gate and no commit without the separate required token.

**Volunteered key: none.** I am not issuing a clearance token while the page contains the outstanding code-order mismatch.

## Luna-V217 (AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

**AMEND-WITH-DELTA — not cleared for the requested build/run yet.**

The proposed code edits are internally coherent enough for a single build/run after the packet wording and acceptance arithmetic are corrected. I see no page-level defect that requires a technical redesign or a halt, but I do see several concrete inconsistencies that should be amended first.

### Analytic A — defects, gaps, and imprecision

| Location                  | Finding                                                                                                                                                                                                                                                         |                       Severity | Required delta                                                                                                                                                                             |
| ------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -----------------------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **P17 / L17**             | F3 says priority is **"SL then booked-TP then BREAK then DAY_CLOSE then HTF"**. The operative F3 assignment in **P32 / L32** is `vHTF` **before** `vDAY`, and the new priority header explicitly says **HTF beats DAY_CLOSE** on shared bars.                   | Material wording contradiction | Change P17 to: **SL → TP → BREAK → HTF → DAY_CLOSE**. Keep P32 as the operative ordering.                                                                                                  |
| **P40 / L40**             | F3 line-budget arithmetic is off. The inserted `(d)` block quoted in **P32 / L32** is **10 physical non-blank lines**, not 9.                                                                                                                                   |     Concrete accounting defect | F3 is **+14**, not +13. Therefore predicted post-build count is **11238**, not 11237.                                                                                                      |
| **P41 / L41**             | G2 first declares `SESSION_LIMIT` row-identical to RECON51, but later explicitly allows `SESSION_LIMIT` variation downstream of an F1/F2/F3 exit reorder.                                                                                                       |             Internal ambiguity | State the intended rule once: `SESSION_LIMIT` is baseline-identical **except for demonstrable downstream causal changes from F1/F2/F3 exit reordering**.                                   |
| **P21 / L21 + P32 / L32** | The header says the census logs **"ALL verdicts"**, while P21 deliberately says `EXITVERDICT` is **not exhaustive for vDAY**.                                                                                                                                   |      Observability wording gap | Clarify that "ALL verdicts" refers to the MTEXIT/MTLIFE census path, not the frozen EXITVERDICT print.                                                                                     |
| **P42 / L42**             | "MTEXIT DAY_CLOSE rows exactly the mark-joined set" is understandable, but the authoritative grading artifact is not named at that sentence. P17 says MTEXIT/MTLIFE carry the reason, while EXITVERDICT does not.                                               |                          Minor | Name the authoritative join explicitly as **MTEXIT/MTLIFE reason=DAY_CLOSE**, with `fillBarTime <= mark <= exitBarTime`, and EXITVERDICT excluded from completeness grading for vDAY.      |
| **P32 / L32**             | F3's scan is described as selecting the first qualifying mark, but the correctness depends on the existing invariant that `g_news_dayMarks[]` is ascending. That invariant is asserted in S1, so the logic is sound, but the dependency should remain explicit. |                          Minor | No code change needed; retain the S1 ascending-mark assertion as a hard precondition.                                                                                                      |
| **P43 / L43**             | The 9/4 branch correctly allows "no DAY_CLOSE row" when a higher-priority exit happens, but the grading language could be read as expecting DAY_CLOSE unconditionally.                                                                                          |                          Minor | Phrase the target as **DAY_CLOSE when the mark is reached without an earlier-or-same higher-priority verdict; otherwise grade the actual higher-priority exit and record the divergence**. |

The **budget correction is the only arithmetic defect I can establish directly from the quoted page text**: `(d)` contains these ten nonblank physical lines: comment, `if`, two continuation conditions, opening brace, `for`, opening brace, inner `if`, inner close, outer close.

With the packet's own counts:

`F1 -24 + F2 0 + F3 +14 = -10`

so:

`11248 - 24 + 14 = 11238`

not 11237.

### Analytic B — better mechanism

The current F3 mechanism is valid, but I see a cleaner implementation that reduces per-bar scanning and makes the "first mark" semantics more explicit:

**Precompute/store the next eligible day-close mark at admission**, rather than rescanning `g_news_dayMarks[]` on every managed-trade evaluation.

Touch points would be:

* **EA L10066** — where `fillBarTime` is established at fill/admission.
* **EA L10330-L10355** — existing day-mark construction remains the source of truth.
* **EA L11188 onward** — replace the per-evaluation `for(dc...)` search with a single stored-mark comparison.
* The managed-trade state declaration/reset would also need one stored `dayCloseMark` field and reset path.

Semantically:

`nextDayCloseMark = first g_news_dayMarks[dc] >= fillBarTime`

then the runtime test becomes essentially:

`dayCloseMark != 0 && dayCloseMark <= barTime`

That makes "first mark at/after fill" a stored invariant rather than a repeatedly recomputed search. It does **not** change the intended behavior; the current scan is already logically sound given the ascending-mark assertion. I would therefore treat this as an optional improvement, not a prerequisite.

### Verdict

**AMEND-WITH-DELTA**

The required amendments are limited to the packet:

1. **P17 / L17:** correct the stated priority to **SL → TP → BREAK → HTF → DAY_CLOSE**.
2. **P40 / L40:** correct **F3 +13 → +14** and **predicted post-build 11237 → 11238**.
3. **P41 / L41:** reconcile the `SESSION_LIMIT` identity statement with the explicitly permitted downstream causal deltas.
4. **P21/P32 / L21-L32:** clarify that EXITVERDICT is intentionally non-exhaustive for vDAY while MTEXIT/MTLIFE remain the DAY_CLOSE grading rail.

After those deltas, **the page supports one build plus one run under the stated RECON51 envelope, subject to the packet's existing STAGE-1 exact-diff gate and the standing dual-key/run-word/token requirements.**

**Volunteered key:** none. I am not inventing or substituting a key/token.

## Luna-V219 (AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

**Verdict: AMEND-WITH-DELTA.**
As written, I would **not issue the clear for the one-build/one-run envelope yet**. The packet is structurally close, and I do **not** see a page-level reason to halt the experiment outright, but there are two material wording/acceptance defects that should be corrected before the exact-diff gate is treated as final.

### G1 — ACCEPT

**Packet P40 / EA L129-L132, L151-L161, L259-L272, L11030-L11032, L11087-L11090, L11165-L11210**

The arithmetic is internally consistent:

* F1: 39 → 15 physical nonblank lines = **−24**
* F2: 4 → 4 = **0**
* F3: **+12**
* 11248 − 24 + 12 = **11236**

The F3 delta arithmetic also reconciles: `(a)+1 + (b)+1 + (c)0 + (d)+8 + (e)0 + (f)+1 + (g)+1 = +12`.

The enum comma is syntactically correct, the `MT_EXIT_DAY_CLOSE=8` placement is coherent, and the return/assignment chain has no missing branch after the added explicit `vHTF` and `vDAY` arms.

**One G1 amendment:** P32 / EA L11030-L11032 contains stale scope text:

> `// (mean-reversion scope) ...`

That directly contradicts P17, P26, P40-P43, and the stated 2026-09-21 universal rule. This is comment-only, but it is still an exact-diff defect. It should read **`(universal scope)`** or omit the parenthetical.

### G2 — ACCEPT, with the standing operator veto preserved

**Packet P41**

The attribution framework is coherent: admission+bar+direction plus changed target/winner and TP_RR_FAIL transition, with the alternate later-admission causal-chain branch. It also correctly distinguishes booking-derived changes from otherwise identity-sensitive families.

I do **not** see a new logical contradiction in the G2 rule itself.

The standing statement that **his veto on the G2 substance grade remains in force** must remain exactly that; this review does not override it.

### G3 — AMEND-WITH-DELTA

**Packet P42; packet P17; EA L10330-L10355 and L11165-L11210**

The core F3 mechanism is internally coherent:

`fillBarTime <= dayMark <= barTime`, ascending day marks, first qualifying mark, higher-priority verdicts suppressing DAY_CLOSE, and explicit `HTF` before `DAY_CLOSE` when F2 is re-enabled.

The defect is the **9/8 17:00 boundary wording**. P42 says:

> "9/8 17:00 MEANREV fill sits after the 9/8 mark so no same-date day-close, 17:05 BREAK preserved by time"

But elsewhere P17 says a fill on the **16:55 bar** carries `fillBarTime == mark` and therefore consumes that mark on first evaluation. Because J07's MTSNAP is stamped `bar=16:55`, the packet should make the actual fill-time invariant explicit: the 9/8 trade must have `fillBarTime = 17:00`, not 16:55, for the stated no-DAY_CLOSE conclusion to follow.

So this is a **page precision defect**, not a proven code defect. The clean delta is to state the exact invariant in P42/P43:

> the 16:55 MTSNAP produces a next-open fill at 17:00, hence `fillBarTime > 16:55 mark`; therefore that day's mark is ineligible.

That removes the only ambiguity in the stated 9/8 boundary prediction.

### G4 — AMEND-WITH-DELTA

**Packet P43**

The conditional structure is otherwise sound: it does not falsely require DAY_CLOSE when a higher-priority verdict legitimately wins.

But G4 inherits the same 9/8 timing ambiguity above, and its Friday wording should distinguish **exit bar timestamp** from **exit-price provenance** more explicitly. The packet says the Friday DAY_CLOSE row has `exitBarTime=mark bar` but `exitPrice=nextOpenPx`, while also calling that value a "next-session-open exitPrice." Those are not necessarily the same semantic object unless `nextOpenPx` is established to be the next available session bar rather than merely the immediately following bar.

So G4 should say **"target/log figure taken from `nextOpenPx`"** unless the disk-side definition of `nextOpenPx` explicitly proves next-session-open semantics.

---

## Analytic ask A — defects, gaps, and imprecisions

### 1. Stale scope label in the priority header

**P32 / EA L11030-L11032**

The header says **"mean-reversion scope"** while the operative rule is universal. This is an outright textual contradiction and should be corrected before S2.

### 2. 9/8 boundary needs the actual fill timestamp, not only the signal-bar timestamp

**P42 / P43; EA L10066 referenced by P17**

The prediction "no same-date DAY_CLOSE" depends on `fillBarTime > 16:55`, while the visible J07 row only shows `MTSNAP bar=16:55`. The packet should pin the fill-time relationship explicitly rather than making the reader reconstruct it.

### 3. Friday `nextOpenPx` terminology is potentially stronger than the shown evidence

**P17, P42, P43; F3 assignment at EA L11204-L11210**

The code literal is `nextOpenPx`. Calling it "next-session-open" is stronger than calling it the next-open target/log figure. The packet already says this is **not** an implied execution, so the wording should stay equally precise about what the value actually is.

### 4. F0 v217 provenance is duplicated

**P26**

The **entire "v217 verdicts ... folded here as v5 deltas" paragraph appears twice**. That does not change code bytes, but it weakens record-fold precision and creates a risk of double-counting provenance. One copy should be removed.

### 5. "Nearest valid target" is deliberately based on asymmetric validity filters

**P15 / P28**

The unified race is real, but "valid" does not mean identical filtering across the two candidate families: swept/live filtering applies to session/PD but not POI. That is explicitly intentional, so I do **not** treat it as a logic defect; it is just an important semantic qualification that the word "valid" alone can obscure.

### 6. TPCENSUS evidence needs to expose POI participation sufficiently to prove the new race

**P15 / P28 / P47; J08-J10**

The packet says TPCENSUS already walks both pools, but the shown J08-J10 examples display session/PD contenders and the selected winner without visibly enumerating POI contenders. For the claimed **winner==booked** proof on the new unified pool, the result file should make POI participation observable when a POI candidate is relevant. Otherwise the proof is technically asserted rather than visibly demonstrated in the packet's evidence shape.

### 7. G2's strongest causal rule is good, but it must remain a causal rule rather than a blanket exemption

**P41**

The "later-admission causal chain" branch is necessarily evidentiary. The packet is correct to say "demonstrable"; it should not be relaxed into "anything downstream of this build is attributed." No change required, but this is the line I would hold hardest during grading.

---

## Analytic ask B — better mechanism

The cleaner mechanism for F3 is the **stored-mark / precomputed deadline** approach already parked in the packet.

**Current mechanism:**
EA **L10330-L10355** builds the global ascending marks, then **L11168-L11187/L11188-L11210** rescans the entire mark array on every managed-trade evaluation.

**Better mechanism:** at fill time, resolve and store the first qualifying day-close mark for that trade, then make EvaluateManagedTrade a single timestamp comparison.

The code touch would be:

* **EA L10330-L10355:** retain the authoritative ET→server day-mark construction.
* **EA around L10062-L10066:** when `fillBarTime` is latched, resolve `nextDayCloseMark` once.
* **One new per-trade declaration:** `datetime dayCloseMark;` (or equivalent sentinel).
* **EA L11087-L11210:** replace the `for(dc...)` search with the direct `barTime >= dayCloseMark` test.

That mechanism makes the core invariant explicit, eliminates the repeated scan, and removes the exact ambiguity exposed by the 9/8 boundary. It is **not necessary to adopt it for this packet**; the current scan is logically serviceable once the timing language is pinned.

---

## Clearance disposition

**PACKET_P-EXITMODEL-2 v6: AMEND-WITH-DELTA, not HJ/HALT.**

The minimum deltas I would require before calling it clear are:

1. **P32 / EA L11030-L11032:** remove the stale "mean-reversion scope" wording.
2. **P42/P43:** explicitly pin the 9/8 fill to `fillBarTime=17:00 > 16:55 mark`, or otherwise state the exact invariant that produces the claimed boundary.
3. **P43/P42 Friday wording:** call `nextOpenPx` a target/log figure unless its next-session semantics are explicitly established.
4. **P26:** remove the duplicated v217 fold paragraph.

After those text-level amendments, the stated envelope remains **exactly one build plus one tester run**, with no commit and no spend absent the separately required dual-key clear, his run word, and token.

**Volunteered key:** none appears in the supplied packet.

## Luna-V223 (AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

**Verdict: AMEND-WITH-DELTA — not a halt. No clearance key volunteered.**

The packet is technically coherent enough that I do **not** see a page-level reason to reject the F1/F2/F3 mechanism outright. The remaining problems are acceptance-spec precision: two hard-gate areas are not fully closed on the page.

### Required amendments

**1. G2 does not enumerate its "seven-family identity."**
Line 58 says G2 is a "seven-family identity" and defines the treatment of TP/MTLIFE/SESSION_LIMIT deltas, but the seven baseline families themselves are not named in the v9 page. Because G2 is a **hard zero-unpredicted-families gate**, the reviewer needs the exact seven-family set frozen in the packet.

**Delta:** at line 58, enumerate the seven families exactly as used by RECON51, or give a precise frozen locator to their authoritative definition. No change to the substantive attribution rule.

**2. G2's "demonstrable later-admission causal chain" is still too discretionary.**
Line 58 permits an F1/F2/F3 exit reorder to explain later admissions, but "demonstrable causal chain" is not defined tightly enough to make the hard gate falsifiable. It does specify a changed MTEXIT/MTLIFE exit reason/time and a linked admission timestamp/bar/direction, which is good, but it should require the predecessor relation explicitly rather than leave the linkage standard implicit.

**Delta:** require the attribution record to contain the unique predecessor trade/admission identity, the changed exit row `(admission, exit bar/time, reason)`, the downstream released/blocked state transition, and the resulting changed admission `(bar/time, direction)`. Anything lacking that chain remains unpredicted and fails G2.

**3. G4 claims a broader graded set than it actually specifies.**
Line 60 says G4 takes "his 8/28, 9/4, 9/7 rows filled," but the explicit grading rules then define detailed outcomes for **9/4** and **9/7 09:20**. The 8/28-pm and 9/7-pm cases are discussed in G3, but G4 does not state what constitutes pass/fail/convergence treatment for them.

**Delta:** either:

* explicitly state the G4 grade for 8/28-pm and 9/7-pm, including the conditional "higher-priority exit suppresses DAY_CLOSE" case; or
* narrow the sentence "his 8/28, 9/4, 9/7 rows filled" so it does not imply a G4 acceptance criterion exists for rows that are only G3-graded.

### What is already internally sound

**F1:** The old POI-first/fallback structure is actually removed and replaced with a single session-then-POI race using the existing `TpTargetUpdateBest` reducer. The session pool remains eligible even when a POI candidate exists, so the stated "family/category disregarded; nearest valid target wins" behavior is represented by the edit itself.

The stated tie behavior is also internally consistent: session candidates are evaluated first, and the reducer's strict `<` means an exact cross-pool price tie retains the session candidate in the booked value. The packet simultaneously documents that TPCENSUS can name POI on an exact tie because of its later-equal overwrite. Since G2 explicitly grades the **booked value**, rather than requiring census-name equality, that divergence is accounted for rather than silently ignored.

**F2:** Setting `MT_HTF_EXIT` to `false` cleanly removes the HTF-flip leg while leaving F1 and F3 installed, and the packet correctly identifies the HTF emitter as sitting inside that branch.

**F3:** The new day-close reason, enum consumer, verdict variable, priority chain, day-mark scan, return gate, and assignment arm are mutually consistent. In particular, HTF remains ahead of DAY_CLOSE when re-enabled, while DAY_CLOSE is universal rather than regime-gated.

The fill/mark condition is also correctly formulated for the stated next-open model: `fillBarTime <= mark <= barTime`, so a fill after that day's 16:55 mark cannot consume that mark, whereas a fill on the mark's bar can. The packet explicitly pins the 9/8 17:00 fill as the post-mark case.

The EXITVERDICT non-exhaustiveness for DAY_CLOSE is not an accidental omission; the packet explicitly declares it a frozen-format substitution and moves completeness grading to MTEXIT/MTLIFE. That makes the observability choice explicit.

### Other defects / imprecisions

**Line 53 — S1 is very strong, but "seven-family identity" remains dependent on the unresolved G2 definition.** The exhaustive enum audit, `MT_HTF_EXIT` two-site audit, mark ordering, reducer tie behavior, single flip emitter, and once-per-bar call-cadence assertions are all appropriately specified.

**Line 59 — G3 is conditional in several places, correctly so, but the acceptance language should distinguish "predicted candidate" from "required occurrence."** The packet already does this for 9/7-pm and 8/28-pm; retaining that distinction is important because SL/TP/BREAK/HTF can suppress DAY_CLOSE by design.

**Line 60 — the 9/4 branch is appropriately split.** Absence of DAY_CLOSE is not automatically failure; it is valid when an earlier-or-same higher-priority verdict explains the suppression. That is correctly stated.

### Analytic ask B — better mechanism

I would **not change the mechanism** in this clearance. The F1 unified reducer is simpler than retaining family-selection state, and the F3 mark-join is materially easier to audit than introducing a stored per-trade mark or a new helper. The parked alternatives therefore need not be promoted into code for this probe. The packet already records those alternatives as parked and operator-vetoable.

One useful mechanical tightening would be to make the G2 causal-chain evidence schema explicit in the result table rather than touching EA logic.

### Bottom line

**AMEND-WITH-DELTA.** The F1/F2/F3 implementation specification itself is sufficiently formed for a controlled probe, but I would not issue the requested clearance yet because the packet's **G2 hard gate is not completely self-defining** and **G4 overstates its explicitly graded row set**. Those are specification amendments, not reasons to redesign or halt the experiment.

**Volunteered key:** none.

## Luna-V220 (AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

**Verdict: AMEND-WITH-DELTA.**
As written, I would **not issue the clear for the one-build/one-run envelope yet**. The packet is structurally close, and I do **not** see a page-level reason to halt the experiment outright, but there are two material wording/acceptance defects that should be corrected before the exact-diff gate is treated as final.

### Required amendments

**D1 — `g_news_init` failure is diagnosed but not made a hard acceptance failure.**
The packet explicitly allows a false-throughout run to produce zero `DAY_CLOSE` rows and says that this is merely "diagnosed at the flag."  But G3/G4 are then written conditionally around the missing row.

That permits an ambiguous result: no DAY_CLOSE evidence could mean "the higher-priority exit correctly suppressed it" or "the day-mark subsystem never initialized." Those are not equivalent.

**Amend:** make runtime `g_news_init == true`, `g_news_dayN == 16`, and valid ascending marks a hard precondition for G3/G4. Failure is **G3/G4 fail**, not diagnostic-only.

---

**D2 — The 9/4 "no DAY_CLOSE row" branch conflates valid suppression with missing instrumentation.**
P43 says that if no DAY_CLOSE row occurs on 9/4, the higher-priority exit can be accepted instead.  That is correct only when the mark subsystem demonstrably existed and a higher-priority verdict actually fired earlier-or-same bar.

**Amend:** split the branch explicitly:

`DAY_CLOSE absent + earlier/equal SL/TP/BREAK/HTF = valid suppression`

`DAY_CLOSE absent + no higher-priority reason = fail`

This is closely related to D1 but should be written separately because it affects grading logic.

---

**D3 — "closed-bar evaluation" is asserted, but the packet does not prove that `EvaluateManagedTrade` is actually invoked only on closed bars.**
The semantic statement is specifically "first closed-bar evaluation" / first evaluated bar whose `barTime` qualifies.  The F3 code itself only tests `fillBarTime <= mark <= barTime`.

If the engine can invoke `EvaluateManagedTrade` intrabar, the implementation could fire on the first tick of the 16:55 bar rather than at its closed-bar evaluation. I cannot infer the call cadence from this packet alone.

**Amend:** S1 must include an explicit call-site/bar-close assertion for `EvaluateManagedTrade`, or the packet must change the semantic claim from "closed-bar evaluation" to the engine's actual invocation semantics.

This is the most important technical gap after D1/D2.

---

**D4 — The Friday statement is factually imprecise.**
P42 says, "Both DAY_CLOSE dates are Fridays," while the same paragraph explicitly carries **9/7-pm** as a conditional DAY_CLOSE candidate. September 7, 2026 is Monday.

The likely intended statement is that the currently expected observed DAY_CLOSE rows at 8/28 and 9/4 are Friday rows, while 9/7-pm is a separate Monday conditional candidate.

**Amend the wording** so the acceptance record cannot be read as treating 9/7 as Friday.

---

**D5 — G2's "demonstrable later-admission causal chain" is underspecified.**
The canonical join is well defined, but the fallback causal-chain route is not.  A grader could reasonably disagree about what constitutes "demonstrable."

**Amend:** require a concrete predecessor chain, e.g. changed `MTEXIT/MTLIFE` exit reason/time → released/blocked downstream state → changed admission, with the linked admission timestamp/bar/direction recorded. Anything without that witness remains unpredicted and fails G2.

---

**D6 — The run-environment naming is ambiguous.**
The packet says the run is `RECON50_DEMO_USD` while simultaneously calling it "the RECON51 account."  The rest of the acceptance is explicitly benchmarked against RECON51.

This may be intentional environment nomenclature, but the acceptance record should remove the ambiguity.

**Amend:** require the result file to record the exact terminal/account identifier, mode, and benchmark designation, and require them to match the stated envelope.

---

### Other analytic imprecisions

**D7 — Tie-break proof could be made more explicit in S1.**
The claimed session-first tie outcome depends on two facts together: session loop occurs before POI loop, and `TpTargetUpdateBest` uses strict `<`. The packet asserts the latter at L2246 and describes the former in F1.

For a future exact-diff regression, I would make S1 assert both pieces explicitly rather than relying on the assembled text.

**D8 — The acceptance correctly excludes `EXITVERDICT` from DAY_CLOSE completeness, but this creates a real observability limitation.**
The packet openly acknowledges that the frozen EXITVERDICT path is no longer exhaustive for vDAY.  That is acceptable only because MTEXIT/MTLIFE are made the authoritative DAY_CLOSE rail. The grading text should state that this is a **mandatory observability substitution**, not merely an explanatory note.

**D9 — The F3 price semantics need one hard assertion, not just prose.**
The packet repeatedly says `nextOpenPx` is a target/log figure and not a realized fill.   That is clear, but a run-grade assertion of `DAY_CLOSE exitPrice == nextOpenPx` would make the intended semantics mechanically testable rather than inferential.

---

## Better mechanism

For the stated goal, I would **not** broaden the behavioral code. The current nearest-booking race and inline day-mark scan are simpler to exact-diff than introducing a helper or precomputed stored-mark state.

The one mechanism I would add is an explicit runtime **DAY_MARK readiness assertion** immediately around the existing F3 evaluation site: after initialization, prove `g_news_init`, `g_news_dayN`, ascending order, and the converted 16:55 marks before DAY_CLOSE grading. That touches the day-mark setup around **EA L10330-L10355** and the F3 insertion around **EA L11188-L11200**. The acceptance then becomes binary rather than interpretive.

A second useful proof-only addition is the call-cadence assertion around the `EvaluateManagedTrade` invocation, so the "closed-bar" semantic is established rather than assumed.

### Clearance state

Because D1-D3 can otherwise permit an ambiguous or falsely passing DAY_CLOSE result, I would **not clear v7 as written**. The core edit set does not warrant a halt; it warrants the above delta before the one-build/one-run clearance.

**Key:** no valid execution key/token is volunteered here. The packet says keys come only from the key seat, and no token is present in the supplied text.

So the actionable verdict is:

**AMEND-WITH-DELTA — fix D1/D2/D3 as required; clean up D4-D6 (with D7-D9 recommended). Then the packet is structurally in shape for the stated G1-G4 build/run gate.**

## Luna-V221 (AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

**Verdict: AMEND-WITH-DELTA.**
As written, I would **not issue the clear for the one-build/one-run envelope yet**. The packet is structurally close, and I do **not** see a page-level reason to halt the experiment outright, but there are two material wording/acceptance defects that should be corrected before the exact-diff gate is treated as final.

### Required amendments

**D1 — `g_news_init` failure is diagnosed but not made a hard acceptance failure.**
The packet explicitly allows a false-throughout run to produce zero `DAY_CLOSE` rows and says that this is merely "diagnosed at the flag."  But G3/G4 are then written conditionally around the missing row.

That permits an ambiguous result: no DAY_CLOSE evidence could mean "the higher-priority exit correctly suppressed it" or "the day-mark subsystem never initialized." Those are not equivalent.

**Amend:** make runtime `g_news_init == true`, `g_news_dayN == 16`, and valid ascending marks a hard precondition for G3/G4. Failure is **G3/G4 fail**, not diagnostic-only.

---

**D2 — The 9/4 "no DAY_CLOSE row" branch conflates valid suppression with missing instrumentation.**
P43 says that if no DAY_CLOSE row occurs on 9/4, the higher-priority exit can be accepted instead.  That is correct only when the mark subsystem demonstrably existed and a higher-priority verdict actually fired earlier-or-same bar.

**Amend:** split the branch explicitly:

`DAY_CLOSE absent + earlier/equal SL/TP/BREAK/HTF = valid suppression`

`DAY_CLOSE absent + no higher-priority reason = fail`

This is closely related to D1 but should be written separately because it affects grading logic.

---

**D3 — "closed-bar evaluation" is asserted, but the packet does not prove that `EvaluateManagedTrade` is actually invoked only on closed bars.**
The semantic statement is specifically "first closed-bar evaluation" / first evaluated bar whose `barTime` qualifies.  The F3 code itself only tests `fillBarTime <= mark <= barTime`.

If the engine can invoke `EvaluateManagedTrade` intrabar, the implementation could fire on the first tick of the 16:55 bar rather than at its closed-bar evaluation. I cannot infer the call cadence from this packet alone.

**Amend:** S1 must include an explicit call-site/bar-close assertion for `EvaluateManagedTrade`, or the packet must change the semantic claim from "closed-bar evaluation" to the engine's actual invocation semantics.

This is the most important technical gap after D1/D2.

---

**D4 — The Friday statement is factually imprecise.**
P42 says, "Both DAY_CLOSE dates are Fridays," while the same paragraph explicitly carries **9/7-pm** as a conditional DAY_CLOSE candidate. September 7, 2026 is Monday.

The likely intended statement is that the currently expected observed DAY_CLOSE rows at 8/28 and 9/4 are Friday rows, while 9/7-pm is a separate Monday conditional candidate.

**Amend the wording** so the acceptance record cannot be read as treating 9/7 as Friday.

---

**D5 — G2's "demonstrable later-admission causal chain" is underspecified.**
The canonical join is well defined, but the fallback causal-chain route is not.  A grader could reasonably disagree about what constitutes "demonstrable."

**Amend:** require a concrete predecessor chain, e.g. changed `MTEXIT/MTLIFE` exit reason/time → released/blocked downstream state → changed admission, with the linked admission timestamp/bar/direction recorded. Anything without that witness remains unpredicted and fails G2.

---

**D6 — The run-environment naming is ambiguous.**
The packet says the run is `RECON50_DEMO_USD` while simultaneously calling it "the RECON51 account."  The rest of the acceptance is explicitly benchmarked against RECON51.

This may be intentional environment nomenclature, but the acceptance record should remove the ambiguity.

**Amend:** require the result file to record the exact terminal/account identifier, mode, and benchmark designation, and require them to match the stated envelope.

---

### Other analytic imprecisions

**D7 — Tie-break proof could be made more explicit in S1.**
The claimed session-first tie outcome depends on two facts together: session loop occurs before POI loop, and `TpTargetUpdateBest` uses strict `<`. The packet asserts the latter at L2246 and describes the former in F1.

For a future exact-diff regression, I would make S1 assert both pieces explicitly rather than relying on the assembled text.

**D8 — The acceptance correctly excludes `EXITVERDICT` from DAY_CLOSE completeness, but this creates a real observability limitation.**
The packet openly acknowledges that the frozen EXITVERDICT path is no longer exhaustive for vDAY.  That is acceptable only because MTEXIT/MTLIFE are made the authoritative DAY_CLOSE rail. The grading text should state that this is a **mandatory observability substitution**, not merely an explanatory note.

**D9 — The F3 price semantics need one hard assertion, not just prose.**
The packet repeatedly says `nextOpenPx` is a target/log figure and not a realized fill.   That is clear, but a run-grade assertion of `DAY_CLOSE exitPrice == nextOpenPx` would make the intended semantics mechanically testable rather than inferential.

---

## Better mechanism

For the stated goal, I would **not** broaden the behavioral code. The current nearest-booking race and inline day-mark scan are simpler to exact-diff than introducing a helper or precomputed stored-mark state.

The one mechanism I would add is an explicit runtime **DAY_MARK readiness assertion** immediately around the existing F3 evaluation site: after initialization, prove `g_news_init`, `g_news_dayN`, ascending order, and the converted 16:55 marks before DAY_CLOSE grading. That touches the day-mark setup around **EA L10330-L10355** and the F3 insertion around **EA L11188-L11200**. The acceptance then becomes binary rather than interpretive.

A second useful proof-only addition is the call-cadence assertion around the `EvaluateManagedTrade` invocation, so the "closed-bar" semantic is established rather than assumed.

### Clearance state

Because D1-D3 can otherwise permit an ambiguous or falsely passing DAY_CLOSE result, I would **not clear v7 as written**. The core edit set does not warrant a halt; it warrants the above delta before the one-build/one-run clearance.

**Key:** no valid execution key/token is volunteered here. The packet says keys come only from the key seat, and no token is present in the supplied text.

So the actionable verdict is:

**AMEND-WITH-DELTA — fix D1/D2/D3 as required; clean up D4-D6 (with D7-D9 recommended). Then the packet is structurally in shape for the stated G1-G4 build/run gate.**

## Luna-V224 (v223 transport return, AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

## Verdict: **AMEND-WITH-DELTA**

I would **not clear the build/run on v10 as written**. The code concepts are largely internally coherent, but the packet contains one definite acceptance-arithmetic error plus several proof/scope imprecisions that should be corrected before the one build and one run.

### 1. Definite hard defect: F1 line-count arithmetic is wrong

The quoted F1-old block is **38 non-blank physical lines**, lines 70–107, not 39. The new F1 block is stated as 15 lines. Therefore:

* F1 delta = **38 → 15 = −23**
* F2 delta = **0**
* F3 delta = **+12**
* Net packet delta = **−11**
* Pre-build = **11,248**
* Correct predicted post-build = **11,237**

But P40 says `39 old to 15 new net -24` and predicts **11,236**; the later G-RULES line simultaneously says "`38-count corrected`" while still retaining **11,236**.

The underlying quoted block confirms the old span is lines 70–107 inclusive, with 38 non-blank lines.

**Required delta:** make every *current* v10 budget reference consistently:

> F1 38-to-15, net −23; F3 +12; F2 0; predicted post-build **11,237**.

That includes the current P32 cross-reference, P40, and the G-RULES mirror. Historical notes about earlier packets can remain historical.

---

### 2. S1 mixes a static pre-build assertion with a runtime condition

S1 is explicitly a **pre-hash, read-only, pre-write** stage, yet it says it asserts:

> `g_news_init true with dayN==16`

Those are runtime state conditions, not source-text properties. The packet itself later correctly calls them **runtime hard preconditions** for G3/G4.

So the clean separation should be:

**S1:** source-level proof that the initialization path constructs the day marks correctly and that the specified run envelope is expected to yield 16 marks.

**S5/G3:** runtime assertion that `g_news_init==true`, `dayN==16`, and marks are strictly ascending.

This is a packet wording/procedure amendment, not a code halt.

---

### 3. The `winner==booked` TPCENSUS proof is not fully canonical

F1 booking calls:

```text
TpTargetUpdateBest(v, dir, currentPrice, best, haveBest)
```

so its distance comparison is based on `currentPrice`.

But the cited TPCENSUS rows report a **bar close** as their comparison reference. For example, the 09:15 census row shows:

> `close=1.16134`

while the corresponding 09:15 admission has:

> `entry=1.16135`

That one-pip difference may or may not change the nearest candidate, but the packet currently treats TPCENSUS as an exact proof of booking equivalence without requiring the two reference prices to be identical or proving that candidate ordering is invariant.

This matters because G2 explicitly relies on `TPCENSUS winner==booked` as part of the attribution mechanism.

**Required delta:** narrow the proof rule. TPCENSUS may be an exact booking-proof witness only when either:

1. its reference price is the exact same admission reference used by F1, **or**
2. the result records an ordering-invariance proof showing that the reference-price difference cannot change the winner.

Otherwise it is diagnostic evidence, not a logically exact reconstruction of the booked target.

This is the biggest substantive proof gap after the arithmetic issue.

---

### 4. “Universal every managed trade” needs a close-path exhaustiveness assertion

F3 is described as universal across every managed trade, but the S1 audit described in P36 is primarily an **exit-reason consumer audit** and an invocation audit. It does not explicitly say that S1 exhaustively verifies all possible managed-trade close/state-transition paths outside `EvaluateManagedTrade`.

For the universal claim to be airtight, S1 should also assert one of these:

> `EvaluateManagedTrade` is the sole managed-trade closure path,

or exhaustively enumerate all alternative close/state writers and establish that none can bypass F3.

I am **not** declaring that such another path exists; the packet simply does not make the exclusivity proof explicit.

---

### 5. Header wording now conflicts slightly with the deliberate `EXITVERDICT` narrowing

The new header retains:

> “the census logs ALL verdicts”

while the packet explicitly says `EXITVERDICT` is intentionally **non-exhaustive for vDAY** and that DAY_CLOSE observability is carried through `MTEXIT/MTLIFE` instead.

Those statements can coexist only if “census” specifically means the terminal-exit census path rather than the `EXITVERDICT` print.

**Required delta:** make the comment precise, e.g. “MTEXIT/MTLIFE record terminal exit reasons for re-judging,” rather than the broader “census logs ALL verdicts.”

This is text-only.

---

### 6. Minor precision issue: “nearest valid target” should say “nearest admissible target”

F1 keeps pool-specific eligibility constraints:

* direction/in-zone,
* POI tier-rank,
* session/PD swept/live filtering,
* anchor participation.

So “nearest valid target across both pools” is operationally understandable, but the mathematically precise statement is **nearest among candidates surviving the stated pool-specific admission filters**.

That avoids any future argument that “nearest” means literally every raw POI/session value before filtering.

---

## Things I do **not** see as defects

The core F1 tie rule is explicit and coherent: session candidates are evaluated first, and the strict-less-than reducer preserves the first exact-price winner. The packet also explicitly records the resulting booking-vs-TPCENSUS tie-name divergence rather than silently treating the names as identical.

The F2 chain is internally coherent: setting `MT_HTF_EXIT` false kills the HTF leg while preserving F1/F3, and the packet correctly places DAY_CLOSE after HTF so that a future re-enable restores the stated rollback-path precedence.

The F3 mark condition itself is well specified: `fillBarTime <= mark <= barTime`, ascending marks, first qualifying mark, and no same-day consumption when the fill occurs after that day's 16:55 mark.

The 9/8 17:00 boundary treatment is also logically consistent with the stated fill-time invariant.

---

## Analytic A — defect/gap inventory

| Severity            | Location                            | Finding                                                                                                                                                     |
| ------------------- | ----------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Hard**            | L57, L233; source block L70–107     | F1 old count is 38, not 39; correct post-build count is **11,237**, not 11,236.                                                                             |
| **Hard-proof gap**  | L45, L58, L228–230                  | TPCENSUS uses a bar-close reference while booking uses `currentPrice`; exact `winner==booked` proof is not guaranteed without price equivalence/invariance. |
| **Process/wording** | L53                                 | Runtime `g_news_init/dayN` conditions are described as S1 pre-write assertions. Move actual checks to runtime.                                              |
| **Scope-proof gap** | L53 plus F3 universal claim L34/L49 | Universal closure claim should explicitly prove `EvaluateManagedTrade` is the sole managed-trade close path.                                                |
| **Wording**         | L38/L49                             | “census logs ALL verdicts” is too broad given the intentional non-exhaustive `EXITVERDICT` treatment for DAY_CLOSE.                                         |
| **Precision**       | L32/L45                             | “nearest valid” should preferably mean nearest candidate after the stated pool-specific filters.                                                            |

Nothing here requires a **halt**; the issues are amendable without changing the requested F1/F2/F3 design.

---

## Analytic B — better mechanism for the stated goal

The stronger architecture is a **single canonical TP-selection routine** rather than having booking and TPCENSUS independently recreate essentially the same race.

The clean version would centralize:

* candidate enumeration,
* session/POI eligibility,
* anchor admission,
* distance comparison,
* exact tie policy,
* candidate source/name.

Then have both the booking path and census call that selector with an explicit reference price.

The relevant code regions are:

* `ComputeNearestTpTarget` **EA L2275–L2359**
* `TPCENSUS` **EA L2369–L2427**
* recompute `MtNearestTpTarget` **EA L10913–L10950**

That would make the G2 `winner==booked` proof structural instead of inferential, and it would also eliminate the current booking-vs-census reference-price ambiguity. I would keep that as a **parked architectural improvement**, not silently expand v10 to include it.

---

### Final ruling

**AMEND-WITH-DELTA.**

The minimum amendment set is:

1. Correct all current v10 budget arithmetic to **11,237**.
2. Separate S1 source assertions from S5/G3 runtime assertions.
3. Repair or narrow the TPCENSUS `winner==booked` proof so its reference price is canonical or ordering invariance is explicitly demonstrated.
4. Add an explicit exhaustive close-path/sole-closure assertion for the “universal” F3 claim.
5. Tighten the “ALL verdicts” header wording.

**Build clearance: not issued on v223.
Run clearance: not issued.
Volunteered key: none on this amend verdict.**

## Luna-V225 (v224 transport return, AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

**AMEND-WITH-DELTA**

I would **not clear v224 for the build/run yet**. The packet is substantially specified, but several page-level ambiguities affect what the single run is supposed to prove. This is a packet-rule verdict only; I am not independently verifying the disk digests, logs, or build claims, consistent with the packet's verification split.

### G1 — AMEND-WITH-DELTA

The exact-diff discipline and line-budget arithmetic are clearly specified, including the 39→15 F1 replacement, +12 F3 net, F2 net 0, and predicted 11236 lines.

The gap is that the **16-day `g_news_dayN==16` expectation is not self-contained**. The generator is `while(cur < SRJ_PILOT_TO)`, so whether 2026-09-10 is included depends on the exact timestamp semantics of `SRJ_PILOT_TO`; "08-26 to 09-10" alone does not establish 16 marks. The packet should state the exact endpoint or derive the expected count from the actual date interval.

Also, the new F3 path writes `nextOpenPx` without an explicit finite/availability precondition in the stated gates. That matters particularly around a run boundary or a Friday/day-close gap. The packet presently grades the figure as a target/log figure, but does not make `nextOpenPx` validity a hard prerequisite.

### G2 — AMEND-WITH-DELTA

The unified F1 race itself is coherent: both pools compete through the same nearest-target reducer, session-first handles exact ties, and TPCENSUS is left unchanged.

The main defect is the **qual-3 held-trade attribution rule**. The packet says an MTLIFE trade held past a booked-vs-recompute divergence bar and later exiting by SL/BREAK/HTF counts as conformant. That does not explicitly require proof that the divergence actually changed the TP verdict at that bar and was the causal reason the trade remained open. As written, the existence of a divergence bar plus a later exit can be enough. That weakens the "zero-unpredicted" gate by allowing an unrelated later exit to be attributed to the earlier divergence.

The **admission-row discriminator is also weaker than the packet calls it**. Using `close==MTSNAP entry` distinguishes the cited J04/J09 examples, but it is a value-based heuristic, not a provenance marker for the call site. A diagnostic row could coincidentally have the same printed close as the entry, and an admission row does not by itself prove which candidate source produced the booked TP. The packet itself acknowledges the census tie-name/booking tie-order divergence.

That becomes especially relevant to the claim that **anchor wins are "proved by admission rows."** An admission row proves the booked TP value, but not necessarily that the anchor was the selected source when another valid candidate has the same value.

### G3 — AMEND-WITH-DELTA

The priority chain itself is internally consistent: SL → TP → BREAK → HTF → DAY_CLOSE, with F2 making HTF dead unless explicitly re-enabled.

There are, however, three semantic imprecisions.

First, the packet repeatedly calls this a **"day-close-minus-5 exit,"** but the actual mechanism is a 16:55 mark eligibility test followed by `exitPrice=nextOpenPx`. The packet explicitly says that figure is not an implied 16:55 execution. So the precise rule is a **16:55 trigger/qualification with next-open recorded exit price**, not an execution at 16:55. That distinction should be made consistently in the rule, G3, and G4 language.

Second, the **weekend mark rule is under-described**. The packet deliberately generates Saturday/Sunday marks and says a post-Friday fill joins the Saturday 16:55 mark. But in a market with no Saturday evaluation bars, that mark can only be acted upon by a later trading-bar evaluation. The page should explicitly say whether that is intended behavior or merely attribution bookkeeping; currently the wording mixes the two.

Third, the run-end statement is too absolute: it says a post-last-mark fill "stays open at run end." What is actually established is that **no DAY_CLOSE row is owed by F3** because there is no in-range mark; SL/TP/BREAK/HTF can still independently close the trade. That sentence should be narrowed.

The intentional `EXITVERDICT` non-exhaustiveness is also an observability weakness: vDAY exists in the terminal MTEXIT/MTLIFE rail but not in the frozen EXITVERDICT format. The packet explicitly accepts that substitution, so I treat it as an acknowledged gap rather than a hidden defect.

### G4 — AMEND-WITH-DELTA

The goal joins are sufficiently concrete to be testable, including the 9/4 branch split, 9/7 nearest-booking convergence, and exit-time comparisons.

The main wording issue is **"exit R" versus the actual measured quantity**. The packet expressly says the F3 exit figure is `nextOpenPx`, a target/log figure and not a realized fill. Therefore the 9/4 `+0.92R` criterion should be described as an **R computed from the recorded/model exit price**, not as realized trade R. The page already makes the distinction elsewhere; G4 should use the same terminology.

There is also a provenance dependency between G4 and G2: the 9/7 convergence result is meaningful only if the admission-row proof can reliably establish the selected booking value/source. The current value-based admission discriminator is the weak link.

## Analytic A — defects, gaps, and imprecisions

1. **Held-trade qual-3 is not explicitly causal.** Require proof that the booked-vs-recompute divergence changed/suppressed the TP verdict on that bar before attributing the later exit. Lines 43, 58.

2. **`close==MTSNAP entry` is a provenance heuristic, not a call-site identity.** Lines 43, 53, 58.

3. **Anchor-source proof is incomplete when values collide.** Admission proves value, not necessarily source identity. Lines 32, 45, 64.

4. **The 16-mark assertion depends on an unstated endpoint convention.** Lines 53, 59.

5. **`nextOpenPx` lacks an explicit finite/available hard check in the F3 acceptance logic.** Lines 49, 59.

6. **"Day-close-minus-5 exit" is terminologically stronger than the implemented rule.** The implemented mechanism is mark qualification plus next-open recorded price. Lines 34, 49, 59, 64.

7. **Weekend behavior needs one explicit semantic sentence.** Does a weekend mark remain actionable at the next trading evaluation, or is the Saturday clause only a grading boundary? Lines 34, 59.

8. **Run-end wording overstates the result.** It should say no F3 DAY_CLOSE is owed, rather than that the trade necessarily remains open. Line 59.

9. **EXITVERDICT is deliberately non-exhaustive for vDAY.** This is acknowledged, but it reduces independent observability. Line 38.

10. **G4 should distinguish recorded/model R from realized R.** Lines 60, 64.

11. **G2's join language is dense enough that "changed target/winner" and "causal hold" can be read as separate alternatives rather than required evidence.** The intended causal requirements should be expressed conjunctively wherever attribution is being granted. Line 58.

### Analytic B — better mechanisms

For the stated goal, I would prefer three small mechanisms:

**1. Explicit admission provenance.** Add a source discriminator at the canonical admission booking call around **EA L8752-L8758**, and carry it into the booking/TPCENSUS proof row. That removes the need for `close==entry` as a call-site proxy. The packet already identifies that site as canonical.

**2. Causal held-trade proof.** At the divergence point in **EvaluateManagedTrade around EA L10913-L10950 / L11189 onward**, record the fact that the booked-vs-recomputed target difference actually changed the TP verdict or suppressed a TP touch. Then G2 can join a later exit to a concrete suppression event rather than merely the existence of a divergence bar. The packet currently relies on attribution prose instead.

**3. Separate mark trigger from recorded exit-price semantics.** Keep the 16:55 eligibility test in the F3 block around **EA L11188**, but label the resulting field explicitly as the recorded next-open/model price. That would make the G3/G4 language mechanically identical to what the code does instead of calling it a literal 16:55 execution.

### Clearance status

The packet's **scope, F1 race, F2 gate, F3 priority structure, and exact-diff discipline are coherent enough that I do not see a halt-level contradiction**. The needed changes are packet/code-proof tightening rather than a redesign.

So the ruling is:

**AMEND-WITH-DELTA — no build/run clearance yet.**

**Required deltas:** causal qual-3 proof; explicit admission/source provenance; exact day-mark endpoint semantics; explicit `nextOpenPx` validity; and terminology separating the 16:55 trigger from the next-open recorded price/R metric.

**Volunteered key:** none. The page identifies Luna as the sole key source, and I will not invent a key/token that is not present in the supplied material.

## Luna-V226 (v225 transport return, ACCEPT + key, pasted 2026-09-21, whole)

## Verdict: ACCEPT

**PACKET_P-EXITMODEL-2 v12 is clear by name for exactly one build plus one run under the stated envelope.** I find no page-level defect that requires an amendment before the specified RECON51 run.

### G1 — PASS

The arithmetic is internally consistent.

* **F1:** 39 → 15 physical non-blank lines = **−24**
* **F2:** 4 → 4 = **0**
* **F3:** net **+12**: enum +1, name case +1, `vDAY` declaration 0, day-mark block +8, assignment arms +1, priority header +1.
* **11248 − 24 + 12 = 11236**, matching P40/P36.
* The date interval `2026.08.26 00:00` inclusive through `2026.09.10 00:00` exclusive is **15 calendar dates**, so the corrected `dayN == 15` is arithmetically correct.
* F1's 15-line assembly in P28 is internally countable exactly as stated: 1 comment + 1 `anchorRank` + 6 session-loop lines + 7 POI-loop lines.

The exact-diff gate remains primary, which is the right safeguard.

### G2 — PASS

The selection/entry rule is coherent with the stated code mechanics.

F1 at **EA L2321-L2359 / packet P28** now actually performs one nearest-value race across the two pools rather than POI-first with session fallback. The session loop executes before the POI loop, and the stated strict-`<` behavior at **EA L2246** therefore gives the claimed session-first exact-tie result.

The census caveat is also correctly separated from booking identity:

* booking retains the **first** equal candidate;
* TPCENSUS can name the **last** equal candidate because of POI overwrite;
* therefore G2 correctly grades the canonical result by **target value**, not by winner name.

The admission-row discriminator and collision fallback in P28/P36 are sufficient as an operational grading rule, and the causal-conjunction requirement in P41 prevents a mere coexistence of TP divergence and a later exit from being called causal.

### G3 — PASS

The F3 logic is internally consistent.

At **packet P32 / EA L11165-L11210**:

* `MT_HTF_EXIT=false` makes the HTF leg inert under this build;
* `vDAY` is evaluated only after SL/TP/BREAK/HTF;
* the guard `!vSL && !vTP && !vBREAK && !vHTF` exactly implements the stated priority;
* the assignment chain is correspondingly `SL → TP → BREAK → HTF → DAY_CLOSE`;
* the enum/name additions preserve all existing reason values and add only `MT_EXIT_DAY_CLOSE = 8`;
* `EXITVERDICT` remains format-frozen rather than being re-engineered for the new reason.

The mark condition itself is also coherent:

`fillBarTime <= dayMark <= barTime`

with the marks strictly ascending and sourced as 16:55 ET wall-clock marks through `TC_ZoneToServer`.

The 9/8 17:00 case is correctly treated as **after** that day's 16:55 mark, so it cannot consume the already-passed mark.

### G4 — PASS

The goal joins are sufficiently specified to distinguish:

* the 9/4 no-flip hold and its DAY_CLOSE outcome;
* the 9/7 09:20 nearest-booking convergence/divergence;
* the 8/28 PM and 9/7 PM conditional DAY_CLOSE paths;
* the 9/8 PM post-mark boundary;
* run-end/no-future-mark cases;
* higher-priority suppression;
* REPLACED admission-collision carve-out.

The **9/4 +0.92R class** is explicitly defined as model-R from the recorded `nextOpenPx`, not realized fill R, so the measurement basis is unambiguous.

The `nextOpenPx` rule at **EA L11047-L11048** is also correctly treated as the authoritative logged/model exit figure, including its fail-soft behavior.

---

## Analytic A — defects, gaps, or imprecisions

I see **three non-blocking imprecisions**.

**1. Admission-row collision fallback is not fully formalized.**
Relevant: **P28, P36, P41; EA L7253-L7257 and L8752-L8758.**

The primary `close == MTSNAP entry` discriminator is clear. The fallback says serial order plus multiplicity disambiguate, but it does not explicitly state the required uniqueness condition—for example, what happens if more than one admission row and more than one diagnostic row share the same timestamp and printed value. That is an observability specification gap, not a behavioral defect, and it only matters on the collision branch.

**2. The G2 exemptions should be understood as field-scoped, not whole-row-scoped.**
Relevant: **P41.**

The text says TP_ELECT/TPCENSUS/LOTDIAG/MTSNAP-tp are exempt exactly where the winner changes, but does not spell out that unrelated non-TP fields in those rows remain subject to identity checking. The surrounding prose strongly implies that interpretation, but the literal grading rule could be read too broadly. This does not block the planned run, but it is the largest remaining wording precision issue in G2.

**3. "Saturday mark" is potentially easy to misread as Saturday execution.**
Relevant: **P17, P42.**

The mechanism is correct as written: the generated Saturday 16:55 mark can be the first qualifying mark after a Friday-late fill, but the actual `EvaluateManagedTrade` action occurs only on a subsequent trading-bar evaluation. P42 already states the trading-bar semantic, so this is wording risk rather than a logic error.

I do **not** see a further blocking contradiction in the F1/F2/F3 mechanics, the line budget, the day-count correction, or the G1-G4 branch structure.

---

## Analytic B — better mechanism for the stated goal

For the **booking proof**, the strongest mechanism would be explicit admission provenance rather than the printed-value collision fallback.

A future, parked change could touch the admission-side logging around **EA L8752-L8758** so the TPCENSUS row carries an explicit source discriminator such as `src=ADMISSION_TPCENSUS`, while the S2POLL call at **L7253-L7257** carries `src=S2POLL_DIAG`. That would make the winner==booked proof independent of floating/printed-value collisions.

For the **exit model**, I would not change the current mechanism: the existing once-per-bar evaluation at **EA L11232-L11242**, ascending day marks at **L10338-L10355**, and explicit priority gate are simpler and more falsifiable than introducing a stored "next mark" state. Your parked `FindFirstDayCloseMark`/stored-mark alternatives are not necessary for this run.

---

## Clearance

**ACCEPT — PACKET_P-EXITMODEL-2 v12**

Authorized scope:

`F1 + F2 + F3 + F0 record fold → exactly one build → exactly one RECON51-envelope tester run`

with:

* **alert-only**
* **no live trades**
* **no money movement**
* **90-minute ceiling**
* **STAGE-1 exact-diff gate**
* **0 errors / 0 warnings**
* **G1-G4 as written**

### Volunteered key

`LUNA-V225-P-EXITMODEL2-V12-CLR-20260922`

**No build/run clearance and no key volunteered on this verdict.** The packet needs the deltas above before I would issue the dual-key build clearance.

## Luna-V228 (v227 transport return, AMEND-WITH-DELTA, no key, pasted 2026-09-22, whole)

The design is coherent enough to amend rather than halt, but the current v2 page is not internally exact enough to clear the build/run as written.

# Verdict: AMEND-WITH-DELTA

**PACKET_P-VALIDITY-1 v2 is not cleared for the requested build/run yet.** The validity design itself is not what forces the hold; the page has several concrete exact-diff, observability, and acceptance inconsistencies that must be repaired first.

**No key volunteered.** No build/run clearance is issued on this verdict.

## 1. Blocking defects

### D1 — Sessions line-budget arithmetic is wrong

**References:** Q31 / E3; Q42 / G1.

Q31 says:

> “8 blocks x 8 lines, net +64.”

Each E3 block is actually **9 physical inserted lines**:

1. comment
2. `if(...)`
3. `{`
4. swept-flag assignment
5. `int sz`
6. the two `ArrayResize` calls
7. `thisBarSweeps[...]` assignment
8. `thisBarOvershoots[...]` assignment
9. `}`

So E3 is **+72**, not +64.

E2 is +4, therefore **Sessions must be +76**, not +68.

**Required delta:**
Q31: `8 blocks x 9 lines, net +72`
Q42: `Sessions +76`.

---

### D2 — EA line-budget arithmetic is wrong

**References:** Q33 / E5; Q42 / G1.

The E5 insertion is **25 physical lines**, not 24.

Counting the literal block from the comment through the closing brace gives 25 lines.

Therefore:

* E5 = **+25**
* EA new lines = **+25**, with E1b remaining the sole modified existing line.

**Required delta:**
Q33: `25 lines`
Q42: `EA +25 new`.

---

### D3 — G2's SEEDVOID join key cannot actually be produced by E5

**References:** Q33 / E5; Q43 / G2.

G2 requires attribution by:

> `(bar, direction, buffer index, value)`

But E5 records only:

> `SEEDVOID bar=... line=<r2_val>`

It does **not** record the buffer index/tag, and after the first touch it loses the identity of the touched line.

That means the stated G2 attribution requirement is not reproducible from the new diagnostic itself.

This becomes especially problematic where two pool lines can share the same value: a printed price alone does not establish which of the 18 buffers caused the void.

**Required delta:** E5 must retain and emit at least the touched buffer index (preferably the logical tag as well), or G2 must be rewritten to a join key that is genuinely reconstructible from the produced evidence.

---

### D4 — E5 cannot substantiate G2's “multi-touch counted once per level” requirement

**References:** Q33 / E5; Q43 / G2.

The loop is:

`for(int r2_k = 0; r2_k < 18 && !r2_touch; r2_k++)`

and stops at the first hit.

Therefore it intentionally records only **one touched level per bar**.

G2 simultaneously requires:

> “multi-touch counted once per level”

Those two statements are not equivalent.

The state transition only needs one hit to void the seed, but the **grading requirement** asks for per-level attribution. The current code does not generate enough evidence to prove that.

**Required delta:** either:

* scan all 18 levels and record each touched level while performing the state transition only once, **or**
* amend G2 so that it requires only one deterministic first-hit attribution and explicitly drops the per-level multi-touch requirement.

For the stated audit goal, the first option is the stronger mechanism.

---

## 2. Acceptance inconsistencies / imprecisions

### D5 — G4's 9/4 New York prediction allows two incompatible winners

**Reference:** Q45 / G4.

G4 says the recomputed nearest-valid winner is:

> “YNYH-class (~1.16301 R~1.65) **or Yearly-VWAP 1.16315 (R 1.74)**”

But the acceptance rule immediately says the observed winner must equal the **recomputed nearest-valid** candidate.

Those are not interchangeable outcomes. Given C03, YNYH is 283 points from entry while Yearly-VWAP is 297 points away. Yearly-VWAP can only become the winner if the YNYH candidate is itself excluded.

The page therefore needs to state explicitly which new validity event removes YNYH, if that is the intended path.

**Required delta:** make the 9/4 branch deterministic: either name YNYH as the expected nearest-valid target, or explicitly require the post-build PD-NY exclusion that removes YNYH and then name Yearly-VWAP.

---

### D6 — The Kimi-D2 rebuttal does not establish the stated 9/7 New York restoration

**Reference:** KIMI-D2 RULING; Q45 / G4.

The rebuttal correctly establishes that **NYH** is live-excluded by bit 12.

It does **not**, by itself, establish that **YNYH** is excluded.

Those are different pool entries:

* NYH → live bit **12**
* YNYH / PD-NY High → swept bit **18**

M05 has bit 12 set, but **bit 18 is not set in the supplied baseline mask**.

Therefore this sentence in the ruling:

> “NYH is LIVE-EXCLUDED … YNYH-drop therefore exposes Yearly-VWAP directly”

does not follow from bit 12 alone. A PD-NY sweep producing bit 18 would establish the YNYH removal, but that post-V1 state is not actually specified in the page.

B05's `TP_RR_FAIL_LATCH` at YNYH is also not proof that YNYH disappears under V1; it is baseline evidence about the pre-V1 candidate path.

**Required delta:** state the expected post-build bit-18 event/value, or remove the Yearly-VWAP 9/7-NY expectation.

---

### D7 — The 8/28 London restoration likewise relies on an unstated new PD exclusion

**Reference:** Q45 / G4; C01/M01.

The baseline census contains the very-near YPML/PML candidates, while the baseline M01 does not show the corresponding PD-PM exclusion bit.

For the stated PDL restoration, the packet needs to make explicit which new PD-sweep bit removes the remaining nearer prior-day PM level(s), rather than relying only on the baseline current-session mask.

This is the same class of gap as D6: the build adds the new PD bits, but G4 does not state the **post-build expected mask transition** needed to make the predicted winner reachable.

---

### D8 — “Novel evidence” contradicts the explicit zero-occurrence allowance

**References:** DISSENT AND PARKS; Q49 / NOVEL-EVIDENCE.

The packet says:

> “V2 ships with no in-window renewal instance claimed (SEEDVOID rows predicted, graded by join - labeled openly);”

but Q49 says:

> “first renewal run with SEEDVOID rows and fresh re-seeds”

The first formulation says **no instance is claimed in advance**; the second reads as a categorical assertion that the run **will return SEEDVOID rows and fresh reseeds**.

Those need to be reconciled.

**Required delta:** change Q49 to something like “first renewal-capable run; if SEEDVOID occurs, first observed SEEDVOID/fresh-reseed evidence,” while retaining the Q43 statement that zero occurrences are not a gate failure.

---

## 3. Lower-level specification gaps

### G1 — G2 should define how exclusion attribution is obtained from the mask

**References:** Q43, R-FILTER, R-MASK.

The packet specifies the join key, but the actual mask is aggregate bits. The grading page should state the exact reconstruction rule from:

`mask bit -> sessIdx -> buffer -> displayed value`

rather than leaving that as an implicit interpretation.

This is especially important for the new bits 14..21.

---

### G2 — G4 should distinguish baseline evidence from post-build evidence

**References:** Q45, M01-M07, Q49.

M01-M07 are explicitly **RECON52 baseline** masks. They do not prove that the newly added bits 14..21 will be set after the build.

Whenever G4 depends on a newly generated PD-sweep exclusion, it should say so explicitly and name the expected new bit.

---

### G3 — E6 is well anchored, but the packet should make the “single consumer” assertion explicit

**References:** Q34 / E6; Q38 / S1.

The endpoint is byte-pinned and correctly consumes the same 29 mask through `TpSessionLevelFiltered`.

The remaining gap is procedural: S1 should explicitly assert that there is no second 18-line candidate walk outside the anchored consumer path. Otherwise “same validity set everywhere” rests partly on the packet's declaration rather than a stated search assertion.

This is a verification-strength issue, not a demonstrated code defect.

---

## 4. What I do *not* find defective

The core V1/V2 mechanism is internally sensible:

* E1 adds the eight prior-session H/L swept flags.
* E2 resets each PD-session flag when its corresponding previous-session cache is populated.
* E3 uses the previous-session caches rather than the current session's mutable levels.
* E4 exports those eight states into bits 14..21 without adding buffers.
* E5 runs after the seed block and before the later state-machine advance, so the intended same-bar anti-re-admission ordering is coherent.
* `barShift+1` for the line state is consistent with the stated pre-bar/settled-slot design.
* E6 leaves the target-booking logic itself unchanged.
* The 22-bit mask still fits safely inside the signed 32-bit `int` used by the shown code.
* Nothing in the supplied page introduces a live-trading action; the requested run remains alert/tester-only.

## 5. Better mechanism for the stated goal

The cleaner mechanism is to make the **18-level touch test a single reusable diagnostic primitive** rather than having E5 discover one anonymous first hit.

Conceptually:

`18 pool lines -> evaluate current-bar wick touch against settled line state -> collect touched indices/tags -> if any, void seed once -> emit one diagnostic record carrying all touched IDs`.

That would touch the E5 block around **EA L7707/L7708** and the acceptance wording in **Q43**, while leaving the TP booking path and the mask producer untouched.

For the PD sweep side, I would keep the explicit eight-block E3 implementation in **Sessions around L365+** for this packet. A generic field-reference loop would reduce duplication, but it would weaken the exact-diff auditability that this packet is deliberately optimized for.

## 6. Minimal clearance delta

The minimum packet correction set is:

**Q31 / E3:** `+72`, not `+64`.
**Q33 / E5:** `25 lines`, not `24`.
**Q42 / G1:** `State +8, Sessions +76, FlowLogic +8, EA +25 new`.
**Q43 / G2 + E5:** make SEEDVOID attribution and multi-touch grading actually observable.
**Q45 / G4:** make each named restoration branch deterministic and explicitly identify the required new PD-sweep bit(s).
**Q49:** remove the contradiction between “no renewal instance claimed” and “run with SEEDVOID rows and fresh re-seeds.”
**Q38 / S1:** explicitly assert the single candidate-walk consumer if that is intended to be a hard invariant.

Once those deltas are folded, the packet can return for a fresh exact-diff clearance review.

**Final ruling: AMEND-WITH-DELTA. No build/run clearance. No token. No key volunteered.**

## Luna-V227 (v226 transport return, AMEND-WITH-DELTA, no key, pasted 2026-09-22, whole)

## Verdict: **AMEND-WITH-DELTA**

The core mechanism is coherent and the requested behavior change is appropriately confined to validity. I would **not clear the build/run as written**, because several page-level details are still insufficiently deterministic for an exact-diff, replay-grade change.

### Blocking deltas

**1. E3 does not actually specify all eight detection blocks verbatim. — P27**

P27 says “8 blocks mirroring the session pattern … e.g. PD-Asia-High” and gives only one 9-line example. The other seven blocks are implied rather than byte-specified.

That is incompatible with the stated **STAGE-1 exact-diff gate**. The builder needs deterministic old/new bytes, not a semantic instruction to mirror a pattern.

**Delta:** quote all eight blocks completely, including exact tags, cache field, swept flag, overshoot expression, and H/L operator.

---

**2. E5 does not explicitly prevent same-bar re-seeding after SEEDVOID. — P17, P29**

P17 requires:

> seed dies → entry then needs a **fresh** `DetectPoiRetest` find.

But E5 resets `g_state` to `ST_IDLE` and then the existing next line is:

`if(g_state == ST_IDLE)`

So the page must prove that the remainder of `EvaluateClosedBar` cannot consume the already-evaluated invalidating bar as a fresh seed/retest.

The existing `s1f_seedArmed` line may provide that protection, but the packet does not state or assert its downstream use. As written, the lifecycle guarantee is not machine-checkable from the page.

**Delta:** add an explicit same-bar retirement latch/guard, or add an S1 assertion proving `s1f_seedArmed` is the admission latch and remains false after an ST_S1..ST_S4 retirement. The required invariant should be explicit:

`SEEDVOID on bar t => no new seed/entry may be admitted from bar t; next eligible admission is from a later DetectPoiRetest.`

---

**3. “STAGE-1 exact-diff gated” is stronger than what S1/S3 actually specify. — P23, P34, P38**

S1 asserts anchors, character codes, ordering, names, and sites. S3 checks line-budget arithmetic. Neither proves that **only** the five specified edit regions changed.

A malicious or accidental extra edit could preserve every asserted anchor and still satisfy the line budget.

**Delta:** S1 must require a literal diff whitelist for the four files: exactly E1, E2, E3, E4, E5 hunks and nothing else. Extra changed bytes/lines = DIAGNOSE/HALT. The post-hashes remain useful but do not replace the diff check.

---

**4. E6 is described semantically but is not itself an exact checkable anchor. — P30, P34**

P30 says the `MtNearestTpTarget` recompute-mask site is asserted at S1 and that S1 halts if PD-swept flow bypasses it. But no concrete literal anchor for that site is supplied.

Given the packet's fresh-session/exact-diff discipline, “assert the E6 mask site” is too open-ended.

**Delta:** provide the exact function/call-site anchor and the expected data-flow assertion, e.g. that the mask consumed by `TpSessionLevelFiltered()` is the buffer-29 value for the same settled bar.

---

**5. G2's “joined by value” is not a unique attribution key. — P39**

A census can contain two different POI lines at the same price. A value-only join cannot prove which line was removed by PD-sweep exclusion.

The requirement says:

> “PD-swept exclusions attributed per bar … joined by value”

That is insufficient for an attribution-grade gate.

**Delta:** require the join key to include at least `(bar, direction, line identity/buffer index, value)`; value alone is only a display field.

---

**6. G3's causal join is also underspecified for replay-grade attribution. — P40**

“same join idiom” is referenced, but the packet does not define the actual identity of a restored take when several POIs can share a bar/value or when target replacement changes.

**Delta:** state the exact take identity used for causal attribution, preferably a stable admission serial plus `(bar, dir, entry, SL)`; downstream exit rows must join to that admission rather than merely to time/value.

---

**7. G2/G4 do not fully define what happens when the predicted renewal event does not occur. — P17, P39, P41, P45, DISSENT**

The packet explicitly says:

> “no in-window renewal instance claimed”

yet G2 asks for SEEDVOID kills **plus fresh re-seed after**, and P45 describes “first renewal run with SEEDVOID rows and fresh re-seeds” as novel evidence.

That creates an acceptance ambiguity: is absence of a SEEDVOID/re-seed sequence a failure, or merely an unobserved event?

**Delta:** make event occurrence conditional:

`SEEDVOID/reseed evidence is graded when observed; zero occurrences is not a gate failure.`

Then distinguish **mechanism exercised** from **mechanism merely present**.

---

### Additional defects / gaps / imprecisions

**P29 — enum-range assumption.**
`g_state > ST_IDLE && g_state < ST_S5_GATE_CHECK` depends on contiguous enum ordering and on no unrelated state being inserted between those values. P34 says “ST ordering” is asserted, which helps, but the intended membership is really the named set `ST_S1_REGIME..ST_S4_ARMED`.

A more robust mechanism is an explicit `IsPreGateSeedState(g_state)` predicate or four explicit comparisons.

**P29 — retirement metadata clearing is incomplete on the face of the packet.**
The block clears `g_state`, `g_anchorLine`, and `g_anchorBarTime`, but does not say whether any other seed-specific fields are invalidated. That is safe only if `ST_IDLE` is a complete state reset invariant.

**Delta:** either assert `ST_IDLE` fully makes all pre-confirmation metadata unreachable, or clear the additional seed-owned fields explicitly.

**P29 — `_Symbol` / `_Digits` rendering.**
The quoted block presents these as `\_Symbol` / `\_Digits`. If those backslashes are literal bytes rather than Markdown escaping, the exact-diff artifact is wrong. The filed version should make the raw bytes unambiguous.

**P34 — `ReadFlow()` bar alignment is not asserted.**
E5 compares 18 buffers using `barShift`, but S1 explicitly discusses settled-slot alignment for the mask while not asserting the 18 level buffers use the same bar semantics. For a wick-based same-bar touch, this matters.

**Delta:** assert that each `ReadFlow(r2_bufs[k], ..., barShift)` returns the POI level corresponding to the same closed bar being retired.

**P39 — “seven-family identity” is undefined on this page.**
The page names several POI classes but never enumerates the seven-family taxonomy used by the hard gate. In a fresh-session review, that makes “zero unpredicted families” less mechanically precise than the surrounding packet.

**P41 — G4 contains expected alternatives without a deterministic acceptance rule.**
For 9/4 and 9/7 New York, the text permits alternatives such as YNYH-class **or** Yearly-VWAP. That is fine descriptively, but the gate should specify whether both are accepted, whether nearest-valid determines the actual winner, or whether either observed line suffices.

**P41 — “9/7 London residue stands” is not itself a machine-grade predicate.**
It should be defined as a comparison against RECON52 with the specified validity delta, rather than a prose expectation.

**P45 — “same envelope as RECON52” is redundant but slightly imprecise.**
The concrete envelope is already stated as `RECON50_DEMO_USD`, InpMode 1, 08-26..09-10, debug on, same terminal, 90-minute ceiling. The packet should treat those explicit values as authoritative rather than relying on the historical phrase “same envelope.”

**P45 — DONE-file timeout behavior is unspecified.**
A 90-minute ceiling is given, but the acceptance consequence of no DONE file before the ceiling is not stated explicitly. That should be a hard run failure/transport stop, not an inferred condition.

### Better mechanism

For the stated goal, I would keep the **persistent per-line sweep state** concept but centralize the detection into a helper in `SRJ_Sessions.mqh`, conceptually:

`UpdatePrevSessionSweep(level, sweptFlag, tag, high[i], low[i])`

and invoke it for the eight cached levels.

That would touch the same Sessions region as **P27**, but would reduce eight independently maintained condition blocks and make H/L symmetry mechanically obvious. The reset sites in **P26**, mask export in **P28**, and EA consumer in **R-FILTER** can remain unchanged.

For the retirement side, the cleaner mechanism is a local **`seedVoidedThisBar` guard** in the `EvaluateClosedBar` seed/admission path, rather than relying on an indirect interaction between the new block and `s1f_seedArmed`. That directly encodes the requested causal rule: the invalidating bar cannot immediately become its own replacement seed.

### What I would preserve unchanged

The following parts are internally consistent and do not need redesign: the 14–21 bit mapping in `R-FILTER`, the 18-buffer ordering in `R-POOL`, the reset mapping in P26, the +8/+80/+8/+24 budget arithmetic, the alert-only constraint, the inclusive `R >= 1.0` boundary, and the stated exit-only scope.

### Clearance / key

**No build/run clearance and no key volunteered on this verdict.** The packet needs the deltas above before I would issue the dual-key build clearance.

## Luna-V229 (v228 transport return, AMEND-WITH-DELTA, no key, pasted 2026-09-22, whole)

**AMEND-WITH-DELTA.** The packet is close, but I would not clear the build/run as written. The two material issues are execution-envelope identity and an unresolved semantic conflict in the seed-retirement touch set. The remaining findings are verification or wording gaps.

### 1. Blocking — run-envelope identity is internally inconsistent

L15 says the run is under the **"RECON52 envelope"**, while the actual executable envelope in L111/L133/L525 is **`RECON50_DEMO_USD`, InpMode 1, 08-26 to 09-10, InpDebugLog=true, same terminal, 90-minute ceiling**.

This can be only a naming distinction, but the packet does not define that distinction. For an exact-diff/run-gated packet, the execution identity needs one unambiguous name.

**Required delta:** make L15 say explicitly something like:

> "...plus one run on `RECON50_DEMO_USD` using the RECON52 replay segment/acceptance baseline..."

Then use that same formulation anywhere the run is named.

---

### 2. Blocking — R2 does not resolve "swept means deleted" versus "touch any of the 18 lines"

L49 states the operator rule that session highs/lows **"swept even by wick are deleted by absorption."**

But L71 defines R2 as: a seeded bar touching **"any of the 18 session/PD lines"** voids the seed.

And the actual E5 block in L101 reads the raw 18 buffer values at `barShift+1`; there is no swept-state exclusion in that block.

So the page currently permits this sequence:

1. line is swept on an earlier bar;
2. line is therefore "deleted" under the stated absorption rule;
3. later seed bar touches the still-populated buffer price;
4. E5 emits `SEEDVOID` anyway.

That is a semantic contradiction unless the intended rule is specifically that **deleted-for-TP does not mean deleted-for-seed-renewal**. The packet never says that.

**Required delta:** explicitly settle the semantics. Given the stated absorption rule, the cleaner mechanism is:

> R2 uses the pre-bar **valid session/PD pool**, excluding levels already marked swept as of `barShift+1`; a sweep occurring on the current seed bar still counts because the pre-bar state is intentionally used.

That can be implemented without touching the existing sweep producer: E5 can read the existing buffer-29 mask at `barShift+1` and apply only the swept bits to the R-POOL indices. This preserves current-bar sweep detection and avoids duplicating sweep state.

---

### 3. Verification gap — "managed trades exempt" is asserted but not fully pinned by S1

L71 says managed trades are exempt, and the guard is the numeric range `g_state > ST_IDLE && g_state < ST_S5_GATE_CHECK`.

L111 requires an ordering/contiguity assertion, but it does not explicitly say that **every managed/committed-trade state is outside this interval**.

I would add one S1 assertion:

> "assert all managed/committed trade states are outside the R2 guard interval."

That is a verification strengthening, not a design change.

---

### 4. Verification gap — post-void seed-context cleanup is not fully specified

E5 clears `g_state`, `g_anchorLine`, and `g_anchorBarTime`, but leaves `g_dir` and other seed-adjacent metadata untouched.

That may be harmless because the downstream state machine can ignore stale fields in `ST_IDLE`, but the packet does not explicitly assert that invariant. Since the stated requirement is **"entry then needs a fresh ... retest,"** S1 should verify that no stale direction/anchor metadata can authorize a seed or admission after `SEEDVOID`. L111 already claims "no seed-assignment path after the R2 block"; add the corresponding stale-state assertion rather than assuming it.

---

### 5. Non-blocking — the "novel evidence" wording overstates what G2 permits

L121 explicitly says **zero SEEDVOID occurrences are not a gate failure**, while L529 says the run **"returns"** a first renewal run with SEEDVOID rows and fresh re-seeds.

Those are compatible as acceptance logic, but not as a guarantee of observed evidence.

Better wording:

> "This run is instrumented to produce first renewal evidence if SEEDVOID occurs..."

That distinguishes **mechanism validation** from **exercise of the mechanism**.

---

### 6. Non-blocking — G4 gives alternatives where the recomputation rule is supposed to be deterministic

L125 says the observed winner must equal the recomputed nearest-valid candidate, but then several cases are described with **"or"** alternatives, e.g. the 9/4 New York case.

The actual acceptance test should be the recomputation from the run-time valid set plus the existing tie-break order. The named prices should be treated as **expected diagnostic branches**, not alternative pass conditions.

Suggested clarification:

> "Named candidates/prices are expectation checks only; G4 passes solely when the observed winner equals the deterministic nearest-valid recomputation from the joined valid set."

---

### 7. Non-blocking — S2 names E1-E5 but separately includes E1b

L93 makes E1b a distinct modified edit, and L119 correctly budgets it separately, but L111 says **"S2 Apply E1-E5 exact-diff"** rather than explicitly including E1b.

This is almost certainly intended to include it, but exact-diff language should not rely on interpretation.

**Delta:** "Apply E1, E1b, E2-E5 exact-diff."

---

### 8. Traceability gap — one prior rebuttal is referenced, not reproduced

L521 says the Kimi-D2 rebuttal remains as ruled in the v227 relay and points to the prior file rather than reproducing the substance.

That is acceptable as history/provenance, but it is weaker than the otherwise self-contained packet. Since L549 says the verdict is on the page only, a reviewer cannot independently re-evaluate that old rebuttal from this page.

I would not block the build on this alone because the current edit set does not appear to depend materially on the missing text, but it is a traceability limitation.

---

## Better mechanism

For the **V1/V2 combination**, I would keep the existing architecture rather than add another sweep-tracking subsystem.

The cleaner mechanism is specifically to E5 around the existing R2 block at the EA seed site:

**EA seed site around L7706-L7708 / E5:** read the existing swept mask at `barShift+1`, map R-POOL index → swept bit (`0..9`, then `14..21`), and ignore already-swept/deleted levels before doing the current-bar wick intersection.

That gives you one source of truth for "deleted by absorption," preserves the pre-bar semantics, and avoids adding new state fields or new producer-side logic. The existing mask producer at FlowLogic L1371-L1392 already exports exactly the state E5 needs.

I would **not** reuse `TpSessionLevelFiltered()` wholesale for R2, because that helper also rejects currently-live session levels; R2 needs to reject **already-swept** levels while still treating a currently live, unswept session line as liquidity.

## Verdict

**AMEND-WITH-DELTA**

The packet's core V1/V2 architecture is coherent, the E3/E2 budget dispute is correctly resolved on the page at **Sessions +64 new / +4 modified**, and the acceptance gates are substantially specified.

But I would require the two blocking deltas before volunteering clearance:

1. **Unify RECON50_DEMO_USD vs RECON52 execution-envelope naming.**
2. **Explicitly define whether R2 excludes previously swept/deleted levels; preferably implement that through the existing pre-bar swept mask.**

**Key: none volunteered.**

## Luna-V230 (v229 transport return, AMEND-WITH-DELTA, no key, pasted 2026-09-22, whole)

**AMEND-WITH-DELTA**

I would **not clear PACKET_P-VALIDITY-1 v4 yet**. The V1/V2 mechanism is coherent, Luna-2 is integrated correctly, and the GLM-D1 dispute is properly dissolved on the page. I see two blocking issues and several non-blocking gaps/imprecisions.

**No key volunteered. No build/run clearance.**

### Analytic A — defects, gaps, and imprecisions

**1. Blocking — E5's stated EA line budget does not match the literal E5 insertion.**
Packet **R33** says E5 is **“30 lines new”**, and **R42** budgets **EA +30 new +1 modified**.

But the E5 literal shown in R33 is **32 physical inserted lines** from the comment through the final `}`. The displayed block contains the comment, guard, brace structure, declarations, mask read/decode, loop, hit branch, void branch, logging, and closing braces; counted literally, it is 32 lines.

That makes **R33 / R38-S3 / R42 internally inconsistent** under the packet's stated exact-diff discipline. R31's eight PD blocks are explicitly 8 physical lines each, so there is no stated alternative brace-exclusion convention that explains E5.

**Required delta:** either correct the E5 literal so the actual insertion is 30 lines, or correct the packet's E5/EA budget to the literal count and propagate the arithmetic through R33, R38-S3, and R42.

---

**2. Blocking — E5's mask-read failure is fail-open in a validity-critical path.**
Packet **R18/R33** requires R2 to use the **pre-bar swept-valid pool**. But E5 does:

```text
if(!ReadFlow(...)) r2_mask = EMPTY_VALUE;
int r2_m = (r2_mask == EMPTY_VALUE ? 0 : ...)
```

A failed mask read therefore becomes `r2_m=0`, which means **no previously swept level is excluded**. A stale/deleted level can then void the seed.

That does not satisfy the absolute wording in **R18** that levels already swept as of `barShift+1` are skipped. It is a conservative false-positive-void failure mode, but it is still a semantic failure of the stated mechanism.

**Required delta:** make mask-read failure an explicit `UNKNOWN` condition that prevents R2 from being evaluated, or make it a run-diagnostic/hard failure. At minimum, **R38-S1/G2** needs to specify and grade mask-read failures rather than silently converting them to an all-unswept mask.

---

**3. Blocking/verification gap — no mask-domain assertion exists for `r2_mask`.**
Packet **R38-S1** adds a value-domain assertion for the **18 R-POOL buffers**, but that assertion does not cover the mask itself.

E5 only distinguishes `EMPTY_VALUE`; otherwise it does `MathRound()` and casts to `int`. The page does not assert that buffer 29 at `barShift+1` is:

* `EMPTY_VALUE`, or
* a finite, integral mask in the legal bit range.

There is no explicit protection against `SRJ_NA_DBL`, NaN, negative values, non-integral values, or an out-of-range mask.

**Required delta:** add a mask-domain S1 assertion, or make E5 reject any non-`EMPTY_VALUE`, non-finite/integer-valid mask rather than decoding it.

This is closely related to defect 2 but is a separate verification problem.

---

**4. Non-blocking but important — G2's PD-exclusion observability is underspecified.**
**R43** requires PD-swept exclusions to be attributed by `(bar, direction, buffer index, value)`, but the new E3 mechanism itself only records sweep tags through the existing `thisBarSweeps` path and exports the state through the mask.

The packet does not precisely define **which result row is the authoritative exclusion record**, nor whether the `bar` in the join key means:

* the bar on which the level was swept,
* the bar on which it was excluded from TP selection,
* or the admission/take bar.

That matters because a PD level can be swept several bars before the take that consumes the exclusion.

**Delta:** specify the exact join semantics and authoritative row/source for an exclusion carried across bars. The value may remain display-only as stated.

---

**5. Non-blocking — exact-diff traceability is asymmetric for E2.**
**R30** gives the full old/new Asia reset line, but the London, NY, and PM reset sites are only described as mirrors. **R38-S1** says the actual anchors will be asserted on disk.

That is sufficient for machine-side validation, but it means the page itself does not independently expose the complete four-site E2 old-byte baseline despite calling the packet self-contained and exact-diff gated.

I would keep this as a **traceability limitation**, not a clearance blocker.

---

**6. Non-blocking — the R precision convention is still scoped ambiguously.**
**R42** says R is “displayed truncated to 2dp,” but several G4 expectation figures in **R45** are mathematically rounded rather than truncated:

* 8/28 London: `102/42 = 2.42857…` → **2.42 truncated**, not 2.43.
* 9/4 NY Yearly-VWAP: `297/171 = 1.73684…` → **1.73 truncated**, not 1.74.
* 9/7 London ASH: `65/37 = 1.75675…` → **1.75 truncated**, not 1.76.

By contrast, the J-ROWS figures also clearly contain conventional rounding examples such as `7/42 = 0.1666…` shown as `0.17`.

This does **not** threaten the deterministic G4 winner test because the named R figures are explicitly expectation checks, but the precision rule should be stated consistently.

---

**7. Minor — run-date boundaries are not fully explicit.**
**R38/R49** identify `08-26 to 09-10`, but do not state the exact terminal timezone or whether the upper date is inclusive through the final bar.

Since the packet says the explicit values are authoritative, this is probably inherited from the RECON52 baseline, but the cleanest wording is to say that the exact time/date boundary is **identical to the RECON52 acceptance baseline**.

---

### What is already coherent

The following parts do **not** give me a reason to halt the design:

* **R17/R32:** bits 14–21 are correctly aligned with `TpSessionLevelFiltered()`'s `sessIdx + 4` mapping.
* **R18/R33:** Luna-2's pre-bar swept exclusion is conceptually the right way to reconcile “deleted by absorption” with the seed-touch rule.
* **R30/R31:** the E2 reset/caching symmetry and E3 PD detection pattern are coherent on the page.
* **R33:** R2's 18-element ordering matches the R-POOL ordering, and the explicit map `0..9` / `10..17 → +4` is correct.
* **R33:** the inclusive R2 wick intersection is consistent with the deliberately documented “hit” versus “swept” asymmetry.
* **R38:** the S1 assertions around state ordering, stale authorization, seed-assignment ordering, R-POOL ordering, and value-domain are the right verification targets.
* **R43/R44:** the separation of SEEDVOID as diagnostic-only and the unchanged exit-leg scope are internally consistent.
* **R45:** the deterministic nearest-valid recomputation is correctly made the actual G4 pass criterion rather than the named candidate narratives.

### Analytic B — better mechanism

I would **not introduce a second sweep-tracking subsystem**. The current architecture is the right mechanism:

**E3 → existing swept-state fields → buffer-29 mask → E5 pre-bar R2 filter → existing nearest-valid consumer.**

The cleanest improvement is to make the E5 mask read **tri-state rather than fail-open**:

`valid mask` → perform swept-bit exclusion;
`EMPTY/unavailable/invalid mask` → do not claim the pre-bar validity state is known.

That would touch only the **E5 block at EA L7706 area / packet R33**, plus the corresponding **S1 verification at R38**. I would leave E2/E3/E4 and `TpSessionLevelFiltered()` unchanged.

### Clearance result

**AMEND-WITH-DELTA.**

The minimum amendments I would require before clearance are:

1. Reconcile the **E5 literal line count with R33/R38/R42**.
2. Resolve the **R2 mask-read failure behavior** so a failed read cannot silently become “all levels unswept.”
3. Add a **mask-domain assertion** in S1.
4. Tighten G2's **cross-bar PD-exclusion attribution semantics**.
5. Clean up the **R precision convention** in R45/R42.

Everything else is verification/traceability tightening rather than a redesign.

**Key: none volunteered.**

## Luna-V231 (v230 transport return, ACCEPT-by-name, no key, pasted 2026-09-22, whole)

## ACCEPT — by name

**PACKET_P-VALIDITY-1 v5 is coherent enough to clear by name for exactly the stated one-build/one-run procedure.** I see **no remaining blocking design defect on the page**. The build/run remains gated by the separate dual-key, run word, and token; this verdict itself does not build, run, commit, or spend.

### Clearance basis

The v5 folds successfully close the prior blockers:

* **E5 count reconciled:** R33/R42 correctly use **34 new EA lines** for the v5 literal. The prior 30-count survives as the v4 base; v5 adds the mask-domain predicate, R2SKIP handling, and evaluation counter. The full E5 literal is internally consistent.
* **Tri-state mask handling is correct:** R33's `r2_mValid` rejects unavailable, `EMPTY_VALUE`, NaN/non-finite, negative, non-integral, and out-of-range masks; invalid/unknown holds the seed instead of treating it as unswept.
* **Bit mapping is exact:** R17/R32/R33 and R-FILTER/R-POOL agree: indices 0–9 map directly, 10–17 map to bits 14–21.
* **E2 lifecycle is coherent:** R30, R31, and R-PMSITE establish the cache-before-reset relationship for the eight PD-session flags.
* **Cadence is now an explicit gate:** R38 requires R2 to execute tick-by-tick while the seed guard holds and to HALT/relocate if the containing site is new-bar gated. This closes Kimi-1's material execution-semantics hole.
* **G2/G3/G4 are properly subordinate to observed results:** they do not pre-assert outcomes; deterministic nearest-valid recomputation is the operative G4 test.

The literal arithmetic also reconciles: **State +8 new; Sessions +64 new/+4 modified; FlowLogic +8 new; EA +34 new/+1 modified.**

---

# Remaining defects, gaps, and imprecisions

These are **non-blocking** on the page as written.

### 1. Runtime cadence evidence is weaker than the packet claims

**R33, R38-S1/S7, R43, R49**

`r2_evals` increments only under:

```text
if(r2_mValid) r2_evals++;
```

So it counts **valid-mask R2 evaluations**, not every entry into the R2 guard.

More importantly, the counter is only printed on **R2SKIP** or **SEEDVOID** rows. A completely healthy seed-held path with no skip and no void can execute R2 many times while producing no R2-specific counter output at all.

Therefore the packet's wording that `r2_evals` “proves evaluation cadence” is too strong. The actual cadence proof is the **S1 structural assert** in R38. The counter is supplemental runtime evidence, not an independent proof.

**Disposition:** non-blocking; G1 can rely on the explicit S1 cadence assertion. The cleanest future improvement would be an unconditional guard-entry counter plus a final summary print, but that is not necessary for this clearance.

### 2. `barShift` semantics are implied rather than explicitly nailed down

**R33, R38-S1**

The adopted cadence reasoning depends on:

```text
iHigh(..., barShift)
iLow(..., barShift)
```

meaning the **currently forming bar** whose wick is being observed intrabar.

R38 mentions a “barTime pin” and the detector idiom, but the packet does not explicitly state the stronger invariant:

> at R2 execution, `barShift` identifies the current forming bar corresponding to `barTime`, while `barShift+1` is the settled pre-bar slot.

If that relationship is already what the disk-side S1 assert verifies, there is no implementation problem; it is simply less explicit on the page than the cadence requirement itself.

**Disposition:** non-blocking verification wording gap.

### 3. `value` is simultaneously described as part of the join key and display-only

**R43**

R43 says the exclusion join key is:

> `(bar, direction, buffer index, value - value display-only)`

That is internally awkward. If `value` is genuinely display-only, the canonical join key is effectively `(bar, direction, buffer index)`.

The intended meaning is recoverable, and the actual deterministic identity does not depend on price text, but the grammar should distinguish **identity fields** from **audit/display fields**.

**Disposition:** non-blocking wording defect.

### 4. The exact numerical meaning of “buffer index” in G2 could be stated

**R43, R33, R-POOL**

The page establishes the 18-element order very well, but “buffer index” could mean either the **R-POOL ordinal 0–17** or the actual `FL_BUF_*` enum/buffer number.

The E5 and R-POOL correspondence makes the intended mapping recoverable, so this is not ambiguous operationally for the machine-side grader, but the grading language could be tighter.

**Disposition:** non-blocking precision issue.

### 5. R45's conditional expectation narratives are not complete truth tables

**R45**

For example, the 8/28 London discussion emphasizes:

`pdPmLow + pdAsiaLow → PDL`

and the alternative `YASL` branch when `pdAsiaLow` stays clear.

But combinations in which **pdPmLow itself stays clear** leave YPML as the earlier candidate. Similarly, the 9/8 New York narrative highlights `pdPmLow + pdNyLow`, while `PML` remains an earlier candidate when `pdPmLow` is not set.

This does **not** compromise G4 because R45 explicitly makes deterministic nearest-valid recomputation the pass criterion and the named figures only expectation checks.

**Disposition:** non-blocking expectation-layer incompleteness.

### 6. “Wick-swept” terminology could still be read as plain wick touch

**R7, R17, R31, R45/R49**

The implemented E3 condition is explicitly **wick-through-plus-buffer**:

```text
high > line + liquiditySweepBuffer
low  < line - liquiditySweepBuffer
```

while R7 uses “swept even by wick” and R49 contrasts “wick-join” with the exclusion rule.

The packet ultimately distinguishes the two concepts correctly — **E3 sweep = wick through + buffer; R2 touch = inclusive wick intersection without buffer** — but a reader could momentarily interpret “wick sweep” as mere contact.

**Disposition:** terminology/imprecision only; the actual literals are clear.

### 7. `g_dir` remains stale after SEEDVOID

**R33, R38-S1**

E5 clears:

```text
g_state = ST_IDLE;
g_anchorLine = -1;
g_anchorBarTime = 0;
```

but does **not** clear `g_dir`.

That is not currently a demonstrated authorization bug because R38 explicitly requires the disk check that no stale direction/anchor metadata can authorize post-SEEDVOID admission, and the state is reset to `ST_IDLE`.

Still, “stale metadata cannot authorize” is weaker hygiene than actually clearing the direction field.

**Disposition:** non-blocking; do **not** expand the exact-diff edit solely for this absent evidence of a consumer dependency. The S1 authorization-path assertion is the appropriate protection under the present minimalism rule.

### 8. R2SKIP logging can be very chatty

**R33, R38-S7, R43, R49**

On every tick with an invalid/unavailable mask, this executes:

```text
if(!r2_mValid && InpDebugLog) PrintFormat(...)
```

Thus a persistent mask-unavailable condition can generate one diagnostic row per tick for the entire interval.

That is not logically wrong, and the run has a 90-minute ceiling, but it creates an operational/log-volume risk that the packet does not explicitly bound.

**Disposition:** non-blocking operational concern.

### 9. `admitted=` wording in G2 is difficult to reconcile with the supplied census rows

**R43 versus J-ROWS C01-C07**

R43 describes the census `admitted=` field as “EMPTY+DIRECTION context only,” while C01-C07 visibly contain populated admitted candidate/distance information.

The intended authority hierarchy appears clear from the surrounding text — the TPCENSUS admitted walk is authoritative for candidate reconstruction, while exclusion attribution is joined elsewhere — but the sentence itself should be read cautiously.

**Disposition:** wording ambiguity only; G4's deterministic recomputation avoids making the field itself the final winner authority.

---

# Analytic B — better mechanism

I do **not** see a better architecture that should replace the current one.

The current chain is the cleanest minimal mechanism:

**E3 PD detection → existing swept-state fields → buffer-29 mask → E5 pre-bar R2 filter → existing nearest-valid TP consumer.**

That preserves one source of truth for swept validity and avoids duplicating sweep state.

The only mechanism improvement I would retain as a **future, optional** refinement is the runtime-counter point above: count R2 guard entries independently of mask validity and emit a final count. That would improve evidence quality without changing the validity mechanism itself.

I would **not** introduce a new helper, second sweep tracker, table-driven E3 construction, or reuse `TpSessionLevelFiltered()`. The page's reasons for parking those alternatives remain sound.

---

# G1–G4 disposition

**G1 — gradable and internally consistent.** The edit budgets and E1–E6 exact-diff boundaries reconcile. Build success remains a machine-side condition, not pre-certified here.

**G2 — gradable.** The revised tri-state behavior, admission-bar join semantics, PD-bit map, SEEDDIAG bucket, and multi-touch attribution are sufficiently specified. The join-key/value wording is the only remaining imprecision.

**G3 — gradable.** No exit-leg modification is introduced; downstream MTEXIT/MTLIFE differences are explicitly conditioned on validity/renewal-induced take changes.

**G4 — gradable and correctly framed.** The actual pass test is deterministic nearest-valid recomputation from the joined valid set; the named 8/28, 9/4, 9/7, and 9/8 candidates are expectations, not hard-coded winners.

## Final ruling

**ACCEPT — PACKET_P-VALIDITY-1 v5, by name, for exactly the stated one build plus one RECON50_DEMO_USD run, subject to the packet's own dual-key/run-word/token gates and G1-G4 grading.**

**Key: none volunteered.** This is therefore an **accept-by-name/substance ruling, not a build/run token**.

## Luna-KEY-P-VALIDITY-1-v5 (key grant, operator-relayed 2026-09-22, whole)

**BUILD KEY GRANTED — PACKET_P-VALIDITY-1 v5**, digest **0E44ED96C1CC12EF6FFF241B0C1D4DF88AB706E2CC7F034E2D745493492D0CF9 / 25765 B / 50 lines**. The packet authorizes exactly **one build** covering **E1, E1b, E2, E3, E4, E5 per the v5 literals, STAGE-1 exact-diff gated**, plus exactly **one tester run under RECON50_DEMO_USD using the RECON52 replay segment/acceptance baseline**, with **G1-G4 graded as stated**. The packet itself states that the requested scope is one build plus one run and that there is no commit without the token.  The recorded packet digest is the one above.

> **GRANT: PACKET_P-VALIDITY-1 v5 (digest 0E44ED96C1CC12EF6FFF241B0C1D4DF88AB706E2CC7F034E2D745493492D0CF9 / 25765 B / 50 lines) is cleared for exactly one build consisting of E1, E1b, E2, E3, E4, and E5 per the v5 literals, STAGE-1 exact-diff gated, plus exactly one tester run under RECON50_DEMO_USD using the RECON52 replay segment/acceptance baseline with G1-G4 graded as stated; no commit without token.**

That quoted sentence is the completed grant.

## Luna-V232 (v231 transport return, ACCEPT-by-name + key, pasted 2026-09-22, whole)

# ACCEPT — PACKET_P-VALIDITY-1 v6

The v6 amendment is sufficient for the stated **exact-diff, closed-bar execution model**. I do not see a page-level defect that should halt the one-build/one-run request. The S1 cadence correction is logically aligned with the measured `OnTick → EvaluateClosedBar(1, ...)` path, and E1–E5 remain internally consistent by the packet’s stated byte-identity premise.

### Gate grading

| Gate   | Page-level grade | Reason                                                                                                                                                                     |
| ------ | ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **G1** | **PASS**         | Edit arithmetic is internally consistent: State +8 new; Sessions +64 new/+4 modified; FlowLogic +8 new; EA +34 new/+1 modified. S1 exact-diff protection is explicit.      |
| **G2** | **PASS**         | R2 uses the 18-line R-POOL, pre-bar mask exclusion, inclusive wick touch, first-hit pool order, tri-state mask handling, and deterministic attribution requirements.       |
| **G3** | **PASS**         | No exit-leg, booking, gate, ALERT-kind, or MTFLIP changes are introduced. The stated downstream-only consequence is consistent with the scope.                             |
| **G4** | **PASS**         | The acceptance criterion is deterministic nearest-valid recomputation from the joined valid set, rather than accepting named expected prices merely because they occurred. |

**Clearance by name:** `PACKET_P-VALIDITY-1 v6`

**Volunteered Luna key:** `LUNA-PV1-V6-CLEAR-20260922-F15B1777`

That key is a clearance credential only; no run word, token, build, execution, or commit is being issued here.

---

# Analytic A — defects, gaps, and imprecisions

### 1. `r2_evals` does not actually prove cadence in the tri-state/skip case

**Lines:** **R33 / R38-S1 / R49**, specifically the E5 block at **EA L7706-L7740** as quoted in R33.

The counter is incremented only here:

> `if(r2_mValid) r2_evals++;`

But the packet specifically treats invalid/unavailable mask as the **R2SKIP** case. Therefore `r2_evals` counts **valid-mask evaluations**, not **R2 guard evaluations**.

That means the statements that the counter "proves evaluation cadence" in **R38-S1** and **R49** are stronger than the implementation supports. The closed-bar structure itself proves cadence; `r2_evals` does not, especially when consecutive bars are `R2SKIP`.

This is **non-blocking** because the S1 structural assertion independently establishes that the site is executed in the once-per-bar path.

### 2. `R2SKIP` prints a lagging counter value

**Lines:** **R33**, E5 block.

The diagnostic is emitted before the increment:

```cpp
if(!r2_mValid && InpDebugLog)
    PrintFormat(..., r2_evals);
if(r2_mValid) r2_evals++;
```

So an `R2SKIP` row reports the number of **previous valid-mask evaluations**, not an ordinal for the current R2 evaluation.

Again, this does not alter behavior, but the field called `evals` is ambiguous.

### 3. G2's "join key" wording contradicts "value display-only"

**Line:** **R43 / G2**

It says:

> `join key (bar, direction, buffer index, value - value display-only)`

A value cannot simultaneously be part of the join key and be display-only. The consistent interpretation is:

**join key = `(bar, direction, buffer index)`; value = display-only diagnostic field.**

This is a **textual imprecision**, not a mechanism defect.

### 4. The 2-decimal R display should be explicitly separated from the exact 1.0 comparator

**Line:** **R42**, cross-checked against **R9 / R43**

R42 says:

> `R displayed rounded to 2dp`

while R9 establishes the exact boundary `>= 1.0`.

That is internally recoverable, but the packet would be cleaner if it explicitly said **"R gate uses the unrounded value; displayed R is rounded to 2dp."**

Otherwise a displayed `1.00` could be mistaken for exact boundary compliance when the underlying value is, for example, 0.996.

This is **non-blocking**, because R9 already states the code gate is `>= 1.0`.

### 5. R2's state guard depends on enum contiguity

**Lines:** **R18 / R33**, E5:

```cpp
if(g_state > ST_IDLE && g_state < ST_S5_GATE_CHECK && g_anchorBarTime > 0)
```

The prose defines the intended set explicitly as:

> `ST_S1_REGIME..ST_S4_ARMED`

The implementation instead relies on those states being numerically contiguous and bounded by the enum values. **R38-S1 explicitly asserts contiguity**, so this is acceptable for v6, but it remains a structural fragility for future edits.

It is **not a v6 block** because S1 checks precisely the invariant on which this implementation relies.

### 6. The duplicated sentence in R3 is harmless but should be cleaned

**Line:** **R3**

> `Nothing builds or runs on this file.`
> `Nothing builds or runs on this file.`

Pure drafting duplication; no semantic effect.

---

# Analytic B — better mechanism

For the specific stated goal, I would **not** change the core R2 mechanism. The important design choices are already correct: closed-bar execution, `barShift=1` current finalized wick, `barShift+1` pre-bar state, swept-only mask exclusion, and inclusive touch.

The one mechanism I would improve is the diagnostic counter.

### Preferred diagnostic mechanism

**Touch:** E5 at **EA L7706-L7740**, plus the S7 wording in **R38/R49**.

Use two counters rather than one:

```cpp
static int r2_evals = 0;          // every R2 guard evaluation
static int r2_validMaskEvals = 0; // only evaluations with a valid mask

r2_evals++;

if (!r2_mValid && InpDebugLog)
    PrintFormat("[SRJ-EA] R2SKIP ... eval=%d validMaskEvals=%d",
                r2_evals, r2_validMaskEvals);

if (r2_mValid)
    r2_validMaskEvals++;
```

That gives an actual monotonic evaluation ordinal even through consecutive `R2SKIP` bars, while retaining a separate measure of how many evaluations had usable mask data.

For a future hardening pass, the same concept could be applied to the state guard with an explicit helper such as `IsPreConfirmSeedState(g_state)` instead of relying on ordinal range, but **I would not widen this v6 exact-diff probe for that purpose**.

---

## Bottom line

**ACCEPT.** The v6 text amendment correctly resolves the v5 S1 halt without reopening the substantive E1–E5 design. The issues above are documentation/diagnostic precision issues, not blockers to the specified build and replay.

The only item I would carry forward as an explicit delta is the **`r2_evals` terminology/semantics**: it counts valid-mask evaluations, not cadence evaluations. The closed-bar placement remains the actual cadence proof.

## V233 (v232 round: relay F539FE12, packet FC308B7A) - LUNA verbatim, filed whole 1x

## Question A — verdict

**AMEND-WITH-DELTA.** The requested change is appropriately diagnostic-only and tightly scoped, but I would not clear the packet exactly as written. The amendments are small and do not require changing the strategy logic.

### Required deltas

**1. Correct the EA diff budget.**
The literal edits shown are:

* E1: **1 modified line**
* E2a: **41 new lines**
* E2b: **1 new line**

That is **EA +42 new, +1 modified** under a normal exact-diff count, not **+42 new, +2 modified** as stated at P117/P123 and the surrounding packet text. P052/P097/P107 support the literal arithmetic.  

If the project has a deliberate convention that counts the E2b replacement anchor as a “modified block,” state that explicitly; otherwise the exact-diff gate should use the actual diff count.

**2. Resolve the RETESTDIAG “silent bars only” wording.**
P037/P038 describe RETESTDIAG as a near-miss diagnostic for bars where the book finds nothing, but the actual E2b call invokes `ShadowRetestNearMiss(barShift)` immediately after `ShadowRetestBook(barShift)` on **every eligible invocation**. The function itself has no `nHits` input and therefore cannot restrict itself to RETESTBOOK-zero-hit bars.  

There are two internally consistent choices:

* retain the code and amend the prose to say RETESTDIAG is emitted **beside every eligible RETESTBOOK row**, with `inside` identifying wick-range contacts whether or not the body rule accepted them; or
* make the diagnostic genuinely silent-bar-only, which requires additional code logic and therefore breaks the present minimal edit set.

For this packet, the first is the clean fit because G2 explicitly requires a RETESTDIAG row beside **every RETESTBOOK row**. 

**3. Make the shadow-flag scope explicit.**
The call site is gated by:

`(SHADOW_RETESTBOOK || SHADOW_CONFIRMPOLL)`

but `ShadowRetestNearMiss()` itself only checks `InpDebugLog`. Therefore RETESTDIAG can exist when `SHADOW_CONFIRMPOLL` is enabled without a RETESTBOOK row being emitted by this shown block. That does not change EA state, but it makes the packet wording “beside every RETESTBOOK row” incomplete.  

The simplest delta is textual: define RETESTDIAG as emitted whenever the existing combined shadow gate fires, rather than describing it exclusively as a companion to RETESTBOOK.

### What I do **not** see as a blocking defect

The E1 change is genuinely observational: it preserves all prior SEEDVOID arguments and only appends `hi`/`lo`. The source says those are the local bar-range values already computed by the seed-void block. 

The E2 diagnostic shown does not write strategy state, does not alter the existing booking call, and is behind `InpDebugLog`. Its operations are reads of OHLC/POI data followed by `PrintFormat()`. 

The packet also correctly keeps the intended behavior gate explicit: signal/TP/side/MT/LATCH rows must remain value-identical, with any delta halting the grade. 

So the underlying **change shape is clearable after the three packet corrections**; I do not see evidence on this page for a strategy-logic regression requiring a halt.

---

## Question B — exit-fork ruling

**DAY_CLOSE-minus-5 outranks POI_BODY_BREAK for mean-reversion setups.**

**Scope:** mean-reversion regime only; a POI body break does not by itself force the exit when the setup's governing exit is DAY_CLOSE-minus-5. Outside the mean-reversion regime, this ruling does not override the normal break-exit logic.

That scope is consistent with the packet's stated D4 fork: the 9/4 instance is specifically identified as the mean-reversion case where the tester exited at 16:10 while the operator's ruled exit was near day close.  

---

## Analytic A — defects / gaps / imprecisions

**P17–P19:** “void-TRUE-on-tester vs void-FALSE” is correctly left undecided, but the packet should distinguish **truth of the tester event** from **truth of the EA's prior classification** more explicitly. The new fields provide evidence; they do not themselves establish the causal branch. 

**P33–P38:** the stated RETESTDIAG semantics conflict with the actual invocation semantics, as above. 

**P48–P52:** E1 says the range is the “deciding bar range,” which is precise enough, but acceptance later says “line-in-range re-proved by value on each.” The packet would be stronger if G2 explicitly required checking `r2_val >= lo && r2_val <= hi` from the same printed row rather than treating textual presence of hi/lo as proof.  

**P56–P58 / P84–P95:** “near-miss” has no distance threshold. `nearAbove` and `nearBelow` are simply the closest available lines, regardless of whether they are remotely distant. Thus the run is a **nearest-line census**, not a bounded near-miss census. That may be exactly what is wanted diagnostically, but the terminology is imprecise.  

**P73–P87:** ties are resolved implicitly by first encountered POI line because the comparison is strictly `<`. If two lines have identical point distance, the lower array index wins. That is deterministic, but unstated. 

**P90–P95:** `P = _Point` is not itself validated. A pathological zero/invalid point size would make the final distance formatting unsafe. That is likely impossible in the stated MT5 environment, but the function has no local guard.

**P115–P117 / P123:** the diff-budget arithmetic is internally inconsistent, as noted above.

**P125–P130:** “zero unpredicted row kinds” is an output assertion, not a code invariant. The shown function guarantees the literal `RETESTDIAG` prefix but does not itself implement an allowlist against unexpected logging elsewhere. The run-side checker therefore has to be the real hard gate.

**P131–P134:** G3 correctly freezes the listed legacy families, but adding a new `[SRJ-EA] RETESTDIAG` line could contaminate any external parser that counts raw `[SRJ-EA]` records generically. The packet should explicitly state that such generic transport-line totals are not treated as legacy behavior deltas, while named legacy families remain frozen. 

**P135–P137:** G4 is deliberately observation-only, which is good, but “goal-identical” should be understood as **same observed take set**, not proof of causal restoration. The packet itself says the re-seed/formation fixes come later, so this should remain observational rather than diagnostic causality. 

**P149:** the distinction that exit figures are targets, never realized fills, is important and should remain enforced in any downstream comparison. 

---

## Analytic B — better mechanism

For the stated goal, I would make **one structural improvement in E2a/E2b** rather than duplicating the RETESTBOOK logic:

Have `ShadowRetestBook()` return its `nHits` (or an equivalent boolean/count), then pass that result into `ShadowRetestNearMiss(barShift, nHits)`.

That would give one authoritative body-rule evaluation and eliminate any future divergence between “book found nothing” and the diagnostic's interpretation of the same bar. The relevant touch logic is currently in P461–P473, while the diagnostic is separately reconstructing wick-range membership at P078–P087.  

For **this v1 packet**, though, I would **not** add that refactor. It expands the diff and defeats the stated “void-truth plus near-miss prints, zero behavior change” constraint. Keep v1 as instrumentation and carry the shared-result mechanism into v2.

### Final disposition

**A: AMEND-WITH-DELTA** — correct the diff budget, reconcile the RETESTDIAG semantics, and explicitly define the shadow-gate scope; then the stated one-build/one-run envelope is coherent.

**B: DAY_CLOSE-minus-5 outranks POI_BODY_BREAK, mean-reversion scope only.**

**No additional strategy-logic change is warranted by this page.**

## V233 END LUNA (verbatim close, nothing appended)

## V234 (v233 round: relay B4868491, packet D8036144) - LUNA verbatim, filed whole 1x

## Verdict: **AMEND-WITH-DELTA**

The packet is close to clear, and I do **not** see a code change in E1/E2 that inherently changes EA behavior. The blocking issues I see are **page-internal specification / acceptance inconsistencies**, not a reason to halt the diagnostic concept.

### 1. RECON53 baseline identity is inconsistent — blocking

The packet identifies the pre-build tree / RECON53 context with `0C913372...` at L27, and the Stage-1 and novel-evidence sections again refer to RECON53 as that tree.   

But the acceptance header says:

> “RECON53 7EA459D8”

at L293. 

That leaves the comparison baseline ambiguous. G2/G3 are explicitly graded against the baseline, so this should be made one canonical identifier.

**Required delta:** either change L129/P129 to the canonical `0C913372...` reference, **or explicitly define `7EA459D8` as the RECON53 replay artifact corresponding to that tree**.

---

### 2. Packet line-count contradiction — blocking for a mechanically gated packet

L27 says the packet is **163 lines**. 

The TWIN explicitly enumerates **P001–P163**, with P163 at the end.  

But P163 itself says:

> “End of file - total 152 lines”

L361. 

Those cannot all be true simultaneously.

**Required delta:** make the packet's stated total line count internally consistent everywhere. Given L27 and the P001–P163 enumeration, **152 looks like the stale number**, but the page should not silently assume that.

---

### 3. “Censuses unchanged” conflicts with the declared new diagnostic census

L49 says seed/selection/suppression/booking/**censuses**/etc. are all unchanged, while L50 immediately introduces `RETESTDIAG` as a new diagnostic row, and L40–L45 specifically describe it as a nearest-line census.  

This is obviously intended to mean the **existing behavioral/production censuses** remain unchanged, but the literal wording is broader than that.

**Required delta:** replace “censuses unchanged” with something like **“existing production/behavioral censuses unchanged; RETESTDIAG is the sole new diagnostic census.”**

---

### 4. The D1/D2/D3 references are under-specified

G2 says:

> “D1/D2/D3 bars re-attributed with the new fields”

and L137 says their attribution is part of acceptance. 

But this page never actually defines which bars are D1, D2 and D3. J1–J9 are given, but there is no explicit D1→bar, D2→bar, D3→bar mapping. 

That means an independent seat can understand the mechanism but cannot reproduce the exact D1/D2/D3 grading from this page alone.

**Required delta:** enumerate D1/D2/D3 as exact bar timestamps, or remove their names from the hard acceptance condition and state that the post-run attribution is informational.

---

### 5. The run-date range should include the year

S5 says `08-26 to 09-10`, while the packet otherwise consistently uses 2026-dated events and the session itself is explicitly 2026-09-22. 

This is minor, but this packet is deliberately exact-diff / exact-envelope gated.

**Delta:** write `2026-08-26 to 2026-09-10`.

---

## E1 / E2 code assessment

The actual proposed edits are mechanically narrow.

E1 changes one `SEEDVOID` `PrintFormat` by appending `hi` and `lo`; the packet explicitly states that the prior arguments remain unchanged. 

E2a adds a new `ShadowRetestNearMiss()` function that:

* reads the existing POI buffer,
* records all lines inside `[low, high]`,
* finds the nearest line above and below,
* prints only,
* performs no state writes.  

E2b adds exactly one call immediately after `ShadowRetestBook(barShift)`, under the same outer debug/window/shadow gate. 

On the page presented, that supports the claimed **+42 new / +1 modified** arithmetic: E1 is one modified line with zero new lines, E2a is +41, and E2b is +1. 

I therefore see **no substantive behavior-changing defect in E1/E2 themselves**.

### One wording nuance in the E2 gating claim

The call is guarded by:

`InpDebugLog && (SHADOW_RETESTBOOK || SHADOW_CONFIRMPOLL) && inWindow`

while `ShadowRetestBook()` itself additionally requires `SHADOW_RETESTBOOK`.  

So when `SHADOW_CONFIRMPOLL=true` and `SHADOW_RETESTBOOK=false`, `ShadowRetestNearMiss()` can print even though no RETESTBOOK row is printed on that call.

That does **not** violate the literal requirement “RETESTDIAG beside every RETESTBOOK row,” because every actual RETESTBOOK emission still has the diagnostic call alongside it. But the packet also describes the diagnostic as being tied to RETESTBOOK rows, which is slightly broader/narrower depending on the intended semantics.

**Recommended delta:** make the scope explicit: either say **“RETESTDIAG runs whenever the combined shadow gate fires”** or change the call gate to `SHADOW_RETESTBOOK` if the intended unit is strictly RETESTBOOK rows.

---

## Better mechanism

For the stated goal, I would **keep the core mechanism** rather than refactor it.

The useful separation is already present:

`ShadowRetestBook()` = “what the existing body/contact rule accepted”

versus

`ShadowRetestNearMiss()` = “what the wick range actually touched / what lines were nearest.”  

That gives the intended diagnostic contrast without feeding new information into the production selector.

The one improvement I would make is purely structural: if a later packet needs to correlate both rows, emitting a shared bar identifier or a common monotonically defined diagnostic sequence would be more robust than relying entirely on timestamp joins. The current packet already says joins are by bar, so this is a **v-next refinement**, not a reason to reject this packet. 

---

## Acceptance grading from the page

**G1:** structurally clear as a proposed test condition, subject to the packet-count/baseline inconsistencies being fixed. 

**G2:** well specified at the mechanism level; the 76-void requirement, nearest-line fields, tie rule, and predicted-row constraint are concrete.  The D1/D2/D3 mapping gap remains.

**G3:** appropriately hard-gated and explicitly exempts the newly predicted diagnostic row from the production-behavior comparison. 

**G4:** clearly states the expected observation objective and that this packet itself restores nothing. 

### Final disposition

**AMEND-WITH-DELTA, then clearable.**

The required amendments are limited to the packet's internal accounting/baseline wording plus the D1/D2/D3 definition. I would **not** widen E1, E2a, or E2b beyond what is already written, and I would **not** alter seed, selection, booking, gate, SL, exit, or alert logic in this packet. The packet itself explicitly confines the work to EA diagnostics and makes the run prints-only. 

**Volunteered key:** none.

## V234 END LUNA (verbatim close, nothing appended)

## V235 (v234 round: relay 2122AE8D, packet 6D4772BF) - LUNA verbatim, filed whole 1x

## Verdict — **ACCEPT**

**PACKET_P-SEEDFIX-1 v3 is cleared by name for exactly one build plus one tester run under the stated envelope.** The clearance is for execution of the packet; G1–G4 remain **post-build/post-run acceptance gates**, not facts I am pre-certifying from the page.

### Why it clears

The edit set is sufficiently constrained for the stated “prints only / zero behavior change” objective.

**E1, P56–P60:** one existing `SEEDVOID` `PrintFormat` is widened only by appending `hi` and `lo`. The pre-existing arguments and prefix remain intact. The referenced `r2_hi/r2_lo` are already locals in the same block.

**E2a, P61–P105:** the added function is read-only. It:

* reads existing OHLC and existing POI-buffer data,
* performs no state mutation,
* performs no selection/booking/exit operation,
* emits only the new `RETESTDIAG` row under `InpDebugLog`.

**E2b, P106–P115:** one call line is added to the existing shadow/debug path. No new flag or production path is introduced.

The line-budget arithmetic is internally correct: **+41 new lines for E2a +1 new call line = +42 new lines; E1 is +1 modified line, not a new line; expected 11270 → 11312.** P119–P128 provide an appropriate exact-diff / hash / count / compile gate.

The code shown also matches the stated census semantics:

* P86–P91: lines inside `[low, high]` are treated as `inside`, including edge touches.
* P92–P95: nearest strictly-above / strictly-below lines are selected.
* The `<` comparison makes equal-distance ties resolve to the first encountered line.
* P97 handles the no-inside case with `"-"`.
* P102–P103 report neighbor distance in points.
* There are no visible state writes in E2a.

## G1–G4

**G1 — operative and well-defined.** The requested exact-diff, post-hash, line-count, and compile requirements are concrete enough to gate the build.

**G2 — operative, but it is a post-run observation gate.** The demanded fields are present in the edit design and the D1/D2/D3 attribution targets are explicitly mapped.

**G3 — operative and appropriately hard-gated.** The stable-prefix comparison for `SEEDVOID`, explicit treatment of `RETESTDIAG` as the sole predicted new row kind, and unchanged-value requirements for the enumerated behavioral kinds are coherent with the print-only design.

**G4 — operative but necessarily post-run.** “Same observed take set / takes 4” is an empirical acceptance condition, not something the packet can establish before execution.

## Analytic ask A — defects / gaps / imprecisions

### 1. Shadow-gate wording is slightly wider than the pairing claim

**Lines P40–P45, P64–P66, P107–P115.**

The call uses:

`InpDebugLog && (SHADOW_RETESTBOOK || SHADOW_CONFIRMPOLL) && inWindow`

while `ShadowRetestBook()` itself requires `SHADOW_RETESTBOOK`.

Therefore, with `SHADOW_CONFIRMPOLL=true` and `SHADOW_RETESTBOOK=false`, `RETESTDIAG` can print **without a RETESTBOOK row beside it**.

That does **not** violate the narrower statement “every RETESTBOOK row gets a diagnostic beside it”; it does make the wording “pairing holds” dependent on the actual RECON53 flag settings. This is a documentation/coverage gap, not a behavior-risk finding.

### 2. The packet does not explicitly state the two shadow-flag values

**P43–P45, P107, P111–P115, P129, P162.**

Because the new call's behavior depends on `SHADOW_RETESTBOOK` / `SHADOW_CONFIRMPOLL`, the envelope says “same settings as RECON53” but does not spell those two values out.

That is acceptable given the stated predecessor reference, but it is less self-contained than the rest of the packet. An operator reproducing only the page could not determine the expected pairing mode from v3 alone.

### 3. “Decides detector-silence mechanism” is stronger than the census alone proves

**P142–P145, especially P143–P144 and P164–P165.**

The nearest-line census can establish:

* a line was inside the wick range,
* or how near the nearest outside line was.

It does not, by itself, uniquely prove the causal mechanism for a missed detector result. Other prerequisites can still matter, including the body qualification, buffer availability/timing, swept-mask exclusion, or other eligibility predicates.

“Identifies/attributes the candidate detector-silence mechanism” would be more precise than “decides.”

### 4. `F3-first-firing proof` is undefined in this packet

**P166.**

“F3” has no definition, acceptance rule, or source mapping anywhere in the 170 packet lines. That makes this sentence non-self-contained.

It does not contaminate E1/E2 or G1–G3, so I treat it as a documentation imprecision rather than a clearance blocker.

### 5. G2's “all 76 voids” denominator is externally asserted

**P135–P139.**

The packet says 76 is the RECON53 denominator, but nothing in the shown material independently derives the 76. That is fine as a run-time reconciliation condition, but it is not a page-proven fact.

## Analytic ask B — better mechanism

For the stated goal, I would keep the code architecture essentially as-is. The only cleaner mechanism I see is to make the **pairing relation explicit at the call site**.

The most direct version would touch **P107–P115 / EA L7643–L7645** and make the diagnostic call use the same `SHADOW_RETESTBOOK` condition as the actual `ShadowRetestBook()` emission, e.g. placing `ShadowRetestNearMiss(barShift);` in the same gated block.

That would make “RETESTDIAG beside every RETESTBOOK row” structurally true instead of relying on the RECON53 flag combination.

I would **not** change the E2a census algorithm itself; the range/nearest logic is aligned with the stated diagnostic purpose.

### Bottom line

No page-level defect rises to a **halt** or to a required code correction for this print-only probe. The three substantive notes are documentation/coverage precision issues, while the actual E1/E2 edit set remains tightly fenced by the hard STAGE-1 and post-build gates.

**Volunteered key:** `LUNA-V235-P-SEEDFIX-1-ACCEPT-001`

## V235 END LUNA (verbatim close, nothing appended)
## V236 (v235 round: relay 2B609EFD, packet AFF07B27) - LUNA verbatim, filed whole 1x
**AMEND-WITH-DELTA**

The four behavioral changes are logically aligned with the stated rulings, and I see no reason to halt the packet outright. But the page has two exact-diff/budget defects and one material E2 implementation gap that should be amended before the one build/run.

### Required deltas

**1. E2b does not actually select the latest qualifying FVG.**
At **EA-equivalent ImbalanceMgr L444-L481, especially L467-L480; packet P63-P73**, every qualifying FVG overwrites `latestBiasFVGBar`:

```text
if(b2 && fvg3.startBar >= ... )
{
    latestBiasFVGBar = fvg3.startBar;
    latestBiasFVGIsFilled = fvg3.isFilled;
}
```

There is no `>` comparison against the currently selected bar. Thus the result depends on `g_imbalances` iteration order. A later list element can replace a newer FVG with an older one and invert the validity result.

**Amend P69 / the L467-L480 fallback condition** so assignment occurs only when the candidate is newer, e.g. by extending the condition with:

```text
&& (SrjIsNa(latestBiasFVGBar) || fvg3.startBar > latestBiasFVGBar)
```

That preserves the intended “latest FVG” semantics without adding another block.

**2. The stated EA addition count is wrong.**
From the literal edit set:

* E1a: **+4 new**
* E1b: **+0 new, +1 modified**
* E3: **+2 new, +1 modified**
* E4a: **+1 new, +1 modified**
* E4b: **+1 new, -1 deleted, +2 modified**

Therefore EA is **+8 new, -1 deleted, +5 modified**, not **+9 new, -1 deleted, +5 modified**.

This affects **P100 and P104**. The resulting EA line count is:

**11312 + 8 - 1 = 11319**, not 11320.

**3. The ImbalanceMgr budget is also wrong.**
**P059-P075** explicitly contain **16 inserted lines**, while **P100/P104** say `ImbalanceMgr +13`.

So, absent an actual rewrite of that hunk, the stated budget must be **+16**, not +13.

### Important secondary gap

**E1 confirmation evaluation has unintended diagnostic side effects.**
The new E1 logic at **P033-P034**, calling `IsConfirmationCandle()`, is not actually “locals only” as claimed by **P039**.

`IsConfirmationCandle()` at **EA L2162-L2203** mutates global N1 counters:

* `g_n1_vwapEq`
* `g_n1_pocEq`
* `g_n1_vwapInv`
* `g_n1_pocInv`
* `g_n1_vwapSurv`
* `g_n1_pocSurv`

So the new displacement probe can alter the existing N1 census even when no displacement occurs. It also evaluates both confirmation predicates while in **S2**, although the new behavior is only used by the S1 condition.

This does not appear to change order selection directly, but it **does violate the packet's stated “t78_* locals only” claim and can contaminate diagnostic counts**.

A cleaner mechanism is to make the confirmation evaluator side-effect-free for E1, or gate the new confirmation calls to the S1 branch only. The code to touch is **EA L2162-L2203** plus the E1 call site **P033-P034 / around L7532 onward**.

### Other imprecisions/gaps

**P105-G2:** “17:00 SHORT take exists at 17:00 open” is clear enough, but the acceptance line would be stronger if it explicitly required the recorded entry price to equal the 17:00 candle open, since that is part of the confirmation-bar ruling.

**P106-G3:** the criterion mixes run evidence with a tester-blind code review: “pane display side verified by council code-read.” That is legitimate evidence, but it should be labeled separately from run-derived G3 evidence so the acceptance record does not imply the tester demonstrated pane state.

**P107-G4:** “DAY_CLOSE fires on every MEANREV trade held past its mark” is slightly broader than the actual code. The implementation requires `fillBarTime <= mark <= barTime`, i.e. the first evaluated bar at/after the 16:55 mark, with the trade already filled by that mark. The packet should use that precise formulation.

### Better mechanism for the stated goal

For E2b, the strongest minimal mechanism is the same “latest wins” test already used by the existing tick recompute logic at **ImbalanceMgr L467-L474**: explicitly compare `startBar > latestBiasFVGBar`.

For E1, the cleaner architecture is a pure confirmation evaluator returning `{bool confirmed, string failTerm}` with **no global counter mutation**, while the existing census-owning path remains solely responsible for N1 accounting. That keeps selection logic and diagnostic accounting orthogonal.

### Verdict

**AMEND-WITH-DELTA — no halt.**

The substantive four-fix design can proceed, but the amendment should at minimum:

1. Fix E2b latest-selection logic at **P69 / ImbalanceMgr L467-L480**.
2. Correct EA budget in **P100/P104** from **+9/-1/+5** to **+8/-1/+5**, with post-build EA **11319**.
3. Correct ImbalanceMgr budget in **P100/P104** from **+13** to **+16**.
4. Clarify or isolate the E1 `IsConfirmationCandle()` N1-counter side effects at **EA L2162-L2203**.

**Volunteered Luna key:** `LUNA-V235-PVNEXT1-AMEND-E2B-01`

No build, run, commit, or money action is cleared by this verdict alone.
## V236 END LUNA (verbatim close, nothing appended)
## V237 (v236 round: relay BFB2FCBC, packet D5796339) - LUNA verbatim, filed whole 1x
## Luna verdict: **AMEND-WITH-DELTA**

I would **not clear PACKET_P-VNEXT-1 v2 by name yet**. The behavior set is otherwise coherent, but there is one definite code-scope defect plus several grading/semantic gaps that should be folded before a build/run clear.

### Required delta 1 — E2a is not actually scoped to 2xOB

**Packet:** P048–P066
**Code:** Panels `SRJ_RenderBiasPane`, E2a condition at P050 / around L236–237.

The packet explicitly says:

> “Pane fallback scoped to the 2xOB blank evidence; non-2xOB else-branch keeps primary-only.”

But the inserted condition is:

```cpp
if(!fvgExistsForDisplay && !fvgExistsNow && !g_s.isInitialFlipBar && g_imbalances.Total() > 0)
```

There is **no `g_s.isDoubleOB` guard**.

Because this fallback sits **after** the `if(g_s.isDoubleOB) ... else ...` completes, it also executes when `isDoubleOB == false`. In that case, a failed primary-only search can be replaced by the new live-structure search.

That contradicts P021/P027 and the DELTA statement that the fallback is limited to 2xOB blank evidence.

**Minimal fix at P050:**

```cpp
if(g_s.isDoubleOB && !fvgExistsForDisplay && !fvgExistsNow &&
   !g_s.isInitialFlipBar && g_imbalances.Total() > 0)
```

This is a same-hunk correction and does not enlarge the intended behavior surface.

---

### Required delta 2 — G2 asks for a field that SIDE1C does not print

**Packet:** P126 / G2
**Code:** EA L7521–7560 and L7478–7507.

G2 requires:

> “SIDE1C displace row fires at least 1 ... `wouldPreempt=0` expected on the S1 displace”

But `SIDE1C_PREEMPT` at L7549–7558 does **not** print `wouldPreempt`.

The `wouldPreempt` field exists in the earlier `SIDE1H_WOULDPREEMPT` diagnostic at L7493–7501:

```text
wouldPreempt=%d
```

So the current G2 wording is not mechanically checkable against the stated SIDE1C row.

I would **not add another behavior write just for this**. Amend G2 wording to grade:

* `SIDE1C_PREEMPT` exists for the 16:55 S1 displacement, and
* the corresponding `SIDE1H_WOULDPREEMPT` row has `wouldPreempt=0`.

That preserves the seven-EA-hunk budget and the existing diagnostics.

---

## Other defects / gaps / imprecisions

### 3. E1's “source order prevents same-bar re-see” is not itself a guard

**Packet:** P020, P047
**Code:** EA L7521–7560 plus confirmation consumer at L2162–2203.

The transfer leaves:

```cpp
g_state = ST_S1_REGIME
```

and changes:

```cpp
g_anchorLine = t78_pr.topLine;
g_dir           = t78_dir;
```

The packet says source order prevents downstream S1 logic from re-seeing the new anchor on the same bar.

**Source order alone does not establish that invariant.** It only establishes that the transfer occurs before later code. Since the new anchor and direction are immediately live, a later S1 confirmation consumer could theoretically consume the newly transferred anchor again unless it has its own same-bar exclusion.

I am treating this as a **gap requiring an explicit invariant**, not a proven runtime defect from the page.

A stronger mechanism is a local `s1cTransferredThisBar` flag or an equivalent anchor-bar identity guard that explicitly suppresses downstream S1 consumption for that bar.

---

### 4. E1 held-candidate confirmation can be alias-sensitive around POIREPLACE

**Packet:** P031–P047
**Code:** EA L7478–7560.

`t78_heldConf` is calculated from:

```cpp
IsConfirmationCandle(barShift, g_anchorLine, g_dir, t78_failHeld);
```

but the transfer is deliberately placed **after** the POIREPLACE section.

The packet excludes EA L7508–7520 from the supplied region. Therefore the page does not establish that POIREPLACE leaves `g_anchorLine/g_dir` untouched before `t78_heldConf` is evaluated.

If POIREPLACE can mutate either value, `t78_heldConf` is no longer necessarily testing the originally held candidate.

Best mechanism: snapshot the held anchor/direction before any intervening mutation, then use that snapshot for the held confirmation test.

---

### 5. E1's temporal wording is internally ambiguous

**Packet:** P009, P020
**Code:** `IsConfirmationCandle()` at EA L2162–2203.

The function explicitly treats:

```cpp
barShift + 1
```

as the retest candle and:

```cpp
barShift
```

as the body candle.

But P009 says the “confirmation candle and the candle that did the latest POI retest was 16:55,” with entry on 17:00.

Those statements need one explicit index mapping. Otherwise a reviewer cannot tell from this page alone whether a 16:55 election should test 16:50 + 16:55, or 16:55 itself as the retest/confirmation event.

I would amend the ruling text with the exact chronological mapping before build rather than infer it.

---

### 6. E2b is internally consistent, but its “latest” rule is only latest by `startBar`

**Packet:** P067–P084
**Code:** ImbalanceMgr L444–481.

The new fallback correctly mirrors the primary max-selection with:

```cpp
fvg3.startBar > latestBiasFVGBar
```

That is good.

The remaining semantic point is that “latest” is specifically **latest `startBar`**, not latest detection time/object creation time. The existing primary pass uses the same criterion, so this is not a new inconsistency; it is just worth noting as the operative definition.

---

### 7. E3 is correctly routed, but G4 deliberately mixes operative and geometric labels

**Packet:** P022, P128
**Code:** EA L11143–11274.

The actual precedence change is clean:

```cpp
!vBREAK && !isMeanRev
```

and `vDAY` remains below BREAK/HTF in the code.

For MEANREV trades, HTF is not populated by this branch, so DAY can become the operative exit after BREAK suppression.

The remaining imprecision is grading language: `EXITCENSUS` may still print `BREAK` while the operative exit is `DAY_CLOSE`. That is intentional per P128, but G4 should continue to distinguish **geometric census label** from **operative `MTEXIT` reason**. The packet mostly does this correctly already.

---

### 8. G4's `EXITVERDICT` does not expose `vDAY`

**Code:** EA L11270–11290.

`EXITVERDICT` prints `vSL`, `vTP`, `vBREAK`, and `vHTF`, but not `vDAY`.

So the claim “DAY_CLOSE fires” is ultimately established by `MTEXIT reason=DAY_CLOSE`, not by a directly printed `vDAY=1`.

This is not a behavior bug, but it is a small instrumentation imprecision in G4.

---

### 9. “Seven EA hunks” does not reconcile cleanly with the named edit hunks

**Packet:** P003, P121, P133.

The named code edits appear to be:

* E1a
* E1b
* E3
* E4a
* E4b
* E4c

= **six** obvious EA edit groups, versus the repeatedly stated **seven EA hunks**.

The byte-budget arithmetic itself (`+13 -2`) is independently stated and appears internally coherent, so this is not a line-count defect. It is a packaging/counting imprecision that should be reconciled before STAGE-1.

---

## Better mechanism for the stated goal

### E2: make the scope impossible to drift

Instead of relying on placement, make the scope explicit in the condition:

```cpp
bool allowPaneFallback =
   g_s.isDoubleOB &&
   !fvgExistsForDisplay &&
   !fvgExistsNow &&
   !g_s.isInitialFlipBar &&
   g_imbalances.Total() > 0;
```

Then perform the existing search under `allowPaneFallback`.

**Touches:** Panels around L236–237 / P048–P066.

That directly encodes the packet's stated limitation.

### E1: snapshot before mutable replacement

Before POIREPLACE can affect the held setup, snapshot:

```cpp
int heldAnchor = g_anchorLine;
ENUM_SRJ_DIR heldDir = g_dir;
```

Use those for `t78_heldConf`, then set the new anchor/direction only after the displacement decision.

Also carry an explicit same-bar transfer marker into the downstream S1 confirmation consumer.

**Touches:** EA L7478–7560 and the downstream S1 confirmation gate around the L7680/L8770-area consumers referenced by the packet.

That makes “confirmed opposite displaces unconfirmed held” a direct invariant rather than a source-order assumption.

---

## Bottom line

**AMEND-WITH-DELTA.**

The principal blocking defect is **E2a P050: the fallback is currently broader than the packet says it is**. The second required correction is **G2's `wouldPreempt=0` grading statement**, because that value is not printed by `SIDE1C_PREEMPT`.

The E1 same-bar re-see and held-anchor alias points are **open proof gaps**, not enough for a halt, but they should be made explicit before the behavior build because this packet is specifically trying to establish exact selection semantics.

**Volunteered Luna amend key:** `LUNA-V236-PVNEXT1-AMEND-E2A-G2-01`

This is an **amend identifier, not a build/run clearance key**. No build/run clear on v2 as currently written.
## V237 END LUNA (verbatim close, nothing appended)
## V238 (v237 round: relay 5F1FCBCA, packet 3EEBBCEE) - LUNA verbatim, filed whole 1x
## Verdict: ACCEPT

The v237 page is internally coherent enough to clear the named packet for **one STAGE-1-gated behavior build plus one tester run**, subject to the packet’s own on-machine S1–S5 checks. The packet explicitly keeps the action alert-only, requires the dual-key/run-word/token path, and says the verdict itself does not build, run, commit, or move funds. 

The four requested behavior changes are expressed as concrete code deltas rather than prose-only intent:

* **E1:** S1 opposite-confirmed retest can displace an unconfirmed held anchor; held-confirmed wins the tie. The new confirmation locals are hoisted so the widened transfer condition can consume them. 
* **E2:** pane fallback is constrained to the stated 2xOB case, while state fallback searches live structure and selects by `startBar` rather than detection time. 
* **E3:** the mean-reversion fork suppresses the operative body-break path so DAY decides, while the geometric census remains instrumentation. 
* **E4:** veto clearing/fire are re-keyed to direction, with the S4 site intentionally retaining day-only clearing as documented. 

### Why I am not issuing an amend or halt

The stated stage arithmetic is consistent: EA `+14 new -2 deleted = +12`, taking 11,312 lines to 11,324, with 10 modified lines; Panels and ImbalanceMgr carry their separate +17/+16 additions. The packet also makes the exact-diff, hashes, compile, and run checks explicit. 

The acceptance target is also properly framed as **behavioral evidence**, not a claim that those outcomes already happened: G2 covers the 16:55 displacement/17:00 take and 10:40 refusal; G3 covers fallback/FRESHCOUNT changes; G4 covers operative DAY_CLOSE versus BREAK behavior on MEANREV trades. 

### Analytic ask A — defects / gaps / imprecisions

I see **two non-blocking technical imprecisions** on the page.

**1. E2 state fallback is narrower than the prose may imply.**
The fallback only executes when `latestBiasFVGBar` is still `NA`. Thus, if the faulty cached boundary happens to return *some* older qualifying FVG, the live-structure fallback will not run and cannot supersede that stale result. The stated mechanism is specifically “when the anchor-gated search finds nothing,” so this is not a contradiction of the literal v237 rule, but it is a remaining edge case against the broader phrase “never-default-past-live-evidence.” The relevant fallback and latest-selection logic are quoted at P069–P085. 

**2. E2 uses two different notions of the FVG bar between pane and state paths.**
The pane fallback bounds on `detectionBar`, while the state path explicitly uses `startBar` as the operative/latest definition. That is probably intentional because the pane is display-only, but the packet could state the distinction more explicitly to avoid a future reviewer reading “latest means startBar” as applying identically to both paths. 

Neither is sufficient for an amend because both are explicitly bounded by the packet's stated v237 scope, and neither invalidates G1–G4 as written.

A smaller wording issue is that E1 adds a new `SIDE1C_PREEMPT` **print family** while the scope says “no new alert kinds”; the code shown makes it an `InpDebugLog` print, not a new `EmitAlert`, so the substance is consistent but the terminology could be sharper. 

### Analytic ask B — better mechanism

For the stated E2 goal, the cleaner long-term mechanism would be a single helper that performs the **live-structure max-by-`startBar` selection** and returns both existence and filled state, then have the pane and state paths call it with their respective display/state gates. That would touch the current E2a/E2b regions only and eliminate the `detectionBar`/`startBar` semantic split. I would **not** add that refactor to v237; it belongs in the parked v-next thread unless the run proves the two paths diverge materially.

### Key

**Volunteered Luna key:** `LUNA-V237-P-VNEXT-1-ACCEPT-001`

So the seat outcome is **ACCEPT**, with the packet proceeding only through its already-stated dual-key + run-word + token controls; no build/run/commit action is authorized by this message alone. The packet itself makes that separation explicit.
## V238 END LUNA (verbatim close, nothing appended)

## V239 OPEN LUNA (relay v238-EXITRANK, filed whole 1x this turn)

Luna:
**Discrepancy.**

The proposed predicate itself is correct for the stated rule, but the packet has two important technical imprecisions that prevent a clean “yes” as written.

### Core gate

At **L11223-L11224**, replacing the mean-reversion gate with:

```cpp
if(isTrigger && behind && through && !vBREAK &&
   g_mtrade.anchorLine >= 0 && g_mtrade.anchorLine < POI_NLINES &&
   g_authorityRank[k] < g_authorityRank[g_mtrade.anchorLine])
```

correctly implements:

* **same line:** equal rank → `false` → no body-break exit;
* **higher-authority break:** lower rank number → `true` → body-break exit;
* **lower-authority break:** higher rank number → `false` → no body-break exit.

The authority table at **L91-L105** is internally consistent with that comparison: rank 2 Y-POC, rank 10 D-POC, rank 11 D-VWAP, etc.

So the three named relationships are logically correct:

* **9/4:** Y-POC anchor rank 2, Y-POC break rank 2 → **hold**.
* **8/28:** D-VWAP anchor rank 11, D-POC break rank 10 → **exit**.
* **9/8 17:00:** M-POC anchor rank 6, M-POC break rank 6 → **hold**.

The direct `vSL`, `vTP`, `vHTF`, and `vDAY` code is not textually modified outside the proposed deletion/replacement in **L11151-L11303**. However, their **reachability can change**, because `vBREAK` is now true for fewer cases. In particular, a suppressed same-line/lower-authority break no longer blocks the HTF/DAY legs. That is a consequence of the requested priority change, not a change to their internal algorithms.

### Defect / gap 1 — EXITCENSUS does not use the new rank gate

This is the clearest defect.

The `EXITCENSUS` logging still uses the raw physical-break test:

```cpp
(isTrigger && behind && through) ? "BREAK" : "ok"
```

rather than the new anchor-rank-qualified test.

So after the proposed change, a same-line event can produce:

```text
EXITCENSUS ... verdict=BREAK
```

while `vBREAK == false` and the trade does **not** exit.

Therefore the statement that the intended census change is “verdict flips” is not implemented by the proposed two-line replacement at **L11223-L11224**. The census remains an observation of **body crossing**, not a verdict of **eligible exit**.

That also means the requested “same-line census verdict” behavior cannot be obtained from this patch as written.

### Defect / gap 2 — “only same-line rows change” is broader than the actual predicate

The new rule does not merely suppress same-line breaks.

It also suppresses **every lower-authority break**:

```text
break rank > anchor rank
```

The old gate accepted those whenever `isMeanRev == false`; the new gate rejects them.

So the code change at **L11223-L11224** necessarily changes more than same-line cases if such lower-authority body-breaks occur.

For the three named examples, that broader effect is invisible because the examples are:

* equal → old exit / new hold;
* higher → old exit / new exit;
* equal → old exit / new hold.

But as a statement about the mechanism, “verdict flips confined to same-line rows” is too strong.

### Defect / gap 3 — the 8/28 supplied rows do not show the firing-bar census

The 8/28 evidence gives:

* anchor: **Daily-VWAP**, rank 11;
* actual MTEXIT: **Daily-POC**, rank 10.

That is sufficient to establish the **rank relationship**.

But the supplied `EXITCENSUS` row is the **11:35** row showing Daily-POC as `ahead` / `ok`, while the actual exit is **11:40**.

So the excerpt does not show the actual 11:40 `behind && through` census row. The conclusion that the proposed gate preserves that exit is logically valid from the recorded exit line + authority table, but the supplied row set does not independently demonstrate the firing-bar predicate.

This is an evidence gap, not a rank-comparison defect.

### Defect / gap 4 — 17:00 has the same evidence asymmetry

The 17:00 case has:

```text
anchor=Monthly-POC
MTEXIT ... reason=POI_BODY_BREAK line=Monthly-POC
```

which establishes the same-line identity.

But there is no corresponding `EXITCENSUS` / `EXITVERDICT` row in the supplied excerpt showing the actual body crossing and the absence of a higher-authority qualifying break on that bar.

Again, the **rank rule is correct**, but the supplied raw rows are not a complete runtime proof of the post-patch hold.

### No defect in the actual rank comparison

I do **not** see an off-by-one, reversed inequality, or same-line leakage at **L11223-L11224**.

The strict `<` is exactly what the stated rule requires. `<=` would be wrong; the proposed `<` is right.

The anchor bounds check also prevents invalid `anchorLine` from producing an accidental ranked break.

### Better mechanism

For the stated goal, I would make the rank-qualified break a **single named boolean** and use that same boolean for both the census and the exit decision.

The relevant code is the POI loop in **L11151-L11303**, especially the existing census block immediately preceding **L11223-L11224**.

Conceptually:

```cpp
bool anchorRankValid =
   g_mtrade.anchorLine >= 0 &&
   g_mtrade.anchorLine < POI_NLINES;

bool rankBreak =
   isTrigger &&
   behind &&
   through &&
   anchorRankValid &&
   g_authorityRank[k] < g_authorityRank[g_mtrade.anchorLine];
```

Then use `rankBreak` for:

```cpp
EXITCENSUS ... verdict
```

and:

```cpp
if(rankBreak && !vBREAK)
```

That gives one source of truth: a row cannot say `BREAK` while the actual exit gate says “not a break.” It would touch the POI-loop logic around the existing `EXITCENSUS` block and **L11223-L11224**, while leaving the SL/TP/HTF/DAY implementations untouched.

**Bottom line:** **the rank comparison is correct, but the packet is not internally clean enough for an unconditional YES because the census still reports unranked physical breaks, and the “only same-line verdict changes” statement does not exactly describe the new predicate.**

## V239 END LUNA (verbatim close, nothing appended)

## V240 OPEN LUNA (relay v239-EXITRANK, filed whole 1x this turn)

Luna:
**DISCREPANCY**

The **rank predicate itself is logically correct** for the three cited rank cases, but the packet has a **line-targeting defect** and one **semantic gap around “hold.”**

### A — defects, gaps, and imprecisions

**1. The stated replacement range is wrong. This is the concrete blocking defect.**

In the supplied code, the existing E3 gate is:

* **L11220** — E3 gate comment
* **L11221** — `if(isTrigger && behind && through && !vBREAK && !isMeanRev)`
* **L11222** — `{`
* **L11223** — `vBREAK = true;`
* **L11224** — `breakLineVal = L;`
* **L11225** — `breakLineName = g_lineCode[k];`
* **L11226** — `}`

Those line numbers come from counting the code exactly as supplied with its blank lines.

The packet says:

> “REPLACE EA L11223-L11224 with [comment + new if]”

That would replace the **`vBREAK = true` and `breakLineVal = L` assignments**, not the old gate. The resulting code would no longer set `vBREAK`, while the existing `breakLineName = ...` at L11225 would remain. That does **not** implement the proposed mechanism.

So the intended replacement target must be the actual **gate lines**, i.e. the E3 comment + `if`, not L11223-L11224.

There is a second line-numbering inconsistency here: the packet calls the E3 declaration L11157-L11158, which matches a **blank-line-stripped** count, whereas the stated function span **L11151-L11303** matches the supplied text with blank lines counted. Under the blank-line-stripped count, the gate is approximately **L11220-L11221**, not L11223-L11224. The packet therefore does not have one internally consistent line-numbering convention.

**2. The three rank comparisons themselves are correct.**

With lower number = higher authority:

* **9/4:** Y-POC rank **2** vs Y-POC rank **2** → `2 < 2` is false → body-break does not set `vBREAK`.
* **8/28:** D-VWAP anchor rank **11** vs D-POC break rank **10** → `10 < 11` is true → `vBREAK` fires.
* **17:00 / 17:05:** M-POC rank **6** vs M-POC rank **6** → false → body-break does not set `vBREAK`.

Thus the actual proposed expression:

```cpp
g_authorityRank[k] < g_authorityRank[g_mtrade.anchorLine]
```

implements the stated **higher-authority break only** rule for those instances.

**3. “Hold” needs to be distinguished between `vBREAK`-hold and final trade-hold.**

The rank gate only suppresses **`vBREAK`**. It does not guarantee that the managed trade remains open.

The downstream chain is explicitly:

* **HTF eligibility:** L11231 requires `!vBREAK`
* **DAY eligibility:** L11252 requires `!vBREAK && !vHTF`
* final close selection: L11275-L11279

Therefore, when a same-line/lower-authority break is rejected, the trade becomes eligible for later exits.

This matters especially for the **17:05** case. With the proposed rank gate, the M-POC body break is held (`vBREAK=false`), but the day-close rule at **L11252-L11256** can then fire because the trade filled at 16:55 and the 16:55 mark lies within the bar interval. Consequently, “17:00 hold” is accurate only if it means **“hold the body-break verdict”**, not **“the managed trade remains open.”**

The same qualification applies to 9/4: suppressing the Y-POC body break makes HTF evaluation eligible at **L11231**, so the supplied census rows alone do not prove that the final 9/4 managed-trade verdict is “no exit.”

**4. The downstream legs are textually unchanged, but their eligibility can necessarily change.**

The packet's claim that there is “no other behavior change to SL/TP/HTF/DAY legs” is correct only in the narrow sense that their predicates/code are untouched.

SL/TP remain upstream and unchanged.

But changing `vBREAK` from true to false necessarily changes whether:

```cpp
!vBREAK
```

is satisfied in the HTF and DAY gates. So downstream **execution behavior** can change in exactly the cases where the new rank rule suppresses a break. That is an intended consequence, not an accidental code mutation, but the wording should distinguish **“leg predicates unchanged”** from **“final leg outcomes unchanged.”**

**5. Invalid/unset `anchorLine` has an unspoken fallback.**

The new predicate requires:

```cpp
g_mtrade.anchorLine >= 0 &&
g_mtrade.anchorLine < POI_NLINES
```

If `anchorLine` is invalid, the body break is suppressed.

That may be correct if the project invariant is “every managed trade has a valid anchor,” but the packet does not state that invariant here. Without it, invalid-anchor cases become an additional behavior class beyond the enumerated same-line/lower-authority/MEANREV classes.

The cleanest treatment is either to state that a valid anchor is an invariant, or explicitly define invalid-anchor behavior.

**6. The census remains geometrical, not authoritative, after this change.**

At the census verdict line, **L11219**, the row still prints:

```cpp
(isTrigger && behind && through) ? "BREAK" : "ok"
```

That is unaffected by rank.

So a same-line Y-POC crossing can still produce an `EXITCENSUS ... verdict=BREAK` even though the trade-level `vBREAK` is false and no `MT_EXIT_POI_BODY_BREAK` is generated.

That is consistent with your stated “census rows unchanged by design,” but the word `BREAK` is now a **geometric break classification**, not an accepted exit. The packet should keep that distinction explicit when interpreting the logs.

**7. The diagnostic invalid counter has the same semantic issue.**

At **L11207-L11208**, `g_n1_exitBodyInv` increments from:

```cpp
isTrigger && behind && through
```

without considering the new authority gate.

Therefore a same-line or lower-authority geometric break that is now intentionally **held** can still be counted as a BREAK coincidence by that instrumentation. That is not a trade-verdict error, but it means the counter's name/interpretation must not be treated as “invalid final exit under the new rule.”

### Named-instance verdict

| Instance | Anchor      | Break      | Rank test      | `vBREAK`            |
| -------- | ----------- | ---------- | -------------- | ------------------- |
| 9/4      | Y-POC = 2   | Y-POC = 2  | `2 < 2` false  | **hold**            |
| 8/28     | D-VWAP = 11 | D-POC = 10 | `10 < 11` true | **exit**            |
| 17:05    | M-POC = 6   | M-POC = 6  | `6 < 6` false  | **hold body-break** |

So **the comparison mechanism is right; the packet's patch coordinates are not.**

### B — better mechanism

For the stated goal, **no materially different mechanism is necessary**. The direct rank comparison is the minimal and correct mechanism.

One small robustness improvement would be to make same-line identity explicit rather than relying on the current authority table's unique ranks:

```cpp
if(isTrigger && behind && through && !vBREAK &&
   g_mtrade.anchorLine >= 0 &&
   g_mtrade.anchorLine < POI_NLINES &&
   k != g_mtrade.anchorLine &&
   g_authorityRank[k] < g_authorityRank[g_mtrade.anchorLine])
```

That would touch only the **body-break gate** (the actual gate currently at L11221 under the supplied physical-line numbering). It is not required with the present unique 0–11 authority table; it merely makes “same line” a literal identity condition rather than an equality-of-rank consequence.

**Bottom line:** **DISCREPANCY** — accept the **rank logic**, but do **not** accept the packet as transport/build-ready until the replacement line range is corrected and the meaning of “hold” is made explicit.

## V240 END LUNA (verbatim close, nothing appended)

## V241 OPEN LUNA (relay v240-EXITRANK, filed whole 1x this turn)

Luna:
YES.

For the stated predicate, the patch correctly implements the requested rank rule:

| Instance         |     Anchor rank | Broken-line rank | Proposed gate    | Result   |
| ---------------- | --------------: | ---------------: | ---------------- | -------- |
| 2026-09-04 16:10 |  Yearly-POC = 2 |   Yearly-POC = 2 | `2 < 2` = false  | **HOLD** |
| 2026-08-28 11:40 | Daily-VWAP = 11 |   Daily-POC = 10 | `10 < 11` = true | **EXIT** |
| 2026-09-08 17:05 | Monthly-POC = 6 |  Monthly-POC = 6 | `6 < 6` = false  | **HOLD** |

The authority table at InitAuthorityTable L91-L105 is consistent with the comparison: lower numeric rank means higher authority. The proposed condition at **L11223-L11224** therefore means exactly “candidate break is strictly higher-authority than the admission anchor.” Same-line and lower-authority breaks do not set `vBREAK`.

The SL/TP logic is outside the changed predicate, and the HTF/DAY blocks remain structurally unchanged. `EXITCENSUS` also remains the raw mechanical body-break census, so a census row can still say `verdict=BREAK` while the ranked exit verdict rejects that break; that is consistent with the stated instrumentation design.

### Analytic ask A — defects, gaps, imprecisions

**1. The admission invariant is assumed, not enforced locally.**
**L11223-L11224** guards `g_mtrade.anchorLine >= 0 && g_mtrade.anchorLine < POI_NLINES`, which is safe, but an invalid anchor silently converts an otherwise qualifying body break into a non-exit. Under the filed invariant this cannot happen, so it is not a defect in the intended state space; it is a dependency. The invariant needs to be guaranteed at admission, not merely assumed at this gate.

**2. “No other behavior change to HTF/DAY legs” is slightly too strong as wording.**
The HTF and DAY predicates themselves are unchanged, but they both depend on `!vBREAK`. Therefore, a newly admitted higher-authority `vBREAK` can necessarily suppress HTF and/or DAY on that bar. This is an intended priority-chain consequence of changing `vBREAK`, not an independent change to those legs. So the precise statement is: **no direct predicate/code change to SL/TP/HTF/DAY; downstream priority outcomes may change when `vBREAK` changes.**

**3. The MEANREV amendment is not exercised by the supplied rows.**
The semantic change created by deleting **L11157-L11158** and changing **L11223-L11224** is specifically that MEANREV no longer gets the unconditional E3 suppression. None of the supplied named rows demonstrates a MEANREV trade with a higher-authority break. The page itself labels this “MEANREV-unexercised,” so this is a testing gap, not a logic defect.

**4. The validity guard can mask an invariant violation.**
Related to item 1, the proposed condition fails closed. That is preferable to an out-of-bounds access, but there is no diagnostic here saying “invalid anchorLine.” If the invariant were ever violated, the observed symptom would simply be “no body-break exit.” An admission-time assertion/diagnostic would make that failure mode much easier to detect.

**5. Multiple qualifying higher-authority lines are not explicitly ranked for attribution.**
**L11223-L11224** changes eligibility using authority rank, but `!vBREAK` means the first qualifying line encountered in the `k` loop wins the recorded `breakLineName` / `breakLineVal`. The supplied authority table appears ordered in the same sequence as the POI indices, so the practical result is presumably the highest authority first, but that relationship is implicit rather than enforced by this gate. The exit/no-exit verdict itself is unaffected by that issue.

**6. The “same-line” statement is correct only in the anchor-index sense.**
**L11223-L11224** implements same-line hold by comparing `g_authorityRank[k]` with `g_authorityRank[g_mtrade.anchorLine]`. That is correct provided `anchorLine` is the canonical POI line index covered by the authority table. The filed admission invariant is therefore doing substantive semantic work here, not merely range validation.

**7. The census/exit distinction needs to remain explicit in interpretation.**
The unchanged `EXITCENSUS` rows can still emit `BREAK` for 9/4 and 17:05 even though the new gate yields `vBREAK=false`. That is correct by design, but treating `EXITVERDICT` / `MTEXIT` as the authoritative trade verdict remains essential — `EXITCENSUS verdict=BREAK` is a geometric classification. The supplied 9/1 witness is also consistent with the unchanged mechanics: its `bodyLo == L` equality keeps `through=false`, so the rank gate does not alter that survival path.

### Analytic ask B — better mechanism

For the stated goal, I do **not** see a materially better mechanism than the proposed direct rank comparison. It is the smallest semantic change and preserves the existing census, selection loop, and exit-priority chain.

The only worthwhile hardening would be to make the admission invariant explicit by caching the anchor rank once before the loop, then comparing candidates against that cached rank:

* anchor validation / rank acquisition immediately before the POI loop;
* the body-break condition at **L11223-L11224** becomes a simple candidate-rank comparison.

That would touch the same exit function plus the admission site where `anchorLine` is populated. It is not necessary for correctness under the filed invariant, and I would not enlarge this exact-diff packet for it.

**Bottom line:** the proposed **`g_authorityRank[k] < g_authorityRank[g_mtrade.anchorLine]`** gate is correct for same-line hold, lower-authority hold, and higher-authority exit, including the three named cases. The substantive caveats are the unexercised MEANREV branch, the externally enforced admission invariant, and the wording precision around downstream HTF/DAY priority effects.

## V241 END LUNA (verbatim close, nothing appended)

## V242 OPEN LUNA (relay v241-EXITRANK, filed whole 1x this turn)

Luna:
**DISCREPANCY.**

The proposed predicate itself is correct for the stated rank rule, but the phrase **“no other behavior change to SL/TP/HTF/DAY legs” is too broad** because the new rank gate changes whether `vBREAK` becomes true in MEANREV and therefore changes whether the existing HTF/DAY blocks are reached.

The intended rank comparison is correct:

```text
g_authorityRank[k] < g_authorityRank[g_mtrade.anchorLine]
```

given the stated convention that lower rank means higher authority. That produces the three named outcomes exactly: same rank → hold; higher-ranked break → exit; lower-ranked break → hold.

The filed examples also line up with that predicate: 9/4 Y-POC→Y-POC is rank 2=2, so hold; 8/28 D-VWAP→D-POC is 10<11, so exit; 9/8 M-POC→M-POC is 6=6, so hold.

### Analytic A — defects / gaps / imprecisions

1. **The “no other behavior change to HTF/DAY” statement is technically overbroad.**
   The old MEANREV gate explicitly prevented `vBREAK`; the proposed gate removes that condition. Once a qualifying MEANREV break sets `vBREAK`, the existing HTF block is skipped because it requires `!vBREAK`, and the DAY block is likewise skipped because it requires `!vBREAK`. That is an intentional consequence of making the rank-qualified break eligible, but it is still a downstream behavior change in those legs' execution/priority.

2. **“No other behavior change to SL/TP” is much stronger than what the page actually proves.**
   The proposed edit does not modify their predicates directly, so their own criteria remain unchanged. But the overall exit decision can still differ because `vBREAK` can now win before them. The packet should distinguish **predicate preservation** from **overall exit-outcome preservation**.

3. **The census semantics remain diagnostically broader than the actual exit semantics.**
   `EXITCENSUS` can print `verdict=BREAK` for an actual body crossing even when that line is same-authority or lower-authority than the anchor, while the proposed rank gate would correctly leave `vBREAK=false`. The packet acknowledges this, but “BREAK” in the census is therefore a **body-cross observation**, not an exit qualification.

4. **The valid-anchor assumption is essential but not demonstrated by the included code excerpt.**
   The gate correctly fails closed when `anchorLine` is invalid, but the relay only states the admission invariant that every managed trade has a valid anchor. The excerpt does not itself show the assignment/validation path that establishes that invariant. Under the explicitly filed invariant this is not a blocker, but it is a dependency of correctness.

5. **The gate preserves first-hit selection, not “highest-authority broken line” selection.**
   `!vBREAK` means the first qualifying `k` in the existing loop wins. The proposal does not search for the strongest qualifying broken line. That is fine **only because the stated goal is merely “any broken line outranking the anchor” and selection is intended to remain unchanged**. If “outranks” were intended to mean “select the maximally authoritative broken line,” this mechanism would be insufficient.

### Analytic B — better mechanism

For the stated goal, I would **keep the proposed mechanism** rather than introduce a second selector or alter census generation. The smallest behavior-preserving mechanism is exactly the rank predicate at the existing `vBREAK` fire site, with the existing `behind && through` conditions left intact. That confines the semantic change to eligibility of the break verdict while preserving the current loop/selection order and all upstream SL/TP/census calculations.

The one wording correction I would make before transport is:

> **“No direct predicate change to SL/TP/HTF/DAY; rank-qualified BREAK may now alter which existing priority branch wins.”**

That accurately describes what this patch does without understating the intentional MEANREV consequence.

## V242 END LUNA (verbatim close, nothing appended)

## V243 OPEN LUNA (relay v242-EXITRANK, filed whole 1x this turn)

Luna:
**DISCREPANCY.**

The proposed predicate itself is correct for the stated rank rule, but the phrase **“no other behavior change to SL/TP/HTF/DAY legs” is too broad** because the new rank gate changes whether `vBREAK` becomes true in MEANREV and therefore changes whether the existing HTF/DAY blocks are reached.

The intended rank comparison is correct:

```text
g_authorityRank[k] < g_authorityRank[g_mtrade.anchorLine]
```

given the stated convention that lower rank means higher authority. That produces the three named outcomes exactly: same rank → hold; higher-ranked break → exit; lower-ranked break → hold.

The filed examples also line up with that predicate: 9/4 Y-POC→Y-POC is rank 2=2, so hold; 8/28 D-VWAP→D-POC is 10<11, so exit; 9/8 M-POC→M-POC is 6=6, so hold.

### Analytic A — defects / gaps / imprecisions

1. **The “no other behavior change to HTF/DAY” statement is technically overbroad.**
   The old MEANREV gate explicitly prevented `vBREAK`; the proposed gate removes that condition. Once a qualifying MEANREV break sets `vBREAK`, the existing HTF block is skipped because it requires `!vBREAK`, and the DAY block is likewise skipped because it requires `!vBREAK`. That is an intentional consequence of making the rank-qualified break eligible, but it is still a downstream behavior change in those legs' execution/priority.

2. **“No other behavior change to SL/TP” is much stronger than what the page actually proves.**
   The proposed edit does not modify their predicates directly, so their own criteria remain unchanged. But the overall exit decision can still differ because `vBREAK` can now win before them. The packet should distinguish **predicate preservation** from **overall exit-outcome preservation**.

3. **The census semantics remain diagnostically broader than the actual exit semantics.**
   `EXITCENSUS` can print `verdict=BREAK` for an actual body crossing even when that line is same-authority or lower-authority than the anchor, while the proposed rank gate would correctly leave `vBREAK=false`. The packet acknowledges this, but “BREAK” in the census is therefore a **body-cross observation**, not an exit qualification.

4. **The valid-anchor assumption is essential but not demonstrated by the included code excerpt.**
   The gate correctly fails closed when `anchorLine` is invalid, but the relay only states the admission invariant that every managed trade has a valid anchor. The excerpt does not itself show the assignment/validation path that establishes that invariant. Under the explicitly filed invariant this is not a blocker, but it is a dependency of correctness.

5. **The gate preserves first-hit selection, not “highest-authority broken line” selection.**
   `!vBREAK` means the first qualifying `k` in the existing loop wins. The proposal does not search for the strongest qualifying broken line. That is fine **only because the stated goal is merely “any broken line outranking the anchor” and selection is intended to remain unchanged**. If “outranks” were intended to mean “select the maximally authoritative broken line,” this mechanism would be insufficient.

### Analytic B — better mechanism

For the stated goal, I would **keep the proposed mechanism** rather than introduce a second selector or alter census generation. The smallest behavior-preserving mechanism is exactly the rank predicate at the existing `vBREAK` fire site, with the existing `behind && through` conditions left intact. That confines the semantic change to eligibility of the break verdict while preserving the current loop/selection order and all upstream SL/TP/census calculations.

The one wording correction I would make before transport is:

> **“No direct predicate change to SL/TP/HTF/DAY; rank-qualified BREAK may now alter which existing priority branch wins.”**

That accurately describes what this patch does without understating the intentional MEANREV consequence.

## V243 END LUNA (verbatim close, nothing appended)

## V244 OPEN LUNA (relay v243-EXITRANK, filed whole 1x this turn)

Luna:
YES.

The proposed gate correctly implements the stated rank rule for the three named cases, using the authority table as given at **InitAuthorityTable L88-L105**:

* **9/4:** Yearly-POC rank **2** vs anchor Yearly-POC rank **2** → `2 < 2` is false → `vBREAK` stays false, so the same-line body cross does not fire.
* **8/28:** Daily-POC rank **10** vs anchor Daily-VWAP rank **11** → `10 < 11` is true → `vBREAK` fires and the existing `MT_EXIT_POI_BODY_BREAK` path remains selected.
* **17:00 / 9/8:** Monthly-POC rank **6** vs anchor Monthly-POC rank **6** → `6 < 6` is false → the body-break is suppressed; because the fill is at the 16:55 mark, the unchanged DAY chain can then fall through on the same bar. Thus the trade is not necessarily left open: the **BREAK is held, then DAY may close it**. That is consistent with the stated same-bar fall-through rule.

The critical implementation is exactly **EvaluateManagedTrade L11223-L11224**. The surrounding SL/TP/HTF/DAY predicates remain structurally unchanged within **L11151-L11303**, so the change is confined to the break qualification.

### Analytic ask A — defects / gaps / imprecisions

**1. “17:00 same-line hold” is imprecise if it means “trade remains open.”**
The rank gate suppresses `vBREAK`, but the unchanged DAY block can immediately set `vDAY` on that same bar. For the supplied 9/8 snapshot, fill=`16:55` and break bar=`17:05`, so the 16:55 day mark is inside the existing `fillBarTime <= mark <= barTime` test. The actual semantic is **same-line BREAK hold + DAY fall-through**, not necessarily an open trade.
**Lines:** gate **L11223-L11224**; DAY chain within **L11151-L11303**.

**2. The rank comparison is correct only because the current authority ranks are unique.**
`g_authorityRank[k] < g_authorityRank[g_mtrade.anchorLine]` implements “strictly higher authority” because the table assigns distinct ranks 0 through 11. If two distinct lines were ever assigned the same authority rank, this predicate would also reject a different line of equal authority, not merely the anchor itself.
**Lines:** authority table **L88-L105**; gate **L11223-L11224**.
This is not a current failure with the supplied table; it is a specification fragility.

**3. The shown proposal does not itself demonstrate the claimed enum-order assertion.**
The gate indexes `g_authorityRank[k]` and the census uses `g_lineCode[k]`, so the implementation depends on the POI buffer/enum indexing being the expected contiguous `0..POI_NLINES-1` mapping. The authority table is explicit by enum name, which is good, but the excerpt supplied here does not contain an explicit assertion of the underlying enum ordering.
**Lines:** authority table **L88-L105**; loop/gate **L11151-L11303 / L11223-L11224**.
Because you state the admission/index invariant is filed, this is a **verification gap on the page**, not grounds to reject the proposed predicate.

**4. Invalid `anchorLine` is fail-closed, but silently so.**
The bounds test in the proposed condition prevents an out-of-range access, which is safe. But if the stated admission invariant were ever broken, the result would be “no BREAK” and execution could fall through to HTF/DAY instead of exposing the upstream invariant violation. There is no visible local assertion/diagnostic in the proposed gate.
**Line:** **L11224**.
Again, not a present defect under the filed invariant; it is a robustness/diagnostic gap.

**5. `!vBREAK` makes the selected break line dependent on loop order.**
The boolean result is existential and correct for the stated rule, but once one qualifying higher-authority line sets `vBREAK`, later qualifying lines cannot replace `breakLineName`/`breakLineVal`. With the present authority table ordered 0→11 and the loop `k=0..POI_NLINES-1`, that happens to make the first qualifying line the highest-authority qualifying line. That equivalence depends on the enum/order relationship being maintained.
**Lines:** gate **L11223-L11224**; authority table **L88-L105**.

Nothing in the proposed predicate changes the SL/TP/HTF/DAY predicates themselves. The semantic change is the intended one: **equal-rank and lower-authority POI breaks no longer set `vBREAK`; higher-authority breaks still do; suppressed BREAKs then expose the unchanged later HTF/DAY legs.**

### Analytic ask B — better mechanism

A slightly stronger implementation would make the authority decision explicit and independent of loop ordering:

1. Validate `anchorLine` once and cache `anchorRank` before the POI loop.
2. During the loop, compute whether each candidate has `candidateRank < anchorRank`.
3. Track the **best qualifying rank** explicitly rather than relying on `!vBREAK` plus traversal order.
4. Optionally increment/log an invariant counter if `anchorLine` is invalid.

That would touch the declarations immediately before the POI loop and the gate at **L11223-L11224**, plus the assignment of `breakLineName/breakLineVal` within the same loop. The SL/TP/HTF/DAY sections need no change.

So the proposed two-line replacement is **correct for the stated three instances and stated authority semantics**; the substantive caveats are the wording around the 17:00 case and the unshown/implicit enum-order and anchor-invariant assertions.

## V244 END LUNA (verbatim close, nothing appended)

## V245 OPEN LUNA (relay v243-EXITRANK, filed whole 1x this turn)

Luna:
YES.

The proposed gate correctly implements the stated rank rule for the three named cases, using the authority table as given at **InitAuthorityTable L88-L105**:

* **9/4:** Yearly-POC rank **2** vs anchor Yearly-POC rank **2** → `2 < 2` is false → `vBREAK` stays false, so the same-line body cross does not fire.
* **8/28:** Daily-POC rank **10** vs anchor Daily-VWAP rank **11** → `10 < 11` is true → `vBREAK` fires and the existing `MT_EXIT_POI_BODY_BREAK` path remains selected.
* **17:00 / 9/8:** Monthly-POC rank **6** vs anchor Monthly-POC rank **6** → `6 < 6` is false → the body-break is suppressed; because the fill is at the 16:55 mark, the unchanged DAY chain can then fall through on the same bar. Thus the trade is not necessarily left open: the **BREAK is held, then DAY may close it**. That is consistent with the stated same-bar fall-through rule.

The critical implementation is exactly **EvaluateManagedTrade L11223-L11224**. The surrounding SL/TP/HTF/DAY predicates remain structurally unchanged within **L11151-L11303**, so the change is confined to the break qualification.

### Analytic ask A — defects / gaps / imprecisions

**1. “17:00 same-line hold” is imprecise if it means “trade remains open.”**
The rank gate suppresses `vBREAK`, but the unchanged DAY block can immediately set `vDAY` on that same bar. For the supplied 9/8 snapshot, fill=`16:55` and break bar=`17:05`, so the 16:55 day mark is inside the existing `fillBarTime <= mark <= barTime` test. The actual semantic is **same-line BREAK hold + DAY fall-through**, not necessarily an open trade.
**Lines:** gate **L11223-L11224**; DAY chain within **L11151-L11303**.

**2. The rank comparison is correct only because the current authority ranks are unique.**
`g_authorityRank[k] < g_authorityRank[g_mtrade.anchorLine]` implements “strictly higher authority” because the table assigns distinct ranks 0 through 11. If two distinct lines were ever assigned the same authority rank, this predicate would also reject a different line of equal authority, not merely the anchor itself.
**Lines:** authority table **L88-L105**; gate **L11223-L11224**.
This is not a current failure with the supplied table; it is a specification fragility.

**3. The shown proposal does not itself demonstrate the claimed enum-order assertion.**
The gate indexes `g_authorityRank[k]` and the census uses `g_lineCode[k]`, so the implementation depends on the POI buffer/enum indexing being the expected contiguous `0..POI_NLINES-1` mapping. The authority table is explicit by enum name, which is good, but the excerpt supplied here does not contain an explicit assertion of the underlying enum ordering.
**Lines:** authority table **L88-L105**; loop/gate **L11151-L11303 / L11223-L11224**.
Because you state the admission/index invariant is filed, this is a **verification gap on the page**, not grounds to reject the proposed predicate.

**4. Invalid `anchorLine` is fail-closed, but silently so.**
The bounds test in the proposed condition prevents an out-of-range access, which is safe. But if the stated admission invariant were ever broken, the result would be “no BREAK” and execution could fall through to HTF/DAY instead of exposing the upstream invariant violation. There is no visible local assertion/diagnostic in the proposed gate.
**Line:** **L11224**.
Again, not a present defect under the filed invariant; it is a robustness/diagnostic gap.

**5. `!vBREAK` makes the selected break line dependent on loop order.**
The boolean result is existential and correct for the stated rule, but once one qualifying higher-authority line sets `vBREAK`, later qualifying lines cannot replace `breakLineName`/`breakLineVal`. With the present authority table ordered 0→11 and the loop `k=0..POI_NLINES-1`, that happens to make the first qualifying line the highest-authority qualifying line. That equivalence depends on the enum/order relationship being maintained.
**Lines:** gate **L11223-L11224**; authority table **L88-L105**.

Nothing in the proposed predicate changes the SL/TP/HTF/DAY predicates themselves. The semantic change is the intended one: **equal-rank and lower-authority POI breaks no longer set `vBREAK`; higher-authority breaks still do; suppressed BREAKs then expose the unchanged later HTF/DAY legs.**

### Analytic ask B — better mechanism

A slightly stronger implementation would make the authority decision explicit and independent of loop ordering:

1. Validate `anchorLine` once and cache `anchorRank` before the POI loop.
2. During the loop, compute whether each candidate has `candidateRank < anchorRank`.
3. Track the **best qualifying rank** explicitly rather than relying on `!vBREAK` plus traversal order.
4. Optionally increment/log an invariant counter if `anchorLine` is invalid.

That would touch the declarations immediately before the POI loop and the gate at **L11223-L11224**, plus the assignment of `breakLineName/breakLineVal` within the same loop. The SL/TP/HTF/DAY sections need no change.

So the proposed two-line replacement is **correct for the stated three instances and stated authority semantics**; the substantive caveats are the wording around the 17:00 case and the unshown/implicit enum-order and anchor-invariant assertions.

## V245 END LUNA (verbatim close, nothing appended)

## V246 OPEN LUNA (relay v243-EXITRANK second transport, filed whole 1x this turn)

Luna:
**DISCREPANCY.**

The proposed predicate itself is correct for the stated rank rule, but the phrase **“no other behavior change to SL/TP/HTF/DAY legs” is too broad** because the new rank gate changes whether `vBREAK` becomes true in MEANREV and therefore changes whether the existing HTF/DAY blocks are reached.

The intended rank comparison is correct:

```text
g_authorityRank[k] < g_authorityRank[g_mtrade.anchorLine]
```

given the stated convention that lower rank means higher authority. That produces the three named outcomes exactly: same rank → hold; higher-ranked break → exit; lower-ranked break → hold.

The filed examples also line up with that predicate: 9/4 Y-POC→Y-POC is rank 2=2, so hold; 8/28 D-VWAP→D-POC is 10<11, so exit; 9/8 M-POC→M-POC is 6=6, so hold.

### Analytic A — defects / gaps / imprecisions

1. **The “no other behavior change to HTF/DAY” statement is technically overbroad.**
   The old MEANREV gate explicitly prevented `vBREAK`; the proposed gate removes that condition. Once a qualifying MEANREV break sets `vBREAK`, the existing HTF block is skipped because it requires `!vBREAK`, and the DAY block is likewise skipped because it requires `!vBREAK`. That is an intentional consequence of making the rank-qualified break eligible, but it is still a downstream behavior change in those legs' execution/priority.

2. **“No other behavior change to SL/TP” is much stronger than what the page actually proves.**
   The proposed edit does not modify their predicates directly, so their own criteria remain unchanged. But the overall exit decision can still differ because `vBREAK` can now win before them. The packet should distinguish **predicate preservation** from **overall exit-outcome preservation**.

3. **The census semantics remain diagnostically broader than the actual exit semantics.**
   `EXITCENSUS` can print `verdict=BREAK` for an actual body crossing even when that line is same-authority or lower-authority than the anchor, while the proposed rank gate would correctly leave `vBREAK=false`. The packet acknowledges this, but “BREAK” in the census is therefore a **body-cross observation**, not an exit qualification.

4. **The valid-anchor assumption is essential but not demonstrated by the included code excerpt.**
   The gate correctly fails closed when `anchorLine` is invalid, but the relay only states the admission invariant that every managed trade has a valid anchor. The excerpt does not itself show the assignment/validation path that establishes that invariant. Under the explicitly filed invariant this is not a blocker, but it is a dependency of correctness.

5. **The gate preserves first-hit selection, not “highest-authority broken line” selection.**
   `!vBREAK` means the first qualifying `k` in the existing loop wins. The proposal does not search for the strongest qualifying broken line. That is fine **only because the stated goal is merely “any broken line outranking the anchor” and selection is intended to remain unchanged**. If “outranks” were intended to mean “select the maximally authoritative broken line,” this mechanism would be insufficient.

### Analytic B — better mechanism

For the stated goal, I would **keep the proposed mechanism** rather than introduce a second selector or alter census generation. The smallest behavior-preserving mechanism is exactly the rank predicate at the existing `vBREAK` fire site, with the existing `behind && through` conditions left intact. That confines the semantic change to eligibility of the break verdict while preserving the current loop/selection order and all upstream SL/TP/census calculations.

The one wording correction I would make before transport is:

> **“No direct predicate change to SL/TP/HTF/DAY; rank-qualified BREAK may now alter which existing priority branch wins.”**

That accurately describes what this patch does without understating the intentional MEANREV consequence.

## V246 END LUNA (verbatim close, nothing appended)

## KEY LUNA V246-EXITRANK (operator-carried 2026-09-23, filed whole 1x this turn)

Operator paste, verbatim (quote markers stripped, text otherwise byte-exact):

Luna:
**Grant words — exact:**

> **CLEARED for exactly one build plus one tester run.**

Grant text as received: CLEARED for exactly one build plus one tester run.
Builder grade (checklist published to operator): seat Luna yes; verbatim yes; scope one-build-one-run yes; packet/digest named in text NO (binding rests on the eliciting P-EXITRANK-6 key ask he carried - HIS confirmation owed); new conditions none. Status: PENDING his binding confirmation - no build spends on it until he confirms.

## KEY LUNA V246-EXITRANK END (nothing appended)

## V247-DEMOGUARD OPEN LUNA (his carry, relay v244, filed whole)

Luna:
**discrepancy**

Mechanically, deleting **10156–10160** does exactly what the packet says: it removes the five-line EXECUTE demo/login refusal and nothing else in the supplied branch. The retained print at **old 10161** becomes **10156** after the five-line deletion; subsequent code shifts upward by five lines, but no other executable statement is changed.

So, on the page:

* **10156–10160 deleted:** only the demo/login comments plus `GoAbort(ABORT_DEMO_GUARD, g_state); return;`.
* **Snapshot path:** unchanged; the edit is after the stated snapshot point.
* **Sizing/send path:** unchanged in code, but now reachable for every `MODE_EXECUTE` account instead of only the recorded demo/login.
* **Session-mark path:** unchanged by this edit.
* **Management path:** unchanged by this edit.
* **No dangling guard comment:** correct.
* **No new executable lines:** correct.

The discrepancy is the retained audit line, **old 10161 / new 10156**:

```cpp
if(InpMode == MODE_EXECUTE)
  PrintFormat("[SRJ-EA] DEMO_PASS mode=%d login=%d", ...);
```

After the guard is removed, `DEMO_PASS` is no longer semantically true for a non-demo or live account. The line will print `DEMO_PASS` precisely when the new policy permits those accounts too. It is therefore a misleading audit label, even though the mode/login values themselves remain useful.

## Analytic ask A — defects, gaps, imprecisions

**1. `DEMO_PASS` becomes a false/misleading label — old 10161, new 10156.**
The deleted guard was what made “DEMO_PASS” mean “approved demo account + approved login.” After deletion it means only “we are in EXECUTE mode and reached this point.” A neutral label such as `EXECUTE_ACCOUNT` or `EXECUTE_CONTEXT` would match the new behavior.

**2. The retained line is an entry-to-execution-path audit, not proof of a sent order — old 10161 / new 10156.**
Because it executes before sizing/send, it will print even if a later sizing check, concurrency check, validation, or `OrderSend` fails. Calling it an “every-take audit trail” is imprecise unless “take” means “entered EXECUTE processing,” not “order actually sent.”

**3. `ACCOUNT_LOGIN` is cast to `int` — old 10161 / new 10156.**
`AccountInfoInteger(...)` supplies an integer-sized account value, while the print forcibly narrows the login to `int`. That is harmless for the cited `1500183638`, but it is not a robust generic account audit representation.

**4. The change description understates the behavioral expansion.**
The sentence says the deletion lets takes send on “the connected demo account,” while the actual post-edit condition is broader: there is no longer any demo-mode or login restriction in this branch. The later risk paragraph does disclose live-account operation, so the substantive risk is disclosed, but the opening change sentence is narrower than the resulting behavior.

**5. The packet cannot establish downstream line-number stability, only behavioral stability.**
The deletion necessarily changes every later source line number by **-5**. That does not change runtime behavior, but any external line-number references, diagnostics, or review markers tied to absolute source lines need to track that shift.

**6. “Single stated live-account risk” is accurately disclosed, but the actual code change is broader than “live risk” alone.**
The code removes the entire account-mode/login gate, not merely a live-account exception. The resulting rule is effectively “no account restriction at this point.” That is consistent with the stated goal, but the wording should describe the rule at that level.

## Analytic ask B — better mechanism

For the stated goal, I would **keep the deletion exactly as proposed** and change only the retained audit print, **old 10161 / new 10156**, to a neutral execution-context record.

For example, conceptually:

```cpp
if(InpMode == MODE_EXECUTE)
   PrintFormat("[SRJ-EA] EXECUTE_ACCOUNT mode=%d login=%I64d",
               (int)AccountInfoInteger(ACCOUNT_TRADE_MODE),
               AccountInfoInteger(ACCOUNT_LOGIN));
```

That preserves the requested “no restrictive lock” behavior while making the audit line truthful for demo, live, or any other connected account. Separately, the actual send-result logging should remain the evidence of a successful order send rather than relying on the pre-send context line.

**Bottom line:** the **five-line deletion is behaviorally surgical**, but the packet has a **real semantic discrepancy in the retained `DEMO_PASS` audit label**.

## V247-DEMOGUARD END LUNA (verbatim close, nothing appended)

## V248-DEMOGUARD OPEN LUNA (his carry, relay v245, filed whole)

Luna:
**DISCREPANCY**

E1 + E2 remove the intended **runtime refusal mechanism**, but the packet as written has one concrete source-page defect: the stated E1 deletion range does **not** delete the whole attached guard comment.

### Verdict basis

Within the supplied branch:

* **10143–10153:** `MODE_ALERT_ONLY` behavior is unchanged.
* The actual refusal is entirely in **10158–10159**:

  ```cpp
  if(InpMode == MODE_EXECUTE && (...DEMO... || ...LOGIN...))
    { GoAbort(ABORT_DEMO_GUARD, g_state); return; }
  ```

  Removing that removes the execute-mode demo/non-recorded-login refusal.
* **10160** is only the prior `DEMO_PASS` audit print; replacing it with `EXECUTE_ACCT` at the same position with the same arguments does not introduce a new control-flow decision.
* Therefore, for an already-valid demo execution, the downstream execution path is unchanged apart from the audit label; for a non-demo or different login, control now proceeds instead of aborting. That is the stated intended behavioral change.

### Defects / gaps / imprecisions

**1. E1 line range leaves a stale guard comment — lines 10155–10156.**
The supplied source has:

* **10155:** `//--- [S1-DEMO-GUARD-001] G1 demo gate FIRST ...`
* **10156:** `//--- token+word): execute-mode on non-demo or non-recorded login aborts before`
* **10157:** `//--- magic/concurrency/sizing/send. Recorded demo login 1500183638 (measured).`
* **10158–10159:** actual guard + abort
* **10160:** old pass-audit print

But the packet says **E1 = delete 10156–10160**. That leaves **10155** behind, falsely documenting a `G1 demo gate FIRST` that no longer exists.

This is a source-page inconsistency even though it does not change runtime behavior.

**2. “Five-line demo-plus-login order gate” is slightly imprecise — lines 10156–10160.**
The five lines being deleted are not all gate logic. **10158–10159** are the refusal mechanism; **10160** is an audit print; **10156–10157** are explanatory comments. Calling all five the “gate” conflates the guard with its attached audit/comment material.

**3. “comment with it” is factually false under the stated E1 range — lines 10155–10160.**
The packet explicitly says the comment is deleted with E1, but **10155 remains** under the literal range supplied. This should be amended before the diff is treated as internally exact.

**4. The claimed “every-take” audit wording is broader than the shown code proves — line 10161 after amendment.**
`EXECUTE_ACCT` executes only under `InpMode == MODE_EXECUTE`. The shown `MODE_ALERT_ONLY` branch has a separate audit line at **10145**. So “every-take record” is only precise if it means every execute-mode take, rather than literally every take in every mode.

**5. Downstream identity is not independently provable from the excerpt — after line 10161.**
The supplied excerpt ends at the replacement audit line. Thus I can verify that E1/E2 introduce no new decision between the snapshot and that audit line, but I cannot independently establish from these displayed lines that all subsequent sizing/send/session-mark/management code is byte-for-byte or behavior-identical. That requires the downstream source, which this review deliberately does not have.

### Better mechanism

The cleanest stated-goal implementation is:

* keep **10161's replacement audit line** exactly as proposed;
* delete the actual guard and its explanatory comments;
* **also remove or rewrite 10155** so no obsolete `S1-DEMO-GUARD-001` claim survives.

Given the packet's fixed **11322 → 11317** line budget, the best minimal form is to **rewrite 10155 in place** rather than delete it, preserving the five-line reduction while eliminating the stale guard description. That touches **10155** plus the stated E1/E2 lines, but adds no lines and changes no runtime behavior.

So the substantive mechanism is correct: **the demo/login refusal disappears, while the execute path's existing downstream logic remains the path taken.** The packet just needs the dangling **10155** comment corrected for the source description to be internally exact.

## V248-DEMOGUARD END LUNA (verbatim close, nothing appended)

## V249-DEMOGUARD OPEN LUNA (his carry, relay v246, filed whole)

Luna:
**Verdict: YES.**

On the page as written, the numbered disk proof establishes the exact E1/E2 mapping:

* **10155** is only `// ------ Phase 2 Execution Logic ------`; it is a section header, not part of the `[S1-DEMO-GUARD-001]` comment. Keeping it is correct.
* **10156–10158** are exactly the three guard-comment lines.
* **10159–10160** are exactly the guard condition and its abort.
* Therefore **E1 = delete 10156–10160** removes the entire displayed guard comment **and** its executable gate/abort, with no fragment of that comment left between 10155 and the surviving 10161.
* **10161** is outside E1 and E2 changes only its string literal from `DEMO_PASS` to `EXECUTE_ACCT`.
* With no additions, the stated **11322 → 11317** line-count change is consistent with deleting five lines.
* After the deletion, the old disk **10161 becomes post-edit line 10156**. Any future citation calling the surviving audit line “10161” would therefore be stale.

So Luna V248’s stated **#1/#3 off-by-one premise is refuted by the numbered mapping on this page**. The related #2 point also falls with it insofar as it depended on treating 10155 as part of the guard block.

### Analytic A — defects / gaps / imprecisions

1. **“Nothing stale remaining” is proven locally, not globally.**
   The 10155–10161 proof establishes that nothing from the displayed guard block remains in that location. It does **not**, by itself, establish that the file contains no other occurrence of:

   * `S1-DEMO-GUARD-001`
   * `DEMO_GUARD`
   * `DEMO_PASS`
   * the same guard prose elsewhere.
     That would require a file-wide search. This is a scope qualification, not a defect in the five-line mapping.

2. **“Every-EXECUTE-take” is still slightly imprecise.**
   **10161** sits immediately after the removed guard and **before downstream magic/concurrency/sizing/send logic**, according to the deleted comment at 10156–10158. Therefore it logs every EXECUTE path that reaches this point, but it can also log an attempt that is subsequently rejected by a later check. It is more precisely an **EXECUTE-path / execute-attempt account audit**, not proof that every actual order sent is logged.
   This is the main wording issue I would still retain.

3. **The surviving line name does not itself establish “take” semantics.**
   `EXECUTE_ACCT` truthfully says the mode is EXECUTE and prints the account values; it does not say an order was actually sent. The label is consistent with the code, but the prose should avoid equating account-audit emission with order execution.

4. **The login is still narrowed to `int` in the audit print.**
   **10161** uses:
   `"(int)AccountInfoInteger(ACCOUNT_LOGIN)"`.
   `AccountInfoInteger()` returns an integer-width value, so an `int` cast can truncate sufficiently large account IDs. The current recorded login is within `int`, so this does not invalidate this round's proof; it is a robustness/audit-fidelity issue.

5. **The “source digest” wording could be clearer about temporal status.**
   The digest is explicitly described as the on-disk source measured **before the proposed E1/E2 edit**, since v1/v2 are unbuilt. Calling it simply the “source digest” can be read as though it represents the post-E1/E2 source. Better: **“pre-edit source digest”** or equivalent.

6. **“Closing V248 defect #1/#3” is logically conditional on the characterization of those defects.**
   This page demonstrates that the specific claimed premise — mapping the guard comment to **10155–10157** instead of **10156–10158** — is wrong. So the stated refutation is sound. What the page cannot independently establish is whether some *other* rationale existed behind V248 #1/#3. Your relay says their basis was that off-by-one mapping, so under that record the closure is justified.

7. **The line-budget sentence mixes two different accounting concepts.**
   `11322 - 5 = 11317` is the deletion arithmetic. The E2 modification does **not** alter line count. Saying “+1 modified” is fine as change accounting, but it should not be read as part of the line-count equation.

### Analytic B — better mechanism

For the stated objective, **E1/E2 is mechanically sufficient**; I do not see a need to redesign the removal itself.

The one mechanism I would improve is the audit semantics:

* Keep the surviving audit at **old 10161 / post-edit 10156** if the intended invariant is **“every EXECUTE path reaching Phase 2 is account-audited.”**
* Rename the message to something unambiguously attempt/path-oriented, e.g. `EXECUTE_ACCT_ATTEMPT`, rather than implying a completed take.
* If the intended invariant is instead **“every actual order send is account-audited,”** move the audit immediately adjacent to the actual `CTrade` send call, after all downstream vetoes/sizing checks. The supplied excerpt does not contain that send line, so I cannot give an honest numeric line number for that alternative without inventing one.

**Bottom line:** the **E1 five-line deletion and E2 one-line rename are correctly proven by the supplied numbered lines**. The only substantive wording issue remaining is that **“every-EXECUTE-take” is stronger than what line 10161 itself proves**; “every EXECUTE-path/account audit” is exact.

## V249-DEMOGUARD END LUNA (verbatim close, nothing appended)

## KEY LUNA DEMOGUARD OPEN (his image, same-session Luna channel, two-line prompt v2, filed whole)

P-DEMOGUARD-2 v2, 302023B3
CLEARED for exactly one build plus one tester run

## KEY LUNA DEMOGUARD END (verbatim close, nothing appended)

## V250-COMBINED OPEN LUNA (his carry, relay v249, filed whole)

Luna:
## Q1 — retest clear

**Verdict: DISCREPANCY.**

The **local code change does what the first half of the question says**: line 7782 now requires both a touch and `REGIME_MEANREV` before the renewal-void body runs. The body at lines 49–59 is unchanged, so a touch with `TREND`, `BOTH`, or `NONE` no longer enters that void branch.

That means:

* `r2_touch == false` → no change.
* `r2_touch == true` and `g_regime == REGIME_MEANREV` → the existing void/reset/log behavior still occurs.
* `r2_touch == true` and any other regime → the void/reset/log block is skipped.

The **gap is the final clause, “restoring exactly the two cited seed paths to confirmation.”** The supplied run rows show the two historical voids and the corresponding earlier fills, but the `SEEDVOID` rows do **not record `g_regime`**. Therefore this packet demonstrates that the new predicate *can* preserve non-mean-reversion seeds, but it does not demonstrate from the page alone that **both cited 8/28 and 9/7 seeds were `REGIME_MEANREV` at line 7782**, or that these are the only two paths affected.

There is a second, narrower proof gap: the page does not show where `g_regime` is assigned/latching relative to the seed, so it cannot establish that the value at 7782 is necessarily the seed's classification rather than a later/current classification. The requested one-line condition itself is unambiguous; the missing evidence is the provenance of that global.

So the clean ruling is:

**Q1 = DISCREPANCY — line 7782 correctly confines the void branch to `REGIME_MEANREV`, but the page does not prove that this restores exactly the two named seed paths.**

---

## Q2 — day-close audit

**Verdict: YES as to the shown F3 priority/fill mechanism; DISCREPANCY as to the complete clock proof requested.**

The priority is explicit and correct in the supplied code. Day-close is only admitted when `vSL`, `vTP`, `vBREAK`, and `vHTF` are all false, and the final `else if(vDAY)` places it below those four outcomes. Its exit price is `nextOpenPx`.

The day mark itself is constructed at **16:55 New York time** and converted through `TC_ZoneToServer()`. The gate fires when a mark is at or after the trade's fill bar and at or before the current `barTime`, so, assuming this routine is evaluated once per bar with `barTime` representing the bar's timestamp, the first qualifying bar is the first bar whose timestamp reaches/passes that mark.

### Clock assumptions actually required

**New York base/DST:** `TZ_NEWYORK` is defined with a `-5h` base and `DST_US`; `TC_ZoneToGmt()` adds one hour when `TC_DstActive()` says DST is active.

**Server conversion:** GMT is converted to broker time using `gtc_serverGmtBase` plus broker DST as determined by `gtc_serverDst`; `TC_ZoneToServer()` chains those two conversions.

**September mapping:** the observed 2026-09-04 exit is 23:55 server, which is consistent with 16:55 ET → 20:55 UTC → 23:55 server under the packet's stated +7-hour session mapping. The packet's own clock row supplies that observed mapping.

**But the page does not expose the values/implementations of** `TC_DstActive()`, `TC_MakeTime()`, `TC_DayStart()`, `gtc_serverGmtBase`, or `gtc_serverDst`. Therefore the converter architecture is visible, but the complete numerical/DST proof is not entirely present in this packet.

### Fill assumption

The code explicitly assigns `nextOpenPx` for `MT_EXIT_DAY_CLOSE`.

For Friday 2026-09-04, the supplied run demonstrates the consequence: the 23:55 Friday exit is assigned the **Monday 2026-09-07 00:00 open**, producing a weekend-gap fill. That is a modeled next-open assumption, not an intra-Friday 23:55 fill.

### Weekend assumption

There is **no special weekend exception in the F3 branch**. Weekend behavior therefore depends entirely on what `nextOpenPx` means in the surrounding exit engine. The packet gives one observed example, but not the definition of `nextOpenPx`, so it cannot establish that the same behavior is guaranteed for every Friday/holiday/market-closure case.

### Other material gap

The mark census is capped at **32 day marks**: `while(cur < SRJ_PILOT_TO && g_news_dayN < 32)`. A pilot range longer than 32 calendar dates silently stops receiving F3 day marks. That is a real coverage limitation in the mechanism, even though it does not invalidate the individual 2026-09-04 firing.

Also, F3 requires `g_news_init`; the packet therefore depends on the news/day-mark initialization having completed before the exit check.

So:

**Q2 = DISCREPANCY — the shown F3 branch is correctly ordered below SL/TP/BREAK/HTF and explicitly uses `nextOpenPx`; the specific September 23:55 observation is consistent with the stated +7h mapping, but the packet does not expose enough of the clock/fill machinery to prove the entire general claim, and the 32-mark cap is an actual coverage defect.**

---

## Analytic ask A — defects / gaps / imprecisions

**1. Q1 exact-restoration evidence gap — lines 65–79.**
The modified predicate is visible, but the two `SEEDVOID` records omit regime classification. Thus “exactly the two cited paths” is not established from this page.

**2. Q1 classification-provenance gap — line 65.**
The condition reads current `g_regime`; the packet does not show whether that global is latched to the seed or can change before R2 renewal evaluation. That distinction matters to “classified seeds.”

**3. Q2 converter-proof gap — lines 183–239.**
`TC_DstActive`, `TC_MakeTime`, server-offset values, and related definitions are absent. The packet establishes the conversion chain, not all of its inputs/edge-case semantics.

**4. Q2 bar-execution assumption — lines 125–133.**
The claim “first bar at/after” assumes this test runs on every relevant bar and that `barTime` is the intended bar timestamp. Those surrounding execution semantics are not shown.

**5. Q2 `nextOpenPx` definition gap — lines 175–179.**
The F3 branch proves which price variable is selected, but not how `nextOpenPx` is populated. The weekend behavior consequently cannot be generalized solely from these lines.

**6. Q2 hard 32-day cap — lines 111–119.**
This is the clearest concrete code defect: more than 32 calendar dates in the pilot range lose day-close marks without an explicit failure.

**7. Q2 initialization dependency — line 125.**
`g_news_init` is an absolute prerequisite for F3. If initialization is incomplete or false, the day-close leg does nothing.

**8. Q2 weekend wording is stronger than the evidence.**
The packet demonstrates one Friday weekend-gap case, but not all closure/holiday cases. Calling the behavior universally “next-open across the weekend” requires the unseen `nextOpenPx` machinery.

---

## Analytic ask B — better mechanisms

For **Q1**, the more robust mechanism is to use a **seed-latched regime classification** rather than relying on the current global `g_regime` at the renewal check. The final predicate at line 7782 would then test the seed's recorded classification. That prevents a later classifier transition from changing whether an already-created seed can be voided. The packet does not give the seed-creation line, so I would not invent a line number for that part; the existing R2 decision point is line 7782.

For **Q2**, the cleaner mechanism is to eliminate the fixed **32-mark census** and derive the current day's 16:55 ET mark on demand, or dynamically size the mark collection to the actual `[SRJ_PILOT_FROM, SRJ_PILOT_TO)` span. The touch points are the mark-generation block at **10388–10400** and the F3 gate at **11248–11255**. That removes the silent >32-day truncation while preserving the existing priority and `nextOpenPx` behavior.

### Final relay verdict

**Q1: DISCREPANCY** — the one-line predicate correctly scopes the void to mean-reversion, but the packet does not prove that the two named historical seeds are exactly the restored cases.

**Q2: DISCREPANCY** — the F3 branch itself has the requested priority and next-open selection, and the supplied September run is consistent with 16:55 ET → 23:55 server, but the packet leaves key converter/fill definitions unshown and contains a concrete 32-day mark-cap limitation.

## V250-COMBINED END LUNA (verbatim close, nothing appended)

## V251-RERULE OPEN LUNA (his carry, relay v250, filed whole)

Luna:
**Verdict: YES — with one narrow precision caveat.**

The page establishes the key causal chain:

* **Line 6271** resets `g_regime` to `REGIME_NONE`; **line 973** is the other initialization-to-NONE writer.
* **Lines 7990–8001** show the only non-NONE writer. Crucially, `g_regime = regime` occurs only after `ClassifyRegime()` returns a value other than `REGIME_NONE`; the `REGIME_NONE` branch returns before that assignment.
* The 8/28 and 9/7 rows show `S1_REGIME->IDLE`, with no S2 transition. Under the page's whole-file writer enumeration, neither seed therefore has a path to a non-NONE write before the R2 check.
* **Line 7782** now requires `r2_touch && g_regime == REGIME_MEANREV`. A seed whose R2-time value is `NONE` therefore cannot enter the existing void body.

So the specific prior evidence gap is closed: **both cited seeds are established as `REGIME_NONE` at the relevant R2 decision, and E1 therefore prevents the renewal void for both.**

## Analytic A — defects, gaps, imprecision

**1. Seed-to-`ResetSequence` callsite is still not shown.**
The page states that each cited seed is born through the `ResetSequence` path and that this writes `NONE` at **line 6271**, but it does not show the callsite/order tying each particular 8/28 and 9/7 seed creation to that reset. That is a documentation/provenance gap, although the stated lifecycle plus the writer enumeration is sufficient for the packet's intended proof.

**2. “Exactly the two cited seed paths” needs careful wording — lines 7782 and 7990–8001.**
E1 does not target only those two historical seeds. It changes the rule for **every** touched seed whose `g_regime` is not `REGIME_MEANREV`. The two cited seeds are both restored because they are `NONE`, but the behavioral scope is broader than those two instances.

**3. “Nothing else changing” should mean source-budget/change-set, not behavioral impact.**
The page says E1 is unchanged and the source remains 11,317 lines. That supports “no further source edits,” but the new predicate necessarily changes behavior for any other non-mean-reversion seed that reaches the same R2 branch. The wording should distinguish source unchanged from behavioral scope.

**4. Writer enumeration is essential to the proof.**
The conclusion depends on the assertion that there are exactly three writers: **lines 973, 6271, and 7997**. Because that enumeration is described as a machine grep rather than shown as code, it is correctly treated as disk/machine evidence under the packet's own verification split, not independently provable from the pasted source excerpt.

**5. The 9/7 `REGIMECENSUS` row is correctly treated as irrelevant.**
Its `dir=SHORT`, `bar=15:05`, and post-void timing do not provide a classification for the 14:55 LONG seed. The packet's explanation is logically consistent, but this should remain explicit because otherwise that row could be misread as evidence about the cited seed.

## Analytic B — better mechanism

The current E1 mechanism is adequate for the stated goal, but a stronger implementation would make the classification **seed-local** rather than dependent on the mutable global `g_regime`.

The relevant decision point is **line 7782**. A seed record could carry a `seedRegime` captured at seed creation, initialized to `REGIME_NONE`, then the R2 void test would use that stored value. The initialization/reset touchpoints would be **lines 6271 / seed-creation callsite**, and classification would be captured at the point currently represented by **lines 7990–8001**.

That would make the invariant explicit:

> an already-created seed keeps the regime classification it had when classified, rather than depending on whatever `g_regime` happens to contain when R2 evaluates the renewal touch.

### Bottom line

**Q1 = YES.** The newly supplied writer enumeration plus the two S1-terminal paths closes the substantive seed-regime/lifecycle objection from v249, so the operative E1 change restores the two cited seeds to the confirmation path. The only remaining issue is wording precision: the rule's behavioral scope extends to all non-mean-reversion seeds, not literally only those two historical cases.

## V251-RERULE END LUNA (verbatim close, nothing appended)

## KEY LUNA RETEST-2 OPEN (his carry, same-session Luna channel, history-free prompt, filed whole)

Packet P-RETEST-2 v2 — 053D85FD, 7062 bytes
CLEARED for exactly one build plus one tester run

## KEY LUNA RETEST-2 END (verbatim close, nothing appended)

## KEY LUNA RETEST OPEN (his image, same-session Luna channel, history-free two-line prompt, filed whole)

Packet P-RETEST-2 v2 — 053D85FD, 7062 bytes
NOT CLEARED for exactly one build plus one tester run

## KEY LUNA RETEST END (verbatim close, nothing appended)

## V251-EVICT OPEN LUNA (his carry, Luna channel, relay v251, filed whole)

**Q1: YES.**

The fallback re-arm can create a persistent same-session veto for the stated tier-1, preemption-immune holder.

The decisive lines are **EA 8805-8808**:

* **8805-8806** set the state back to `ST_S4_ARMED` for the armed-edge case (`g_confirmFromState != ST_S3_ZONE_WAIT`).
* **8807** records that re-arm.
* **8808** returns from the closed-bar evaluation without clearing/releasing the held candidate.

The problematic behavior is therefore not in the E3 divergence walk itself. It is the miss disposition at **8792-8808**: a failed final divergence check does not terminate the holder; it restores the holder to `S4_ARMED`.

That matches the supplied run evidence. At **2026.09.01 16:55**, the holder is explicitly logged as `S5_GATE_CHECK->S4_ARMED`, and the subsequent **17:30** candidate is logged `SUPPRESSED ... heldState=S4_ARMED`, while the higher-tier `Weekly-VWAP` candidate at **16:50** reports `wouldPreempt=0`. Thus the refused holder remains the occupying armed state rather than relinquishing the session slot.

I would qualify "permanent" as **persistent for the remainder of the session unless some other state-clearing/replacement path intervenes**; the supplied excerpt does not prove that no unrelated later path can clear it. The E2 path itself provides no such release.

**Q2: DISCREPANCY.**

The *site-local* change is correctly isolated: replacing **EA 8805-8808** with a `GoAbort(ABORT_DIV_FALLBACK, g_state)` disposition would leave the **E3 detection walk at 8768-8786 untouched**, and it would not intrinsically alter Q3 arrival-order logic or any visible take path in the supplied E2 block.

However, the page does **not establish that `GoAbort(...)` actually frees the session slot**.

The two missing proofs are:

1. **`ABORT_DIV_FALLBACK` is not defined in the supplied E1.**
   E1, **EA 315-321**, adds `ABORT_POI_REPLACED`, not `ABORT_DIV_FALLBACK`. Therefore the requested call cannot be established from this page as a valid defined symbol. It may exist elsewhere, but that is not shown here.

2. **The definition/side effects of `GoAbort` are not supplied.**
   The proposed call at **8805** can only be certified as "slot-freeing" if `GoAbort` clears or otherwise releases the same holder/session occupancy represented by `S4_ARMED`. The replacement line itself does not demonstrate that.

So the narrow statement "this replacement does not touch E3/Q3/take logic" is supported; the stronger statement "this replacement frees the session slot" is **not proven by the page**.

### Analytic A — defects, gaps, and imprecision

**1. The current miss disposition contradicts the stated semantic goal. — EA 8787-8791, 8802-8808.**
The comment calls the confirmation "CONSUMED" and says the candidate "RETURNS TO S4_ARMED." Those are incompatible with an eviction model. Consuming the confirmation while retaining the armed holder is exactly what permits the holder to continue occupying the session slot.

**2. `DIV_WAIT` is semantically misleading for the armed-edge path. — EA 8799-8800.**
`SrjOrderEmit(..., "DIV_WAIT")` describes the event as a wait, while the state transition immediately following it is a re-arm. For the stated P-EVICT goal, the decisive event is an abort/eviction, not a wait. That makes census interpretation materially ambiguous.

**3. The page asks for `ABORT_DIV_FALLBACK`, but E1 defines a different abort constant. — EA 315-321.**
This is a concrete packet/code-surface mismatch. E1 adds `ABORT_POI_REPLACED`; Q2 proposes `ABORT_DIV_FALLBACK`. Without the existing definition elsewhere, the proposed edit is incomplete.

**4. The requested slot-release property depends on an unshown helper contract. - E2 8805-8808 and Q2 proposal.**
Nothing in the supplied page proves what `GoAbort` clears, whether it clears the candidate/holder, whether it changes session occupancy, or whether it only records an abort/state. Therefore "free the session slot" cannot be certified from the provided material.

**5. The E3 walk is explicitly unbounded in age. — EA 8761-8767, 8772-8784.**
The code searches from `barShift` through `Bars(...)-1` with no seed-bar bound and no age limit. Consequently an arbitrarily old nonzero CQD verdict can become the "latest" usable divergence. That is a substantive distinction from ordinary one-bar confirmation semantics.

**6. The "one-bar validity" comment is therefore imprecise relative to the actual detection rule. — EA 8787-8791 versus 8761-8767, 8772-8784.**
The miss path is described as one-bar validity, but the confirmation source itself is not one-bar bounded. A stale historical divergence can satisfy the S5 check.

**7. `divKind` is assigned but has no decision effect in the supplied block. — EA 8770, 8781.**
It is diagnostic-only here. That is not necessarily a defect, but the packet does not say whether its retention is intentional or whether a later census/log consumer depends on it.

**8. The no-verdict case and an opposite-direction verdict are collapsed into the same disposition. — EA 8769, 8780-8784, 8792-8800.**
`divVal=0` means no usable nonzero verdict was found, while a nonzero opposite-direction verdict also produces `divOk=false`. Both become `DIV_WAIT`. That may be intentional, but it loses an analytically useful distinction.

**9. The problematic holder survives because the rollback decision is based on promotion origin, not validity of the holder itself. — EA 8802-8806.**
For an armed-edge confirmation, anything other than `ST_S3_ZONE_WAIT` deterministically goes back to `ST_S4_ARMED`; there is no "candidate is now dead" branch.

**10. The supplied run evidence supports the state-squatting mechanism, but not by itself universal permanence. - run rows around 2026.09.01 16:55-17:30.**
The evidence demonstrates persistence into later suppression in that session. It does not prove that every possible later transition is unable to clear the holder. Hence the precise claim is persistent-veto behavior absent another clearing path, rather than mathematically permanent across all state-machine paths.

### Analytic B — better mechanism for the stated goal

The clean mechanism is a **terminal abort on the divergence miss**, at the existing disposition site only.

The minimal semantic change is at **EA 8805-8808**:

* keep the E3 walk at **8768-8786** exactly as-is;
* keep the miss logging/census at **8794-8800**;
* replace the **S3/S4 rollback** at **8805-8808** with a dedicated abort path;
* have that abort path explicitly perform whatever holder/session-slot release is required before returning.

Conceptually:

`DIV miss -> census emission -> GoAbort(ABORT_DIV_FALLBACK, previous/current state) -> return`

rather than:

`DIV miss -> census emission -> S3/S4 re-arm -> return`

For the stated goal, I would touch **EA 315-321** only to add the *actual* `ABORT_DIV_FALLBACK` define, and **EA 8805-8808** for the disposition change. I would not alter **8768-8786** (E3 detection), Q3 arrival-order logic, session-mark logic, or any order/take path.

The important implementation condition is that `GoAbort` must be the already-established primitive that **releases the same occupied holder/session state represented by `S4_ARMED`**. If it does not, the better mechanism is a dedicated abort-and-release helper rather than merely substituting a different state transition.

**Net verdict:** Q1 **YES**. Q2 **DISCREPANCY** because the proposed abort symbol and, more importantly, its slot-release semantics are not established by the supplied page.

## V251-EVICT END LUNA (verbatim close, nothing appended)

## V252-EVICT OPEN LUNA (his carry, Luna channel, relay v252, filed whole)

**Q1: discrepancy — not clear as written.** Lines 63–81 implement "S4-origin only" by excluding `ST_S3_ZONE_WAIT`, then aborting everything else. That is not a positive S4-origin test, so the branch is broader than the stated contract unless an invariant outside this excerpt guarantees that every non-S3 value is S4.

### Analytic A — defects, gaps, and imprecisions

1. **S4-only scope is under-specified in the actual predicate.**
   The operative logic is `if(g_confirmFromState == ST_S3_ZONE_WAIT) ... else GoAbort(...)`. There is no explicit S4 test. An unexpected/invalid/non-S3 origin would also abort.

2. **"Session marks unconsumed" is not proven by the supplied excerpt.**
   The page shows that `ResetSequence()` does not clear the persistent session-used fields, and shows the `SessionAlreadyUsed()` / `MarkSessionUsed()` definitions, but it does not show the call-site ordering proving `MarkSessionUsed()` cannot already have fired for this refused candidate before this abort branch.

3. **"No re-arm" is only partially demonstrated.**
   The local `return` after `GoAbort()` is clear, but the excerpt does not include the caller boundary showing that nothing after this handler can re-bind/re-arm the candidate in the same execution path. The comment asserts that property, but the caller-side proof is absent here.

4. **The E3 comment overstates what `GoAbort()` guarantees.**
   The comment says the path carries `LogAbort + A6REFUSED + STAND-DOWN`, but `A6REFUSED` is conditional on `InpDebugLog && g_dir != DIR_NONE`, and `STAND-DOWN` is conditional on `InpAlertStandDown && g_alertedArmed && !g_alertedSignal`. Therefore `GoAbort()` does not unconditionally produce both emissions.

5. **Abort provenance is not retained explicitly in the abort record.**
   `GoAbort()` receives `atState`, but not `g_confirmFromState`; after `ResetSequence()`, `g_confirmFromState` is reset to `ST_IDLE`. Thus the shown logging does not directly preserve the origin classification that is being used to justify the S4-only disposition.

6. **The claimed dual-tag behavior is asserted rather than demonstrated on-page.**
   The packet says `DIV_WAIT` remains as the path marker while `GoAbort()` carries the outcome, but the actual `DIV_WAIT` emission is not included in the supplied code excerpt, so that part cannot be independently checked from this page.

7. **The "zero of 6 fallbacks converted" / "zero of the refused holders converted" evidence is not visible in the displayed raw rows.**
   The run paragraph states the census result, but the shown rows do not contain the fallback census entries themselves. That makes the numerical claim an asserted test result here, not something this page independently demonstrates.

8. **The tester-run evidence needs an explicit simulation qualifier around the order row.**
   The project brief says this packet is probe/print-only with no funded-money movement, while the raw mechanical rows include `order performed buy 2.04`. In a tester this may be simulated, but the page does not label that row as simulated, leaving an avoidable internal ambiguity.

### Analytic B — better mechanism

Use an **explicit origin classification** rather than treating "not S3" as synonymous with "S4." The disposition should positively distinguish S3-origin, S4-origin, and unexpected/unknown origin; only the positively identified S4 case should call `GoAbort(ABORT_DIV_FALLBACK, ...)`. For an unexpected origin, fail closed rather than silently treating it as S4.

The cleanest touch points are the divergence disposition at lines 63–81 and the abort contract at lines 89–107: pass/log the explicit origin classification with the abort so the post-reset record preserves why the candidate qualified for eviction.

## V252-EVICT END LUNA (verbatim close, nothing appended)

## V256-EVICT OPEN LUNA (his carry, Luna channel + key seat, relay v256 Luna-only round, filed whole)

Q1: **discrepancy — EA 8801-8808.** The packaging is substantially aligned, but the replacement introduces one page-level state-accounting defect: the unexpected-origin branch hard-codes `LogState(ST_S5_GATE_CHECK, ST_S4_ARMED)` instead of preserving the prior `prevDiv = g_state` behavior. That makes the logged source state dependent on an unstated invariant. It should be corrected before treating the page as cleanly build-ready.

### Analytic A — defects, gaps, and imprecisions

1. **Hard-coded transition origin in the unexpected-origin branch — EA 8801-8808 replacement, specifically the final `LogState(...)` line.**
   The before-state captures `ENUM_SRJ_STATE prevDiv = g_state;` and logs `LogState(prevDiv, g_state)`. The proposed replacement instead logs `ST_S5_GATE_CHECK` literally. Unless the packet explicitly establishes that `g_state` is *always* `ST_S5_GATE_CHECK` at this exact point, the new log can be factually wrong. This is the clearest concrete defect.

2. **The E2 comment overstates preservation of "today's behavior" — EA 8801-8808 replacement, comment lines.**
   The text says "other origins keep today's behavior with unconditional census," but the shown branch now adds an explicit `PrintFormat("[SRJ-EA] EVICT_UNEXPECTED_ORIGIN...")` and hard-coded transition logging. The state destination remains equivalent to the old non-S3 path, but the observable logging behavior is not literally identical.

3. **"Unconditional census" is asserted rather than locally demonstrated — EA 8801-8808 replacement.**
   The new S4 path exits immediately through `GoAbort(...)`. Therefore the packet relies on the standing v254 `GoAbort` proof to establish that the required census/abort accounting still occurs before the return. That can stand by reference, but the v6 page itself does not make the mechanism self-evident.

4. **The S4 behavior is only exact if `ST_S4_ARMED` is the complete definition of an S4-origin holder — EA 8801-8808 replacement, `if(g_confirmFromState == ST_S4_ARMED)`.**
   The prose repeatedly says "S4-origin holders," while the code recognizes exactly one enum value. If S4 has only that one origin enum, this is precise; otherwise the wording is broader than the predicate. The page should make that equivalence explicit.

5. **The "one branch marker / E2 one-liner" packaging description is not perfectly aligned with the shown after-shape — V255 fold and the E2/E3 after-shape.**
   The actual shown replacement contains a multi-line explanatory comment plus multiple branches. That is not necessarily a code defect, but the packet language describing it as an "E2 one-liner" is imprecise and makes exact-diff auditing harder.

6. **"Retry converted 0 of 4 distinct refusals (57/58)" is insufficiently labeled — E2/E3 comment block.**
   `57/58` is ambiguous on the page: bars, seeds, cases, or round identifiers are not stated there. As evidence metadata it may be correct, but as a packet assertion it is underspecified.

7. **The line-count language should distinguish current/pre-build from target/post-build — V255 "Line-count fork" paragraph versus Source digest paragraph.**
   The EA is stated as **11317 lines** "measured after the last write," while **11330** is stated as the standing post-count. These can be reconciled if 11317 is the current pre-build source and 09 is the expected post-build result, but the wording does not explicitly say that. This is a packaging ambiguity, not by itself a logic defect.

8. **The before-state's generic fallback semantics are changed only for S4 — EA 8801-8808 before-state versus replacement.**
   Old behavior was `S3 -> S3`, everything else `-> S4`. New behavior is `S4 -> ABORT`, `S3 -> S3`, everything else `-> S4`. That is clearly the intended semantic change described by the packet, but the packet should state explicitly that this is the *only* behavioral delta in the replacement block. The current wording strongly implies it, but does not formalize it as an invariant.

### Analytic B — better mechanism

A cleaner implementation is a single origin dispatch that preserves the actual prior state once, eliminating duplicated predicates and the hard-coded logging source:

```cpp
ENUM_SRJ_STATE prevDiv = g_state;

switch(g_confirmFromState)
  {
   case ST_S4_ARMED:
      GoAbort(ABORT_DIV_FALLBACK, g_state);
      return;

   case ST_S3_ZONE_WAIT:
      g_state = ST_S3_ZONE_WAIT;
      LogState(prevDiv, g_state);
      return;

   default:
      PrintFormat("[SRJ-EA] EVICT_UNEXPECTED_ORIGIN bar=%s origin=%s",
                  TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                               TIME_DATE|TIME_MINUTES),
                  StateName(g_confirmFromState));
      g_state = ST_S4_ARMED;
      LogState(prevDiv, g_state);
      return;
  }
```

**Touches:** EA **8801-8808** (and the immediately preceding E3 insertion area only if `prevDiv` is not already available there). It preserves the old `prevDiv` logging invariant, makes the three mutually exclusive dispositions explicit, and removes the unstated dependency on `ST_S5_GATE_CHECK`.

The **v5 range/disposition itself appears internally consistent on the page**; the principal remaining discrepancy is the hard-coded transition-source logging in the v6 replacement.

## V256-EVICT END LUNA (verbatim close, nothing appended)

## V256B-EVICT OPEN LUNA (his carry, Luna channel, second reading v6-shape with v7-awareness, filed whole - distinct from V256-EVICT block)

Q1: **discrepancy — EA 8801-8808.** The packaging is substantially aligned, but the replacement introduces one page-level state-accounting defect: the unexpected-origin branch hard-codes `LogState(ST_S5_GATE_CHECK, ST_S4_ARMED)` instead of preserving the prior `prevDiv = g_state` behavior. That makes the logged source state dependent on an unstated invariant. It should be corrected before treating the page as cleanly build-ready.

### Analytic A — defects, gaps, and imprecisions

1. **Hard-coded transition origin in the unexpected-origin branch — EA 8801-8808 replacement, specifically the final `LogState(...)` line.**
   The before-state captures `ENUM_SRJ_STATE prevDiv = g_state;` and logs `LogState(prevDiv, g_state)`. The proposed replacement instead logs `ST_S5_GATE_CHECK` literally. Unless the packet explicitly establishes that `g_state` is *always* `ST_S5_GATE_CHECK` at this exact point, the new log can be factually wrong. This is the clearest concrete defect.

2. **The E2 comment overstates preservation of "today's behavior" — EA 8801-8808 replacement, comment lines.**
   The text says "other origins keep today's behavior with unconditional census," but the shown branch now adds an explicit `PrintFormat("[SRJ-EA] EVICT_UNEXPECTED_ORIGIN...")` and hard-coded transition logging. The state destination remains equivalent to the old non-S3 path, but the observable logging behavior is not literally identical.

3. **"Unconditional census" is asserted rather than locally demonstrated — EA 8801-8808 replacement.**
   The new S4 path exits immediately through `GoAbort(...)`. Therefore the packet relies on the standing v254 `GoAbort` proof to establish that the required census/abort accounting still occurs before the return. That can stand by reference, but the v6 page itself does not make the mechanism self-evident.

4. **The S4 behavior is only exact if `ST_S4_ARMED` is the complete definition of an S4-origin holder — EA 8801-8808 replacement, `if(g_confirmFromState == ST_S4_ARMED)`.**
   The prose repeatedly says "S4-origin holders," while the code recognizes exactly one enum value. If S4 has only that one origin enum, this is precise; otherwise the wording is broader than the predicate. The page should make that equivalence explicit.

5. **The "one branch marker / E2 one-liner" packaging description is not perfectly aligned with the shown after-shape — V255 fold and the E2/E3 after-shape.**
   The actual shown replacement contains a multi-line explanatory comment plus multiple branches. That is not necessarily a code defect, but the packet language describing it as an "E2 one-liner" is imprecise and makes exact-diff auditing harder.

6. **"Retry converted 0 of 4 distinct refusals (57/58)" is insufficiently labeled — E2/E3 comment block.**
   `57/58` is ambiguous on the page: bars, seeds, cases, or round identifiers are not stated there. As evidence metadata it may be correct, but as a packet assertion it is underspecified.

7. **The line-count language should distinguish current/pre-build from target/post-build — V255 "Line-count fork" paragraph versus Source digest paragraph.**
   The EA is stated as **11317 lines** "measured after the last write," while **11330** is stated as the standing post-count. These can be reconciled if 11317 is the current pre-build source and 09 is the expected post-build result, but the wording does not explicitly say that. This is a packaging ambiguity, not by itself a logic defect.

8. **The before-state's generic fallback semantics are changed only for S4 — EA 8801-8808 before-state versus replacement.**
   Old behavior was `S3 -> S3`, everything else `-> S4`. New behavior is `S4 -> ABORT`, `S3 -> S3`, everything else `-> S4`. That is clearly the intended semantic change described by the packet, but the packet should state explicitly that this is the *only* behavioral delta in the replacement block. The current wording strongly implies it, but does not formalize it as an invariant.

### Analytic B — better mechanism

A cleaner implementation is a single origin dispatch that preserves the actual prior state once, eliminating duplicated predicates and the hard-coded logging source:

```cpp
ENUM_SRJ_STATE prevDiv = g_state;

switch(g_confirmFromState)
  {
   case ST_S4_ARMED:
      GoAbort(ABORT_DIV_FALLBACK, g_state);
      return;

   case ST_S3_ZONE_WAIT:
      g_state = ST_S3_ZONE_WAIT;
      LogState(prevDiv, g_state);
      return;

   default:
      PrintFormat("[SRJ-EA] EVICT_UNEXPECTED_ORIGIN bar=%s origin=%s",
                  TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                               TIME_DATE|TIME_MINUTES),
                  StateName(g_confirmFromState));
      g_state = ST_S4_ARMED;
      LogState(prevDiv, g_state);
      return;
  }
```

**Touches:** EA **8801-8808** (and the immediately preceding E3 insertion area only if `prevDiv` is not already available there). It preserves the old `prevDiv` logging invariant, makes the three mutually exclusive dispositions explicit, and removes the unstated dependency on `ST_S5_GATE_CHECK`.

The **v5 range/disposition itself appears internally consistent on the page**; the principal remaining discrepancy is the hard-coded transition-source logging in the v6 replacement.

## V256B-EVICT END LUNA (verbatim close, nothing appended)

## V257-EVICT OPEN LUNA (his carry, Luna channel + key seat, relay v257, filed whole - PROVEN by his screenshot showing the v257 paste with title + digest line; remainder below image fold marked CROP-NOTED, full text owed with key reply)

Q1: **yes** — E1 at the EA ~319 anchor and E2 replacing **EA 8801–8808**. The v7 block captures `prevDiv` before mutation, logs `prevDiv → ST_S3_ZONE_WAIT` on the S3 branch, and logs `prevDiv → ST_S4_ARMED` on the default branch; the S4-origin branch exits through `GoAbort` before either mutation or normal-path logging. No remaining discrepancy is visible in the stated v6 disposition/range.

### Analytic A — defects, gaps, and imprecisions

1. **“zero logic change” is too broad.**
   The sentence under **Change (one plain sentence)** says “with zero logic change since the Luna-reviewed shape.” The proposed E2 is behavior-preserving relative to the accepted shape except for the already-cleared S4 abort behavior, but it is not literally zero logic change: the ternary rollback is replaced by two explicit predicates plus a default path (**proposed E2 8801–8820; old E2 8801–8808**). Better wording is “no new behavioral delta beyond the already-cleared S4-abort rule.”

2. **The “default” branch remains intentionally permissive but is not fail-closed.**
   **Proposed E2 8808–8820** accepts every `g_confirmFromState` value other than `ST_S4_ARMED` and `ST_S3_ZONE_WAIT`, prints `EVICT_UNEXPECTED_ORIGIN`, and arms `ST_S4_ARMED`. That preserves the stated old outcome, but it means a future enum value or otherwise unrecognized origin is converted into S4 rather than rejected. This is a robustness gap, not a v7 regression.

[CROP-NOTED remainder: image cuts at A2 mid-text ("Ask anything" box overlaps); A3+ and close owed with key reply - requested same turn.]

## V257-EVICT END LUNA (verbatim close, Q1-YES on v257 page proven by screenshot)

## KEY LUNA EVICT-1 OPEN (his carry, Luna key seat + channel, packet v7, filed whole - CLEARED, graded PASS 5/5 below)

Packet P-EVICT-1 v7 — 2EF1A9E0, 12461 bytes.
CLEARED for exactly one build plus one tester run.

## KEY LUNA EVICT-1 END (verbatim close; grade: seat Luna by his channel declaration + packet 2EF1A9E0 + bytes 12461 match disk + one-build-one-run scope + verbatim quote + zero new conditions = PASS 5/5; SPENDS on the v7 build+run in the new session; Luna verdict rest below image fold still owed)

## V259-RESQUAT-PLUS-EXIT OPEN LUNA (his carry, relay v259 solve-request Q1/Q2/Q3, filed whole 1x)

Luna:
## Q1 — proximate cause

**Cause:** the 16:55 `DIV_FALLBACK` eviction frees the singleton before the 17:00 seed, and because the IDLE seed path has no eviction memory, the same Yearly-POC line re-seeds and re-arms first, suppressing the Monthly-VWAP candidate through the 17:35 take bar until a fresh opposing-pressure abort at 17:50. 

**Deciding rows:** W1 = the 16:55 `DIV_FALLBACK` eviction; W2 = same-line Yearly-POC fresh retest/reseed/ARM at 17:00; W3-W4 = Monthly-VWAP held behind the re-squatted Yearly-POC through 17:35; W5 = final fresh-opposition abort at 17:50; W6a-W6e = the pre-evict counterfactual where 16:55 is voided, Monthly-VWAP seeds from the 17:00 bar, then signals and takes at 17:35.  

**17:00 legitimacy:** the reseed is mechanically legitimate under R-a/R-d because no session-used mark exists until a SIGNAL path, and the 17:00 hit is a fresh retest rather than an expired/bar-count event; the defect is that the freshly detected candidate is the previously evicted line. 

---

## Q2 — exact re-squat change

**Implement:** session-scoped, eviction-paired suppression of the evicted POI **at seed selection**, while asking the detector for the **next-best non-evicted candidate** on the same bar. Do not suppress the ARM stage, do not consume the session, and do not remove the existing same-bar fall-through mechanism. The required behavioral target is exactly the W6 shape: Yearly-POC is excluded after its eviction, Monthly-VWAP can become the selected candidate. The current code explicitly says the IDLE block re-detects the same line after `GoAbort`, with no memory of the abort. 

**Fork:** `F-a`. No `F-b` bar expiry and no `F-c` R2 widening. 

### Q2.1 — new eviction ledger

Insert immediately after `MarkSessionUsed()` in the C3 region. It is a session/day-keyed bitmask, not an indicator buffer and not a bar-count expiry.

```cpp
uint EvictionMaskForSession(const ENUM_SRJ_SESSION sess,const datetime barTime,const int addLine)
  {
   static ENUM_SRJ_SESSION s_sess=SESSION_NONE;
   static datetime s_day=0;
   static uint s_mask=0;
   datetime day=TC_DayStart(barTime);
   if(s_sess!=sess || s_day!=day) { s_sess=sess; s_day=day; s_mask=0; }
   if(addLine>=0 && addLine<POI_NLINES) s_mask|=(uint)(1u<<addLine);
   return s_mask;
  }
```

### Q2.2 — record the eviction before `ResetSequence()`

Current C1 tail:

```cpp
ENUM_SRJ_STATE prev = g_state;
g_state = ST_ABORT;
LogState(prev, g_state);
ResetSequence();
```

Replace with:

```cpp
ENUM_SRJ_STATE prev = g_state;
g_state = ST_ABORT;
LogState(prev, g_state);
if(reason == ABORT_DIV_FALLBACK && g_anchorLine >= 0 &&
   g_sessionAtEntry != SESSION_NONE && g_anchorBarTime > 0)
   EvictionMaskForSession(g_sessionAtEntry, g_anchorBarTime, g_anchorLine);
ResetSequence();
```

This preserves the existing reset semantics: all ordinary sequence state is still cleared, while the eviction memory lives outside that working set. The existing `ResetSequence()` clears `g_state`, direction, regime, anchor, latch and related fields, while session-used marks remain separate. 

### Q2.3 — make `DetectPoiRetest` able to exclude evicted candidates

The relay does **not** splice the actual `DetectPoiRetest()` body, so a whole old/new body cannot be truthfully reconstructed from this packet. The exact required contract change is:

```cpp
// old
bool DetectPoiRetest(const int barShift, PoiRetestResult &out)

// new
bool DetectPoiRetest(const int barShift, PoiRetestResult &out, const uint excludeMask=0)
```

At the detector's candidate-selection point, add exactly this exclusion before a candidate can become the authoritative result:

```cpp
if((excludeMask & (uint)(1u << candidateLine)) != 0) continue;
```

Everything else in the detector stays unchanged: same retest predicate, same 12 POI buffers, same authority ordering. Only the candidate set is filtered.

### Q2.4 — change only the IDLE seed call

Replace the existing two-line declaration/call:

```cpp
PoiRetestResult pr;
if(!DetectPoiRetest(barShift, pr) || !pr.found) { if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=RETEST inWin=1 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), (pr.found ? 1 : 0)); return; }
```

with:

```cpp
uint evictMask = EvictionMaskForSession(sess, barTime, -1);
        PoiRetestResult pr;
        if(!DetectPoiRetest(barShift, pr, evictMask) || !pr.found)
          {
           if(evictMask != 0)
              PrintFormat("[SRJ-EA] EVICT_FILTER bar=%s sess=%s mask=%u selected=none",
                          TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), evictMask);
           if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00")
              PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=RETEST inWin=1 sess=%s retestFound=%d",
                          TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), (pr.found ? 1 : 0));
           return;
          }
        if(evictMask != 0)
           PrintFormat("[SRJ-EA] EVICT_FILTER bar=%s sess=%s mask=%u selected=%s action=NEXT_BEST",
                       TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), evictMask, g_lineCode[pr.topLine]);
```

That makes the staleness decision explicit:

**Seed-time suppress the evicted line; select next-best. Do not suppress ARM; do not mark the session used; do not invent a timer; do not general-filter fresh retests.**

### Q2 line budget

Visible relay-side delta:

`+10` helper
`+3` C1 amendment
`+13` C6 replacement
`+1` detector candidate-skip predicate
`= +27 source lines`

The signature change is line-neutral. The detector body itself is not present in the relay, so that `+1` is the only non-spliced literal.

### Q2 rule preservation

**R-a:** session usage remains SIGNAL-only; the new ledger does not mark the session used. C3 and C9 preserve that. 

**R-b:** no new bar count, timeout, expiry, threshold, or timing constant; only `(session, day, evicted line)` is used. 

**R-c:** the R floor remains 1.0 inclusive; this patch does not touch TP/R validation.

**R-d:** E3 and the MEANREV-only R2 void remain untouched. 

**R-e:** no indicator buffers are added; alert-only behavior is untouched, and Q3 is isolated to the managed-exit executor. 

**Observability:** `EVICT_FILTER` is unconditional, so the new path has an explicit census row rather than silently changing the election.

**Grading bar:** 9/1 17:35 take + the six identical takes/entries/fills, 9/4-invalid still refused, `MTCOLLISION=0`; any other election delta halts, exactly as requested. 

---

## Q3 — exact exit executor

**Implement:** actual tester-only closes for `POI_BODY_BREAK`, `HTF_FLIP`, and `DAY_CLOSE`; leave SL/TP broker-owned. The current evaluator computes the verdicts but only changes paper state and emits an alert, which is why X1 and X2 show `MTEXIT` without an actual close.  

For position identity, add **one `long magicAtEntry` field to `g_mtrade`** and copy the exact session magic already chosen in E4. Do not key the exit from `g_sessionAtEntry`, because `ResetSequence()` clears that global to `SESSION_NONE`. Use the stored magic plus symbol/direction to resolve the current position ticket, then close **that ticket**. This is important on hedging accounts, where symbol-only close can select the wrong position; MQL5 explicitly supports `PositionClose(ticket)` and requires checking `ResultRetcode()` after the call. ([MQL5][1])

### Q3.1 — managed-record identity

Add to the `ManagedTrade` record:

```cpp
long magicAtEntry;
```

The struct itself is not spliced into this relay, so that field insertion cannot be shown as a complete old/new block here.

### Q3.2 — capture the same magic used by E4

E4 currently derives:

```cpp
long magic = (g_sessionAtEntry == SESSION_LONDON) ? InpMagicBase + 1 : InpMagicBase + 2;
```

immediately after the broker-send setup. 

After the existing `Buy/Sell` call succeeds, add:

```cpp
if(tradeResult) g_mtrade.magicAtEntry = magic;
```

### Q3.3 — make `vDAY` visible

Keep the existing `EXITVERDICT` block line count unchanged, changing only the format/argument:

```cpp
PrintFormat("[SRJ-EA] EXITVERDICT bar=%s dir=%s entry=%s curTp=%s vSL=%d "
                   "vTP=%d vBREAK=%s vHTF=%d vDAY=%d scope=%d "
                   "htfH=%g htfM=%g htfL=%g want=%d anti=%d tpB=%s h=%s l=%s sup=%d",
```

and add `(int)vDAY` in the corresponding argument sequence.

That directly fixes the observability defect called out by X2. The existing evaluator has `vDAY`, but its printed row omits it.  

### Q3.4 — replace the paper-only close tail

Current block begins:

```cpp
if(!(vSL || vTP || vBREAK || vHTF || vDAY)) return;
```

and then only updates `g_mtrade`, prints `MTEXIT`, emits `MTLIFE`, and alerts. 

Replace the whole contiguous block with:

```cpp
if(!(vSL || vTP || vBREAK || vHTF || vDAY)) return;

  int execReason = vBREAK ? MT_EXIT_POI_BODY_BREAK :
                   (vHTF ? MT_EXIT_HTF_FLIP : MT_EXIT_DAY_CLOSE);
  bool execLeg = !vSL && !vTP && (vBREAK || vHTF || vDAY) &&
                 InpMode == MODE_EXECUTE && MQLInfoInteger(MQL_TESTER);
  if(execLeg)
    {
     long magic = g_mtrade.magicAtEntry;
     ENUM_POSITION_TYPE want = (g_mtrade.dir == DIR_LONG) ? POSITION_TYPE_BUY : POSITION_TYPE_SELL;
     ulong ticket = 0;
     for(int pi = PositionsTotal() - 1; pi >= 0; pi--)
       {
        ulong t = PositionGetTicket(pi);
        if(t == 0 || PositionGetString(POSITION_SYMBOL) != _Symbol) continue;
        if((long)PositionGetInteger(POSITION_MAGIC) != magic) continue;
        if((ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE) != want) continue;
        ticket = t;
        break;
       }
     if(ticket == 0)
       {
        PrintFormat("[SRJ-EA] MTEXEC_FAIL bar=%s reason=%s ticket=0 magic=%I64d price=%s rc=0",
                    TimeToString(barTime, TIME_DATE|TIME_MINUTES), MtExitName(execReason),
                    magic, DoubleToString(nextOpenPx, _Digits));
        return;
       }
     g_trade.SetExpertMagicNumber(magic);
     bool closeReq = g_trade.PositionClose(ticket);
     uint rc = g_trade.ResultRetcode();
     bool stillOpen = PositionSelectByTicket(ticket);
     if(!closeReq || rc != TRADE_RETCODE_DONE || stillOpen)
       {
        PrintFormat("[SRJ-EA] MTEXEC_FAIL bar=%s reason=%s ticket=%I64u magic=%I64d price=%s rc=%u stillOpen=%d",
                    TimeToString(barTime, TIME_DATE|TIME_MINUTES), MtExitName(execReason),
                    ticket, magic, DoubleToString(nextOpenPx, _Digits), rc, (int)stillOpen);
        return;
       }
     PrintFormat("[SRJ-EA] MTEXEC bar=%s reason=%s ticket=%I64u magic=%I64d price=%s rc=%u",
                 TimeToString(barTime, TIME_DATE|TIME_MINUTES), MtExitName(execReason),
                 ticket, magic, DoubleToString(nextOpenPx, _Digits), rc);
    }

  //--- close the paper record after any required tester execution
  g_state = MT_CLOSED;
  g_mtrade.exitBarTime = barTime;
  if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;           g_mtrade.exitPrice = g_mtrade.slRef; }
  else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;     g_mtrade.exitPrice = g_mtrade.tpRef; }
  else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
  else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;     g_mtrade.exitPrice = nextOpenPx; }
  else            { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;    g_mtrade.exitPrice = nextOpenPx; }

  PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",
              TimeToString(barTime, TIME_DATE|TIME_MINUTES),
              MtExitName(g_mtrade.exitReason),
              (vBREAK ? breakLineName : "-"),
              (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),
              DoubleToString(g_mtrade.entryPrice, _Digits),
              DoubleToString(g_mtrade.exitPrice, _Digits));

  if(InpDebugLog) MtLifeEmit();
  EmitAlert("EXIT",
            StringFormat("%s%s at %s (entry %s)",
                         MtExitName(g_mtrade.exitReason),
                         (vBREAK ? " [" + breakLineName + "]" : ""),
                         DoubleToString(g_mtrade.exitPrice, _Digits),
                         DoubleToString(g_mtrade.entryPrice, _Digits)),
            true);
```

The critical points are:

`SL` and `TP` **never** invoke the manual executor; they remain broker-owned.

`BREAK`, `HTF`, and `DAY_CLOSE` execute only when `InpMode == MODE_EXECUTE && MQLInfoInteger(MQL_TESTER)`, so live alert-only behavior is unchanged. `MQL_TESTER` is the official MQL5 runtime flag for Strategy Tester execution. ([MQL5][2])

The close is by the resolved **position ticket**, not by symbol alone. `CTrade::PositionClose(ticket)` is the exact ticket overload, and `ResultRetcode()` is checked rather than treating the boolean request result as proof of execution. ([MQL5][1])

The printed close price remains `nextOpenPx`, exactly matching the existing paper leg.

### Q3 line budget

`+1` managed-record field
`+1` E2 magic capture
`+0` lines for the `vDAY` format/argument amendment
`28 → 68` lines for the E1 close tail = `+40`
**Total = +42 source lines**

The struct location is the second unspliced source region in this relay; its exact surrounding old/new block is therefore not recoverable from this packet alone.

### Q3 rule preservation

**R-a:** no session-used mark is added by exits; entry/session semantics remain unchanged.

**R-b:** no timing or bar-count rule is introduced. The existing 16:55-derived `DAY_CLOSE` verdict remains the trigger. 

**R-c:** R floor remains untouched.

**R-d:** E3 remains `MT_HTF_EXIT=false` during the experiment; the code merely provides the already-defined executor for that leg if re-enabled. 

**R-e, amended:** alerts remain the live behavior; actual manual closes are tester-only. SL/TP, the pending `CANCEL_BIAS` path, and managed-record collision logic remain untouched. 

### Accepted grading bar

This proposal accepts exactly the stated test: **8/28 11:40 `POI_BODY_BREAK` near 1.16439; 9/4 23:55 `DAY_CLOSE` near 1.16093; 9/1 17:35 take plus five other identical-bar/entry takes; 9/4-invalid still refused; `MTCOLLISION=0`; any other election delta halts.** 

**Net ruling:** Q1 is fully determined. Q2 and Q3 have concrete implementation specs, but this relay does not contain the `DetectPoiRetest()` body or the `ManagedTrade` struct, so those two source regions are the only places where a truly byte-complete old/new patch would require the builder's actual EA source rather than invented text.

[1]: https://www.mql5.com/en/docs/standardlibrary/tradeclasses/ctrade/ctradepositionclose?utm_source=chatgpt.com "PositionClose(const string,ulong) - CTrade - Trade Classes - Standard Library - MQL5 Reference"
[2]: https://www.mql5.com/en/docs/constants/environment_state/mql5_programm_info?utm_source=chatgpt.com "Running MQL5 Program Properties - Environment State - Constants, Enumerations and Structures - MQL5 Reference" 

## V259-RESQUAT-PLUS-EXIT END LUNA (verbatim close; filed whole 1x this turn, novel inbound, adopted as replay-check passed)

## V260-RESQUAT-CLEAR OPEN LUNA (his carry, relay v260 clearance ask, filed whole 1x)

Luna:
### Q1 — Re-squat half (E1–E4, +52)

**CLEARED TO BUILD.**

**R-a:** One-take-per-session is preserved: Section 1 R-a; Section 2 “Q2 F-a” clears suppression only at the S4-holder eviction and retains FIRE/EXPIRE semantics.
**R-b:** No timing rules are introduced: Section 1 R-b; Section 2 “Q2 F-a” is verdict-keyed only.
**R-c:** R floor 1.0 inclusive + replicate-all valid set are preserved: Section 1 R-c; Section 2 R-c ruling explicitly keeps the suppressed S5-refused seed outside the valid set.
**R-d:** E3/R2/Q3 remain untouched: Section 1 R-d; Section 2 “Untouched” explicitly preserves the E3 walk and R2 scope.
**R-e:** Alert-only demo bounds are preserved: Section 1 R-e; Section 2 “Untouched” and “Stages S5” require the tester-only execution envelope.

**STAGE-1 asserts:** Pre-hash must equal `15A41634798A9307D2D38EB631946F1BCCDD07171544C053F986B9416A2E7739 / 622631 B / 11330 lines`, or produce a diagnosed successor; each required identifier must occur exactly once (`g_lineCode`, `POI_NLINES`, `SessionName`, `TC_DayStart`, `DirName`, `InpMagicBase`, `g_trade Buy/Sell`, `g_mtrade dir/state/active`); every OLD anchor must match its specified bytes/char codes; `FlowLogic indicator_buffers` must remain `48/48`; `DetectPoiRetest` signature must remain unchanged, proving the detector is consumer-side untouched.

---

### Q2 — Exit-executor half (E5–E7, +54)

**CLEARED TO BUILD.**

**R-a:** One-take-per-session remains untouched: Section 1 R-a; Section 2 Q3 changes only tester-side closure of BREAK/DAY_CLOSE positions.
**R-b:** No timing rules are added: Section 1 R-b; Section 2 Q3 is verdict-keyed and preserves priority/order.
**R-c:** R floor 1.0 + replicate-all remain binding: Section 1 R-c; Section 2 Q3 does not alter setup validity or the valid set.
**R-d:** E3/R2/Q3 detector/consumer boundaries remain untouched: Section 1 R-d; Section 2 states E3 walk and R2 scope are untouched while Q3 arrival order is preserved.
**R-e (amended):** Alert-only live behavior is preserved, with broker-position closure permitted only in the tester under the specified execute gate and COMBINE-word run envelope: Section 2 Q3, “Stages S5,” and “Untouched.”

**Tester gate:** `MODE_EXECUTE` must be active **inside `MQL_TESTER`**; live behavior remains **alerts-only**; SL/TP remain broker-owned, with no live `PositionClose` path.

**Grading bar:** `8/28 11:40` close **near 1.16439**, with the prior stop fill gone; `9/4 23:55` flat **near 1.16093**, with the prior target fill gone; other exits must remain identical by the stated acceptance rules; **lots are graded second, downstream of the executed exits**. 

## V260-RESQUAT-CLEAR END LUNA (verbatim close; filed whole 1x this turn, novel inbound)

## V262-RESQUAT-CLEAR3 OPEN LUNA (his carry, relay v262 clearance ask; Luna seat sent no text this round - silence recorded, never chased)

## V262-RESQUAT-CLEAR3 END LUNA (silence marker; no inbound text arrived for this round)

## V263-RESQUAT-CLEAR4 OPEN LUNA (his carry, relay v263 clearance ask; pasted text follows verbatim)

## Q1 — Re-squat half (E1–E4, +52)

**CLEARED to build.**

**R-a:** §1 R-a binds one take per session and SIGNAL-only marking; §2 Rule F-a prohibits same `(line, dir, session, day)` re-seeding after its S4 eviction; §2 G2 requires the post-exit same-session candidate to produce `SESSION_LIMIT` and no new `PRE-SEND`.

**R-b:** §1 R-b prohibits timing/bar-count rules; E3 explicitly uses only tuple/day-key matching, with “no timer, no bar count”; EXPIRE is by day-key mismatch.

**R-c:** §1 R-c requires R≥1.0 and replication of the valid set; the §2 Rule/F-a and G2 acceptance preserve the existing valid setup and explicitly route the identified same-tuple and single-slot residuals to runtime take-join checking.

**R-d:** §1 R-d requires the detection walk to remain untouched by signature AND body hash; §2 Rule says the detection walk is untouched; S1 requires the same signature and body/shared-walk hash pre/post build.

**R-e:** §1 R-e binds the alert-only demo envelope with tester-closes-only; §2 Rule Q3 preserves alert-only/live behavior, while S5 fixes the run to the stated tester envelope.

**STAGE-1 assertions:**

* Pre-hash must equal `15A41634798A9307D2D38EB631946F1BCCDD07171544C053F986B9416A2E7739` / 622631 B / 11330 lines, or produce a DIAGNOSED successor; never assume equality.
* Exactly one hit at each exact edit anchor; no identifier-census substitution for anchor checks.
* All listed identifiers/surfaces must be available: `g_lineCode`, `POI_NLINES`, `SessionName`, `TC_DayStart`, `DirName`, `InpMagicBase`, `g_trade` Buy/Sell surface, `g_mtrade` dir/state/active, `vBREAK`, `nextOpenPx`, `InpMode`, `MODE_EXECUTE`, `ResultRetcode`, and `Trade.mqh`.
* Every OLD anchor must byte-match the filed OLD text via char-code assertion.
* Detector signature AND body/shared-walk hash must remain identical post-build.
* FlowLogic buffer declaration VALUE remains 48 and the binding census remains identical pre/post.
* `MarkSessionUsed(` remains exactly 3 textual hits total, with exactly 2 call sites at the stated locations.
* `ENUM_SRJ_DIR`, `ENUM_SRJ_SESSION`, `DIR_NONE`, and `SESSION_NONE` remain above EA 1803.
* E4 capture of `g_anchorLine`, `g_dir`, and `g_sessionAtEntry` must precede `GoAbort`.
* `g_anchorLine=-1` writers remain exactly `{976 declaration, 6274 ResetSequence->IDLE, 7787 R2->IDLE}`, with no reachable writer holding S5 state.
* Scope must be E1–E7 only, and the literal NET recount must be `+105` total: Q1 `+52`, Q2 `+53`, post-build EA `11435` lines.

## Q2 — Exit-executor half (E5–E7, +53)

**CLEARED to build.**

**R-a:** §1 R-a remains SIGNAL-only for session consumption; §2 Q3 adds only BREAK/DAY_CLOSE broker closing and does not create a new SIGNAL/take.

**R-b:** §1 R-b remains free of timing/bar-count entry rules; Q3 exit activation is verdict-keyed (`vBREAK || vDAY`), not timer-keyed.

**R-c:** §1 R-c keeps R≥1.0 and the existing valid-set replication requirement; §2 G3 makes all non-exit families state-identical to RECON59 apart from the explicitly downstream 9/1 take and two executed exits.

**R-d:** §2 Rule expressly leaves the detection walk untouched; S1/S3 require unchanged signature and body/shared-walk hash.

**R-e (amended):** §2 Rule and S5 require tester-closes-only. `MtCloseBrokerPosition()` sends only when **both** `InpMode == MODE_EXECUTE` **and** `MQLInfoInteger(MQL_TESTER) != 0`; otherwise it prints `SKIP-NO-SEND` and returns, so live execution remains alerts-only.

**Grading bar:** bars are authoritative first, lots second. The required exit evidence is `8/28 11:40` near `1.16439`, with the prior stop fill gone, and `9/4 23:55` near `1.16093`, with the prior target fill gone. The MTCLOSE family must join the corresponding BREAK/DAY_CLOSE rows with the execution `ok`/retcode evidence; no SL/TP, HTF, or CANCEL_BIAS executor legs are permitted.

## V263-RESQUAT-CLEAR4 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)

## V264-RESQUAT-CLEAR5 OPEN LUNA (his carry, relay v264 clearance ask; pasted text follows verbatim)

## Verdict

### Q1 — **Q1 NOT-CLEAR**

The re-squat rule is correctly expressed in the normal one-eviction case, but the implementation has a material tuple-loss defect that the packet itself explicitly acknowledges.

The suppression state is only one tuple: `g_evictSuppressLine/Dir/Sess/Day`.  Each new S4 eviction unconditionally writes those four fields again.  Therefore, a second eviction in the same session/day can overwrite the first tuple before its candidate is tested. The packet explicitly names this as the “single-slot overwrite” residual. 

That is not merely observational: F-a is tuple-specific — “the (line, dir, session, day) evicted … may not re-seed.”  A two-eviction sequence can therefore lose the first tuple's suppression memory and permit precisely the re-seed F-a is supposed to prevent.

**Gate delta:** this is a logic change, not a text-only clarification. I would not clear E1-E4 until the suppression state can retain every eviction tuple that remains live, or an equivalent invariant is actually established and enforced.

### Q2 — **Q2 NOT-CLEAR**

The v6 `exitReason` gate fixes the specific Astra defect from v263: E7 now executes only for the winning `BREAK` or `DAY_CLOSE` reason, rather than the bare `vBREAK || vDAY` predicate.  The SL-first priority chain is also preserved. 

But two executor-level correctness gaps remain.

**1. The broker position is not uniquely identified.**
`MtCloseBrokerPosition()` scans positions and closes the first position whose symbol matches and whose magic is `InpMagicBase+1` or `+2`.  The packet says the magic is an entry-session convention, not a unique entry identifier.  Thus the executor has not proved that the selected ticket is the position represented by `g_mtrade`. A stale or additional position with the same session magic could satisfy the scan first.

**2. Paper closure and broker closure can diverge silently.**
The evaluator sets `g_mtrade.state = MT_CLOSED` and records the winning exit before calling the broker executor.  The call's return value is ignored at E7.  Inside the helper, `PositionClose()` produces `ok` and a retcode print, but that result is merely returned; there is no caller-side failure handling or post-close position verification.  Consequently, a failed/partial broker close can leave the broker position open while the paper state is already `MT_CLOSED`.

So the v6 repair closes the prior Astra finding, but it does **not** establish exact-position execution or broker/paper convergence.

---

## Analytic ask A — defects, gaps, imprecision

**Q1 / E1-E4**

1. **Single-slot suppression storage can overwrite a still-live tuple.** E1 declares exactly one `(line, dir, session, day)` record; E4 overwrites it on each eviction.   This is the material Q1 blocker.

2. **The packet acknowledges the overwrite but does not define its acceptance treatment.** It is classified as “watched,” even though it can violate the literal F-a invariant. 

3. **The R-c tuple residual is likewise explicitly unresolved.** The packet says a later independent valid setup on the same tuple may be suppressed and calls this “watched.”  The page does not establish why that suppression is acceptable under the stated replicate-all-valid-set rule.

4. **E4 has no runtime defensive bound before indexing `g_lineCode[s4e_line]`.** The page relies on the S4 invariant/Stage-1 assertion that `0 <= g_anchorLine < POI_NLINES`.  The print itself indexes the captured value without a local guard.  This is survivable if the existing state invariant is genuinely guaranteed, but the implementation is not self-defending.

**Q2 / E5-E7**

5. **Executor selection is session-magic based, not entry-identity based.** The scan accepts either `InpMagicBase+1` or `+2` and takes the first match. 

6. **The stated “single-record invariant” does not itself prove unique broker-position identity.** The packet asserts it as the rationale for the scan, but the code shown does not encode a direct relationship between `g_mtrade` and the ticket being closed. 

7. **Broker-close failure is not part of the state machine.** `MT_CLOSED` is committed before the broker close attempt.  The E7 call discards the helper's boolean result. 

8. **`ok` is not equivalent to confirmed execution.** The helper prints `ResultRetcode()` but does not make that retcode authoritative for state transition, nor does it verify that the target position actually disappeared after the close request. 

9. **The acceptance criteria do not explicitly require broker-position identity matching.** G3/G4 require successful-looking `MTCLOSE` evidence and the expected bars/prices, but they do not contain a join proving “executor ticket = managed-entry ticket.” 

10. **`SKIP-NO-SEND` and `NOTHING-TO-CLOSE` are correctly treated as hard-stop outcomes for this run, but executor failure itself is not equivalently specified as a halt class.** 

---

## Analytic ask B — better mechanisms

### For E1-E4: replace the singleton suppression tuple with a small tuple set

The cleanest mechanism is a bounded per-session/day suppression set keyed by `(POI line, direction, session, day)` rather than four singleton globals.

Touch the current E1 storage at **129-135**, the FIRE clear logic at **173-191**, the IDLE read gate at **223-241**, and the E4 writer at **277-299**.    

Because `POI_NLINES` is 15 and direction is binary, a compact bitset per session/day would be enough and would eliminate the overwrite class entirely without indicator buffers.

### For E5/E7: bind the executor to the exact managed position

The stronger design is to capture the actual broker position ticket when the entry is filled, store that ticket with `g_mtrade`, and have E5 close **that ticket only**.

The relevant entry surface is the magic assignment and Buy/Sell path at **EA 10170, 10214, 10220-10222**, which the packet already identifies.  The executor at **335-359** then becomes `PositionSelectByTicket(g_mtrade.ticket)` rather than a symbol/magic census. 

Then make the broker-close result an explicit state/acceptance transition: inspect the trade-server retcode and verify the ticket is actually closed before treating the broker leg as successfully executed. The current E7 call at **477-481** should consume that result rather than discard it. 

**Bottom line:** v6 successfully repairs the previously identified E7 predicate bug, but I would **NOT-CLEAR both Q1 and Q2** because the remaining issues are substantive execution-state invariants, not packaging or wording defects.

## V264-RESQUAT-CLEAR5 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)

## V265-RESQUAT-CLEAR6 OPEN LUNA (his carry, relay v265 clearance ask; pasted text follows verbatim)

Q1: **Q1 NOT-CLEAR.** The v7 set mechanism removes the singleton-overwrite defect, but the tuple identity needed by F-a is not fully proven on the page: E3 tests `(pr.topLine, pr.isLong, sess, rsq_day)` at the E3 gate, while E4 records `(g_anchorLine, g_dir, g_sessionAtEntry, s4e_day)` after the abort. The fence proves `g_dir` is assigned through `S2ResolveLive` (EA 7739), but does not prove `g_anchorLine == pr.topLine`, `g_sessionAtEntry == sess`, or that `g_dir` cannot be changed between E3 and E4. Those are the actual suppression-key equivalence conditions. Also, S1 says `recount +137 NET` while every mechanical recount in the packet says **+138 / 11468**; that is a direct gate-text contradiction. E1 ~EA 1803; E3 ~EA 7730-7759; E4 ~EA 8802-8828.

Q2: **Q2 NOT-CLEAR.** The entry-latched ticket design is materially better than the rejected either-magic close scan, and E5 does close by a stored ticket, but E8c still derives that ticket by scanning all positions matching symbol + magic and choosing the greatest `POSITION_TIME` (EA 10236 onward). That is not a deterministic transaction-to-position identity proof when two qualifying positions share the same second, which remains possible under the packet's own MTCOLLISION/multi-position boundary. The stronger invariant is “ticket belongs to the fill that produced this managed record,” which the current page does not prove. E5 ~EA 11095 onward; E8c EA 10236-10255; MTCOLLISION EA 10115-10129.

**Analytic A — defects/gaps/imprecision**

1. **Suppression-key equivalence gap:** E3 compares `pr.topLine`/`pr.isLong`/`sess`; E4 stores `g_anchorLine`/`g_dir`/`g_sessionAtEntry`. Only the direction bridge is partially established. The line and session bridges are asserted, not demonstrated. E3 ~7730; E4 ~8802.

2. **Direction lifetime gap:** EA 7739 establishes one write of `g_dir`, but the page does not provide a writer census or an invariant that it cannot change before the S4 eviction at ~8802.

3. **Day-key stale-state imprecision:** E3 clears a day-mismatched bitset but leaves `g_evictDayLon/NY` unchanged. That is functionally nonblocking, but “EXPIRE ... clears it” is not literally “reset key to current day.” E3 ~7740-7750. E4 later repairs the key when an eviction is actually recorded.

4. **Global budget contradiction:** S1 requires **+137**, while S2, section 3, and the packet header require **+138** and 11468 lines. This must be reconciled before a staged gate can be considered deterministic.

5. **Ticket capture is latest-time selection, not direct fill identity:** E8c's `POSITION_TIME >= entryTickTime` rule does not uniquely identify the just-created position under equal-second timestamps. EA 10236 onward.

6. **Execution-success semantics are split:** E5 consumes `PositionClose()`'s boolean, but acceptance separately treats `ResultRetcode()` and the close deal as authoritative execution evidence. The code therefore does not itself make `mtexecOk == true` equivalent to “broker close completed.” EA E5/E7; acceptance G3.

7. **“Entry-latched ticket” wording is stronger than the implementation:** the ticket is latched immediately after fill, but its selection method is still an inference over the position set rather than a direct linkage to the executed entry transaction.

**Analytic B — better mechanisms**

For Q1, the cleanest mechanism is to carry the exact tuple produced by the E3 candidate through the S4-abort path: store `pr.topLine`, `pr.isLong`, and the resolved session/day used by that evaluation, then ARM exactly that tuple after `GoAbort`. That removes the need to prove equivalence between two independently sourced state variables. It touches E3 ~7730 and E4 ~8802.

For Q2, derive the newly opened **position identity from the executed transaction/deal result**, then resolve that position's ticket, rather than selecting the newest position by symbol/magic/time. That makes the `ENTRY_TICKET → MTCLOSE` join transaction-specific and survives same-second/multi-position cases. It touches E8c ~10236 and leaves E5's ticket-only close architecture intact.

The two halves therefore remain independently halted: **Q1 NOT-CLEAR and Q2 NOT-CLEAR.**

## V265-RESQUAT-CLEAR6 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)

## V266-RESQUAT-CLEAR7 OPEN LUNA (his carry, relay v266 clearance ask; pasted text follows verbatim)

## Q1 — CLEAR

**Q1 CLEAR.** The re-squat half (E1–E4, +81) is sufficiently pinned to build. The key v265 issue is closed on the page: the post-gate latch binds line/dir/time/session in the same evaluation; the t78 replacement keeps line+direction paired; the B3 candidate is constrained to the `POI_NLINES` ordinal domain with an explicit bounded walk and ordinal return. 

The acceptance also has the right targeted checks for the stated behavior: the 9/1 16:55 suppression, tuple join against the earlier eviction, FIRE-vs-take relation, R-a session limit, anchor election, and suppression-row census. 

**Q1 gate delta:** none. The v8 bridge material is text/proof only; it does not alter Q1 selection logic. 

## Q2 — NOT-CLEAR

**Q2 NOT-CLEAR.** Two page-level defects remain material:

1. **The E8c identity conversion is not proved.** E8c takes `DEAL_POSITION_ID` into `entryPid` and then passes that value directly to `PositionSelectByTicket(entryPid)`. The packet calls the resulting value a broker position ticket, but it never proves on the page that the identifier returned by `DEAL_POSITION_ID` is the ticket required by `PositionSelectByTicket`. That is the central identity invariant the new executor depends on. 

2. **The tri-state `1 = sent-ok` contract is stronger than the implemented predicate.** `MtCloseBrokerPosition()` returns `1` solely when `CTrade::PositionClose(ticket)` returns boolean `true`; it does not gate that return on an execution-success `ResultRetcode()`. Yet the stated Q2 rule defines `1` as `sent-ok`, and G3 requires execution success to be established from the retcode.   

### Analytic A — other defects / gaps / imprecisions

**Q1**

* The EXPIRE path clears the suppression bits but leaves the corresponding `g_evictDay*` unchanged until a later ARM. That is nonblocking as implemented, but the wording “EXPIRE ... clears it” is less precise than the actual state transition. 
* The claimed “every evicted tuple” persistence is intentionally terminated by FIRE clearing the entire session set. That matches the stated F-a rule, but the terminology “retains every evicted tuple” is only true until the first signal consumes the session. 

**Q2**

* A failed E8c latch (`entryTick == 0`) is only exposed by `ENTRY_TICKET`; there is no immediate entry-time failure state. The failure is deferred until a later winning exit attempts the close. 
* G3 requires a joined **close deal**, while the E5 print shown here exposes `retcode` but not the close `ResultDeal()`/deal identity. The packet does not show the mechanical source of that later close-deal join.  

### Analytic B — better mechanism

For **Q2**, make the identity contract explicit at E8c/E5: resolve and store an identifier that is unambiguously the value required by the close-selection API, rather than treating `DEAL_POSITION_ID` as a ticket by assertion. Then make the executor’s `1` state depend on an explicit retcode-success predicate, and preferably record the resulting close deal for the G3 join. The affected regions are E8c **EA 10236–10251**, E5 **EA 11095 onward / helper body**, and the E7 consume site **EA 11294 onward**.   

**Net ruling: Q1 CLEAR; Q2 NOT-CLEAR.**

## V266-RESQUAT-CLEAR7 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)

## V267-RESQUAT-CLEAR8 OPEN LUNA (his carry, relay v267 clearance ask; pasted text follows verbatim)

## Q1 — CLEAR

**Q1 CLEAR.** No remaining page-level contradiction in E1–E4 requires a build halt. The v266 blockers are addressed in the v9 literals: the +138/+152 recount defect is repaired, the E3 read gate and E4 capture are tied to the same candidate tuple, the session/direction/line bridges are explicitly fenced, and the suppression state is a per-session/day bitset rather than a single overwritable slot.

**Gate delta:** none beyond the stated S1–S5 gates and the +81 net recount.

### Q1 — remaining defects / imprecisions

1. **E4 direction validation is weaker than the stated invariant.**
   In the E4 ARM guard, the condition is:
   `s4e_dir != DIR_NONE`
   followed by:
   `s4e_line * 2 + (s4e_dir == DIR_LONG ? 0 : 1)`.
   This proves “not NONE,” but does not literally prove `s4e_dir ∈ {DIR_LONG, DIR_SHORT}`. Any impossible third enum value would be encoded as SHORT. This is nonblocking because the page also fences the live writer domain to the two documented directions, but the guard is weaker than the prose claim.
   **Location:** E4, EA 8802–8808 replacement block; specifically the record-validity/index-guard expression and `s4e_bit` calculation.

2. **E3 session-domain guard is implicit rather than explicit.**
   The read gate has `if(sess == SESSION_LONDON) ... else if(sess == SESSION_NYAM) ...` with no explicit invalid-session rejection. The packet elsewhere treats only those two sessions as live. Again nonblocking under the stated writer/call-site constraints, but the literal is narrower than the general “live tuple” language.
   **Location:** E3, EA 7730 onward, the two session branches.

3. **`EVICTSUPPRESS_SKIP` is an intentionally impossible expected-zero path, but its relation to S1 could be clearer.**
   The packet correctly says a dead record emits `EVICTSUPPRESS_SKIP` while `RESEED_BLOCKED action=INDEX-INVALID` is a separate guard. The acceptance then requires both to be zero. That is coherent, but the two “protective” paths are easy to conflate.
   **Location:** E4 replacement block around EA 8802 onward; G2 expected-zero predicates.

These do not alter the Q1 clearance.

---

## Q2 — CLEAR

**Q2 CLEAR.** The v9 Q2 literals close the specific v266 gaps on the page: E8c now derives the latch from the entry deal and validates `POSITION_IDENTIFIER`; E5 returns the stated tri-state and gates success on `TRADE_RETCODE_DONE`; E7 consumes that return only for the winning BREAK/DAY_CLOSE verdicts; and the reference price is now `g_mtrade.exitPrice`, eliminating the prior `nextOpenPx` scope ambiguity.

**Gate delta:** none beyond the stated S1–S5 gates and the +71 net recount.

### Q2 — remaining defects / imprecisions

1. **The execution-time identity proof is only an entry-time proof.**
   E8c validates:
   `DEAL_POSITION_ID -> current position -> POSITION_IDENTIFIER == entryPid`, then stores the position ticket.
   E5 later closes by that stored ticket alone:
   `PositionSelectByTicket(ticket)`.
   Therefore, the page proves the ticket was correct **when latched**, but not that the ticket is still the position carrying the same identifier at exit. The packet itself acknowledges that the position ticket is service-mutable. In the bounded tester envelope this is not necessarily exercised, so I do not make it a clearance halt; it is the principal remaining mechanism gap.
   **Locations:** E8c, EA 10236–10261; E5 helper above EA 11095; specifically `ulong ticket = g_mtrade.ticket;` and `PositionSelectByTicket(ticket)`.

2. **`action=%d` is the CTrade boolean, not the packet's tri-state status.**
   E5 prints `(int)ok`, while the actual tri-state is the helper return:
   `-1 / 0 / 1`.
   Thus a request can print `action=1` while still returning `0` if `ok==true` but `closerc != TRADE_RETCODE_DONE`. `MTCLOSE_FAIL` catches that case, so execution gating is still correct, but the log field named `action` is semantically less precise than the surrounding tri-state prose suggests.
   **Location:** E5 helper, the `MTCLOSE` `PrintFormat` immediately before `return (ok && closerc == TRADE_RETCODE_DONE ? 1 : 0);`.

3. **`closedeal` appears in the S1 new-name collision list but is not actually a local in the filed E5 code.**
   The filed code uses `g_trade.ResultDeal()` inline. That is harmless functionally, but the packet's S1 name inventory and the machine-fence inventory are not perfectly synchronized.
   **Locations:** S1(2b) `closedeal` list; section 3 new-local census; E5 helper `PrintFormat`.

4. **The current G3 join proves ticket/deal correspondence through the logs, but the close-deal is not independently validated against the entry `pid` in code.**
   The E5 log prints the close deal, and the acceptance asks the tester to join it externally. The code itself gates success on `ok && retcode==DONE`, not on a post-close history check that the returned close deal has the expected position identifier. That is acceptable for the stated evidence battery, but a stronger implementation would make the identity join executable rather than purely log-audited.
   **Location:** E5 helper, `g_trade.ResultDeal()` print and return; G3 deal-ticket-identifier join.

None of these defeats the stated v9 build objective under its bounded S5 tester envelope.

---

## Analytic B — stronger mechanisms

The clearest upgrade for Q2 would be to **persist `entryPid` alongside `ticket` and re-resolve the current position ticket by `POSITION_IDENTIFIER` immediately before closing**:

`stored entry deal -> stored pid -> scan current positions -> exact current ticket -> verify symbol/magic -> PositionClose(currentTicket)`.

That would touch the E8a/E8b/E8c capture path and the E5 helper, while preserving the existing deal-derived admission logic. It would directly use the lifecycle-stable identity that motivated the v9 repair, rather than relying on the entry-time ticket remaining unchanged.

A second, smaller hardening is to make the printed `action` field the actual tri-state result, or rename it to `ok=` so it cannot be mistaken for the helper's `-1/0/1` status. This touches only the E5 `MTCLOSE` print.

### Bottom line

**Q1 CLEAR — no gate delta.**
**Q2 CLEAR — no gate delta.**

The remaining findings are implementation-hardening and wording/observability issues, not page-level contradictions that require halting this v9 build.

## V267-RESQUAT-CLEAR8 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)

## V268-RESQUAT-CLEAR9 OPEN LUNA (his carry, relay v268 clearance ask; pasted text follows verbatim)

## Verdicts

**Q1: Q1 CLEAR.**
E1–E4 implement the stated F-a tuple-scoped suppression coherently, and the page contains the required tuple/session/day bridges and capture-before-reset ordering.

**Gate delta: none.** The Q1 edits remain text/code as specified; I do not see a remaining contradiction that requires another code change before the requested build.

**Q2: Q2 NOT-CLEAR.**
The pid-based close mechanism is substantially repaired, but two page-level defects remain material to the authoritative G3 acceptance.

### Q2 defects

**1. The authoritative ticket-join invariant conflicts with the new pid re-resolution mechanism.**
At E8c, the original broker ticket is persisted in `g_mtrade.ticket` and the lifecycle pid in `g_mtrade.entryPid`. At E5, however, the live ticket is re-found by scanning positions for `POSITION_IDENTIFIER == entryPid` and the resulting `ticket` is used for `PositionClose(ticket)`. That means the close ticket is permitted to differ from the fill-time `g_mtrade.ticket`.

But G3 simultaneously requires:

> every `MTCLOSE ticket == an ENTRY_TICKET ticket`

The relevant regions are E8a/E8b/E8c, E5, and G3. This is internally inconsistent once the very ticket mutation scenario that motivated pid persistence is admitted.

**Required repair:** make pid the authoritative identity join in G3. The invariant should be `MTCLOSE.closepid == ENTRY_TICKET.pid == managed entryPid`; the current close ticket may differ from the original fill ticket. Alternatively, code would have to forbid ticket change, which defeats the stated purpose of the pid re-resolution.

**2. “Successful close” does not prove the managed position is actually flat.**
E5 returns `1` when:

`ok && closerc == TRADE_RETCODE_DONE && closepid == entryPid && closeentry == DEAL_ENTRY_OUT`

There is no post-close assertion that no live position with `POSITION_IDENTIFIER == entryPid` remains. A successful exit deal can establish the requested deal identity without, by itself, proving complete liquidation of the position. The acceptance phrase “1 = completed-close result” therefore overstates what the predicate currently proves.

Relevant region: **E5, the final return predicate immediately after the MTCLOSE `PrintFormat`.**

**Required repair:** after the close result/deal validation, assert that no live position bearing `entryPid` remains before returning `1`; otherwise return `0` and emit the existing failure path.

**3. Minor wording imprecision, not independently fatal:**
The E5 comment says the pid resolution uses “never a scan,” but the implementation explicitly performs a `PositionsTotal()` loop with `PositionGetTicket()`/`PositionSelectByTicket()`. The mechanism is a **pid-filtered position scan**, not “never a scan.” This is documentation imprecision rather than a separate clearance blocker, but it should be corrected.

### D2 ruled question

**D2: TEXT-ONLY.** No `HistorySelect`-family addition is needed for the stated operation because E5/E8c operate on a specific deal ticket and use `HistoryDealSelect(dealTicket)` directly. The packet can close D2 with this sentence:

> **“D2 is TEXT-ONLY: the executor needs only direct selection of the specific deal ticket returned by CTrade, so HistorySelect-family enumeration is not required for the E8c/E5 identity checks.”**

### Analytic B — better mechanism

For the stated executor goal, the cleanest identity model is:

**entry deal → `DEAL_POSITION_ID` → managed `entryPid` → resolve current live ticket by pid → close → returned close deal → `DEAL_POSITION_ID` + exit classification → verify no position with that pid remains.**

That touches **E5 and G3**, while E8c remains the capture/validation point. It removes the contradictory original-ticket equality requirement and makes the final `action=1` predicate prove actual closure rather than merely a successful exit deal.

## Bottom line

**Q1 CLEAR — no gate delta.**
**Q2 NOT-CLEAR — amend G3's ticket-equality invariant and add a post-close-flatness check in E5 before the `return 1`.**

## V268-RESQUAT-CLEAR9 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)

## V269-RESQUAT-CLEAR10 OPEN LUNA (his carry, relay v269 clearance ask; pasted text follows verbatim)

## Verdict

**Q1 CLEAR.**
The re-squat half is internally coherent on the page. E1-E4 preserve the stated tuple-scoped F-a behavior: set storage at the declarations above EA 1803; FIRE in `MarkSessionUsed` at the EA 1813-1818 replacement; candidate read gate at EA 7730-7732; pre-`GoAbort` capture and ARM at EA 8802-8808. `POI_NLINES == 12` is pinned at EA 86, so the 30-bit `int` representation safely covers all 24 `(line,dir)` combinations. The existing R-c residual remains explicitly named rather than hidden. **Gate delta: none.**

**Q2 NOT-CLEAR.**
The execution logic itself is substantially sound, but the packet's required G3 evidence is not fully observable from the successful close row. The E5 helper at the shared EA 11095 site re-resolves by `entryPid`, validates `closepid == entryPid`, requires `DEAL_ENTRY_OUT`, and then proves no live position remains. MQL5 documents `POSITION_IDENTIFIER` as lifecycle-stable and `DEAL_POSITION_ID` as the identifier carried by closing deals; `PositionClose(ulong ticket)` closes the specified ticket, with the trade-server retcode requiring separate validation. ([MQL5][1])

The defect is in the **successful `MTCLOSE` telemetry inside E5**: its `PrintFormat` contains `ticket`, `magic`, `action`, `retcode`, `deal`, `closepid`, `closeentry`, and `ref`, but **does not print `entryPid`**. That conflicts with G3's pid-authoritative acceptance rule and with the packet's own statement that tickets are diagnostic only and may change while the pid remains authoritative. A successful row therefore cannot independently demonstrate `closepid == ENTRY_TICKET pid` when a service re-ticket occurs. The code checks the relation internally, but the required executed evidence does not expose both sides of the join.

### Analytic A — defects / gaps / imprecisions

1. **Q2 blocking: missing successful-close `entryPid` telemetry.**
   E5 shared insertion at EA 11095; specifically the `MTCLOSE` `PrintFormat` block. G3 requires a pid-authoritative join, while the success row omits the entry pid.

2. **Q2 observability: flatness is enforced but not printed.**
   The final `MtPidToTicket(entryPid) != 0` test is a real gate, so the logic is fail-closed. But there is no explicit `flat=1`/`flat=0` field. G3's “proved-flat” evidence therefore depends on inference from the absence of `MTCLOSE_FAIL`, rather than a directly recorded predicate result.

3. **Q2 observability: `action=%d` is the raw `ok` boolean, not the final execution status.**
   E5 can print `action=1` while `ResultRetcode()` is not `TRADE_RETCODE_DONE`; the later predicate then returns failure. That is logically safe, and the packet explicitly says action alone is not proof, but the field name is semantically ambiguous.

4. **S5 is a stage/run gate rather than a code-local gate.**
   The helper itself only enforces `MODE_EXECUTE && MQL_TESTER`; the hedging-only condition is asserted by S5 before the run. That is acceptable as the stated run protocol, but it is not independently enforced inside `MtCloseBrokerPosition`.

5. **Q1 remains deliberately tuple-scoped.**
   A later independently valid setup on an evicted `(line,dir,session,day)` remains blocked until FIRE or EXPIRE. The packet names this R-c residual and correctly attaches halt-on-take-loss; it is not an accidental defect, but it remains a material behavioral limitation of F-a.

6. **Q1 day-key correctness is envelope-dependent.**
   E2 keys FIRE from `g_anchorBarTime`, while E3/E4 key suppression from `barTime`. The packet closes that potential mismatch through the stated London/NYAM no-server-midnight-straddle premise at EA 1787-1790. Thus this is not a present halt, but the equivalence is demonstrated by the run envelope rather than enforced generically in the code.

### Analytic B — better mechanism

For the Q2 evidence contract, I would make the **successful MTCLOSE row self-contained** at the E5 `PrintFormat` site:

```text
... ticket=%I64u entryPid=%I64d magic=%I64d action=%d retcode=%d
   deal=%I64u closepid=%I64d closeentry=%d flat=%d ref=%s
```

Populate `flat` from the same final `MtPidToTicket(entryPid) == 0` predicate that currently governs `return 1`. Also expose a final `status`/`mtexecRc` field rather than relying on the overloaded `action` boolean. This does not change selection or execution semantics; it makes the G3 join and proved-flat claim directly auditable from each successful close row.

**Therefore: Q1 clears; Q2 remains halted on the page as written, solely because the required pid-authoritative successful-close evidence is under-specified in the actual `MTCLOSE` print.**

[1]: https://www.mql5.com/en/docs/constants/tradingconstants/positionproperties?utm_source=chatgpt.com "Position Properties - Trade Constants - Constants, Enumerations and Structures - MQL5 Reference"

## V269-RESQUAT-CLEAR10 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)

## V270-RESQUAT-CLEAR11 OPEN LUNA (his carry, relay v270 clearance ask; pasted text follows verbatim)

## Verdict

**Q1 CLEAR.**
The re-squat half is internally coherent on the page. E1-E4 preserve the stated tuple-scoped F-a behavior: set storage at the declarations above EA 1803; FIRE in `MarkSessionUsed` at the EA 1813-1818 replacement; candidate read gate at EA 7730-7732; pre-`GoAbort` capture and ARM at EA 8802-8808. `POI_NLINES == 12` is pinned at EA 86, so the 30-bit `int` representation safely covers all 24 `(line,dir)` combinations. The existing R-c residual remains explicitly named rather than hidden. **Gate delta: none.**

**Q2 NOT-CLEAR.**
The execution logic itself is substantially sound, but the packet's required G3 evidence is not fully observable from the successful close row. The E5 helper at the shared EA 11095 site re-resolves by `entryPid`, validates `closepid == entryPid`, requires `DEAL_ENTRY_OUT`, and then proves no live position remains. MQL5 documents `POSITION_IDENTIFIER` as lifecycle-stable and `DEAL_POSITION_ID` as the identifier carried by closing deals; `PositionClose(ulong ticket)` closes the specified ticket, with the trade-server retcode requiring separate validation. ([MQL5][1])

The defect is in the **successful `MTCLOSE` telemetry inside E5**: its `PrintFormat` contains `ticket`, `magic`, `action`, `retcode`, `deal`, `closepid`, `closeentry`, and `ref`, but **does not print `entryPid`**. That conflicts with G3's pid-authoritative acceptance rule and with the packet's own statement that tickets are diagnostic only and may change while the pid remains authoritative. A successful row therefore cannot independently demonstrate `closepid == ENTRY_TICKET pid` when a service re-ticket occurs. The code checks the relation internally, but the required executed evidence does not expose both sides of the join.

### Analytic A — defects / gaps / imprecisions

1. **Q2 blocking: missing successful-close `entryPid` telemetry.**
   E5 shared insertion at EA 11095; specifically the `MTCLOSE` `PrintFormat` block. G3 requires a pid-authoritative join, while the success row omits the entry pid.

2. **Q2 observability: flatness is enforced but not printed.**
   The final `MtPidToTicket(entryPid) != 0` test is a real gate, so the logic is fail-closed. But there is no explicit `flat=1`/`flat=0` field. G3's “proved-flat” evidence therefore depends on inference from the absence of `MTCLOSE_FAIL`, rather than a directly recorded predicate result.

3. **Q2 observability: `action=%d` is the raw `ok` boolean, not the final execution status.**
   E5 can print `action=1` while `ResultRetcode()` is not `TRADE_RETCODE_DONE`; the later predicate then returns failure. That is logically safe, and the packet explicitly says action alone is not proof, but the field name is semantically ambiguous.

4. **S5 is a stage/run gate rather than a code-local gate.**
   The helper itself only enforces `MODE_EXECUTE && MQL_TESTER`; the hedging-only condition is asserted by S5 before the run. That is acceptable as the stated run protocol, but it is not independently enforced inside `MtCloseBrokerPosition`.

5. **Q1 remains deliberately tuple-scoped.**
   A later independently valid setup on an evicted `(line,dir,session,day)` remains blocked until FIRE or EXPIRE. The packet names this R-c residual and correctly attaches halt-on-take-loss; it is not an accidental defect, but it remains a material behavioral limitation of F-a.

6. **Q1 day-key correctness is envelope-dependent.**
   E2 keys FIRE from `g_anchorBarTime`, while E3/E4 key suppression from `barTime`. The packet closes that potential mismatch through the stated London/NYAM no-server-midnight-straddle premise at EA 1787-1790. Thus this is not a present halt, but the equivalence is demonstrated by the run envelope rather than enforced generically in the code.

### Analytic B — better mechanism

For the Q2 evidence contract, I would make the **successful MTCLOSE row self-contained** at the E5 `PrintFormat` site:

```text
... ticket=%I64u entryPid=%I64d magic=%I64d action=%d retcode=%d
   deal=%I64u closepid=%I64d closeentry=%d flat=%d ref=%s
```

Populate `flat` from the same final `MtPidToTicket(entryPid) == 0` predicate that currently governs `return 1`. Also expose a final `status`/`mtexecRc` field rather than relying on the overloaded `action` boolean. This does not change selection or execution semantics; it makes the G3 join and proved-flat claim directly auditable from each successful close row.

**Therefore: Q1 clears; Q2 remains halted on the page as written, solely because the required pid-authoritative successful-close evidence is under-specified in the actual `MTCLOSE` print.**

[1]: https://www.mql5.com/en/docs/constants/tradingconstants/positionproperties?utm_source=chatgpt.com "Position Properties - Trade Constants - Constants, Enumerations and Structures - MQL5 Reference"

## V270-RESQUAT-CLEAR11 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V271-DAY2355-CLEAR1 LUNA (verbatim open; novel inbound, counts 0)
Luna:
**Q1: DISCREPANCY —** the E1 condition at **C11429 / P039** should set `vDAY` on the first evaluation of the new 23:55 bar, assuming `barTime` is the just-closed 23:50 bar and `PeriodSeconds()` is 300 seconds; the original `mark <= barTime` path remains for Monday fallback. However, the pasted E1 block does **not by itself prove “execute exactly the 23:55 open”**: that depends on the unseen construction of `nextOpenPx` and the actual behavior of `MtCloseBrokerPosition()` at **C11453-C11469**. The supplied `FRIDAY-2355-EVAL` row showing `vDAY=0` is **RECON60 baseline evidence, not v2 behavior**, so it neither refutes nor proves the insert.

### Analytic A — defects, gaps, and imprecisions

1. **Exact-fill claim is stronger than the shown code proves.**
   **P013-P015, P049; C11455-C11469.**
   E1 only changes election timing. The actual executor still does:
   `exitPrice = nextOpenPx` at **C11455**, then passes that value to `MtCloseBrokerPosition()` at **C11469**. Neither the calculation of `nextOpenPx` nor the close-function implementation is present. Therefore the page establishes the intended reference price, not guaranteed equality of the broker/tester deal price to that reference.

2. **The “23:55-open” assertion is direction-specific as written.**
   **P015, P020, P049, C11455.**
   The text explicitly relies on “the first tick of the 23:55 bar, whose **bid** IS the bar open.” That directly describes a sell-at-bid close. A DAY_CLOSE applied to a short position would be a buy-side close, and the page contains no side-specific ask/open treatment. So the universal requirement “every DAY_CLOSE deal fill == iOpen” is not established for both trade directions by the shown mechanism.

3. **`PeriodSeconds()` is not explicitly locked to M5.**
   **P036-P039 / C11429.**
   The comment describes a fixed 5-minute relationship, but the predicate uses `PeriodSeconds()` without an explicit period. If the EA/chart period is ever not M5, the lookahead is no longer exactly one 5-minute bar. If the caller invariant is permanently M5, this is harmless operationally, but the code itself does not enforce that invariant.

4. **The new predicate is broader than “the 23:55 mark only.”**
   **P036-P039.**
   The comment says “the mark bar (23:55) only,” but the actual predicate is:
   `mark <= barTime + PeriodSeconds()`.
   That gives **every** `g_news_dayMarks[dc]` a one-period early firing opportunity, not specifically a 23:55 mark. With the presumed one-mark-per-day construction this may be exactly what is wanted, but the code does not encode the narrower textual claim.

5. **“Inside the next bar” is temporally imprecise.**
   **P015, P037-P038.**
   At the Friday 23:55 evaluation, a 23:50 M5 candle has just closed and the 23:55 candle has just opened. The 23:55 mark is therefore at the **start/boundary of the next bar**, not “inside” it. The predicate itself is consistent with the intended boundary case; the prose is what is imprecise.

6. **The Friday execution still depends on an actual evaluation tick at/very near 23:55:00.**
   **P010, P015, P048, P055.**
   The lookahead makes the signal eligible one bar early, but it cannot manufacture a market tick. The page therefore correctly treats Friday 23:55 tick existence as something to verify in the scoped run. The 16 baseline rows in **P055/raw rows** demonstrate historical feasibility, but they are not evidence that v2 itself executed there.

7. **The Monday-fallback preservation is structural, but the “halt with cause” behavior is not in E1.**
   **P015, P048-P050.**
   The old branch remains because the original `mark <= barTime` is still present in **C11429** as the first half of the widened predicate. So the fallback logic is preserved. But “Monday DAY_CLOSE fill halts with cause unless no-Friday-ticks proved” is an **acceptance/test-harness rule**, not something implemented by E1 in the pasted code.

8. **The page mixes trigger-time semantics with print-bar semantics without fully pinning both.**
   **P020, P040, P049; C11450, C11457-C11469.**
   `barTime` is the evaluation/bar identity, while the requested execution moment is the 23:55 current tick. The packet says this distinction is intentional, but the actual executor call at **C11469** receives `barTime`, not an explicit execution timestamp/current-bar-open timestamp. That is acceptable only if the logging and executor semantics are already established elsewhere.

9. **“No other election delta” cannot be established from the inserted four lines alone.**
   **P016, P050; C11446-C11455.**
   E1 visibly leaves `vSL/vTP/vBREAK/vHTF` untouched and retains their priority, which supports the claim structurally. But proving zero downstream behavioral delta still requires the stated scoped run because setting `vDAY` earlier changes the election surface whenever the other four are false.

### Analytic B — better mechanism for the stated goal

A tighter predicate would preserve the old fallback **and only add the exact next-bar boundary case**, rather than widening the entire day-mark interval:

```cpp
if(g_mtrade.fillBarTime <= g_news_dayMarks[dc] &&
   (g_news_dayMarks[dc] <= barTime ||
    g_news_dayMarks[dc] == barTime + PeriodSeconds()))
{
   vDAY = true;
   break;
}
```

That would touch only **C11429** (or the corresponding proposed **P039** line), with **P036-P038** rewritten to say explicitly that the added case is **exactly the next bar's opening boundary**. It removes the unnecessary possibility of an arbitrary mark occurring somewhere within the following bar while retaining the existing Monday fallback.

For the **exact-fill** objective, the stronger mechanism would be to make the execution reference explicitly side-aware and tie it to the actual current 23:55 opening quote, then have the tester grade that same reference against the resulting deal. That requires inspection/change of the `nextOpenPx` construction and **`MtCloseBrokerPosition()`**, not merely E1.

The key page-level conclusion is therefore: **E1 fixes the one-bar-late DAY_CLOSE election path, but E1 alone does not prove the universal exact-deal-price claim.**
## V271-DAY2355-CLEAR1 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V273-DAY2355-CLEAR4 LUNA (verbatim open; novel inbound, counts 0)
Luna:
## Q1

**YES — PACKET_P-DAY2355-1 v4 clears for exactly one build plus one scoped tester run.**

The proposed E1 at **P037–P040** changes the day-mark eligibility from `mark <= barTime` to a one-period lookahead, which is sufficient to move the 23:55 Friday DAY_CLOSE evaluation from the following available bar onto the 23:55 boundary, provided the existing closed-bar evaluation cadence stated at **P045/P049** holds. The requested run window and acceptance scope are internally consistent with the stated MT5 end-date behavior at **P056**.

No additional clearance condition is required.

## Analytic A — defects, gaps, and imprecisions

1. **“Mark sits inside the next bar” is technically imprecise.**
   **P037–P039.** At the relevant evaluation, `barTime` is the closed 23:50 bar and 23:55 is the **opening boundary of the next bar**, not a timestamp “inside” that next bar. The code itself reflects the boundary relationship more accurately than the comment.

2. **E1 does not, by itself, guarantee first-tick execution.**
   **P040; P045; C11424–C11431.**
   `g_news_dayMarks[dc] <= barTime + PeriodSeconds()` creates a one-period eligibility interval. It becomes an exact 23:55 trigger only because the surrounding mechanism is asserted to evaluate on the first tick of the new closed-bar boundary. The four inserted lines do not themselves enforce “first tick only.” Thus exactness is a **system-level cadence property**, not a property proved by E1 alone.

3. **The predicate is broader than the stated exact-boundary rule.**
   **P040.**
   `<= barTime + PeriodSeconds()` admits any mark up to one period after `barTime`. For the pinned M5 / exact 16:55-and-23:55 marks this produces the intended result, but as a generic mechanism it is wider than “the mark equals the next bar opening boundary.”

4. **`PeriodSeconds()` makes the mechanism chart-period dependent.**
   **P045; P040.**
   The packet correctly pins the graded run to M5, so this is controlled for this run. Outside that pin, the same source line would mean a different lookahead interval.

5. **The universal scope is broader than the ticket name suggests.**
   **P016, P040.**
   E1 applies to **every `g_news_dayMarks` mark on every day**, not specifically the Friday 23:55 case. The packet explicitly says this is intentional and universal, so it is not a clearance blocker, but “DAY2355” can misleadingly suggest a Friday-specific implementation.

6. **Exact price equality is not established by the shown E1 change.**
   **P050; C11453–C11455; C11467–C11469.**
   E1 establishes when `vDAY` becomes true. Exact equality of the resulting fill to the 23:55 open additionally depends on `nextOpenPx` identity and the execution path. The packet appropriately makes that a run-time acceptance check rather than pretending E1 proves it locally.

7. **The executor receives `barTime`, not an explicit current-tick timestamp.**
   **C11469.**
   `MtCloseBrokerPosition(..., g_mtrade.exitPrice, barTime)` passes the evaluated/closed-bar timestamp. That is compatible with the packet's stated audit convention, but it does not itself encode “execute at 23:55:00 first tick.” Any exact execution semantics therefore remain dependent on the helper and caller context not shown here.

8. **The weekend fallback remains semantically asymmetric.**
   **P016, P049.**
   Friday is intended to fire at the 23:55 boundary, while a missing Friday evaluation can still produce a Monday fallback. The packet explicitly distinguishes that fallback by requiring a halt cause, so this is an accepted diagnostic branch rather than an unhandled failure.

9. **“23:55 bar only closes after the boundary” conflates bar identity and timestamp.**
   **P037–P039.**
   More precise wording would distinguish the **23:55 mark**, the **23:50 closed evaluation bar**, and the **23:55 newly opened bar**.

10. **A1 is partly runtime/harness-dependent rather than source-local.**
    **P049, P056.**
    The assertion that `DateTo = 2026-09-08 00:00` includes all of Monday but no Tuesday depends on the stated MT5 tester end-date semantics. That is appropriate for the scoped run, but it is not established by the EA source itself.

I do **not** see a logic defect in the four-line insertion that would justify denying this one-build/one-run clearance. The material issues are mainly precision and dependency boundaries.

## Analytic B — better mechanism

A tighter mechanism for the stated **exact-next-bar-open** goal would replace the interval test with an equality test against the next M5 boundary:

```cpp
if(g_mtrade.fillBarTime <= g_news_dayMarks[dc] &&
   g_news_dayMarks[dc] == barTime + PeriodSeconds())
{
   vDAY = true;
   break;
}
```

That would touch only the E1 predicate at **C11429 / proposed P040**, and would make the source semantics match the prose more literally: the mark must be **exactly** the next bar boundary, rather than merely falling anywhere within the next period.

A still stronger architecture would additionally gate execution on an explicit **new-bar/first-tick condition** and pass the actual tick time into the executor; that would require touching the caller/cadence path around **C11424–C11431** and the execution call at **C11467–C11469**, so it is materially larger than this ticket.

**Bottom line: Q1 = YES.** The packet is coherent enough for the single build and single scoped run; the run is the correct place to falsify the cadence-dependent A1/A2 behavior.
## V273-DAY2355-CLEAR4 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V274-USDJPY-CLEAR1 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
## Q1 verdict: **DISCREPANCY / NO**

I would **not clear PACKET_P-USDJPY-1 v1 for the requested one build + two runs as currently written**.

The decisive issue is **A3 (6/11 14:40–14:45 LONG)**. E1 only removes `A2_CLOSE_BREAK` for a POC-anchored confirmation; it leaves the existing `B_BODY` and `C_TOUCH` predicates unchanged.

But the actual miss record says the 14:45 confirmation had:

* `oppCandle=1`
* `bodyDir=0`
* `body=1pt`
* `touchAttr=1`
* `confirm=0`
* failure recorded as `A2_CLOSE_BREAK`.

The confirmation function then tests `B_BODY` after A2. `bodyDir` for a LONG must be `c0 > o0`; with `bodyDir=0`, bypassing A2 simply exposes the next failure and **the same candle still does not confirm**.

That conflicts directly with A3's required outcome, which says the 6/11 venue must reach S5 and resolve at R, with the predicted R-refusal serving as proof of the confirmation fix.

So the packet currently asks the tester to prove a behavior that **E1, by itself, does not produce on the named proving bar**.

### Analytic A — defects, gaps, and imprecision

**1. A3 causal proof is not valid as written.**
After E1, the 14:45 bar can still fail `B_BODY`. Therefore an eventual S5 event on a later bar would not establish that E1 fixed the cited 14:45 miss.

**2. The “never-empty pool” wording is stronger than the fallback implementation.**
The fallback helper still returns `false` when there is no non-empty in-direction line, so `NO_TP_TARGET` remains technically reachable. The implementation guarantees “nearest available in-direction line without the first-pass validity filters,” not a mathematically never-empty pool.

**3. “Filters off” needs narrower terminology.**
The fallback does **not** turn every filter off: it explicitly retains the direction requirement (`v > currentPrice` for LONG / `v < currentPrice` for SHORT). What is being removed is the first-pass validity filtering such as swept/live/zone/tier.

**4. E4 wording is internally awkward.**
The packet says the LTF-align requirement is “NOT removed,” while the proposed E4 explicitly allows a confirmation while unaligned to promote directly to S5. Operationally that is a deliberate exception/override, so the rule should say that plainly.

**5. `g_fallbackBufs` is under-specified.**
The packet leaves “shared static vs copy” open. Since the whole point is to guarantee the same 18 candidate lines as `ComputeNearestTpTarget`, the source of truth should be explicit rather than merely S1-asserted.

**6. The POC test is somewhat loose.**
`StringFind(g_lineCode[anchorLine], "POC") >= 0` is a substring classification, not an exact line-family test. It works if the line-code namespace guarantees that convention, but the packet does not state that invariant.

**7. Staleness remains an open semantic choice.**
The operative rule is distance-only / age never disqualifies, while the alternative “age disqualifies” remains intentionally open in Analytic Ask A. That is fine as an analytic note, but it should not be allowed to mutate during implementation.

**8. A4 has a logging-label ambiguity.**
The historical row says the signal is at 09:10, while `ENTRY_TICKET` records `bar=09:05`. The acceptance should define whether “identical bar” means the signal bar or the stored ticket-origin bar.

### Analytic B — better mechanisms

The cleanest mechanism for the A3 problem is **not to weaken `B_BODY` implicitly**. Instead, make the acceptance causal:

* Either require the tester to show that the **named 6/11 14:45 bar itself** becomes a valid confirmation under an explicitly amended predicate; that would require an additional, explicitly scoped rule beyond the current E1.
* Or keep the confirmation predicate unchanged and redefine A3 to require a **later qualifying confirmation bar**, with the log proving that the later bar—not merely any eventual S5 event—caused promotion.

For E2, I would use **one canonical 18-buffer array/function** shared by the normal target scan and the fallback walker, rather than two representations. That keeps the candidate universe mechanically identical while allowing the fallback to toggle only the intended validity filters. The touched area is the S2 poll around `C7307` plus the target helper immediately around the existing `ComputeNearestTpTarget` implementation.

For E4, a small common promotion helper would also reduce divergence between S2 and S3: both paths should call the same “confirmation passed → record source state → promote S5 → log” routine, with only the eligibility point differing. The current proposed blocks duplicate that state-transition logic. The touched area is the S3-prebind precedent (C8655-C8680) plus the amended S2 block.

**Disposition:** **Q1 = NO / DISCREPANCY.** The packet needs an A3 repair before the requested build clearance is logically supportable.
## V274-USDJPY-CLEAR1 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V275-USDJPY-CLEAR2 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
**Verdict Q1: DISCREPANCY — not cleared for the requested build/runs.**

The packet’s **rule/edit section and its purported “complete code” are internally inconsistent**. That is a page-level defect, so I cannot give a clean YES from this packet alone.

### A. Defects / gaps / imprecision

1. **E1b is specified in the patch, but the supplied C-code still has the old unconditional A2 veto.**
   The new rule introduces `anchorIsPoc` and changes the guard to `if(!closeSideOk && !anchorIsPoc)` at P050/P055, while the C-prefixed code still has `if(!closeSideOk)` at C2224-C2225.

2. **E2b’s new `applyFilters` signature is not present in the supplied C-code.**
   P064-P066 says `ComputeNearestTpTarget(..., const bool applyFilters = true)`, but C2349-C2350 still shows the four-argument signature.

3. **The E2b zone switch is specified, but the supplied C-code still applies the zone unconditionally.**
   P072-P073 changes the guard to `applyZone && ...`; C2318 remains unconditional.

4. **The E2b session/POI threading is specified, but the C-code still calls `TpTargetUpdateBest` without the filter argument.**
   The patch specifies the threaded calls at P096 and P106 and the rank gate at P101; C2401, C2405, and C2408 still show the old unthreaded/unconditional forms.

5. **The E2b two-pass S2 behavior is absent from the supplied C-code.**
   P118-P133 specifies the second `ComputeNearestTpTarget(..., false)` pass plus `TPFALLBACK`; C7307-C7313 still has only the single pass and immediate `NO_TP_TARGET` abort.

6. **The same E2b two-pass S5 behavior is absent from the supplied C-code.**
   P149-P165 specifies the fallback pass; C8918-C8926 still has the old single-pass behavior.

7. **The E4b S2 exception is specified in the patch, but the supplied C-code still immediately retains an unaligned S2 candidate.**
   P248-P266 adds the confirmation test and S2→S5 promotion; C8072-C8077 still does `S2WAIT ... return` followed by S2→S3 only when aligned.

8. **The E4b block is duplicated in the packet.**
   Essentially the same “new” S2 block appears once at P240-P267 and again at P270-P296. That makes the intended mechanical edit ambiguous: one insertion or two?

9. **The E2b S2 and S5 old/new blocks are also duplicated.**
   The S2 old/new material is repeated around P107-P133 and P167-P193; the S5 material is repeated around P134-P166 and P194-P226.

10. **“Complete code, verbatim, no elisions” is not compatible with what is actually supplied after it.**
    The packet explicitly labels the C section as complete/no-elision code, yet the key E1b/E2b/E4b edits are not reflected there. That is the central transport/provenance discrepancy on the page.

11. **The S1 claim that all existing callers become behaviorally identical under the default `true` is asserted, but the packet does not enumerate all callers.**
    The packet relies on the S1 hit/count gate to establish this mechanically rather than proving it from the supplied page. That is acceptable as a tester gate, but it is not independently demonstrated in the text.

12. **E-c remains only a standing watch, exactly as the packet says.**
    The management excerpt states that only the booked TP touch acts normally and that a body-close E-c path can exit early, but that downstream branch is not included in the supplied C-region. Per the packet’s own scope, this is a watch item rather than a new blocker.

### B. Better mechanism for the stated goal

The cleaner mechanism is already implicit in the packet’s intended architecture: **one canonical post-edit source snapshot plus one exact-diff patch**, rather than a patch specification followed by a contradictory old-code snapshot.

For the TP refinement specifically, the single-walker `applyFilters` design is structurally cleaner than duplicating a fallback helper: one `ComputeNearestTpTarget` implementation, with the filter switch threaded through `TpTargetUpdateBest`, S2, and S5. The relevant touchpoints are P064-P106 and P118-P165.

**Bottom line:** the intended v2 rule set is sufficiently specified to understand, but the packet as submitted is **not internally self-consistent enough for a clean clearance**. The required next state is an amended packet whose patch blocks and C-prefixed code agree exactly; then the stated one-build/two-run gate can be judged against that version.
## V275-USDJPY-CLEAR2 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V276-USDJPY-CLEAR3 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
**Verdict Q1: DISCREPANCY — not cleared for the requested build/runs.**

The packet’s **rule/edit section and its purported “complete code” are internally inconsistent**. That is a page-level defect, so I cannot give a clean YES from this packet alone.

### A. Defects / gaps / imprecision

1. **E1b is specified in the patch, but the supplied C-code still has the old unconditional A2 veto.**
   The new rule introduces `anchorIsPoc` and changes the guard to `if(!closeSideOk && !anchorIsPoc)` at P050/P055, while the C-prefixed code still has `if(!closeSideOk)` at C2224-C2225.

2. **E2b’s new `applyFilters` signature is not present in the supplied C-code.**
   P064-P066 says `ComputeNearestTpTarget(..., const bool applyFilters = true)`, but C2349-C2350 still shows the four-argument signature.

3. **The E2b zone switch is specified, but the supplied C-code still applies the zone unconditionally.**
   P072-P073 changes the guard to `applyZone && ...`; C2318 remains unconditional.

4. **The E2b session/POI threading is specified, but the C-code still calls `TpTargetUpdateBest` without the filter argument.**
   The patch specifies the threaded calls at P096 and P106 and the rank gate at P101; C2401, C2405, and C2408 still show the old unthreaded/unconditional forms.

5. **The E2b two-pass S2 behavior is absent from the supplied C-code.**
   P118-P133 specifies the second `ComputeNearestTpTarget(..., false)` pass plus `TPFALLBACK`; C7307-C7313 still has only the single pass and immediate `NO_TP_TARGET` abort.

6. **The same E2b two-pass S5 behavior is absent from the supplied C-code.**
   P149-P165 specifies the fallback pass; C8918-C8926 still has the old single-pass behavior.

7. **The E4b S2 exception is specified in the patch, but the supplied C-code still immediately retains an unaligned S2 candidate.**
   P248-P266 adds the confirmation test and S2→S5 promotion; C8072-C8077 still does `S2WAIT ... return` followed by S2→S3 only when aligned.

8. **The E4b block is duplicated in the packet.**
   Essentially the same “new” S2 block appears once at P240-P267 and again at P270-P296. That makes the intended mechanical edit ambiguous: one insertion or two?

9. **The E2b S2 and S5 old/new blocks are also duplicated.**
   The S2 old/new material is repeated around P107-P133 and P167-P193; the S5 material is repeated around P134-P166 and P194-P226.

10. **“Complete code, verbatim, no elisions” is not compatible with what is actually supplied after it.**
    The packet explicitly labels the C section as complete/no-elision code, yet the key E1b/E2b/E4b edits are not reflected there. That is the central transport/provenance discrepancy on the page.

11. **The S1 claim that all existing callers become behaviorally identical under the default `true` is asserted, but the packet does not enumerate all callers.**
    The packet relies on the S1 hit/count gate to establish this mechanically rather than proving it from the supplied page. That is acceptable as a tester gate, but it is not independently demonstrated in the text.

12. **E-c remains only a standing watch, exactly as the packet says.**
    The management excerpt states that only the booked TP touch acts normally and that a body-close E-c path can exit early, but that downstream branch is not included in the supplied C-region. Per the packet’s own scope, this is a watch item rather than a new blocker.

### B. Better mechanism for the stated goal

The cleaner mechanism is already implicit in the packet’s intended architecture: **one canonical post-edit source snapshot plus one exact-diff patch**, rather than a patch specification followed by a contradictory old-code snapshot.

For the TP refinement specifically, the single-walker `applyFilters` design is structurally cleaner than duplicating a fallback helper: one `ComputeNearestTpTarget` implementation, with the filter switch threaded through `TpTargetUpdateBest`, S2, and S5. The relevant touchpoints are P064-P106 and P118-P165.

**Bottom line:** the intended v2 rule set is sufficiently specified to understand, but the packet as submitted is **not internally self-consistent enough for a clean clearance**. The required next state is an amended packet whose patch blocks and C-prefixed code agree exactly; then the stated one-build/two-run gate can be judged against that version.
## V276-USDJPY-CLEAR3 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V277-USDJPY-CLEAR4 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
## Q1

**NO — discrepancy.**

The v4 edit set is not yet an internally sufficient clearance packet for the stated A1–A5 proof standard. The main blocker is the **E2b fallback/census mismatch**: the second-pass walker can select POI targets that the census is still forbidden to name.

### A — Defects, gaps, and imprecisions

**1. E2b fallback can book a POI that the second-pass census cannot identify. — CLEARANCE-BLOCKING**

The booking walk disables the POI tier-rank filter when `applyFilters=false`:

* **P088–P089:** rank skip is gated by `applyFilters`.
* Therefore the fallback pass at **P108** / **P139** can select a lower-authority POI line than the anchor.

But the census walk still has the rank filter unconditionally:

* **P2452–P2454:** `if((g_authorityRank[k2] / 2) > (anchorRank / 2)) continue;`

So a fallback can legitimately book, for example, a POI line rejected by that census filter, while `winner` remains `NONE` or names another equal-valued candidate.

That directly conflicts with:

* **P217:** A2 requires line identity through the adjacent second-pass `TPCENSUS`.
* **P227:** novel evidence is supposed to include `TPFALLBACK` rows with enough information to establish the fallback.
* The comment in **C2395** describes the census as the witness for the candidate set.

The `best=` value is still the actual booked value, but **value equality is not sufficient to establish line identity when the census candidate set differs from the booking candidate set**.

**2. Exact-value join does not always establish line identity. — GAP / IMPRECISION**

The packet says:

* **P217:** “line identity by exact value-join”
* **P2395:** explicitly acknowledges that exact-price ties can produce **census-name divergence** from booking order.

That means `tp=` = `best=` proves the booked **price**, not necessarily the booked **line**, whenever multiple candidates share the same price. The packet already admits this possibility.

So A2's phrase “line identity by exact value-join” is technically overstated. It should say **booked-value identity**, unless the code also emits the actual source line/index.

**3. The census cap can break the promised adjacency evidence. — GAP**

The census is capped:

* **C2421–C2422:** `if(s_tpDumps < 2000)`

The packet requires A2's fallback row to be paired with the adjacent second-pass `TPCENSUS` row:

* **P217**
* **P227**

But there is no condition that the required A1/A2/A3 venue occurs before dump 2000. Once the cap is reached, `TPFALLBACK` can still print while the corresponding `TPCENSUS` evidence disappears.

That makes the acceptance criterion non-deterministic from the page.

**4. “NO_TP_TARGET means no in-direction line at all” is too broad. — IMPRECISION**

The packet says:

* **P018:** abort retained only when “no in-direction line exists at all”
* **P138–P139:** same implication
* But **C2318** keeps the zone-containment guard always active.

Therefore `NO_TP_TARGET` can occur even when an in-direction target **does exist**, provided every such target lies inside the active entry zone.

The acceptance wording is better at:

* **P217:** “no in-direction line outside the bound zone.”

That is the mechanically correct statement and should replace the broader wording in P018/P138.

**5. A5’s per-take attribution is not mechanically guaranteed. — GAP**

A5 requires:

* **P220:** every new EU take to be journal-matched with a row tag attributing `E1b/E2b/E4b`.

The new runtime evidence is conditional:

* **E1b:** `A2_WAIVED_POC` only prints when the POC A2 waiver actually fires, **P055–P056**.
* **E2b:** `TPFALLBACK` only prints when the filtered first pass finds nothing, **P115–P120 / P148–P152**.
* **E4b:** `CONFIRM_PREBIND_S2` only prints when the S2 confirmation path fires, **P177–P187**.

Thus a new take can exist without one of those diagnostic rows being emitted. In particular, an E1b-affected POC candidate whose prior close already satisfies A2 gets no E1b-specific runtime marker.

So the packet can demonstrate **that certain special paths fired**, but not universally attribute **every novel take** to one of the three refinements.

**6. The “literal E1b row tag” claim is imprecise. — IMPRECISION**

The delta text says E1b gained a literal E1b attribution tag, but the actual proposed print is:

* **P056:** `"[SRJ-EA] A2_WAIVED_POC ..."`

There is no literal `E1b` token in that runtime row. The semantic attribution is obvious, but the statement “literal E1b row tag” is stronger than the pasted code supports.

**7. The current C-code is the pre-edit baseline, not the v4 implementation. — DOCUMENTATION DISCREPANCY, not by itself a build blocker**

The “complete code” still shows the old implementations:

* **C2216–C2225:** no `anchorIsPoc`, no POC A2 waiver.
* **C2349–C2353:** old four-argument `ComputeNearestTpTarget`.
* **C2367–C2368:** no `s39_eff`.
* **C2400 / C2405:** filters are unconditional.
* **C7307–C7312:** single S2 call.
* **C8067–C8077:** old S2 LTF-alignment behavior.
* **C8795–C8803:** old S4 comment.
* **C8918–C8925:** single S5 call.

The edit set at **P31–P207** clearly instructs those replacements, so I treat this as the **builder baseline**, not as evidence that v4 has already been applied. But calling the appended source “complete code” while the proposed v4 behavior exists only in the patch blocks is potentially confusing.

### B — Better mechanism for the stated goal

The cleaner mechanism is to make **`ComputeNearestTpTarget` return the winning candidate identity directly**, rather than reconstructing identity afterward from a separate census walk.

The relevant touch points would be:

* **P65–P70 / C2349 onward:** add an output for candidate source identity, e.g. session/PD index or POI line index.
* **C2301–C2321:** have `TpTargetUpdateBest` update both `best` and the winning source identity.
* **S2 call, C7307 area / P104–P120:** print the actual fallback source directly.
* **S5 call, C8916 area / P134–P153:** same.
* The census at **C2419–C2477** could remain print-only diagnostic rather than being the authoritative identity witness.

That removes the two structural weaknesses simultaneously: **filter-state divergence** and **same-price identity ambiguity**.

### Bottom line

**Q1: NO.**

The packet's intended E1b/E2b/E4b code changes are understandable, but **E2b's filters-off booking path and filters-on census path are not the same candidate universe**, so A2's required fallback-line proof is not mechanically sound. The census cap and A5 attribution language add further gaps.
## V277-USDJPY-CLEAR4 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V278-USDJPY-CLEAR5 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
## Q1 — DISCREPANCY / DO NOT CLEAR

The behavioral intent of E1b/E2b/E4b is mostly internally coherent, but the page has unresolved implementation/acceptance discrepancies that prevent a clean **“yes”** for exactly one build plus two runs.

### Defects / gaps / imprecisions

**1. The stated E1b counter behavior is not actually achieved by the proposed code.**
P017 says the POC inverse counter “stops incrementing at the A2 terminal … and re-attributes to B_BODY/C_TOUCH returns on later failures.” But P045-P057 retain `n1_poc = false` unless `c1 == L` at P051. A POC waiver occurs specifically on `!closeSideOk && anchorIsPoc` at P056-P057, which means the equality test normally did **not** set `n1_poc`. Therefore, if that waived candidate later fails B_BODY or C_TOUCH, the later return cannot increment `g_n1_pocInv` because `n1_poc` is still false. The stated “re-attribution” is not true for the waiver cases it is supposed to cover.

The same issue exists in the baseline form at C2216-C2225: the family flag is tied to equality, not to POC-anchor identity.

**2. E4b creates a new S2→S5 reachable edge without showing that every S5 dependency is valid on the pre-bind path.**
P176-P194 changes an unaligned S2 candidate directly to `ST_S5_GATE_CHECK`. But C2316-C2317 explicitly state that `g_zoneHi/g_zoneLo` remain `0.0` until the S3 transition sets them. That makes the TP zone guard inert pre-arm. The packet asserts that this is intentional, but it does not establish from the supplied page that every S5/R/divergence dependency is independent of S3-bound state. This is a **verification gap**, not proof that the path is wrong.

The same concern applies to `g_confirmFromState = ST_S2_LTF_ALIGN` at P180-P182: no supplied downstream code demonstrates that S5 consumers distinguish or safely accept that source state.

**3. The A5 “row tag attributing E1b/E2b/E4b” requirement is underspecified and not actually defined in the edit set.**
P279 requires each new EU take to be journal-matched “with row tag attributing E1b/E2b/E4b,” but the pasted new blocks do not define a machine-readable attribution field or format. P104-P120 prints `TPFALLBACK`; P176-P188 prints `CONFIRM_PREBIND_S2`; P056-P057 prints `A2_WAIVED_POC`; none establishes a common causal tag such as `cause=E2b` or `cause=E4b`. An external grade row can be manually annotated, but the packet does not state that convention.

That leaves the A5 acceptance criterion materially ambiguous.

**4. The “complete code, verbatim, no elisions” wording is inaccurate as presented.**
The C section is a collection of selected regions, e.g. C86 → C2148 → C2301 → C7302, with large omitted ranges. P030 says “zero elisions,” while the supplied C body plainly has elisions between regions. This need not block the build if the intended object is “all claimed regions,” but the packet should not call that entire section “complete code.”

**5. The packet’s P-v5 new blocks are not reflected in the C-prefixed code, which is ambiguous unless explicitly treated as the pre-edit baseline.**
For example:

* P065-P094 proposes the new `applyFilters` parameter and gated filters, while C2349-C2408 still has the old four-argument function and unconditional filters.
* P104-P120 proposes the two-pass S2 poll, while C7307-C7313 still shows the old single call.
* P134-P154 proposes the two-pass S5 call, while C8918-C8926 still shows the old single call.
* P168-P195 proposes S2 confirmation promotion, while C8067-C8077 is still the old LTF-alignment-only block.
* P222-P266 proposes filtered census logic, while C2441-C2465 is still the old census logic.

That is perfectly understandable **only if C is explicitly the pre-build source baseline and P is the intended patch**. The packet currently mixes “exact proposed edit” language with “complete code” language, so the status is ambiguous on the page.

**6. The A3 “14:45 is never judged” rule is visually muddied by the raw evidence rows.**
P025 and P277 correctly say the judged A3 venue is the **14:40 pass / 14:35 bar** and that 14:45 is never judged. Yet the raw evidence immediately supplied includes 14:45 `CONFIRMPOLL`, `CONFIRM_STRUCT_FAIL`, `RETESTBOOK`, and `TPCENSUS` rows from June 11. Those are evidently historical diagnostic evidence rather than acceptance judgments, but the packet does not label that distinction sharply enough. This is especially important because the venue correction is explicitly standing authority.

**7. The census “names the fallback winner” claim has a known tie ambiguity.**
C2395 openly records that booking uses first-arrived equality while the census can overwrite the name on an exact cross-pool tie, so booking can be `session` while the census names `POI`. P020/P222-P266 call the census “honest,” which is true at the value level, but not as unique line identity. The A2 venues are said to have no ties, so this is not necessarily an A2 blocker; it remains an A5 audit limitation.

**8. `distPts` is rounded to an integer, so it is diagnostic rather than exact.**
P117-P120 use `MathRound(.../_Point)` into an `int`. Since exact TP identity is instead established through the TP value join, this is not a behavioral defect, but the packet should not imply that `distPts` itself is sufficient to uniquely reconstruct the candidate.

### What does *not* presently look like a defect

The core E2b narrowing is internally consistent: `applyFilters=false` disables the swept/live mask and POI tier-rank filtering while the `TpTargetUpdateBest()` direction/in-zone test remains active, matching P018 and the stated “zone always on” fence. The first-pass behavior is also preserved by the default-true parameter. P065-P094 are coherent on that point.

The stated E-c watch remains exactly that: a future conflict trigger. The supplied C11334-C11350 code suppresses recompute-touch exit when the booked TP was not touched; I would not manufacture a new E-c ruling from those lines. A genuine POC-anchored early-exit conflict would be a new packet as instructed.

## Better mechanism

**For the counter problem**, separate *family identity* from *equality*. At P045-P057 / C2216-C2225, make `n1_poc` represent “anchor is POC” independently of `c1 == L`, while `g_n1_pocEq` remains conditioned on equality. That makes the later B_BODY/C_TOUCH accounting actually cover waived POC cases without changing trading behavior.

**For TP auditability**, a stronger mechanism would be for `ComputeNearestTpTarget()` to optionally return the winning candidate index/source alongside `tpTargetOut`, then have TPFALLBACK/TPCENSUS print that exact winner rather than reconstructing identity from `tp == best`. That would touch P065-P094 and P222-P266 / C2349-C2481 and would remove the acknowledged tie-name ambiguity.

### Final verdict

**Q1: DISCREPANCY — not cleared for exactly one build plus two runs.**

The principal substantive issue is the **E1b counter re-attribution claim vs. its actual `n1_poc` gating** at P017/P045-P057. The E4b pre-bind S5 dependency is a further page-level gap, and the A5 causal row-tag requirement is not sufficiently specified.
## V278-USDJPY-CLEAR5 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V279-USDJPY-CLEAR6 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
## Q1 — DISCREPANCY / DO NOT CLEAR

The behavioral intent of E1b/E2b/E4b is mostly internally coherent, but the page has unresolved implementation/acceptance discrepancies that prevent a clean **“yes”** for exactly one build plus two runs.

### Defects / gaps / imprecisions

**1. The stated E1b counter behavior is not actually achieved by the proposed code.**
P017 says the POC inverse counter “stops incrementing at the A2 terminal … and re-attributes to B_BODY/C_TOUCH returns on later failures.” But P045-P057 retain `n1_poc = false` unless `c1 == L` at P051. A POC waiver occurs specifically on `!closeSideOk && anchorIsPoc` at P056-P057, which means the equality test normally did **not** set `n1_poc`. Therefore, if that waived candidate later fails B_BODY or C_TOUCH, the later return cannot increment `g_n1_pocInv` because `n1_poc` is still false. The stated “re-attribution” is not true for the waiver cases it is supposed to cover.

The same issue exists in the baseline form at C2216-C2225: the family flag is tied to equality, not to POC-anchor identity.

**2. E4b creates a new S2→S5 reachable edge without showing that every S5 dependency is valid on the pre-bind path.**
P176-P194 changes an unaligned S2 candidate directly to `ST_S5_GATE_CHECK`. But C2316-C2317 explicitly state that `g_zoneHi/g_zoneLo` remain `0.0` until the S3 transition sets them. That makes the TP zone guard inert pre-arm. The packet asserts that this is intentional, but it does not establish from the supplied page that every S5/R/divergence dependency is independent of S3-bound state. This is a **verification gap**, not proof that the path is wrong.

The same concern applies to `g_confirmFromState = ST_S2_LTF_ALIGN` at P180-P182: no supplied downstream code demonstrates that S5 consumers distinguish or safely accept that source state.

**3. The A5 “row tag attributing E1b/E2b/E4b” requirement is underspecified and not actually defined in the edit set.**
P279 requires each new EU take to be journal-matched “with row tag attributing E1b/E2b/E4b,” but the pasted new blocks do not define a machine-readable attribution field or format. P104-P120 prints `TPFALLBACK`; P176-P188 prints `CONFIRM_PREBIND_S2`; P056-P057 prints `A2_WAIVED_POC`; none establishes a common causal tag such as `cause=E2b` or `cause=E4b`. An external grade row can be manually annotated, but the packet does not state that convention.

That leaves the A5 acceptance criterion materially ambiguous.

**4. The “complete code, verbatim, no elisions” wording is inaccurate as presented.**
The C section is a collection of selected regions, e.g. C86 → C2148 → C2301 → C7302, with large omitted ranges. P030 says “zero elisions,” while the supplied C body plainly has elisions between regions. This need not block the build if the intended object is “all claimed regions,” but the packet should not call that entire section “complete code.”

**5. The packet’s P-v5 new blocks are not reflected in the C-prefixed code, which is ambiguous unless explicitly treated as the pre-edit baseline.**
For example:

* P065-P094 proposes the new `applyFilters` parameter and gated filters, while C2349-C2408 still has the old four-argument function and unconditional filters.
* P104-P120 proposes the two-pass S2 poll, while C7307-C7313 still shows the old single call.
* P134-P154 proposes the two-pass S5 call, while C8918-C8926 still shows the old single call.
* P168-P195 proposes S2 confirmation promotion, while C8067-C8077 is still the old LTF-alignment-only block.
* P222-P266 proposes filtered census logic, while C2441-C2465 is still the old census logic.

That is perfectly understandable **only if C is explicitly the pre-build source baseline and P is the intended patch**. The packet currently mixes “exact proposed edit” language with “complete code” language, so the status is ambiguous on the page.

**6. The A3 “14:45 is never judged” rule is visually muddied by the raw evidence rows.**
P025 and P277 correctly say the judged A3 venue is the **14:40 pass / 14:35 bar** and that 14:45 is never judged. Yet the raw evidence immediately supplied includes 14:45 `CONFIRMPOLL`, `CONFIRM_STRUCT_FAIL`, `RETESTBOOK`, and `TPCENSUS` rows from June 11. Those are evidently historical diagnostic evidence rather than acceptance judgments, but the packet does not label that distinction sharply enough. This is especially important because the venue correction is explicitly standing authority.

**7. The census “names the fallback winner” claim has a known tie ambiguity.**
C2395 openly records that booking uses first-arrived equality while the census can overwrite the name on an exact cross-pool tie, so booking can be `session` while the census names `POI`. P020/P222-P266 call the census “honest,” which is true at the value level, but not as unique line identity. The A2 venues are said to have no ties, so this is not necessarily an A2 blocker; it remains an A5 audit limitation.

**8. `distPts` is rounded to an integer, so it is diagnostic rather than exact.**
P117-P120 use `MathRound(.../_Point)` into an `int`. Since exact TP identity is instead established through the TP value join, this is not a behavioral defect, but the packet should not imply that `distPts` itself is sufficient to uniquely reconstruct the candidate.

### What does *not* presently look like a defect

The core E2b narrowing is internally consistent: `applyFilters=false` disables the swept/live mask and POI tier-rank filtering while the `TpTargetUpdateBest()` direction/in-zone test remains active, matching P018 and the stated “zone always on” fence. The first-pass behavior is also preserved by the default-true parameter. P065-P094 are coherent on that point.

The stated E-c watch remains exactly that: a future conflict trigger. The supplied C11334-C11350 code suppresses recompute-touch exit when the booked TP was not touched; I would not manufacture a new E-c ruling from those lines. A genuine POC-anchored early-exit conflict would be a new packet as instructed.

## Better mechanism

**For the counter problem**, separate *family identity* from *equality*. At P045-P057 / C2216-C2225, make `n1_poc` represent “anchor is POC” independently of `c1 == L`, while `g_n1_pocEq` remains conditioned on equality. That makes the later B_BODY/C_TOUCH accounting actually cover waived POC cases without changing trading behavior.

**For TP auditability**, a stronger mechanism would be for `ComputeNearestTpTarget()` to optionally return the winning candidate index/source alongside `tpTargetOut`, then have TPFALLBACK/TPCENSUS print that exact winner rather than reconstructing identity from `tp == best`. That would touch P065-P094 and P222-P266 / C2349-C2481 and would remove the acknowledged tie-name ambiguity.

### Final verdict

**Q1: DISCREPANCY — not cleared for exactly one build plus two runs.**

The principal substantive issue is the **E1b counter re-attribution claim vs. its actual `n1_poc` gating** at P017/P045-P057. The E4b pre-bind S5 dependency is a further page-level gap, and the A5 causal row-tag requirement is not sufficiently specified.
## V279-USDJPY-CLEAR6 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V280-USDJPY-CLEAR7 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
## Verdict Q1

**YES — page-level logic clears PACKET_P-USDJPY-1 v7 for exactly one STAGE-1-gated build plus the two specified tester runs.** The proposed changes are internally consistent with the stated E1b/E2b/E4b rules, the refine-only fence, and the A1-A5 acceptance contract. The packet explicitly keeps this at probe/print-only scope with no live-money authorization.

I am treating the digest/genuineness/build claims as **gated disk attestations, not independently verified chat facts**, exactly as the packet requires.

### Analytic A — defects, gaps, and imprecisions

**1. “Each call twice” is imprecise.**
The stated E2b description says the S2 and S5 sites “each call twice,” but the actual proposed control flow performs the second call **only when the first filtered call returns false**. That is correctly implemented as a two-pass fallback, but “each call twice” is literally inaccurate.
**Severity:** wording only; no behavior defect.

**2. E4b computes `cfTermS2` but throws away the failure reason.**
The S2 path creates `string cfTermS2 = ""` and passes it into `IsConfirmationCandle()`, but the failure branch prints only `S2WAIT`; unlike S4, it does not print the first failed term. That makes S2 confirmation failures materially less auditable.
**Severity:** diagnostic gap, not behavior-changing.

**3. `TPFALLBACK` is under-labeled for a two-site/two-pass audit.**
S2 and S5 can both emit a `TPFALLBACK` for the same judged bar, with only `bar/dir/tp/distPts` identifying it. The packet then relies on an “adjacent second-pass TPCENSUS row” to establish identity. That is workable, but the output itself does not say `site=S2|S5` or `pass=2/filter=off`, so the forensic join is more implicit than necessary.

**4. The census likewise does not explicitly identify the filter mode.**
E5a/E5b makes the census behaviorally honest, but `TPCENSUS` still does not print whether `applyFilters` was true or false. The acceptance therefore depends on print adjacency/order rather than an explicit pass label.
**Severity:** diagnostic/audit imprecision.

**5. The “R floor 1.0” claim is not completely self-proving from the shown code.**
The page says the S5 rule is `>= 1.0` versus `<1.0`, but the displayed code actually compares against `InpMinRewardRisk`. The page excerpt does not show that input's value or definition. The standing rule says the floor is 1.0, so this is not a contradiction, but it is an attestation dependency rather than a page-local proof.
**Severity:** configuration-verification gap. S1 should explicitly pin/assert the value if it is not already part of the standing harness.

**6. The `g_confirmFromState` consumer and post-refusal terminal are asserted but not shown in the supplied code excerpts.**
The packet explicitly requires S1 to assert that the consumer classifies `ST_S2_LTF_ALIGN` as pre-binding, and it describes the post-refusal terminal, but those downstream consumers are not included in the displayed C-region excerpts.
**Severity:** verification gap, already fenced by the stated STAGE-1 assertions rather than a reason to reject the change.

**7. “Complete code, verbatim, no elisions” is too broad as wording.**
The packet contains the complete cited regions/touched functions, but not literally the entire 11,506-line EA. The source section itself is a selected-region presentation keyed by true disk line numbers.
**Severity:** wording only.

**8. “Prior-close-irrelevant” is broader than what E1b actually changes.**
The code specifically waives **A2 close-side failure** for POC anchors; it does not make the entire prior candle irrelevant, because `oppCandle` and touch remain active. The later S4 comment is more precise.
**Severity:** terminology/imprecision only.

**9. `NO_TP_TARGET` wording is slightly too broad at S2.**
The acceptance says it means “no in-direction line exists outside the bound zone,” but the S2 pre-bind path is explicitly before the zone is bound, and the zone guard is inert until that state exists. The wording is exact for the bound/S5 context, less so for S2.
**Severity:** semantic wording only.

### Analytic B — better mechanism

The strongest improvement I see is **diagnostic-only, preserving the current behavior**:

At the existing `TPFALLBACK` and `TPCENSUS` sites, emit an explicit `site` and `mode`, e.g. `S2/FILTERED`, `S2/FALLBACK`, `S5/FILTERED`, `S5/FALLBACK`, instead of forcing the grade to infer the second pass from adjacency. The logic touch points are the S2/S5 calls and the census inside `ComputeNearestTpTarget`: the proposed call sites around EA 7307 and 8918, plus the census region corresponding to C2425-C2475.

For E4b, the similarly narrow improvement is to print `cfTermS2` on the S2 failure branch, matching the existing S4 `CONFIRM_STRUCT_FAIL` diagnostic. That would make the new S2 exception fully row-auditable without changing the predicate or state transition.

**Bottom line:** no page-level behavioral defect forces a HOLD. The E1b waiver is correctly scoped to POC/A2, E2b keeps the zone guard while removing only mask/rank on the second pass, E4b uses the existing live confirmation predicate and routes a passing S2-unalinged confirmation directly to S5, and E5a/E5b make the census follow the actual booking mode.
## V280-USDJPY-CLEAR7 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V281-USDJPY-GUARDS OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
## Q1 — **DISCREPANCY**

The **E6a predicate is a correct reproduction of the existing ORDER newness predicate**: it counts opposing HTF legs at the confirm bar and prior bar, then defines fresh opposition as `antiNow >= 2` with `antiPrev` in `[0,2)`. That matches the existing `SrjOrderEmit` predicate at EA 5135.

The **problem is the disposition**. The authority text on the page describes S3.3 Step 2 as a 5m flip against the locked direction that **"kills"** the candidate.  But this patch does not kill or abort the candidate: it logs `E4B_GUARD`, prints the existing `S2WAIT` message, and returns while retaining the candidate in S2.

So the ruling is:

**Predicate: YES.
S2WAIT-retain as the meaning of "flip kills": DISCREPANCY.**

The page does not establish the narrower interpretation "kills only this confirmation promotion, but the armed candidate remains alive." It explicitly uses the stronger word "kills."

---

## Q2 — **YES**

The E6b walk is materially aligned with the stated S5.4 rule on this page.

It walks older bars from `confirm+1` through the seed shift, obtains the anchor POI value, skips `EMPTY_VALUE`/unreadable POI and zero OHLC reads, then applies the dynamic per-bar "behind" test and the direction-specific body cross. LONG is `anchor <= open` plus `open >= anchor && close < anchor`; SHORT is mirrored.

That matches the page's stated S5.4 formulation: a candidate armed for the confirming close is dead on an anchor-POI-behind body break before confirmation.

**E4b-only scope: YES for this refinement round.** The packet explicitly limits the change to the E4b branch and parks S3/S4 extension until the operator gives scope for it.  That is a deliberate scope limitation, not a complete implementation of the rule across all promotion paths. The packet itself discloses that S3/S4-path coverage remains untouched.

One implementation imprecision remains: the page says the seed shift comes from `iBarShift`, but it does not specify the exact-match mode or formally define the intended seed/confirm boundary semantics.

---

# Analytic A — defects, gaps, and imprecisions

**1. The principal defect is the Q1 semantic mismatch.**
"S3.3 flip kills" and "S2WAIT candidate retained" are not naturally the same state transition. The code needs the settled meaning clarified in the rule itself, or the disposition needs to change.

**2. E6a is duplicated logic rather than a shared predicate.**
The guard reimplements the same HTF counting/newness calculation already present in `SrjOrderEmit`, creating future drift risk even though it is verbatim-equivalent today.

**3. Both guards fail open on unreadable inputs.**
That is explicitly disclosed, so it is not hidden, but it means a real flip or body break can pass whenever the relevant read is unavailable.

**4. E6b's seed lookup semantics are underspecified.**
`iBarShift(_Symbol, PERIOD_CURRENT, g_anchorBarTime)` is used without an explicit exact-match argument, and the packet only says "unreadable seed = no gate." The page does not specify what must happen if the supplied time maps to a non-exact bar.

**5. E6b boundary inclusion is not stated tightly enough.**
The actual loop is `barShift + 1 ... e6b_seedShift`, so the seed bar is included and the confirm bar is excluded. That may be correct, but the packet should state those boundaries explicitly rather than relying on "between seed and confirm."

**6. There is no isolated E6b-positive acceptance case.**
B1 combines `flip=1` with the POI walk, so it does not independently prove that **POI-break alone** blocks promotion when `flip=0`.

**7. There is no isolated E6a threshold-edge acceptance case.**
The acceptance does not exercise boundaries such as current opposition `2`, prior opposition `1`; current `2`, prior `2`; current `1`; or unreadable now/previous. The predicate is clear, but the acceptance matrix is not exhaustive around its exact threshold.

**8. There is no direct LONG-side positive E6b proof.**
The two ruled cases cited for the new guard are SHORT cases. The page states the SHORT mirror and discloses dynamic side handling, but the acceptance section does not include an explicit LONG-side E6b trigger.

**9. The "DIAGNOSED successor" escape in S1 is undefined.**
The gate says the source digest must match the given tree "or DIAGNOSED successor," but this page does not define the evidence or authority required to classify a successor as diagnosed.

**10. "One hit per anchor" is not operationally defined.**
It appears in S1 as a mechanical requirement, but the packet does not state whether this means one code occurrence, one execution, one print row, or one candidate anchor.

**11. The call-site census language is imprecise.**
"No new walker callers" and "E6 reads are Flow/POI/OHLC only" are understandable intent statements, but no exact caller/function census is enumerated in the acceptance itself.

**12. B7 is less concrete than the packet's own event-tuple standard.**
The packet says acceptance should use event tuples rather than bare clock labels, but B7 refers to "his TAKEN rows" and "7 baseline takes" without enumerating those rows in this page. That makes independent grading less deterministic from this page alone.

**13. The acceptance permits an alternate halt outcome without tightly constraining its equivalence.**
B1 allows either the expected S2WAIT result or "a walk-away halt with cause." That broadens the pass condition beyond the stated implementation shape.

**14. The packet deliberately leaves global S5.4/S3.3 coverage incomplete.**
E4b is covered; S3/S4 paths are expressly parked. That is acceptable for the declared refinement scope, but it remains an open behavioral coverage gap.

---

# Analytic B — better mechanisms

### E6a

The stronger long-term mechanism is a **single shared fresh-HTF-opposition predicate** used both by the existing ORDER census and by the E4b guard. That would remove duplicate counting logic and make "verbatim predicate" structural rather than textual.

The relevant touch points would be the E4b insertion at the 8086-8112 site and the existing ORDER calculation at 5117-5146.

### E6b

A better mechanism is a **dedicated anchor-body-break helper** returning a three-state result such as `CLEAN / BROKEN / UNREADABLE`, while preserving the packet's settled fail-open behavior for `UNREADABLE`. That makes the distinction observable instead of collapsing "could not prove a break" into ordinary clean state.

The current logic lives entirely in the E4b block at the 8086-8112 region described by the packet.  The current walk itself is specified at P087-P106.

### Most important mechanism change

Before touching either predicate, I would settle **what "S3.3 kills" means operationally**. If it means "this confirmation attempt is invalid but the armed candidate survives," the current S2WAIT return is coherent. If it means "the candidate is dead," the current E6a disposition is not sufficient. The page currently contains both meanings without resolving them.

## Final ruling

**Q1: DISCREPANCY** — E6a predicate is correct; the stated "flip kills" rule does not clearly support retaining the candidate in S2.

**Q2: YES** — E6b predicate is consistent with the stated S5.4 rule, and E4b-only scope is acceptable for this explicitly bounded refinement, with the S3/S4 gap remaining open.
## V281-USDJPY-GUARDS END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V282-USDJPY-GUARDS2 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
## Verdict

**Q1 — DISCREPANCY.**
The *behavioral* kill rule is implemented correctly: the E4b branch computes current HTF opposition, defines the block as `antiNow >= 2`, evaluates it only after confirmation succeeds, and aborts with `ABORT_LTF_MISALIGN`. That matches the amended rule and the stated durable-kill disposition.

The discrepancy is structural: the packet's adopted Opus-B1 ruling explicitly called for the already-defined `oOpp` / `biasOpposedAtGate` state boolean at C5141, while the proposed E4b code re-implements the same count locally and sets `e6a_block = (e6a_antiNow >= 2)` instead. The numerical predicate is the same on readable data, but the implementation does not literally follow that adopted mechanism.

**Q2 — YES.**
The S5.4 refinement is correctly represented for this round: exact `iBarShift(..., true)` seed resolution, positive anchor-time prerequisite, confirm+1 through seed inclusive, plain directional body-cross test, no `behind` term, breaking-bar/value/OHLC evidence, evaluation inside the confirm-true branch, and termination with the new `ABORT_S54_POIBREAK`. The E4b-only fence is also preserved.

## Analytic A — defects, gaps, imprecisions

**1. The packet's E4b line-count accounting is internally contradictory.**
P031 says old 27 → new 105, NET +78; the packet header and S3 say old 27 → new 76, NET +49, total +52, post 11604. Those cannot all describe the same edit. This is material because STAGE-1 is explicitly exact-diff/line-count gated.

**2. E6a still duplicates the ORDER opposition calculation.**
The packet itself records shared-predicate/helper factoring as deferred, but that leaves two independently maintained implementations of the same HTF count: C5117-C5134 and P073-P090. That is the main long-term drift point.

**3. HTF read failure is not distinguishable from a clean non-opposed state in the E4B evidence.**
`e6a_antiNow` remains `-1` if the three reads fail; `e6a_block` then becomes false, while the print emits only `opposed=0`. Thus `opposed=0` can mean either "0/1 opposing legs" or "HTF evidence unreadable." The same issue affects `e6a_flip`. That weakens the claimed adjudicability of fail-open cases.

**4. POI unreadability is likewise collapsed into `pobreak=0`.**
The walker silently `continue`s on failed/empty POI reads. If every intervening bar is unreadable/empty, the final row is indistinguishable from a genuinely clean walk because there is no unreadable count/status in `E4B_GUARD`. This is especially relevant because the prior outcome-separation ruling specifically called for unknown evidence to remain observable rather than look clean.

**5. `seedShift < barShift` is silently accepted.**
The code only anomalies `seedShift < 0`; otherwise it walks only when `seedShift > barShift`. Therefore both `seedShift == barShift` and the temporally inverted `seedShift < barShift` fall through to promotion. The packet explicitly says equality is intentionally silent, but it does not explain or diagnose the inverted case. The prior B5 demand had specifically identified that relation as something to anomaly rather than silently skip.

**6. "anchor>0" is imprecise.**
The rule prose says "exact seed with anchor>0," while the implementation checks `g_anchorBarTime > 0`, not `g_anchorLine > 0`. That may be the intended meaning, but the packet should say "anchor-bar-time > 0" explicitly so the rule cannot be read as a price-level validity test.

**7. B7 still contains a grader-discretion phrase.**
"Genuine flip/break," "unattributable kill," and "no genuine cause" are not operationally defined in the acceptance text. The packet gives the observable fields, but not the exact adjudication predicate tying those fields to "genuine." That can create a post-run interpretation gap.

## Analytic B — better mechanism

For the durable design, the strongest mechanism remains the already-deferred **shared HTF-opposition predicate/helper** used by both ORDER and E4b, eliminating duplicate counting logic; the packet itself records that proposal and the exact touch points.

For E6b, the deferred **three-state break result (`CLEAN / BROKEN / UNREADABLE`)** is the cleanest way to distinguish a proven no-break from insufficient POI evidence without falsely treating unreadable data as clean.

Within the current no-new-helper scope, the most useful low-scope hardening would be to add explicit HTF/POI read-status fields to `E4B_GUARD` and diagnose `seedShift < barShift`; those would improve adjudication without changing the settled kill predicate.

**Bottom line: Q1 = DISCREPANCY; Q2 = YES.** The two most important packet defects are the **+78 vs +49 line-count contradiction** and the **clean-vs-unreadable evidence collapse.**
## V282-USDJPY-GUARDS2 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V283-USDJPY-GUARDS3 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
## Q1 — discrepancy

The **behavioral block/no-block predicate is equivalent**, but the packet's **claimed extensional-equivalence proof is not true as written**.

At E6a, `e6a_antiNow` is initialized to `-1` and remains `-1` when the current HTF read bundle fails at P073/P076-P082. `e6a_block` is then simply:

> `bool e6a_block = (e6a_antiNow >= 2);`

at P092, so unreadable means `false`.

The ORDER implementation instead preserves the unreadable sentinel in `oOpp`:

> `int oOpp = (oAntiNow < 0) ? -1 : ((oAntiNow >= 2) ? 1 : 0);`

at C5141. Thus, on unreadable input:

| Condition         |       E6a |  ORDER |
| ----------------- | --------: | -----: |
| 0/1 opposing legs |     false |      0 |
| 2/3 opposing legs |      true |      1 |
| HTF unreadable    | **false** | **-1** |

The reads, shifts, and count formula are indeed the same at P073-P090 and C5117-C5134, and the blocking truth value is therefore the same. But **the outputs are not identical on all inputs**, contrary to P013's claim.

So the exact Q1 ruling is:

**Q1: discrepancy — equivalence of the gate truth value is proved, but extensional equivalence of the variables is not.**

The shared-helper refactor remains unnecessary for this round as a behavior requirement, but the proof needs to be narrowed to **"same block/no-block truth value for every input"**, not "same outputs on all inputs."

---

## Q2 — no

There is a direct contradiction between the stated equality rule and the actual tripwire.

The rule says at P019:

> "SEEDORDER anomaly (0<=seed<confirm); equal shifts silent."

But the code is:

* P100: `if(e6b_seedShift < 0)`
* P105: `else if(e6b_seedShift > barShift)`
* P119: `else if(e6b_seedShift >= 0)`

After the first two branches, P119 is true for **both**:

* `0 <= e6b_seedShift < barShift` — desired SEEDORDER case
* `e6b_seedShift == barShift` — the explicitly ruled **silent** case

So an equality case currently prints:

`reason=SEEDORDER`

at P121-P122, instead of remaining silent.

The implementation does satisfy the other Q2 components:

* exact seed lookup with `iBarShift(..., true)` and `g_anchorBarTime > 0`: P098-P099
* inclusive walk from `barShift+1` through `e6b_seedShift`: P107
* plain direction-matched body cross: P115
* breaking-bar evidence capture: P116
* walked/skipped fields: P096, P109-P114
* GUARD emission before abort: P124-P125
* E6a abort: P126
* E6b abort: P127
* new abort code: P151-P152
* all of it remains inside the confirmation-bearing E4b/S2 branch: P070-P137

But the equality contradiction is enough for **Q2 = no**.

---

# Analytic A — defects, gaps, and imprecisions

### 1. Q1 proof overclaims equivalence

**Lines:** P013, P073-P092, C5117-C5141.

The proof says "same outputs on all inputs," but the unreadable state is `false` in `e6a_block` and `-1` in `oOpp`.

**Correct formulation:** same **block/no-block truth value**, not same variable output/state domain.

---

### 2. Q2 SEEDORDER tripwire catches equality

**Lines:** P019, P100-P123.

This is the concrete Q2 implementation defect.

Required:

```text
seedShift >= 0 && seedShift < barShift
```

Actual:

```text
seedShift >= 0
```

after the `> barShift` branch.

---

### 3. `e6b_walked` is not actually a "read/walked" count

**Lines:** P096, P109-P114.

`e6b_walked++` occurs **before** the POI read. Therefore it counts attempted loop bars, including unreadable/empty bars and missing OHLC bars.

So:

* `walked=1, skipped=1` means **zero usable bars**
* `walked=1, skipped=0` means one usable bar

Yet B3 says:

> `walked>=1 row (coverage proof)`

at P175.

That is not sufficient proof of readable POI coverage.

This is particularly important because the whole purpose of the added raw counters was to distinguish unreadable evidence from clean evidence.

---

### 4. Epoch `bbar` is only "no recorded break," not intrinsically "clean"

**Lines:** P125, P182.

`e6b_bt` remains zero whenever no break is recorded, including anomaly paths. Therefore:

`1970.01.01 00:00`

does not by itself prove a clean walk.

The packet does preserve `seed`, `walked`, and `skipped`, so the row is adjudicable; the imprecision is specifically the prose:

> "epoch bbar sentinel read as clean"

That should really mean **"no breaking bar was recorded"**, with cleanliness established from the accompanying status fields.

---

### 5. B7 still contains non-operational "genuine" language

**Lines:** P179.

The packet says:

> "genuine flip/break"

and

> "unattributable kill" / "no genuine cause"

but never supplies a machine-level predicate for those terms.

The added evidence fields help substantially, but they do not themselves define exactly when a cause is "genuine." This remains a grader-interpretation seam.

---

### 6. B7 still says "flip/break" after E6a was explicitly renamed to opposition-kill

**Lines:** P072, P091-P092, P159-P164, P179.

The amended Task-76 comment correctly says:

> "E4b-guard opposition kill"

and identifies `e6a_flip` as a print-only field at P072/P091.

But B7 still describes a killed take as carrying a:

> "genuine flip/break"

That is stale terminology. An E6a kill is caused by **standing opposition**, not necessarily a flip. E6b is the break mechanism.

This should read in terms of **opposition-kill / POI-break**, matching the amended rule text.

---

### 7. "No counter touches" conflicts literally with adding two diagnostic counters

**Lines:** P005, P096.

P005 says:

> "No counter touches."

The edit introduces:

`e6b_walked` and `e6b_skipped`

at P096.

This is probably intended to mean **no existing/global strategy counters are touched**, but the packet should say that explicitly. Otherwise it is internally inconsistent.

---

### 8. HTF unreadability remains only aggregate, not per-leg

**Lines:** P073-P090.

The `-1` sentinel makes unreadable distinguishable from clean, which solves the prior fail-open observability problem.

But the row cannot tell whether:

* HIGH failed,
* MID failed,
* LOW failed,
* or multiple/all failed.

That is not a blocker for the present rule, but it is a diagnostic-resolution gap.

---

### 9. POI skipped count conflates distinct failure classes

**Lines:** P111-P114.

The same `e6b_skipped++` is used for:

* POI read failure / `EMPTY_VALUE`
* `iOpen()==0`
* `iClose()==0`

So `skipped=1` does not say what failed.

Again, this is observability rather than a settled behavioral-rule defect.

---

### 10. "Behind term deleted" is not independently demonstrable from the pasted old/new pair

**Lines:** P031-P060 versus P061-P143.

The old E4b block shown on the page contains no visible "behind" term. Therefore the page itself does not provide a before/after diff proving that a prior E6b "behind" condition was removed.

The packet can legitimately rely on STAGE-1 disk diff for that fact, but it is a **page-evidence gap**, not a conclusion that the edit is wrong.

---

### 11. S5.4 is referenced rather than reproduced

**Lines:** P093, P188.

The packet paraphrases the S5.4 rule but does not include the authoritative S5.4 text itself. That leaves some semantic details dependent on the cited prior ruling/finding rather than independently checkable on this page.

This is exactly the limitation already identified in the v282 material, so I would classify it as a **documentation/evidence gap**, not a new behavioral defect.

---

### 12. The "two emitters separable by ABORT-row state" assertion is not fully demonstrated here

**Lines:** P163, C1728-C1733.

The common logger prints:

`reason`, `state`, `poi`, `dir`

but not an explicit emitter identifier.

The amended comment says the two `ABORT_LTF_MISALIGN` emitters are separable by state. That may be true in the full EA, but the second emitter is not reproduced in this packet, so the separation is not independently proven on-page.

---

### 13. Abort evidence is dependent on a preceding GUARD row

**Lines:** P124-P127, C1728-C1733, P179.

The abort line itself contains no `opposed`, `pobreak`, `antiNow`, `seedShift`, or break-bar data. Those live in the preceding `E4B_GUARD` row.

The packet knows this and explicitly says to use GUARD-row pairing, so it is not a logic error. It is nevertheless a **join dependency** in the grading protocol and makes the attribution more fragile than an abort row carrying its own cause fields.

---

### 14. B8 correctness is not established by the shown code alone

**Lines:** P180, P126-P127, C1728-C1733.

The shown code proves:

```text
GoAbort(...); return;
```

but not what `GoAbort()` does thereafter.

Therefore the claimed:

> "no post-kill revival"

is a **run-grade property**, not something this excerpt independently proves. The packet itself correctly treats B8 as an acceptance-run check.

---

### 15. The packet's Q1 claim should distinguish value equality from predicate equivalence

**Lines:** P013, P017, P092, C5141.

There are really two claims:

1. `e6a_block` and `oOpp` select the same bars for blocking.
2. `e6a_block` and `oOpp` are the same-valued representation.

**(1) is true. (2) is false.**

That distinction is the cleanest way to close the Q1 structural issue without requiring a helper this round.

---

# Analytic B — better mechanisms

### 1. Durable Q1 mechanism: one shared three-state opposition helper

**Current touch points:** C5117-C5141 and P073-P092.

The strongest durable design remains a single helper returning the same three-state value:

```text
-1 = unreadable
 0 = not opposed
 1 = opposed
```

Then ORDER and E4b both consume that same result.

That directly eliminates the current duplicate predicate drift and makes the equivalence literal at the representation level, not merely behavioral.

The natural two consumers are exactly:

* ORDER: C5117-C5141
* E4b: P073-P092

This is still a **new function surface**, so keeping it deferred for this round is consistent with the stated scope.

---

### 2. Immediate Q2 correction: make the order predicate explicit

**Touch:** P119-P123.

Use the exact intended relation:

```text
else if(e6b_seedShift >= 0 && e6b_seedShift < barShift)
```

Then there is no ambiguity:

* `< 0` → `SEED`
* `> barShift` → normal walk
* `0 <= seed < barShift` → `SEEDORDER`
* `== barShift` → silent fall-through

That is the minimal correction and preserves every other current behavior.

---

### 3. Make the coverage field semantically exact

**Touch:** P096, P109-P116, P125, P175.

Either rename `e6b_walked` to something like `e6b_attempted`, or add an explicit successful-read count:

```text
e6b_attempted
e6b_skipped
e6b_read = attempted - skipped
```

Then B3 should require usable evidence, e.g. `read>=1`, rather than merely `walked>=1`.

That would make the new observability fields actually prove the thing the acceptance text claims they prove.

---

### 4. Tighten the sentinel wording

**Touch:** P175/P182.

Define:

* `bbar=epoch` = no break recorded
* `skipped=0` + valid seed/order + readable walk = clean walk evidence

rather than equating the epoch sentinel itself with "clean."

---

### 5. Make B7 terminology match the actual guards

**Touch:** P179.

Replace the generic "flip/break" language with the actual two causes:

```text
standing-opposition kill
POI-break kill
```

Then the evidence mapping becomes operationally obvious:

* `opposed=1` → E6a cause
* `pobreak=1` → E6b cause

while `flip` remains explicitly diagnostic/print-only.

---

## Bottom line

**Q1: discrepancy.** The adopted **blocking predicate** is extensionally equivalent to ORDER, but the packet's stronger claim of identical outputs is false because unreadable HTF state is `false` in `e6a_block` versus `-1` in `oOpp` (P073-P092 vs C5141).

**Q2: no.** The implementation has the required E6b structure, but P119-P122 incorrectly fires `SEEDORDER` for `seedShift == barShift`, despite P019 explicitly requiring equality to remain silent.

The most important additional acceptance defect is B3's `walked>=1` criterion: P109 counts attempts before the read, so it does not prove that any POI evidence was actually readable.
## V283-USDJPY-GUARDS3 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V284-USDJPY-GUARDS4 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
## Q1 — YES

The narrowed proof is sufficient for the **gate decision**, without the shared-helper refactor.

The current E6a computation mirrors ORDER's HTF reads, shifts, and opposition count at P073–P090 versus C5117–C5134.  The actual kill predicate is `e6a_antiNow >= 2` at P092, while ORDER represents the same kill condition as `oOpp==1`, with `-1` reserved for unreadable at C5141. Thus readable inputs produce the same block/no-block decision, and unreadable input produces no kill on both paths while the E6a raw `antiNow/antiPrev` values remain `-1` at P128. The HTF-unreadable SKIP print is also present at P093–P095.

The opposition-kill disposition remains `ABORT_LTF_MISALIGN` at P129, and the amended Task-76 comment now identifies the two intended populations at P163–P167.

**One wording imprecision remains:** "same block/no-block truth value as `oOpp`" should ideally mean `e6a_block == (oOpp==1)`. `oOpp` itself is an integer and `-1` would be truthy if treated directly as a boolean. That is a wording issue, not a behavioral discrepancy. Lines P017 and C5141.

---

## Q2 — YES

The v4 E6b implementation now matches the amended S5.4 rule for this round.

The seed is resolved only when `g_anchorBarTime > 0`, using exact `iBarShift(..., true)` at P100–P102.  The normal walk is `barShift+1` through `e6b_seedShift` inclusive at P108–P120, which is confirm-exclusive / seed-inclusive. The cross predicate at P118 is direction-matched with inclusive open and strict close, exactly as stated in P019/P096.

The corrected tripwire is now explicit:

`e6b_seedShift >= 0 && e6b_seedShift < barShift`

at P122, so `seedShift == barShift` falls through silently. That removes the v283 blocker.

The raw evidence is present in the E4B_GUARD row at P127–P128, including `anti`, `seed`, `walked`, `skipped`, `bbar`, and `bpx`.  Break disposition is `ABORT_S54_POIBREAK` at P130, with the define at P154–P155.   The whole guard remains inside the confirm-true E4b/S2 branch, ending before the unchanged S3 fall-through at P140–P145.

So **Q2 is YES**.

---

# Analytic A — defects, gaps, and imprecision

### 1. `e6b_walked` is still an attempted-read counter, not a successful-read/coverage counter

**Lines:** P099, P110–P117, P178.

`e6b_walked++` occurs before `ReadBuf1()` and before OHLC validation. Therefore `walked=1, skipped=1` means one attempted bar and zero usable bars. B3 nevertheless calls `walked>=1` a "coverage proof." That statement is still technically false. This is the clearest remaining acceptance-language defect.

### 2. "No counter touches" is literally inconsistent with the edit

**Lines:** P005 versus P099, P112, P114, P117.

The packet introduces two new counters. The intended meaning is evidently "no existing/global strategy counters are touched," but P005 does not say that. This should be narrowed.

### 3. Q1's `oOpp` comparison should be expressed as a predicate, not as raw truthiness

**Lines:** P017, P092–P093, C5141.

The actual equivalence is:

`e6a_block == (oOpp == 1)`

not `e6a_block == oOpp` and not C-style boolean truthiness of `oOpp`. The current prose explains the intended semantics, but the mathematical/code predicate should be stated explicitly.

### 4. HTF unreadability is still aggregate rather than per-leg

**Lines:** P073–P095, P128.

`antiNow=-1` or `antiPrev=-1` establishes unreadability, but the row cannot say whether HIGH, MID, LOW, or multiple legs failed. This remains a diagnostic-resolution gap, not a Q1 blocker.

### 5. The `HTF` SKIP reason does not identify whether "now" or "prev" was unreadable

**Lines:** P093–P095.

The SKIP prints only `reason=HTF`. The raw row lets the grader infer the distinction through `anti=%d/%d`, but the SKIP itself is not self-describing.

### 6. `SEED` conflates at least two causes

**Lines:** P100–P106, P128.

`seedShift < 0` can mean either `g_anchorBarTime <= 0` or exact `iBarShift(..., true)` failure. Both become `reason=SEED`. The raw `seed=-1` makes the result observable but does not identify which cause occurred.

### 7. `e6b_skipped` conflates distinct failure classes

**Lines:** P114, P117.

The same counter is incremented for POI-buffer failure/`EMPTY_VALUE` and for invalid OHLC. That remains a diagnostic compression.

### 8. SEEDORDER SKIP rows are not completely self-adjudicating

**Lines:** P122–P128.

The SKIP line itself prints only `reason=SEEDORDER`. The following GUARD row carries `seed=%d`, but not an explicit confirm-bar shift. The equality/inversion distinction is therefore reconstructed from the candidate bar and seed-bar timestamps rather than printed directly as two integer bounds.

The current pairing procedure makes this adjudicable, but it is less robust than printing `seed=%d cbar=%d` directly.

### 9. Abort attribution remains a join dependency

**Lines:** P127–P130, C1728–C1733, P182.

`LogAbort()` prints only `reason`, `state`, `poi`, and `dir`. The raw cause evidence lives in the preceding `E4B_GUARD` row. The packet explicitly requires that pairing, so this is not a logic error, but it remains an attribution fragility.

### 10. "Exactly two emitters" is not fully demonstrated by the page excerpt

**Lines:** P163–P167, C7119–C7130, C307.

The shown state separation is sound: the E4b abort is emitted while `g_state` is S2, while the shown invariant block is S3–S5. But the claim that `ABORT_LTF_MISALIGN` has **exactly two emitters globally** is a call-site census claim. The page gives the relevant sites, but does not itself show a complete `GoAbort(ABORT_LTF_MISALIGN,...)` census.

So the *state-separation mechanism* is demonstrated; the word **"exactly"** remains disk-census dependent.

### 11. P020 overstates what a "clean" E4B_GUARD row contains

**Lines:** P020 versus P128 and B3 P178.

P020 says clean prints "zeros," but a clean A1 row is explicitly expected to have `anti=1/1`, `seed=...`, `walked>=1`, etc. Only the break-related fields such as `pobreak` and `bbar/bpx` are zero/sentinel on a clean walk. The prose should say that precisely.

### 12. P018 omits the debug-gating qualification

**Lines:** P018, P094–P095, P171.

The HTF SKIP print is conditional on `InpDebugLog`. The packet later documents that, and the grading precondition is `true`, so operationally this is fine; the rule sentence itself is slightly overbroad.

### 13. "E6 guards terminate" is too broad

**Lines:** P191, contrasted with P103–P107 and P122–P126.

The actual behavior is not that every E6 guard terminates. HTF unreadability produces a SKIP print and continues; SEED and SEEDORDER anomalies also continue. Only the actual opposition/break predicates abort. P191 should say "E6 kill predicates terminate" or equivalent.

### 14. B7's "genuine" language is better, but still partly inferential

**Lines:** P182, P128–P130.

The positive opposition predicate is operationally clear: `opposed=1` with `anti>=2`. The break side is likewise tied to `pobreak=1` and recorded break evidence. But "bpx populated" is still prose rather than an explicit machine field/state, and the attribution still depends on pairing the GUARD and ABORT rows.

### 15. The "behind term deleted" claim remains page-unprovable from the pasted old block alone

**Lines:** P031–P060 versus P061–P145; P191.

The old 27-line excerpt contains no prior E6b implementation to compare against. So the absence of the "behind" term is demonstrable in the **new** block, but deletion from the previous implementation is not independently proven by this page. The packet correctly relies on the separately ruled finding/STAGE-1 evidence for that point.

---

# Analytic B — better mechanisms

### Durable Q1 mechanism

The strongest structural mechanism remains the previously deferred shared three-state helper:

`HTF opposition → -1 unreadable / 0 not opposed / 1 opposed`

with both consumers using the same result.

Touch points:

* ORDER: **C5117–C5141**
* E4b: **P073–P092**

Then E4b becomes effectively `e6a_block = (helper(...) == 1)`, and ORDER prints/uses the same underlying state. That removes the duplicate-read/predicate equivalence proof altogether. It is still a **future-scope** change because it introduces a new function surface.

### Immediate E6b observability mechanism

For the remaining coverage seam, the cleanest future refinement is to separate:

`attempted`, `readable`, `skipped`

rather than treating `walked` as coverage.

Touch points:

* initialization: **P099**
* loop/read accounting: **P110–P117**
* GUARD print: **P128**
* B3 acceptance criterion: **P178**

That would let B3 assert actual readable POI evidence instead of `walked>=1`.

### Lowest-scope tripwire hardening

For self-adjudicating SKIP rows, add the confirm shift beside the seed shift in both SKIP prints.

Touch:

* **P103–P106**
* **P122–P126**

For example, the evidence should directly expose `seedShift` and `barShift`, so inverted (`0 <= seed < confirm`) and equality (`seed == confirm`, silent) cases can be distinguished from the SKIP row itself without reconstructing the relationship from timestamps.

**Final rulings: Q1 = YES. Q2 = YES.** The remaining issues are precision/observability/verification seams, not a surviving E6a or E6b behavior blocker.
## V284-USDJPY-GUARDS4 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V285-USDJPY-GUARDS5 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Q1 YES - the unreadability sentence is exact

Q2 YES - the battery is gradeable
## V285-USDJPY-GUARDS5 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V287-ENTRY-FULL OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
Q1 **NO** — E1 does not exactly implement the stated seed-exclusive window. The rule says `(seedbar, evaluation bar]`, but the walker at P068 uses `s54_s <= s54_seedShift`, which includes the seed bar itself.

Q2 **YES** — recency is enforced with the required strict `seedbar < confirmBar` test at both promotion sites, with stale handling preserving the candidate and leaving `IsConfirmationCandle` untouched; the 9/7 preservation case is also internally gradeable from the stated timings.

Q3 **YES** — the three UJ items are presented as proposals rather than ruled code, with the bypass scope/options and 10:40 conditioning for UJ1, the source/trigger choices for UJ2, and the flip/FVG-yield predicate plus settled anchor for UJ3 all explicitly stated.

**Verdict: Q1-NO / Q2-YES / Q3-YES.**
## V287-ENTRY-FULL END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V288-ENTRY-FULL OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
Q1 **YES** - the gate matches the rule.
E1 walks the seed-exclusive/current-bar-inclusive window via `s54_s < s54_seedShift`, so the seed bar is never walked; it uses the strict direction-matched body-cross, treats wick/touch as non-fatal, captures `AnchorStr()` before clearing, fails open on unreadable data, and mirrors R2’s `ST_IDLE` disposition. The stated anchor-only scope is also preserved.

Q2 **YES** - recency and battery hold.
Both actual promotion sites enforce `g_anchorBarTime > 0 && g_anchorBarTime < iTime(..., barShift)`, so same-bar seed/confirm is rejected while an earlier retest remains eligible. E2a retains the candidate by printing `CONFIRM_STALE_SKIP` and returning; E2b retains it without promoting. The D74 acceptance set is correctly framed: 8/27 is graded by the evaluation/evaluated/break-bar tuple, 9/1 is a negative S2-hold case with E2 only as defense-in-depth, and 9/7 remains preserved.

Q3 **NO** - E-UJ3 overreaches on the temporal predicate because the cited `IsConfirmationCandle()` fields do not, by themselves, identify an independently timed **14:35** flip confirmation. In the shown implementation, `oppCandle` and `touch` are derived from the prior bar (`c1/o1`, `h1/l1`), while `bodyDir` is derived from the evaluated bar (`c0/o0`); replacing only `A2_CLOSE_BREAK` therefore does not establish how a 14:35 flip is carried into the later 14:45 retest/confirmation pass. The proposal needs an explicit flip-bar identity/timing predicate or state handoff before it can be considered fully specified.
## V288-ENTRY-FULL END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V289-ENTRY-FULL OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
Q1 YES - the gate matches the rule.

Q2 YES - recency and battery hold.

Q3 YES - proposals clear with options.
## V289-ENTRY-FULL END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V292-ENTRY-UJ13 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
**Q3-NO — the E-UJ1 portion is not yet sufficiently specified to clear.**

The packet explicitly leaves the decisive admission predicate unresolved: whether the 9:35 SHORT is admitted by changing the `B_BODY` requirement or by a separate flip-reading term.

Because that predicate is the actual mechanism that determines whether the missed 9:35 setup fires—and the packet itself says the council must decide which term admits it—I would not clear the combined UJ1/UJ3 proposal for build as presently written. E-UJ2 and E-UJ3 can remain scoped as proposals; the blocker is the unresolved UJ1 admission term.
## V292-ENTRY-UJ13 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V294-ENTRY-UJ13 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
Q3 NO - E-UJ2 remains under-specified because its multi-week-high source and retarget trigger semantics (close vs touch) are explicitly still open; E-UJ1 and E-UJ3 are otherwise scoped consistently with the corrected 09:35→09:40→09:45 and 14:35→14:40 sequences.
## V294-ENTRY-UJ13 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V295-ENTRY-UJ13 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
Q3 NO - E-UJ2 remains under-specified because the source choice (swing store vs new export) and exceed trigger (close vs touch) are still open predicates, so the UJ2 proposal is not yet sufficiently bounded for clearance.
## V295-ENTRY-UJ13 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V297-ENTRY-UJ123 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
**Q3 YES — proposals clear as scoped.**

The three legs remain within the stated evidence and scope:

* **E-UJ1-15M:** the packet faithfully uses the corrected 5 June sequence: 09:35 retest, 09:40 confirmation, 09:45 open entry, with the 15m structural flip present at the entry-candle open. It explicitly keeps the cascade guard, E1/E2 precedence, pre-confirmation deaths, and no DIV changes; sourcing the 15m bias is left as council mechanism work rather than invented here.
* **E-UJ2-SPEC:** the proposed mechanics match the stated rulings: nearest previous day/session H/L regardless of age, touch-based retargeting to today's NY H/L, candle-close validation only for POC/VWAP gap breaks, plus the 1R admission floor and the narrowly stated degenerate case.
* **E-UJ3:** it preserves the 14:35 confirmation / 14:40 entry interpretation, makes FVG handling a yield mechanism rather than a post-entry re-litigation, and expressly excludes later bars from selection evidence.

There is **no blocking overreach in v13's prose formulation itself**. The packet also explicitly keeps all three as **proposals only**, with no code-surface change in this round.

**Q3 YES — proposals clear as scoped.**
## V297-ENTRY-UJ123 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V298-ENTRY-UJ123 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
Q3-YES

Q3 YES - proposals clear as scoped.
## V298-ENTRY-UJ123 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V299-UJIMPL-1 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
## Verdicts

**Q1-NO** — The packet does not yet identify a machine-readable 15m structural-bias source. The existing `g_hFlow` does receive `PERIOD_M15` at **EA 10665-10667**, but the packet explicitly says the buffer carrying the 15m structural bias is unmapped (**P017**). The alternative `SrjSelSnapTF` path at **EA 3046-3054** is an `iFractals` snapshot mechanism, not a demonstrated structural-bias source, and no M15 call exists (**P017**). The S3/S4 promotion sites at **EA 8668** and **EA 8805** prove confirmation-to-S5 routing, but they do not by themselves establish the required `15m flip at entry-candle open -> promotion` source/ordering. A-UJ1 therefore cannot be proven from the stated disk surface (**P045**).

**Q2-NO** — The existing historical pool cannot establish **nearest-any-age**. `FindNearestSwing()` is hard-capped at **500 M5 bars** at **EA 2490-2503**, and the H1 snapshot is only **600 bars** at **EA 5003**; the packet itself records the April-30 example as beyond both reaches (**P024**). The “new deep lookup” is only an unscoped candidate, so no exact implementation site currently proves the required pool. The unified booking race at **EA 2397-2409** and read-only census at **EA 2441-2465** are suitable integration points, but they do not create the missing historical pool. The **1R admission gate, touch-retarget trigger, and closed-session snapshot discipline** also remain open rather than tied to exact executable sites (**P025-P026**). Therefore A-UJ2-POOL is not yet implementable/provable as specified (**P046**).

**Q3-YES** — The existing yield site is materially identified. Confirmation reaches `ST_S5_GATE_CHECK` through **EA 8668-8679** for S3-prebind/E1 and **EA 8805-8811** for S4/E2. The common gate then calls `CheckFreshness(barShift, g_state != ST_S5_GATE_CHECK)` at **EA 7265**; in S5 this passes `false`, so the 2-of-3 freshness test is diagnostic-only rather than an abort. `CheckFreshness()` implements that distinction at **EA 2288-2298**, with the actual abort occurring only when `twoOfThreeKills` is true at **EA 2296**. The confirmation predicate itself remains intact at **EA 2222-2233**. That is the required proceed-past-HOLD behavior on the confirmation/qualifying-flip pass, with E1 and E2 both entering S5 in the same evaluation pass.

## Analytic A — defects / gaps / imprecisions

1. **15m source semantic mapping is missing.**
   **P017; EA 10665-10667.** `PERIOD_M15` being passed into FlowLogic proves an M15 input exists, not which output buffer contains the structural-bias state required by UJ1.

2. **The proposed M15 snapshotter alternative does not establish structural bias.**
   **P017; EA 3046-3054.** `SrjSelSnapTF()` explicitly snapshots `iFractals` buffers. Merely calling it for M15 would produce M15 fractal events, not a documented 15m structural-bias predicate.

3. **Entry-open timing is not actually proven by the current evaluation timing.**
   **P016-P018; EA 11487-11492.** The EA evaluates the newly closed M5 bar (`barShift=1`). The UJ1 rule requires the 15m structural bias to be flipped **at the 09:45 entry-candle open**. The packet does not specify which M15 bar/shift is read so that the 09:45-open state is used without accidentally using a subsequently closed 15m candle.

4. **Promotion route is specified only as a generic confirmation route, not as the complete UJ1 route.**
   **P018-P019; EA 8668-8691 and 8805-8818.** Those sites establish S3/S4 -> S5 confirmation promotion, but the 15m-bias eligibility read and its ordering relative to that promotion decision are not present.

5. **Nearest-any-age remains impossible on the demonstrated pool.**
   **P023-P024; EA 2490-2503; EA 5003.** The packet correctly identifies the finite-lookback problem, but its replacement is not specified at executable level.

6. **The current target comparator does not enforce the 1R floor.**
   **EA 2301-2321; P025.** `TpTargetUpdateBest()` only checks direction, entry-zone exclusion, and nearest distance. It can select a valid-but-sub-1R target; the required admission gate still has to be inserted elsewhere.

7. **Touch-retarget is not actually sited.**
   **P023-P026.** The packet states the rule but does not identify a concrete executable location at which a closed-session H/L becomes eligible on wick/price touch and causes TP revision.

8. **Closed-session discipline is asserted but not mechanically pinned.**
   **P025.** There is no exact line-level predicate showing that an unclosed session's H/L is excluded while a closed session's H/L is admitted/retargeted.

9. **Q3's implementation is broader than the phrase “qualifying-flip bar only.”**
   **EA 7265; P032.** The suppression is keyed to `g_state == ST_S5_GATE_CHECK`, not explicitly to a separately identified UJ3 15m-flip event. It therefore applies to any confirmation that reaches S5. That may be intentional, but the packet should not describe it as flip-specific without saying why S5 is the complete intended scope.

10. **The Q3 diagnostic wording is slightly misleading.**
    **EA 2295-2297 and EA 7265.** The debug output can print `verdict=HOLD`, but `CheckFreshness()` actually returns `""` in S5. “HOLD” is diagnostic terminology, not the function's control-flow result. That should be stated precisely in the implementation packet/log contract.

11. **The “same-pass” requirement needs an explicit event tuple, not only a state transition.**
    **P018, P045, P047; EA 8668-8679 / 8805-8811.** The code proves same-pass fall-through to S5, but acceptance should record the source-bar timestamp, confirmation-bar timestamp, entry-candle timestamp, and S5 promotion event together so a later-bar re-entry cannot masquerade as the qualifying event.

## Analytic B — better mechanisms

### UJ1

Use the **existing FlowLogic handle**, but explicitly map the exact 15m structural-bias buffer rather than creating an M15 fractal snapshot. Add a small read helper adjacent to the existing selection reads and invoke it in the same closed-bar evaluation pass **before** the S3/S4 confirmation-promotion decision.

The key sites are **EA 10665-10667**, **EA 8668-8679**, **EA 8805-8811**, and the evaluation entry at **EA 11490-11491**.

The predicate should bind the 15m state to the **entry-candle open timestamp**, not simply “latest closed M15 value.” That is the critical piece needed to reproduce the 09:45 UJ1 event without lookahead.

### UJ2

Do **not** extend `FindNearestSwing()` or rely on deeper fractal history. The trade rule is previous **session/day H/L**, not “nearest fractal swing.”

Create a dedicated historical session/day target enumerator near **EA 2490-2503**, returning the nearest strictly-forward eligible H/L from a closed-session archive/history scan. Then feed those candidates into the **same unified `best` race at EA 2397-2409**. Keep `TpTargetUpdateBest()` as the single nearest-value comparator.

Then place the **1R admission gate immediately after the unified winner is finalized and before admission/fire**, and place the **touch-retarget update in the closed-bar evaluation path** so only already-closed sessions can enter the target pool. The census at **EA 2441-2465** should remain read-only.

This gives one target-selection mechanism rather than a special fallback branch.

### UJ3

The current S5-based mechanism is serviceable, but the implementation packet should make the scope explicit. Keep the confirmation predicate untouched at **EA 2222-2233**, retain the E1/E2 promotion sites at **EA 8668** and **EA 8805**, and make the freshness suppression at **EA 7265** explicitly describe that it is a **post-confirmation S5 control-flow rule**, not a generic “flip detector.”

That avoids changing the already-established confirmation semantics while making the 14:35-class yield traceable as:

`seed 14:20 -> confirmation 14:35 -> S5 same pass -> freshness HOLD diagnostic only -> continue`.

### Bottom line

**Q1: NO. Q2: NO. Q3: YES.**

The two blockers are concrete: **UJ1 lacks the mapped 15m structural-bias source/timing predicate; UJ2 lacks an unbounded historical session/day H/L pool plus exact gate/retarget siting.** Q3 already has a coherent executable yield point at **EA 7265**, fed by the existing E1/E2 confirmation transitions.
## V299-UJIMPL-1 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V301-UJIMPL-2 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
## v301-UJIMPL-2 ruling

The packet is a **design round only**: no code edits, builds, runs, or budget are authorized by this file.

### DQ1

**DQ1-NO - the 15m structural-bias source is not mechanically identified, so no exact same-pass promotion route can yet be approved.**

The packet establishes that the FlowLogic handle receives H4/H1/M15 inputs, but explicitly says **which buffer carries the 15m structural bias is unmapped**. The alternative `SrjSelSnapTF` route is only shown for M5 and H1; no M15 call exists. The ordinary promotion sites are known—S3-PREBIND and S4—but the source value cannot be proven to arrive before the promotion decision.

The code companion reinforces that `SrjSelSnapTF()` is a fractal snapshot routine, with existing calls at M5 and H1, not an existing 15m structural-bias reader.

**Required gap:** identify the exact FlowLogic bias buffer, or explicitly define a valid new M15 source and its depth, then pin the read to the closed M15 bar as of the decision tick and place it before the existing S3/S4 promotion edge.

### DQ2

**DQ2-NO - the required any-age historical pool is not mechanically implemented or exactly sited.**

The existing `FindNearestSwing()` searches only `evalShift..evalShift+500`, and the packet says that range is already proven insufficient for the approximately 36-day-old April-30 level. The H1 snapshot is only 600 bars and is likewise described as insufficient for that historical requirement. The proposed “new deep lookup” is only a recommended shape; its implementation surface is explicitly unscoped.

The existing booking race is usable as the integration point: `ComputeNearestTpTarget()` already walks the session/PD pool and POI pool, with nearest-distance selection in `TpTargetUpdateBest()`. The 1R admission location is also identified at the S2 TP-target consumer. But the census is explicitly read-only, and the touch/closed-session re-selection path is only described at design level, not as an exact implemented trigger.

The current comparator itself is indeed nearest-by-price and direction-filtered, with the in-zone exclusion already present.

**Required gap:** define and site the deep historical level pool, prove calendar-depth completeness, wire it into the existing unified booking race, put the 1R gate immediately after the winner is known at admission, and separately define the post-entry closed-session touch/retarget event.

### DQ3

**DQ3-NO - no existing gate mechanically admits the 14:35-class bias-aligned, flip-confirmed setup past S1WAIT.**

The packet records the required setup precisely: the 14:35 candle contains flip + retest + confirmation, entry is the 14:40 open, and later bars are not selection evidence. Yet the actual demonstrated path at 14:40:22 is `S1WAIT` with `REGIME_NONE`, and the existing classifier only computes HTF votes plus the sweep-derived mean-reversion condition.

The existing code confirms that `ClassifyRegime()` derives `trendOk` from HTF buffers 19/20/21 and `mrOk` from the sweep tag; when neither is true it returns `REGIME_NONE`. The caller then retains the candidate at S1 rather than passing it onward.

The confirmation predicate itself is intact: the prior bar must satisfy the opposite-candle and close-side terms, while the evaluated bar must have directional body and touch the anchor.

**Required gap:** an explicit regime-passage predicate has to be integrated into the existing S1 decision so that the already-confirmed, bias-aligned setup can proceed through the ordinary S1→S2→S3 path without relying on the invalid SUPPRESSED mechanism.

---

## Analytic A — defects / gaps / imprecisions

**1. Packet-version inconsistency.**
The header identifies this as v301 and says packet v2, while the embedded “Twin” says `PACKET_P-UJIMPL-1 v1 DRAFT`, then labels the status **v3**. That should be normalized before implementation so the canonical packet identity is unambiguous.

**2. DQ1's evidence contract is incomplete by construction.**
The acceptance rule requires a declared 15m-read timestamp, but the source buffer itself is still unmapped. Thus the requested event tuple cannot currently be generated with a genuine source identifier.

**3. DQ2 mixes “booking integration is known” with “historical pool is known.”**
Those are separate proofs. The booking race is identifiable, but the any-age source pool is not. A passing integration point does not establish a passing historical lookup.

**4. The DQ2 touch trigger is still conceptual rather than mechanically pinned.**
The packet says touch of today's NY H/L is the event and closed-session re-election is the response, but the exact live consumer/state transition is not pinned to a concrete code site in this design round.

**5. DQ3 has a provenance mismatch that needs to remain explicit.**
The required 11-June context is described as 4H bullish until 6/12 00:00, while the journal record is said to differ on 4H; meanwhile the machine `ClassifyRegime()` uses the three HTF buffers generically rather than a specifically identified 4H chart-state predicate. That is acceptable as documented provenance, but not yet an unambiguous machine predicate.

**6. Session scope is evidenced, but not shown as part of the regime admission predicate.**
The indicator's session definitions are present, including London and NY, but the packet does not yet show the exact S1 passage site consuming those session constraints.

---

## Analytic B — better mechanisms

**DQ1:** use the existing `g_hFlow` rather than `SrjSelSnapTF()`. First map the actual FlowLogic structural-bias buffer, then read the **closed M15 bar corresponding to the decision tick** and latch that value before the existing S3-PREBIND/S4 confirmation promotion. `SrjSelSnapTF()` is the wrong abstraction because its present implementation snapshots fractal buffers, not structural-bias state.

**DQ2:** create a dedicated historical session/PD level pool with explicit calendar coverage, then feed that pool into the existing `ComputeNearestTpTarget()` race rather than extending `FindNearestSwing()`. Preserve `TpTargetUpdateBest()` as the single nearest-by-price comparator, and perform the 1R check immediately after the unified winner is selected. That keeps booking and admission semantics centralized.

**DQ3:** do not create a second state machine or resurrect SUPPRESSED. Fold a **bias-aligned flip-confirmed admission predicate into the existing S1 regime decision**, so a valid 14:35-class setup can obtain a normal `S1→S2` transition when the required 15m flip, HTF context, session eligibility, and already-established confirmation are all true. That preserves the existing downstream path and avoids a parallel bypass route. The current S1→S2 transition is already the natural insertion point.

### Bottom line

**DQ1-NO** — source identity is missing.
**DQ2-NO** — any-age historical pool and exact retarget implementation are missing.
**DQ3-NO** — the required S1 regime-passage gate does not exist on disk.

Accordingly, this packet **does not clear an implementation build**. The three design gaps should be resolved in the next implementation packet, with the existing E1/E2 path preserved and no live/build action taken from this verdict. The packet itself confirms there is no run proposed in this round.
## V301-UJIMPL-2 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V302-UJIMPL-3 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
## Council ruling

### DQ1 — UJ1 15m source + promotion route

**DQ1 NO — the 15m structural-bias source is not machine-mapped on disk, and the only explicit native M15 second-handle route is a new unscoped surface; therefore the required same-pass promotion route cannot be specified without inventing a source.**

The blocking facts are:

* The FlowLogic handle is instantiated with H4/H1/M15 parameters at **C10665–C10667**, but the packet explicitly says the buffer carrying the **15m structural bias is unmapped**. The visible FlowLogic exports show only a generic `g_bufBias[]` at **F30** plus HTF high/mid/low buffers at **F58–F60**; nothing in the supplied record establishes that `g_bufBias` is a separately addressable M15 series.
* The generic snapshotter exists at **C3046–C3055**, but current selection calls are only M5 at **C5001–C5002** and H1 at **C5003–C5004**. There is no M15 call.
* The proposed second `iCustom(... PERIOD_M15 ...)` route is expressly marked **new surface + compute requiring an explicit scope word**, P017. That word is not present in this relay.
* The existing promotion sites are downstream: **S3-PREBIND C8655–C8666** and **S4 C8795–C8816**. They can consume confirmation, but the packet has not established a valid machine-readable 15m-flip value that can be read before promotion on the same pass.
* The current evaluation cadence is once per newly closed chart bar at **C11483–C11492**. The desired 09:45 decision therefore needs the 15m value to be available *before* the promotion decision in that exact pass; P017 requires that ordering but does not provide an existing source satisfying it.

So the route is not merely underspecified at the edges; its required **source predicate is missing**.

---

### DQ2 — UJ2 historical lookup + integration + 1R gate

**DQ2 NO — the existing lookup cannot establish nearest-any-age, and the proposed deep day-keyed cache is not yet an on-disk mechanism; existing booking lines are usable as integration sites but do not cure the pool-completeness failure.**

The blocking facts are:

* `FindNearestSwing()` is explicitly capped at **500 M5 bars, C2490–C2503**, and returns the first qualifying value encountered. That is a **time-ordered scan**, not the operator's required **nearest-in-price** search. P024 itself flags this distinction and the April-30 example exceeds the demonstrated reach.
* The H1 snapshot is **600 bars at C5003–C5004**. P024 correctly states that this is about five weeks / roughly 35 calendar days and can be short of the cited ~36-day historical level. It also is a structure-event snapshot, not a complete historical target pool.
* The proposed B2 day-keyed deep lookup/cache is only a **recommended shape**, not existing code. P024 calls it a new deep lookup and unscoped surface.
* The existing unified booking race is real at **C2349–C2409**: session/PD candidates at **C2397–C2402**, POI candidates at **C2403–C2408**, and nearest-value comparison in **C2301–C2321**. The census is read-only at **C2410–C2418** and naming is at **C2441–C2465**. Those lines provide an integration framework, not authoritative historical completeness.
* The admission consumer currently obtains `currentPrice = iClose(...)` at **C7304–C7307**. That conflicts with the explicit **R-at-open** rule in P023: the 1R floor is measured from the **entry open**, not the confirmation-bar close. The packet says the 1R gate belongs after the winner at admission, but it does not identify an existing value path carrying the next-open entry price into that exact gate.
* The managed recompute at **C11095–C11118** exists, but it still reads the existing finite buffers. It does not establish the required any-age historical pool.
* Touch-retarget and closed-session snapshotting are prescribed in P023/P025, but the supplied disk pull does **not** show a complete event-trigger implementation that turns a touch of today's NY high/low into a re-election from the **closed NY session pool only**. The packet describes the intended mechanism but does not show the on-disk predicate that does it.

Therefore the existing booking machinery is a viable **siting framework**, but the actual DQ2 requirement—**authoritative nearest-any-age pool + entry-open 1R admission + closed-session touch-retarget**—is not implemented sufficiently to answer YES.

---

### DQ3 — UJ3 regime passage

**DQ3 NO — the current regime gate cannot admit the cited 14:35 flip-confirmed setup because S1 requires `ClassifyRegime()` to return non-NONE, while the exhibited decision row is `REGIME_NONE`; E1/E2 occur only after that gate and therefore cannot provide the required passage.**

The blocking facts are:

* The present regime classification is **C2238–C2267**: three HTF votes from buffers 19/20/21, plus a sweep-derived mean-reversion test. The candidate must obtain at least two directional HTF votes for `trendOk`, or a qualifying sweep for `mrOk`.
* The 6/11 decision-pass evidence is explicit: **S1WAIT at R63 CI** and **REGIMECENSUS at R63 IH**, with `votes=1 trendOk=0 sweepTag=0 mrOk=0`. P031 and the row itself establish `REGIME_NONE`.
* The actual state gate is **C8060–C8065**: regime NONE causes the candidate to be retained in S1WAIT; only a classified regime advances to `ST_S2_LTF_ALIGN`.
* E1 at **C8655–C8689** and E2 at **C8795–C8816** operate in S3/S4. They are therefore **downstream of the S1 regime gate**, not a mechanism for crossing it.
* The required 14:35 setup is nevertheless documented as having **retest + confirmation on the same 14:35 candle**, with the 14:40 open as entry. The acceptance condition in P048 asks for that bias-aligned setup to pass S1/suppression **with E1/E2 first**, but no existing on-disk predicate is shown that converts “flip-confirmed + HTF-bullish context + valid London/NY scope” into a regime admission before C8060.
* The present `ClassifyRegime()` also does not directly encode the required **15m structural-flip timing**. Its HTF inputs are the 19/20/21 classification buffers, not a documented 15m flip timestamp/source.
* The packet expressly withdrew the FVG-yield relocation as the solution in P030–P032, so that cannot be used to manufacture a passage.

Accordingly, DQ3 is a genuine **missing admission mechanism**, not merely a logging deficiency.

---

## Analytic A — defects / gaps / imprecisions

1. **DQ1 source identity is unresolved.**
   P017 says FlowLogic consumes M15, but the exact 15m structural-bias buffer is unmapped. `g_bufBias[]` at **F30** is insufficient by itself to prove TF identity.

2. **DQ1's alternative source is not actually authorized.**
   The M15 snapshotter option is absent from current calls (**C5001–C5004**), while the proposed second handle is explicitly marked unscoped in **P017**.

3. **DQ1 route ordering is prescribed but not instantiated.**
   P017 requires the 15m read before promotion, yet no concrete existing call site is identified where that value is acquired before **C8655/C8795**.

4. **The “15m flip at the entry candle open” timing needs one exact machine boundary.**
   P010/P017 describe the 09:30–09:45 closed M15 bar and the 09:45 open together; the implementation still needs an explicit rule that the read occurs at `09:45:00` and uses that closed M15 bar, before the 5m promotion decision in the same pass.

5. **DQ2 nearest semantics are internally mixed.**
   P023 requires **nearest in price**, while the current `FindNearestSwing()` is **first qualifying event in time** at **C2494–C2501**.

6. **DQ2 finite history cannot prove “any age.”**
   The 500-M5 and 600-H1 bounds (**C2494–C2501; C5003–C5004**) are inherently finite. P025's pre-window statement acknowledges this, but the acceptance wording “any-age nearest” needs an explicit completeness contract at runtime, not only a prose declaration.

7. **The admission 1R reference is wrong at the current integration point.**
   `currentPrice` is `iClose(..., barShift)` at **C7304–C7307**. The packet's ruling is **R-at-open**, P023. Those are not the same price.

8. **Selection and management distance bases are not explicitly separated.**
   `TpTargetUpdateBest()` measures candidate distance from its `currentPrice` at **C2319–C2321**. The packet needs to distinguish admission-from-entry-open from management-nearest-at-management-price explicitly.

9. **The target universe is not fully reconciled.**
   DQ2 speaks in terms of previous day/session H/L, while the existing unified race includes both session/PD candidates and POI lines at **C2397–C2408**. The exact precedence between “nearest historical session/day level” and the unified POI race needs one operative statement.

10. **Session taxonomy and target taxonomy are not identical.**
    `ENUM_SRJ_SESSION` at **C228** contains `SESSION_LONDON` and `SESSION_NYAM` only, while FlowLogic exports Asia/London/NY/PM and previous-day session buffers at **F38–F56**. The packet says PM is excluded “by construction,” but it does not say whether Asia historical H/L are target-eligible despite Asia not being an entry-session enum.

11. **Touch-retarget trigger mechanics are still conceptual.**
    P023/P025 specify the event and closed-pool re-election, but no exact current disk line is shown that detects the touch and invokes the refresh with the closed NY-AM snapshot.

12. **Closed-session snapshot boundary needs an exact machine definition.**
    The 6/5 example says NY AM closed at 19:00, but the packet should still fix the exact session interval, closure timestamp, and whether the closing bar is included/excluded.

13. **DQ3's “HTF-bullish context” is not equivalent to current `ClassifyRegime()` evidence.**
    The code at **C2243–C2248** consumes three direction votes from HTF buffers; that is not the same thing as a machine-readable 4H/1H/15m structural-bias stack with the operator's documented 15m flip timing.

14. **The 14:35 regime refusal is conclusively shown, but the desired replacement predicate is not.**
    P031 correctly removes FVG-yield as the mechanism, but P033 does not name an existing on-disk gate capable of admitting the candidate.

15. **“E1/E2 first” is underspecified as an execution-order rule.**
    P048 says the regime passage should occur with E1/E2 first, but E1/E2 themselves are downstream state transitions. The exact precedence relation between confirmation consumption, regime admission, and S3/S4 freshness logic needs to be operationally defined.

16. **The suppression terminology is not fully pinned.**
    P031 says the `SUPPRESSED` row is inadmissible as a mechanism, but the D3 acceptance wording still says “S1WAIT/suppression passed.” That leaves an avoidable ambiguity over whether suppression is observed diagnostically or is a live veto.

---

## Analytic B — better mechanisms

### UJ1

Use a **dedicated, read-only M15 bias snapshot** sourced from a clearly identified exported bias buffer, acquired once on each M5 evaluation pass at the decision boundary, before any promotion logic.

The clean placement is around the existing evaluation path **C11490–C11492**, before the S1/S3/S4 state decisions consume the candidate, with the promotion outcome then flowing through the existing **C8655–C8689 / C8795–C8816** machinery rather than adding another confirmation branch.

The critical implementation contract should be:

`M15 closed bar @ decision tick -> read 15m structural bias + flip timestamp -> validate entry-candle-open flip -> existing E1/E2 promotion`

The missing part is the source itself; that is why DQ1 remains NO until that source is authorized and mapped.

### UJ2

Use a **day-keyed historical level pool** populated from authoritative session/day closures, then perform a **nearest-by-price directional reduction** over that pool. Do not repurpose `FindNearestSwing()` as the historical mechanism.

The existing booking reducer **C2301–C2321** can remain the comparator primitive, but the admission-side candidate walk around **C2349–C2409** should consume the complete historical pool rather than the finite 500-bar swing search.

Separately:

* Admission price basis: **next-open entry price**, replacing the present `iClose()` basis at **C7304–C7307**.
* 1R test: apply once to the elected admission target.
* Touch event: detect today's NY H/L touch after entry.
* On touch: snapshot the now-closed NY session, then re-run the same nearest-price reducer against the **closed-session pool only**.
* Keep the management nearest-target rule distinct from the admission 1R gate.

That mechanism directly addresses the three actual defects: historical reach, price-nearest semantics, and R-at-open.

### UJ3

Do **not** move the candidate into S5 from confirmation, because that would bypass the state architecture. Instead, add a narrowly defined **regime-admission predicate immediately before the existing S1→S2 gate at C8060–C8065**, using already-established evidence:

`confirmed structural flip -> correct direction -> required 15m/HTF context -> London/NY session -> existing confirmation signature -> admit`

Then let the normal path continue through **C8067 onward**, preserving E1/E2 precedence downstream.

The important property is that this is a **replacement for the missing regime admission predicate**, not an FVG exception and not a new firing branch. It should not consume post-entry bars and should not use the later 14:45 evidence.

---

## Final tally

| Question | Ruling | Core reason |
| -------- | ------ | ----------- |
| **DQ1**  | **NO** | 15m structural-bias source is not mapped; M15 read path is absent; new M15 handle is unscoped |
| **DQ2**  | **NO** | No authoritative nearest-any-age pool; current lookup is finite/time-first; admission uses close instead of entry open; retarget mechanism not shown |
| **DQ3**  | **NO** | Current S1 regime classifier returns `REGIME_NONE`; E1/E2 are downstream and cannot admit the 14:35 setup |

**No build, tester run, spend, commit, or live-activation clearance follows from these rulings.**
## V302-UJIMPL-3 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V303-UJIMPL-4 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
## Council ruling

**DQ1 NO -** the proposed source is correctly identified as the **confirmed M15 leg of the existing HTF engine**, with second-`iCustom(PERIOD_M15)` fallback, but the page does not establish an executable promotion route for the exhibited UJ1 candidate: the 09:45 candidate is still **`S2_LTF_ALIGN` / `S2WAIT`**, while the packet simultaneously forbids an S2 extension and requires promotion only through existing S3/S4 sites. The source read itself is also not yet mapped to an actual exported buffer/flip field.
**Relevant lines:** P017-P019; EA C5001-C5004; EA C8067-C8077; EA C8660-C8679; EA C8804-C8811; EA C11483-C11492; UJ1 rows `FRESHSKIP 09:40` + `S2WAIT 09:40`.

**DQ2 YES -** use **buffer-extraction-first** from the day-keyed historical session/previous-day buffers, with `FindNearestSwing` and H1-600 only as fallback; feed the resulting pool into the existing single nearest-price race, with the additional candidate walk before the existing census walk; place the **1R admission gate after successful winner selection at the S2 admission consumer**, and keep touch-retarget in the post-entry refresh path reading only the **closed-session snapshot**. The packet gives enough siting to rule the mechanism, while acceptance must prove pool completeness and nearest selection.
**Relevant lines:** P024-P025; EA C181-C200; EA C2301-C2321; EA C2349-C2409; EA C2410-C2465; EA C7305-C7313; EA C11095-C11118.
The 500-M5 `FindNearestSwing` cap and 600-H1 reach are explicitly insufficient for the April-30 UJ2 historical level, so they cannot remain authoritative.

**DQ3 NO -** the required passage is not actually specified at an exact code site with an exact admitting predicate. The exhibited 14:35 setup still terminates in `REGIME_NONE` because `ClassifyRegime` requires `trendOk` and/or `mrOk`; the packet describes a “unified passage” concept, but does not state the concrete predicate that replaces this `S1WAIT` retention, nor exactly where it is inserted relative to the existing E1/E2 path.
**Relevant lines:** P028-P033; EA C2238-C2267; EA C8060-C8065; EA C8660-C8679; EA C8795-C8811; UJ3 rows `S1WAIT` + `REGIMECENSUS votes=1 trendOk=0 mrOk=0`.

## Analytic A — defects, gaps, and imprecisions

| Location | Finding |
| -------- | ------- |
| **P017** | The “confirmed-output discovery” is conceptually sound but not yet source-complete: the actual **buffer index/export contract for the confirmed M15 leg and flip timestamp is still unmapped**. `g_bufHtfLo` at F58 is presently only the ordinary FlowLogic HTF export, not proof that it carries confirmed M15 state. |
| **F246-F256, EA C202-C204** | `inUseConfirmedHTFOnly=false` means the presently exported HTF 19/20/21 path is **live**, while the requirement is decision-time confirmed M15 structure. The page correctly identifies this, but that makes the current buffers unusable as authoritative DQ1 evidence until the confirmed export exists. |
| **B138-B145** | `g_s.wasBiasFlip = g_s.wasBiasFlip;` is a no-op in both branches. The shown BiasEngine therefore does not demonstrate a real per-bar flip assignment at this site. That is material because DQ1 expressly needs flip timing. |
| **P017 + EA C11483-C11492** | The “09:45:00 closed M15” timing needs an explicit **readiness/shift contract**: which M15 shift is read, and what proves the indicator has finalized that bar before the EA consumes it on the same 5m evaluation pass. |
| **P018 + EA C8067-C8077** | This is the largest DQ1 route contradiction: the cited UJ1 evidence is parked in **S2_LTF_ALIGN**, yet the design says **no S2 extension** and points promotion at S3/S4. The page has not supplied the bridge. |
| **P018** | “E1-walk + E2-recency first” and “ordinary unmodified state path” are not enough to define whether the 09:45 candidate can reach S3/S4 without modifying S2. The exact state transition is missing. |
| **P024** | “day-keyed reads” is still an algorithm description, not a fully bounded historical traversal contract. It needs an explicit historical iteration domain and stopping/completeness rule sufficient to establish **ANY-age** rather than merely “deeper than 500 bars.” |
| **P024 + F46-F56** | The packet relies on rollover-cached previous-session values, but does not specify how a historical walk distinguishes repeated cached values for different completed days, or how it proves the value belongs to the required closed day/session instance. |
| **P025 + EA C2349-C2368** | The existing session candidate array includes current session buffers as well as previous-day/session buffers. The page says closed-session discipline is required, but the exact admission-time exclusion of still-open session levels is not shown here. |
| **P025 + EA C7305-C7313** | `ComputeNearestTpTarget()` is fed **`currentPrice = iClose(..., barShift)`**. The 1R rule is explicitly measured from **entry open**, so the packet must distinguish the price used for nearest-target competition from the price used for the 1R test. As written, that distinction is not explicit. |
| **P025** | The exact 1R insertion site is described as “post-race” but is not given as a concrete statement-level insertion, e.g. immediately after a successful `ComputeNearestTpTarget()` return and before stop/transition consumption. |
| **P025 + EA C11095-C11118** | The managed recompute is shown, but the page does not pinpoint the actual **touch-event detector** that causes re-election. “TP_ELECT shadow” is design context, not a complete predicate/site contract. |
| **P025** | The packet correctly says management may revise below 1R and still exits nearest, but that requires a strong distinction between the **admission-only R gate** and the **management-time nearest selector**. The page should state explicitly that no 1R filter is applied inside the managed selector. |
| **P028-P033** | “Unified-passage” is a design label rather than a predicate. It lacks the exact Boolean condition and exact destination state for the 14:35-class and 09:45-class parameterizations. |
| **P030 + EA C2238-C2267** | The DQ3 premise says HTF-bullish context governs, but the shown `ClassifyRegime()` derives `trendOk` from the three exported HTF buffers. Because those buffers are presently live and the exhibited UJ3 row is `votes=1`, the packet has not yet separated **machine HTF regime detection** from the operator’s chart/journal HTF ruling. |
| **P031** | The packet correctly withdraws FVG-yield as the mechanism, but it should explicitly say what **positive mechanism now owns the former death point**. Otherwise it proves the old mechanism was wrong without fully instantiating the replacement. |
| **P044-P049** | The acceptance schema is strong, but DQ1’s required source stamps depend on an export that does not yet exist, and DQ3’s “flip-read + census stamps” do not identify the exact fields that will populate them. |
| **P055** | Calling this the “first code-level predicate specification” is fair, but several predicates remain prose-level: the DQ1 promotion bridge, DQ2 touch trigger, and DQ3 passage condition are not yet code-addressable enough for a builder to implement without interpretation. |
| **End-of-file statement: “No `IsConfirmationCandle` touch anywhere (12 sites)”** | This wording is incorrect against the pasted code: `IsConfirmationCandle()` is explicitly called at **C8668** and **C8805**. The defensible wording is “no **new** `IsConfirmationCandle` caller proposed” or equivalent. |
| **C8660-C8679 vs P018** | The PREBIND path can promote directly to `ST_S5_GATE_CHECK`, but that path is only reachable once the candidate is already in the cited prebind state. The packet does not show how the UJ1/UJ3 candidates reach that state at the decision candle. |
| **C8822-C8848** | The divergence walk is explicitly unbounded and newest-first, but DQ1/DQ3 both say divergence machinery is outside the bypass. The packet should say explicitly that the unified passage **does not alter** this S5 divergence gate after promotion. |
| **C7307-C7312** | Current behavior is still “no TP target → abort.” There is no shown 1R predicate here; the packet is therefore specifying a future gate, not documenting an existing one. That is acceptable for design, but it should be labeled as such. |

## Analytic B — better mechanisms

**DQ1:** the cleaner mechanism is **not** a second EA-side M15 mirror as the primary path. Export the HTF engine’s **confirmed Lo/M15 state plus its confirmed flip event/time** from the indicator, then consume that export at the earliest existing evaluation point before any promotion decision. The second `iCustom(PERIOD_M15)` should remain a validation/fallback path only. The critical implementation question that must be solved before build is the **state-path bridge from the exhibited S2 holder to an existing promotion site**; absent that bridge, the source fix alone cannot produce the 09:45 entry.
Touch points: **HTF engine/GetOutputs around the cited 570-577 region; FlowLogic buffer declarations F30-F60; EA source read before the promotion logic; S3/S4 at C8668-C8679 and C8804-C8811; evaluation ordering C11483-C11492.**

**DQ2:** retain one unified `TpTargetUpdateBest()` race. Add the historical PD/session extraction as a **true candidate source**, not as a competing TP engine; walk historical completed-day buffer observations until the completeness contract is satisfied, feed candidates through the unchanged comparator, then perform the 1R test against **latched entry open**, not the evaluation close. Keep touch-triggered re-election as a separate post-entry event that snapshots only the now-closed NY AM level before invoking the same nearest selector.
Touch points: **C2301-C2321, C2349-C2409, C2452-C2464, admission around C7307-C7313, and managed recompute C11095-C11118.**

**DQ3:** the best mechanism is a **single parameterized S1 passage predicate** immediately adjacent to the existing `REGIME_NONE` retention, not a new divergent regime engine. Its two parameterizations are the ones already stated in P030: (1) same-bar 5m flip + confirmation for the 14:35-class case, and (2) prior-bar 5m confirmation + confirmed-M15-at-open flip for the 09:45-class case. E1/E2 precedence remains intact, confirmation remains one-bar, and the ordinary S5 divergence/management gates remain downstream.
Touch point: **the `S1WAIT` decision site C8060-C8065, with inputs from the existing confirmation read C2193-C2233 and the confirmed-M15 source defined under DQ1; do not alter C8668-C8679/C8804-C8811 beyond consuming the promoted state.**

### Final tally

**DQ1 — NO**
**DQ2 — YES**
**DQ3 — NO**

So this packet does **not** establish a three-leg implementation-ready design. The remaining hard blockers are the **UJ1 S2→promotion route**, the **explicit DQ3 passage predicate/site**, and, separately, several wording/contracts that should be tightened before a build packet is allowed.
## V303-UJIMPL-4 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V305-UJIMPL-6 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
The page supports a **halt on DQ1–DQ3 and a firm implementation budget on DQ4**. The main issue is not that the proposed mechanisms are conceptually wrong; it is that several critical bindings are still only described as contracts rather than nailed to the current disk shape, and DQ2 contains one explicit contradiction with the present EA.

# BUILDER RELAY COUNCIL v305-UJIMPL-6 — RULING

## DQ1 — UJ1 indicator repair + consumption

**DQ1-NO - confirmed-leg export is not yet mechanically bound, because the current disk still exposes the HTF vote buffers through the live-output configuration and the packet does not resolve the exact confirmed-buffer mapping: `Indicators\SRJ_FlowLogic.mq5` F252 has `inUseConfirmedHTFOnly=false`, while the EA reads `FL_BUF_HTF_HIGH/MID/LOW` directly at EA 2240-2248. The packet also does not give the exact indicator fill/buffer binding that makes the M15 leg confirmed without creating an unintended semantic change to the other HTF legs. The required consumption ordering is described at EA 11490-11492 / 8067-8077 / 8668 / 8805, but the confirmed source read itself is not yet actually sited there.**

The required repair direction is therefore:

* confirmed-output mapping must be fixed inside the existing HTF engine / FlowLogic path, using the confirmed state exposed by the engine at HTFEngine 570-577 and its FlowLogic fill sites around 1195-1200;
* the M15 decision value must be derived from the **closed M15 leg**, not from a live/open-instant state;
* value-turn detection must replace reliance on the broken flip-event path; `SRJ_BiasEngine.mqh` B140-B144 is explicitly nonfunctional as an event-producing mechanism and must remain diagnostic rather than authoritative;
* the resulting confirmed read must occur before the promotion decision on the same `EvaluateClosedBar` pass, with the existing S2 bridge at EA 2270-2276 and ordinary S3/E1/E2 route intact.

No second handle and no EA-side mirror are authorized.

## DQ2 — UJ2 historical lookup + booking + 1R

**DQ2-NO - the v6 contract materially improves the mechanism, but it does not yet close the implementation gaps, and the present EA contains an explicit entry-reference mismatch at EA 7305: `currentPrice = iClose(...)` while the ruling requires the election reference to be the entry-open / would-be-fill price.**

Additional unresolved implementation points are:

* the required any-age extraction is specified as `Bars(_Symbol, PERIOD_CURRENT)` with the walker's own `CopyBuffer`, but the actual extractor/cache implementation and exact insertion site are not present in the packet;
* record identity, source-session/day, close/availability timestamps, earliest-day coverage, and rollover-cache refresh are specified as requirements, but not mechanically bound to concrete implementation lines;
* the admission 1R gate is said to sit after `SlRefMemo` / EA 7325, but the actual post-7334 inequality is not shown or otherwise pinned;
* the touch-retarget event is still presented as a conditional choice between the swept-mask route and managed recompute rather than one fully specified canonical implementation site;
* the booking proof and census proof must use the **same entry-open reference and same authoritative eligibility set**. EA 2441-2465 is explicitly read-only and omits some authoritative filters, so it cannot itself substitute for booking proof.

The existing nearest-in-price comparator at EA 2301-2321 may remain intact. The required repair is around its input/reference population, historical pool completeness, admission gate, and closed-session retarget event.

## DQ3 — UJ3 regime passage

**DQ3-NO - the pinned predicate is clear, but it is not yet wired into the current regime path. EA 2239-2248 still reads `FL_BUF_HTF_HIGH/MID/LOW`, and those buffers are currently live-output buffers under FlowLogic F252; therefore the disk does not yet demonstrate `confirmed votes >= 2` plus `confirmed-M15-direction == trade direction` at the passage predicate.**

The remaining exact gaps are:

* the confirmed H4/H1/M15 source values required by the predicate are not yet bound into EA 2239-2248;
* the direction-alignment term is specified but no exact insertion at the S1 admission/promotion decision is fixed;
* EA 8060-8064 currently converts the classification result into `ST_S2_LTF_ALIGN`, but the page does not yet show the completed predicate that prevents a live-MTF classification from passing that edge;
* the required UJ3 suppression diagnostic — full `SUPPRESSED` row or its candidate/session emitter — is mandated by P031, yet the packet's own row battery says none is presently exhibited for the 14:40:22 pass;
* the 14:35-class and 09:45-class are said to share one parameterized passage, but the exact evidence-source mapping for each class still has to be fixed in implementation rather than merely described.

The correct conceptual predicate is still:

`confirmed_HTF_votes >= 2 && confirmed_M15_direction == trade_direction`

with the class difference confined to the evidence timestamps/trace, not to divergent gate logic.

## DQ4 — code-surface + budget

**DQ4-RULED - permitted surface is limited to the existing indicator engine/FlowLogic path plus `Experts\SRJ_FlowNexus_EA.mq5`; no second indicator handle, no EA-side indicator mirror, no new branch-family, no new input, and no unrelated strategy surface. S1 exact-diff/pre-hash and S3 code-surface recount are mandatory, with any surface or budget breach failing closed.**

Permitted implementation regions are the existing ones identified in this packet:

* existing HTF engine / indicator logic around HTFEngine 115-118 and 570-577, `SRJ_BiasEngine.mqh` B16-B35 / B138-B169, and FlowLogic HTF declarations/fill path F30-F60 / F1195-F1200;
* EA confirmed-source consumption / passage regions around 2193-2208, 2239-2248, 2270-2276, 8060-8077, 8668, 8805, and the closed-bar ordering at 11483-11492;
* UJ2 booking/lookup regions around 2301-2424, 2441-2465, 7305-7334, and 11095-11118.

No new file is authorized merely to work around an indicator-side problem. An existing HTF-engine include may be modified only where the engine already owns the cited functionality.

Budget for the implementation packet:

**one implementation build; S1 exact-diff gate before it; S3 surface/budget recount before tester use; then only the already-defined EU 8/26-9/10 and UJ 6/1-6/13 grade windows under the existing key/word gates.**

---

# Analytic Ask A — defects, gaps, and imprecision

1. **Confirmed-export ambiguity:** D1 says “confirmed M15-leg bias + flip timing” but does not identify the exact exported buffer semantics or resolve how that coexists with the existing live HTF buffers. F30-F60, F246-F256, EA 2240-2248.

2. **Live/confirmed contradiction:** F252 explicitly sets `inUseConfirmedHTFOnly=false`, while DQ1/DQ3 require confirmed HTF evidence. F252; EA 2240-2248.

3. **No-buffer constraint is under-specified:** P005 says no new buffers are proposed, but the existing declared HTF outputs are already 19/20/21. The page does not yet prove which existing output can safely carry the confirmed leg without changing an unrelated consumer. F58-F60.

4. **Flip timing is not mechanically defined:** “value-turn” replaces the broken flip-event path, but the exact previous/current sample pair and timestamp rule for the 15m turn are not fully fixed in code terms. B138-B145; D1 P017.

5. **Detection-robustness scope is blended:** “open-instant repaint” and “non-firing flip events” are two different failure modes. The packet says “and/or” without making clear whether both are mandatory or whether the confirmed closed-bar export alone supersedes both.

6. **UJ2 entry reference is contradicted by disk:** D023 pins the entry-open proxy, but EA 7305 currently feeds `iClose(...)` into the TP election. This is a concrete implementation defect, not merely a missing proof.

7. **Historical extraction is contractual, not yet mechanically located:** P024 requires a `Bars()`-depth `CopyBuffer` extraction, day-keyed records, rollover cache, and earliest-day coverage, but no exact helper/function insertion is identified.

8. **1R gate is described but not shown:** P025 fixes the gate after `SlRefMemo` EA 7325, but the actual gate inequality and its concrete branch are absent from the supplied code surface.

9. **Touch-retarget route has two possible implementations:** “swept mask first, else managed recompute” leaves the exact canonical event implementation unresolved. A grade must not have two materially different mechanisms unless both are explicitly proven.

10. **Census is non-authoritative by design:** EA 2410-2413 and 2441-2465 cannot themselves prove booking eligibility because they omit authoritative mask/zone filtering. The acceptance language must keep census as evidence only, never admission authority.

11. **UJ3 confirmed predicate is not wired:** EA 2240-2248 still implements the old live-buffer vote calculation. The packet's new confirmed-M15 alignment rule therefore remains a design statement, not current behavior.

12. **Suppression evidence is a stated acceptance obligation but not exhibited:** P031 requires the complete suppression row or emitter, while the rows battery states none is currently present for 14:40:22.

13. **E1/E2 precedence is specified but not yet fully demonstrated:** P018 requires upstream eligibility first and the confirmed read before promotion on the same pass; the snippets identify the sites, but the final implementation ordering has not yet been written.

14. **The “same parameterized passage” claim needs exact class parameters:** the 14:35 and 09:45 cases legitimately differ in source/confirmation timing, but the exact evidence stamps and source shifts need to be encoded rather than left as prose.

15. **EA 7305 / 2397-2408 reference consistency needs preservation:** changing the admission reference to entry-open must also ensure the booking census and all nearest-distance evidence are computed from that same reference, otherwise the printed proof can diverge from the booked target.

# Analytic Ask B — better mechanisms

### UJ1

Use the existing HTF engine's **confirmed per-TF state as the sole authoritative source**, with a closed-M15 latch updated only when the M15 bar closes. Export that confirmed state through the existing HTF output path rather than creating a second EA handle. The EA should read the confirmed tuple once on the 5m evaluation pass before the S1/S2/S3 promotion logic.

Relevant surfaces: HTFEngine 570-577; FlowLogic F30-F60 and F1195-F1200; EA 2240-2248, 2270-2276, 11490-11492.

For flip detection, compare the confirmed current M15 direction against the immediately preceding confirmed M15 direction. This eliminates dependence on `wasBiasFlip` / event firing and naturally survives the B140-B145 no-op defect.

### UJ2

Split the mechanism into two explicit stages:

**history materialization → target election.**

Materialize the previous day/session H/L pool once per completed day/session into a day-keyed cache, with source timestamps and coverage bounds. Then make `ComputeNearestTpTarget` consume that pool plus the POI pool, using the **entry-open reference** for admission. Put the single 1R test immediately after the winner and stop are both known.

For retargeting, treat the closed NY AM H/L touch as an event which triggers a fresh election against the closed-session pool; never use a still-open session level.

Relevant surfaces: EA 2301-2321, 2349-2408, 7305-7334, 11095-11118.

### Implementation discipline

Keep `IsConfirmationCandle` unchanged; the existing E1/E2 consumers at EA 8668 and 8805 already provide the confirmation path. Do not reopen DIV logic at EA 8835-8849, and do not use the divergence machinery as an indirect fix for any of UJ1-UJ3.

## Final tally

**DQ1-NO**
**DQ2-NO**
**DQ3-NO**
**DQ4-RULED**

No build, run, spend, handle, mirror, or live-activation clearance is granted by this ruling.
## V305-UJIMPL-6 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V306-UJIMPL-7 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
## V306-UJIMPL-7 ruling

### DQ1

**DQ1 YES — repair the indicator, not the EA, and consume the repaired confirmed outputs on the same evaluation pass.**

The required repair is the BiasEngine flip path at **B138–B146**: the current branches at B140 and B144 self-assign `g_s.wasBiasFlip`, so a detected change never records a flip. The packet itself identifies this as the disk-verified root cause and directs repair of `wasBiasFlip=true`, `currentBias=detectedBias`, and the associated fields.

The second required part is the confirmed-output path: the HTF engine already exposes confirmed outputs at **H570–H577**, while the deployed FlowLogic setting at **F246–F252** currently has `inUseConfirmedHTFOnly=false`; the repair therefore needs the 19/20/21 export/fill path to deliver the confirmed H4/H1/M15 values used by the EA.

Consumption remains on the existing EA path: confirmed read first, then the ordinary candidate promotion path; the S2 holder still has to cross `CheckLtfAlign` at **C2270–C2276**, then S3 reaches the existing E1/E2 confirmation sites at **C8668** / **C8805**. No second handle and no EA-side mirror.

**DQ1 is a design CLEAR, but not an implementation proof yet.**

---

### DQ2

**DQ2 YES — use the any-age extraction-first pool, integrate it into the existing nearest-target race, and put the 1R gate immediately after the stop memo at C7325.**

The existing `FindNearestSwing()` at **C2490–C2503** cannot satisfy the operator's rule: it walks only `evalShift..evalShift+500` and returns the first encountered value, whereas the ruled requirement is nearest-by-price with no age cutoff.

The implementation contract therefore correctly moves historical extraction to the walker's own `Bars(_Symbol, PERIOD_CURRENT)` / `CopyBuffer` depth, with day/session identity, rollover cache, coverage evidence, and mask-safe historical records. The 4000-bar selection snapshot is not to be mistaken for the extraction span.

The booking race itself is the right integration point: **C2349 onward**, with session/PD candidates at **C2356–C2364**, mask read at **C2367–C2368**, and the existing nearest comparator at **C2301–C2321** left intact.

The important admission correction is explicit: the current disk still uses `iClose` at **C7305**, but the ruled race must elect from the **entry-open proxy**. The 1R gate belongs after `SlRefMemo` at **C7325**, before admission action, and must not leak into the managed recompute at **C11095–C11118**.

The swept-mask-first trigger ordering and closed-NY-AM-only retarget object are also correctly contracted.

**DQ2 is a design CLEAR.**

---

### DQ3

**DQ3 YES — admit through the S1→S2 promotion boundary only after the confirmed HTF predicate passes: votes ≥2 AND confirmed-M15 direction equals trade direction.**

The current classifier at **C2238–C2267** only establishes `trendOk = votes >= 2` and separately considers `mrOk`; it does not currently contain the additional confirmed-M15 direction-alignment predicate.

The correct implementation site is therefore the existing S1 promotion boundary around **C8059–C8063**, before the candidate is allowed into the ordinary S2 path. The packet explicitly requires E1/E2 upstream precedence, the confirmed H4/H1/M15 read before promotion, and no alteration to the DIV path.

This is not merely a `REGIME_NONE` workaround. The admitted regime must be the correct classification. The 6/11 evidence currently shows why the existing disk fails: at 14:40:22 the candidate is retained in S1WAIT with **votes=1 / trendOk=0**, despite the 14:35 retest+confirmation evidence.

The required sequencing is therefore:

**DQ1 indicator repair → 6/11 confirmed-output probe → only if the repaired confirmed votes remain below 2, add the specified passage predicate → then verify the 14:35-class case.**

No suppression bypass is authorized; the full SUPPRESSED row or emitter must be observable so a suppression failure cannot be confused with regime failure.

**DQ3 is a design CLEAR, conditional on that exact implementation/probe sequence.**

---

### DQ4

**DQ4 RULED — indicator-side HTF/BiasEngine repair plus existing EA consumption/lookup integration only; no second handle, no EA-side mirror, no E1/E2 rewrite, and S1 pre-hash + S3 exact-diff/budget recount govern the implementation packet.**

The packet explicitly carries the prior **DQ4 2–0 RULED** result and says this round introduces no code edits.

The implementation surface is therefore limited to the canonical indicator and the existing EA regions already identified in the packet; E1/E2 remain byte-identical, and the recount discipline is **STAGE-1 exact diff → S1 pre-hash → S3 budget recount**.

One precision issue: **v8 does not reproduce a numerical line/byte budget value**. I would not invent one. The binding rule available here is the carried DQ4 ruling plus the S1/S3 recount discipline.

---

## Analytic A — defects/gaps still visible on the page

1. **Bias flip is still broken in the current disk.** B140/B144 are self-assignments, so the flip state cannot propagate.

2. **Confirmed HTF capability exists but the deployed selection is live-output mode.** `inUseConfirmedHTFOnly=false` conflicts with the required confirmed-value consumption until the indicator export/fill path is repaired.

3. **Current S2POLL target election is not yet R-at-open compliant.** The disk passes `iClose` as `currentPrice` at C7305; the packet's contract requires the would-be entry open.

4. **The existing +500 swing walk is both depth-limited and wrong for nearest-by-price semantics.** It returns the first qualifying historical swing encountered.

5. **Current regime logic still lacks the new direction-alignment condition.** C2248 only enforces `votes >= 2`; nothing there checks confirmed-M15 direction against trade direction.

6. **Current 14:35 evidence still dies at S1WAIT.** The exhibited row is `votes=1 trendOk=0`, so the new passage mechanism is not yet implemented/proven on disk.

7. **The SUPPRESSED mechanism remains an evidence gap in the existing disk.** The packet requires its full row/emitter to be exhibited so suppression-blocked cannot be misclassified as regime failure.

8. **DQ4's numeric budget is under-specified in v8.** The ruling is carried, but this packet does not state the actual numeric ceiling; implementation should therefore inherit the prior ruled value rather than infer a new one.

## Analytic B — mechanism I would use

The cleanest mechanism is the packet's own indicator-first route:

**repair the BiasEngine flip state → export confirmed H4/H1/M15 outputs → consume them before promotion → preserve the existing S2/S3/E1/E2 path → implement any-age TP extraction separately from the 4000-bar snapshot → elect nearest by price from the existing unified race → apply the entry-open 1R gate once at admission.**

That keeps the repair causal rather than adding a second parallel intelligence layer, and it respects the explicit fix-not-replace scope.

### Final seat verdict

**DQ1 YES**
**DQ2 YES**
**DQ3 YES**
**DQ4 RULED**

This is a **design-round ruling only**. It does not authorize a build, tester run, commit, or live activation; the packet itself explicitly reserves those actions for the subsequent gated implementation stage.
## V306-UJIMPL-7 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V307-UJIMPL-8 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
## Council ruling

**DQ1R CONFIRM -** the B138-146 repair is correctly DEMOTED to cleanup-optional and OUT of the base surface, and the surviving DQ1 design stands: single existing FlowLogic/indicator path, confirmed H4/H1/M15 outputs selected through the existing export path, LTF_BIAS traced from `g_bufBias/currentBias`, same-pass consumption ordering, and probe-gated fail-closed behavior.

**DQ4R CONFIRM -** the base surface is correctly WITHOUT BiasEngine: FlowLogic fill/LTF producer regions, HTFEngine state/output/latch verification, the existing EA FlowLogic handle, guards/probes, historical walker, 1R admission gate, touch/retarget integration, cache, plus S1 pre-hash/S3 recount; B140/144 remain cleanup-optional and E1/E2 remain byte-identical.

DQ2 and DQ3 remain **CLEAR-carried** from v306 and are not reopened.

### Analytic A — defects / gaps / imprecisions

1. **DQ1's “confirmed selection via C10667” is not yet literally true on the current code.** The FlowLogic input `inUseConfirmedHTFOnly` is `false`, the EA's `C10667` call also passes `false`, and `F1195-1200` therefore selects `outBias/outBias/outBias` rather than the confirmed outputs. The design is confirmable, but the implementation packet must explicitly resolve how that existing path is switched to confirmed output.

2. **The source-row timing contract needs to be stated more mechanically.** The packet correctly requires the closed M15 bar eligible at the 09:45 boundary and distinguishes source-row time from stale/unready reads, but “C10667 confirmed selection” alone does not prove which M15 source row is represented at the M5 buffer index consumed by the EA. The implementation grade must prove source TF, source shift, source open/close, previous/current direction, and readiness exactly as the packet already requires.

3. **There is a direct current-code mismatch on the R-at-open rule.** The packet pins the TP race to the would-be entry/open price, explicitly not the confirmation close, but the present S2POLL call sets `currentPrice = iClose(..., barShift)` before `ComputeNearestTpTarget`. That must be resolved in the implementation packet; otherwise the nearest target can be elected from the wrong reference.

4. **The any-age historical-pool solution is specified but not demonstrated by the companion code excerpt.** The existing `FindNearestSwing()` remains a `+500` M5-bar walk, explicitly known to miss the April-30 target. The new `Bars(_Symbol, PERIOD_CURRENT)` extraction/walker is therefore a required future implementation surface, not something demonstrated by the current `FindNearestSwing` code.

5. **Touch-retarget is a design requirement, not yet a demonstrated mechanism in this page.** The packet defines the event as touching the closed NY-AM H/L and requires re-election from the closed-session pool, while the code excerpts shown here demonstrate “touch” primarily as confirmation-candle geometry. Acceptance therefore needs an explicit post-entry event/re-election proof rather than relying on the existing `C_TOUCH` confirmation term.

6. **The current confirmation evidence and the 15m-bias evidence must not be conflated.** The packet correctly separates the 5m confirmation at 09:40 from the 15m flip becoming eligible at the 09:45 boundary, but the implementation proof needs to preserve those as two distinct evidence timestamps. A single “confirm=1” row cannot establish the 15m source transition by itself.

7. **The current LTF producer census is useful but does not itself prove ordering.** `g_bufBias` is written from `currentBias`, while `currentBias` can be changed in the Bias decision block. The packet correctly calls for an ordering trace; the implementation grade must show that the exported/read value corresponds to the intended state on the same evaluation pass rather than merely proving both writer locations exist.

8. **The B-demotion rationale is now internally coherent.** `wasBiasFlip` is reset, is writable at the DecisionBlock, but the `B138-146` assignments are self-assignments and therefore do not constitute an externally consumed flip mechanism. That means removing/demoting them is logically separate from fixing the actual LTF/HTF producer path.

### Analytic B — better mechanism

The cleanest DQ1 mechanism is **one existing FlowLogic handle, no second handle and no EA-side mirrored bias algorithm**:

* Fix/verify the HTF engine's confirmed-state production inside `SRJ_HTFEngine` (`H562-H577`), including the confirmation latch/state transition.
* Make the existing FlowLogic export path at `F1195-F1200` the sole authoritative HTF export used for this purpose.
* Explicitly make the EA's existing `C10667` path consume those confirmed outputs rather than the currently-selected live outputs; this should be a deliberate one-site change, not a new indicator copy.
* Add a diagnostic tuple at that same export/read boundary containing source TF, source bar time, previous/current direction, confirmed/live selection, and readiness. That directly satisfies the packet's stale-vs-unaligned distinction without adding a second algorithm.
* Keep `CheckLtfAlign()` at `C2270-C2276` as the downstream gate, because it already consumes the existing `FL_BUF_LTF_BIAS`; the new proof should establish that this buffer contains the correctly ordered `currentBias` value rather than replacing the gate.

For DQ2, the better mechanism remains the packet's own **buffer-extraction-first historical pool**, not enlarging `FindNearestSwing(+500)`: the extraction must cover the authoritative history first, then the existing nearest-in-price comparator can remain intact.

**Net:** both confirm questions are **CLEAR**, with the two material implementation points that must not be lost in the next packet being **confirmed-output activation/row identity** and **entry-open rather than confirmation-close TP election**. The relay itself correctly remains design-only: no build, run, spend, or live activation is authorized here.
## V307-UJIMPL-8 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V308-UJIMPL-9 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
### Council verdict

**IQ1 OBJECT** — the edit set is materially specified, but two parts are not exact enough to support the stated verification contract.

**IQ2 OBJECT** — the acceptance battery contains a substantive attribution defect in A-EU-PRESERVE.

### IQ1 — exact edit-list review

1. **E1 — acceptable.**
   C10667 changes only `false` → `true`, matching `inUseConfirmedHTFOnly` at F252 and the confirmed/live selector at F1195-F1200.

2. **E2 — specified, but with one dependency that should be explicit.**
   The proposed read of `FL_BUF_HTF_LOW` is only the 15m confirmed feed because F251 fixes the third HTF to `PERIOD_M15`. The edit is therefore correct on the canonical configuration, but P018 should state that dependency explicitly. Otherwise changing the third HTF input would silently change what this guard means.

3. **E3 — same issue as E2.**
   P019 inherits the same implicit `FL_BUF_HTF_LOW == M15` assumption.

4. **E4 — insufficiently specified for the proof it is supposed to support.**
   P020 requires “H4/H1 confirmed” plus an LTF row, but the critical E1 change is the **third HTF / M15 confirmed output**. The shown E4 payload does not explicitly require printing that value/source. The code-side mapping is H4/H1/M15 at F1195-F1200, so the probe should expose all three selected confirmed votes, not merely H4/H1 plus LTF bias.
   **Failure:** P020, F1195-F1200.

5. **E5 — broadly coherent.**
   The proposed walker is compatible with the existing candidate mechanism at C2300-C2321 and the live session/PD candidate walk beginning C2354. The refresh placement above the SELHALT gate is also mechanically clear from C4995 onward.
   Minor imprecision: P021 does not give explicit cache invalidation/reset semantics, so stale cache state is not fully specified for repeated tester windows. That is a verification concern rather than a demonstrated defect.

6. **E6 — acceptable.**
   C7305 → `iOpen(...,0)` correctly aligns the 1R calculation with the next-bar fill reference under the existing once-per-new-bar cadence at C11483-C11492.

7. **E7 — acceptable in placement and intent.**
   C7334 is the right post-stop-memo/pre-admission location. The direction-aware condition must remain explicit: long requires `TP > entry` and `SL < entry`; short requires `TP < entry` and `SL > entry`. No absolute-distance normalization.

8. **E8 — intent is clear, but “unconditional print” is ambiguous.**
   P024 can mean either “print every managed-recompute pass” or “when the touch event occurs, print regardless of debug mode.” Those are materially different log contracts. The acceptance battery expects an event row, so the latter should be stated explicitly.
   **Failure/imprecision:** P024, C11095 onward.

9. **E9 — acceptable in placement.**
   The pre-latch location before C10216 is appropriate for the stated same-pass/delayed-fire protection. The guard must validate the current memo, not merely a stale nonzero numeric.

10. **E10 — under-anchored.**
    P026 says “near H562-577,” but H562-H577 are the HTF run/output routines, not an exact per-M15-close call site. Nothing shown proves that a print inserted there fires exactly once per M15 close during the probe window.
    **Failure:** P026, H562-H577.

**IQ1 verdict line:**
**IQ1 OBJECT — E4 does not explicitly expose the confirmed M15 vote that E1 changes, and E10 has no exact per-M15-close call-site anchor; E2/E3 also rely implicitly on F251 remaining M15.**

---

### IQ2 — acceptance review

The major defect is **A-EU-PRESERVE**.

P032 says every EU trade-set / REGIMECENSUS difference must be attributable to:

> “the confirmed switch (sole vote-character change) + entry-open reference change”

That is not sufficient for this edited tree.

The implementation changes additional live decision behavior:

* **E2/E3** add new LTF/15m alignment guards at C8655/C8795.
* **E5** changes the TP candidate population by adding the historical walker/cache.
* **E7** adds a new admission veto for sub-1R outcomes.
* **E8** changes post-entry target management/re-election.
* **E9** adds a fire-edge fail-closed condition.

Therefore an EU trade-set or population difference cannot, as written, be uniquely attributed to only E1 + E6. Even if the desired preservation comparison eventually shows zero differences, the **attribution rule itself is incomplete**. The preservation battery needs per-edit attribution or a narrowly defined pre-entry/regime census that isolates E1's vote-character effect.

There are two smaller acceptance imprecisions:

* **A-IMPL1/P029:** the probe evidence does not explicitly require the actual M15 confirmed vote, despite E1 changing the confirmed-vs-live HTF selection.
* **A-IMPL2/P030:** “UJTOUCH re-election” needs to distinguish the touch event from the subsequent changed winner/value, otherwise a touch print alone does not prove retargeting occurred.

**IQ2 verdict line:**
**IQ2 OBJECT — A-EU-PRESERVE cannot validly attribute all edited-tree EU differences only to E1 + E6 while E2/E3/E5/E7/E8/E9 also alter runtime behavior; A-IMPL1/A-IMPL2 also need the M15-vote and retarget-result evidence made explicit.**

### Analytic A — all defects/gaps/imprecisions

| Location               | Issue                                                                                                                                                                               |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| P008 vs P017-P019      | “E1/E2 CLEAR carried” uses the same labels as implementation E1/E2, creating avoidable namespace ambiguity between design edits and IMPL-1 edits.                                   |
| P018, F251/F1195-F1200 | `FL_BUF_HTF_LOW` means M15 only because HTF slot 3 is M15. That dependency is implicit, not contractual.                                                                            |
| P019, F251/F1195-F1200 | Same dependency for E3.                                                                                                                                                             |
| P020, F1195-F1200      | Probe payload does not explicitly expose the third/15m confirmed value even though E1's purpose is to switch the three HTF feeds to confirmed outputs.                              |
| P021                   | Cache reset/invalidation semantics are not explicit.                                                                                                                                |
| P024, C11095+          | “unconditional print” is ambiguous between unconditional-on-touch and unconditional-on-pass.                                                                                        |
| P026, H562-F577        | “near” is not an exact insertion/call-site anchor and does not itself establish per-M15-close cadence.                                                                              |
| P029                   | “E1/E2-unchanged diffs” is not precise enough to distinguish unchanged ruled regions from the new implementation E1/E2 inserts.                                                     |
| P030                   | A touch event alone does not prove the target actually re-elected to a different/updated winner/value.                                                                              |
| P032                   | **Material defect:** attribution excludes E2/E3/E5/E7/E8/E9, all of which can alter the EU runtime result.                                                                          |
| P031                   | Structural-flip contingency is described procedurally, but no exact required finding/token/log predicate is specified.                                                              |
| P033                   | DIV dependency says “adverse DIV,” but the exact emitted value/criterion to classify a pass as ungradeable is not stated in the acceptance text; code semantics are at C8832-C8848. |

### Analytic B — better mechanisms

**For E4:** make the probe authoritative by reading and printing the actual exported HTF trio at the probe bar:

* `FL_BUF_HTF_HIGH` = H4 confirmed
* `FL_BUF_HTF_MID` = H1 confirmed
* `FL_BUF_HTF_LOW` = M15 confirmed

alongside the source-TF labels. This directly verifies F1195-F1200 and removes the ambiguity between “LTF bias” and the 15m confirmed HTF vote.

**For E8:** emit two distinct records: one `UJTOUCH` record containing the touched NY-AM level and touch type, then a second re-election record containing `oldTP`, `newTP`, winner identity, and the closed-session source. That makes retargeting independently gradeable rather than inferred from a touch print.

**For A-EU-PRESERVE:** retain the whole edited-tree comparison, but decompose attribution by mechanism: E1 vote-source change, E2/E3 alignment disposition, E5 target-pool expansion, E7 1R rejection, E8 management-only effect, E9 fire-edge fail-closed. That is the only structure that can distinguish a real regression from an intentional behavioral change.

**Net:** the underlying implementation design is substantially coherent, but **this issue packet is not yet acceptance-tight enough to carry either IQ1 or IQ2 as CONFIRM.** No build/run clearance follows from this ruling.
## V308-UJIMPL-9 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V309-UJIMPL-10 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
## Council ruling

**IQ1v2 OBJECT - the amended edit list is not yet build-safe because IE7 is labeled a 1R gate but its specified predicate does not actually enforce R≥1.00; IE4/IE10B also lack a concrete same-bar-time join mechanism, and IE9 leaves current-pass memo provenance underspecified.**

**IQ2v2 OBJECT - the amended acceptance is not yet sufficient because A-IMPL2 does not require the arithmetic proof of R≥1.00 or an explicit winner/source-age proof for the any-age nearest election; A-EU-PRESERVE also needs a mechanically defined attribution record, and the referenced “single discipline sentence” is not actually stated in the acceptance block.**

### Defects / gaps

| Location                         | Finding                                                                                                                                                                                                                                                                                                                                                                                                         |
| -------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **P023 / C7305–C7313**           | **Blocking defect:** IE7 is not an actual 1R test. `TP > entry && SL < entry` only proves correct-side geometry. It admits, for example, entry 160.00 / SL 159.90 / TP 160.05, which is only 0.5R. The required predicate is reward ≥ risk: LONG `(tp-entry) >= (entry-sl)`; SHORT `(entry-tp) >= (sl-entry)`, after positive-risk and side checks.                                                             |
| **P023**                         | The packet calls this `ABORT_SUB_1R`, but no explicit equality/ratio/tolerance rule is stated. The exact arithmetic should be fixed before build.                                                                                                                                                                                                                                                               |
| **P020 / P026–P027 / H562–H577** | **Join-key gap:** IE4 says EA/engine rows join on the same bar-time, but `SRJ_HTF_GetOutputs()` at H570–H577 receives no bar-time. `SRJ_HTF_RunAll()` has `chartTime` at H562–H563, but IE10B does not state how that value reaches the print. Without an explicit timestamp source, the two print classes cannot be mechanically joined as claimed.                                                            |
| **P025 / C10214–C10217**         | **Scope/provenance gap:** IE9 says “CURRENT-pass tpTarget valid AND slRef valid,” but the shown selection-side values at C7305–C7314 are local variables. The packet does not identify the exact persistent/current-pass fields that C10216 can read, nor how they are cleared each pass. A stale memo could therefore satisfy the guard unless the implementation defines the authoritative pass-state fields. |
| **P024 / C11095–C11118**         | **Touch predicate under-specified:** “closed-NY-AM level crossing” is named, but the exact closure condition and exact high/low source are not. The implementation must distinguish a closed NY-AM level from the still-live NY-AM level, and define whether one level can fire once per trade/session or repeatedly on overlapping bars.                                                                       |
| **P021 / C4992–C5004**           | Refresh-before-SELHALT is defensible, but the contract is incomplete: the refresh routine must explicitly fail closed when `g_hFlow`/history is unavailable and must not leave a partially populated historical pool that can later be mistaken for complete coverage.                                                                                                                                          |
| **P021**                         | Cache semantics are only named (“invalidation + preload”). The exact invalidation key, coverage high-water mark, rollover trigger, and behavior after late history backfill are not stated. For “any age,” those details matter.                                                                                                                                                                                |
| **P031**                         | **Acceptance gap:** “April-30 in pool” proves presence/coverage, not necessarily that April-30 participated in the winning nearest election. The proof should expose winner source, winner day key/age, winner value, and preferably admitted-candidate count/list.                                                                                                                                             |
| **P031 / P033**                  | A-IMPL2 says “1R admission,” but there is no explicit required evidence tuple such as `entry / SL / TP / risk / reward / R`. Given the current IE7 defect, this acceptance could pass without proving the actual 1R floor.                                                                                                                                                                                      |
| **P033**                         | Per-edit EU attribution is requested, but a single base-vs-edited diff does not by itself prove causality when edits interact. The grade should require an explicit edit-attribution field/bitmask or a deterministic classification showing which edited branch(es) occurred on every changed row.                                                                                                             |
| **P029–P035**                    | IQ2 explicitly asks for a “single discipline sentence,” but the acceptance block contains no clearly identifiable standalone sentence defining that discipline. This is a textual omission rather than a strategy defect, but the packet should state it exactly.                                                                                                                                               |

### Better mechanisms

**IE7 — make the 1R gate mathematically explicit.** After `SlRefMemo` succeeds, use the entry-open price from IE6 and compute:

* LONG: `risk = entry - sl`, `reward = tp - entry`
* SHORT: `risk = sl - entry`, `reward = entry - tp`

Require `risk > 0`, `reward > 0`, and `reward >= risk`. Print all four values plus `R = reward/risk` before `ABORT_SUB_1R`. This directly enforces the user's 1R floor rather than merely checking side orientation.

**IE10A/IE10B — carry one authoritative debug timestamp.** The cleanest low-surface mechanism is to set a file-scope debug-only timestamp from `chartTime` in `SRJ_HTF_RunAll()` (H562–H567), then have IE10B print that exact timestamp at H570–H577. IE4 prints the same timestamp from the EA probe. That preserves the current function signature and makes the join deterministic.

**IE9 — persist the current-pass election state explicitly.** The values used by admission should be stored in the working-set/pass memo immediately after election, then IE9 should validate those exact stored fields immediately before C10216. Do not rely on a local `tpTarget`/`slRef` from C7305 onward. Also clear the pass-valid flags at the beginning of each evaluation so stale values cannot satisfy the guard.

**IE8 — define a one-shot closed-session touch event.** Record the closed NY-AM session's actual close/availability timestamp and direction-relevant H/L. On each closed-bar management pass, detect the first valid price-or-wick touch against that closed level, stamp it once, print `UJTOUCH`, then immediately re-elect using the historical/current unified pool. This makes “closed” and “touch” mechanically auditable.

**IE5 — make historical records self-describing.** Each cached level should carry at least `dayKey`, session identifier, H/L side, value, and source/closure time. The refresh should maintain a coverage watermark and explicitly report requested-start versus achieved-start. A shortfall then has an unambiguous fail-closed meaning.

### What I would change in acceptance

For **A-IMPL2**, require one joined proof row containing:

`entryPrice | slRef | tpTarget | risk | reward | R | winnerSource | winnerDayKey | winnerAge | poolCoverageStart | UJTOUCH`

with `R >= 1.0` explicitly evaluated from the entry-open reference.

For **A-EU-PRESERVE**, require every changed EU row to carry a deterministic attribution set such as:

`IE1 | IE2 | IE3 | IE6 | IE7 | IE9 | IE5 | IE8`

with “designed difference” versus “unattributed regression” mechanically distinguished. That is substantially stronger than post-hoc narrative attribution.

The most important correction is **IE7**: as currently written, the packet does **not** implement the stated 1R floor. That alone is sufficient to keep **IQ1v2 and the dependent acceptance at OBJECT**.
## V309-UJIMPL-10 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
## V310-UJIMPL-11 OPEN LUNA (verbatim open; filed whole 1x this turn, novel inbound)
Luna:
## Council ruling — v310-UJIMPL-11

**IQ1v3 OBJECT — the edit list is not yet mechanically closed.**

The main defects are:

1. **IE9 has no exact clear anchor.** P026 says the pass-memo fields are “cleared at each evaluation start,” but the only exact edit anchor supplied is immediately before `g_mtrade` at **EA 10215–10216**. The actual evaluation-start clear is not assigned an anchor. The current evaluation entry is **EA 11490–11491**. This leaves lifecycle behavior under-specified.

2. **IE9 has no exact write anchor for the election memo.** P026 says the fields are “written at election,” but does not identify the exact election site/path that performs the write. With multiple TP/SL/state routes, “at election” is descriptive rather than mechanically bounded.

3. **IE8 lacks an exact once-per-trade state lifecycle.** P025 specifies one-shot behavior but does not name the latch fields or the reset anchor that makes the touch available again for the next managed trade. `MtReset()` at **EA 10215** is the obvious lifecycle anchor, but the packet does not actually bind the new touch fields to that reset.

4. **IE8's “first valid price-or-wick touch” is temporally ambiguous.** P025 says the event belongs to the **closed NY-AM record**, but it does not explicitly state whether a touch on the bar that closes the NY-AM session is eligible, nor the ordering of “session becomes closed” versus “touch is evaluated.”

5. **IE5 self-description is conceptually specified but not mechanically defined.** P021 requires `dayKey + session id + H/L side + value + source/closure time`, yet gives no exact derivation rule for `source/closure time` from the historical buffer walk. This matters because the candidate pool is intended to distinguish source day/session from the day on which the copied value is observed.

6. **The historical cache lifecycle is only partially anchored.** P021 says “re-init at run start” and “rebuild on rollover,” but provides the explicit refresh anchor only at **EA 4992–4994**. The exact run-start initialization point for the new cache state is not specified.

Because those are implementation-level lifecycle gaps, I would not sign IQ1v3 as `CONFIRM`.

---

**IQ2v3 OBJECT — the amended acceptance is still not mechanically closed.**

The strongest defects are:

1. **The “bitmask attribution” is not actually defined as a bitmask.** P034 names seven causes:
   `IE1 | IE2/IE3 | IE6 | IE7 | IE9 | IE5 | IE8`
   but assigns no bit positions, integer encoding, zero/default semantics, or exact print/storage field. P034 calls it an “attribution set,” while IQ2v3 explicitly calls for a **bitmask**. That is still an object.

2. **A-IMPL2 requires a future management event inside an admission proof row.** P032 requires one joined row **per admission** containing:
   `entryPrice | slRef | tpTarget | risk | reward | R | winnerSource | winnerDayKey | winnerAge | poolCoverageStart | UJTOUCH pair`.

   But P025 makes `UJTOUCH` a later, management-time event that fires only on the first valid touch of the closed NY-AM target. The packet never states how that later record is joined back into the earlier admission row, nor what value is emitted when no touch occurs. The “join key” in P020/P026 does not by itself solve that temporal join.

3. **The finding predicate for `UJ-LTFPATH-DEAD` is not literal enough.** P031 says it comes “from the probe LTF row,” but never defines the exact boolean condition that fires the finding.

4. **The finding predicate for `UJ-FLIPPATH-DEAD` is likewise not literal enough.** P033 says “LTF row named in the contingency” but does not define the exact state/row combination that converts a halt into that finding.

5. **The acceptance does not state the null/no-verdict handling for DIV.** P035 specifies the latest nonzero opposing verdict as a route-ungradeable condition, but does not explicitly define the no-nonzero-verdict case. The code at **EA 8832–8848** clearly has a possible “no nonzero verdict found” state, so the acceptance should close that case explicitly.

6. **A-IMPL2's join is underspecified even apart from UJTOUCH.** P020 says the join is a file-scope timestamp from `chartTime`; P032 asks for a joined proof row, but does not require every participating record to print the same named key. The field identity is described, not contractually fixed.

Therefore IQ2v3 should also remain `OBJECT`.

---

## Analytic ask A — every material defect/gap/imprecision

| Ref                      | Defect                                                                                                                                    |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------- |
| **P020 / P030–P032**     | Join key described, but not made an explicit common record field contract across all rows.                                                |
| **P021**                 | Historical record provenance fields are named, but derivation of source day/closure timestamp from the historical buffers is unspecified. |
| **P021**                 | Cache “run start” initialization lacks an exact anchor.                                                                                   |
| **P025**                 | One-shot touch has no named latch/reset contract.                                                                                         |
| **P025**                 | “Closed-session” versus “touch on close bar” event ordering is ambiguous.                                                                 |
| **P025 / P032**          | Future `UJTOUCH` event is required inside an admission-time joined proof row without a defined later-join/reconciliation mechanism.       |
| **P026 / C11490–C11491** | Memo-clear lifecycle is asserted but not anchored to evaluation start.                                                                    |
| **P026**                 | Memo-write lifecycle has no exact election write anchor.                                                                                  |
| **P030–P033**            | `UJ-LTFPATH-DEAD` finding predicate is named but not boolean/mechanical.                                                                  |
| **P033**                 | `UJ-FLIPPATH-DEAD` finding predicate is named but not boolean/mechanical.                                                                 |
| **P034**                 | “Attribution set” is not an actual bitmask specification.                                                                                 |
| **P034**                 | No exact mapping from changed row → attribution integer → unattributed=0 rule.                                                            |
| **P035 / C8832–C8848**   | No explicit acceptance semantics for “no nonzero DIV verdict exists.”                                                                     |
| **P032**                 | `UJTOUCH pair` is not defined as a field schema or optional/mandatory state.                                                              |
| **P027**                 | IE10A says M15-new-bar gating but does not define initial-state behavior for the gate.                                                    |
| **P028**                 | IE10B identifies timestamp/output fields but does not state reset/overwrite semantics for the debug latch.                                |

The existing code regions also expose why the lifecycle anchors matter: the actual evaluation sequence is **LoadWorkingSet → EvaluateClosedBar** at **EA 11490–11491**, while the managed-trade latch is at **EA 10215–10217**. The packet needs to bind those states explicitly rather than describe them only in prose.

---

## Analytic ask B — better mechanisms

**Memo lifecycle:** clear the new memo fields at the actual evaluation boundary immediately before `EvaluateClosedBar`, i.e. around **EA 11490–11491**, and write them at the single successful election point after the TP/SL/1R predicates have all passed. That makes “current-pass” mathematically literal instead of inferred from the fire site.

**Touch lifecycle:** make the touch state part of `SManagedTrade` and reset it through the existing `MtReset()` path at **EA 10215**. Store at minimum `touchDone`, `touchLevel`, `touchType`, and `touchBarTime`. The event predicate should require the source session record to be closed before evaluating touch eligibility; that resolves the P025 timing ambiguity.

**Admission/touch joining:** retain the required `chartTime` join key, but give the managed event the same admission key plus a trade-local sequence/identity. The admission record can then state `UJTOUCH=NONE` initially, while the later event amends the joined record. That is cleaner than requiring a future event to exist inside the original admission row.

**Attribution bitmask:** make the seven P034 causes literal bits, for example:
`bit0=IE1, bit1=IE2/IE3, bit2=IE6, bit3=IE7, bit4=IE9, bit5=IE5/IE5b, bit6=IE8`, with `0=unattributed`. Print the integer mask on every changed EU row. This directly closes the P034 ambiguity.

**Finding predicates:** define them as explicit state assertions at the two requested passes. For example, `UJ-LTFPATH-DEAD` should require the probe to show the relevant LTF value is present/expected but the guarded route remains blocked; `UJ-FLIPPATH-DEAD` should require the expected repaired HTF/LTF/regime prerequisites at the 14:40:22 pass while the required state promotion is absent. The important point is that each finding must be triggered by a stated row combination, not merely by “the probe failed.”

### Final two verdict lines

**IQ1v3 OBJECT — memo clear/write lifecycle and one-shot-touch reset/ordering remain mechanically unanchored, with historical record provenance also under-specified.**

**IQ2v3 OBJECT — attribution is not yet a defined bitmask, and A-IMPL2/finding predicates do not fully specify the future-touch join and fail-to-finding conditions.**
## V310-UJIMPL-11 END LUNA (verbatim close; filed whole 1x this turn, novel inbound)
