# BUILDER RELAY TO COUNCIL v14 — packet P-SEL-1 for dual-key clearance

**Version:** v14. **Answers:** Astra-4 + Opus-v13-response (joint planning approval, no clearance yet) + operator answers on v13 prerequisites (Addendum 5).
**How to read this:** fresh session assumed — everything needed is below. Same text to both streams. This relay presents the COMPLETED packet for clearance BY NAME (Astra's condition). No build/run moves until both streams explicitly clear packet P-SEL-1. Either stream may halt instead.

---

## 1. Goal and rule (unchanged, operator-final)

EA reproduces and takes his exact trades: same side, entry bar, stop, target. His rule: stop EXACTLY two fractal swings away (chart triangle markers), no imbalance requirement, no walk; take iff R >= 1.0 unrounded; Dukascopy always. His consistency is not under examination — the failed walk diagnostic was a machinery mismatch (both streams agreed).

## 2. Reference table (frozen; EURUSD, 2026, M5, broker/server barTime as logged, 5dp)

| ID | Signal/entry bar | Side | Entry | Stop (status) | Target (status) |
|---|---|---|---|---|---|
| R1 | 10:00/10:05 Aug-28 | SHORT | 1.16466 HAND | 1.16508 @06:30 HAND | 1.16364 HAND-qual + exit 1.16464 scratch |
| R2 | 10:35/10:40 Sep-4 | SHORT | 1.16265 HAND | 1.16299 HAND-hypothetical ("if that was the entry, yes"); bar 09:30 CODE-side only | 1.16224 HAND (moot) — setup MUST-DECLINE, operator-ruled CQD-invalid |
| R3 | 15:55/16:00 Sep-4 | LONG | 1.16018 HAND | 1.15847 @15:30 HAND | 1.16302 HAND |
| R4 | 09:15/09:20 Sep-7 | LONG | 1.16135 HAND | 1.16098 @08:40 HAND | 1.16200 HAND |
| R5 | 16:40/16:45 Sep-7 | LONG | 1.16261 HAND | FILED 1.16239 @16:15 (authoritative target); retained 1.16238 @16:05 recorded as code-under-test, NOT a target | 1.16318 HAND |
| S1 | 10:10 Sep-8, no EA row | SHORT | 1.16205 HAND | 1.16258 HAND | 1.16102 HAND |
| S2 | 17:00 Sep-8, no EA row | SHORT | 1.16220 HAND | 1.16274 HAND | Y-POC price NOT STATED = gap, stays gap |

Desk facts carried in: R1 first swing 09:55 (operator; frozen row's skip-witness agrees), second 06:30; Sep-8 EA side LONG both bars (opposed); repo CQD UNCHANGED (`BE6FD84F…A421F`, verified) — his CQD update is chart-side.

## 3. Packet P-SEL-1 (print-only; adoption off; no selection change; no digest move)

- **E51 — isolated fractal-stop shadow.** Platform-Fractals-verbatim replication (equal-high/inside-bar handling as the terminal draws), both sides, every evaluation, old conservative branch live and printing alongside. ZERO calls into walk/origin/imbalance paths, not even for enumeration. No walk, imbalance filter, depth adjustment, per-example exception, numeric buffer, offset, or tolerance anywhere.
- **E52 — variant matrix (the frozen interpretation space).** Fractal definition settled (E51); dimensions: start-offset (entry bar itself vs first strictly prior) × counting-discipline (raw sequence vs monotone-outward) × confirmation (count only available-at-decision vs count incl. unconfirmed, availability-LABELED) × TF (M5 base vs H1 alternative, builder-proposed, amendable). Per variant, per R1–R5+S1/S2: (barTime, price, slot, availability). Confirmation-needing variants are printed but PRE-DECLARED INELIGIBLE for G1 (causality; stricter wins).
- **E53 — force-eval harness.** Stop function evaluable at any bar with no row/candidate (decouples stop validation from presence). Applied to R2/S1/S2.
- **E54 — pre-suppression presence probe.** At S1/S2, instrumented BEFORE rows can be suppressed: bar processed? SHORT generated? sides evaluated? candidate count + first exclusion point? structure/entry/target/side-state inputs? Absence traced to earliest observable cause; "no row" alone is not a diagnosis. Probe only — never forces trades into the set.
- **E55 — component census + R accounting.** Code side/entry/target vs his, all seven (S2 TP gap stays gap). Per mapped example: side, signal/entry bar, entry, target, stop, raw R, threshold result at R>=1.0 unrounded; inherited inputs labeled separately from newly validated ones.
- **E56 — window census + R2-decline read + isolation join.** All 481 baseline evaluations + pre-suppression opportunities: stop changes vs conservative, unavailable/invalid per conventions below, R shifts, both-directions 1.0-threshold crossings (his-rule-takes/code-declines AND reverse). R2 row: report each branch's take/decline — any take is an adoption-blocking finding for that branch (reported, not a halt). Isolation: adoption off verified before+after; selection outputs join vs RECON17 zero-mismatch or run rejected.

**Reporting conventions (no silent fallback to the old blend, ever):** FRACTAL_UNAVAILABLE (variant+example+why — fewer than two eligible fractals); AMBIGUOUS_IDENTITY (print all tied candidates, variant reports no-match there); INVALID_GEOMETRY (risk<=0 or uncomputable — print operands).

**Desk prediction (graded, not gated):** monotone-outward reproduces R1 at 06:30 (operator 09:55-first + frozen skip-witness). A wrong prediction changes nothing; G1 decides.

## 4. Gates (frozen; recorded verbatim in the result file)

- **G1 — primary, pass/fail.** At least one eligible variant reproduces stop barTime AND price exactly for all of R1/R3/R4/R5 (reshaped from 5/5: R2 is operator-invalid — Ask 1).
- **G2 — out-of-sample, REPORTED.** Winning variant force-evaluated at R2/S1/S2 reproduces stop prices. Not blocking G1; blocking any later adoption.
- **G3 — uniqueness.** Multiple G1 passers all reported, no winner declared; disagreements convert to operator yes/no bar+price questions.
- **G4 — census, REPORTED** (E56; descriptive, not operator agreement).
- **G5 — presence, REPORTED** (E54 complete traces or run fails this gate openly).
- **G6 — components, REPORTED** (E55; S2 TP gap stays gap).
- **Isolation gate:** adoption off before+after, digests unchanged, join clean — else run rejected as evidence, halt.
- **Failure gate:** no G1 passer → packet dead, no rerun, no tuning, return with relay.

**Result dispositions:** G1 pass + presence absent → stop-component pass, selection incomplete (do NOT shorten to "stops are solved"); + shadow Sep-8 signals appear → assess all seven on available references; fidelity/causality/exact-match fail → dead; isolation fail → halt. Nothing here pre-authorizes adoption (census lacks his labels for extra/missing window trades).

## 5. Asks

- **Ask 1:** Approve the reshape (G1 = 4/4 fired; R2 = must-decline anchor + stop-only evidence)? If no, council states the gate.
- **Ask 2 — CQD scoping:** approve desk-check of frozen CQD at R2's bar + in-run CQD-state print at the seven bars (free rider)? Is a separate repo-CQD fix packet needed? Builder touches no CQD file in P-SEL-1.
- **Ask 3:** H1 alternative + eval-close decision-point convention — amend or accept (builder-proposed, both amendable)?
- **Ask 4:** CLEAR named packet P-SEL-1 (E51–E56) for ONE print-only build + full-window run on the gates above? Both streams must name it; one halt stops it.
