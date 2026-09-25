# RELAY v284 — PACKET_P-USDJPY-2 v4 (amend-with-delta; tripwire fix, proof narrowed, SKIP print)



Project brief (standing - read first):

- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.

- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.

- History: packet P-USDJPY-2 v3 ruled NO-CLEAR by three seats (tripwire bug genuine; v9-header 105/+78 found by builder during analysis with no seat citing it in V283 - recorded here, not attributed; v10/v11 headers correct; tallied, filed whole under V283 headers); this v4 folds every verdict below. Rounds end in amend or clear, never silent drift.

- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.



Change (one plain sentence per question): E6a proof narrowed to block/no-block truth value with raw -1 fields plus an HTF SKIP print. E6b tripwire bounds explicit with abort, evidence, and scope unchanged.



File / function / lines: Experts\SRJ_FlowNexus_EA.mq5, S2 block of EvaluateClosedBar, EA 8086-8112 (27 lines, v7-built E4b branch, the edit site). Function SrjOrderEmit flip predicate EA 5117-5146 (30 lines). LTF invariant range EA 7119-7130 (12 lines). Abort defines EA 302-324 (23 lines). Task-76 comment EA 7099-7102 (4 lines). LogAbort EA 1728-1733 (6 lines, abort rows print unconditionally).

Source digest: CD95241F / 637583 bytes / 11552 lines (built tree, no build since v7; STAGE-1 must re-hash or diagnose a successor).

Packet: 01_TASKS\PACKET_P-USDJPY-2v4.md F993D252 / 19188 bytes / 194 lines (E4b old 27 / new 86 / NET +59; defines old 2 / new 4 / +2; comment old 4 / new 5 / +1; total +62, post 11614; acceptance B1-B8 plus sentinel/dynamic/pairing clauses).

Segment: 06_HANDOFFS\RECON64-V7-USDJPY_JOURNAL.log C03D4774 / 3879744 bytes / 21450 lines (v7 run, DONE=PASSED).

