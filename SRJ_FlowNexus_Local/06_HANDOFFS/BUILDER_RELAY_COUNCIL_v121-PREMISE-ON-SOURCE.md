# RELAY v121 - PREMISE ON SOURCE (fresh-safe, SAME-PROMPT both seats)

**Version:** v121 (supplies the enumeration source Sonnet demanded; corrects v120 framing on record. Follows Luna `LUNA-V120-TP-DATA-SOURCE-PACKET-001` + review-seat check: PACKET ISSUED shadow-first, all-four symmetric. Sonnet v120: framing corrected + premise challenged as unshown + packet-held directionally.) **Fresh-profile-safe:** base + source + census ALL INLINE. Tree unchanged (`BFAE4F4B`/591933 uncommitted; RECON17 frozen). **Paste set:** this relay ALONE (both seats IDENTICAL asks). Return whole verdicts/reviews with model + date + Ruling-ID, one source per message. His part: transport only.

## 0. Base + owned framing correction
- Builder OWNERSHIP: v120 wrote "Sonnet concurs; absence proved." INACCURATE on both halves - Sonnet flagged absence unproven and asked for enumeration code; absence was asserted from record-search (rule-22 violation in a relay). This relay supplies the demanded source; no concurrence is claimed for anyone.
- Standing: PACKET ISSUED (dual-key V120, shadow-first, mismatch->HALT). This relay gates its premise, not its issuance. Proving track (token+word+spec) independent. All words SPENT.

## 1. SOURCE J - full TP enumeration (byte-exact pulls)
### MtNearestTpTarget EA:10734-10765 (the complete per-bar candidate walk)
  10734: bool MtNearestTpTarget(const int barShift, const ENUM_SRJ_DIR dir,
  10735:                        const double currentPrice, double &tpTargetOut)
  10736:   {
  10737:    double best = 0.0;
  10738:    bool   haveBest = false;
  10739:    const int sessbufs[10] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
  10740:                               FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
  10741:                               FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
  10742:                               FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
  10743:                               FL_BUF_PM_HIGH, FL_BUF_PM_LOW };
  10744:    double s39_mask;
  10745:    if(!ReadFlow(FL_BUF_SWEPT_MASK, s39_mask, barShift)) s39_mask = EMPTY_VALUE;
  10746:    for(int i = 0; i < ArraySize(sessbufs); i++)
  10747:      {
  10748:       double v;
  10749:       if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask))
  10750:          TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);
  10751:      }
  10752:    int anchorRank = (g_mtrade.anchorLine >= 0)
  10753:                     ? g_authorityRank[g_mtrade.anchorLine] : INT_MAX;
  10754:    for(int k = 0; k < POI_NLINES; k++)
  10755:      {
  10756:       if(k == g_mtrade.anchorLine || (g_authorityRank[k] / 2) > (anchorRank / 2))
  10757:          continue;
  10758:       double v;
  10759:       if(!ReadBuf1(g_hPoi, k, v, barShift)) continue;
  10760:       TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);
  10761:      }
  10762:    if(!haveBest) return false;
  10763:    tpTargetOut = best;
  10764:    return true;
  10765:   }
### Session list + buffer defines (EA:2254-2258 ComputeNearestTpTarget; EA:180-181; census names EA:2315-2321)
  2254:    const int sessbufs[10] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
  2255:                               FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
  2256:                               FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
  2257:                               FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
  2258:                               FL_BUF_PM_HIGH, FL_BUF_PM_LOW };
  2259:    //--- TASK 39: swept + session-live mask, read once for the session/PD group.
  2260:    //--- The POI-line loop below is deliberately not filtered by it.
  2261:    double s39_mask;
  2262:    if(!ReadFlow(FL_BUF_SWEPT_MASK, s39_mask, barShift)) s39_mask = EMPTY_VALUE;
  180: #define FL_BUF_PDAY_HIGH     8
  181: #define FL_BUF_PDAY_LOW     9
  2315:          const int cbuf[10] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
  2316:                                 FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
  2317:                                 FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
  2318:                                 FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
  2319:                                 FL_BUF_PM_HIGH, FL_BUF_PM_LOW };
  2320:          const string cname[10] = { "PDH", "PDL", "ASH", "ASL", "LOH", "LOL",
  2321:                                     "NYH", "NYL", "PMH", "PML" };
