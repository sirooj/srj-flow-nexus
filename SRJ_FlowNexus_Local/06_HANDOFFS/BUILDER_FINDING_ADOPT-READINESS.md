# FINDING — pre-run spec-adherence audit (operator-ordered, read-only, no build/run)

**Tree audited:** EA `703C3B0A…05BB1` (514584 B, verified unchanged pre-audit). FlowLogic `3606BFB4…25911` unchanged. Method: code-read of the live decision path (not diagnostics), each item cited to `Experts\SRJ_FlowNexus_EA.mq5` line. His rules from `06_HANDOFFS\BUILDER_STATEMENT_FUNDAMENTAL_RULES.md` + spec Part A v4.2.

## Adheres (do not touch)

- **R gate:** take iff R ≥ 1.0, unrounded — EA:57 default `InpMinRewardRisk = 1.0`; EA:8376 compares raw doubles. MATCHES his flat-1.0 rule.
- **Setup independence:** either setup advances alone — EA:2144-2146 (BOTH/TREND/MEANREV; NONE retains the candidate at EA:6691-6692, never kills on a missing counterpart). MATCHES his no-cross-requirement rule.
- **Divergence latest-governs:** EA:5273-5300 walks back to the anchor, first nonzero verdict = latest, clears on opposing. Mapping LONG⇔{+1,+2} / SHORT⇔{−1,−2} (EA:5294-5295, EA:7478-7479) matches his 1/3-bull 2/4-bear taxonomy under the charter mapping. Residuals (not violations): charter mapping still to-be-verified from the CQD source; CQD-EMPTY semantics stays a design item.
- **Alert-only:** `OrderSend(` count = 0 in the EA. HOLDS.

## Violates (the fix list — this is why the old machine cannot take his trades)

- **Side ownership (structural):** his TF side = HTF bias. Code's ONLY side assignment, EA:6666, sets `g_dir` from the POI-retest detector (`pr.isLong`), via `S2ResolveLive`, which is a pass-through (EA:3839-3844). No HTF vote is read at the assignment site. This is the filed F3 defect, confirmed live — not a toggle, a wrong owner. Measured effect: LONG carried through both Sep-8 SHORT bars.
- **Stop branch (structural):** his rule = 1-away WITH imbalance, 2-away WITHOUT. Code branches on `obValid` alone (EA:4695 → 1SWING at EA:4731, else 2SWING at EA:5031); imbalance is never consulted in the branch. His wick nuance is absent from the live selector (wick carve lives in ladder/diagnostics only, EA:7771+). Measured effect: R5 tie-break keeps 16:05 against filed 16:15; R4 walks to 08:20, filed 08:40 absent.
- **Replace-not-sidecar (unexecuted order):** adoption switch `InpAdoptExt1=false` (EA:71); its only consumers (EA:5136/5228) are gated on it. The sidecar era his order ended is still the running reality.
- **Filed authoritative (consequence):** code emits its own stops (above), so filed levels lose every disagreement by construction.

## Answers to the order

1. **Does the current EA adhere to your latest rulings? NO — 4 adherences, 4 violations, all load-bearing on the violation side.** The adherences (R gate, independence, divergence latch, alert-only) are gates and filters; the violations (side owner, stop branch, adoption off) ARE the trade. A filter-passing candidate still gets the wrong side and the wrong stop.
2. **Could it match your trades? NO — by construction above and by measurement (G1 0/12; Sep-8 never-born; R4/R5).** A run of this tree spends your hour to re-prove it.
3. **On v34 (filed: Astra `GPT-V34-RUL-001` CLEAR + Opus `OPUS-V34-REVIEW-001` deliberate non-clearance): NO DUAL KEY — nothing builds or runs regardless.** Opus's three unblockers graded: (1) packet-inline — cheap, do it (its non-clearance is largely evidence-starvation, self-declared); (2) replacement semantic — REAL and confirmed by this audit: the approved ten contents approach the choice (A6) without making it, and the choice lives exactly at the two violation sites above (side owner EA:6666, branch EA:4695); council must resolve it before any build, or explicitly clear an exploratory build that halts at A6; (3) acceptance criterion — ALREADY ANSWERED on record (A5/O3 Amendment-4 bar), no action needed.
4. **Waste guard for the eventual hour:** the build must touch EA:6666 (side owner), EA:4695 (branch + wick nuance), EA:71/5136/5228 (adoption flip) — and must NOT touch the four adhering regions. Any cleared build whose diff strays outside the violation list, or rewrites an adhering gate, is a defect by this audit's terms.

**Locks unchanged:** RECON17 frozen; 703c3b0a uncommitted; no run authorized (no dual key + no run word); REPORT+HALT; nothing commits without token.