Priors (labeled, never as anyone's words): relay v283 (06_HANDOFFS\BUILDER_RELAY_COUNCIL_v283-USDJPY-GUARDS3.md E6D42D34, tallied NO-CLEAR); packet v10 (01_TASKS\PACKET_P-USDJPY-2v3.md 25D60185); V283 grade (06_HANDOFFS\BUILDER_RESULT_V283-GRADE.md 5B9D05A2); his retest-invalidation ruling (06_HANDOFFS\BUILDER_FINDING_RETEST-INVALIDATION-V1.md 8EF27EF8).



Q1 (E6a amended): gate on standing opposition (antiNow>=2; flip print-only) with GoAbort(ABORT_LTF_MISALIGN); proof narrowed to identical block/no-block truth value on all inputs (readable: same decision; unreadable: both no-kill with -1 carried adjudicably in raw antiNow/antiPrev fields, never in the gate bool); HTF-unreadable prints E4B_GUARD_SKIP reason=HTF; opposition-kill wording with two emitters; shared-helper refactor stays DEFERRED (new function surface, needs scope word). Does the narrowed proof plus SKIP print satisfy Q1 without the shared helper? Cite lines.

Q2 (E6b amended): behind term deleted; plain dir-matched cross (open inclusive, close strict, stated); seed exact=true with anchor-bar-time>0; SEEDORDER tripwire with explicit both bounds (equal falls silent); breaking-bar + raw anti/seed/walked/skipped fields; guards inside confirm-true; abort with ABORT_S54_POIBREAK; E4b-only scope retained. Is the predicate plus tripwire plus raw fields plus abort code plus scope a correct S5.4 implementation for this round? Cite lines.



Answer form: plain yes / no / discrepancy, with line numbers, per question (a NO on one never sinks the other).

Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.



Reviewer demands from v283, quoted complete with rulings (nothing built on unruled demands; sources: BUILDER_VERDICTS_LUNA.md, BUILDER_VERDICTS_SONNET.md, BUILDER_VERDICTS_GLM.md under V283 headers):
- LUNA-Q1 (filed V283 LUNA verdict):
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
RULED - proof narrowed in v11 to block/no-block truth value; shared helper DEFERRED for scope; re-asked as v284 Q1.
- LUNA-Q2 (filed V283 LUNA verdict):
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
RULED ADOPTED as explicit both-bounds tripwire (equal falls silent).
- LUNA-A1 (filed V283 LUNA verdict):
### 1. Q1 proof overclaims equivalence

**Lines:** P013, P073-P092, C5117-C5141.

The proof says "same outputs on all inputs," but the unreadable state is `false` in `e6a_block` and `-1` in `oOpp`.

**Correct formulation:** same **block/no-block truth value**, not same variable output/state domain.

---
RULED - proof narrowed in v11.
- LUNA-A2 (filed V283 LUNA verdict):
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
RULED ADOPTED as explicit tripwire.
- LUNA-A3 (filed V283 LUNA verdict):
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
RULED ADOPTED as walked/skipped counters plus HTF SKIP print.
- LUNA-A4 (filed V283 LUNA verdict):
### 4. Epoch `bbar` is only "no recorded break," not intrinsically "clean"

**Lines:** P125, P182.

`e6b_bt` remains zero whenever no break is recorded, including anomaly paths. Therefore:

`1970.01.01 00:00`

does not by itself prove a clean walk.

The packet does preserve `seed`, `walked`, and `skipped`, so the row is adjudicable; the imprecision is specifically the prose:

> "epoch bbar sentinel read as clean"

That should really mean **"no breaking bar was recorded"**, with cleanliness established from the accompanying status fields.

---
RULED ADOPTED as epoch-sentinel clause.
- LUNA-A5 (filed V283 LUNA verdict):
### 5. B7 still contains non-operational "genuine" language

**Lines:** P179.

The packet says:

> "genuine flip/break"

and

> "unattributable kill" / "no genuine cause"

but never supplies a machine-level predicate for those terms.

The added evidence fields help substantially, but they do not themselves define exactly when a cause is "genuine." This remains a grader-interpretation seam.

---
RULED ADOPTED as positive field predicate plus mismatch rule.
- LUNA-A6 (filed V283 LUNA verdict):
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
RULED - renamed opposition-kill / POI-break.
- LUNA-A7 (filed V283 LUNA verdict):
### 7. "No counter touches" conflicts literally with adding two diagnostic counters

**Lines:** P005, P096.

P005 says:

> "No counter touches."

The edit introduces:

`e6b_walked` and `e6b_skipped`

at P096.

This is probably intended to mean **no existing/global strategy counters are touched**, but the packet should say that explicitly. Otherwise it is internally inconsistent.

---
RULED - S1 print census carries SKIP reasons and S54 define.
- LUNA-A8 (filed V283 LUNA verdict):
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
RULED - noted gap, no action (single anti counter suffices for the gate).
- LUNA-A9 (filed V283 LUNA verdict):
### 9. POI skipped count conflates distinct failure classes

**Lines:** P111-P114.

The same `e6b_skipped++` is used for:

* POI read failure / `EMPTY_VALUE`
* `iOpen()==0`
* `iClose()==0`

So `skipped=1` does not say what failed.

Again, this is observability rather than a settled behavioral-rule defect.

---
RULED - noted (walked/skipped plus raw fields mitigate; no per-class split in refinement).
- LUNA-A10 (filed V283 LUNA verdict):
### 10. "Behind term deleted" is not independently demonstrable from the pasted old/new pair

**Lines:** P031-P060 versus P061-P143.

The old E4b block shown on the page contains no visible "behind" term. Therefore the page itself does not provide a before/after diff proving that a prior E6b "behind" condition was removed.

The packet can legitimately rely on STAGE-1 disk diff for that fact, but it is a **page-evidence gap**, not a conclusion that the edit is wrong.

---
RULED - STAGE-1 disk diff proves the v9 to v10 drop on record.
- LUNA-A11 (filed V283 LUNA verdict):
### 11. S5.4 is referenced rather than reproduced

**Lines:** P093, P188.

The packet paraphrases the S5.4 rule but does not include the authoritative S5.4 text itself. That leaves some semantic details dependent on the cited prior ruling/finding rather than independently checkable on this page.

This is exactly the limitation already identified in the v282 material, so I would classify it as a **documentation/evidence gap**, not a new behavioral defect.

---
RULED - noted (ruled by paraphrase plus finding, per verification split).
- LUNA-A12 (filed V283 LUNA verdict):
### 12. The "two emitters separable by ABORT-row state" assertion is not fully demonstrated here

**Lines:** P163, C1728-C1733.

The common logger prints:

`reason`, `state`, `poi`, `dir`

but not an explicit emitter identifier.

The amended comment says the two `ABORT_LTF_MISALIGN` emitters are separable by state. That may be true in the full EA, but the second emitter is not reproduced in this packet, so the separation is not independently proven on-page.

---
RULED - ABORT-row state separation plus B8 post-kill silence window.
- LUNA-A13 (filed V283 LUNA verdict):
### 13. Abort evidence is dependent on a preceding GUARD row

**Lines:** P124-P127, C1728-C1733, P179.

The abort line itself contains no `opposed`, `pobreak`, `antiNow`, `seedShift`, or break-bar data. Those live in the preceding `E4B_GUARD` row.

The packet knows this and explicitly says to use GUARD-row pairing, so it is not a logic error. It is nevertheless a **join dependency** in the grading protocol and makes the attribution more fragile than an abort row carrying its own cause fields.

---
RULED - GUARD-pairing procedure documented (abort rows never read alone).
- LUNA-A14 (filed V283 LUNA verdict):
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
RULED - run-grade property tested by B8 window.
- LUNA-A15 (filed V283 LUNA verdict):
### 15. The packet's Q1 claim should distinguish value equality from predicate equivalence

**Lines:** P013, P017, P092, C5141.

There are really two claims:

1. `e6a_block` and `oOpp` select the same bars for blocking.
2. `e6a_block` and `oOpp` are the same-valued representation.

**(1) is true. (2) is false.**

That distinction is the cleanest way to close the Q1 structural issue without requiring a helper this round.

---
RULED - proof narrowed as stated.
- LUNA-B1 (filed V283 LUNA verdict):
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
RULED DEFERRED (new function surface, needs scope word).
- LUNA-B2 (filed V283 LUNA verdict):
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
RULED ADOPTED as explicit tripwire.
- LUNA-B3 (filed V283 LUNA verdict):
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
RULED ADOPTED as counters plus SKIP prints.
- LUNA-B4 (filed V283 LUNA verdict):
### 4. Tighten the sentinel wording

**Touch:** P175/P182.

Define:

* `bbar=epoch` = no break recorded
* `skipped=0` + valid seed/order + readable walk = clean walk evidence

rather than equating the epoch sentinel itself with "clean."

---
RULED ADOPTED as epoch-sentinel clause.
- LUNA-B5 (filed V283 LUNA verdict):
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
RULED - renamed opposition-kill / POI-break.
- LUNA-Bottom (filed V283 LUNA verdict):
## Bottom line

**Q1: discrepancy.** The adopted **blocking predicate** is extensionally equivalent to ORDER, but the packet's stronger claim of identical outputs is false because unreadable HTF state is `false` in `e6a_block` versus `-1` in `oOpp` (P073-P092 vs C5141).

**Q2: no.** The implementation has the required E6b structure, but P119-P122 incorrectly fires `SEEDORDER` for `seedShift == barShift`, despite P019 explicitly requiring equality to remain silent.

The most important additional acceptance defect is B3's `walked>=1` criterion: P109 counts attempts before the read, so it does not prove that any POI evidence was actually readable.
RULED - tally reference (halted on Q1-structural + Q2-tripwire; fold v11).
- SONNET-Q1 (filed V283 SONNET verdict):
## Q1 (E6a amended) — **DISCREPANCY**

The equivalence claim is correct on the part that matters for Luna's original concern (the read/shift/formula/convention are byte-for-byte structurally identical), but the claim "same outputs on all inputs" is overstated once you look at codomain, not just formula.

- `e6a_antiNow` inits to `-1` (P073), same pattern as `oAntiNow` (C5119).
- Both accumulate identically from `ReadFlow(HTF_HIGH/MID/LOW, ..., barShift)` (P076‑082 vs C5120‑5125) and `barShift+1` (P084‑090 vs C5127‑5133). This part of the proof holds — the computation of `antiNow`/`antiPrev` is genuinely extensionally identical.
- Where it breaks: `e6a_block = (e6a_antiNow >= 2)` (P092) is a **two-state boolean**. `oOpp = (oAntiNow<0) ? -1 : ((oAntiNow>=2) ? 1 : 0)` (C5141) is a **three-state int**. On readable data (`antiNow` ∈ {0,1,2,3}) they do agree: `e6a_block == (oOpp==1)`. But on unreadable data (`antiNow == -1`), `oOpp` reports `-1` (a distinct, observable third state) while `e6a_block` collapses to `false` — indistinguishable in that variable from a genuine 0/1 non-opposed read. They are not "the same output on all inputs"; they're the same output only on the readable subset, which is exactly what Luna's original wording said ("same on readable data") before the v283 proof over-claimed "all inputs."

In practice this is harmless because `e6a_antiNow` itself (not `e6a_block`) is separately printed raw at P125 (`anti=%d/%d`), so the unreadable case remains adjudicable at the row level — the Luna-A3 fix covers what the Q1 over-claim doesn't. But the proof text itself should say "identical on readable inputs; e6a_block intentionally discards the -1 state that oOpp preserves, mitigated by the raw antiNow/antiPrev print" rather than "same outputs on all inputs."

Without the shared helper, wording narrowed as above would satisfy Q1. As currently worded (P013), it overclaims.
RULED - proof narrowed in v11; helper deferred; re-asked as v284 Q1.
- SONNET-Q2 (filed V283 SONNET verdict):
## Q2 (E6b amended) — **DISCREPANCY**

Predicate, raw fields, abort wiring, and scope are all correctly implemented. The tripwire has a boundary bug that contradicts the ruling's own stated intent.

**What's correct:**
- Seed resolution: `if(g_anchorBarTime > 0) e6b_seedShift = iBarShift(_Symbol, PERIOD_CURRENT, g_anchorBarTime, true)` (P098‑099) — exact match (`true`), matches "seed exact=true with anchor-bar-time>0."
- Dir-matched cross: `e6b_hit` (P115) — LONG: `o>=v && c<v`; SHORT: `o<=v && c>v`. No "behind" term anywhere in this block, consistent with the deletion claim (and with Sonnet Gap-2's point that no prior E6b code exists on this page to diff against — this is judged as new code, not a before/after).
- Walked/skipped counters: `e6b_walked++` every iteration (P109); `e6b_skipped++` on bad POI read or bad OHLC (P111, P114) — matches Sonnet-B2/GLM-B1.
- Raw fields in print: `anti=%d/%d ... seed=%d walked=%d skipped=%d bbar=... bpx=.../.../...` (P125) — all present.
- Abort: `if(e6b_broken) { GoAbort(ABORT_S54_POIBREAK, g_state); return; }` (P127), define at P152. Correct code/name pairing.
- Scope: entire edit stays inside the `ST_S2_LTF_ALIGN` / confirm-true body; no S3/S4 touch visible in the diff.

**The bug:** P019 states "SEEDORDER anomaly (0<=seed<confirm); equal shifts silent." The code is:
```
P100: if(e6b_seedShift < 0)              → SKIP reason=SEED
P105: else if(e6b_seedShift > barShift)  → walk
P119: else if(e6b_seedShift >= 0)        → SKIP reason=SEEDORDER
```
Branch 3's condition is just `>= 0`. Since branch 1 already excludes `<0` and branch 2 already excludes `>barShift`, branch 3 actually catches **every remaining case**, i.e. `0 <= seedShift <= barShift` — which includes `seedShift == barShift` (the equal case). That means equal-shift now *also* fires `E4B_GUARD_SKIP reason=SEEDORDER`, not silence. This is a direct contradiction of P019's own text and of GLM-B2's ruling, which asked for "equal-shift silence [to stay] untouched per P019" — the ruling's proposed one-liner (`else if(e6b_seedShift >= 0)`) is exactly what got implemented, but that condition does not actually achieve the silence it promises, because there's no upper bound excluding `== barShift`. The fix is a one-token change: `else if(e6b_seedShift >= 0 && e6b_seedShift < barShift)`, leaving equal to fall through all three branches doing nothing (true silence).

---
RULED ADOPTED as explicit tripwire.
- SONNET-A1 (filed V283 SONNET verdict):
1. **P119 SEEDORDER boundary bug** (detailed above): `else if(e6b_seedShift >= 0)` fires on `seedShift == barShift` as well as `0<=seedShift<barShift`, contradicting P019's "equal shifts silent" and GLM-B2's ruling text. Lines: P098‑123, cf. P019.
RULED ADOPTED as explicit tripwire (same defect as Q2/Gap1).
- SONNET-A2 (filed V283 SONNET verdict):
2. **P013/P073/P092 equivalence overclaim**: "same outputs on all inputs" is false for the unreadable branch (`antiNow==-1`); true only for readable inputs. `e6a_block` (P092) is boolean, `oOpp` (C5141) is tri-state. Mitigated but not eliminated by the raw-field print (P125).
RULED - proof narrowed in v11.
- SONNET-A3 (filed V283 SONNET verdict):
3. **Asymmetric strictness in `e6b_hit`** (P115): open comparisons are inclusive (`>=`/`<=`), close comparisons are strict (`<`/`>`). Consistent within each direction branch, but worth naming explicitly in the rule prose (P019) since it's a real boundary decision — an open exactly at the POI counts as "behind," a close exactly at the POI does not count as broken.
RULED ADOPTED as asymmetric open/close clause in v11.
- SONNET-A4 (filed V283 SONNET verdict):
4. **Attribution collision persists by design** (P126‑127): `e6a_block` and `e6b_broken` can both be true on one bar; only `ABORT_LTF_MISALIGN` fires (P126 returns before P127). The row printed at P124‑125 still carries both `opposed=1`/`pobreak=1` correctly (Sonnet-A5's fix), so this isn't new, just confirming it's preserved after the reorder.
RULED ADOPTED as tripwire (same as Gap-1).
- SONNET-A5 (filed V283 SONNET verdict):
5. **No print distinguishes the SEEDORDER case at the field level in `E4B_GUARD` itself.** When SEEDORDER fires (P119‑123), only the SKIP line prints; the following `E4B_GUARD` print at P124‑125 still runs regardless (it's after the if/else-if chain, not inside it) and will show `seed=%d` with whatever `e6b_seedShift` value triggered the anomaly, `walked=0 skipped=0` (loop never ran) and `pobreak=0` (never set true) — which is technically adjudicable via `seed` being less than `barShift`, but there's no dedicated boolean/flag in the row itself marking "SEEDORDER fired," only the separate SKIP line. Given item 1's boundary bug, an equal-shift row and a strictly-fine walk-then-clean-break row could both show `seed==barShift`-adjacent values without a field distinguishing "fell into branch 3" from "fell into branch 2 and walked 0 iterations" — worth a grader's attention since B7's mismatch rule depends on row evidence alone.
RULED - GUARD-pairing procedure documented.
- SONNET-A6 (filed V283 SONNET verdict):
6. **Line-count arithmetic is clean this round** (P031, P169: 83−27=56, 4−2=2, 5−4=1, total 59, post 11611) — no P031-style contradiction this time; noting this positively since the battery is supposed to check it.
RULED - noted correct (v10 header 83/+56 verified; no action).
- SONNET-B-Q2fix (filed V283 SONNET verdict):
- **Q2 fix (low scope, in-round):** change P119 to `else if(e6b_seedShift >= 0 && e6b_seedShift < barShift)` — one boundary token, same three lines GLM-B2 already authorized, now actually delivering the promised equal-shift silence. Touches P119 only.
RULED ADOPTED as explicit tripwire.
- SONNET-B-Q1wording (filed V283 SONNET verdict):
- **Q1 wording fix (no code touch):** replace "same outputs on all inputs" in P013 with "identical on readable inputs; `e6a_block` intentionally discards the -1 state `oOpp` preserves, covered instead by the raw `antiNow`/`antiPrev` print at P125." Removes the overclaim without requiring the shared helper.
RULED ADOPTED as narrowed proof.
- SONNET-B-durable (filed V283 SONNET verdict):
- **Durable (still deferred, unchanged from v282):** the shared HTF-opposition predicate/helper (Luna-B) and the three-state `CLEAN/BROKEN/UNREADABLE` result (Luna-B) remain the structurally cleanest fixes for both items above — a helper returning the tri-state directly would make `e6a_block` literally `(helper(...)==1)` instead of needing a separate equivalence argument at all.
RULED DEFERRED (new function surface, needs scope word).
- GLM-Q1 (filed V283 GLM verdict):
## Q1 (E6a amended): **YES**

The extensional-equivalence proof holds on the page for the gate decision, and the opposition-kill wording is now consistent. Verified element by element:

- **Identical reads:** P076 / P084 read FL_BUF_HTF_HIGH/MID/LOW exactly as C5120 / C5128.
- **Identical shifts:** barShift and barShift+1 in both (P076/P084 = C5120/C5128).
- **Identical count formula:** P074 (`e6a_want`) = C5117 (`oWant`); P078–P081 and P086–P089 = C5122–C5125 and C5130–C5133, line for line.
- **Identical −1 convention:** P073 init −1/−1 = C5119.
- **Flip predicate identical:** P091 = C5135 term for term; flip is print-only (P125), no gate reads it (P126 uses `e6a_block` only) — matches P017.
- **Gate equivalence:** `e6a_block = (e6a_antiNow >= 2)` (P092) is kill-equivalent to the adopted oOpp semantics (C5141) on every input: kill iff antiNow≥2; antiNow=−1 and 0/1 both no-kill. The −1 (unreadable) state is not lost — it is carried adjudicably in the raw anti fields at P125, which is exactly the v282 ruling on Luna-A3/Sonnet-A2/Sonnet-B1/GLM-A6. Abort reuses ABORT_LTF_MISALIGN (P126, define C307).
- **Comment rename:** P160–P164 names both emitters ("post-S2 invariant failure" and "E4b-guard opposition kill (standing HTF opposition)"), drops the "flip kill" mislabel and the "now unambiguous" claim. "Two emitters, separable by the ABORT-row state field" is verifiable: the E4b kill fires while `g_state == ST_S2_LTF_ALIGN` (P126 executes before the state transition at P130); invariant failures fire in the S3+ range (C7119).
- **Proxy relabel + seed alternative:** P017/P072 ("HTF-opposition proxy... his word governs any remap"); seed-bias rejection supported on page: seedBiasAl 0/0/0/1 (P012; JO/PM/IR/NH rows) — 0 on both kill seeds *and* on A1's passing seed, so it discriminates nothing, while anti 1/2/3/1 (rows fence) separates cleanly.
- **Counts:** old C8086–C8112 = 27; new P061–P143 = 83; +56; defines +2; comment +1; total +59; post 11611 (P031, P169) — all check against the pasted blocks.

One wording imprecision in the proof itself is flagged in Ask A item 1; it does not change this verdict.
RULED - carried (YES stands; proof narrowed alongside).
- GLM-Q2 (filed V283 GLM verdict):
## Q2 (E6b): **DISCREPANCY — one line (P119); everything else conforms**

- **DISCREPANCY:** P119 `else if(e6b_seedShift >= 0)` also fires SEEDORDER when `e6b_seedShift == barShift` (equal / confirm-on-seed). Reaching P119 means seedShift ≥ 0 and not > barShift, so the branch catches both the inverted case (0 ≤ seed < confirm — correct) **and** the equal case. That contradicts P019 ("equal shifts silent (confirm-on-seed, ruled)"), the Q2 statement itself ("0≤seed<confirm"), GLM-B2's own caveat ("equal-shift silence stays untouched"), and the v282 ruling ("equal excluded from the branch"). Root cause: GLM-B2's literal suggested condition (`>= 0`) does not implement its own caveat; v3 pasted the literal condition. **Fix (one line): P119 → `else if(e6b_seedShift < barShift)`** (≥0 already guaranteed by the P100 branch). Equal then falls through silent, still evidenced by the E4B_GUARD row (seed==barShift visible via bar vs seedbar times, P125). No B-clause is affected (his rows all have seed strictly older than confirm), but code-vs-ruled-prose contradiction is blocking under this council's exact-diff standard.
- **Predicate — conforms:** walk bounds P107 (barShift+1..seedShift inclusive = seed-inclusive/confirm-exclusive per P093); seed exact=true with anchor-bar-time>0 (P098–P099); SEED skip for unresolvable/unset (P100–P104); dir-matched body cross P115; behind term absent from P094–P123.
- **Raw fields — conforms:** anti now/prev (−1 adjudicable), seed, walked/skipped, breaking-bar bbar/bpx (P095–P096, P109, P111, P114, P116, P125); fully-unreadable walk (walked=N, skipped=N) distinguishable from clean (walked=N, skipped=0) per Sonnet-A3/B2.
- **Abort code — conforms:** P127 `GoAbort(ABORT_S54_POIBREAK, g_state)`; define P152 inserted after the exact C323–C324 pair (P149–P150 byte-match); attribution ordering P126→P127 per Sonnet-A5 ruling.
- **Scope — conforms:** entire guard inside the confirm-true branch (P070…P127); aborts unconditional, rows debug-gated, LogAbort unconditional (C1728–C1733) per P168; S3 fall-through P141–P143 byte-identical to C8110–C8112; fence P022/P026 intact.
- **Counts:** 27→83 (+56), defines +2, comment +1, +59, post 11611 — verified against pasted blocks (P031, P169).

With P119 corrected and re-pasted, Q2 becomes yes without another full review round; the rest of the packet stands as drafted.
RULED ADOPTED as explicit tripwire.
- GLM-A1 (filed V283 GLM verdict):
1. **P013 proof overclaim:** "same outputs on all inputs" is false at value level: on antiNow<0, `e6a_block`=false (P092) while `oOpp`=−1 (C5141). True statement: *same kill decision on all inputs; the −1 state is carried by the raw anti fields (P125), not by the gate bool.* Code unaffected; reword the proof sentence.
RULED - proof narrowed in v11.
- GLM-A2 (filed V283 GLM verdict):
2. **P119 equal-case defect** — the Q2 discrepancy above, with fix.
RULED - pairs corrected to bias/opposed with flip stated.
- GLM-A3 (filed V283 GLM verdict):
3. **P012 garbled sequence:** "ORDER opposed 1/0/3/1 across A1/6-04/6-08/A4" matches neither the bias sequence (1/2/3/1) nor the opposed sequence (0/1/1/0) from the rows fence. Per GLM-A2 the corrected form is bias/opposed pairs 1/0, 2/1, 3/1, 1/0 (PN/HJ/RE/RF). Ironic defect: this is the very line citing the GLM-A2 label correction. Evidence-bookkeeping only (the rows fence and B-clauses are self-consistent), but it should be exact.
RULED - renamed opposition kill with two emitters.
- GLM-A4 (filed V283 GLM verdict):
4. **P103 / P122 SKIP prints carry no numbers** (no seed=%d, no confirm-bar shift). A SEEDORDER row alone cannot distinguish the ruled-silent equal case from a genuine inverted anomaly; only the GUARD-row cross-reference resolves it. See Ask B item 3.
RULED ADOPTED as explicit tripwire.
- GLM-A5 (filed V283 GLM verdict):
5. **P093 "equality/gap choices as stated in packet":** the open==POI-level equality choice in P115 (`o >= v` / `o <= v`) is stated nowhere in the prose; only seed-equality (P019) and walk inclusivity are. One clause closes it.
RULED - S1 states trailing-space boundaries with SKIP subtracted.
- GLM-A6 (filed V283 GLM verdict):
6. **P019 "SEED anomaly (unresolvable)":** the SEED skip (P100) also covers anchor-time-unset (P098 false → seedShift stays −1) — two causes, one label. Adjudicable via the seedbar epoch print (P125 + P182), but the prose names only one cause.
RULED ADOPTED as raw fields (-1s adjudicable).
- GLM-A7 (filed V283 GLM verdict):
7. **P168 census ambiguities:** ABORT_S54_POIBREAK is listed in the print census with no expected count pre- vs post-edit (0 on disk now; 2 after: P152 define + P127 call). Likewise "E6 reads: 6 HTF-leg" does not pin per-site vs post-build total (post-build: 12 ReadFlow across the two sites plus any pre-existing elsewhere). Pin the numbers so S1 is mechanically decidable.
RULED ADOPTED as global mismatch clause (halt with attribution).
- GLM-A8 (filed V283 GLM verdict):
8. **Rows-fence token collision:** `GJ` is used twice (CONFIRM_PREBIND_FAIL 6/05 16:10 and TP_RR_FAIL_LATCH 6/03 18:40). Reference IDs should be unique for carry-check citations.
RULED - B2 notes E6a-primary with pobreak adjudicated.
- GLM-A9 (filed V283 GLM verdict):
9. **B7 residual (P179):** "genuine flip/break" / "no genuine cause" still lacks the positive field predicate (e.g., genuine opposition kill = opposed=1 ∧ anti≥2; genuine break kill = pobreak=1 ∧ bbar≠epoch ∧ bpx populated). The mismatch rule catches contradictions; one sentence would state the affirmative tie and close the Luna-A7 residual fully.
RULED - noted as grade-tested assumption with B8 window.
- GLM-A10 (filed V283 GLM verdict):
10. **Naming drift:** "packet v9" (relay priors) vs "v2" (P003) for the same digest 3A1E640F — digest disambiguates; align the ledger label.
RULED ADOPTED as epoch-sentinel clause.
- GLM-A11 (filed V283 GLM verdict):
11. **Opus-B7 "NOTED in packet scope prose" is not executed on the packet page.** P026 parks the S3/S4 extension but never names EA 7119-7130 as the surveyed future insertion site — that naming exists only in the relay's demands quote. One clause in P026 executes the ruling as recorded.
RULED - scope names EA 7119-7130 (no edit this round).
- GLM-A12 (filed V283 GLM verdict):
12. **P013/P169 value "159.929" appears nowhere on the page.** KK/MH show fill 159.932, SL 159.889, TP 159.983 (slPts=43/tpPts=51 corroborate 159.889/159.983). If 159.929 is a second S4 fill from a row not excerpted, fine — but it is unverifiable here and B4's parity expectation depends on it. Route through his carry-check against the full v281 record.
RULED - MTEXIT row pasted in v284 rows fence (1x verified).
- GLM-A13 (filed V283 GLM verdict):
13. **P013 "WAIVED 16:00 x2" has no matching excerpted row.** The A2_WAIVED_POC rows shown are 6/11 15:15 (DN) and 6/03 18:35 (QL). The excerpts are admittedly single samples, but this may be sample bias — carry-check item, same lane as item 12.
RULED - WAIVED pair pasted in v284 rows fence (count 2).
- GLM-A14 (filed V283 GLM verdict):
14. **S5.4's own text is not on the page.** Q2 is ruled against the packet's paraphrase (P019-P020, P093 comment) plus his finding 8EF27EF8 by reference. Consistent with the verification split and prior rounds' practice; noted for the record so the ruling's basis is explicit.
RULED - noted (ruled by paraphrase plus finding).
- GLM-A15 (filed V283 GLM verdict):
15. **Dynamic-vs-locked anchor value is implemented but unstated.** Astra-B's interval demand included "define dynamic versus locked anchor value"; the code reads the POI buffer per-bar (P109, e6b_v varies by shift) — presumably v1 continuity, but P019 states equality/gap only. One clause: "anchor value = per-bar POI buffer read (dynamic), not locked to the arm-time level."
RULED ADOPTED as dynamic-anchor clause.
- GLM-A16 (filed V283 GLM verdict):
16. **Transport artifact in the old-code excerpt:** C318 contains mojibake ("Ã¢â‚¬â€" for an em-dash). Outside every edit anchor (the defines insert anchors on C323-C324, which are clean), so no char-assert implications — noted solely for his carry-check so it isn't mistaken for EA corruption.
RULED - noted pre-existing outside all anchors.
- GLM-Deferrals (filed V283 GLM verdict):
Deferrals honored, verified on the page: no shared HTF helper (E6a recomputes, P073-P090), no three-state helper (fail-open preserved, P109/P112 continues), no latched side (plain cross only, P113), no retain-print helper (single S2WAIT at P132). Nothing below re-petitions them.
RULED - recorded consistent with parked scope (no shared helper/latch/side/retain-print).
- GLM-B1 (filed V283 GLM verdict):
1. **Shared HTF-opposition helper** (still the durable fix; DEFERRED, needs scope word): one function computing the anti count, used at C5117–C5141 and replacing P073–P090; eliminates the recorded drift point (Luna-A2).
RULED ADOPTED as raw fields (plus skipped count).
- GLM-B2 (filed V283 GLM verdict):
2. **Three-state break result** (DEFERRED): CLEAN/BROKEN/UNREADABLE out of the walk (P094–P118) so a fully-unreadable walk is a state, not an inference from walked==skipped; redundant with the adopted counters, hardening only.
RULED ADOPTED as explicit tripwire.
- GLM-B3 (filed V283 GLM verdict):
3. **Self-adjudicating SKIP rows** (new, low scope, no new function surface): add `seed=%d cbar=%d` to both E4B_GUARD_SKIP prints (P103, P122). Then SEED(−1), SEEDORDER-equal (ruled silent), and SEEDORDER-inverted (0≤seed<cbar, anomaly) are each classifiable from the SKIP row alone — directly valuable given item A2/A4, and it makes the tripwire audit-proof even if a future edit re-breaks the branch.
RULED - GUARD-row seedbar cross-reference covers adjudication (no new fields in refinement).
- GLM-Standing (filed V283 GLM verdict):
Standing constraints acknowledged: probe/print-only throughout; nothing here builds, runs, or spends; no live activation is cleared or asked. Disk truth remains STAGE-1's (re-hash CD95241F/637583/11552 or diagnose a successor).
RULED - noted (verification split respected; probe/print-only stands).

Verification split: rule on the page only - genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.

Nothing else is asked. Thank you.



P001: # PACKET_P-USDJPY-2 v4 DRAFT - amend-with-delta on v283 verdicts (nothing builds/runs/commits on this file)

P002: 

P003: Status: v4 DRAFT (v3 25D60185/18010/191 SUPERSEDED untransported-folded - transported as v283 and ruled: Luna Q1-DISCREPANCY + Q2-NO; Sonnet Q1-DISCREPANCY + Q2-DISCREPANCY; GLM Q1-YES + Q2-DISCREPANCY-one-line; tallied NO-CLEAR - tripwire boundary bug blocks all three; code UNCHANGED - this fold amends tripwire + proof wording + SKIP print only). Assembly rule: enumerated literal edits below only (E4b branch interior + abort-define insert + Task-76 comment); old blocks machine-read from disk under UNIQUE headers; each edit-site header exactly once. Relay + battery owed before any transport.

P004: 

P005: Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E6a/E6b amended guards + one abort-define + one comment; S1 recount governs). No new indicator buffers. No new inputs. No counter touches. One abort-define carried (ABORT_S54_POIBREAK, GLM-ratified). Nothing under 02_TASK_CHECKPOINTS. Commits are builder-called (AGENTS 6.5); no council commit token exists or is asked.

P006: 

P007: ## Authority (his words + disk, no invention)

P008: 

P009: - His retest-invalidation ruling 2026-09-25 (finding RETEST-INVALIDATION-V1 8EF27EF8) + refinement-phase order + skill section 6 (settled rules ride every refinement; section srj-strategy-6).

P010: - v283 verdicts, all three filed whole (Luna DISCREPANCY/NO; Sonnet DISCREPANCY/DISCREPANCY; GLM YES/DISCREPANCY-one-line; tallied NO-CLEAR - tripwire equal-case bug blocks Q2 on all three; Luna-Q1 proof wording blocks Q1).

P011: - v283 agreements adopted as fold (all seats): tripwire explicit bound (Luna-A2/Sonnet-Q2/GLM-Q2 + GLM-B2 + Sonnet-B3 - Sonnet's explicit form adopted: else-if with both bounds, equal falls silent); proof narrowed to block/no-block truth value (Luna-Q1/A1/A15, Sonnet-Q1/A2, GLM-A1); HTF SKIP print (Sonnet-B1); P012 pairs corrected to bias/opposed 1/0, 2/1, 3/1, 1/0 with flip 0/1/1/0 stated (GLM-A2/A3); asymmetric strictness named (Sonnet-A3: open inclusive, close strict); abort-pairing procedure (Sonnet-A5/Luna-A13: abort rows never read alone, always paired with preceding GUARD row); SEEDORDER-in-GUARD note (Sonnet-A5 second half: GUARD prints on SKIP bars with seed<barShift visible, pobreak=0, walk skipped).

P012: - Row evidence carried forward (RECON64 C03D4774): ORDER bias/opposed pairs 1/0 (A1 09:40), 2/1 (6/04 16:15), 3/1 (6/08 09:30), 1/0 (A4 09:05) with flip values 0/1/1/0; seedBiasAl 0/0/0/1; WAIVED pair at 16:05 (count 2, paired evaluations same pass); PREBIND_S2 chains; TPFALLBACK 160.028/20; TP_RR_FAIL_LATCH R0.38/R0.28; MTEXIT entry 159.929 exit 159.983 (A4 second fill); EXECUTED fills.

P013: - Luna-Q1 structural demand (oOpp literal) answered: extensional proof narrowed as ruled - identical block/no-block truth value on all inputs (readable: same decision; unreadable: both no-kill, -1 carried by raw anti fields, never by the gate bool); shared-helper refactor stays DEFERRED (new function surface, needs scope word); v284 relay asks her ruling on the narrowed proof.

P014: 

P015: ## Rule (amended guards, E4b branch only; baseline S3/S4 paths untouched)

P016: 

P017: - E6a standing-opposition gate: HTF legs exactly as v3; BLOCK on opposed (antiNow>=2); flip print-only. Wording: HTF-opposition proxy, identical block/no-block truth value as oOpp on all inputs (readable: same decision; unreadable: both no-kill with -1 carried adjudicably in raw fields, never in the gate bool); 5m-mapping open to his word.

P018: - E6a disposition ABORT_LTF_MISALIGN (existing code; Task-76 comment: opposition kill, two emitters separable by ABORT-row state field). HTF-unreadable prints E4B_GUARD_SKIP reason=HTF (new, print-only).

P019: - E6b POI-break guard: walk confirm+1 through seedShift inclusive; plain dir-matched cross (open inclusive, close strict - stated); exact seed with anchor-bar-time>0; SEED anomaly (unresolvable) + SEEDORDER anomaly (0<=seed<confirm, explicit both bounds); equal shifts silent (confirm-on-seed, ruled); breaking-bar evidence out; walked/skipped counters out; raw HTF/seed fields out.

P020: - E4B_GUARD on every confirm-true with flip/opposed/pobreak/anti/seed/walked/skipped/bbar/bpx fields (clean prints zeros and epoch sentinel; unreadable prints -1s - adjudicable, never clean-looking).

P021: - ABORT_S54_POIBREAK on break-fire (new define, GLM-ratified name).

P022: - Untouched (fence): everything v7 built except the E4b branch interior; S3/S4 paths; ORDER/DIV gates; other abort codes; counters; buffers; inputs; R floor; exits; management.

P023: 

P024: ## Scope (refinement phase, his order)

P025: 

P026: - Narrow edits to the E4b branch interior + one define + one comment. No overall-logic revision. S3/S4-path extension still parked (needs his explicit scope word first, never council-first). Parked insertion site named: LTF invariant block EA 7119-7130 (no edit this round).

P027: - Windows: USDJPY 6/1-6/13 + EURUSD 8/26-9/10 (config-ini unix window per RUN-WINDOW GATE). InpDebugLog=true (grading precondition, stated), InpMode=1, M5 pinned.

P028: 

P029: ## Edit set (exact verbatim old/new; STAGE-1 exact-diff gated; old blocks disk-read same turn under UNIQUE headers; exactly one block per site)

P030: 

P031: - E6a+E6b (old EA 8086-8112 27 lines, new 86 lines, NET +59):

P032:   old:

P033: `   if(g_state == ST_S2_LTF_ALIGN)`

P034: `     {`

P035: `      bool aligned;`

P036: `      if(!CheckLtfAlign(barShift, g_dir, aligned))`

P037: `        { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }`

P038: `      if(!aligned)`

P039: `        {`

P040: `         //--- [P-USDJPY-1 E4b] his confirm-once rule 2026-09-25 + 2026-09-11 ruling extended to S2 as a deliberate exception (LTF-stay overridden for confirm-bearing candidates only; S3-only keeps the 6/5 miss dead). Identical predicate, identical S5 fall-through; FAIL retains at S2.`

P041: `         string cfTermS2 = "";`

P042: `         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermS2))`

P043: `           {`

P044: `            ENUM_SRJ_STATE prevS2 = g_state;`

P045: `            g_confirmFromState = prevS2;`

P046: `            g_state = ST_S5_GATE_CHECK;`

P047: `            LogState(prevS2, g_state);`

P048: `            if(InpDebugLog)`

P049: `               PrintFormat("[SRJ-EA] CONFIRM_PREBIND_S2 bar=%s dir=%s poi=%s seedbar=%s",`

P050: `                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),`

P051: `                           DirName(g_dir), AnchorStr(),`

P052: `                           TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES));`

P053: `           }`

P054: `         else`

P055: `           { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }`

P056: `        }`

P057: `      ENUM_SRJ_STATE prev = g_state;`

P058: `      if(g_state == ST_S2_LTF_ALIGN) { g_state = ST_S3_ZONE_WAIT; LogState(prev, g_state); }`

P059: `     }`

P060:   new (confirm-first reorder; standing-opp gate; POI walk without behind term; evidence print with raw fields; abort dispositions; explicit tripwire; HTF SKIP print):

P061: `   if(g_state == ST_S2_LTF_ALIGN)`

P062: `     {`

P063: `      bool aligned;`

P064: `      if(!CheckLtfAlign(barShift, g_dir, aligned))`

P065: `        { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }`

P066: `      if(!aligned)`

P067: `        {`

P068: `         //--- [P-USDJPY-1 E4b] his confirm-once rule 2026-09-25 + 2026-09-11 ruling extended to S2 as a deliberate exception (LTF-stay overridden for confirm-bearing candidates only; S3-only keeps the 6/5 miss dead). Identical predicate, identical S5 fall-through; FAIL retains at S2.`

P069: `         string cfTermS2 = "";`

P070: `         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermS2))`

P071: `           {`

P072: `            //--- [P-USDJPY-2 E6a] HTF-opposition proxy separating the ruled rows (A1 anti=1 promotes; 6/04 anti=2 and 6/08 anti=3 abort): gate on STANDING opposition (antiNow>=2); flip kept as print field only. S3.3 5m-mapping: LTF invariant covers S3+; E4b needs row-separation - his word governs any remap.`

P073: `            int e6a_antiNow = -1, e6a_antiPrev = -1;`

P074: `            int e6a_want = (g_dir == DIR_LONG) ? 1 : -1;`

P075: `            double e6a_h = 0.0, e6a_m = 0.0, e6a_l = 0.0;`

P076: `            if(ReadFlow(FL_BUF_HTF_HIGH, e6a_h, barShift) && ReadFlow(FL_BUF_HTF_MID, e6a_m, barShift) && ReadFlow(FL_BUF_HTF_LOW, e6a_l, barShift))`

P077: `              {`

P078: `               e6a_antiNow = 0;`

P079: `               if((int)MathRound(e6a_h) == -e6a_want) e6a_antiNow++;`

P080: `               if((int)MathRound(e6a_m) == -e6a_want) e6a_antiNow++;`

P081: `               if((int)MathRound(e6a_l) == -e6a_want) e6a_antiNow++;`

P082: `              }`

P083: `            double e6a_h1 = 0.0, e6a_m1 = 0.0, e6a_l1 = 0.0;`

P084: `            if(ReadFlow(FL_BUF_HTF_HIGH, e6a_h1, barShift + 1) && ReadFlow(FL_BUF_HTF_MID, e6a_m1, barShift + 1) && ReadFlow(FL_BUF_HTF_LOW, e6a_l1, barShift + 1))`

P085: `              {`

P086: `               e6a_antiPrev = 0;`

P087: `               if((int)MathRound(e6a_h1) == -e6a_want) e6a_antiPrev++;`

P088: `               if((int)MathRound(e6a_m1) == -e6a_want) e6a_antiPrev++;`

P089: `               if((int)MathRound(e6a_l1) == -e6a_want) e6a_antiPrev++;`

P090: `              }`

P091: `            bool e6a_flip = (e6a_antiNow >= 2 && e6a_antiPrev >= 0 && e6a_antiPrev < 2);`

P092: `            bool e6a_block = (e6a_antiNow >= 2);`

P093: `            bool e6a_unread = (e6a_antiNow < 0 || e6a_antiPrev < 0);`

P094: `            if(e6a_unread && InpDebugLog)`

P095: `               PrintFormat("[SRJ-EA] E4B_GUARD_SKIP bar=%s dir=%s poi=%s reason=HTF", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());`

P096: `            //--- [P-USDJPY-2 E6b] spec S5.4: anchor POI body cross from seed bar (inclusive) through confirm bar (exclusive) kills the promotion. Walk shifts confirm+1..seed; EMPTY/unreadable skipped with walked/skipped counts; exact seed with anchor-bar-time>0; open inclusive, close strict; anchor value dynamic per-bar read.`

P097: `            bool e6b_broken = false;`

P098: `            datetime e6b_bt = 0; double e6b_bv = 0.0, e6b_bo = 0.0, e6b_bc = 0.0;`

P099: `            int e6b_walked = 0, e6b_skipped = 0;`

P100: `            int e6b_seedShift = -1;`

P101: `            if(g_anchorBarTime > 0)`

P102: `               e6b_seedShift = iBarShift(_Symbol, PERIOD_CURRENT, g_anchorBarTime, true);`

P103: `            if(e6b_seedShift < 0)`

P104: `              {`

P105: `               if(InpDebugLog)`

P106: `                  PrintFormat("[SRJ-EA] E4B_GUARD_SKIP bar=%s dir=%s poi=%s reason=SEED", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());`

P107: `              }`

P108: `            else if(e6b_seedShift > barShift)`

P109: `              {`

P110: `               for(int e6b_s = barShift + 1; e6b_s <= e6b_seedShift; e6b_s++)`

P111: `                 {`

P112: `                  e6b_walked++;`

P113: `                  double e6b_v = 0.0;`

P114: `                  if(!ReadBuf1(g_hPoi, g_anchorLine, e6b_v, e6b_s) || e6b_v == EMPTY_VALUE) { e6b_skipped++; continue; }`

P115: `                  double e6b_o = iOpen(_Symbol, PERIOD_CURRENT, e6b_s);`

P116: `                  double e6b_c = iClose(_Symbol, PERIOD_CURRENT, e6b_s);`

P117: `                  if(e6b_o == 0.0 || e6b_c == 0.0) { e6b_skipped++; continue; }`

P118: `                  bool e6b_hit = (g_dir == DIR_LONG) ? (e6b_o >= e6b_v && e6b_c < e6b_v) : (e6b_o <= e6b_v && e6b_c > e6b_v);`

P119: `                  if(e6b_hit) { e6b_broken = true; e6b_bt = iTime(_Symbol, PERIOD_CURRENT, e6b_s); e6b_bv = e6b_v; e6b_bo = e6b_o; e6b_bc = e6b_c; break; }`

P120: `                 }`

P121: `              }`

P122: `            else if(e6b_seedShift >= 0 && e6b_seedShift < barShift)`

P123: `              {`

P124: `               if(InpDebugLog)`

P125: `                  PrintFormat("[SRJ-EA] E4B_GUARD_SKIP bar=%s dir=%s poi=%s reason=SEEDORDER", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());`

P126: `              }`

P127: `            if(InpDebugLog)`

P128: `               PrintFormat("[SRJ-EA] E4B_GUARD bar=%s dir=%s poi=%s seedbar=%s flip=%d opposed=%d pobreak=%d anti=%d/%d seed=%d walked=%d skipped=%d bbar=%s bpx=%s/%s/%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES), (int)e6a_flip, (int)e6a_block, (int)e6b_broken, e6a_antiNow, e6a_antiPrev, e6b_seedShift, e6b_walked, e6b_skipped, TimeToString(e6b_bt, TIME_DATE|TIME_MINUTES), DoubleToString(e6b_bv, _Digits), DoubleToString(e6b_bo, _Digits), DoubleToString(e6b_bc, _Digits));`

P129: `            if(e6a_block) { GoAbort(ABORT_LTF_MISALIGN, g_state); return; }`

P130: `            if(e6b_broken) { GoAbort(ABORT_S54_POIBREAK, g_state); return; }`

P131: `            ENUM_SRJ_STATE prevS2 = g_state;`

P132: `            g_confirmFromState = prevS2;`

P133: `            g_state = ST_S5_GATE_CHECK;`

P134: `            LogState(prevS2, g_state);`

P135: `            if(InpDebugLog)`

P136: `               PrintFormat("[SRJ-EA] CONFIRM_PREBIND_S2 bar=%s dir=%s poi=%s seedbar=%s",`

P137: `                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),`

P138: `                           DirName(g_dir), AnchorStr(),`

P139: `                           TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES));`

P140: `           }`

P141: `         else`

P142: `           { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }`

P143: `        }`

P144: `      ENUM_SRJ_STATE prev = g_state;`

P145: `      if(g_state == ST_S2_LTF_ALIGN) { g_state = ST_S3_ZONE_WAIT; LogState(prev, g_state); }`

P146: `     }`

P147: - Abort-define insert (old EA 323-324 2 lines, new 4 lines, NET +2):

P148:   old:

P149: `#define ABORT_POI_REPLACED     "POI_REPLACED"`

P150: `#define ABORT_DIV_FALLBACK     "DIV_FALLBACK"`

P151:   new:

P152: `#define ABORT_POI_REPLACED     "POI_REPLACED"`

P153: `#define ABORT_DIV_FALLBACK     "DIV_FALLBACK"`

P154: `//--- [P-USDJPY-2 E6b] settled-rule kill reason (S5.4 POI-break; council-ruled name).`

P155: `#define ABORT_S54_POIBREAK     "S54_POIBREAK"`

P156: - Task-76 comment amendment (old EA 7099-7102 4 lines, new 5 lines, NET +1):

P157:   old:

P158: `   //--- Reuses ABORT_LTF_MISALIGN and adds no new reason code. Task 76 removed`

P159: `   //--- the only other site that emitted it, so the string is now unambiguous:`

P160: `   //--- every LTF_MISALIGN abort is a post-S2 invariant failure. It is NOT the`

P161: `   //--- same population as the pre-Task-76 count and must not be compared to it.`

P162:   new:

P163: `   //--- Reuses ABORT_LTF_MISALIGN and adds no new reason code. Task 76 removed`

P164: `   //--- the only other site that emitted it: every LTF_MISALIGN abort is a post-S2`

P165: `   //--- invariant failure or an E4b-guard opposition kill (standing HTF opposition).`

P166: `   //--- The string now has exactly two emitters, separable by the ABORT-row state`

P167: `   //--- field. It is NOT the pre-Task-76 population and must not be compared to it.`

P168: 

P169: ## Stages (T161N discipline; RECON64 precedent)

P170: 

P171: - S1 pre-hash gate: re-hash EA (must equal CD95241F/637583/11552 or DIAGNOSED successor, never assumed; DIAGNOSED means disk-diagnosed drift filed in ledger and disclosed in relay, never assumed) plus one hit per anchor (one code occurrence per anchor outside history comments: E4b block + abort-define pair + Task-76 comment; print census with token boundaries: E4B_GUARD matches trailing-space form only, E4B_GUARD_SKIP matched and subtracted, ABORT_S54_POIBREAK) plus buffers unchanged (no new indicator buffers) plus R-gate/latch untouched (no edit there) plus call-site census (ComputeNearestTpTarget( = 5: definition + 7307 + 8918 + 2 fallback calls; E6 reads: 6 HTF-leg + POI-walk + OHLC + iBarShift, no new walker callers) plus char-code assert every OLD anchor AND every insert byte plus HTF-buffer ids (HIGH/MID/LOW used at EA:5120) plus POI-handle read precedent (ReadBuf1 on the POI handle at the walker site) plus iBarShift precedent (14 hits) plus M5 PINNED plus InpDebugLog=true grading precondition (guard control flow unconditional; guard rows debug-gated; ABORT rows unconditional via LogAbort; SKIP rows debug-gated). Runs carry InpDebugLog=true.

P172: - S3 budget (mechanical from the pasted blocks, NET per site = new-site-total minus old-site-total; script-counted this block): E4b +59 (86-27); defines +2 (4-2); comment +1 (5-4); total +62; post 11552+62 = 11614 (S3 recount governs).

P173: 

P174: ## Acceptance (grade segment-vs-baselines; event tuples, never bare clock labels)

P175: 

P176: - B1 (6/04 16:15 pass, SHORT Daily-POC): NO SIGNAL at 16:20 with NO CONFIRM_PREBIND_S2 + NO SIGNAL on this anchor for the rest of its S2 retention (window clause); E4B_GUARD opposed=1 anti=2/1 with ABORT_LTF_MISALIGN row at the kill minute; pobreak=1 expected with breaking bar adjudicated from the print fields at grade.

P177: - B2 (6/08 09:30 pass, SHORT Weekly-POC): NO SIGNAL at 09:35 with window clause as B1; E4B_GUARD opposed=1 with ABORT_LTF_MISALIGN row; pobreak field adjudicated, not pre-declared (E6a-primary instance).

P178: - B3 (A1 09:40 pass, SHORT Daily-POC): SIGNAL 09:45 + EXECUTED 159.948 + TP_TOUCH 159.899 identical; E4B_GUARD opposed=0 pobreak=0 anti=1/1 walked>=1 skipped=0 row at the pass (coverage proof; epoch bbar sentinel read as no-break-recorded).

P179: - B4 (A4 6/03 09:05 pass, LONG Daily-VWAP): SIGNAL + fills 159.932/159.929/159.983 identical (S4 path untouched - parity check, not cleanliness evidence).

P180: - B5 (A2 16:50 refuse, LONG Daily-POC): TP_RR_FAIL_LATCH R0.38 ABORT identical (S3 path untouched - parity check).

P181: - B6 (6/03 18:35 refuse, LONG Daily-POC): TP_RR_FAIL_LATCH R0.28 ABORT identical.

P182: - B7 (EURUSD 8/26-9/10 join): killed takes adjudicated on row evidence against S3.3/S5.4 (guard-kill on a take carrying genuine opposition-kill (opposed=1 with anti>=2) or genuine break-kill (pobreak=1 with bbar not epoch and bpx populated) = guard working, even on his rows - consistent with his declines; abort rows never read alone, always paired with the preceding GUARD row); HALT only on an unattributable kill or a kill with no genuine cause on the rows. Baseline takes otherwise bit-identical on bar/entry/exit; rejects diagnostic. Global mismatch rule: any evidence-field expectation mismatch = halt with attribution, never silent pass.

P183: - B8 (post-kill silence): NO CONFIRM_PREBIND_S2 and NO SIGNAL on the ruled anchors (6/04 SHORT Daily-POC; 6/08 SHORT Weekly-POC) after the kill minutes through window end.

P184: - Dynamic anchor clause: anchor value is the per-bar POI buffer read (dynamic), not locked to the arm-time level.

P185: - Epoch sentinel clause: bbar 1970.01.01 00:00 reads as no-break-recorded; anti/seed -1 reads as unreadable, never clean.

P186: - L-final: B1-B8 above plus the two clauses.

P187: 

P188: ## Run cost and novel evidence

P189: 

P190: - One build (STAGE-1 gated) plus two tester runs, ceiling 90 each: USDJPY June 1-13 (~45 min) + EURUSD full 8/26-9/10 (~50 min). Same cost as v10 (v10 unbuilt; cost carried).

P191: - E6 guards terminate (abort) with raw-field evidence; behind term deleted; seed exact; explicit tripwire; HTF SKIP print.

P192: - Novel evidence vs RECON64/65: (a) ABORT rows on his two ruled instances with raw fields and no takes and no post-kill revival; (b) A1/A4 intact re-proof with coverage rows; (c) EU join with guard attribution on every killed take.

P193: 

P194: (End of file)



C8086:    if(g_state == ST_S2_LTF_ALIGN)

C8087:      {

C8088:       bool aligned;

C8089:       if(!CheckLtfAlign(barShift, g_dir, aligned))

C8090:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }

C8091:       if(!aligned)

C8092:         {

C8093:          //--- [P-USDJPY-1 E4b] his confirm-once rule 2026-09-25 + 2026-09-11 ruling extended to S2 as a deliberate exception (LTF-stay overridden for confirm-bearing candidates only; S3-only keeps the 6/5 miss dead). Identical predicate, identical S5 fall-through; FAIL retains at S2.

C8094:          string cfTermS2 = "";

C8095:          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermS2))

C8096:            {

C8097:             ENUM_SRJ_STATE prevS2 = g_state;

C8098:             g_confirmFromState = prevS2;

C8099:             g_state = ST_S5_GATE_CHECK;

C8100:             LogState(prevS2, g_state);

C8101:             if(InpDebugLog)

C8102:                PrintFormat("[SRJ-EA] CONFIRM_PREBIND_S2 bar=%s dir=%s poi=%s seedbar=%s",

C8103:                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),

C8104:                            DirName(g_dir), AnchorStr(),

C8105:                            TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES));

C8106:            }

C8107:          else

C8108:            { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }

C8109:         }

C8110:       ENUM_SRJ_STATE prev = g_state;

C8111:       if(g_state == ST_S2_LTF_ALIGN) { g_state = ST_S3_ZONE_WAIT; LogState(prev, g_state); }

C8112:      }

