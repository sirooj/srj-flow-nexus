import pathlib
p = pathlib.Path('SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_VERDICTS_OPUS.md')
data = p.read_bytes()
text = data.decode('utf-8')
assert text.count('V281-USDJPY-GUARDS OPEN OPUS') == 0, 'V281 OPEN already present'
assert text.count('V281-USDJPY-GUARDS END OPUS') == 0, 'V281 END already present'
tail_marker = '## V274-USDJPY-CLEAR1 END OPUS (verbatim close; filed whole 1x this turn, novel inbound)'
assert data.endswith((tail_marker + '\r\n').encode('utf-8')), 'EOF tail mismatch'
body = r'''## V281-USDJPY-GUARDS OPEN OPUS (verbatim open; filed whole 1x this turn, novel inbound)
# RELAY v281 — VERDICT on PACKET_P-USDJPY-2 v1

Scope acknowledged: page-only ruling. No build, no run, no commit, no money move, no key handling, no disk-genuineness claim. Digests/counts above are taken as your machine's truth, not re-derived here.

---

## Q1 (E6a flip gate) — **DISCREPANCY**

Three sub-claims, different answers.

**(a) "ORDER census newness predicate verbatim" — YES.** Term-for-term match:

| new | census |
|---|---|
| P068 `antiNow=-1, antiPrev=-1` | C5119 |
| P069 `want = (LONG)?1:-1` | C5117 |
| P071 triple read at `barShift` | C5120 |
| P073-P076 counting `== -want` | C5122-C5125 |
| P078-P085 prior bar at `barShift+1` | C5127-C5134 |
| P086 `antiNow>=2 && antiPrev>=0 && antiPrev<2` | C5135 |

`bool` vs `int` return is the only difference; semantics identical.

**(b) "correct reading of his S3.3 flip-kill" — DISCREPANCY.** P010 records S3.3 Step 2 as a **5m flip** against the locked direction. E6a tests **HTF leg census** (P071/P079, FL_BUF_HTF_HIGH/MID/LOW). Those are different signals on different timeframes. The substitution is forced, and the packet does not say so: the E4b branch is entered from `!aligned` (P064), so the 5m/LTF bias is *already* opposed on every E4b promotion by construction — a literal 5m-flip gate would kill the entire E4b path including A1, which his CONFIRM-ONCE ruling preserves (P012). So the HTF census is a **proxy chosen because it separates the three ruled rows**, not a reading of S3.3. That is defensible engineering; calling it "his S3.3 rule" in the code comment (P067) and rule text (P018) is a substitution presented as a citation. Amend the wording, keep the mechanism.

The row evidence for the proxy is real and I credit it: at the confirm bars the census already printed `flipNewThisBar=1` for 6/04 16:15 (`biasAtGate=2`) and 6/08 09:30 (`biasAtGate=3`), and `0` for A1 6/05 09:40 (`biasAtGate=1`) and A4 6/03 09:05. Same `barShift` (all rows `bar=1`), same pass, same reads — E6a will reproduce that split. B1/B2/B3 hold for E6a on the page.

**(c) "S2WAIT-retain is the right disposition" — NO.** This is the material defect of the packet.

The newness predicate **self-clears on the next bar**. Block at bar N with `antiNow>=2, antiPrev<2`; the candidate is retained at S2 (P114 `return`, no state change, no invalidation). At bar N+1 `antiPrev` is now `>=2`, so P086 is false — and the promotion is permitted **with the HTF opposition still fully standing**. 6/08 is the worst case: `biasAtGate=3`. Three legs opposed, blocked once, then waved through.

So E6a is not a kill, it is a one-bar deferral conditional on a fresh confirmation candle. S3.3 as recorded at P010 says the flip **kills**. Retain is not that. Correct dispositions, either of:
- kill the candidate (invalidate at S2, per "kills"), or
- gate on **standing** opposition rather than newness, so retain is harmless because the block persists while the opposition does.

The second is cheap and already has a name in your own code: `oOpp` / `biasOpposedAtGate` at C5141 (`antiNow>=2`). See Analytic B, item 1.

Acceptance cannot catch this: B1 (P143) and B2 (P144) test only "NO SIGNAL at 16:20" and "NO SIGNAL at 09:35". Both pass while the ruled violation reappears at 16:25 / 09:40.

---

## Q2 (E6b POI-break guard) — **DISCREPANCY**; E4b-only scope — **YES, acceptable**

**Correct as read:**
- Walk range. P089-P092 walks `barShift+1 .. seedShift` inclusive, i.e. bars strictly newer than seed excluded at the far end, confirm bar excluded at the near end. Excluded? bars strictly newer than seed excluded at the far end — wait, `barShift+1 .. seedShift` INCLUDES seedShift and everything between; confirm bar (barShift) excluded. The parenthetical is slightly garbled but the verdict's meaning (confirm excluded, seed included) matches the code. Confirm bar excluded at the near end. Excluding the confirm bar is right: for a SHORT the against-direction test is `crossUp` (P101), and the confirm bar's own close beyond the POI is the confirmation, not a break.
- `iBarShift` failure. P089 returning `-1` fails `> barShift` at P090, so the walk is skipped and no gate fires. "Unreadable seed = no gate" is implemented, though only incidentally by the comparison — there is no explicit check.
- `seedShift == barShift` (confirm on the seed bar) correctly yields no walk: nothing intervening.
- Per-bar skip on EMPTY/zero (P095, P098) is implemented as stated.

**Correct as read:** (repeated header in his paste - filed as received)
- Walk range. P089-P092 walks `barShift+1 .. seedShift` inclusive, i.e. bars strictly newer than seed excluded at the far end, confirm bar excluded at the near end. Excluded? bars strictly newer than seed excluded at the far end — wait, `barShift+1 .. seedShift` INCLUDES seedShift and everything between; confirm bar (barShift) excluded. The parenthetical is slightly garbled but the verdict's meaning (confirm excluded, seed included) matches the code. Confirm bar excluded at the near end. Excluding the confirm bar is right: for a SHORT the against-direction test is `crossUp` (P101), and the confirm bar's own close beyond the POI is the confirmation, not a break.
- `iBarShift` failure. P089 returning `-1` fails `> barShift` at P090, so the walk is skipped and no gate fires. "Unreadable seed = no gate" is implemented, though only incidentally by the comparison — there is no explicit check.
- `seedShift == barShift` (confirm on the seed bar) correctly yields no walk: nothing intervening.
- Per-bar skip on EMPTY/zero (P095, P098) is implemented as stated.

**Discrepancies:**

1. **The "behind gate" is dead logic.** P099 LONG: `behind = (v <= o)`. P100 `crossDn = (o >= v && c < v)` — its first term is the same condition. SHORT mirrors exactly: P099 `behind = (v >= o)`, P101 `crossUp = (o <= v && c > v)`. So `behind && against` ≡ `against` in both directions, and P103 is unchanged if P099 is deleted. There is no independent behind gate. This directly voids disclosure (3): the "per-bar open-relative side, not a latched side" describes a term with no effect on the outcome. Either drop P099 or make the side real (latched at arming / at the seed bar) — but the latter changes behavior and needs re-argument.

2. **Prose vs code on seed inclusivity.** Your change sentence says "body cross **between** seed and confirm bars"; P092 walks `<= seedShift`, **including** the seed bar. For 6/04 that means 16:10, 16:05, 16:00 are all tested. Small, but it is exactly the drift this relay exists to catch — pick one and make P019 and the brief agree.

3. **Seed walk is unbounded and unsanitized.** P089 uses `iBarShift` with default `exact=false` and there is no `g_anchorBarTime > 0` check and no lookback cap. If the anchor time is ever unset/zero, `iBarShift` resolves to the oldest available bar and P092 walks the entire history against a POI buffer, fail-open in the wrong direction (a spurious `pobreak=1` anywhere in history kills the promotion). Add `g_anchorBarTime>0` and a bound at P089-P092.

4. **The only E6b evidence instance has no predicted outcome.** Per P009, 6/08 is the flip case ("killed by post-retest flip") and 6/04 is the body-break case ("voided by pre-confirmation-close POI body-break"). So E6b's motivating row count is **one**, and B1 (P143) records it as "pobreak per walk" — unfalsifiable. B2 (P144) does not mention pobreak. E6a alone satisfies B1 and B2. **E6b ships with zero predicted-positive acceptance.** That is a shipping-blind guard on a critical-severity finding.

5. **B3's E6b-clean claim is not carried by the cited row.** A1: seed 09:35, confirm 09:40, so the walk tests exactly one bar — 09:35. P014 offers the **09:40-bar** RETESTDIAG (`nearAbove=Daily-POC:4.0pts`) as proof of "no break 09:35->09:40". That row states the confirm bar's proximity, not the 09:35 bar's open/close against the Daily-POC, which is what P099-P103 actually evaluate. A1 preservation under E6b is asserted, not proved on the page. (A1 preservation under E6a *is* proved: `biasAtGate=1`.)

6. **Historical POI semantics are assumed.** P095 reads the POI buffer at past shifts. Whether that value is the level in force **at that bar** or the current level plotted back is not established on the page; P138's precedent establishes the call pattern (`ReadBuf1` on the POI handle at the walker site), not the historical semantics. Related: if seed and confirm straddle a daily rollover, a Daily-POC value changes across the walk and the bodies are compared against different levels — anchor identity drift. Out of scope for this packet (refinement) but noted as residue.

7. **Zero as the OHLC error sentinel.** P098 `e6b_o == 0.0 || e6b_c == 0.0` conflates "iOpen/iClose errored" with "price is zero". Safe for USDJPY/EURUSD, not portable. A rates read with a returned-count check is the correct form.

8. **`crossUp`/`crossDn` both computed, one used** (P100-P102). Harmless; note only because the packet and Q2 say "both directions," which means both *candidate* directions, not both crossings. Worth precision in P019.

**E4b-only scope — YES.** Both ruled instances rode E4b (P011), the refinement-phase order is his (P009, P022-P024), and the parking is explicit (P019). Accepted with one thing on the record: per P013 there is **no pre-confirmation POI guard anywhere in the EA** (PRECONFIRM/BEHIND_BROKEN/POI_SIDE, 0 hits), while the S3/S4 paths *do* face an LTF-flip analogue at C7119-C7130. So after this round the S3.3-flavored hole is partly covered on S3/S4 and the **S5.4 hole is uncovered on every path except E4b**. B4/B5 (P146-P147) pass by construction on untouched paths and cannot detect it. "S4/S3 identical" is a parity check, not evidence of cleanliness — do not let it read as one in the grade.

---

## Analytic ask A — defects, gaps, imprecisions

**Arithmetic and assembly (clean):**

- A1. Old block P031-P057 matches disk C8086-C8112 line for line, 27 lines. ✓
- A2. New block P059-P134 = 76 lines; insert P067-P115 = 49 lines; NET +49; 11552+49 = 11601 (P139). All check. ✓
- A3. No new inputs, buffers, abort codes, counters, or call-site classes (P059-P134 vs P005). ✓ Print-name E4B_GUARD not verifiable here (P138).

**Logic:**

- A4. **One-bar self-clearing gate** (P086, P114). Detailed in Q1(c). Headline defect.
- A5. **Timeframe substitution** (P010 "5m flip" vs P067/P071/P079 HTF legs). Detailed in Q1(b).
- A6. **Dead behind gate** (P099 subsumed by P100/P101). Voids disclosure (3).
- A7. **Fail-open with no trace.** Both guards fail open (P071/P079 unreadable → `antiNow/antiPrev = -1` → P086 false; P090 no walk; P095/P098 `continue`). The E4B_GUARD print exists **only inside the fire branch** (P106-P115). A promotion that proceeded because a read failed is byte-identical in the journal to a promotion that proceeded because the bars were clean. You cannot grade gate coverage, and B3/B7 cannot distinguish "gate evaluated, clean" from "gate never evaluated". This is the single cheapest thing to fix and it makes every other acceptance line stronger.
- A8. **Retain print is duplicated, not fallen into.** P018/P019 say the block "falls into the existing S2WAIT retain"; P114's text reads "LTF bias unaligned, candidate RETAINED (Stage 3a)" — the cause of *this* retain is the guard, not the LTF bias. Readable only in conjunction with the preceding E4B_GUARD row.
- A9. **Guard-kill rows are mislabeled in the journal.** P114's text reads "LTF bias unaligned, candidate RETAINED (Stage 3a)" — the cause of *this* retain is the guard, not the LTF bias. Readable only in conjunction with the preceding E4B_GUARD row.
- A10. **Guards run on bars with no promotion to block.** E6a/E6b are evaluated at P068-P105, before `IsConfirmationCandle` at P117. On any retained-S2 unaligned bar with no confirm candle, a fired guard prints E4B_GUARD and returns — a "blocked promotion" row where no promotion was pending. This inflates kill-row counts and directly undercuts B7's attribution rule ("each killed take carries its E4B_GUARD row", P149): the converse will not hold. It also runs the POI walk on every unaligned retain bar for no reason.
- A11. **Unbounded/unsanitized seed walk** (P089-P092). See Q2 item 3.
- A12. **`seedShift < barShift` is silent.** P090 skips with no anomaly print; if the anchor is ever re-seeded forward, the guard vanishes without a trace.
- A13. **Breaking bar is not reported.** P103 breaks on first hit; P109-P113 print `pobreak=1` only. On a critical entry-logic guard, the breaking bar's time, anchor value, open and close *are* the evidence. Without them B1's "pobreak per walk" cannot be adjudicated even after the run.
- A14. **`g_anchorBarTime` stability across retained S2 bars** is assumed, not stated (P089 vs P050/P127). If the anchor re-seeds while retained, the walk's far end moves between bars and the guard's coverage window changes silently.
- A15. **Disclosure (1) is materially incomplete** (P018, disclosure 1). The class that still promotes is not "never-aligned"; it is "fewer than 2 opposing legs now **OR** already ≥2 opposing on the prior bar". A1 is preserved because `biasAtGate=1`, not because it was never aligned. The second sub-class — standing maximal opposition — is not the A1 shape, is not covered by CONFIRM-ONCE, and includes the 6/04 and 6/08 shapes one bar later. As written the disclosure reads as "only the ruled class is blocked"; the code blocks only the *transition* into the ruled class.
- A16. **B1/B2 are one-bar-scoped** (P143-P144). They cannot detect A4. They need a window assertion: no SIGNAL on that candidate for the remainder of its S2 retention, or explicit invalidation.
- A17. **B1 does not predict pobreak; B2 does not mention it** (P143-P144). Only E6b evidence instance left unpredicted — see Q2 item 4.
- A18. **P014's controls are mismatched.** A1's cited RETESTDIAG is the confirm bar, not the walked seed bar (Q2 item 5). A4 is an S4-path row and E6b is E4b-only, so A4's "S5.4-clean" control is irrelevant to this packet — over-claimed at P014/P146.
- A19. **B7 is internally inconsistent** (P149). "His TAKEN rows must still take (guard-kill on his row = REGRESSION halt)" forbids exactly what the guards exist to do; the same line then provides for attributing killed takes. If a EURUSD baseline take carries a genuine fresh flip or a genuine pre-confirmation body-break, killing it is the guard working, not a regression. P150 half-fixes this with "attributed-or-halted". Collapse to one rule: killed EU takes are adjudicated on row evidence against S3.3/S5.4, halt only on an unattributable kill.
- A20. **"A walk-away halt with cause also satisfies" (P143)** is loose enough to pass B1 without either guard firing. Name the admissible causes or drop it.
- A21. **Grading depends on `InpDebugLog`.** Guard control flow is unconditional (correct), but the *only* observable is debug-gated (P108, P114) and no counter is added (P005). Fine under P025/P138's pinned `InpDebugLog=true`; state it as a grading precondition rather than leaving it implicit.
- A22. **Pre-existing print misattribution now load-bearing.** The three E4b rows carry `seqStamp=SEQ_UNSTAMPED seqCause=S4S5_NOBIAS` (C5142-C5143). The cause string names an S4→S5 origin; the actual cause on these rows is the S2→S5 jump (P013). Out of scope to fix, named because your bypass proof leans on those rows and the label contradicts the claim it is being used to support.

---

## Analytic ask B — better mechanisms

1. **Gate on standing opposition, not newness** — closes A4 without new machinery. Replace the block condition at P086/P106 with the state boolean your code already defines: `oOpp` / `biasOpposedAtGate` = `antiNow >= 2` (C5141). Keep `flipNewThisBar` as a print field (its correct role, C5135/C5144). Checked against all four evidence rows: A1 `biasAtGate=1` → 0, promotes ✓; A4 `biasAtGate=1` → 0, untouched ✓; 6/04 `biasAtGate=2` → 1, killed ✓; 6/08 `biasAtGate=3` → 1, killed ✓. Strictly safer, passes every row the newness predicate passes, and makes S2WAIT-retain a sound disposition because the block persists while the opposition does. Cost: more EURUSD takes may die under B7, which is diagnostic, not a regression. Touches P068-P086, P106, P109-P113 (print both fields), P018, P143-P144, P149.

2. **Move both guards inside the confirm-true branch** — fixes A10 and B7's attribution, and removes the POI walk from every unaligned retain bar. Evaluate P068-P105 after `IsConfirmationCandle` succeeds at P117, before the state assignment at P121. Then a fired guard is by definition a blocked promotion, one-to-one with a would-be take.

3. **Unconditional census/walk diagnostic** — fixes A7 and unblocks B3/B7 auditing. Print one row per E4b promotion attempt with `antiNow`, `antiPrev`, `seedShift`, bars walked, and `poiReads`, whether or not the gate fires. Reuse the E4B_GUARD name with a `fired=` field, or add `E4B_GATEDIAG`. Touches P106-P115 plus one new print-name entry at P138.

4. **Report the breaking bar** — fixes A13. Carry `e6b_s`, `iTime(...,e6b_s)`, `e6b_v`, `e6b_o`, `e6b_c` out of the loop at P103 and into the print at P109-P113. Makes B1's pobreak leg adjudicable post-run.

5. **Sanitize and bound the seed resolution** — fixes A11/A12. At P089: require `g_anchorBarTime > 0`, use `iBarShift(..., true)` or validate the resolved time against `g_anchorBarTime`, cap `seedShift - barShift` at a stated maximum, and print an anomaly row on `seedShift < barShift` or cap-exceeded instead of silently skipping.

6. **Make the behind term real or delete it** — fixes A6/disclosure (3). Delete P099 (behavior-identical, one less line to defend), or latch the side once at the seed bar and test `behind` against that, which is a genuine gate and a genuine behavior change needing its own row evidence. Do not keep a no-op term described in a disclosure as if it were doing work.

7. **Record the insertion site for the parked S3/S4 extension** — the LTF invariant block at C7119-C7130 already runs for `ST_S3_ZONE_WAIT..ST_S5_GATE_CHECK`, already holds a `CheckLtfAlign` + `GoAbort`, and is exactly the block E4b bypasses (P013). Naming it now costs nothing and gives the parked item a single site instead of a re-survey next round. Note in P019/P024 only; no edit this round.

8. **Factor the retain print** — fixes A8/A9. One helper emitting the S2WAIT row with a cause argument (`LTF_UNALIGNED` / `E4B_GUARD`), called from both P114 and P130. Removes the duplicated literal and makes guard kills separable in the journal without a second grep.

---

## Rulings on the open disclosures

| # | Disclosure | Ruling |
|---|---|---|
| 1 | Never-aligned candidates still promote; only fresh flips block | **AMEND.** Materially incomplete. The pass-through class also includes standing ≥2-leg opposition, which is not the A1 shape and not covered by CONFIRM-ONCE. A1 survives because `biasAtGate=1`, not because it was never aligned. See A15, A4. |
| 2 | Unreadable reads = no gate, both guards | **AMEND.** The fail direction is arguable ("unprovable is not a break"), but the convention is being carried from a **print** site (C5136-C5146, harmless) to a **control** site (P106, not harmless), and no-gate promotions currently leave no journal trace. Acceptable only with Analytic-B item 3 attached, and the transfer itself wants his word rather than convention inheritance. |
| 3 | E6b behind gate uses per-bar open-relative side | **AMEND.** Describes a term with no effect on the outcome: P099 is subsumed by the first conjunct of P100/P101 in both directions. |
| 4 | E4b-only scope, S3/S4 at baseline by design | **ACCEPT**, with it on the record that S5.4 then has zero coverage on every path (P013) and that B4/B5 are parity checks which cannot detect that exposure. |

---

## Disposition

**AMEND.** Not clear.

Blocking before transport: **A4** (one-bar self-clearing gate — the packet does not deliver a kill), **A7** (fail-open with no trace), **A17** (E6b has no predicted-positive acceptance on its single motivating row), **A19** (B7 self-contradictory).

Correct and creditable as built: old-block fidelity to C8086-C8112, the +49 arithmetic, verbatim census reuse against C5117-C5135, the confirm-bar exclusion at P092, `iBarShift` failure falling to no-gate at P090, and the row-level discrimination proof — `flipNewThisBar=1` on both ruled instances, `0` on A1 and A4 — which does carry E6a's B1/B2/B3 claims on the page.

Everything above is a page ruling. Nothing here builds, runs, commits, spends, or clears live activation.
## V281-USDJPY-GUARDS END OPUS (verbatim close; filed whole 1x this turn, novel inbound)'''
assert "'''" not in body, 'triple-single-quote collision'
open_h = '## V281-USDJPY-GUARDS OPEN OPUS (verbatim open; filed whole 1x this turn, novel inbound)'
assert open_h in body, 'open header missing'
end_h = '## V281-USDJPY-GUARDS END OPUS (verbatim close; filed whole 1x this turn, novel inbound)'
assert body.count(open_h) == 1 and body.count(end_h) == 1, 'header count wrong'
block = (open_h + '\r\n' + body[len(open_h) + 1:] + '\r\n').replace('\n', '\r\n').replace('\r\r\n', '\r\n')
new_data = data + block.encode('utf-8')
p.write_bytes(new_data)
print('OPUS new bytes=', len(new_data))
print('V281open=', new_data.decode('utf-8').count('V281-USDJPY-GUARDS OPEN OPUS'))
print('V281end=', new_data.decode('utf-8').count('V281-USDJPY-GUARDS END OPUS'))
