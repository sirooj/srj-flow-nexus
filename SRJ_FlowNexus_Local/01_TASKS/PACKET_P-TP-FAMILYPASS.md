# PACKET P-TP-FAMILYPASS — fork-2 family-pass entry TP (DRAFT — NOT ISSUED)

Packet: `SRJ_FlowNexus_Local\01_TASKS\PACKET_P-TP-FAMILYPASS.md`
Date: 2026-09-17. Basis: operator ruling 2026-09-17 (entry TP is the family
line; realized outcome is management, STEP 4) + review-seat fork-2 design
(v143, arithmetic-verified) + Luna fork-1 OVERRIDDEN by that ruling. ONE
canonical file: `Experts\SRJ_FlowNexus_EA.mq5` (baseline `E5B97B36`, 597425 B,
11127 lines). STATUS: DRAFT — execution awaits council issuance + operator
token+word. V2 2026-09-17: answers v145 both-halt — restates E1 as POI-first
per Luna + adds print-only E2 census anchor fix per both seats (behavior
unchanged; §1 + NEW code + §2 + §3 + §5 updated, OLD untouched). V3
2026-09-17: answers v148 (4 seats halt) — restores SWEPTMASK print per Astra
(E3, byte-identical) + restates G3 per Opus D2/Luna (§2 expected-not-required;
anchor distances unmeasured) + 9/8 pair sourced (SIDE1X_STOPREF, relay). V4
2026-09-17: 9/8 R 2.55->2.51 entry-consistent per Astra v149 (code+gate
untouched; §2 line only).

## 1. WHAT CHANGES (one function, entry pipeline only)

E1 — `ComputeNearestTpTarget` (L2265-2393): split the flat walk into two
passes. Phase 1 (AMENDED per v145 Luna: NEAREST ELIGIBLE POI incl anchor,
NOT a family-specific mapping — the loop scans all POI lines under the
anchor-rank filter; "family pass" label withdrawn). Nearest direction-valid
POI line wins outright. Phase 2 (FALLBACK): today's session/PD loop, runs
ONLY when phase 1 finds NO eligible POI at all (not "no family line").
E2 (NEW, print-only, per v145 both seats): TASK-23 census second loop admits
the anchor (drop the `k2 == g_anchorLine` skip, rank filter unchanged) so
`winner`/`best` can name an anchor win; `*` / `(ANCHOR)` markers become live;
trading behavior UNCHANGED, gates read winner reliably (fixes latent false
HALT when the anchor itself wins; none of the five table rows hit it).
E3 (V3, print-only, per Astra v148): RESTORE the Task 144 / EA-141 SWEPTMASK
diagnostic print block byte-identical (dropped in the v2 draft; log-shape
unchanged, no behavior change).
The legacy fallback POI scan is OMITTED by construction (phase 1 admits a
strict superset: identical filter minus the anchor skip, identical reduction,
same bar and price — anything it could admit already set haveFam; deviation
from the v144 "full walk fallback" phrasing declared here for council rule).
Mask read + SWEPTMASK print hoisted unchanged (log-identical). TASK-23 census
block AMENDED per E2 only (anchor admitted in second loop; first loop +
format byte-unchanged; winner names best, now POI-first). Entry call sites L7193 (S2POLL) + L8693 (S5 latch) inherit;
exit scan `MtNearestTpTarget` L10803 UNTOUCHED (management stays nearest-valid
per Q6 + his revision rule); `TpTargetUpdateBest` + `TpSessionLevelFiltered`
UNTOUCHED.