C5117:     int oWant = (g_dir == DIR_LONG) ? 1 : -1;

C5118:     double oH = 0.0, oM = 0.0, oL = 0.0;

C5119:     int oAntiNow = -1, oAntiPrev = -1;

C5120:     if(ReadFlow(FL_BUF_HTF_HIGH, oH, barShift) && ReadFlow(FL_BUF_HTF_MID, oM, barShift) && ReadFlow(FL_BUF_HTF_LOW, oL, barShift))

C5121:       {

C5122:        oAntiNow = 0;

C5123:        if((int)MathRound(oH) == -oWant) oAntiNow++;

C5124:        if((int)MathRound(oM) == -oWant) oAntiNow++;

C5125:        if((int)MathRound(oL) == -oWant) oAntiNow++;

C5126:       }

C5127:     double oH1 = 0.0, oM1 = 0.0, oL1 = 0.0;

C5128:     if(ReadFlow(FL_BUF_HTF_HIGH, oH1, barShift + 1) && ReadFlow(FL_BUF_HTF_MID, oM1, barShift + 1) && ReadFlow(FL_BUF_HTF_LOW, oL1, barShift + 1))

C5129:       {

C5130:        oAntiPrev = 0;

C5131:        if((int)MathRound(oH1) == -oWant) oAntiPrev++;

C5132:        if((int)MathRound(oM1) == -oWant) oAntiPrev++;

C5133:        if((int)MathRound(oL1) == -oWant) oAntiPrev++;

C5134:       }

