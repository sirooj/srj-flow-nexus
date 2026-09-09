# BUILDER FINDING — ANCHORTIER-1: the anchor-tier / POI-selection map (work item 1)
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_ANCHORTIER-1.md
Date: 2026-09-09. ZERO source changes. All EA line numbers measured on the current baseline
E5B0E2E4830BEFD24F18EC712A7806C17305F8BDDF30EEC8AF291412F5AFEECA (207,854 B, 4,204 CRLFs),
re-verified at session start. Include/FlowLogic line numbers on the Task-160 reference states.
Purpose: the mechanical map the operator reserved open item (a) against. The RULE ITSELF IS
NOT INVENTED HERE — section 9 holds the batched questions.

## 1. THE LINE SET (12 lines) AND WHERE THEY COME FROM
- EA L63-74: POI_BUF_D_POC=0, D_VWAP=1, W_POC=2, W_VWAP=3, M_POC=4, M_VWAP=5, Q_POC=6,
  Q_VWAP=7, Y_POC=8, Y_VWAP=9, F_POC=10, F_VWAP=11 (F = FOMC). POI_NLINES = 12.
- The buffers are supplied by the SRJ_POI_Marker indicator (EA L23 InpPoiMarkerName
  default "SRJ_POI_Marker"; iCustom bind EA L4103). The marker also fires the journal's
  "Alert: ... POI RETEST ..." lines and writes Files\SRJ_POI_Retests_EURUSD.csv.