OLD (L2265-2393, verbatim baseline):
bool ComputeNearestTpTarget(int barShift, ENUM_SRJ_DIR dir,
                             double currentPrice, double &tpTargetOut)
  {
   double best = 0.0;
   bool   haveBest = false;
   //--- [S1-TP-PROMOTION-001] live promotion: prev-day session H/L join the
   //--- candidate walk (indices 10..17 -> swept bits 14..21, unset this stage).
   const int sessbufs[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
                              FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
                              FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
                              FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
                              FL_BUF_PM_HIGH, FL_BUF_PM_LOW,
                              FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW,
                              FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW,
                              FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW,
                              FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };
   //--- TASK 39: swept + session-live mask, read once for the session/PD group.
   //--- The POI-line loop below is deliberately not filtered by it.
   double s39_mask;
   if(!ReadFlow(FL_BUF_SWEPT_MASK, s39_mask, barShift)) s39_mask = EMPTY_VALUE;
    //--- [Task 144 / EA-141] print the swept+live mask so every session-level
    //--- exclusion is attributable to a branch. Print only; nothing reads this.
    if(InpDebugLog)
      {
       int t144_m = (s39_mask == EMPTY_VALUE) ? -1 : (int)MathRound(s39_mask);
       PrintFormat("[SRJ-EA] SWEPTMASK bar=%s raw=%.1f m=%d "
                   "swept=%d%d%d%d%d%d%d%d%d%d live=%d%d%d%d",
                   TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                TIME_DATE|TIME_MINUTES),
                   s39_mask, t144_m,
                   (t144_m < 0) ? 9 : ((t144_m >> 0) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 1) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 2) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 3) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 4) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 5) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 6) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 7) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 8) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 9) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 10) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 11) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 12) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 13) & 1));
      }

   for(int i = 0; i < ArraySize(sessbufs); i++)
     {
      double v;
      if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask))
         TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);
     }
   int anchorRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX;
   for(int k = 0; k < POI_NLINES; k++)
     {
      if(k == g_anchorLine || (g_authorityRank[k] / 2) > (anchorRank / 2)) continue;
      double v;
      if(!ReadBuf1(g_hPoi, k, v, barShift)) continue;
      TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);
     }
   //--- TASK 23 (EA-23a / EA-24): read-only census of the take-profit candidate
   //--- set. Re-walks both candidate groups and matches each against the value
   //--- `best` already holds, so it names the winner without touching it. It
   //--- assigns nothing this function reads and alters no control flow.
   //--- `best` was assigned directly from a candidate, so exact equality is a
   //--- valid identity test here and is not a tolerance comparison.
   if(InpDebugLog)
     {
      static int s_tpDumps = 0;
      if(s_tpDumps < 2000)
        {
         s_tpDumps++;
         const int cbuf[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
                                FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
                                FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
                                FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
                                FL_BUF_PM_HIGH, FL_BUF_PM_LOW,
                                FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW,
                                FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW,
                                FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW,
                                FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };
         const string cname[18] = { "PDH", "PDL", "ASH", "ASL", "LOH", "LOL",
                                    "NYH", "NYL", "PMH", "PML",
                                    "YASH", "YASL", "YLOH", "YLOL",
                                    "YNYH", "YNYL", "YPMH", "YPML" };
         string winner   = "NONE";
         string admitted = "";
         int    nEmpty   = 0;
         for(int i = 0; i < 18; i++)
           {
            double cv;
            if(!ReadFlow(cbuf[i], cv, barShift)) continue;
            if(cv == EMPTY_VALUE) { nEmpty++; continue; }
            bool inDir = (dir == DIR_LONG) ? (cv > currentPrice) : (cv < currentPrice);
            if(!inDir) continue;
            admitted += cname[i] + ":" +
                        DoubleToString(MathAbs(cv - currentPrice) / _Point, 0) + " ";
            if(haveBest && cv == best) winner = cname[i];
           }
         for(int k2 = 0; k2 < POI_NLINES; k2++)
           {
            if(k2 == g_anchorLine || (g_authorityRank[k2] / 2) > (anchorRank / 2)) continue;
            double pv;
            if(!ReadBuf1(g_hPoi, k2, pv, barShift)) continue;
            if(pv == EMPTY_VALUE) { nEmpty++; continue; }
            bool inDir = (dir == DIR_LONG) ? (pv > currentPrice) : (pv < currentPrice);
            if(!inDir) continue;
            admitted += g_lineCode[k2] +
                        ((k2 == g_anchorLine) ? "*" : "") + ":" +
                        DoubleToString(MathAbs(pv - currentPrice) / _Point, 0) + " ";
            if(haveBest && pv == best)
               winner = g_lineCode[k2] + ((k2 == g_anchorLine) ? "(ANCHOR)" : "");
           }
         PrintFormat("[SRJ-EA] TPCENSUS #%d bar=%s dir=%s close=%s winner=%s best=%s "
                     "distPts=%s empties=%d admitted= %s",
                     s_tpDumps,
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                     DirName(dir),
                     DoubleToString(currentPrice, _Digits),
                     winner,
                     haveBest ? DoubleToString(best, _Digits) : "-",
                     haveBest ? DoubleToString(MathAbs(best - currentPrice) / _Point, 0) : "-",
                     nEmpty, admitted);
        }
     }
   if(!haveBest) return false;
   tpTargetOut = best;
   return true;
  }