C5135:     int oFlip = (oAntiNow >= 2 && oAntiPrev >= 0 && oAntiPrev < 2) ? 1 : 0;

C5136:     if(oFlip == 1 && outcome == "PASS") g_order_flipPassN++;

C5137:     //--- [P-SLDEF-5 E40] renames: flipNewThisBar (same newness predicate),

C5138:     //--- biasOpposedAtGate (state boolean beside the anti count; -1 unreadable

C5139:     //--- passes through). [P-SLDEF-5 E38] SEQ_UNSTAMPED naming: the bias site

C5140:     //--- did not run for this bar (S4→S5 cause); R1's 4 unstamped rows.

C5141:     int oOpp = (oAntiNow < 0) ? -1 : ((oAntiNow >= 2) ? 1 : 0);

C5142:     string oStamp = (oSeqB < 0) ? "SEQ_UNSTAMPED" : "STAMPED";

C5143:     string oCause = (oSeqB < 0) ? "S4S5_NOBIAS" : "-";

C5144:     string oLine = StringFormat("[SRJ-EA] ORDER fields=10 bar=%d barTime=%s seqBias=%d seqS5=%d biasAtGate=%d biasOpposedAtGate=%d flipNewThisBar=%d gateOutcome=%s seqStamp=%s seqCause=%s",

C5145:               barShift, TimeToString(obt, TIME_DATE|TIME_MINUTES),

C5146:               oSeqB, oSeqS5, oAntiNow, oOpp, oFlip, outcome, oStamp, oCause);

