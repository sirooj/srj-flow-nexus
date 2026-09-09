# BUILDER DECISION MEMO — HTFSTACK-1: the HTF-stack ruling (+ the 1R-gate reference + the divergence-classification confirmation)
Memo: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_DECISION_MEMO_HTFSTACK-1.md
Date: 2026-09-09 (new session). ZERO source changes. Baselines verified at session open (EA
A0701893...3FD57E 228,604 B; CQD BE6FD84F...A421F 50,555 B; OrderblockMgr D286621C...20B7B
48,050 B; FlowLogic 1EA7858F...73B08 58,657 B; HEAD 9861414). The spec of record (Part A
v4.2) READ IN FULL before framing anything (the XOBSUIT-1 correction of record). One memo,
all open strategy-rule questions, recommendations attached (.clinerules §3).

## 1. THE DISCOVERY (HTFSTACK-1, all source-measured this session)
- The photographed FlowLogic panel (your manual instance, visual mode) reads legs
  "1H / 15m / 5m". Panel labels are DYNAMIC (FlowLogic Panels L326-328 render the actual
  bound TFs) — that instance genuinely runs 1H/15m/5m. YOUR MANUAL STACK = 1H/15m/5m.
- The EA's headless instance binds FlowLogic POSITIONALLY and EXPLICITLY (the ONLY binding
  site, EA L4280-4282, re-verified verbatim this session):
      g_hFlow = iCustom(_Symbol, PERIOD_CURRENT, InpFlowLogicName,
                        1, InpFL_HtfLookbackBars,
                        PERIOD_H4, PERIOD_H1, PERIOD_M15, false, 60);
  `1` = CTF_5MIN (enum ENUM_CHARTTF { CTF_1MIN, CTF_5MIN }, FL L129). The EA's only
  FlowLogic input is InpFL_HtfLookbackBars=3000 (EA L51) — the three TFs are hard-coded
  literals; NO EA input exposes them. Buffers 19/20/21 = H4/H1/M15 live bias
  (inUseConfirmedHTFOnly explicitly FALSE).
- FlowLogic's own defaults are H4/H1/M15 (FL L146-148); inEnableAutoTimeframeLimit=true +
  AUTOTF_BALANCED (FL L238-239) is a LOOKBACK LIMITER ONLY (FL L494 effectiveLookback=min)
  — it never touches the HTF TFs (FL L405-407 assign the manual inputs directly).

## 2. WHAT THE SPEC OF RECORD SAYS (Part A v4.2, read in full)
- §3.2: "Trend-following: retest direction agrees with the HTF aggregate (4H/1H/15m,
  simple majority, no timeframe weighted)."
- §5.6: the post-entry HTF flip exit = "HTF (4H/1H/15m aggregate) — exit at the flipping
  HTF candle's confirmation close" (trend setups, toggle, "ruled, not measured" — PARKED
  by your ruling; MT_HTF_EXIT=true stands).
- §1.1: structural bias = "the HTF 4H/1H/15m aggregate, and the 5-minute LTF bias".
- §9.1 (feed divergence): your own Dukascopy screenshot in the spec era read
  "4H Bear, 1H Bear, 15m Bear" — the spec was written against the 4H/1H/15m stack.

## 3. THE CONSEQUENCES OF A STACK CHANGE (mechanical, pre-stated)
- The edit = exactly ONE canonical file (the EA), the three TF tokens at L4281-4282
  (PERIOD_H4->PERIOD_H1, PERIOD_H1->PERIOD_M15, PERIOD_M15->PERIOD_M5), then compile +
  full headless run + gates. Nothing else in the EA or FlowLogic changes.
- NOT identity-safe: ClassifyRegime (EA L1597-1627) reads buffers 19/20/21 for the
  admission votes (votes>=2 = trendOk), and the parked §5.6 exit reads the same buffers.
  Every HTF-keyed identity RE-MEASURES: HTFCENSUS (T161R: 467/1261, 663/1065, 703/1025),
  REGIMECENSUS (=62), the admission path, and the signal pair may move in EITHER
  direction. The T161R identity base is the comparison point; gates are re-derived, not
  assumed.
- Designed observable: under 1H/15m/5m the LOW leg (buffer 21) becomes M5 — the same
  timeframe as the LTF bias panel (a different buffer, same data), so the third admission
  vote partially duplicates the §3.3 LTF check, and the M5 leg re-runs its open-instant
  replay EVERY M5 bar (HTFAUDIT-1's mechanism applies to whatever TFs are bound; lower
  TFs replay more often).

## 4. Q1 — THE HTF STACK (build-determining; operator-reserved)
- (a) KEEP 4H/1H/15m as-built — the spec of record's stack (§3.2/§5.6/§1.1); zero changes;
  the photographed panel was your manual instance's remembered inputs, not a ruling.
- (b) RE-BASE the EA to 1H/15m/5m — your manual discretionary stack as photographed;
  P-HTFSTACK drafted + executed (one canonical file, the three tokens, full gates).
