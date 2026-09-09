# BUILDER FINDING — 0814-MISS: the 08.14 audit (work item 2, T161K re-trace)
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_0814-MISS.md
Date: 2026-09-09. ZERO source changes. All lines verbatim from T161K_JOURNAL.log
(06_HANDOFFS), the run-verified T161K trace of the current EA baseline.

## 1. THE OPERATOR'S ROW (OPERATOR_TRADE_JOURNAL.csv line 218, row #217, verbatim fields)
217, 8/14/26, LDN, TF, Bull/Bull/Bull, 🐂, LQ Sweep (empty), POI = W VWAP, CVD = ❌,
TP LQ = S LQ, comment "0.18R <TradingView link>" — TAKEN, small winner.

## 2. THE EA'S TRACE (T161K journal, 2026.08.14 London)
- 09:15:00  "Alert: EURUSD M5 - POI RETEST LONG at 1.15409  [W-VWAP]" (the marker's alert)
- 09:15:00  STATE IDLE->S1_REGIME dir=LONG poi=Weekly-VWAP
- 09:15:00  REGIMECENSUS #1 bar=09:10 dir=LONG votes=3 trendOk=1 sweepTag=1 mrOk=0
            (the trend filter PASSED — 3/3 HTF votes)
- 09:15:00  S1->S2_LTF_ALIGN->S3_ZONE_WAIT (same bar)
- 09:15:00  ZONEPICK haveXob=1 xobInPlay=1 xob=1.15393-1.15403 (XOB 1811, promoted 09:05);
            S3INPLAY inPlay=1 via=SWING1
- 09:15:00  STATE S3_ZONE_WAIT->S4_ARMED — THE EA ARMED THE OPERATOR'S SETUP ON THE
            SAME BAR THE OPERATOR ENTERED (their 0.18R winner from W VWAP).
- 09:20:00  FRESHCOUNT #1 bar=09:15 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0
            adverse=1 verdict=HOLD (cum1=1). (Also: a Yearly-POC LONG retest this bar was
            SUPPRESSED higher=1 heldPoi=Weekly-VWAP — the singleton at work.)
- 09:25:02  IDCHANGE bar=09:20 xobId=1811->1795 (the backing XOB was replaced; the zone
            moved 1.15393-1.15403 -> 1.15348-1.15356)
- 09:25:02  FRESHCOUNT #2 bar=09:20 obDead=1 fvgDead=1 oppFvg=0 adverse=2 verdict=ABORT
- 09:25:02  "ABORT reason=FRESH_OB_DEAD state=S4_ARMED poi=Weekly-VWAP dir=LONG"
            -> S4_ARMED->ABORT. The sequence died HERE.
- 09:30:00  a Yearly-POC SHORT seeded (mean-reversion, votes=0 mrOk=1) and sat at S2
            "LTF bias unaligned" (retained) — it produced nothing.

## 3. THE MECHANISM — TWO INDEPENDENT GATES, EITHER SUFFICES TO BLOCK THE SIGNAL
1. THE 2-of-3 PRE-CONFIRMATION KILL (spec §3; charter §2): at bar 09:20 the freshness
   poll held TWO adverse flags (obDead — the backing XOB died/was replaced; fvgDead —
   the leg FVG died). adverse >= 2 -> ABORT at 09:25:02, one bar after arming.
   This abort is IDENTICAL in the old frozen baseline (Task 155REG Aborts.txt:
   "2026.08.14 09:25:02 ABORT reason=FRESH_OB_DEAD state=S4_ARMED poi=Weekly-VWAP") —
   NOT a T161K regression.
2. THE DIVERGENCE LATCH: the newest confirmed CQD verdict in the candidate's window was
   -1 (bearish normal, bar 09:00, read 09:10:03) — direction-MISMATCHED for a LONG.
   Under the ruled strict latest-at-confirmation the latch was CLEAR (0) at every
   candidate bar, so S5 could not fire even without the abort (no matched verdict
   re-latched before 09:25).

## 4. THE DISAGREEMENT WITH THE OPERATOR'S EXECUTED PRACTICE (measured, not judged)
The operator TAKEN this trade with CVD=❌ (their own row). The EA's two blocking gates
say: (1) a dead zone XOB + dead FVG before confirmation kills the setup; (2) a
direction-matched CQD divergence must be the latest confirmed verdict before entry.
On 08.14 the operator's practice violated both encoded rules and still won 0.18R.
On 08.20 (row #233, TAKEN, R=1.61) the operator's row carries CVD=3 and the EA's +2
latch agreed — so the divergence requirement is not uniformly absent in their practice.

## 5. QUESTIONS FOR THE OPERATOR (batched; also in BUILDER_FINDING_ANCHORTIER-1.md §9)
Q-A. Is the pre-confirmation 2-of-3 kill correct as your standard — would YOU have
     dropped the 09:15 W-VWAP long because the backing XOB and the leg FVG died
     before the confirming candle? (If yes, the EA is right and 08.14 stays a MISS
     by your own rule; if no, the obDead/fvgDead flags need your rule.)
Q-B. Is a direction-matched CQD divergence REQUIRED for every TF entry (spec §3.8),
     or only decisive WHEN ONE EXISTS? (Your 08.14 row: CVD=❌, taken; your 08.20
     row: CVD=3, taken.)

## 6. OPERATOR ANSWER (Q5, 2026-09-09 in-session) — THE ROW READS DIFFERENTLY
The operator, verbatim: "you read it wrong, [row #217 fields] ... i guess due to the .csv
format what i meant with the 0.18R is i document the invalid trade that was less than 1R
and invalid CQD, but i write the 0.18R not with the same column with the Gain % but in the
comments section."
RESOLVED READING: "0.18R" sits in the COMMENT column; Gain % is EMPTY on the row. The row
documents an INVALID trade by the operator's own standard — invalid CQD (CVD=❌) AND less
than 1R; 0.18R is the outcome recorded in the comment.
CONSEQUENCE: the "08.14 MISS" dissolves as a VALIDITY disagreement. The operator's own
classification marks the setup invalid (invalid CQD), and the EA's no-signal AGREES: the
divergence latch was CLEAR (newest confirmed verdict -1, direction-mismatched) and the
2-of-3 poll killed the armed sequence besides. The EA refusing to signal an invalid-CQD
setup is agreement with the operator's validity standard, not a miss.
REMAINING OPEN (narrowed): whether the 2-of-3 pre-confirmation kill (obDead+fvgDead)
matches the operator's standard in general — moot for 08.14's classification (the CQD
invalidity alone governs), still unverified as a general rule.
TIER-1 VALIDITY PICTURE AFTER THIS CORRECTION: 08.14 agreement (invalid setup -> no EA
signal); 08.17 candidate agreement; 08.18 agreement (no false positive; the 18:20
suppression ruled correct); 08.19/21 absence agreements; 08.20 AGREEMENT SAMPLE 4.
NO VALIDITY DISAGREEMENT REMAINS IN THE TIER-1 WINDOW.
