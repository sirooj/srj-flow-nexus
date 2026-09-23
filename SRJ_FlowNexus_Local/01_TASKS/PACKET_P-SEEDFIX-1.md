# PACKET_P-SEEDFIX-1 v3 DRAFT - void-truth + nearest-line census (zero behavior change; V234 amend-fold over v2 D8036144: baseline defined, footer 163, census wording, D1/D2/D3 bars mapped, dates year-pinned, G3 coverage, L-final G3, populated-with-dash; E-literals untouched)

Status: v3 DRAFT (amends v2 per V234: Luna/GLM AMEND-WITH-DELTA + Sonnet/Kimi
ACCEPT, no halt; folds are text-only, E-literals untouched). Nothing
on this file. Clearance via a clearance relay plus token plus his run word, all
owed. Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (two hunks:
one print widened, one new diagnostic function plus one call line). No new
indicator buffers. Nothing under 02_TASK_CHECKPOINTS. No commit without token.
Successor context: PACKET_P-VALIDITY-1 v6 (built tree 0C913372, RECON53 graded
takes 4); this packet changes NO booking order, NO gate, NO exit leg, NO seed
or selection logic - prints only, behavior identical by hard gate below.

## Authority (all on record, no invention)

- His fix word 2026-09-22 (ledger 592, banked as scope for selection + exit;
  council route still required, dual-key for selection).
- His screenshot challenge 2026-09-22 (ledger 593): charts prove the retests
  happened (D VWAP 8/28, W POC 9/7 latest); open fork is void-TRUE-on-tester
  (fix = re-seed path) vs void-FALSE (fix = void precision) - this packet
  instruments both branches, decides neither.
- His setup-definition ruling 2026-09-22 (canonical name; verbatim: a liquidity
  touch forms no setup, setup executes on confirmation-candle entry; sweep or
  retest is potential only; L285 protects completed setups; latest CONFIRMED
  retest governs). Recency-vs-arrival fork SETTLED, no operator question ships.
- B fork RULED 2026-09-22 (his day-close-universal question + 9/4 hold): DAY_CLOSE-minus-5
  outranks POI_BODY_BREAK on mean-reversion (Luna direction; GLM/Kimi contra overruled
  by canon order, credited with quotes). Shapes the next behavior packet, changes nothing here.
- Spec L120 (same-direction higher-tier upgrade, implemented B3) vs L285 (later
  higher does not displace): the L7585 comment's claimed opposite-replace rule
  is NOT in spec - correctly NOT implemented here (record-first save).
- Code gap proved read-only (finding BUILDER_FINDING_SEEDFIX-1.md D3DEF3C9/73):
  SEEDVOID prints no bar range (void-truth unprovable); RETESTBOOK prints hits
  only (near-miss unattributable); re-seed path exists downstream (ST_IDLE +
  cleared anchor, next bar seeds fresh - nothing blocks it).

## Rule (no rule change; observation run)

- E1 widens the SEEDVOID row with the deciding bar range (hi/lo appended;
  row prefix stable so all G2 joins hold byte-identical).
- E2 adds RETESTDIAG (new diagnostic row, never an ALERT kind): nearest-line census
  per bar - lines inside the range (wick contacts whether or not the body rule
  accepted them), nearest line above and below with point distances. Prints beside
  every RETESTBOOK row whenever the combined shadow gate fires (intentional wider
  gate, documented; pairing holds under RECON53-identical settings); joins by bar
  (subtract book hits for the blocked set). Predicted family, zero unpredicted kinds.

## Scope (prints ONLY)

- Seed, selection, suppression, booking, gate, exit engine, existing production /
  behavioral censuses, ALERT kinds, regime, SL, entry pipeline otherwise: all
  UNCHANGED. RETESTDIAG is the sole new diagnostic census; R2SKIP family untouched.
  MTEXIT reasons unchanged.

## Edit set (exact verbatim; STAGE-1 exact-diff gated; byte-verified anchors)