NEW (replaces L2265-2393 whole):
bool ComputeNearestTpTarget(int barShift, ENUM_SRJ_DIR dir,
                             double currentPrice, double &tpTargetOut)
  {
   double best = 0.0;
   bool   haveBest = false;
   //--- [S1-TP-PROMOTION-001] live promotion: prev-day session H/L join the
   //--- candidate walk (indices 10..17 -> swept bits 14..21, unset this stage).
   const int sessbufs[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
                              FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
                              FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
                              FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
                              FL_BUF_PM_HIGH, FL_BUF_PM_LOW,
                              FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW,
                              FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW,
                              FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW,
                              FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };
   //--- TASK 39: swept + session-live mask, read once for the session/PD group.
   //--- The POI-line loop below is deliberately not filtered by it.
   double s39_mask;
   if(!ReadFlow(FL_BUF_SWEPT_MASK, s39_mask, barShift)) s39_mask = EMPTY_VALUE;
    //--- [Task 144 / EA-141] print the swept+live mask so every session-level
    //--- exclusion is attributable to a branch. Print only; nothing reads this.
    if(InpDebugLog)
      {
       int t144_m = (s39_mask == EMPTY_VALUE) ? -1 : (int)MathRound(s39_mask);
       PrintFormat("[SRJ-EA] SWEPTMASK bar=%s raw=%.1f m=%d "
                   "swept=%d%d%d%d%d%d%d%d%d%d live=%d%d%d%d",
                   TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                TIME_DATE|TIME_MINUTES),
                   s39_mask, t144_m,
                   (t144_m < 0) ? 9 : ((t144_m >> 0) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 1) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 2) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 3) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 4) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 5) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 6) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 7) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 8) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 9) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 10) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 11) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 12) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 13) & 1));
      }

   //--- [P-TP-FAMILYPASS V3 2026-09-17] block above RESTORED byte-identical per Astra v148 (dropped in v2 draft; print-only, log-shape unchanged).
   //--- [P-TP-FAMILYPASS E1 2026-09-17, V2 2026-09-17] POI-FIRST (fork-2,
   //--- operator ruling 2026-09-17: entry TP is the family line; realized
   //--- outcome is management, STEP 4; V2 restatement per v145 Luna: this is
   //--- the NEAREST ELIGIBLE POI incl anchor, not a family-specific mapping).
   //--- POI lines only, anchor ADMITTED, same tier-rank filter as the legacy
   //--- walk. The nearest direction-valid POI line wins outright; the
   //--- session/PD walk runs ONLY when NO eligible POI qualifies (fallback).
   //--- TpTargetUpdateBest reuse keeps the in-zone guard (Task 31) and the
   //--- nearest-wins reduction identical in each pass.
   int anchorRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX;
   double famBest = 0.0;
   bool   haveFam = false;
   for(int kf = 0; kf < POI_NLINES; kf++)
     {
      if((g_authorityRank[kf] / 2) > (anchorRank / 2)) continue;
      double vf;
      if(!ReadBuf1(g_hPoi, kf, vf, barShift)) continue;
      TpTargetUpdateBest(vf, dir, currentPrice, famBest, haveFam);
     }
   if(haveFam)
     {
      best = famBest;
      haveBest = true;
     }
   else
     {
      for(int i = 0; i < ArraySize(sessbufs); i++)
        {
         double v;
         if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask))
            TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);
        }
      //--- Fallback POI scan OMITTED by construction: the family pass admits a
      //--- strict SUPERSET (identical filter minus the anchor skip, identical
      //--- reduction, same bar and price) -- any line it could admit already set
      //--- haveFam above. Deviation from the v144 "full walk fallback" phrasing
      //--- declared here for council rule; behaviorally identical, proven above.
     }
   //--- TASK 23 (EA-23a / EA-24): read-only census of the take-profit candidate
   //--- set. Re-walks both candidate groups and matches each against the value
   //--- `best` already holds, so it names the winner without touching it. It
   //--- assigns nothing this function reads and alters no control flow.
   //--- `best` was assigned directly from a candidate, so exact equality is a
   //--- valid identity test here and is not a tolerance comparison.
   //--- [P-TP-FAMILYPASS E2 2026-09-17, print-only] census second loop ADMITS
   //--- the anchor (rank filter unchanged) so an anchor win is nameable;
   //--- behavior unchanged, gates read winner reliably.
   if(InpDebugLog)
     {
      static int s_tpDumps = 0;
      if(s_tpDumps < 2000)
        {
         s_tpDumps++;
         const int cbuf[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
                                FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
                                FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
                                FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
                                FL_BUF_PM_HIGH, FL_BUF_PM_LOW,
                                FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW,
                                FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW,
                                FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW,
                                FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };
         const string cname[18] = { "PDH", "PDL", "ASH", "ASL", "LOH", "LOL",
                                    "NYH", "NYL", "PMH", "PML",
                                    "YASH", "YASL", "YLOH", "YLOL",
                                    "YNYH", "YNYL", "YPMH", "YPML" };
         string winner   = "NONE";
         string admitted = "";
         int    nEmpty   = 0;
         for(int i = 0; i < 18; i++)
           {
            double cv;
            if(!ReadFlow(cbuf[i], cv, barShift)) continue;
            if(cv == EMPTY_VALUE) { nEmpty++; continue; }
            bool inDir = (dir == DIR_LONG) ? (cv > currentPrice) : (cv < currentPrice);
            if(!inDir) continue;
            admitted += cname[i] + ":" +
                        DoubleToString(MathAbs(cv - currentPrice) / _Point, 0) + " ";
            if(haveBest && cv == best) winner = cname[i];
           }
         for(int k2 = 0; k2 < POI_NLINES; k2++)
           {
            if((g_authorityRank[k2] / 2) > (anchorRank / 2)) continue;
            double pv;
            if(!ReadBuf1(g_hPoi, k2, pv, barShift)) continue;
            if(pv == EMPTY_VALUE) { nEmpty++; continue; }
            bool inDir = (dir == DIR_LONG) ? (pv > currentPrice) : (pv < currentPrice);
            if(!inDir) continue;
            admitted += g_lineCode[k2] +
                        ((k2 == g_anchorLine) ? "*" : "") + ":" +
                        DoubleToString(MathAbs(pv - currentPrice) / _Point, 0) + " ";
            if(haveBest && pv == best)
               winner = g_lineCode[k2] + ((k2 == g_anchorLine) ? "(ANCHOR)" : "");
           }
         PrintFormat("[SRJ-EA] TPCENSUS #%d bar=%s dir=%s close=%s winner=%s best=%s "
                     "distPts=%s empties=%d admitted= %s",
                     s_tpDumps,
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                     DirName(dir),
                     DoubleToString(currentPrice, _Digits),
                     winner,
                     haveBest ? DoubleToString(best, _Digits) : "-",
                     haveBest ? DoubleToString(MathAbs(best - currentPrice) / _Point, 0) : "-",
                     nEmpty, admitted);
        }
     }
   if(!haveBest) return false;
   tpTargetOut = best;
   return true;
  }

