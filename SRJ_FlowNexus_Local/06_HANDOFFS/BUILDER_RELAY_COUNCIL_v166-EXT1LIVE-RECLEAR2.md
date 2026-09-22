CODE REVIEW REQUEST — v166 — 2026-09-18 (RE-CLEARANCE 2: packet v3 with the changed-set fix, one print-only probe build plus run; first format-v2 relay)

Change (one plain sentence): clear PACKET_EXT1LIVE-001 v3 by name for exactly one print-only probe build plus one run under the envelope below so the ext1 table and the ordering questions are settled by output.

File / function / lines: no code change this relay; tree landed 3a932b9 (EA `6C2E4028` / 602894 B); packet v3 `01_TASKS\PACKET_EXT1LIVE-001.md` (40 lines, `E83EC7E9`, read back verified this turn — v2 plus the Astra changed-set fix and the shadow-vs-outcome scoping, code untouched). Envelope: one build plus one run, same ini and range (RECON44_DEMO_P1, InpMode 1, 08-26 to 09-09), ceiling 90, STAGE-1 pre-hash plus exact-diff plus parity plus 0/0 compile gates. Run word asked only after a clear lands — nothing is spent by this relay.

Clearable body (packet v3 sections 1 through 5, byte-exact twin of the filed packet):
# PACKET_EXT1LIVE-001 v3 — live the ext1 stop (print-only probe; v1 authored rule; v2 folded Astra 2 + Opus 5 deltas; v3 fixes the changed-set sentence per Astra v165 amend plus explicit shadow-vs-outcome scoping, code untouched)

Status: AUTHORED-unbuilt. Nothing builds or runs on this file. Clearance + fresh word come only via relay.

## 1. Rule (transcribed from the two authored texts, which converge)

At the live-stop select site (EA L9661-L9666), when the current candidate's S5 ext1 read is defined, select that read's price (slExt1) as slRef, replacing the existing s0-first/s1-second selection. Use the same candidate-local ext1 definition and provenance that supply SLEXT481; do not substitute a previous candidate's read or a subsequently reconstructed value. No positive-imbalance requirement applies: ext1Imb=0 does not disqualify a defined ext1.

Replacement semantics: replace the selection decision at L9661-L9665; retain the enclosing scope closure at L9666. The selected ext1 feeds the effective stop through the existing chain (Region W overwrite L9664, R-gate test L9670, veto E1d, latch g_latchedSl at L9910, SIGNAL, session mark post-SIGNAL at L10073/L10170) with resolution-then-veto order unchanged.

Ext1-undefined fallback: retain the existing selector exactly (s0 when slot valid and imbalance positive, else s1 when slot valid, else incoming slRef unchanged). No other stop source; no carry-forward of an earlier ext1.

Standing rule, not an exception: SESSION_LIMIT and L7682-L7697 unchanged; veto order unchanged; A3/16:25/A2 declines preserved; no-band-aid rule holds. This is not a Sept-8, A3, manual-decline, session-release, or follow-on-birth exception.

## 2. Must-reproduce-or-explain table (fixed entry/TP operands; R builder-computed)

| Bar | Entry/TP | ext1 stop | Predicted R |
|---|---|---|---|
| 08-28 10:00 SHORT | 1.16466 / 1.16322 | 1.16508 | 3.43 unchanged |
| 08-28 16:20 SHORT (A1 declined) | 1.16430 / 1.16322 | 1.16508 | 1.38, survives |
| 09-04 15:55 LONG | 1.16018 / 1.16315 | 1.15847 | 1.74 unchanged |
| 09-07 09:15 LONG | 1.16135 / 1.16315 | 1.16098 | 4.86 unchanged |
| 09-07 16:40 LONG | 1.16261 / 1.16315 | 1.16238 | 2.35 unchanged |
| 09-08 10:05 SHORT | 1.16205 / 1.16072 | 1.16258 | 2.51 unchanged |
| 09-08 16:40 SHORT (A3 declined) | 1.16213 / 1.16114 | 1.16359 | 0.68 R-gate kill, no fire |
| 09-04 10:35 SHORT (A2 declined) | seed-close basis | 1.16299 | far above gate; veto refuses pre-latch regardless |

R-gate constant 1.0 (EA L57 compiled default, no run-ini override) sits inside the required (0.68, 1.38] band. A2's veto refusal is order-independent of R. Changed set under this rule: the s0-branch bars are 10:35 (A2/DH seed), 08-28 16:20 (A1), and 09-08 16:40 (A3) per SHADOW sel rows — all three already declined; the predicted stop-price changes also include A1's stated 5-point move (1.48 to 1.38, survives). Confirm the actual changed set from per-row slLive/pxExt1 prints. Five other fires identical because live stop already equals s1px there. Emergent reading named: where ext1 equals s1 the rule reduces to removing the s0 branch for defined-ext1 bars — the section 3 slot prints resolve it per row.

## 3. Probe form (print-only; v2 names the insertion line and extends the print list)