C7119:    if(g_state >= ST_S3_ZONE_WAIT && g_state <= ST_S5_GATE_CHECK)

C7120:      {

C7121:       //--- [P-SLDEF-4 E33] bias-site stamp: the pipeline's per-bar bias read

C7122:       //--- runs in this block (live LTF-align invariant). Print-only; every

C7123:       //--- branch below is untouched.

C7124:       g_order_seq++;

C7125:       g_order_seqBias = g_order_seq;

C7126:       g_order_biasBarT = iTime(_Symbol, PERIOD_CURRENT, barShift);

C7127:       bool t79_aligned = false;

C7128:       if(!CheckLtfAlign(barShift, g_dir, t79_aligned))

C7129:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }

C7130:       if(!t79_aligned)

C302: #define ABORT_FRESH_OB_DEAD    "FRESH_OB_DEAD"

C303: #define ABORT_FRESH_OPP_FVG    "FRESH_OPP_FVG"

C304: #define ABORT_FRESH_VETO       "FRESH_VETO"

C305: #define ABORT_TP_RR_FAIL       "TP_RR_FAIL"

C306: #define ABORT_NO_REGIME        "NO_REGIME"

C307: #define ABORT_LTF_MISALIGN     "LTF_MISALIGN"

C308: #define ABORT_UPSTREAM_UNREADY "UPSTREAM_UNREADY"

