# BUILDER_FINDING — operator chart read, Sep-7 NYAM (2026-09-12)

Source: operator screenshot (EURUSD M5, cursor bar 2026.09.07 16:15:
O 1.16266 / H 1.16266 / L 1.16239 / C 1.16250). Second source for price
only; labels remain his (governance: hand record motivates, never adjudicates).

## Agreed

- Entry 1.16261 at 16:45: operator confirms "perfect". Matches SIGNAL
  (bid=1.16261) and SLIMBR entry=1.16261 exactly.

## TP correction (TP subsystem, not SL) — RESOLVED off-log, no defect

- Code: tp=1.16315. Operator: 1.16318 = Yearly VWAP.
- TPCENSUS #355–#364 (16:00→16:40 bars): winner=Yearly-VWAP on every row,
  best=1.16315 at the 16:40 decision bar. The code picked HIS line; his
  1.16318 is the same line read later (VWAP drifts; +3 points after).
- Same line, different read time. No TP finding stands.

## SL specification (his rule, as stated)

- "It should be 16:15 low, from two swings away; first swing is 16:30."
- Operator reading: walking back from entry, nearest fractal swing =
  16:30 (skip), stop at the second = 16:15 low = 1.16239 (his dark-red
  line; status-bar low confirms the price).
- Code side (RECON11b SLIMBR 16:40 row): fractal anchor = 16:30 shift
  (his "first swing" — anchor agreement), anchor value 1.16240; walk did
  NOT stop at 16:15 (1.16239 misses strict exceedance past 1.16240 by a
  tenth of a pip, and/or lacks imbalance code 1 — flag read owed
  off-log); walked to slFractal=1.16112 with nuance carve holding
  slFractalNuance=1.16240.
- So the two candidate stops differ by 0.1 pip AND by rule: his = second
  fractal swing back (no imbalance requirement stated); code's =
  walk-to-imbalance with strict exceedance. PROVEN off-log (SWINGDUMP #29,
  S5, 16:40 eval): confirmed fractal lows in the neighborhood read
  1.16240 / 1.16239 / 1.16238 — a tenth-pip staircase. The strict
  exceedance idiom (beyond by MORE than a point) steps over the middle
  step by construction (1.16239 is exactly one point under 1.16240) and
  walks to 1.16112; his rule takes the middle step. Both skip the first
  step for the same reason (16:30-slot flag=0, no imbalance — WALKF row).
  Agreement on objects, disagreement on one rule sentence.
- Question owed: is "second fractal swing back, skip nearest" the GENERAL
  SL rule, or did 16:30 get skipped here for a reason (no imbalance?
  wick-only?)? And: does the second swing need imbalance, or is the
  count alone the rule?