- E1 SEEDVOID widen (old verbatim EA L7739, 9-space indent):
  `         if(InpDebugLog) PrintFormat("[SRJ-EA] SEEDVOID bar=%s dir=%s buf=%d line=%s evals=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), DirName(g_dir), r2_buf, DoubleToString(r2_val, _Digits), r2_evals);`
  new verbatim (same indent, hi/lo appended, all prior args identical):
  `         if(InpDebugLog) PrintFormat("[SRJ-EA] SEEDVOID bar=%s dir=%s buf=%d line=%s evals=%d hi=%s lo=%s", TimeToString(barTime, TIME_DATE|TIME_MINUTES), DirName(g_dir), r2_buf, DoubleToString(r2_val, _Digits), r2_evals, DoubleToString(r2_hi, _Digits), DoubleToString(r2_lo, _Digits));`
  (net +0 new, +1 modified; r2_hi/r2_lo are the block's own locals L7711-7712).
- E2a RETESTDIAG function (insert between EA L2068 `   }` and L2069
  `//--- CONFIRMPOLL:`, single-hit anchor; mirrors ShadowRetestBook helpers
  POI_NLINES/ReadBuf1/g_hPoi/g_lineCode/EMPTY_VALUE, writes no state):
  `//--- SEEDFIX-1 RETESTDIAG: nearest-line census, diagnostic only. Prints beside`
  `//--- every RETESTBOOK row, hit or miss: inside-range contacts, nearest above/below.`
  `//--- Never consulted; subtract book hits by bar for blocked-set attribution.`
  `void ShadowRetestNearMiss(const int barShift)`
  `   {`
  `    if(!InpDebugLog) return;`
  `    double h = iHigh(_Symbol, PERIOD_CURRENT, barShift);`
  `    double l = iLow (_Symbol, PERIOD_CURRENT, barShift);`
  `    if(h <= 0.0 || l <= 0.0) return;`
  `    double P = _Point;`
  `    string inside = "";`
  `    string codeA = "-";`
  `    string codeB = "-";`
  `    double distA = 0.0;`
  `    double distB = 0.0;`
  `    bool haveA = false;`
  `    bool haveB = false;`
  `    for(int k = 0; k < POI_NLINES; k++)`
  `      {`
  `       double L;`
  `       if(!ReadBuf1(g_hPoi, k, L, barShift)) continue;`
  `       if(L == EMPTY_VALUE || L <= 0.0) continue;`
  `       if(L >= l && L <= h)`
  `         {`
  `          if(StringLen(inside) > 0) inside += " ";`
  `          inside += g_lineCode[k];`
  `          continue;`
  `         }`
  `       if(L > h && (!haveA || (L - h) < distA))`
  `         { haveA = true; distA = L - h; codeA = g_lineCode[k]; }`
  `       if(L < l && (!haveB || (l - L) < distB))`
  `         { haveB = true; distB = l - L; codeB = g_lineCode[k]; }`
  `      }`
  `    if(StringLen(inside) == 0) inside = "-";`
  `    PrintFormat("[SRJ-EA] RETESTDIAG bar=%s inside=%s nearAbove=%s:%spts nearBelow=%s:%spts",`
  `                TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),`
  `                             TIME_DATE|TIME_MINUTES),`
  `                inside,`
  `                codeA, (haveA ? DoubleToString(distA / P, 1) : "-"),`
  `                codeB, (haveB ? DoubleToString(distB / P, 1) : "-"));`
  `   }`
  (net +41 new; identifiers carry no leading underscore; no state writes.)
- E2b call line (old verbatim EA L7643-7645):
  `   if(InpDebugLog && (SHADOW_RETESTBOOK || SHADOW_CONFIRMPOLL) && inWindow)`
  `     {`
  `      ShadowRetestBook(barShift);`
  new verbatim (one line appended, 6-space indent):
  `   if(InpDebugLog && (SHADOW_RETESTBOOK || SHADOW_CONFIRMPOLL) && inWindow)`
  `     {`
  `      ShadowRetestBook(barShift);`
  `      ShadowRetestNearMiss(barShift);`
  (net +1 new; same InpDebugLog gate, no new flag.)

## Stages (T161N discipline; RECON53 precedent)

S1 Pre-hash gate: re-hash EA (must equal 0C913372D28005AFF3579D6E2E52BE30B809AB611D633006F5695D4C55A7C185
/ 619264 B / 11270 lines) + single-hit + char-code assert every OLD anchor
above; assert SEEDVOID PrintFormat count==1, RETESTBOOK block identity, no new
buffers, ALERT-kind count unchanged, seven-family (SIGNAL, TP_ELECT, SIDE1X, SIDE1E,
STOPRESOLVE, SEEDDIAG, SESSION_LIMIT) + RETESTDIAG-predicted only.
Miss = DIAGNOSE, never assume, never revert. S2 Apply E1, E2a, E2b exact-diff
(E1 line counts as the modified line; E2a insertion anchor and E2b appends count as
new lines; expected post-build 11270 + 42 = 11312 asserted beside the post-hash). S3 Post-hash + budget
arithmetic from literal counts (EA +42 new +1 modified; State/Sessions/FlowLogic
+0). S4 Compile both targets 0 errors 0 warnings. S5 Run under RECON50_DEMO_USD
(same terminal, InpMode 1, 2026-08-26 to 2026-09-10, InpDebugLog=true), ceiling 90 min.

## Acceptance (replay segment 7EA459D8 produced by pre-build tree 0C913372; G2/G3 grade segment-vs-segment, S1 gates tree identity)

G1 Build: 0 errors 0 warnings both targets; post-hashes recorded; budget EA +42
new +1 modified from literals; commit text prepared, commit only on token.
G2 Observation: SEEDVOID hi/lo present on all 76 voids (RECON53 census denominator;
r2_val-in-[lo,hi] recorded for chart comparison on each); RETESTDIAG present beside
every RETESTBOOK row with inside / nearAbove / nearBelow field-present ("-" permitted
for absent neighbors; edge-touch counts inside; ties broken first-encountered);
zero unpredicted row kinds (hard gate - RETESTDIAG predicted here). Bars mapped:
D1 = 8/28 09:55 void + 10:00/10:05 silence; D2 = 9/7 15:00-16:40 SHORT-churn, LONG
never forms; D3 = 9/8 16:45 LONG seed, 16:55 SHORT held, 17:00 no-seed (51-build
take at 1.16220 for contrast). D1/D2/D3 re-attributed with the new fields (void-truth
decided per void against his charts; near-miss distances name the detector silence
mechanism).
G3 Behavior-identical (hard gate - any delta in the enumerated kinds HALTS the grade):
SIGNAL 4 / TP_ELECT 9 / SIDE1X 9 / MTSNAP 4 / MTEXIT 4 / LATCH 5, all rows
value-identical to RECON53 (SEEDVOID compared on the stable prefix through evals;
RETESTDIAG is the predicted new kind, exempt; generic transport-line totals are not
behavior deltas); every other [SRJ-EA] row kind count-identical and value-identical
(transport columns excluded); MTFLIP/DAY_CLOSE/MTCOLLISION/REPLACED zero as before;
alert kinds SIGNAL/EXIT/HEADS-UP/STAND-DOWN only.
G4 Goal-identical: takes 4, same bars/entries (same observed take set - observation run
claims no restoration; the re-seed and formation fixes follow in v-next on this run's
data plus his setup-definition ruling plus council clearance; B fork ruled for that
round: DAY_CLOSE-minus-5 outranks POI_BODY_BREAK on mean-reversion per his word).
L-final Graded set authoritative: G1/G2/G3/G4 above; the ask G1-G4 covers E1-E2
as stated.

## Run cost and novel evidence

One build (EA only, two hunks, STAGE-1 exact-diff gated) plus one tester run,
ceiling 90 minutes, explicit values authoritative (same settings as RECON53).
Novel evidence vs RECON53: (a) first void-truth data (hi/lo on every void -
decides feed-vs-line per void); (b) first near-miss census (which lines the
silent bars touched or nearly touched - decides detector-silence mechanism);
(c) F3-first-firing proof rides free if any take survives to the 16:55 mark.
Exit figures are target figures, never realized fills. This run deliberately
restores nothing - v2 designs from its data.

(End of file - total 170 lines)
