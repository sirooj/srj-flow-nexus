# BUILDER RESULT RECON21b-SEL2 (P-SEL-2) — DONE=PASSED, D1–D3 PASS, three-way verdicts delivered

Build: EA `150A61596F9895C2EA39F9BBA5576E98CE6C0566E9C12094747254218E854FFA`
(474883 B, P-SEL-2 E57–E59 + Astra clarifications + Opus A1–A5,
uncommitted — same build as RECON21, no rebuild); FlowLogic
`3606BFB480A34B5ED4357588DDAFDFE8F7DF2224DA34C6A220EA49F506725911`
unchanged. Launched 12:15:53 PID 4636, PRE_JOURNAL_LINES=95448.
DONE=PASSED 13:38:37. Test passed in 1:22:14.778 (3168 bars /
563338 ticks). Wall 12:15:53→13:38:37 ≈ 82.7 min vs ceiling 90
(CEILING_MIN=90 in STATUS; Opus-v18 condition 3 recorded here).

## 1. Archive (wrapper self-archived; measurements verbatim)

- `06_HANDOFFS\RECON21b-SEL2_JOURNAL.log`: 54470 lines, 10393821 B,
  SHA256 `AA31EC2640780C49EA3D159790B32EC98890BB704C04D1C693218BD285DF5780`.
- Bounds: day-log lines [95449..149918] (PRE=95448 + 54470).
- First: `FQ	0	12:15:58.765	Tester	Local network farm switched off`.
- Last: `FG	0	13:38:19.345	Core 04	connection closed`.
- Purity: farm-off 1, cloud-off 1, Agent-127.0.0.1-3003 only, Core-04-only,
  Test-passed 1.
- Distinct run name: RECON21 artifacts (16992/8C0D0FB8/[40980..57971])
  preserved read-only (Opus-v18 condition 2 ✓).

## 2. Gate grades (v17 §4 + v18 clearances)

### D1 — PASS (coverage complete, counts asserted)

`SEL57` headers 14/14 (7 bars × M5+H1), `SEL57END` 14/14,
`SEL57ROW` 8596 rows; EVERY sentinel listN == ROW lines counted:
R1/R2/R3/R4/R5/S1/S2 × M5 listN=1072 rows=1072; × H1 listN=156 rows=156
(all 14 match=True). No missing prints, no empty lists. TF-union
confirmed live: eligible variants read M5+H1 only (Opus scope question
closed by measurement as well as code-read).

### D2 — PASS (traces complete, truncations excluded)

- `SEL58T` 11817 lines; `SEL58END` 84/84 (7 bars × 12 eligible);
  EVERY sentinel scanned == trace lines counted (84/84 MISMATCHED=0 —
  truncation reads as mismatch by construction; none found).
- `SEL58CMP` 6 lines (R5 MONO/M5 × V005/V013/V021 + S2 H1 ×
  V006/V014/V022 — the only near-tie compares in range).
- `SEL53` 168/168, `SEL53_FINAL` 24/24 (G1x4 identical to RECON20b:
  V005/V013/V021=2, V001/V009/V017=1, rest 0 — P-SEL-1 stays DEAD,
  unchanged, expected); `SEL52` 14376, `SEL52_FINAL` 24.
