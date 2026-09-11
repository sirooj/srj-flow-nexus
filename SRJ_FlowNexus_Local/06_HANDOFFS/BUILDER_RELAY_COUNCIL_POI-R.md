# FULL CONTEXT PROMPT — relay to the flagship council (Opus 5) via the operator
File: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_POI-R.md
Date: 2026-09-10. Directive: the operator, verbatim — "if you need help, which obviouly you
do, give me the full context prompt to relay to the flagship models." ROLE MAPPING: this is a
CODE question (Amendment 5: code questions go to Opus 5). SELF-CONTAINED: paste the whole
block below into the council chat as-is.

--- PASTE FROM HERE ---

CONTEXT: I am rebuilding a personal EURUSD M5 discretionary strategy as an MQL5 expert advisor
(SRJ_FlowNexus_EA.mq5, ~4,610 lines) that consumes a custom indicator (SRJ_FlowLogic) plus 14
includes. ALERT-ONLY (no execution). The deployment bar: every valid trade in the operator's
manual journal must be reproduced by the EA, and no setup the operator rejected may be
signaled. I ran the EA over the operator's journal window Aug 26 - Sep 9 and reconciled
row-by-row. Two of the operator's TAKEN trades were killed by the EA's own internals. I
root-caused both to one defect class and need a clean implementation design. Files and line
anchors below are literal (EA = Experts\SRJ_FlowNexus_EA.mq5).

HOW THE EA WORKS (the relevant machinery):
1. Lines: the EA watches 12 lines - FOMC/Yearly/Quarterly/Monthly/Weekly/Daily x POC/VWAP.
   Rank table EA L82-93 (Yearly rank 2 above Monthly rank 4; lower number = higher authority).
   A candidate seeds on a POI retest (DetectPoiRetest EA L1446-1488: wick touches the line,
   then the NEXT candle open must body-close on the setup side). The seed picks the line whose
   retest condition fired (IDLE->S1, EA L3163-3193).
2. Singleton: ONE candidate at a time (EA L3100 comment: no replacement). While held, other
   lines' retests are SUPPRESSED - the log prints "SUPPRESSED ... poi=X dir=Y opp=<0|1>
   higher=<0|1>" (first site EA L3267). opp=1 means the suppressed retest was OPPOSITE
   direction; higher=1 means the suppressed line was HIGHER rank (more authority) than the
   held candidate.
3. Gate-check (EA L4007-4042): before firing, the EA evaluates R = (distance to TP target) /
   (distance to stop). Entry leg = the next candle's open (the operator's ruled standard).
   Stop = the order-block swing (SL_REF machinery EA L3062-3074). TP target =
   ComputeNearestTpTarget (EA L1706): the NEAREST admitted line in the trade's direction,
   recomputed from the CURRENT price every bar. The log prints "S5_RR_SHORTFALL tpDist=...
   slDist=... R=..." then ABORT reason=TP_RR_FAIL when R<1.
4. TP census (TPCENSUS logs): every bar, the distances to all admitted lines.

FAILURE 1 (the operator TAKEN a London SHORT from the Daily VWAP on 8/28; +0.10 with THEIR
early exit, 1.21R if held; the operator's TP for it = the AVP line):
- The EA seeded the SAME setup (SHORT Daily-VWAP London 10:00), armed, and reached the
  gate-check. Verbatim gate lines:
  10:25:03 "ZONESHADOW bar=10:20 dir=SHORT close=1.16426 ... tp=1.16364 R_close=1.13"
  10:25:03 "S5 waiting: divLatch=0 tpOk=1"  (R was fine; the divergence was not latched yet)
  10:30:00 "ZONESHADOW bar=10:25 dir=SHORT close=1.16421 ... tp=1.16364 R_close=0.95"
  10:30:00 "S2POLL_RR_SHORTFALL tpDist=0.00057 slDist=0.00060 R=0.95"
  10:30:00 "ABORT reason=TP_RR_FAIL state=S5_GATE_CHECK poi=Daily-VWAP dir=SHORT"
- The TP target the EA picked = NYL (New York session LOW, 1.16364) - the NEAREST line below
  price - NOT the operator's AVP line (~1.1638, which would have kept R at ~1.2). And R was
  recomputed from the CURRENT close every bar: it decayed 1.13 -> 0.95 as price drifted
  adverse, then failed. The operator measured 1.21R at their decision instant.

FAILURE 2 (the operator TAKEN a NY LONG from the YEARLY POC on 9/4; +0.84):
- 15:35 the EA seeded a LONG from the MONTHLY POC (a lower-authority line; the Yearly POC's
  retest had not fired yet). The operator's Yearly-POC retests then presented at 15:45/15:50/
  15:55 and were SUPPRESSED by the held Monthly-POC candidate:
  15:50 "SUPPRESSED bar=15:45 poi=Yearly-POC dir=LONG opp=0 higher=1 heldPoi=Monthly-POC"
  15:55 "SUPPRESSED bar=15:50 poi=Yearly-POC dir=LONG opp=0 higher=1 heldPoi=Monthly-POC"
  16:00 "SUPPRESSED bar=15:55 poi=Yearly-POC dir=LONG opp=0 higher=1 heldPoi=Monthly-POC"
  16:00 "ABORT reason=TP_RR_FAIL ... poi=Monthly-POC dir=LONG" (the held candidate then died:
  its R check picked the nearest line above = Monthly-VWAP 6-7 pts away -> R=0.06).
- The operator's standard, verbatim: "i know there is a valid M POC, but i only journaled or
  input it as Y POC or AVP because there is a valid Y POC superseed the M POC" - a valid
  YEARLY POC SUPERSEDES a valid MONTHLY POC. The EA must see and hold the higher-authority
  line, not the lower one.

THE OPERATOR'S RULED STANDARDS (verbatim):
- "FIX THE SRJ POI MARKER or how the EA sees them. find the root problem and not banaid
  solution." (both failures are the same root problem class: WHICH line the EA holds as the
  setup line and WHICH line it uses as the TP reference.)
