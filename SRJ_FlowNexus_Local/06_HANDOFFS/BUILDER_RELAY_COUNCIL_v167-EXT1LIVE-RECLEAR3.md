CODE REVIEW REQUEST — v167 — 2026-09-18 (RE-CLEARANCE 2: packet v4 with Luna table plus Opus text fixes, one print-only probe build plus run; format v2)

Change (one plain sentence): clear PACKET_EXT1LIVE-001 v4 by name for exactly one print-only probe build plus one run under the envelope below so the ext1 table and the ordering questions are settled by output.

File / function / lines: no code change this relay; tree landed 3a932b9 (EA `6C2E4028` / 602894 B); packet v4 `01_TASKS\PACKET_EXT1LIVE-001.md` (40 lines, `434B2B85`, read back verified this turn — v3 plus the Luna precision table and the Opus text fixes below, code untouched). Envelope: one build plus one run, same ini and range (RECON44_DEMO_P1, InpMode 1, 08-26 to 09-09), ceiling 90 minutes; STAGE-1 pre-hash plus exact-diff plus parity plus 0/0 compile gates; print volume bounded by one STOPRESOLVE line per S5 evaluation (thousands of lines max against multi-megabyte journal capacity). Run word asked only after a clear lands — nothing is spent by this relay.

Clearable body (packet v4 sections 1 through 5, byte-exact twin of the filed packet; relay lines numbered P001 onward for citation):
P001: # PACKET_EXT1LIVE-001 v4 — live the ext1 stop (print-only probe; v1 authored rule; v2 folded clearance amends; v3 fixed changed-set; v4 folds the Luna table plus Opus A0-A15 from v166 answers, code untouched)
P002: 
P003: Status: AUTHORED-unbuilt. Nothing builds or runs on this file. Clearance + fresh word come only via relay.
P004: 
P005: ## 1. Rule (transcribed from the two authored texts, which converge)
P006: 
P007: At the live-stop select site (EA L9661-L9666), when the current candidate's S5 ext1 read is defined, select that read's price (slExt1) as slRef, replacing the existing s0-first/s1-second selection. Use the same candidate-local ext1 definition and provenance that supply SLEXT481; do not substitute a previous candidate's read or a subsequently reconstructed value. No positive-imbalance requirement applies: ext1Imb=0 does not disqualify a defined ext1. Degenerate-case visibility (not a behavior guard): the probe prints extSideOk, extDistPts, and the raw R numerator/denominator so a favorable-side or at-entry ext1 is visible rather than inferred; the validity-guard choice itself stays deferred to the live-activation relay.
P008: 
P009: Replacement semantics: replace the selection decision at L9661-L9665; retain the enclosing scope closure at L9666. Line map: L9661 select-init, L9662 s0 gate, L9663 s1 gate, L9664 s0 write, L9665 s1 write — all five replaced by the ext1-adopt write; L9666 closure retained untouched. No second overwrite exists downstream of the new write before the R-gate: Region W overwrite was the replaced site, so ext1-sourced stops flow to the gate unmodified. The selected ext1 feeds the effective stop through the existing chain (Region W overwrite L9664, R-gate test L9670, veto E1d, latch g_latchedSl at L9910, SIGNAL, session mark post-SIGNAL at L10073/L10170) with resolution-then-veto order unchanged.
P010: 
P011: Ext1-undefined fallback: retain the existing selector exactly (s0 when slot valid and imbalance positive, else s1 when slot valid, else incoming slRef unchanged). Imbalance is the integer flow-read count; positive means greater than zero (the L9662 gate). No other stop source; no carry-forward of an earlier ext1.
P012: 
P013: Standing rule, not an exception: SESSION_LIMIT and L7682-L7697 unchanged; veto order unchanged; A3/16:25/A2 declines preserved; no-band-aid rule holds. This is not a Sept-8, A3, manual-decline, session-release, or follow-on-birth exception.
P014: 
P015: ## 2. Must-reproduce-or-explain table (fixed entry/TP operands; R builder-computed)
P016: 
P017: | Bar | Entry/TP | ext1 stop | Predicted R |
P018: |---|---|---|---|
P019: | 08-28 10:00 SHORT | 1.16466 / 1.16322 | 1.16508 | 3.43 unchanged |
P020: | 08-28 16:20 SHORT (A1 declined) | 1.16430 / 1.16322 | 1.16508 | 1.38, passes R-gate; decline unchanged; no outcome delta |
P021: | 09-04 15:55 LONG | 1.16018 / 1.16315 | 1.15847 | 1.74 unchanged |
P022: | 09-07 09:15 LONG | 1.16135 / 1.16315 | 1.16098 | 4.86 unchanged |
P023: | 09-07 16:40 LONG | 1.16261 / 1.16315 | 1.16238 | 2.35 unchanged |
P024: | 09-08 10:05 SHORT | 1.16205 / 1.16072 | 1.16258 | 2.51 unchanged |
P025: | 09-08 16:40 SHORT (A3 declined) | 1.16213 / 1.16114 | 1.16359 | 0.68 R-gate kill, no fire |
P026: | 09-04 10:35 SHORT (A2 declined) | entry unprinted, vetoed pre-latch | 1.16299 | veto refuses regardless; graded on printed rExt1/slExt1/slot only, no independent R recompute |
P027: 
P028: R-gate constant 1.0 (EA L57 compiled default, no run-ini override) sits inside the required (0.68, 1.38] band. Row-to-signal key: the seven TP_ELECT fire rows are the seven current signals (A1 and A3 fire-but-declined among them); the A2 row is declined-and-evaluated (baseline fire, current silent); DH STOPREF is the seed-bar instrument evaluation of the A2 bar, not a signal. Gate comparator is greater-than-or-equal (code L9670); display band is plus-or-minus 0.01 R while gate decisions use unrounded raw division. A2's veto refusal is order-specific to this window (veto site precedes latch with the R-gate passing first here), never a general claim about evaluation order. Sentinel convention, A2 row exemplar: -999 means no filed comparator on record (absent, not zero); '-' means field not applicable; 0 means computed zero. Evidence provenance: rows come from the FRESHVETO-V1 archive 8B2ED676 (landed tree) unless labeled BASE, which come from FAMILYPASS-V4 736C24E8. Reduction evidence: A2 ext1Slot 13 equals s1slot 13, plus A1 ext1Slot 118 and A3 ext1Slot 91 ext1 reads pulled pre-run; price coincidence retired. Changed set under this rule: the s0-branch bars are 10:35 (A2/DH seed), 08-28 16:20 (A1), and 09-08 16:40 (A3) per SHADOW sel rows — all three already declined; the predicted stop-price changes also include A1's stated 5-point move (1.48 to 1.38, survives). Confirm the actual changed set from per-row slLive/pxExt1 prints. Five other fires identical because live stop already equals s1px there. Emergent reading named: where ext1 equals s1 the rule reduces to removing the s0 branch for defined-ext1 bars — the section 3 slot prints resolve it per row.
P029: 
P030: ## 3. Probe form (print-only; v2 names the insertion line and extends the print list)
P031: 
P032: Probe block sits post-L9664 and pre-L9670 (after the live overwrite, before the R-gate test), so it reads slLive post-overwrite. Compute with probe-local values using the current candidate's SLEXT481 provenance tied to ladOriginPx, ladOriginBarTime, ladOriginSite printed at the site; leave live slRef, gate decisions, veto, latch, SIGNAL and accounting untouched. slLive and rLive are actual-path values; pxExt1 and rExt1 are counterfactual shadow values; wouldGate means rExt1 greater-than-or-equal gateConst; vetoStateAtSite and sessionUseAtSite name state at the site, never downstream outcomes. Use the existing R builder unchanged, preserving its invalid and zero-denominator behavior. First pass emits one STOPRESOLVE fields=26 record per S5 evaluation: barTime, dir, entryPx, tpPx, incomingSlRef, liveSel, slLive, pxExt1, ext1Defined, rLive, rExt1, gateConst, wouldGate, vetoStateAtSite, sessionUseAtSite, ext1Slot, ext1BarTime, s0slot, s0imb, s1slot, s1imb, extSideOk, extDistPts, rawNum, rawDen, wouldAdopt_monotone. No assignment to the live path. AdoptOff held, OrderSend 0. Live activation only via later dual-key plus tokens.
P033: 
P034: ## 4. Acceptance (grade lines)
P035: 
P036: Actual-path baseline remains 7 signals; the actual-path A3 diagnostic remains R=1.62. Under the print-only ext1 shadow, A3 must compute rExt1=0.68 and wouldGate=0. A2 remains silent on the actual path. Actual-path downstream rows are not evidence of the shadow outcome. Table Rs reproduce within plus-or-minus 0.01 or explain per row; run prints gateConst (must read 1.0) and the session-mark site reached (post-SIGNAL only); 16:55 seed print present and declined at SESSION_LIMIT with the L7682 site named; 17:00 S5 eval expected absent in print-only form — if a 17:00 S5 eval prints, halt and report operands. Report actual presence/absence; print operands if evaluated. Absence attributable to the unchanged live path is not evidence against the shadow rule. Counterfactual seed/window recovery remains unproved and requires separately authorized testing. 7 signals unchanged, A3 still present at R=1.62, A2 silence, silent days, VETOCLEAR behavior unchanged in kind; establish downstream outcomes from existing actual-path diagnostics in the same run (VETOCLEAR, SESSION_LIMIT, TP_ELECT, SIGNAL rows — the live path still prints all of them); if those cannot establish an outcome, report unproved and halt, never widen the probe-only delta; expected stage order is stop resolution, then R-gate, then veto, then latch, then SIGNAL, then session mark; isolation: EA-line delta is the probe block only. A miss on any line halts with operands (no tuning, no rerun). Diagnostic-only defect path: a defect confined to probe emission (absent or malformed field, format error) with EA-line delta still probe-only and diff re-verified permits one re-emit under the same envelope; anything touching the live path does not.
P037: 
P038: ## 5. Carried alternative (not in scope unless council rules it in)
P039: 
P040: Opus monotone-adverse-only adoption (adopt ext1 only when strictly more adverse). Omitted: on this window it reproduces the table identically and adds an unconstrained future-bars divergence. The probe prints wouldAdopt_monotone per S5 evaluation (1 where ext1 is strictly more adverse than incumbent), settling the alternative from the same run. Council may amend-with-delta to include it; builder invents nothing.

