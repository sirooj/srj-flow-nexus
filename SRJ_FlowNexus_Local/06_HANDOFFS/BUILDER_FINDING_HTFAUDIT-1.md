# BUILDER FINDING — HTFAUDIT-1: the §5.6 HTF-exit mechanism measured end-to-end
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_HTFAUDIT-1.md
Date: 2026-09-09 (session, post-161-P). Basis: the operator's in-session questions after the
§5.6 judgment request. READ-ONLY — ZERO source changes. Baselines verified at session open
(EA 82DDAB33...D3E709 228,294 B CRLF=4606; CQD 92F3A62B...2969F; OrderblockMgr D286621C...20B7B;
FlowLogic 1EA7858F...73B08).

## 1. THE OPERATOR'S DATUMS (verbatim, this session)
- "i think, the fault is the SRJ Flow Logic HTF auto detection. i have experienced that
  sometimes, in very small instance, the HTF bias detection is not correct and not robust,
  although majority of the time it is correct."
- "i have attached the 15m HTF chart because if you exit at 16:45, that must come from the
  15m bias change. but there is no bias change at the time and the bearish bias flip only
  occur at 17:30 later." (the attachment did not arrive as a readable file; the verbatim
  description is the datum of record)
- "also my 8.17 entry was at 15:50 confirmation candle." (consistent with EXIT-0817; the EA's
  candidate seeded 15:50:03 — the same bar — and alerted 16:35:02)
- "the experiment to consider the HTF change to invalidate or early exit for the trend
  following setup is open item to backtest in the future." (THE §5.6 RULING — parked; the
  toggle stays MT_HTF_EXIT=true, no packet issued, no canonical change)
- "the 8.20 trade entry time is correct but i exit on the S LQ target." (their row #233's
  TP LQ; the EA's exit-target machinery = the twelve POI lines — the recorded TP layer)
- "although it is a trend following setup, what HTF bias can change at the 14:05, and how
  your RR gain was 2.8?"

## 2. THE EA CONSUMER (source verbatim, EA L4534-4552)
    if(MT_HTF_EXIT && !vSL && !vTP && !vBREAK)
      if(regimeAtAdmission == REGIME_TREND || == REGIME_BOTH)
        ReadFlow(FL_BUF_HTF_HIGH/MID/LOW, ..., barShift)  // buffers 19/20/21, the just-closed M5 bar
        want = (dir==LONG ? 1 : -1); anti = count of legs == -want;
        vHTF = (anti >= 2);   // "the majority flipped AGAINST the trade"
SEMANTICS: a per-bar STATE test of FlowLogic's exported aggregate — 2-of-3 legs currently
AGAINST. No stored previous state, no EA-side flip memory, NO per-leg logging (the
EXITVERDICT line prints only the boolean).

## 3. THE BINDING AND THE EXPORT FLAVOR (the decisive fact)
EA L4280-4282 (verbatim): g_hFlow = iCustom(_Symbol, PERIOD_CURRENT, InpFlowLogicName,
  1, InpFL_HtfLookbackBars, PERIOD_H4, PERIOD_H1, PERIOD_M15, false, 60);
Positional mapping to FlowLogic inputs (L143-150): inChartTradingTF=CTF_5MIN;
inHtfLookbackBars=3000; inHtf1_manual=PERIOD_H4 (buffer 19); inHtf2_manual=PERIOD_H1
(buffer 20); inHtf3_manual=PERIOD_M15 (buffer 21); inUseConfirmedHTFOnly=FALSE (explicitly
passed); inHtfMaxTrackedObjects=60.
FlowLogic L1003-1008 (verbatim): h_b = inUseConfirmedHTFOnly ? outCBias : outBias;
  g_bufHtfHi[target] = (h1_b=="Bull") ? 1.0 : (h1_b=="Bear" ? -1.0 : 0.0);
CONSEQUENCE: the LIVE flavor (outBias) was exported to buffers 19/20/21 in T161P and every
prior run — by the EA's own explicit `false`, not by a default accident.

## 4. THE HTF ENGINE MECHANICS (SRJ_HTFEngine.mqh, source verbatim)
- Call site: FlowLogic L1216-1217 SRJ_HTF_RunAll(...) every OnCalculate; FlowLogic L737
  g_newBar = (time[lastIdx] != g_lastBarTime).
- Per-leg gate (L536-544): skip if newestHTFTime == e.lastProcessedHTFTime; skip if
  !g_newBar. THEREFORE each leg recomputes exactly ONCE per HTF bar — at the first M5 bar
  of that HTF bar (its OPEN instant) — and is FROZEN at that value for the whole HTF bar.
- Each recompute is a FULL REPLAY (L552-554): SRJ_HTF_StateInit(e) wipes the leg, then
  ProcessBar over j=2..copied-1 (up to 3000 HTF bars). barClosed = (j < htfTotal-1) (L107):
  the forming bar IS included in the replay, represented by its first ticks.
- Structure judgment AT THE OPEN INSTANT (L115-118 verbatim):
  bool isHigh = rh[j-1] > rh[j] && rh[j-1] > rh[j-2];  // j = the forming bar
  A confirmed swing high at bar j-1 VANISHES if the forming bar's high-so-far (its opening
  ticks) already exceeds it — a repaint-at-open: structures appear/vanish at the HTF bar's
  open with NO confirmed close.