C309: #define ABORT_SESSION_LIMIT    "SESSION_LIMIT"

C310: #define ABORT_SESSION_CLOSED   "SESSION_CLOSED"

C311: #define ABORT_LOT_TOO_SMALL    "LOT_TOO_SMALL"

C312: #define ABORT_CONCURRENCY      "CONCURRENCY_LIMIT"

C313: //--- [S1-DEMO-GUARD-001] demo-guard abort reasons (Luna V128 clearance; run on token+word).

C314: #define ABORT_DEMO_GUARD       "DEMO_GUARD"

C315: #define ABORT_BELOW_STOPS      "BELOW_STOPS"

C316: //--- TASK 21 (EA-21): S5_NO_SL_REF and S5_NO_TP_TARGET previously aborted

C317: //--- with reason=TP_RR_FAIL, which misattributes the cause in the journal.

C318: //--- These two codes are diagnostic only Ã¢â‚¬â€ no gate reads a reason string.

C319: #define ABORT_NO_SL_REF        "NO_SL_REF"

C320: #define ABORT_NO_TP_TARGET     "NO_TP_TARGET"

C321: //--- [Task 78] Part A Step 8 / D-3 / G-2 replacement. Diagnostic string only;

C322: //--- no gate reads an abort reason.

C323: #define ABORT_POI_REPLACED     "POI_REPLACED"