## 2. EXPECTED POI-FIRST WINNERS (from RECON45 admitted lists, arithmetic;
## V2 restatement: nearest eligible POI incl anchor — graded as the broader
## behavior per Luna; on the evidence all four winners are family lines.
## V3 per Opus D2: named lines EXPECTED-NOT-REQUIRED (anchor distances are
## unmeasured on record — no TP-anchor price prints exist; SLADCORR
## fracAnchorPx is stop-side, not linkable). The gate (§4 G3) requires a
## rank-eligible POI winner at R>=1, not these names.)

- 8/28 10:00 SHORT c1.16466 SL42: family below nearest = Yearly-VWAP 144 →
  TP 1.16322, R 3.43, EXPECTED FIRE (his TP 1.16380 nearby; entry-vs-realized
  covers).
- 9/4 15:55 LONG e1.16018 SL171: Yearly-VWAP 297 → TP 1.16315, R 1.74,
  EXPECTED FIRE (reproduces his matched TP EXACTLY).
- 9/7 09:15 LONG e1.16135 SL37: Yearly-VWAP 180 → R 4.86, EXPECTED FIRE.
- 9/7 16:40 LONG e1.16261 SL23: Yearly-VWAP 54 → TP 1.16315, R 2.35,
  EXPECTED FIRE (reproduces his matched TP EXACTLY).