- Two output flavors (L500-509, L570-577): outBias = LIVE (includes the forming bar's
  provisional state as of the open-instant replay); outCBias = CONFIRMED (bias over closed
  bars only, repaint-free — the chart-equivalent read).
## 5. THE TWO EXITS RECONSTRUCTED (journal + census, T161P verbatim)
- 08.17 (LONG Weekly-VWAP): REGIMECENSUS #13 bar=15:45 votes=2 trendOk=1 (evaluated
  15:50:03 — the operator's 15:50 confirmation bar; one leg already against at admission).
  EXITVERDICT vHTF: bar=16:35 0, bar=16:40 0, bar=16:45 1 -> MTEXIT 16:45 HTF_FLIP
  exit=1.15921. Replay schedule 15:45->16:45: M15 re-ran at 16:00/16:15/16:30/16:45;
  H1 re-ran ONLY at 16:00 (frozen until 17:00); H4 re-ran ONLY at 16:00 (frozen until
  20:00). So the vHTF 0->1 change at the 16:45 bar can come ONLY from the M15 leg's
  16:45:00.x open-instant replay. The operator's chart's CONFIRMED 15m bias flips at
  17:30 — the EA consumed the OPEN-INSTANT PROVISIONAL M15 read, which crossed against
  at 16:45. THE MEASURED DIVERGENCE.
- 08.20 (LONG Daily-VWAP): REGIMECENSUS #37 bar=09:15 votes=3 (all legs FOR at admission).
  EXITVERDICT vHTF: 0 through bar=13:55, bar=14:00 1 -> MTEXIT 14:05 HTF_FLIP exit=1.16955.
  At the 14:00 boundary BOTH the M15 leg (new bar [14:00,14:15)) and the H1 leg (new bar
  [14:00,15:00)) re-ran their open-instant replays; H4 was frozen since 12:00. The
  aggregate crossed to 2-of-3 against there. WHICH two legs carried the against-votes is
  NOT logged (the §5.6 branch prints only the boolean) — a per-leg diagnostic is a packet
  item (§8 P-HTFLOG).
- HTFCENSUS (Task 19c, run-final, T161P verbatim): every one of the 1,728 bars holds a
  definite +/-1 on all three legs (zero=0 everywhere); H4 neg/pos=467/1261, H1 663/1065,
  M15 703/1025.

## 6. ANSWERS TO THE OPERATOR'S THREE QUESTIONS
1. "if you exit at 16:45, that must come from the 15m bias change" — MECHANICALLY YES:
   the 16:45 change is the M15 leg's (the only leg that re-ran). But it is NOT the
   chart's 15m bias: it is FlowLogic's structure-based bias replayed at the 16:45 bar's
   OPEN INSTANT with the forming bar's first ticks — a provisional read a confirmed-bar
   chart cannot show. The flip read at 17:30 is the confirmed one.
2. "what HTF bias can change at the 14:05" — the M15 and H1 legs' open-instant replays at
   the 14:00 boundary; which two voted against is unlogged (P-HTFLOG measures it).
3. "how your RR gain was 2.8?" — IT WAS NOT: "2.8R" was the builder's arithmetic slip in
   chat (18.2 divided by the TP distance 6.4 instead of the risk). CORRECT: gain
   1.16955-1.16773 = +18.2 pts; risk 1.16773-1.16733 = 4.0 pts; +18.2/4.0 = ~4.55R.
   (The 08.17 exit: -6.1 pts against 11.2 pts risk = ~-0.54R.)

## 7. THE SUSPECTED FAULT, MECHANIZED
The operator's "HTF auto detection ... not correct and not robust, although majority of
the time it is correct" is now a measured mechanism: the exported legs are OPEN-INSTANT
SNAPSHOTS of forming HTF bars (frozen for the bar's whole duration), computed by a full
replay whose structure judgment repaints at the open (L115-118). Neither confirmed-only
(the chart's read) nor live-tracking — a third semantics the EA then treats as the HTF
aggregate for BOTH the admission regime and the §5.6 exit.

## 8. PACKET-SHAPED OPTIONS (NOT ISSUED — the builder recommends, the operator disposes)
- P-HTFLOG (measurement-first, spec §4's mitigation; recommended FIRST): extend the
  EXITVERDICT print with the three leg values + anti — diagnostic-only logging, one
  print-format edit, entry-side untouched. Measures which leg votes against at which bar
  for BOTH exits and every future one. Identity-safe (logging only).
- P-HTFCONF: flip the binding word false->true at EA L4282 (inUseConfirmedHTFOnly=true) —
  the legs then export the CONFIRMED (closed-bar) bias, aligning the EA with the chart's
  read; an HTF exit then cannot fire before a confirmed HTF close. NOT identity-safe:
  ClassifyRegime (EA L1597-1627) reads the SAME buffers — admission votes change, the
  entry picture may move; requires the full S1-S7 gates vs T161P.
- LEAVE AS-IS: the operator's §5.6 ruling parks the experiment for a future backtest; the
  toggle stands at MT_HTF_EXIT=true until a packet says otherwise.

## 9. RECORD DISCIPLINE
R-180 DECLARED: four shell-capture failures this session (BIAS/REGIME greps x2, the
FlowLogic grep, one context grep) — all re-issued via file-redirect + IDE file-reads
(shell-independent). No canonical file touched. Nothing under 02_TASK_CHECKPOINTS. No git
token. Working extracts (_tmp_*.txt) deleted after incorporation.

