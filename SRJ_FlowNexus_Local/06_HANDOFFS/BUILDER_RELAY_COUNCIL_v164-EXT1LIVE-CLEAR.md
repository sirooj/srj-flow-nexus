CODE REVIEW REQUEST — v164 — 2026-09-18 (CLEARANCE: one print-only probe build plus run of PACKET_EXT1LIVE-001; no live change)

Change (one plain sentence): clear the transcribed ext1-live packet by name for exactly one print-only probe build plus one run under the envelope below so the table and the ordering questions are settled by output.

File / function / lines: no code change this relay; tree landed 3a932b9 (EA `6C2E4028` / 602894 B); gate input EA L57, gate test EA L9670, latch EA L9909-9912, session marks EA L10073 and L10170, run ini inputs L15-19 (all re-read from disk this turn, carried whole in the appendix). Packet `01_TASKS\PACKET_EXT1LIVE-001.md` (transcribed AUTHORED-unbuilt this turn from the Luna plus Astra v163 rule texts with the Opus probe and acceptance folded as build gates; carried whole below as the clearable body).

Clearable body (the packet sections 1 through 5, byte-exact twin of the filed packet):
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

R-gate constant 1.0 (EA L57 compiled default, no run-ini override) sits inside the required (0.68, 1.38] band. A2's veto refusal is order-independent of R.

## 3. Probe form (print-only; Opus acceptance item 4 folded)

First pass prints only per S5 evaluation: slLive, pxExt1, ext1Defined, rLive, rExt1, gateConst, wouldGate, veto outcome, session-use state. No assignment to the live path, no latch/fire/accounting change, AdoptOff held, OrderSend 0. Live activation only via later dual-key plus tokens.

## 4. Acceptance (grade lines)

Table Rs reproduce within display band or explain per row; run prints gateConst (must read 1.0) and the session-mark site reached (post-SIGNAL only); 16:55 seed present; 17:00 S5 eval present with operands printed; 7 signals, A2 silence, silent days, VETOCLEAR behavior unchanged in kind; isolation: EA-line delta is the probe block only. A miss on any line halts with operands (no tuning, no rerun).

## 5. Carried alternative (not in scope unless council rules it in)

Opus monotone-adverse-only adoption (adopt ext1 only when strictly more adverse). Omitted: on this window it reproduces the table identically and adds an unconstrained future-bars divergence. Council may amend-with-delta to include it; builder invents nothing.

Envelope (print-only threshold): one build plus one run, same ini and range (RECON44_DEMO_P1, InpMode 1, 08-26 to 09-09), ceiling 90, STAGE-1 pre-hash plus exact-diff plus parity plus 0/0 compile gates, grade against packet section 4 with halts, timeout and no-third-run report-plus-halt standing. Run word asked only after a clear lands — nothing is spent by this relay.

Gap closures (Opus v163 four gaps, each closed on disk this turn with the code and rows in the appendix):
D1 (emitted stop): closed — the overwrite chain is OB print, then Region W overwrite slRef from s0 at L9664, then latch g_latchedSl from slRef at L9910, then SIGNAL sl. The SL_REF-printed 1.16379 is the pre-overwrite value; the latched 1.16274 is post-overwrite. Writing the ext1 price at the select site flows to the emitted stop through the same variable.
D2 (gate constant): closed — input default 1.0 at EA L57 with no run-ini override (inputs section carried whole), inside the required band above 0.68 and at or below 1.38. A3 dies, A1 survives.
D3 (mark ordering): closed — both session-mark writes sit strictly post-SIGNAL (alert-only branch mark plus post-execution mark), so an R-gate kill never marks and the window stays unspent.
D4 (branch coverage): closed in part — s0 path takes two bars not one (DH sel 0 r0 10.35 plus A3 sel 0 r0 1.62, rows below); A2 ext1 row machine-pulled below (1.16299 slot 13, closing the not-pulled point).

Code appendix (contiguous whole regions):
Gate input and test:
input group "Gates"
input double InpMinRewardRisk   = 1.0;
       double slDist = MathAbs(currentPrice - slRef);
       double tpDist = MathAbs(tpTarget - currentPrice);
       bool tpOk = (slDist > 0.0 && (tpDist / slDist) >= InpMinRewardRisk);
Latch consumer:
      g_latchedEntry = currentPrice;
      g_latchedSl    = slRef;
      g_latchedTp    = tpTarget;
      g_latchedR     = (slDist > 0.0) ? (tpDist / slDist) : 0.0;