- 9/8 10:05 SHORT e1.16205 SL53 (FL, already firing; pair from SIDE1X_STOPREF
  row, carried in relay): Monthly-VWAP 133 entry-based → TP 1.16072,
  R 2.51, still EXPECTED FIRE, TP moves off YLOL 1.16102 (declared, not a
  failure). V4 2026-09-17: R was 2.55 from mixed origins (census-close 135
  over entry-based 53) — corrected per Astra v149; pass unchanged.
- Luna amendment answered: NO new candidate source needed — a direction-valid
  family line is present at all four kill bars (table above); the specific
  Daily-POC/Weekly-VWAP absences are moot (other family lines win). V2 ADDS:
  Luna's broader-behavior point ACCEPTED — the packet no longer claims a
  family-specific mapping, and grades the POI-first behavior as built; the
  review seat's 5/5 arithmetic + subsumption proof both hold on record.

## 3. STAGES (per invariant 5)

- S1 pre-hash gate: expect EXACTLY `E5B97B36...CD5A` (597425 B, 11127 lines).
  Miss = BLOCKED + diagnose (never assumed drift, never reverted).
- S2 apply E1+E2+E3 (probe raw lines first; P-DIVCON-B whitespace discipline).
- S3 post-hash + structure verify (CRLF every added line; LONELF=0;
  byte-identical outside the hunk).
- S4 compile: "Result: 0 errors, 0 warnings".
- S5 headless run (window 08-26→09-09, 3168 bars): launch detached, STOP; the
  completion signal is the operator's.
- S6 GATES (§4). S7 BUILDER_RESULT + tabulation + standing state. No git
  token; nothing under 02_TASK_CHECKPOINTS.

## 4. GATES

- G1 "Test passed", 3168 bars. G2 WS161 loads=stores mismatch=0 (no new
  fields — counts reproduce exactly).
- G3 (V3 per Opus D2 + Luna v148: EXPECTED-not-required): the five §2 bars
  must each fire with a RANK-ELIGIBLE POI winner at R>=1 (the §2 names are
  expected, not required — any POI winner at R>=1 passes; anything else =
  REPORT+HALT, revert nothing). 9/8 FL (TP may move, must fire).
  MUST-SILENT: every day he declined (8/26, 8/27, 8/31, 9/1, 9/2, 9/3,
  9/9 + his-invalid rows).
- G4 ADJUDICATION RULE (his C5 precedent, ANYSTATE §5 pattern): any fire
  outside the G3 set is NOT auto-failed — it is reported row-complete for
  HIS adjudication; a fire on a day he marked invalid (XOB/CVD/<1R notes) is
  BLOCKED per C5 (EA-only stays impossible).
- G5 post-run digests recorded; FlowLogic untouched.

## 5. RISKS DECLARED

- Family TPs inflate R on EVERY S5-reaching seed: fires beyond G3 are
  possible and expected to be adjudicated, not absorbed (G4). V2: the graded
  behavior is the broader POI-first (any eligible POI incl anchor can win,
  not only family lines) — G4 adjudication covers non-family POI wins too.
- E2 census anchor fix is print-only (no behavior change); post-E2 the `*` /
  `(ANCHOR)` markers are live and the winner field is trustworthy for G3/G4.
- V3: E3 restores the dropped SWEPTMASK print (log-shape identical to OLD —
  nothing downstream loses rows); G3 no longer names required winners (an
  anchor win nearer than §2 names passes, and adjudicates under G4 like any
  POI winner).
- FL TP moves (his 1.16102 → family ~1.1607x) while still firing: entry TP
  may differ from his read per his own ruling; realized is STEP 4.
- Luna fork-1 (per-setup mapping, 9/4 killed) is NOT what this packet builds:
  his outcome ruling (9/4 fires, his take) selected fork-2; her design is
  recorded and overruled on record, not lost.