- (c) A SPLIT (admission on one stack, the §5.6 exit on another) — mechanically possible
  but needs a SECOND FlowLogic instance (a second iCustom handle + new export buffers):
  a larger packet; note §5.6 itself is parked, so this only matters when it un-parks.
- (d) ANOTHER STACK — specify (e.g. D1/H4/H1).
Builder recommendation: (b) IF the photographed panel is how you actually classify regime
when you trade manually — the goal is that the EA takes YOUR trades; the spec's 4H/1H/15m
dates from before this discovery. (a) if the panel was a template artifact and your
standard is the spec's. Your call; both are one packet away.

## 5. Q2 — THE 1R ADMISSION GATE'S REFERENCE (the 08.18 TP_RR_FAIL mechanism)
Measured (T161R, mechanism-named in BUILDER_RESULT_161-R §G5): the restored -2 verdicts at
08.18 14:20/14:40 latched the candidate, but it died at the gate-check with TP_RR_FAIL —
under P-NEXTOPEN's next-open entry reference R computes below 1.00 (T161I's
confirming-close reference gave 1.06). Net today: NO 08.18 signal = AGREES with your manual
rejection of that setup (invalid CQD).
- The spec carries BOTH words: §3.7 the 1R gate ("Pre-entry: the nearest valid
  take-profit target ... must imply at least 1R, or the setup is not taken"; §6 your own
  words: "i would probably first, not execute the first trade cause there is a near (less
  than 1R TP)" — the gate IS your rule); §3.9 "The reward/risk reference is the confirming
  close, latched"; §4 (your P-NEXTOPEN directive) "evaluate at the next candle's open" at
  the confirmation site — which moved the ENTRY leg of R to the next open.
- Options:
  (a) KEEP AS-BUILT — R computed with the next-open entry (the P-NEXTOPEN directive
      applied consistently). The 08.18-class setups with R<1 at the next open stay
      unsignaled. RECOMMENDED: it is your latest explicit directive, and the outcome
      matches your manual standard.
  (b) R's entry leg = the CONFIRMING CLOSE (§3.9 literal), everything else next-open.
      The 08.18 SHORT would RETURN (R=1.06) and signal — re-creating the false positive
      the EA-side Agreement Sample 2 eliminated (your manual verdict: invalid CQD).
  (c) DROP the 1R gate (contradicts §3.7 + your §6 words — listed for completeness only).

## 6. Q3 — THE DIVERGENCE-VALIDITY CLASSIFICATION (a confirmation, not a new rule)
The standing rulings already govern: "The EA follows the indicators" (divergence validity =
the indicator's verdict stream; the EA consumes, never overrides) + strict
latest-at-confirmation with clearing (P-DIVCON-B) + CONFIRMED lines only. T161R restored
the full stream (493 verdicts; the 08.18 code-4s present again) and the EA consumes it;
the 08.18 outcome agrees with your manual rejection. RECOMMENDATION: close this item as
"no additional classification to encode — the standing rulings stand." If you DO hold a
validity standard the EA should apply ON TOP of the indicator's verdict stream, state it
and it becomes a packet; otherwise no action.

## 7. THE ASK (one relay)
Q1 the stack (§4) — build-determining. Q2 the 1R reference (§5). Q3 the confirmation (§6).
Answer all three in one message if convenient; Q1 alone unblocks the first work item.

## 8. RULINGS RECEIVED 2026-09-09 (in-session; the items CLOSE)
- Q1: "Keep 4H/1H/15m as-built — the spec of record's stack; no change." THE HTF STACK IS
  SETTLED: the EA's binding (EA L4281-4282, PERIOD_H4/H1/M15) IS the operator's ruled
  stack; the photographed 1H/15m/5m panel was the manual instance's remembered inputs,
  not the standard. P-HTFSTACK will NOT be drafted. Zero source changes.
- Q2: "Keep as-built — R uses the next-open entry (recommended; the 08.18-class setups
  stay unsignaled)." THE 1R GATE STANDS AS IMPLEMENTED: the R computation's entry leg =
  the next candle's open (the P-NEXTOPEN directive applied consistently); the TP_RR_FAIL
  death of the 08.18 candidate is the ruled behavior, and the resulting no-signal agrees
  with the operator's manual rejection of that setup.
- Q3: "Confirm — close it: the EA consumes the indicator's verdict stream; nothing more
  to encode." THE DIVERGENCE-VALIDITY CLASSIFICATION ITEM IS CLOSED under the standing
  rulings (the EA follows the indicators; strict latest-at-confirmation with clearing;
  CONFIRMED lines only).
CONSEQUENCE: all three open strategy-rule items on the session-opening work list close
with ZERO source changes. THE QUEUED WORK REDUCES TO: the §5.6 backtest item (parked by
the operator; MT_HTF_EXIT=true stands); the 155-RT-A reissue; the 161-REG acceptance;
a git snapshot + push ONLY on explicit operator tokens; recertification on request.