C324: #define ABORT_DIV_FALLBACK     "DIV_FALLBACK"

C7099:    //--- Reuses ABORT_LTF_MISALIGN and adds no new reason code. Task 76 removed

C7100:    //--- the only other site that emitted it, so the string is now unambiguous:

C7101:    //--- every LTF_MISALIGN abort is a post-S2 invariant failure. It is NOT the

C7102:    //--- same population as the pre-Task-76 count and must not be compared to it.

C1728: void LogAbort(const string reason, ENUM_SRJ_STATE atState)

C1729:   {

C1730:    PrintFormat("[SRJ-EA] %s ABORT reason=%s state=%s poi=%s dir=%s",

C1731:                TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),

C1732:                reason, StateName(atState), AnchorStr(), DirName(g_dir));

C1733:   }



hits=1: PN	0	17:54:17.827	Core 04	2026.06.05 09:45:00   [SRJ-EA] ORDER fields=10 bar=1 barTime=2026.06.05 09:40 seqBias=-1 seqS5=86 biasAtGate=1 biasOpposedAtGate=0 flipNewThisBar=0 gateOutcome=PASS seqStamp=SEQ_UNSTAMPED seqCause=S4S5_NOBIAS

hits=1: HJ	0	17:50:31.999	Core 04	2026.06.04 16:20:00   [SRJ-EA] ORDER fields=10 bar=1 barTime=2026.06.04 16:15 seqBias=-1 seqS5=82 biasAtGate=2 biasOpposedAtGate=1 flipNewThisBar=1 gateOutcome=PASS seqStamp=SEQ_UNSTAMPED seqCause=S4S5_NOBIAS