Session marks, alert-only branch:
      if(InpMode == MODE_ALERT_ONLY)
        {
         PrintFormat("[SRJ-EA] ALERT_ONLY mode - no order sent. Session %s marked used.",
                     SessionName(g_sessionAtEntry));
         MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
         ENUM_SRJ_STATE prevA = g_state;
         g_state = ST_SIGNAL;
         LogState(prevA, g_state);
         ResetSequence();
         return;
        }
Session mark, post-execution path:
        }

      MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
      ENUM_SRJ_STATE prev = g_state;
      g_state = ST_SIGNAL;
      LogState(prev, g_state);
      ResetSequence();
     }
Run ini inputs (no override present):
[TesterInputs]
InpDebugLog=true
InpMode=1
FromDate=2026.08.26
ToDate=2026.09.09

Rows appendix (machine-pulled this turn):
[SRJ-EA] SIDE1E_STOPSHADOW bar=2026.09.04 10:35 dir=SHORT s0px=1.16289 s0slot=1 s0imb=2 s1px=1.16299 s1slot=13 s1imb=2 sel=0 r0=10.35 r1=7.30 liveSl=1.16289 livePass=1
[SRJ-EA] SIDE1E_STOPSHADOW bar=2026.09.08 16:40 dir=SHORT s0px=1.16274 s0slot=4 s0imb=1 s1px=1.16359 s1slot=91 s1imb=2 sel=0 r0=1.62 r1=0.68 liveSl=1.16274 livePass=1
[SRJ-EA] SLEXT481 fields=17 bar=2026.09.04 10:35 site=S5 dir=SHORT ladOriginPx=1.16265 ladOriginBarTime=2026.09.04 10:40 ladOriginSite=S5 ext1Defined=1 slExt1=1.16299 ext1Slot=13 ext1BarTime=2026.09.04 09:30 ext1Imb=2 deepestExt=32 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
[SRJ-EA] SLSRC site=S5 dir=SHORT src=OB_SWING obStruct=1.16377 obSwing=1.16379 nearest=1.16274 chosen=1.16379 deltaPts=2
[SRJ-EA] SL_REF branch=1-swing obValid=1 slRef=1.16379 distPts=167 site=S5 zoneLo=1.16362 zoneHi=1.16377
HP	0	02:00:44.015	Core 04	2026.09.08 16:45:01   [SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | NYAM | R=1.62 SL 1.16274 TP 1.16114 spr=1
[SRJ-EA] TP_ELECT shadow=true entry=1.16213 sl=1.16274 tp=1.16114 R=1.62 bar=2026.09.08 16:40 latchBar=2026.09.08 16:45

Filed-record appendix (driving dissent quoted complete under builder markers, each ruled above — never attributed to any current seat):
[Opus v163 demand, filed entry OPUS-V163-001 — complete:]
## Ruling: discrepancy (two load-bearing gaps), with conditional rule text

The arithmetic in your table reproduces cleanly from the printed operands, so the gaps are not in the numbers. I re-derived all seven from the TP_ELECT entry/TP and the SLEXT481 `slExt1`:

- Five rows have `slExt1` == live `sl` exactly (08-28 10:00, 09-04 15:55, 09-07 09:15, 09-07 16:40, 09-08 10:05) → R unchanged.
- A1 08-28 16:20: 108/73 = 1.48 → 108/78 = 1.38.
- A3 09-08 16:40: 99/61 = 1.62 → 99/146 = 0.68.

Consistent. The problems are upstream of the R figures.

### Discrepancy 1 — `slRef` is not the emitted stop on the one bar the rule exists to change

At bar 16:40 / latch 16:45 your own pulled rows carry, simultaneously:

- `SL_REF branch=1-swing obValid=1 slRef=1.16379`
- `SLSRC ... nearest=1.16274 chosen=1.16379`
- `ALERT ... SL 1.16274` and `TP_ELECT ... sl=1.16274`

So on this bar `slRef` = 1.16379 while the emitted stop = 1.16274, and the emitted value tracks `nearest`, not `chosen`/`slRef`. The select site you supplied (L9661–9665) writes only `slRef`. Writing `slExt1` = 1.16359 there therefore does not establish emitted SL = 1.16359, does not establish risk = 146 pts, and does not establish R = 0.68 or the R-gate kill. The entire A3-death claim rests on a `slRef` → emitted-SL identity that the same four rows contradict at that exact bar.

Required before authorship: the line where the emitted SL is finally set from `slRef`/`nearest`, and the rule that picked 1.16274 over 1.16379. I cannot name those lines — they are not in the six lines supplied, and L9661–9666 is not sufficient to identify them.

### Discrepancy 2 — the R-gate constant is absent, and your two stated outcomes constrain it to a narrow band

Nothing in the relay names the gate threshold. Your stated outcomes pin it:

- A3 must die at 0.68 → gate > 0.68
- A1 must survive at 1.38 → gate ≤ 1.38
- A1 fired live at 1.48 → gate ≤ 1.48 (already known)

So "declined A3 dies, seven signals preserved" holds **only if the gate constant lies in (0.68, 1.38]**. If it sits anywhere in (1.38, 1.48], A1 dies too and the preservation requirement breaks on the same run. That interval is checkable on disk in one line; until it is filed, "kills exactly the declined A3" is unproven.

### Discrepancy 3 — gate-before-mark ordering is not shown

The purpose (window unspent for the 16:55 seed) requires the R-gate rejection to occur **before** the session-used write. Your filed record puts the mark at 16:50:01 and the check near L7682. If the window is marked at latch or fire-intent rather than after the R-gate passes, the A3 kill still spends NYAM, the 16:55 seed still dies at L7682, and the change achieves nothing while altering six other stops. Not answerable from the six lines.

### Discrepancy 4 — the safety evidence covers the wrong branch

A3 is the only row with `ext1Imb=2`, so it is the only row taking `s1x_sel == 0` at L9662/L9664. All six reassurance rows have `ext1Imb=0` and take `s1x_sel == 1`. The behavior change comes entirely from the s0 path, and the s0 path has n=1 — the bar that produces the desired kill. "Five identical, one trivial" is evidence about the branch that does nothing.

Also unsupported: no SLEXT481 row for A2 appears in the pull, so 1.16299 and "near 7.3" are not machine-pulled here. A2's preservation via veto order stands independently; the R figure should not be carried as evidence.

### Conditional rule text (adopt only after 1–3 are closed on disk)

Site: replace L9661–L9665, retaining the closing brace at L9666 unchanged.

1. **Predicate.** After the existing selection, if `s1x_sel == -1` (ext1 undefined) leave the incumbent stop untouched and print `ext1Defined=0`. Otherwise let `pxExt1` = the selected `s1x_s0px`/`s1x_s1px`.
2. **Monotone-adverse only.** Adopt `pxExt1` only when it is strictly more adverse than the incumbent (SHORT: `pxExt1 > incumbent`; LONG: `pxExt1 < incumbent`). Otherwise keep the incumbent. This reproduces the table exactly (five no-ops, A1 +5 pts, A3 +85 pts) and bounds blast radius to one direction: the rule can only widen risk, so it can only remove fires at the R-gate and can never create a fire that did not previously exist.
3. **Replacement target.** Assign into the variable the emitted SL actually derives from — identified per Discrepancy 1, not `slRef`, unless disk shows them to be the same variable.
4. **Probe form.** First pass prints only: `slLive`, `pxExt1`, `ext1Defined`, `rLive`, `rExt1`, `gateConst`, `wouldGate`, with no assignment to the live path. Live activation only via the stated dual-key plus tokens.
5. **Acceptance.** The seven rows above are must-reproduce-or-explain; additionally the run must print the gate constant and the session-mark ordering so 2 and 3 are settled by output rather than assertion.

`SESSION_LIMIT`, veto order, and the A3/16:25/A2 declines are untouched by the above; no birth rule is proposed.


Luna rule source (quoted complete for transcription cross-check; packet section 1 transcribes it with the Astra precision folded):
**AUTHORED RULE — EXT1-LIVE STOP**

At **EA L9661–L9666**, replace the live-stop selection decision so that **when the S5 ext1 read is defined for the current fire, `slRef` is authored from that ext1 price; when ext1 is undefined, the existing selection is retained unchanged (`s0` when `s0imb > 0`, otherwise `s1`)**.

This is a live, bar-local predicate: `ext1Defined` plus the ext1 price already read at the S5 site. It does not inspect the later decline ruling, alter `SESSION_LIMIT`, alter veto ordering, or create any follow-on birth rule. The resulting stop then flows through the existing downstream R-gate unchanged.

For the documented Sept-8 A3 case, the ext1 read is **1.16359** from **09:05**, replacing the latched **1.16274**; that changes the fire from **R=1.62** to **R=0.68**, so the existing R-gate rejects it without firing. The same rule leaves the five identical fires unchanged, preserves A1 survival, and leaves the A2 decline governed by the existing resolution-then-veto path.



Sonnet v163 ask (one sentence, quoted complete, declined): upload the real files so it can grep and diff them directly. Declined with reason standing (verification split; upload dead; second-eyes declined; disk audit this turn is the verification; review seat never keys).

Question (one, specific): clear PACKET_EXT1LIVE-001 by name for one print-only probe build plus one run under the envelope above — clear, amend-with-delta, or halt, with line numbers?

Answer form: plain clear / amend-with-delta / halt, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files. Same text goes to every model; file-access proof is builder-disk plus his-eyes only.
Nothing else is asked. Thank you.