- "this is the same with the first question, that was a valid trade but early exit." (the
  8/28 trade was valid; the EA's R check must not kill it.)
- "there is a valid Y POC superseed the M POC" (higher-authority line supersedes).
- The TP for a setup = the AVP line of the family (the operator's journal TP column: "AVP"),
  not the nearest session level.
- The 1R gate itself is ruled KEEP; the entry leg = the next candle's open (ruled KEEP).
- SAFETY: any fix must NOT revive the known false positive (an 8/18 NY short the operator
  rejected; it currently stays dead because the R check computes R<1 under the next-open
  entry reference at that setup).

MY QUESTIONS (design, not implementation yet):
C1 SUPERSESSION: where is the cleanest place to implement higher-authority supersession -
  (a) at the seed (prefer the highest-authority line whose retest is valid within the setup
  window), (b) as a live re-bind while a lower-authority candidate is held (a higher line's
  valid same-direction retest replaces the held line and the candidate re-arms), or (c) both?
  What direction guards apply (the 15:40 suppression of a Yearly-POC SHORT against a held
  Monthly-POC LONG must remain suppressed - opposite direction)?
C2 TP/R REFERENCE: the TP target for the R check (and for the fired trade) should be the
  operator's standard line - the family's AVP line (which AVP: the anchor line's own tier?
  the nearest POC family member?) rather than the nearest session level; and R should be
  measured at the decision instant (the operator's 1.21R) rather than decaying per bar with
  the current close. Design options: (a) TP = the anchor-family AVP, R recomputed per bar
  from it; (b) TP = the anchor-family AVP, R LATCHED at the first gate-check; (c) R latched
  AND per-bar TP only for the fired trade. Which is cleanest, and how should the AVP target
  be selected when the family's AVP is on the wrong side (excluded) - skip the R check, or
  fall back to the next family member?
C3 SAFETY: how to keep the 8/18 false positive dead under the new TP/R reference (it lives
  or dies by the R<1 computation at its gate-check)?

NEW EVIDENCE (the operator's ruling after seeing our four EA-only signals on their charts):
C4 ENTRY TIMING / THE CONFIRMATION-CANDLE MODEL: the operator looked at the EA's four
  EA-only signal candles (8/31 11:40, 9/1 15:50, 9/2 15:55, 9/8 15:55) and sees NO potential
  setup at all, structure-wise, at those exact candles. Verbatim: "do you even understand my
  confirmation candle next candle open entry that happened after retracement? i suspect this
  is the biggest problem, cause diregarding the POI validity, your entry candle time if off."
  Their model: price retraces to the line -> a CONFIRMATION candle forms (structure: the
  operator's bias/structure read) -> entry = the NEXT candle's OPEN after the confirmation
  candle CLOSES. The EA currently: seeds on a POI retest (wick + next-open body-side test),
  walks a state ladder (regime/LTF/zone/armed/gate), and fires at the first gate-check pass
  — the fired candle is wherever the ladder happened to complete, NOT necessarily the
  candle after the operator's confirmation candle. On the two 9/7 trades the timing happens
  to agree (their confirmation candles 09:15 and 16:40; the EA's entries = the 09:20 and
  16:45 opens); on the four EA-only signals the EA fired at candles with NO such structure.
  QUESTION: how should the EA's admission be re-modeled so the fired candle IS the
  next-candle-open after a genuine confirmation candle (structure-qualified), rather than
  wherever the state ladder completes? Is the current ladder salvageable with a
  confirmation-candle qualifier at the gate, or does the seed->gate chain need to be
  re-anchored on the confirmation event?
C5 With C4 in place: the operator rules ALL EA-only signals BAD ("Bad, my rulings, my valid
  trades is what i want to replicate and automate") — the design must make the four false
  signals impossible (no setup at those candles under the corrected model).

CONSTRAINTS: MQL5 build 6182; alert-only; the EA digest A0701893299B82370BC62AA19CA280E7064
A1C46D6830D82EB7C3E65DC3FD57E; canonical edits only via issued packets with pre/post digest
verification, compile 0/0, and a full headless verification run against a frozen identity
baseline (loads=stores=2880 mismatch=0 and all censuses must reproduce except the designed
observables). Answer with a DESIGN: the mechanism, the code sites to change (by the anchors
above), the direction guards, and the observables that prove each ruled case (8/28 signal
returns; 9/4 yearly-POC candidate survives; 8/18 stays dead).

--- PASTE TO HERE ---