hits=1: RE	0	17:58:40.280	Core 04	2026.06.08 09:35:01   [SRJ-EA] ORDER fields=10 bar=1 barTime=2026.06.08 09:30 seqBias=-1 seqS5=97 biasAtGate=3 biasOpposedAtGate=1 flipNewThisBar=1 gateOutcome=PASS seqStamp=SEQ_UNSTAMPED seqCause=S4S5_NOBIAS

hits=1: RF	0	17:44:37.998	Core 04	2026.06.03 09:10:00   [SRJ-EA] ORDER fields=10 bar=1 barTime=2026.06.03 09:05 seqBias=42 seqS5=43 biasAtGate=1 biasOpposedAtGate=0 flipNewThisBar=0 gateOutcome=PASS seqStamp=STAMPED seqCause=-

hits=1: CM	0	17:54:17.827	Core 04	2026.06.05 09:45:00   [SRJ-EA] CONFIRM_PREBIND_S2 bar=2026.06.05 09:40 dir=SHORT poi=Daily-POC seedbar=2026.06.05 09:35

hits=1: KS	0	17:54:17.827	Core 04	2026.06.05 09:45:00   [SRJ-EA] ALERT SRJ SIGNAL SHORT USDJPY M5 | Daily-POC | LONDON | R=2.04 SL 159.972 TP 159.899 spr=3

hits=1: HS	0	17:54:17.827	Core 04	2026.06.05 09:45:00   [SRJ-EA] EXECUTED fill=159.948 slPts=24 tpPts=49 R_executed=2.04 R_logged_at_signal=2.04 delta=0.00

hits=1: GJ	0	17:55:24.965	Core 04	2026.06.05 16:10:00   [SRJ-EA] CONFIRM_PREBIND_FAIL bar=2026.06.05 16:05 dir=LONG term=B_BODY

hits=1: GG	0	17:50:31.999	Core 04	2026.06.04 16:20:00   [SRJ-EA] CONFIRM_PREBIND_S2 bar=2026.06.04 16:15 dir=SHORT poi=Daily-POC seedbar=2026.06.04 16:00

hits=1: OD	0	17:55:24.965	Core 04	2026.06.05 16:10:00   [SRJ-EA] TPFALLBACK bar=2026.06.05 16:05 dir=LONG tp=160.028 distPts=20

hits=1: IS	0	17:55:37.173	Core 04	2026.06.05 16:55:00   [SRJ-EA] TP_RR_FAIL_LATCH bar=2026.06.05 16:50 dir=LONG entry=160.115 sl=159.726 tp=160.262 R=0.38

hits=1: MH	0	17:44:37.998	Core 04	2026.06.03 09:10:00   [SRJ-EA] EXECUTED fill=159.932 slPts=43 tpPts=51 R_executed=1.19 R_logged_at_signal=1.35 delta=-0.16

hits=1: KK	0	17:44:37.998	Core 04	2026.06.03 09:10:00   [SRJ-EA] ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-VWAP | LONDON | R=1.35 SL 159.889 TP 159.983 spr=3

hits=1: LO	0	17:54:17.827	Core 04	2026.06.05 09:45:00   [SRJ-EA] RETESTDIAG bar=2026.06.05 09:40 inside=- nearAbove=Daily-POC:4.0pts nearBelow=-:-pts

hits=1: FR	0	17:44:37.998	Core 04	2026.06.03 09:10:00   [SRJ-EA] RETESTDIAG bar=2026.06.03 09:05 inside=Daily-VWAP nearAbove=-:-pts nearBelow=Daily-POC:20.0pts

hits=1: EJ	0	17:58:40.280	Core 04	2026.06.08 09:35:01   [SRJ-EA] CONFIRM_PREBIND_S2 bar=2026.06.08 09:30 dir=SHORT poi=Weekly-POC seedbar=2026.06.08 09:25

hits=1: PS	0	17:58:40.280	Core 04	2026.06.08 09:35:01   [SRJ-EA] ALERT SRJ SIGNAL SHORT USDJPY M5 | Weekly-POC | LONDON | R=3.47 SL 160.353 TP 160.089 spr=4

hits=1: DN	0	18:12:42.561	Core 04	2026.06.11 15:20:00   [SRJ-EA] A2_WAIVED_POC bar=2026.06.11 15:15 dir=LONG

hits=1: QL	0	17:46:27.860	Core 04	2026.06.03 18:40:00   [SRJ-EA] A2_WAIVED_POC bar=2026.06.03 18:35 dir=LONG

hits=1: JO	0	17:54:17.827	Core 04	2026.06.05 09:40:00   [SRJ-EA] SIDE1T_SEEDBIAS bar=2026.06.05 09:35 dir=SHORT biasAligned=0 verdict=REJECT-BIAS-TIMING

hits=1: PM	0	17:50:25.895	Core 04	2026.06.04 16:05:01   [SRJ-EA] SIDE1T_SEEDBIAS bar=2026.06.04 16:00 dir=SHORT biasAligned=0 verdict=REJECT-BIAS-TIMING

hits=1: IR	0	17:58:40.280	Core 04	2026.06.08 09:30:00   [SRJ-EA] SIDE1T_SEEDBIAS bar=2026.06.08 09:25 dir=SHORT biasAligned=0 verdict=REJECT-BIAS-TIMING

hits=1: NH	0	17:44:37.998	Core 04	2026.06.03 09:05:05   [SRJ-EA] SIDE1T_SEEDBIAS bar=2026.06.03 09:00 dir=LONG biasAligned=1 verdict=CONSIDER

hits=1: GJ	0	17:46:27.860	Core 04	2026.06.03 18:40:00   [SRJ-EA] TP_RR_FAIL_LATCH bar=2026.06.03 18:35 dir=LONG entry=159.984 sl=159.945 tp=159.995 R=0.28

hits=1: GM	0	17:44:50.204	Core 04	2026.06.03 10:00:00   [SRJ-EA] MTEXIT bar=2026.06.03 09:55 reason=TP_TOUCH line=- lineVal=- entry=159.929 exit=159.983

hits=1: HF	0	17:50:31.999	Core 04	2026.06.04 16:20:00   [SRJ-EA] A2_WAIVED_POC bar=2026.06.04 16:15 dir=SHORT

hits=2 pair: EQ	0	17:55:24.965	Core 04	2026.06.05 16:05:00   [SRJ-EA] A2_WAIVED_POC bar=2026.06.05 16:00 dir=SHORT

hits=2 pair: GK	0	17:55:24.965	Core 04	2026.06.05 16:05:00   [SRJ-EA] A2_WAIVED_POC bar=2026.06.05 16:00 dir=SHORT