- VOCABULARY RESOLVED (measured from the marker's own retest CSV, line_name column):
  the marker's POC lines are named "Weekly AVP-POC", "Monthly AVP-POC", "Daily AVP-POC"...
  The operator's journal POI values "W AVP" / "D AVP" / "F AVP" / "Y AVP" therefore map to
  the EA's *-POC buffers (W-POC, D-POC...), and "W VWAP"/"D VWAP" to the *-VWAP buffers.
  There is NO missing line family: all four Tier-1 operator POIs (W VWAP, D VWAP, W AVP,
  D AVP) exist in the 12-line set. (Operator to confirm in the ruling.)
- Label detail: the marker's CSV rank column is 1-BASED (M-POC=7 ... D-VWAP=12); the EA's
  g_authorityRank is 0-BASED (M-POC=6 ... D-VWAP=11). Same order, offset by one.
  The marker alert suffix "[D-POC +1]" marks a second line co-located at the same level.

## 2. THE AUTHORITY RANK TABLE (EA L77, L82-93)
Lower rank = MORE authoritative:
  FOMC-POC=0, FOMC-VWAP=1, Yearly-POC=2, Yearly-VWAP=3, Quarterly-POC=4, Quarterly-VWAP=5,
  Monthly-POC=6, Monthly-VWAP=7, Weekly-POC=8, Weekly-VWAP=9, Daily-POC=10, Daily-VWAP=11.
Two collapses of the same table:
  - RAW RANK: distinguishes POC-over-VWAP inside a family (used by the same-bar tie, the
    Task-73 census "higher" flag, the T73 shadow test).
  - FAMILY PAIR rank/2: FOMC=0, Yearly=1, Quarterly=2, Monthly=3, Weekly=4, Daily=5 —
    "the ANCHOR TIER" (used by the TP admission filter EA L1640 and the POIREPLACE census
    EA L3087-3088; the /2 pairing is measured, REVISION_64_RULINGS R-193 era record).

## 3. THE RETEST PREDICATE — DetectPoiRetest (EA L1446-1488, post-T161K)
- Reads o/h/l/c of the retest bar (barShift) and cNext = the NEXT candle's OPEN
  (EA L1459, the T161K E1 edit; fail-soft to the retest close if the next open is
  unreadable). bodyLo/bodyHi = min/max(o, cNext) — the body is open -> next-open
  (Part A spec section 4, operator directive "Proceed").
- All 12 line values are snapshotted AT THE RETEST BAR (ReadBuf1, EA L1468) — the
  declared POI-snapshot-timing boundary (unchanged by T161K).
- LONG: l <= L - Point + EPS  (the bar WICKED below the line) AND bodyLo >= L - EPS
  (the open->next-open body stayed on/above the line). SHORT: mirrored (h >= L + Point
  - EPS AND bodyHi <= L + EPS). Threshold-free (EPS = 0.001 point, a float guard only).

## 4. THE SAME-BAR TIE RULE (EA L1471-1486)
Among all lines qualifying on one bar: the LOWEST rank wins per direction
(bestLongRank/bestShortRank); if both directions qualify, the lower rank wins
(EA L1483, `bestLongRank <= bestShortRank` favours LONG on equality). Exact rank ties
are impossible (ranks unique). This is EA-96's same-bar tie rule.

## 5. SEEDING — the IDLE block (EA L3163-3193)
Requires: inside the session window (inWindow), session not already used
(SessionAlreadyUsed, EA L3166 — one SIGNAL per session window; aborts do not consume).
Then DetectPoiRetest -> g_anchorLine = the single winning line; g_dir; g_anchorPrice =
the line value AT THE RETEST BAR (EA L3187); g_sessionAtEntry stamped; g_divLatch=false;
S1_REGIME. The regime/LTF/zone/divergence gates run downstream (S1->S5).

## 6. WHILE A CANDIDATE IS ALIVE — the singleton and YOUR OWN RULING
- Every retest arriving while a candidate is alive is DISCARDED (dedup while alive).
  The Task-73 census (EA L3127-3161) prints each: poi/dir/opp/higher, where
  higher = raw-rank comparison (t73_isHigh, EA L3142).
- ACROSS-TIME REPLACEMENT IS REMOVED — by YOUR ruling, verbatim on EA L3100
  (Task 91 / EA-105 / operator ruling Q3): "i will always execute the first one, the
  later higher POI does not get executed... if i have executed the first trade, i would
  not execute other trade even it's from higher hierarchy." Arrival order governs across
  time; anchor tier governs ONLY the same-bar tie (section 4). The POIREPLACE line
  (EA L3091) is retained as a counterfactual census: it prints when an OPPOSITE-direction
  retest of a HIGHER FAMILY-PAIR (rank/2) arrives while a candidate is alive.
- G-5's same-direction higher-tier upgrade: deliberately NOT implemented (EA L3047-3049).

## 7. TP TARGET ADMISSION — ComputeNearestTpTarget (EA L1590-1644)
Candidates: the ten session/previous-day levels (mask-filtered by the swept+live mask,
EA L1631-1636) plus the 12 POI lines, where a POI line is ADMITTED only if it is in the
ANCHOR'S OWN family-pair or any MORE-authoritative family (skip if k == anchor or
rank[k]/2 > anchorRank/2, EA L1640). Nearest in-direction value wins; a target inside
the entry zone is excluded (Task 31 / Ruling 7c, EA L1553-1560). This is where the
operator's "D VWAP" TP family comes from for a Daily-POC anchor, etc.

## 8. MEASURED INSTANCES (T161K_JOURNAL.log, 06_HANDOFFS)
a. 08.18 14:15 — the candidate that produced the (now-eliminated) 14:50 signal anchored
   Daily-POC (rank 10). The operator's setup referenced W POC / W AVP (= Weekly
   AVP-POC, rank 8). Mechanically: on bar 14:15 the Daily-POC was the most authoritative
   line passing the wick+body test; no Weekly line qualified there.