Pre-run evidence (machine-pulled this turn — Opus B4; reduction claim now three rows deep on slot-anchored reads):
BASE: [SRJ-EA] SLEXT481 fields=17 bar=2026.08.28 16:20 site=S5 dir=SHORT ladOriginPx=1.16430 ladOriginBarTime=2026.08.28 16:25 ladOriginSite=S5 ext1Defined=1 slExt1=1.16508 ext1Slot=118 ext1BarTime=2026.08.28 06:30 ext1Imb=0 deepestExt=27 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
BASE: [SRJ-EA] SLEXT481 fields=17 bar=2026.09.08 16:40 site=S5 dir=SHORT ladOriginPx=1.16213 ladOriginBarTime=2026.09.08 16:45 ladOriginSite=S5 ext1Defined=1 slExt1=1.16359 ext1Slot=91 ext1BarTime=2026.09.08 09:05 ext1Imb=2 deepestExt=29 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
CUR: [SRJ-EA] SLEXT481 fields=17 bar=2026.08.28 16:20 site=S5 dir=SHORT ladOriginPx=1.16430 ladOriginBarTime=2026.08.28 16:25 ladOriginSite=S5 ext1Defined=1 slExt1=1.16508 ext1Slot=118 ext1BarTime=2026.08.28 06:30 ext1Imb=0 deepestExt=27 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
CUR: [SRJ-EA] SLEXT481 fields=17 bar=2026.09.08 16:40 site=S5 dir=SHORT ladOriginPx=1.16213 ladOriginBarTime=2026.09.08 16:45 ladOriginSite=S5 ext1Defined=1 slExt1=1.16359 ext1Slot=91 ext1BarTime=2026.09.08 09:05 ext1Imb=2 deepestExt=29 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0

