# FINDING — transfer-vs-predicate fork on Stage-E birth (read-only, 2026-09-16)

## 1. Exhaustive path enumeration (current tree `7BFC7FA3`, code-read)

`g_dir` writers, complete (3 + decl): EA:956 decl · EA:6184 reset→NONE · EA:7429 transfer (`g_dir = t78_dir`) · EA:7617 seed (`S2ResolveLive`). NOTHING else writes direction. `DetectPoiRetest` call sites (4): EA:7370 (t78 transfer-eval) · EA:7541 (t73 print-only) · EA:7581 (sh shadow) · EA:7609 (main seed; the ONLY site that prints SIDE1T).

CONCLUSION: exactly ONE non-seed path can put SHORT at an S5 eval — the live t78 transfer (EA:7429). Sonnet-live's hypothesis (b) is a REAL path, not hypothetical.

## 2. The transfer fires on the S1 morning (RECON38 archive, verbatim)

```text
SIDE1C_PREEMPT bar=2026.09.08 09:30 from=Monthly-POC fromDir=LONG to=Weekly-POC toDir=SHORT state=S2_LTF_ALIGN
SIDE1C_PREEMPT bar=2026.09.08 09:50 from=Monthly-POC fromDir=LONG to=Weekly-POC toDir=SHORT state=S2_LTF_ALIGN
```

Same morning as the two LONG seeds (09:15, 09:45) and the 10:05 SHORT S5 eval. Directional + temporal consistency: LONG-seed → PREEMPT → SHORT-eval, via the settled-live RECON35 mechanism. The transfer is S2-bounded, tier-arbitration (S2+opp), NOT outcome-driven. Anchor-ID join (from/to POIs vs eval anchor) is the confirming step, owed at grade if council picks transfer-as-birth — stated open, not assumed.

## 3. Consequence for STAGE-E-BIRTH-001 (builder measures, council routes)

"No SHORT seed" (TRUE) ≠ "nothing births SHORT" (FALSE on the live path). The packet's anti-conversion sentence ("must not be converted into a SHORT merely because the later S5 evaluation is SHORT") now reads as the transfer question itself: the transfer converts on tier-arbitration, not on outcome — whether that is legitimate birth is MECHANISM LEGITIMACY, council's call. Two further knots, both council's: (a) his filed rule says the 09:15 LONG was INVALID at inception — does invalidity poison its transfer? (b) transfer fires mid-lifecycle (S2_LTF_ALIGN), while the packet sites birth at seed/setup — if a new predicate is still wanted, the transfer's role (stays/yields/goes) must be specified or two births race.

## 4. Window left-edge (item 1) answered

Sep-8 SIDE1T rows begin at 09:15 (full-day list: 09:15/09:45/14:00/15:15/16:30/16:45/17:05/17:25 — nothing 00:00–09:15). Left edge = first seed of the day = day bound (coincide, not fitted). Cross-midnight seeding excluded by session machinery (SESSION_CLOSED aborts + session-use guards, on record). The R5 105-min lag runs seed→later-eval (rightward), irrelevant leftward.

## 5. Relay-completeness defect OWNED (narrow)

The v98 relay framed "no SHORT seed → birth owed" without naming the settled-live transfer that produces SHORT evals (RECON35 on record). Load-bearing record fact omitted; repaired here, carried into v99 as reconcile-ask. No-band-aid now sharper: R 2.52 known-good AND the eval already delivered live — a new predicate must derive from his rules with the transfer's role specified, never fit to the answer.