b. 08.18 17:35-18:40 — CORRECTION TO THE STANDING RECORD. The EA was NOT idle at the
   operator's 18:20 W-POC setup. Measured: a Weekly-POC LONG seeded 17:35:02
   (S1->S2), then sat at S2_LTF_ALIGN "LTF bias unaligned, candidate RETAINED
   (Stage 3a)" from 17:40 through 18:35 (FRESHSKIP PRE_BINDING every bar). The
   operator's W-POC SHORT retests on bars 18:20 and 18:25 (marker alerts 18:25:00 and
   18:30:00, both at 1.15786) were SUPPRESSED by the alive singleton:
   "SUPPRESSED bar=18:20 poi=Weekly-POC dir=SHORT opp=1 higher=0 heldPoi=Weekly-POC
   heldDir=LONG heldState=S2_LTF_ALIGN" (cum_opp 11) and the same at bar=18:25
   (cum_opp 12). The bar-18:35 W-POC short (alert 18:40:00) shows NO census line —
   under the T161K next-open body test it did not qualify (measured absence). The held
   Weekly-POC LONG finally armed S3->S4 at 18:40:00. NOTE: the operator themselves
   rejected this short ("invalid CQD divergence", the +1 at 18:10) — so the ABSENCE of
   a short signal agrees with the operator; the suppression mechanism is what open
   item (a) judges. GOAL_STATEMENT/.clinerules "idle at that bar" is corrected here.
c. 08.20 09:15 — Daily-VWAP LONG seed -> SIGNAL 09:35:04 R=1.60 = the operator's row
   #233 (LDN TF, D VWAP, CVD=3, S LQ, 1.61 TAKEN) — a full agreement (see the
   GOAL_STATEMENT amendment).
d. 08.17 15:50 — Weekly-VWAP LONG seed (the operator's entry bar) -> signal 16:35:02.
e. 08.14 09:15 — Weekly-VWAP LONG seeded AND armed S4 the same bar; aborted 09:25:02
   (see BUILDER_FINDING_0814-MISS.md).

## 9. THE BATCHED QUESTIONS FOR THE OPERATOR (open item (a) — the reserved rule)
Q1. RANK ORDER: is FOMC > Yearly > Quarterly > Monthly > Weekly > Daily, with
    AVP-POC over VWAP inside each family, YOUR hierarchy? (And is "AVP" = the
    AVP-POC lines = the EA's *-POC buffers, correct?)
Q2. SAME-BAR TIE: most-authoritative line wins a bar where several lines retest
    (per direction, then across directions) — correct?
Q3. WHILE ALIVE: your Q3 ruling ("i will always execute the first one...") is
    implemented as: arrival order wins, no replacement, later retests discarded.
    Confirm this also governs SEEDING (an alive candidate suppresses new retests,
    even equal/higher-tier opposing ones — the 08.18 17:35-18:40 instance), or
    should an alive candidate that is STUCK (never aligning) release the singleton
    so a fresh retest can seed?
Q4. OHLC authorization for the midline check (BUILDER_FINDING_MIDLINE-1.md (b)).
Q5. The 08.14 semantic items (BUILDER_FINDING_0814-MISS.md): the 2-of-3
    pre-confirmation kill vs your standard; CVD=❌ on a TAKEN trade.
Builder recommendation attached per .clinerules §3: Q1/Q2 as measured (they agreed
with you on 08.17/08.20); Q3 is where the 08.18 18:20 miss mechanism actually lives —
recommend deciding Q3 on its own merits, not by changing the rank order.

## 10. RULING RECEIVED 2026-09-09 (in-session) — OPEN ITEM (a) CLOSED
The operator ruled: "Keep as mapped: the rank order AND the while-alive suppression both
stand - close open item (a) as 'the EA matches my rule' (the 08.18 18:20 short stays
suppressed)." THEREFORE: Q1 (the rank order FOMC > Yearly > Quarterly > Monthly > Weekly >
Daily, AVP-POC over VWAP, and the AVP = the *-POC-buffers mapping), Q2 (the same-bar tie,
most authoritative wins) and Q3 (the while-alive singleton — arrival order governs, a
stuck candidate holds it, no release) are all CONFIRMED AS THE OPERATOR'S RULE. The
08.18 17:35-18:40 suppression instance is accepted behavior, not a defect. No source
change is required or authorized by this ruling. REMAINING OPEN: Q4 (the 08.18 M5 OHLC
dump authorization — BUILDER_FINDING_MIDLINE-1.md (b)) and Q5 (the 08.14 items —
BUILDER_FINDING_0814-MISS.md section 5).