Luna key sentence (quoted complete from filed entry LUNA-V166-001 — adopted verbatim in packet section 4):
> “Actual-path baseline remains 7 signals; the actual-path A3 diagnostic remains R=1.62. Under the print-only ext1 shadow, A3 must compute rExt1=0.68 and wouldGate=0. A2 remains silent on the actual path. Do not interpret actual-path downstream rows as evidence of the shadow outcome.”

Delta applications since v166 (all four v166 positions ruled): Luna table adopted (actual/shadow labeling in sections 3 and 4 including the quoted sentence; veto/wouldGate/rLive/zero-denom/monotone/ext1Defined/no-carryforward/stage-sequence all specified); Opus text fixes adopted (slot prints; s0imb restate; qualified signals; comparator with plus-or-minus 0.01 band and raw-division gate rule; A2 graded on printed operands only; A6/A7 wording; falsifier on 17:00 eval; diagnostic-only re-emit path; ceiling unit with volume bound; sentinel convention; evidence provenance); Opus monotone and resolver/flag proposals recorded as deferred with reasons (probe-minimal; flag belongs to live activation); Opus line-map and overwrite questions answered in packet section 1 (five lines replaced, closure retained, no second overwrite); Sonnet v166 analysis stands as review-only corroboration (upload dead; format objections recorded once per settled standing; float-equality caution answered by slot-anchored reads above, not price coincidence).

Question (one, specific): clear PACKET_EXT1LIVE-001 v4 by name for one print-only probe build plus one run under the envelope above — clear, amend-with-delta, or halt, with line numbers?

Analytic ask A (standing): name every defect, gap, or imprecision you see in the page, each with line numbers — freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Review-seat packaging: the same relay text ships to every model; the decision line above is excused for the review seat (standing seat-split: analysis out, review-only, never keys).

Answer form: plain clear / amend-with-delta / halt, with line numbers, plus analytic answers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files. File-access proof is builder-disk plus his-eyes only.
Nothing else is asked. Thank you.
