CODE REVIEW REQUEST — v158 — 2026-09-18 (G4-CLOSURE-FIX relay: corrected level-qualified close; no code, no new rows beyond the two archives)

Change (one plain sentence): close G4 on the corrected wording that the signal delta is minus the ruled decline and the shadow delta is minus two with identical silence, with the wider veto reach recorded as already observed once on Aug 26.

File / function / lines: no code change this relay; EA `Experts\SRJ_FlowNexus_EA.mq5` as-built + as-run SHA256 `6C2E402846DB0BFBCDABD40AC2D08BEE7A59D0F92BBD2E9F9D2B8DAC817BCC07` / 602894 B (pre-run and post-run identical, re-verified this turn); FlowLogic untouched `BEC2CBBD` / 69852 B; packet P-FRESH-S5OPP v5 (`04489E6D`, frozen); archives `06_HANDOFFS\FAMILYPASS-V4_JOURNAL.log` (36755 lines / `736C24E8`) and `06_HANDOFFS\FRESHVETO-V1_JOURNAL.log` (37303 lines / `8B2ED676`).

Context (labeled priors, same track): v156 (`06_HANDOFFS\BUILDER_RELAY_COUNCIL_v156-FRESHVETO-GRADE.md`, 139 lines, `B1ACD337`) graded run FRESHVETO-V1 and drew Luna PASS, Astra PASS, Sonnet scoped-PASS, Opus DISCREPANCY on G4 for the missing baseline count. v157 (`06_HANDOFFS\BUILDER_RELAY_COUNCIL_v157-G4-CLOSURE.md`, 33 lines, `E1AA145A`) carried the baseline rows and drew four answers filed this turn (Luna yes entry LUNA-V157-001 + Astra G4 PASS entry ASTRA-V157-001 in `06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md`; Sonnet non-verdict entry SONNET-V157-001 + Opus discrepancy entry OPUS-V157-001 in `06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md`). This relay answers the Opus discrepancy only; nothing else changed.

Withdrawn errors (plain, with credit — the refutation itself stands): (a) v157 lines 23 and 29 closed as delta exactly minus the ruled decline without a level, which holds at SIGNAL level only and not at shadow level — WITHDRAWN as written; (b) v157 line 21 said the veto pre-empted a kill that would have fired TP_RR_FAIL in baseline — wrong tense, the kill DID fire in baseline beside the shadow print — WITHDRAWN as written, corrected below; (c) the v157 minor-note left the 10:35-versus-10:40 offset open — CLOSED below on disk (uniform convention, no offset). Surviving conclusions: both extra fires predate the veto code, outcome-identical silence on both deltas, and the wider reach is observed fact. Credit to the Opus v157 text for all three catches; Sonnet v157 asked for file uploads and is declined under the verification split (rule on the page; disk proof stays builder-disk plus his-eyes).

Counts (machine-counted this turn, two patterns each): baseline 8 ALERT SIGNAL rows (`ALERT SRJ SIGNAL` SimpleMatch 8; `SIGNAL (SHORT|LONG)` regex 8) and 13 TP_ELECT rows (`TP_ELECT shadow=true` SimpleMatch 13; `TP_ELECT` SimpleMatch 13); current 7 ALERT SIGNAL rows (7 and 7) and 11 TP_ELECT rows (11 and 11).