- R2 labels preserved (`px=1.16297 … take=1 decl=1`, MUST-DECLINE
  unchanged); S2 stop-side traced with `R=TARGET_UNSTATED take=-2`
  (A2 delivered with Astra's explicit-label rule).

### D3 — PASS (evidence-validity)

- Isolation join vs RECON17 (payload compare): SLIMB 481/481 IDENTICAL,
  WALKOB 481/481, WALKFR 481/481, SLIMBR 10/10 IDENTICAL, signals 4/4
  identical (zero mismatches, zero misses either side).
- `InpAdoptExt1=false` (static, re-verified); OrderSend-src 0;
  OrderSend-segment 0. Print-only evidenced by artifact, not intent.
- Opus truncation note: 481/481 both (not 481/480) — no finding.

## 3. Findings (the three-way vocabulary, decided by set difference)

### R4 — ABSENT (recognition-level; the walk is exonerated)

- E57 M5 list (1072 rows): NO 2026.09.07 08:40 event exists (the only
  08:40 rows are Sep-02/Aug-28/Aug-26); the single 1.16098 row is
  Sep-08 10:55 (conf=0, after R4's decision). H1 list (156 rows): no
  08:40 at all. The list DOES contain `cT=2026.09.07 08:20
  rawU=EMPTY rawL=1.16088 … conf=1` (i=875).
- E58 trace R4/V005/M5 (sentinel scanned=197): scan runs
  …09:10 (ev=1.16102 conf=1 counted 0→1),
  08:55 EMPTY, 08:35 EMPTY, 08:20 ev=1.16088 conf=1 counted 1→2 DEFINED.
  No 08:40 line exists to have a disposition — set difference is empty
  on the trace side because it is empty on the list side.
- Verdict: Opus's binary resolves to ABSENT — iFractals-M5 holds no low
  fractal at Sep-07 08:40, so "two swings away" resolves to the next one
  out (08:20). The swing-buffer path DOES hold it (5 bound SLIMB rows,
  §1 of the forensic) — two limb enumerations diverge at this bar.
  Per Astra's constraint this is stated as observation, not mechanism:
  WHY platform fractals lack 08:40 (formation/confirmation rules) is the
  designed-fix domain, but no walk-level fix can recover a limb the list
  never contained.

### R5 — ABSENT on the candidate side (tie-break theory refined)

- E57 M5 row i=897: `cT=2026.09.07 16:15 rawU=1.16266 rawL=EMPTY …
  conf=1` — 16:15 carries an UPPER fractal only; there is NO low event
  at 16:15 in fractal space (its 1.16239 bar-low is not a fractal low).
- E58 trace R5/V005/M5 (sentinel scanned=176): i=898 (16:30,
  ev=1.16240 → counted #1), i=897 (16:15, ev=EMPTY for LONG → side-drop,
  counted stays 1), i=896 (16:05, ev=1.16238 → MONO-more vs 1.16240 →
  counted #2 → DEFINED 1.16238@16:05).
- SEL58CMP at the deciding compare (×3 MONO/M5 variants, identical):
  `cT=2026.09.07 16:05 ev8=1.16238000 last8=1.16240000 eps=0.00000500
  pt=0.00001000 more=1 dPts=-2.00` — 8-digit operands distinct, 0.5-pt
  epsilon applied exactly: NO rounding collapse. Encounter-vs-filter is
  decided: 16:15 is neither out-ordered nor filtered — it never competes
  (no low event). The forensic's both-present holds in SWING space
  (SWINGDUMP trio) and ladder space (rung 1 = filed R 2.45) but NOT in
  the fractal walk's candidate space. Successor-packet note: the fix is
  not a one-line rank swap — there is nothing to swap toward in this
  enumeration; the change must add or re-derive the limb (council designs
  how; the pre-registered "obvious one-line change" expectation is
  superseded by this measurement).

### S1 — ORDINAL off-by-one-near (both limbs present, same path)

- E57 M5 row i=952: `cT=2026.09.08 09:40 rawU=1.16258 rawL=EMPTY …
  conf=1` — his 1.16258 stop IS a confirmed upper fractal in-list.
- E58 trace S1/V005/M5 (sentinel scanned=122): i=952 (09:40,
  ev=1.16258 → counted #1; SEL53 wit=1.16258@09:40 confirms), i=951
  (09:35 EMPTY → drop), i=950 (09:05, ev=1.16359 → MONO-more → counted
  #2 → DEFINED 1.16359@09:05).
- Verdict: code's FIRST-counted limb (09:40) IS his stop; code walks on
  to 09:05 as second. Under his second-swing rule, his #2 = code's #1 —
  between S1's 10:05 decision close and 09:40, code counts NOTHING. His
  #1 candidate is his to name (operator question, not builder assertion);
  the measured fact is the one-seat near-side shift. Same-path status
  holds (trace from the identical instrument), notional context kept
  (no SHORT row at the bar; EA LONG-opposed).

## 4. Standing consequences

-nature R4/R5 share a class (HAND limb missing from fractal-candidate
  space: R4 wholly, R5 side-specifically) while S1 is ordinal (limb
  present, seat disagrees). R1/R3 controls render correct walks on the
  same instrument. Any fix packet must cover all three signatures plus
  the R1/R3 non-regression and R2 MUST-DECLINE (Opus's pre-registered
  7-bar prediction rule stands cited, not yet satisfiable — no fix
  exists to predict).
- P-SEL-2 is COMPLETE (all D-gates gradeable, all PASS). It authorizes
  no rule change (Ask 3 boundary held throughout).

## 5. Disposition

P-SEL-2 DELIVERED as evidence. Council ruling owed on the v19 relay:
(1) accept D1–D3 + this §3 as the diagnostic record; (2) DESIGN
direction — council issues the fix packet(s) (builder drafts no rule;
the R5 one-line-swap expectation is withdrawn above); (3) nothing
commits (RECON17 frozen; build `150A6159…` uncommitted; no token).
No build/run/commit/push moves until a fix packet is dual-cleared BY
NAME (+ operator auth where cost attaches).