- He states the same pattern covers the other three sample trades
  (his numbers vs code's). Code-side exact numbers for all four are in
  RECON11b SLIMBR; his journal numbers for the other three are owed for
  the field-by-field diff.

## Label pairs resolved by price (of three)

- 16:15 = low 1.16239: RESOLVED (his status bar; code's newerT=16:05 is a
  different bar — the pair is now 16:05-vs-16:15 by label, agreed price
  unknown for 16:05; check off-log: 16:05 bar low vs 1.16238 newerWick).
- 14:55-vs-15:15 (+20) and 16:30-vs-16:15 (−15): still open. Note the new
  subtlety: his "first swing 16:30" AGREES with the code's anchor shift,
  so the −15 pair may be anchor-label (16:30, agreed) vs stop-label
  (16:15, his) — i.e. possibly never a disagreement about the same bar.
- His chart also draws the code's levels (1.16218, 1.16315) — visual
  reconciliation in progress on his side.

## Routing

- SL definition + TP rule + N1 wick ruling + label-by-content table: all
  operator/council decisions. NO canonical edit. A council definition
  packet is the only thing that moves selection.
- RECON12-NEWS (in flight) is unaffected: print-only census, no selection.

---

## APPENDIX 2026-09-12: operator journal numbers, all four signals

His framework: the three agreed SL rules (one a nuance rule), no
elaboration offered or needed. Ultimate goal reaffirmed: match the
trades he would take. "19:20" read as 09:20 typo (price matches).

### Aug 28 SHORT — entry+SL+TP agree; exit mechanism differs

- Entry 10:05 open 1.16466 ✓ (SIGNAL bid). SL 6:30 high 1.16508 ✓
  (sl_ref). TP prev-day NY low ✓ (tp=1.16364, presumably).
- Exit: code TP_TOUCH 1.16451 on the 11:30 bar; his: D-POC gapped down
  so target void, out on the 11:30 candle that broke D-POC bullish.
  EXITCENSUS 11:25: D-POC=1.16532 behind, verdict ok (no break yet) —
  his break is the 11:30 candle itself. Same bar, different mechanism
  (near-target touch vs adverse POC break); his exit PRICE owed.
- Note: his "gap down voids target" is discretionary context with no
  code counterpart — exit-packet domain.

### Sep 4 LONG — entry+TP agree; SL and exit differ materially

- Entry 16:00 open 1.16018 ✓. TP LD high 1.16302 ✓.
- SL: code 1.15907 (1-swing, chosen shift 408 = Sep-3 05:55 — the
  conservative rule reaching back a day) vs his 15:30 swing low 1.15847
  (60 pts wider). Code's OB walk went to 1.15832 (base, R 1.53) with
  nuance carve holding 1.15907; fractal walk EXHAUSTED at 1.15907. His
  1.15847 sits between code's base and today; appears in no printed
  walk value (price unverified, rule path his).
- His R at TP: 284/171 = 1.66; at his flat: 111/171 = 0.65.
- Exit: code HTF_FLIP 1.15990 at 16:05 (−28, instant) vs his hold to the
  day-close flat 1.16129 at 23:05 (+111). The exit packet must address
  HTF_FLIP sensitivity and the day-close flat.
- His day close: "23:05 = 5 min before the day close" → close ≈ 23:10
  server ≈ 16:10 ET?? Unreconciled — P-NEWS-1 census assumed 17:00 ET
  (00:00 server). DEFINITION OWED; census marks carry the assumption
  explicitly until ruled.

### Sep 7 AM LONG — full agreement

- Entry 09:20 open 1.16135 ✓, SL 8:40 low 1.16098 ✓ (sl_ref), TP Asian
  high 1.16200 ✓ (tp_target). Nothing to reconcile.

### Scorecard

- Exact: Sep-7 AM (3/3). Entry bars: 4/4. TP lines: 4/4 (one drift).
- Open: Sep-7 PM SL rule sentence (0.1 pip); Aug-28 exit price+mechanism;
  Sep-4 SL (60 pts) + exit (flip vs flat) + day-close definition.

---

## APPENDIX 2 2026-09-12: exit price + day close resolved

- Aug-28 exit price: his 1.16464 vs code 1.16451 — 13 points apart, same
  11:30 bar (short from 1.16466: his +2, code +15). Mechanisms differ
  (POC-break vs near-target touch), outcomes converge to a scratch.
  Aug-28 reconciled for practical purposes; no finding stands.
- Day close: his "23:05" was a 23:55 typo (Data Window proves it: Sep-4
  23:55 open = 1.16129 = his flat price). His rule = flat at the 23:55
  bar OPEN, i.e. 5 min before the 00:00 broker close = 17:00 New York.
  This is EXACTLY the P-NEWS-1 census definition (16:55 ET → 23:55
  server, quoted in BLACKOUT_CENSUS) — no amendment needed; the running
  RECON12 marks are correctly placed. Flat executes at the bar open, not
  the close — carried into the exit-side packet.
- Corroboration in the same screenshot: Data Window Y-VWAP = 1.16318 vs
  1.16315 at decision — same line, drifted (TP story closed).

---

## APPENDIX 3 2026-09-12: SL rule generalized by operator (both cases)

- His rule, general (his words): the stop is EXACTLY two swings away —
  Sep-7 (skip 16:30, use 16:15 low 1.16239) and Sep-4 (15:30 low 1.15847)
  both. No imbalance requirement, no walk. This is the definition input
  for the council packet (conservative OB+Swing vs fractal-two-away).
- His characterization of the code's 1.16112 (Sep-7 fractal base): a
  "ghost" — anchored nowhere logical on his chart. Filed as his
  assessment (motivates the definition question; the code followed its
  own walk rule correctly to get there — walkSteps=20, base 1.16112).
- Census: operator directs proceed — RECON12-NEWS continues undisturbed.