Probe block sits post-L9664 and pre-L9670 (after the live overwrite, before the R-gate test), so it reads slLive post-overwrite. Compute with probe-local values using the current candidate's SLEXT481 provenance; leave live slRef, gate decisions, veto, latch, SIGNAL and accounting untouched. Probe veto and session-use prints describe state available at this site, not a downstream outcome or proof of reaching any post-SIGNAL mark. First pass prints only per S5 evaluation: slLive, pxExt1, ext1Defined, rLive, rExt1, gateConst, wouldGate, veto outcome, session-use state, ext1Slot, ext1BarTime, s0slot, s0imb, s1slot, s1imb, wouldAdopt_monotone. No assignment to the live path. AdoptOff held, OrderSend 0. Live activation only via later dual-key plus tokens.

## 4. Acceptance (grade lines)

Table Rs reproduce within display band or explain per row; run prints gateConst (must read 1.0) and the session-mark site reached (post-SIGNAL only); 16:55 seed print present and declined at SESSION_LIMIT with the L7682 site named; 17:00 S5 eval expected absent in print-only form. Report actual presence/absence; print operands if evaluated. Absence attributable to the unchanged live path is not evidence against the shadow rule. Counterfactual seed/window recovery remains unproved and requires separately authorized testing. 7 signals unchanged, A3 still present at R=1.62, A2 silence, silent days, VETOCLEAR behavior unchanged in kind; establish downstream outcomes from existing actual-path diagnostics in the same run (VETOCLEAR, SESSION_LIMIT, TP_ELECT, SIGNAL rows — the live path still prints all of them); if those cannot establish an outcome, report unproved and halt, never widen the probe-only delta; isolation: EA-line delta is the probe block only. A miss on any line halts with operands (no tuning, no rerun).

## 5. Carried alternative (not in scope unless council rules it in)

Opus monotone-adverse-only adoption (adopt ext1 only when strictly more adverse). Omitted: on this window it reproduces the table identically and adds an unconstrained future-bars divergence. The probe prints wouldAdopt_monotone per S5 evaluation (1 where ext1 is strictly more adverse than incumbent), settling the alternative from the same run. Council may amend-with-delta to include it; builder invents nothing.

Changed-set evidence (machine-pulled this turn — the s0-branch bars with per-row sel):
[SRJ-EA] SIDE1E_STOPSHADOW bar=2026.09.04 10:35 dir=SHORT s0px=1.16289 s0slot=1 s0imb=2 s1px=1.16299 s1slot=13 s1imb=2 sel=0 r0=10.35 r1=7.30 liveSl=1.16289 livePass=1
[SRJ-EA] SIDE1E_STOPSHADOW bar=2026.08.28 16:20 dir=SHORT s0px=1.16503 s0slot=5 s0imb=1 s1px=1.16508 s1slot=118 s1imb=0 sel=0 r0=1.48 r1=1.38 liveSl=1.16503 livePass=1
[SRJ-EA] SIDE1E_STOPSHADOW bar=2026.09.08 16:40 dir=SHORT s0px=1.16274 s0slot=4 s0imb=1 s1px=1.16359 s1slot=91 s1imb=2 sel=0 r0=1.62 r1=0.68 liveSl=1.16274 livePass=1

A2 ext1 row (machine-pulled this turn — closes the not-pulled point):
[SRJ-EA] SLEXT481 fields=17 bar=2026.09.04 10:35 site=S5 dir=SHORT ladOriginPx=1.16265 ladOriginBarTime=2026.09.04 10:40 ladOriginSite=S5 ext1Defined=1 slExt1=1.16299 ext1Slot=13 ext1BarTime=2026.09.04 09:30 ext1Imb=2 deepestExt=32 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0

Delta applications since v165 (all four v165 positions ruled): Luna v165 clear covered the v2 object, changed since, so re-clear is asked fresh; Astra amend adopted (changed-set sentence replaced with the s0-branch set plus per-row confirm; shadow-vs-outcome scoping in sections 3 and 4; downstream from actual-path diagnostics); Opus blocking deltas satisfied in v2 and carried (insertion line, print list, qualified counts); Opus text deltas adopted (slot prints, s0imb restate with A1 precision, qualified signals); Opus monotone stays carried in section 5 with per-bar output; Sonnet v165 refusal stands as review-only corroboration at most (upload dead; format objections recorded once per format v2 settled standing).

Question (one, specific): clear PACKET_EXT1LIVE-001 v3 by name for one print-only probe build plus one run under the envelope above — clear, amend-with-delta, or halt, with line numbers?

Analytic ask A (standing): name every defect, gap, or imprecision you see in the page, each with line numbers — freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Review-seat packaging: the same relay text ships to every model; the decision line above is excused for the review seat (standing seat-split: analysis out, review-only, never keys).

Answer form: plain clear / amend-with-delta / halt, with line numbers, plus analytic answers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files. File-access proof is builder-disk plus his-eyes only.
Nothing else is asked. Thank you.