Baseline 8 SIGNAL rows (machine-pulled this turn):
[SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Daily-VWAP | LONDON | R=3.43 SL 1.16508 TP 1.16322 spr=4
[SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Daily-POC | NYAM | R=1.48 SL 1.16503 TP 1.16322 spr=3
[SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Daily-POC | LONDON | R=10.35 SL 1.16289 TP 1.16017 spr=4
[SRJ-EA] ALERT SRJ SIGNAL LONG EURUSD M5 | Yearly-POC | NYAM | R=1.74 SL 1.15847 TP 1.16315 spr=1
[SRJ-EA] ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-POC | LONDON | R=4.86 SL 1.16098 TP 1.16315 spr=3
[SRJ-EA] ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-POC | NYAM | R=2.34 SL 1.16238 TP 1.16315 spr=3
[SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | LONDON | R=2.52 SL 1.16258 TP 1.16072 spr=1
[SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | NYAM | R=1.62 SL 1.16274 TP 1.16114 spr=1

Baseline 13 shadow rows as R-per-bar (machine-pulled this turn):
2026.08.26 14:40 R=0.53
2026.08.27 17:00 R=0.35
2026.08.27 18:50 R=0.18
2026.08.28 10:00 R=3.43
2026.08.28 16:20 R=1.48
2026.08.31 15:05 R=0.34
2026.09.04 09:25 R=0.63
2026.09.04 10:35 R=10.35
2026.09.04 15:55 R=1.74
2026.09.07 09:15 R=4.86
2026.09.07 16:40 R=2.34
2026.09.08 10:05 R=2.52
2026.09.08 16:40 R=1.62

Current 11 shadow rows as R-per-bar (machine-pulled this turn):
2026.08.27 17:00 R=0.35
2026.08.27 18:50 R=0.18
2026.08.28 10:00 R=3.43
2026.08.28 16:20 R=1.48
2026.08.31 15:05 R=0.34
2026.09.04 09:25 R=0.63
2026.09.04 15:55 R=1.74
2026.09.07 09:15 R=4.86
2026.09.07 16:40 R=2.34
2026.09.08 10:05 R=2.52
2026.09.08 16:40 R=1.62

Set-diff: the current 11 are a strict subset of the baseline 13; missing exactly (1) 2026.09.04 10:35 R=10.35 (the ruled Sept-4 morning decline, shadow pre-empted by design, fenced double-zero re-proven this turn: `TP_ELECT.*bar=2026.09.04 10:35` 0 rows and `latchBar=2026.09.04 10:40` 0 rows) and (2) 2026.08.26 14:40 R=0.53 (the generality row, walked next).

Key rows (machine-pulled this turn, byte-identical across both archives where stated):
A1-BASE: [SRJ-EA] TP_ELECT shadow=true entry=1.16430 sl=1.16503 tp=1.16322 R=1.48 bar=2026.08.28 16:20 latchBar=2026.08.28 16:25
A1-CUR: [SRJ-EA] TP_ELECT shadow=true entry=1.16430 sl=1.16503 tp=1.16322 R=1.48 bar=2026.08.28 16:20 latchBar=2026.08.28 16:25
A3-BASE: [SRJ-EA] TP_ELECT shadow=true entry=1.16213 sl=1.16274 tp=1.16114 R=1.62 bar=2026.09.08 16:40 latchBar=2026.09.08 16:45
A3-CUR: [SRJ-EA] TP_ELECT shadow=true entry=1.16213 sl=1.16274 tp=1.16114 R=1.62 bar=2026.09.08 16:40 latchBar=2026.09.08 16:45
A2-BASE-TPELECT: [SRJ-EA] TP_ELECT shadow=true entry=1.16265 sl=1.16289 tp=1.16017 R=10.35 bar=2026.09.04 10:35 latchBar=2026.09.04 10:40
W0826-BASE-TPELECT: [SRJ-EA] TP_ELECT shadow=true entry=1.16654 sl=1.16597 tp=1.16684 R=0.53 bar=2026.08.26 14:40 latchBar=2026.08.26 14:45
W0826-BASE-KILL: [SRJ-EA] TP_RR_FAIL_LATCH bar=2026.08.26 14:40 dir=LONG entry=1.16654 sl=1.16597 tp=1.16684 R=0.53
W0826-CUR-VETO: [SRJ-EA] FRESHVETO bar=2026.08.26 14:40 dir=LONG anchor=Weekly-POC vetoBar=2026.08.26 11:35
A2-CUR-VETO: [SRJ-EA] FRESHVETO bar=2026.09.04 10:35 dir=SHORT anchor=Daily-POC vetoBar=2026.09.04 10:30
TIME-BASE-A1: HN	0	21:07:59.769	Core 04	2026.08.28 16:25:00   [SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Daily-POC | NYAM | R=1.48 SL 1.16503 TP 1.16322 spr=3
TIME-BASE-A2: JQ	0	21:27:43.856	Core 04	2026.09.04 10:40:00   [SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Daily-POC | LONDON | R=10.35 SL 1.16289 TP 1.16017 spr=4
TIME-BASE-A3: JM	0	21:37:29.790	Core 04	2026.09.08 16:45:01   [SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | NYAM | R=1.62 SL 1.16274 TP 1.16114 spr=1
TIME-CUR-A1: MG	0	01:31:01.786	Core 04	2026.08.28 16:25:00   [SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Daily-POC | NYAM | R=1.48 SL 1.16503 TP 1.16322 spr=3
TIME-CUR-A3: HP	0	02:00:44.015	Core 04	2026.09.08 16:45:01   [SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | NYAM | R=1.62 SL 1.16274 TP 1.16114 spr=1

Aug-26 walk (the corrected tense): baseline printed BOTH the shadow row above AND the R-gate kill row `TP_RR_FAIL_LATCH bar=2026.08.26 14:40` (present 1 row in baseline; TP_RR_FAIL = not worth 1R); current prints NEITHER the shadow row (0 rows) NOR that kill row (0 rows) and prints instead `FRESHVETO bar=2026.08.26 14:40 dir=LONG anchor=Weekly-POC vetoBar=2026.08.26 11:35`. Same silence either way (no live trade, no signal); the kill credit moves from the R-gate to the veto and the shadow print is suppressed with it. This is the observed once: the veto reach beyond the 10:35/10:40 ruled bar already happened inside this window, and is recorded here as occurred and bounded (one row, silent day kept silent), not as future risk.

Signal-time convention (minor closed, uniform — the offset was misread direction): journal bar-time of each SIGNAL equals its shadow latchBar, and the shadow bar is one 5-minute bar earlier, all three setups: A1 SIGNAL 2026.08.28 16:25:00 with bar 16:20 latchBar 16:25; A2 SIGNAL 2026.09.04 10:40:00 with bar 10:35 latchBar 10:40; A3 SIGNAL 2026.09.08 16:45:01 with bar 16:40 latchBar 16:45. Current-run A1/A3 SIGNAL times are identical (16:25:00 and 16:45:01). So 10:35 is the seed bar and 10:40 the signal bar of one setup, and the v157 10:35/10:40 window label stands as written.

Corrected close (level-qualified, replaces v157 lines 23 and 29): SIGNAL-level delta is exactly minus the ruled decline (8 to 7); shadow-level delta is minus two, the second being an in-mechanism out-of-decline pre-emption with identical outcome (13 to 11); causal path refuted (both extra fires predate the veto code and reproduce byte-identical); scope recorded as observed once and bounded, with the standing rule unchanged (only he extends a decline; any future refusal routes via the G4 pattern, never auto-approved).

Filed-record appendix (complete Opus v157 text as filed under builder marker — the demand answered above, ruled accepted with the two corrections baked in; not attributed to any current seat):
## Verdict: discrepancy — narrow, on the closing claim's wording, not on the refutation

Two separate things, and I need to keep them apart.

### 1. What I can rule on, and what I can't

You've asked me to rule on the page only and not to ask for files. I'll honor that, but it bounds the verdict: I can check the page's arithmetic and the validity of its causal argument. I cannot certify that the quoted rows exist in `736C24E8`, that the count is 8, or that A1/A3 are byte-identical across archives. Those are the load-bearing facts, and in this channel they're assertions. So whatever I return is a ruling on internal coherence, not a PASS on genuineness. I also can't give you archive line numbers — I haven't read the archive, and inventing them would be worse than declining. Locations below are by anchor within your relay.

### 2. The causal refutation is logically sound

Conditional on the baseline rows being real: yes, this closes the v156 suspicion. If R=1.48 (Aug-28 16:20) and R=1.62 (Sept-8 16:40) printed both SIGNAL and TP_ELECT in an archive predating the veto code, then those two fires are not novel and the veto cannot be their cause. "A veto cannot free what already fired" is valid, and it's the right shape of evidence — it attacks the mechanism, not just the correlation. The timing-coincidence reading follows.

Arithmetic checks out on the page:

| Level | Baseline | Current | Delta |
|---|---|---|---|
| ALERT SIGNAL | 8 (5 + A1 + A2 + A3) | 7 (5 + A1 + A3) | −1 |
| TP_ELECT | 13 | 11 | −2 |

### 3. The discrepancy

Your closing claim reads "delta exactly minus the ruled decline." That holds at the **SIGNAL** level only. At the **TP_ELECT** level your own disclosure gives −2, and the second one — 8/26 14:40 R=0.53 — is not the ruled decline. By your description the veto refused that setup before the latch, displacing a `TP_RR_FAIL` kill that would have fired in baseline.

That matters for how G4 gets written up:

- **Outcome-equivalent, agreed.** Silence either way, no novel fire, no latch created. The refutation survives this intact.
- **But scope expansion is not hypothetical.** The relay files it under "on another window that reach can refuse a latch he never declined" — future tense. Your data shows it already happened, once, inside this archive. The veto's effective reach exceeded the 10:35/10:40 adjudicated bar in the current run.

So the honest form of the claim is: *signal-level delta is exactly minus the ruled decline; latch-level delta is minus two, the second being an in-scope-of-mechanism, out-of-scope-of-decline pre-emption with identical outcome.* If G4 closes on the first sentence alone, the ledger under-reports what the archive shows.

### 4. Minor, probably explainable

The declined setup carries SIGNAL at 10:40 but shadow `bar=10:35`. A1 and A3 both show `bar` equal to their signal time with `latchBar` at +5min. The one-bar offset breaks that pattern. Your (a)-note treats "10:35/10:40" as one window, so this is likely just the pre-emption sequencing — but if G4 is closing on row-level identity, say which it is rather than leaving the offset unremarked.

### What would make this a clean yes

Restate the closing claim with the level qualifier, and move the 8/26 R=0.53 pre-emption from "risk logged, future" to "occurred, attributed, bounded." Then the yes is: refutation accepted, delta walked at both levels, scope drift recorded as observed rather than anticipated. On genuineness-vs-disk I'm abstaining by your own construction, and that abstention should be visible in the ledger next to any PASS I'm counted toward.


Sonnet v157 demand (one sentence, quoted complete, declined): upload the referenced files (or the relevant excerpts) for an independent recount. Declined with reason: the verification split on this page plus standing procedure (disk proof is builder-disk plus his-eyes; pasted files cannot substitute; model tier is verification-neutral, every chat seat shares the same paste blind spot). Its sound-logic reading of the refutation is kept as corroboration; its non-verdict changes no gate.

Question (one, specific): close G4 PASS on this corrected evidence — SIGNAL delta exactly minus the ruled decline, shadow delta minus two walked with identical silence, causal path refuted with byte-identical rows, wider reach recorded as observed once and bounded — yes, or discrepancy with line numbers?

Answer form: plain yes / no / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files. Same text goes to every model; file-access proof is builder-disk plus his-eyes only.
Nothing else is asked. Thank you.