### FlowLogic prev-day exports (only extremes exist: decl :36-37, buffers 8/9 at :673-674, fill at :1127-1128)
  FL:double g_bufPrevDayHigh[];
  FL:double g_bufPrevDayLow[];
  FL:   SetIndexBuffer(8,  g_bufPrevDayHigh,  INDICATOR_CALCULATIONS);
  FL:   SetIndexBuffer(9,  g_bufPrevDayLow,   INDICATOR_CALCULATIONS);
  FL:         g_bufPrevDayHigh[target] = g_s.prevDayHigh;
  FL:         g_bufPrevDayLow[target]  = g_s.prevDayLow;
### Read: universe = 10 session/PD buffers (PDAY = prev-day HIGH/LOW extremes only) + 12 current POI lines. No prev-day SESSION highs/lows exist as inputs anywhere in either program.

## 2. SOURCE K - TPCENSUS journal rows (admitted set on record; his 1.16102 absent)
[SRJ-EA] TPCENSUS #339 bar=2026.09.08 10:05 dir=SHORT close=1.16205 winner=Monthly-VWAP best=1.16072 distPts=133 empties=0 admitted= PDL:155 LOL:7 Monthly-VWAP:133 Quarterly-POC:1871 Quarterly-VWAP:1154 Yearly-POC:218 FOMC-POC:837 FOMC-VWAP:427 
[SRJ-EA] TPCENSUS #304 bar=2026.09.04 10:35 dir=SHORT close=1.16265 winner=ASL best=1.16224 distPts=41 empties=0 admitted= PDL:430 ASL:41 LOL:10 NYL:248 PML:13 Weekly-POC:330 Weekly-VWAP:252 Monthly-POC:330 Monthly-VWAP:248 Quarterly-POC:1931 Quarterly-VWAP:1257 Yearly-POC:278 FOMC-POC:897 FOMC-VWAP:516 
[SRJ-EA] TPCENSUS #363 bar=2026.09.08 16:40 dir=SHORT close=1.16213 winner=Yearly-POC best=1.16114 distPts=99 empties=0 admitted= PDL:163 LOL:130 NYL:134 PML:3 Monthly-VWAP:136 Quarterly-POC:1879 Quarterly-VWAP:1154 Yearly-POC:99 FOMC-POC:845 FOMC-VWAP:430 
### Read: FL 10:05 admits PDL/LOL/Monthly-VWAP/... - winner Monthly-VWAP 1.16072; his 1.16102 (103pts, nearer than winner) appears NOWHERE in 366 census rows across the run. Code (no such input) + journal (never admitted) agree.

## 3. Asks (IDENTICAL both seats)
- **Ask-1 PREMISE-CONFIRMED?** Absence proved (code enumeration + census; correct-or-correct per line)?
- **Ask-2 PACKET:** STANDS (proceed to token + word for shadow build) or SUSPENDS (name the defect)? No band-aid, no smoothing.
- Threshold: filed-authoritative, R>=1.0, A+ strict, alert-only. Locks: canonical touched -> packet only; RECON17 frozen; nothing builds/runs/commits here.

## 4. Branches
- Stands -> token + word -> STAGE-1 verify -> build -> 0/0 -> shadow-run -> grade -> relay. Suspends -> QUIESCENT (defect stands named). Amend -> one closed-set re-ask. Split -> ONE closed-set re-ask.

(End - v121 awaits verdicts + Ruling-IDs; nothing builds/runs/commits/spends here.)
