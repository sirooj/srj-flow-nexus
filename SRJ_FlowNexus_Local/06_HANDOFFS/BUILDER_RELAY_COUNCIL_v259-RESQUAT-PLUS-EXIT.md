# BUILDER RELAY COUNCIL v259-RESQUAT-PLUS-EXIT (2026-09-24, COMBINED solve-request: re-squat cause+code PLUS exit-executor code; supersedes untransported v258; session CONTINUE)

## 0. What this relay is (read first)

- This is NOT a review-my-packet relay. Rounds v251-v257 asked whether the eviction disposition was safe; every seat cleared the logic, the build ran, and the 9/1 take still misses. By his 2026-09-24 order the circle breaks by changing the ask: rule WHAT causes the miss on the evict tree and PROPOSE the exact code to implement, inside his rules below.
- Session: CONTINUE (same evict tree, same window, same question family as v257, new ask).
- Scope merge on his COMBINE word: exit-executor legs join as Q3 so one build plus one run settles both the re-squat and the D2 paper-exit defects; v258 was superseded untransported and never carried; Q1/Q2 text below is byte-identical to v258. Grading disclosure: executing exits shifts the balance path, so later takes re-derive lots while bars and entries stay identical; grading is bars-first, lots-second.
- Run cost of THIS relay: zero (no run is spent by asking). The run it prepares costs one build + one 90-minute tester run on the same terminal, spent only on clearance plus his run word.
- Why this run has novel evidence no prior run did: it would be the first run pairing eviction with re-seed suppression, graded by the 9/1 17:35 take plus the 6 identical takes.
- Disk identity (all re-measured or carried as labeled priors): packet P-EVICT-1 v7 = 2EF1A9E0/12461/107. EA post-build tree = 15A41634/622631/11330. Segment RECON59 = 7A7E74C0/6618090/34993 (7 takes expected, 6 taken). Segment RECON58 = 424A5A0C/6624800/35016 (6 takes, baseline). Segment RECON57 = 6F242EAC/4274727/24144 (7 takes incl 9/1, positive reference). Relay digest recorded in the ledger post-splice, never inside this file.
- Prior filed record (labeled priors, never unattributed): relay v257 page 90FF9038/6139/82 (Luna Q1-YES on v7 shape); result RECON59 564D9227/10453/79 (G1 PASS / G2 FAIL / G3 MIXED / G4 PASS); tabulation 4CB94C7A/2833/82 (same-method counts + whole-line set-diffs); ledger items 693 (grade) + 694 (only-defect sweep: re-squat is the sole selection delta); stamp census + GoAbort contract + S1 asserts (packet v7, section S1).

## 1. Binding rules (his; a proposal contradicting one must NAME it and stop, never silently override)

- R-a one-take-per-session (spec L283/L291 + his restatement): one valid setup executed per pair per session; session marks persist and are written only on SIGNAL paths.
- R-b NO new timing rules (scope-origin): eviction keys on gate verdicts, never on bar counts. No new constants, no thresholds, no bar-count expiry.
- R-c R floor KEEP at 1.0 inclusive (flat 1.0 valid); replicate-all valid set (no proposal may shrink his valid set).
- R-d E3 detection walk untouched (his ruling); R2 void MEANREV-only scope untouched (his renewal word); Q3 arrival order governs takes.
- R-e alert-only demo bounds, no live money ever; exits joined ONLY by Q3 execution legs on his COMBINE word (exit-model direction still out; live stays alerts-only with tester closes only); 48 indicator buffers (no new buffers without a same-edit bump).
- Fork ownership: (F-a) session-scoped suppression of the evicted line (fire-or-expire, no bar counts, no thresholds) - council may rule inside the rules above. (F-b) bar-count arm-slot expiry - HIS call (contradicts R-b). (F-c) widening R2 beyond MEANREV - HIS call (contradicts R-d). Propose inside F-a, or name the conflict if the proposal needs F-b/F-c.

## 2. The defect (one paragraph + rows W1-W5)

- On the evict tree the 9/1 16:55 Yearly-POC LONG holder aborts at its S5 fallback (DIV_FALLBACK, W1), the slot frees without consuming the session, and on the very next bar the SAME line re-seeds (fresh 17:00 retest alert + retest-book hit, W2), re-arms S4 the same bar, vetoes the 17:30 Monthly-VWAP LONG seed at pre-election S2POLL three bars running (W3-W4, heldState=S4_ARMED, veto counts 67/69/70), then dies 17:50 on fresh opposing pressure (W5) - one bar after the take bar passed with no signal. The freed slot never converts because the evicted line re-occupies it first.

## 3. The 57 contrast (one paragraph + rows W6)

- On the pre-evict tree the 16:55 holder survives to the wall and is voided there (W6a: S4_ARMED-to-IDLE + SEEDVOID pair), so the 16:55 bar is never consumed; the 17:00 bar then seeds Monthly-VWAP rank 7 tier 3 (W6b), the S1-held SHORT transfers live to the observed LONG (W6c: SIDE1C_PREEMPT, wouldPreempt=0), the holder at the take bar is the seed itself in healthy competition (W6d, veto count 45), S5 passes and the 17:35 take prints 2.04 at 1.16024 (W6e: SIGNAL + alert + MTSNAP + PRE-SEND + fill chain).
- The divergence in one sentence: eviction frees the slot one bar EARLIER than the void did, so the IDLE block consumes the stale 16:55 bar (Yearly-POC rank 2, W2) that 57 skipped; 57 consumes the 17:00 bar (Monthly-VWAP rank 7, W6b) instead.

## 4. The mechanism (singleton slot + the three code sites C4/C6/C7)

- The machine is a singleton: while any sequence is alive the IDLE seed block is skipped and challengers only print veto rows (C5). There is no same-direction election to tune - the entire defect is seed-gating (C6: IDLE seeds whatever the detector returns top-ranked, with no memory of prior aborts) plus holder persistence.
- The design statement at C4 says it outright: after GoAbort clears the sequence, the IDLE block re-detects the same line and seeds it (same-bar promotion is DESIRED at that site; nothing pairs the E2 eviction site, so the re-seed lands next bar organically).
- R2 cannot garbage-collect this seed: the void fires only when regime is MEANREV (C7), and the 9/1 seed never classifies MEANREV (W2 census: trendOk=1, mrOk=0).
- Support code carried whole: abort/reset pair (C1: ResetSequence clears state/dir/regime/anchor/session/latch/confirmFrom while session marks persist; GoAbort prints unconditional abort + gated refusal/stand-down rows, then ST_ABORT + reset), abort/signal prints (C2), session-mark pair (C3 + C9a/C9b: marks written only on the two SIGNAL paths, alert-only and take), veto census writer (C5, diagnostic-only by its own header), current S5 disposition (C8: the evict three-way whole).

## Q1. Rule the proximate cause of the missing 9/1 17:35 take on the evict tree.

- Q1 verdict: the cause is ___. (one plain sentence + the row numbers that prove it)
- Answer form: plain cause sentence, then the deciding rows by label (W1/W2/W3/W4/W5/W6), then one sentence on why the 17:00 re-seed is or is not legitimate under R-a/R-d (it rode a fresh retest alert; freshness died later at 17:50).

## Q2. Propose the exact code change to implement.

- Q2 verdict: implement ___. (file + function + anchored old-to-new + line budget)
- Answer form: (i) the edit spec as whole old block(s) and whole new block(s) with line anchors on the post-build tree digest above; (ii) line budget arithmetic from literal counts; (iii) rule-preservation list, one line per rule R-a..R-e, each naming the lines that hold it; (iv) fork label F-a (or the named conflict if F-b/F-c is needed); (v) the staleness question answered outright: suppress the SEED, suppress the ARM, take next-best, or same-bar-promote - with the rows that decide it; (vi) census/observability for the new path (unconditional prints, same standard as the DIV_FALLBACK triple); (vii) the grading bar the proposal accepts: 9/1 17:35 take + 6 takes identical bars/entries/fills + 9/4-invalid still refused + MTCOLLISION 0, any other election delta halts.
- Scope notes the proposal must respect: the 17:00 re-seed rode a genuine fresh retest, so suppression must be eviction-paired, never a general seed filter; session is a rule-native unit (day-keyed marks exist at C3), bar counts are not.

## Q3. Propose the exact exit-executor code (his COMBINE word joins exit legs to this relay so one build plus one run settles both the re-squat and the paper-exit defects).
- Context in one paragraph: entries attach broker SL/TP at send (E2), so stop and target exits fill on their own; EvaluateManagedTrade (E1) computes five verdicts, but on any verdict it only flips paper state, prints MTEXIT/MTLIFE, and alerts - its own header states ALERT-ONLY preserved, never an order. Hence the 8/28 11:40 Daily-POC body-break verdict (X1: EXITVERDICT vBREAK=Daily-POC, MTEXIT exit 1.16439) never closes the short, which dies at the 17:00 stop fill 1.16510; and the 9/4 23:55 DAY_CLOSE verdict (X2: MTEXIT exit 1.16093) never flattens the long, which exits at the 9/7 target fill 1.16307. His exit rules are settled (11:35 break exit on 8/28 London; always flat near day close): only the legs are unbuilt. MT_HTF_EXIT stays false (E3: his trend experiment), so HTF exits are out; vSL/vTP already execute through the broker; the pending CANCEL_BIAS path is out.
- Q3 verdict: implement ___. (file + function + anchored old-to-new + line budget)
- Answer form: (i) edit spec as whole old blocks and whole new blocks on the post-build tree digest, naming the close call, the position identity used (session magic at E4; g_mtrade carries no ticket - propose), and the close print price (nextOpenPx, same as the paper leg); (ii) line budget arithmetic from literal counts; (iii) rule-preservation list, one line per rule R-a..R-e (amended R-e), each naming the lines that hold it - live stays alerts-only with tester closes only, per the standing alert-only rule; (iv) observability: EXITVERDICT prints no vDAY field today (X2 proves it: vSL/vTP/vBREAK/vHTF only) - the proposal carries its own execution prints for every leg it adds; (v) grading bar accepted: 8/28 exit 11:40 near 1.16439 plus 9/4 flat 23:55 near 1.16093 (his 11:35 versus tester 11:40 is the same event at bar granularity, on record) plus 9/1 take plus 5 other takes identical bars and entries (lots re-derive downstream of changed exits, graded second) plus 9/4-invalid still refused plus MTCOLLISION 0, any other election delta halts.
- Scope notes the proposal must respect: SL/TP legs untouched (broker-owned); HTF leg untouched (experiment holds); CANCEL_BIAS pending path untouched; one managed record only (MTCOLLISION REPLACED path untouched); priority order SL, TP, BREAK, HTF, DAY_CLOSE stands.

## EVIDENCE C - exit code (byte-spliced; whole contiguous EA regions, post-build line numbers)

--- EA 11095-11309 EvaluateManagedTrade (215) ---
//====================== [P-EXITMODEL] EvaluateManagedTrade ===========================
// Spec section 4 site 3: the exit, evaluated at the NEXT candle's open. Called once
// per closed bar from OnTick AFTER the entry pipeline (section 7's separation: this
// function never touches the entry pipeline or any working-set field). Every verdict
// is logged (instrumentation-first, section 4's mitigation); an actual exit also
// emits the EXIT alert (ALERT-ONLY preserved - never an order). Same-bar priority
// when several tests fire together: SL, then TP_TOUCH, then POI_BODY_BREAK, then
// HTF_FLIP (when re-enabled; beats DAY_CLOSE on shared bars), then DAY_CLOSE
// (universal scope: every managed trade) (the conservative stop-first standard; MTEXIT/MTLIFE record terminal
// exit reasons so the operator can re-judge any instance).
void EvaluateManagedTrade(const int barShift)
  {
   if(!g_mtrade.active) return;
   if(g_mtrade.state != MT_MANAGING && g_mtrade.state != MT_PENDING_FILL) return;

   datetime barTime = iTime(_Symbol, PERIOD_CURRENT, barShift);
   if(barTime < g_mtrade.fillBarTime) return;   // bars predating the fill are not ours

   double o = iOpen(_Symbol, PERIOD_CURRENT, barShift);
   double h = iHigh(_Symbol, PERIOD_CURRENT, barShift);
   double l = iLow(_Symbol, PERIOD_CURRENT, barShift);
   double c = iClose(_Symbol, PERIOD_CURRENT, barShift);
   //--- the NEXT candle's open = the evaluation instant's price (section 4);
   //--- fail-soft to the evaluated bar's close if the next open cannot be read.
   double nextOpenPx = (barShift >= 1) ? iOpen(_Symbol, PERIOD_CURRENT, barShift - 1) : 0.0;
   if(nextOpenPx <= 0.0) nextOpenPx = c;
   double bodyLo = MathMin(o, nextOpenPx);
   double bodyHi = MathMax(o, nextOpenPx);
   double EPS = 0.001 * _Point;   // the T161K float guard, threshold-free semantics

   //--- PENDING_FILL (section 5.5): fill on the first touch of the entry level.
   //--- Under the next-open entry the fill bar's own open IS the entry, so this
   //--- fills at the first evaluation; the branch keeps the lifecycle complete.
   if(g_mtrade.state == MT_PENDING_FILL)
     {
      bool touched = (g_mtrade.dir == DIR_LONG) ? (l <= g_mtrade.entryPrice + EPS)
                                                : (h >= g_mtrade.entryPrice - EPS);
      if(!touched)
        {
         //--- not filled yet: cancel on a bias flip (the three-flag conjunction is
         //--- the same event per sections 3.4/5.5)
         double ltfBias;
         if(ReadFlow(FL_BUF_LTF_BIAS, ltfBias, barShift))
           {
            int want = (g_mtrade.dir == DIR_LONG) ? 1 : -1;
            if((int)MathRound(ltfBias) != want)
              {
               g_mtrade.state      = MT_CLOSED;
               g_mtrade.exitReason = MT_EXIT_CANCEL_BIAS;
               g_mtrade.exitBarTime = barTime;
               g_mtrade.exitPrice   = nextOpenPx;
                if(InpDebugLog)
                  {
                   PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=CANCEL_BIAS (pending, unfilled)",
                               TimeToString(barTime, TIME_DATE|TIME_MINUTES));
                   MtLifeEmit();
                  }
              }
         }
         return;
        }
      g_mtrade.state = MT_MANAGING;   // filled (the fill bar's open = the entry)
     }

   //--- ALL verdicts computed first (instrumentation-first)
bool   vSL = false, vTP = false, vBREAK = false, vHTF = false, vDAY = false;
   double curTp = 0.0;
   bool   haveTp = MtNearestTpTarget(barShift, g_mtrade.dir, nextOpenPx, curTp);
   double breakLineVal = 0.0;
   string breakLineName = "";

   //--- (d) SL: price trades through the latched stop (wick or body; the standard
   //--- stop semantics; the EXITMODEL-1 Q5 recommendation, unobjected)
   if(g_mtrade.dir == DIR_LONG  && l <= g_mtrade.slRef) vSL = true;
   if(g_mtrade.dir == DIR_SHORT && h >= g_mtrade.slRef) vSL = true;

    //--- (b) TP: the BOOKED target (tpRef) only, exit on TOUCH. Break-retest
    //--- rule 2026-09-20 (E4A85FD4): touch/retest of non-booked lines does
    //--- nothing once entered; only body-close break (E-c) exits early.
    bool tpBookedTouch = false;
    if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
      {
       if(g_mtrade.dir == DIR_LONG  && h >= g_mtrade.tpRef) tpBookedTouch = true;
       if(g_mtrade.dir == DIR_SHORT && l <= g_mtrade.tpRef) tpBookedTouch = true;
      }
    bool tpRecomputeTouch = false;
    if(haveTp)
      {
       if(g_mtrade.dir == DIR_LONG  && h >= curTp) tpRecomputeTouch = true;
       if(g_mtrade.dir == DIR_SHORT && l <= curTp) tpRecomputeTouch = true;
      }
    if(tpRecomputeTouch && !tpBookedTouch) g_n1_tpRecomputeSupp++;
    if(tpBookedTouch) vTP = true;

   //--- (c) the body-close exit: PRICE's BODY close through a BEHIND trigger line
   //--- (body = open -> next open, the T161K convention; "it must be body" - Q5).
   //--- A line's own gap/move alone never exits (Q3; section 1.3). Side is per bar
   //--- (section 5.2): a trigger line whose CURRENT value sits ahead of the trade
   //--- is a touch-target, not a body-close trigger. The census logs ALL twelve
   //--- lines per bar so every MT_EXIT_SCOPE variant is measurable from one run.
   for(int k = 0; k < POI_NLINES; k++)
     {
       double L;
       if(!ReadBuf1(g_hPoi, k, L, barShift)) continue;
       if(L == EMPTY_VALUE || L <= 0.0) continue;
       //--- [P-SLDEF-1 E14] same N1 body counter at the exit site. Grounding:
       //--- break needs bodyLo < L-EPS (LONG) / bodyHi > L+EPS (SHORT), both
       //--- strict: exact equality never breaks.
       if(bodyLo == L || bodyHi == L) g_n1_poiEqBody++;
       bool behind = (g_mtrade.dir == DIR_LONG)  ? (L < nextOpenPx)
                                                 : (L > nextOpenPx);
      bool through = false;
      if(behind)
        {
         if(g_mtrade.dir == DIR_LONG)  through = (bodyLo < L - EPS);
         else                          through = (bodyHi > L + EPS);
        }
       bool isTrigger = MtIsBreakTrigger(k);
       //--- [P-SLDEF-1b E19] exit-site pairing: the line verdict is known here.
       //--- Strictness says equality never sets `through`, so every paired
       //--- instance is expected ok (survived); a BREAK coincidence reports inv.
       if(bodyLo == L || bodyHi == L)
         { if(isTrigger && behind && through) g_n1_exitBodyInv++; else g_n1_exitBodySurv++; }
       if(InpDebugLog)
         PrintFormat("[SRJ-EA] EXITCENSUS bar=%s dir=%s line=%s val=%s side=%s "
                     "trigger=%d bodyLo=%s bodyHi=%s verdict=%s",
                     TimeToString(barTime, TIME_DATE|TIME_MINUTES),
                     DirName(g_mtrade.dir),
                     g_lineCode[k], DoubleToString(L, _Digits),
                     (behind ? "behind" : "ahead"),
                     (int)isTrigger,
                     DoubleToString(bodyLo, _Digits),
                     DoubleToString(bodyHi, _Digits),
                     (isTrigger && behind && through) ? "BREAK" : "ok");
      //--- [P-EXITRANK-6] anchor-rank gate (his 2026-09-23 rule: same-line cross never exits; only HIGHER-authority breaks exit; lower number = higher authority; amends charter 9.1(2) same-line case, supersedes E3).
      if(isTrigger && behind && through && !vBREAK && g_mtrade.anchorLine >= 0 && g_mtrade.anchorLine < POI_NLINES && g_authorityRank[k] < g_authorityRank[g_mtrade.anchorLine])
        {
         vBREAK = true;
         breakLineVal  = L;
         breakLineName = g_lineCode[k];
        }
     }

   //--- (e) section 5.6: the HTF aggregate flip exits TREND-following trades
   double mtlH = 0.0, mtlM = 0.0, mtlL = 0.0; // [P-HTFLOG] the HTF leg values (diagnostic)
   int    mtlWant = 0, mtlAnti = -1;          // [P-HTFLOG] anti=-1 => the leg block did not run
   if(MT_HTF_EXIT && !vSL && !vTP && !vBREAK)
     {
      if(g_mtrade.regimeAtAdmission == REGIME_TREND ||
         g_mtrade.regimeAtAdmission == REGIME_BOTH)
        {
         if(ReadFlow(FL_BUF_HTF_HIGH, mtlH, barShift) &&
            ReadFlow(FL_BUF_HTF_MID,  mtlM, barShift) &&
            ReadFlow(FL_BUF_HTF_LOW,  mtlL, barShift))
           {
            mtlWant = (g_mtrade.dir == DIR_LONG) ? 1 : -1;
            int anti = 0;
            if((int)MathRound(mtlH) == -mtlWant) anti++;
            if((int)MathRound(mtlM) == -mtlWant) anti++;
            if((int)MathRound(mtlL) == -mtlWant) anti++;
             mtlAnti = anti;
             vHTF = (anti >= 2);   // the majority flipped AGAINST the trade
             if(vHTF && InpDebugLog) MtFlipEmit(barShift, barTime, mtlAnti, mtlWant);
           }
        }
     }
//--- [P-EXITMODEL-2 F3] day-close-minus-5 exit (his universal rule 2026-09-21: the first bar at/after the first 16:55-ET mark at/after the fill exits every managed trade regardless of regime). Priority below SL, TP, BREAK (and HTF when re-enabled); price nextOpenPx; F3 mark is 16:55 ET (g_news_dayMarks), distinct from the 17:00 weekFlat census (g_news_friMarks); MTEXIT/MTLIFE carry DAY_CLOSE, graded by mark join.
if(!vSL && !vTP && !vBREAK && !vHTF && g_news_init)
  {
   for(int dc = 0; dc < g_news_dayN; dc++)
     {
      if(g_mtrade.fillBarTime <= g_news_dayMarks[dc] && g_news_dayMarks[dc] <= barTime) { vDAY = true; break; }
     }
  }

    if(InpDebugLog)
      PrintFormat("[SRJ-EA] EXITVERDICT bar=%s dir=%s entry=%s curTp=%s vSL=%d "
                   "vTP=%d vBREAK=%s vHTF=%d scope=%d "
                   "htfH=%g htfM=%g htfL=%g want=%d anti=%d tpB=%s h=%s l=%s sup=%d",
                   TimeToString(barTime, TIME_DATE|TIME_MINUTES),
                   DirName(g_mtrade.dir),
                   DoubleToString(g_mtrade.entryPrice, _Digits),
                   (haveTp ? DoubleToString(curTp, _Digits) : "none"),
                   (int)vSL, (int)vTP,
                   (vBREAK ? breakLineName : "none"),
                   (int)vHTF, (int)MT_EXIT_SCOPE,
                   mtlH, mtlM, mtlL, mtlWant, mtlAnti, (g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0 ? DoubleToString(g_mtrade.tpRef, _Digits) : "none"), DoubleToString(h, _Digits), DoubleToString(l, _Digits), g_n1_tpRecomputeSupp);

if(!(vSL || vTP || vBREAK || vHTF || vDAY)) return;

   //--- close the trade (the priority order stated in the header)
   g_mtrade.state       = MT_CLOSED;
   g_mtrade.exitBarTime = barTime;
   if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
    else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }
   else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
   else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }
   else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;  g_mtrade.exitPrice = nextOpenPx; }

    PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",
                TimeToString(barTime, TIME_DATE|TIME_MINUTES),
                MtExitName(g_mtrade.exitReason),
                (vBREAK ? breakLineName : "-"),
                (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),
                DoubleToString(g_mtrade.entryPrice, _Digits),
                DoubleToString(g_mtrade.exitPrice, _Digits));
    if(InpDebugLog) MtLifeEmit();
   EmitAlert("EXIT",
             StringFormat("%s%s at %s (entry %s)",
                          MtExitName(g_mtrade.exitReason),
                          (vBREAK ? " [" + breakLineName + "]" : ""),
                          DoubleToString(g_mtrade.exitPrice, _Digits),
                          DoubleToString(g_mtrade.entryPrice, _Digits)),
             true);
  }
--- end E1 ---

--- EA 10214-10222 broker send (9) ---
         g_trade.SetExpertMagicNumber(magic);
         g_trade.SetTypeFilling(GetCorrectFillingMode(_Symbol));
         string comment = (g_sessionAtEntry == SESSION_LONDON) ? "SRJ-LONDON" : "SRJ-NYAM";

         bool tradeResult = false;
         if(g_dir == DIR_LONG)
            tradeResult = g_trade.Buy(lots, _Symbol, entryPrice, slRef, tpTarget, comment);
         else
            tradeResult = g_trade.Sell(lots, _Symbol, entryPrice, slRef, tpTarget, comment);
--- end E2 ---

--- EA 128-132 exit scope + HTF toggle (5) ---
#define MT_EXIT_SCOPE        MT_SCOPE_FAMILY_POC
//--- section 5.6 toggle (compile-time, NOT a user input): the HTF aggregate flip
//--- exits trend-following trades at the flipping HTF candle's confirmation close.
//--- EXPERIMENT 2026-09-21 (his word): no HTF-flip exit while the experiment runs; one-line re-enable (true) restores the HTF flip leg only, never the whole pre-packet behavior (F1 unified nearest booking and F3 stay installed; full-rollback gating parked). REGIME_MEANREV never reaches the leg (by the inner regime gate, spec 5.6 scope - not by the toggle itself).
#define MT_HTF_EXIT          false
--- end E3 ---

--- EA 10168-10172 execute + session magic (5) ---
       // ------ Phase 2 Execution Logic ------
       if(InpMode == MODE_EXECUTE) PrintFormat("[SRJ-EA] EXECUTE_ACCT mode=%d login=%d", (int)AccountInfoInteger(ACCOUNT_TRADE_MODE), (int)AccountInfoInteger(ACCOUNT_LOGIN));
       long magic = (g_sessionAtEntry == SESSION_LONDON) ? InpMagicBase + 1 : InpMagicBase + 2;

      if(IsSessionPositionOpen(magic))
--- end E4 ---

## EVIDENCE D - exit rows (byte-spliced; TAB-separated)

--- SEG59 8/28 break verdict + stop fill (5) ---
KP	0	05:24:29.014	Core 04	2026.08.28 11:45:02   [SRJ-EA] EXITCENSUS bar=2026.08.28 11:40 dir=SHORT line=Daily-POC val=1.16451 side=behind trigger=1 bodyLo=1.16439 bodyHi=1.16454 verdict=BREAK
DE	0	05:24:29.014	Core 04	2026.08.28 11:45:02   [SRJ-EA] EXITVERDICT bar=2026.08.28 11:40 dir=SHORT entry=1.16466 curTp=1.16364 vSL=0 vTP=0 vBREAK=Daily-POC vHTF=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=1.16364 h=1.16454 l=1.16436 sup=2
IF	0	05:24:29.014	Core 04	2026.08.28 11:45:02   [SRJ-EA] MTEXIT bar=2026.08.28 11:40 reason=POI_BODY_BREAK line=Daily-POC lineVal=1.16451 entry=1.16466 exit=1.16439
MO	0	05:24:29.014	Core 04	2026.08.28 11:45:02   [SRJ-EA] MTLIFE fields=11 openBar=2026.08.28 10:05 dir=SHORT entry=1.16466 sl=1.16508 tp=1.16364 verdict=POI_BODY_BREAK closeBar=2026.08.28 11:40 closePx=1.16439 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
KP	0	05:25:30.048	Core 04	2026.08.28 17:00:17   order performed buy 2.38 at 1.16510 [#3 buy 2.38 EURUSD at 1.16508]
--- end X1 ---

--- SEG59 9/4 day-close verdict + target fill (5) ---
EQ	0	05:48:41.647	Core 04	2026.09.07 00:00:07   [SRJ-EA] EXITVERDICT bar=2026.09.04 23:55 dir=LONG entry=1.16018 curTp=1.16158 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=1.16302 h=1.16141 l=1.16113 sup=2
PN	0	05:48:41.647	Core 04	2026.09.07 00:00:07   [SRJ-EA] MTEXIT bar=2026.09.04 23:55 reason=DAY_CLOSE line=- lineVal=- entry=1.16018 exit=1.16093
IQ	0	05:48:41.647	Core 04	2026.09.07 00:00:07   [SRJ-EA] MTLIFE fields=11 openBar=2026.09.04 16:00 dir=LONG entry=1.16018 sl=1.15847 tp=1.16302 verdict=DAY_CLOSE closeBar=2026.09.04 23:55 closePx=1.16093 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
IS	0	05:50:43.718	Core 04	2026.09.07 11:12:27   deal performed [#7 sell 0.57 EURUSD at 1.16307]
CR	0	05:50:43.718	Core 04	2026.09.07 11:12:27   order performed sell 0.57 at 1.16307 [#7 sell 0.57 EURUSD at 1.16302]
--- end X2 ---

## 6. Seat packaging (same text all four seats)

- This identical file goes to Opus, GLM, Kimi, and Sonnet (his carry). Luna (key seat) is NOT carried unless he words it. No key is asked. No build is authorized by any answer: proposals return as text; any build needs a council packet plus the Luna key plus his run word (standing dual-key + key-seat + builder-call-commit rules unchanged).
- Verification split: seats judge the pasted text only; file-access proof is builder-disk plus his-eyes only. Code regions below are byte-spliced whole and contiguous from the post-build tree digest above; rows are byte-spliced TAB-separated segment lines with hit counts asserted at splice time. Counts: DIV_FALLBACK 9/0, S5-to-S4 0-vs-3, takes whole-line set-diff 0, veto-on-9/1 61-vs-62, feed 563338 ticks + 3168 bars both runs.

## EVIDENCE A - rows (byte-spliced; TAB-separated)

--- SEG59 16:55 abort triple (3) ---
PP	0	05:34:14.952	Core 04	2026.09.01 16:55:00   [SRJ-EA] 2026.09.01 16:55:00 ABORT reason=DIV_FALLBACK state=S5_GATE_CHECK poi=Yearly-POC dir=LONG
QL	0	05:34:14.952	Core 04	2026.09.01 16:55:00   [SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.09.01 16:55 state=S5_GATE_CHECK dir=LONG predicate=DIV_FALLBACK
DP	0	05:34:14.952	Core 04	2026.09.01 16:55:00   [SRJ-EA] ALERT SRJ STAND-DOWN LONG EURUSD M5 | Yearly-POC | NYAM | reason=DIV_FALLBACK
--- end W1 ---
--- SEG59 17:00 reseed chain (7) ---
CF	0	05:34:14.952	Core 04	2026.09.01 17:00:00   Alert: EURUSD M5 - POI RETEST LONG at 1.15982  [Y-POC]
JF	0	05:34:14.952	Core 04	2026.09.01 17:00:00   [SRJ-EA] RETESTBOOK bar=2026.09.01 16:55 hits=1 Yearly-POC:r2:dL
ND	0	05:34:14.952	Core 04	2026.09.01 17:00:00   [SRJ-EA] 2026.09.01 17:00:00 STATE IDLE->S1_REGIME dir=LONG poi=Yearly-POC
QF	0	05:34:14.952	Core 04	2026.09.01 17:00:00   [SRJ-EA] ANCHOR_ELECT bar=2026.09.01 16:55 action=SEED poi=Yearly-POC rank=2 tier=1 dir=LONG
QM	0	05:34:14.952	Core 04	2026.09.01 17:00:00   [SRJ-EA] REGIMECENSUS #125 bar=2026.09.01 16:55 dir=LONG votes=2 trendOk=1 sweepTag=0 mrOk=0 cumMR=0
PI	0	05:34:14.952	Core 04	2026.09.01 17:00:00   [SRJ-EA] 2026.09.01 17:00:00 STATE S3_ZONE_WAIT->S4_ARMED dir=LONG poi=Yearly-POC
IR	0	05:34:14.952	Core 04	2026.09.01 17:00:00   [SRJ-EA] ALERT SRJ HEADS-UP LONG EURUSD M5 | Yearly-POC | NYAM | zone 1.15902-1.15926 awaiting confirm
--- end W2 ---
--- SEG59 17:00 HELD (1) ---
CH	0	05:34:14.952	Core 04	2026.09.01 17:05:00   [SRJ-EA] SUPPRESSED bar=2026.09.01 17:00 poi=Monthly-VWAP dir=LONG opp=0 higher=0 heldPoi=Yearly-POC heldDir=LONG heldState=S4_ARMED cum_n=67 cum_opp=19 cum_hi=5 cum_both=4 action=HELD
--- end W3 ---
--- SEG59 17:30+17:35 HELD (2) ---
LS	0	05:34:21.055	Core 04	2026.09.01 17:35:01   [SRJ-EA] SUPPRESSED bar=2026.09.01 17:30 poi=Monthly-VWAP dir=LONG opp=0 higher=0 heldPoi=Yearly-POC heldDir=LONG heldState=S4_ARMED cum_n=69 cum_opp=20 cum_hi=5 cum_both=4 action=HELD
KG	0	05:34:21.055	Core 04	2026.09.01 17:40:01   [SRJ-EA] SUPPRESSED bar=2026.09.01 17:35 poi=Monthly-VWAP dir=LONG opp=0 higher=0 heldPoi=Yearly-POC heldDir=LONG heldState=S4_ARMED cum_n=70 cum_opp=20 cum_hi=5 cum_both=4 action=HELD
--- end W4 ---
--- SEG59 17:50 death (1) ---
QQ	0	05:34:27.159	Core 04	2026.09.01 17:50:00   [SRJ-EA] 2026.09.01 17:50:00 ABORT reason=FRESH_OPP_FVG state=S4_ARMED poi=Yearly-POC dir=LONG
--- end W5 ---
--- SEG57 winning shape (14) ---
ES	0	16:17:12.827	Core 04	2026.09.01 17:00:00   [SRJ-EA] 2026.09.01 17:00:00 STATE S4_ARMED->IDLE dir=LONG poi=-
CO	0	16:17:12.827	Core 04	2026.09.01 17:00:00   [SRJ-EA] SEEDVOID bar=2026.09.01 16:55 dir=LONG buf=14 line=1.16017 evals=171 hi=1.16022 lo=1.15980
GK	0	16:17:12.827	Core 04	2026.09.01 17:05:00   [SRJ-EA] 2026.09.01 17:05:00 STATE IDLE->S1_REGIME dir=LONG poi=Monthly-VWAP
IF	0	16:17:12.827	Core 04	2026.09.01 17:05:00   [SRJ-EA] ANCHOR_ELECT bar=2026.09.01 17:00 action=SEED poi=Monthly-VWAP rank=7 tier=3 dir=LONG
PG	0	16:17:12.827	Core 04	2026.09.01 17:05:00   [SRJ-EA] 2026.09.01 17:05:00 STATE S1_REGIME->IDLE dir=LONG poi=-
IH	0	16:17:12.827	Core 04	2026.09.01 17:05:00   [SRJ-EA] SEEDVOID bar=2026.09.01 17:00 dir=LONG buf=14 line=1.16022 evals=172 hi=1.16044 lo=1.15989
KD	0	16:17:18.931	Core 04	2026.09.01 17:35:01   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.09.01 17:30 newPoi=Monthly-VWAP newDir=LONG heldPoi=Yearly-POC heldDir=SHORT heldState=S1_REGIME newTier=3 heldTier=1 wouldPreempt=0 wouldTierPassLegacy=0
LE	0	16:17:18.931	Core 04	2026.09.01 17:35:01   [SRJ-EA] SIDE1C_PREEMPT bar=2026.09.01 17:30 from=Yearly-POC fromDir=SHORT to=Monthly-VWAP toDir=LONG state=S1_REGIME
PL	0	16:17:18.931	Core 04	2026.09.01 17:35:01   [SRJ-EA] SUPPRESSED bar=2026.09.01 17:30 poi=Monthly-VWAP dir=LONG opp=0 higher=0 heldPoi=Monthly-VWAP heldDir=LONG heldState=S1_REGIME cum_n=45 cum_opp=7 cum_hi=2 cum_both=2 action=HELD
QI	0	16:17:18.931	Core 04	2026.09.01 17:35:01   [SRJ-EA] 2026.09.01 17:35:01 SIGNAL dir=LONG poi=Monthly-VWAP regime=TREND div=hidden sess=NYAM tp_target=1.16077 tp_R=1.17 sl_ref=1.15975 sl_mode=1-swing spreadPts=2 bid=1.16022 ask=1.16024
LI	0	16:17:18.931	Core 04	2026.09.01 17:35:01   [SRJ-EA] ALERT SRJ SIGNAL LONG EURUSD M5 | Monthly-VWAP | NYAM | R=1.17 SL 1.15975 TP 1.16077 spr=2
PH	0	16:17:18.931	Core 04	2026.09.01 17:35:01   [SRJ-EA] MTSNAP bar=2026.09.01 17:30 dir=LONG anchor=Monthly-VWAP entry=1.16022 sl=1.15975 tp=1.16077 regime=1
RM	0	16:17:18.931	Core 04	2026.09.01 17:35:01   [SRJ-EA] PRE-SEND lots=2.04 entry=1.16024 slPts=49 tpPts=53 stopsLevel=0 freezeLevel=0 spreadPts=2
OS	0	16:17:18.931	Core 04	2026.09.01 17:35:01   deal #2 buy 2.04 EURUSD at 1.16024 done (based on order #2)
--- end W6 ---

## EVIDENCE B - code (byte-spliced; whole contiguous EA regions, post-build line numbers)

--- EA 6267-6330 ResetSequence+GoAbort (64) ---
void ResetSequence()
  {
   g_state          = ST_IDLE;
   g_dir            = DIR_NONE;
   SrjSideNote("ResetSequence", g_dir);
   g_regime         = REGIME_NONE;
   g_sessionAtEntry = SESSION_NONE;
   g_anchorLine     = -1;
   g_anchorPrice    = 0.0;
   g_anchorBarTime  = 0;
   g_divLatch       = false;
   g_touchSeen      = false;
   g_touchBarHi     = 0.0;
   g_touchBarLo     = 0.0;
   g_zoneHi         = 0.0;
   g_zoneLo         = 0.0;
   g_alertedArmed   = false;
   g_alertedSignal  = false;
   g_latchedEntry   = 0.0;
   g_latchedSl      = 0.0;
   g_latchedTp      = 0.0;
   g_latchedR       = 0.0;
   g_latchBarTime   = 0;
   g_confirmFromState = ST_IDLE;
   //--- [P-BUILD3 E5] no new working-set field: the re-bind assigns anchor,
   //--- price, time, zone, touch, state, latch + confirmFrom only â€” all are
   //--- existing members (fields 4/5/6, 11/12, 8/9/10, 0, 15-19, 20).
  }

void GoAbort(const string reason, ENUM_SRJ_STATE atState)
  {
   LogAbort(reason, atState);
   if(InpDebugLog && g_dir != DIR_NONE)
     {
      string a6rBT = TimeToString(TimeCurrent(), TIME_DATE|TIME_MINUTES);
      string a6rLn = StringFormat("[SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=%s state=%s dir=%s predicate=%s",
                                  a6rBT, StateName(atState), DirName(g_dir), reason);
      A6Emit("REF" + a6rBT + reason + StateName(atState), a6rLn);
     }   //--- [A6-HOOK] (ii) refused decision row (candidate alive => born+rejected)
   //--- TASK 19c: count NO_REGIME aborts so the census can be read against
   //--- them directly. Measurement only.
   if(InpDebugLog && reason == ABORT_NO_REGIME) g_ea19_noRegimeAborts++;
   if(InpAlertStandDown && g_alertedArmed && !g_alertedSignal)
      EmitAlert("STAND-DOWN", "reason=" + reason, false);

   //--- TASK 15: shadow record. Must fire BEFORE ResetSequence()
   //--- clears g_dir and g_anchorLine. Read-only measurement.
   if(InpDebugLog &&
      (reason == ABORT_NO_REGIME || reason == ABORT_LTF_MISALIGN))
     {
      g_shadowActive = true;
      g_shadowDir    = g_dir;
      g_shadowLine   = g_anchorLine;
      g_shadowOpened = g_anchorBarTime;
      g_shadowSess   = g_sessionAtEntry;
      g_shadowFail   = reason;
      g_shadowBars   = 0;
     }

   ENUM_SRJ_STATE prev = g_state;
   g_state = ST_ABORT;
   LogState(prev, g_state);
   ResetSequence();
  }
--- end C1 ---
--- EA 1716-1729 LogState+LogAbort (14) ---
void LogState(ENUM_SRJ_STATE from, ENUM_SRJ_STATE to)
  {
   if(!InpDebugLog) return;
   PrintFormat("[SRJ-EA] %s STATE %s->%s dir=%s poi=%s",
               TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
               StateName(from), StateName(to), DirName(g_dir), AnchorStr());
  }

void LogAbort(const string reason, ENUM_SRJ_STATE atState)
  {
   PrintFormat("[SRJ-EA] %s ABORT reason=%s state=%s poi=%s dir=%s",
               TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
               reason, StateName(atState), AnchorStr(), DirName(g_dir));
  }
--- end C2 ---
--- EA 1803-1818 SessionAlreadyUsed+MarkSessionUsed (16) ---
bool SessionAlreadyUsed(ENUM_SRJ_SESSION sess, datetime barTimeServer)
  {
   datetime today = TC_DayStart(barTimeServer);
   if(sess == SESSION_LONDON)
      return (g_sessionUsed_London && g_sessionUsedDay_London == today);
   if(sess == SESSION_NYAM)
      return (g_sessionUsed_NYAM   && g_sessionUsedDay_NYAM   == today);
   return false;
  }

void MarkSessionUsed(ENUM_SRJ_SESSION sess, datetime barTimeServer)
  {
   datetime today = TC_DayStart(barTimeServer);
   if(sess == SESSION_LONDON) { g_sessionUsed_London = true; g_sessionUsedDay_London = today; }
   if(sess == SESSION_NYAM)   { g_sessionUsed_NYAM   = true; g_sessionUsedDay_NYAM   = today; }
  }
--- end C3 ---
--- EA 7457-7568 reseed-statement+transfer (112) ---
   //--- DetectPoiRetest is read-only - it fills a caller-owned struct from the
   //--- 12 POI buffers and mutates no sequence state - and it already returns
   //--- the MOST AUTHORITATIVE matching line. So once GoAbort has cleared the
   //--- sequence, the IDLE block below re-detects that same line and seeds it.
   //--- No seeding code is duplicated here.
   //---
   //--- ÃƒÂ¢Ã‹Å“Ã¢â‚¬Â¦ THIS SITE DELIBERATELY DOES NOT RETURN AFTER GoAbort. ÃƒÂ¢Ã‹Å“Ã¢â‚¬Â¦ Every other
   //--- GoAbort call site returns; this one must fall through so the IDLE block
   //--- seeds the replacement on the SAME bar. GoAbort sets ST_ABORT and then
   //--- calls ResetSequence, leaving g_state == ST_IDLE, which is exactly the
   //--- state the IDLE block requires. Section 3.7's no-early-return cascade is
   //--- what makes same-bar promotion possible.
   //---
   //--- Placed BEFORE the Task 73 census so a replaced retest is not ALSO
   //--- counted as suppressed - it was promoted, not discarded. That census is
   //--- gated on g_state > ST_IDLE and so skips on a replacement bar.
   //---
   //--- One-bar divergence-latch consequence, accepted: the latch block sits
   //--- ABOVE this one, so the replacement candidate's latch is first evaluated
   //--- on the NEXT bar. Part A Step 7 latches at any point with no bar-count
   //--- limit, so a one-bar delay can postpone a signal but cannot lose one -
   //--- the same reasoning EA-78 records for CQD's shift-2-only visibility.
   if(g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0 && inWindow)
     {
      PoiRetestResult t78_pr;
      if(DetectPoiRetest(barShift, t78_pr) && t78_pr.found)
        {
          ENUM_SRJ_DIR t78_dir = t78_pr.isLong ? DIR_LONG : DIR_SHORT;
          bool t78_opp  = (t78_dir != g_dir);
          bool t78_tier = ((g_authorityRank[t78_pr.topLine] / 2) <
                           (g_authorityRank[g_anchorLine]   / 2));
          //--- [S2-PREEMPT-SHADOW-001] WOULD-PREEMPT recorder: reuses the computed
          //--- t78_pr/t78_dir/t78_opp/t78_tier above (no fresh DetectPoiRetest call,
          //--- no N1 touch â€” detection ran once). Record-only: locals + print only.
          //--- FORBIDDEN in this shadow and ABSENT below: g_state / g_anchorLine /
          //--- g_dir / anchor price-time / zone-touch-latch / GoAbort /
          //--- ResetSequence / order-stop-eligibility-session writes
          //--- (documented guarantee, grade-verified).
          if(InpDebugLog && t78_opp)
            {
             int s1h_newTier  = g_authorityRank[t78_pr.topLine] / 2;
             int s1h_heldTier = g_authorityRank[g_anchorLine]   / 2;
             PrintFormat("[SRJ-EA] SIDE1H_WOULDPREEMPT bar=%s newPoi=%s newDir=%s heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d wouldPreempt=%d wouldTierPassLegacy=%d",
                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                      TIME_DATE|TIME_MINUTES),
                         g_lineCode[t78_pr.topLine], DirName(t78_dir),
                         g_lineCode[g_anchorLine], DirName(g_dir),
                         StateName(g_state),
                         s1h_newTier, s1h_heldTier,
                         ((g_state == ST_S2_LTF_ALIGN) ? 1 : 0),
                         (t78_tier ? 1 : 0));
            }
          if(t78_opp && t78_tier)
           {
            PrintFormat("[SRJ-EA] POIREPLACE bar=%s newPoi=%s newDir=%s "
                        "heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                     TIME_DATE|TIME_MINUTES),
                        g_lineCode[t78_pr.topLine], DirName(t78_dir),
                        g_lineCode[g_anchorLine], DirName(g_dir),
                        StateName(g_state),
                        g_authorityRank[t78_pr.topLine] / 2,
                        g_authorityRank[g_anchorLine]   / 2);
            /* [Task 91 / EA-105 / operator ruling Q3] REMOVED. Was GoAbort(ABORT_POI_REPLACED, g_state). Operator: "i will always execute the first one, the later higher POI does not get executed... if i have executed the first trade, i would not execute other trade even it's from higher hierarchy." Arrival order governs ACROSS TIME; anchor tier governs ONLY a same-bar tie between two completed candidates (EA-96), which MarkSessionUsed on the SIGNAL path already enforces. The across-time replacement reading of Part A Step 8 / D-3 / G-2 was a planner inference and is overturned. The POIREPLACE line above is RETAINED as a counterfactual census: it still prints on every bar this removal now lets pass, so the 16 firings measured on the Task 88 run stay countable. Threshold-free - nothing is added, one call is removed. */ ;
            }
          //--- [S2-CROSS-DIR-PREEMPT] live transfer (Luna V87-LIVE-PREEMPT-001
          //--- Â§Â§3-6, cleared BY NAME; his selection token + fresh run word this
          //--- turn). State-bounded: S2-held candidate yields to the observed; P-VNEXT-1 admits S1-held on opposite-confirm (unconfirmed held only).
          //--- opposite-direction candidate. Region-P-equivalent MIRROR (no callable
          //--- helper exists â€” Region P EA:7421-7467 is inline; deltas declared:
          //--- (a) g_dir takes t78_dir, Region P keeps dir; (b) NO state write and
          //--- NO LogState - state unchanged on either path (S2 stays S2, S1 stays S1), never ST_IDLE;
          //--- (c) one InpDebugLog-gated SIDE1C_PREEMPT print, new family,
          //--- observation only). Reuses computed t78_pr/t78_dir/t78_opp above (no
          //--- fresh DetectPoiRetest, N1 untouched). Tier recorded, never consulted
          //--- (no <, no <=). Placed AFTER the POIREPLACE census above (D4) so the
          //--- census labels stay pre-transfer and byte-comparable.
          //--- [P-VNEXT-1 E1] confirmed-opposite displaces unconfirmed-held (his setup-definition 2026-09-22): opposite booked retest with confirm=1 takes the anchor when the held candidate confirms 0. S1-gated: the N1-instrumented predicate runs only where consumed. Declarations hoisted one level so the widened transfer condition below can read them (block scope).
          bool t78_opConf = false, t78_heldConf = false;
          if(g_state == ST_S1_REGIME && t78_opp)
            {
             string t78_failOp = "", t78_failHeld = "";
             t78_opConf = IsConfirmationCandle(barShift, t78_pr.topLine, t78_dir, t78_failOp);
             t78_heldConf = IsConfirmationCandle(barShift, g_anchorLine, g_dir, t78_failHeld);
            }
          if(t78_opp && (g_state == ST_S2_LTF_ALIGN || (g_state == ST_S1_REGIME && t78_opConf && !t78_heldConf)))
            {
             int s1c_fromLine     = g_anchorLine;
             ENUM_SRJ_DIR s1c_fromDir = g_dir;
             g_anchorLine    = t78_pr.topLine;
             ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
             g_anchorBarTime = barTime;
             g_dir           = t78_dir;
             g_zoneHi        = 0.0;
             g_zoneLo        = 0.0;
             g_touchSeen     = false;
             g_touchBarHi    = 0.0;
             g_touchBarLo    = 0.0;
             g_latchedEntry  = 0.0;
             g_latchedSl     = 0.0;
             g_latchedTp     = 0.0;
             g_latchedR      = 0.0;
             g_latchBarTime  = 0;
             g_confirmFromState = ST_IDLE;
             if(InpDebugLog)
                PrintFormat("[SRJ-EA] SIDE1C_PREEMPT bar=%s from=%s fromDir=%s to=%s toDir=%s state=%s",
                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                         TIME_DATE|TIME_MINUTES),
                            g_lineCode[s1c_fromLine], DirName(s1c_fromDir),
                            g_lineCode[t78_pr.topLine], DirName(t78_dir),
                            StateName(g_state));
            }
--- end C4 ---
--- EA 7629-7686 T73 veto census (58) ---
   //--- [Task 73 / Stage 3 cost side] Suppression census. DIAGNOSTIC ONLY.
   //--- Two unmeasured quantities, both needed before Stage 3 is sized:
   //---   1. The singleton discards every POI retest that arrives while a
   //---      sequence is alive. 103 candidates were ADMITTED across this
   //---      window; how many were silently dropped is unknown, and Stage 3
   //---      lengthens candidate lifetime, so it raises that number.
   //---   2. Part A carries a rule the EA does not implement - an
   //---      opposite-direction HIGHER-TIER retest replaces the candidate.
   //---      Its frequency has never been counted.
   //---
   //--- DetectPoiRetest is read-only: it fills a caller-owned struct from the
   //--- 12 POI buffers and mutates no sequence state. It is called here on the
   //--- SAME barShift the live cascade uses, so a hit is exactly a retest the
   //--- IDLE block would have consumed had the singleton been free.
   //---
   //--- Tier comparison uses g_authorityRank (lower is more authoritative),
   //--- the same ranking D-3 and G-2 already use. No distance, no size, no bar
   //--- count, no tolerance - Part A section 7 is not engaged.
   //---
   //--- Gated on InpDebugLog. Assigns nothing outside its own statics, reads
   //--- g_state / g_dir / g_anchorLine for labelling only, and cannot alter
   //--- control flow. R8 is NOT engaged.
   if(InpDebugLog && inWindow &&
      g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0)
     {
      static int s_t73_n      = 0;
      static int s_t73_higher = 0;
      static int s_t73_opp    = 0;
      static int s_t73_both   = 0;
      static int s_t73_bars   = 0;
      s_t73_bars++;
      PoiRetestResult t73_pr;
      if(DetectPoiRetest(barShift, t73_pr) && t73_pr.found)
        {
         s_t73_n++;
         ENUM_SRJ_DIR t73_dir    = t73_pr.isLong ? DIR_LONG : DIR_SHORT;
         bool         t73_isOpp  = (t73_dir != g_dir);
         bool         t73_isHigh = (g_authorityRank[t73_pr.topLine] <
                                    g_authorityRank[g_anchorLine]);
         if(t73_isHigh)               s_t73_higher++;
         if(t73_isOpp)                s_t73_opp++;
         if(t73_isOpp && t73_isHigh)  s_t73_both++;
         PrintFormat("[SRJ-EA] SUPPRESSED bar=%s poi=%s dir=%s opp=%d higher=%d "
                     "heldPoi=%s heldDir=%s heldState=%s "
                     "cum_n=%d cum_opp=%d cum_hi=%d cum_both=%d action=%s",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                  TIME_DATE|TIME_MINUTES),
                     g_lineCode[t73_pr.topLine], DirName(t73_dir),
                     (int)t73_isOpp, (int)t73_isHigh,
                     g_lineCode[g_anchorLine], DirName(g_dir), StateName(g_state),
                     s_t73_n, s_t73_opp, s_t73_higher, s_t73_both,
                     b3_superseded ? "SUPERSEDED" : "HELD");
        }
      if((s_t73_bars % 500) == 0)
         PrintFormat("[SRJ-EA] SUPPRESSED_PROGRESS heldBars=%d n=%d opp=%d "
                     "higher=%d both=%d",
                     s_t73_bars, s_t73_n, s_t73_opp, s_t73_higher, s_t73_both);
     }
--- end C5 ---
--- EA 7710-7757 IDLE seed block (48) ---
    if(g_state == ST_IDLE)
      {
       if(!inWindow) { if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=WINDOW inWin=0 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), -1); return; }
      if(SessionAlreadyUsed(sess, barTime))
        {
         static datetime s_limitDay  = 0;
         static int      s_limitSess = -1;
         datetime dayKey = TC_DayStart(barTime);
         if(InpDebugLog && (dayKey != s_limitDay || (int)sess != s_limitSess))
           {
            s_limitDay  = dayKey;
            s_limitSess = (int)sess;
            PrintFormat("[SRJ-EA] %s SESSION_LIMIT: %s window already used today - "
                        "all further candidates suppressed until the next window",
                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
                        SessionName(sess));
           }
         if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=SESSION inWin=1 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), -1);
         return;
        }
        PoiRetestResult pr;
        if(!DetectPoiRetest(barShift, pr) || !pr.found) { if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=RETEST inWin=1 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), (pr.found ? 1 : 0)); return; }
        s1g_legDir = pr.isLong ? 1 : -1;   //--- [SIDE1G] (0) independent legDir capture (new local only)
        g_s2_seedShift = barShift;   //--- [STAGE-C E-C05] exact-seed bar carriage for the live vote
         g_anchorLine    = pr.topLine;
       //--- [FP-LIMBSEAT-1 S2-3] F3 owns the carried-side write (single
       //--- writer). Live rows carry no declared class -> ABSTAIN
       //--- pass-through of the legacy value (D3 holds by construction);
       //--- legacy output stays the compared label, fire-log identical.
       g_dir           = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
        SrjSideNote("DetectPoiRetest", g_dir);
      g_anchorBarTime = barTime;
      ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
      g_sessionAtEntry = sess;
      g_divLatch = false;
      ENUM_SRJ_STATE prev = g_state;
      g_state = ST_S1_REGIME;
      LogState(prev, g_state);
      //--- [P-BUILD3 E2] seed census: the detector already returns argmin(rank);
      //--- tier-best == rank-best at seed (no held line), so ElectAnchor parity
      //--- holds by construction. Additive print only; assigns nothing.
      if(InpDebugLog)
         PrintFormat("[SRJ-EA] ANCHOR_ELECT bar=%s action=SEED poi=%s rank=%d tier=%d dir=%s",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                  TIME_DATE|TIME_MINUTES),
                     AnchorStr(), g_authorityRank[g_anchorLine],
                      B3_AnchorTier(g_anchorLine), DirName(g_dir));
         }
--- end C6 ---
--- EA 7760-7792 R2 void (33) ---
    if(g_state > ST_IDLE && g_state < ST_S5_GATE_CHECK && g_anchorBarTime > 0)
     {
      double r2_hi = iHigh(_Symbol, PERIOD_CURRENT, barShift);
      double r2_lo = iLow(_Symbol, PERIOD_CURRENT, barShift);
      const int r2_bufs[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW, FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW, FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW, FL_BUF_NY_HIGH, FL_BUF_NY_LOW, FL_BUF_PM_HIGH, FL_BUF_PM_LOW, FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW, FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW, FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW, FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };
      bool r2_touch = false;
      double r2_val = 0.0;
      int r2_buf = -1;
      double r2_mask;
      if(!ReadFlow(FL_BUF_SWEPT_MASK, r2_mask, barShift + 1)) r2_mask = EMPTY_VALUE;
      bool r2_mValid = (MathIsValidNumber(r2_mask) && r2_mask == MathFloor(r2_mask) && r2_mask >= 0.0 && r2_mask < 4194304.0);
      int r2_m = (r2_mValid ? (int)MathRound(r2_mask) : 0);
      static int r2_evals = 0;
      if(!r2_mValid && InpDebugLog) PrintFormat("[SRJ-EA] R2SKIP bar=%s evals=%d (mask unavailable or invalid - seed held)", TimeToString(barTime, TIME_DATE|TIME_MINUTES), r2_evals);
      if(r2_mValid) r2_evals++;
      for(int r2_k = 0; r2_k < 18 && !r2_touch && r2_mValid; r2_k++)
        {
         double r2_v;
         int r2_sweptBit = (r2_k <= 9 ? r2_k : r2_k + 4);
         if((r2_m & (1 << r2_sweptBit)) != 0) continue;
         if(ReadFlow(r2_bufs[r2_k], r2_v, barShift + 1) && r2_lo <= r2_v && r2_v <= r2_hi)
            { r2_touch = true; r2_val = r2_v; r2_buf = r2_bufs[r2_k]; }
         }
      if(r2_touch && g_regime == REGIME_MEANREV)
        {
         ENUM_SRJ_STATE r2_prev = g_state;
         g_state = ST_IDLE;
         g_anchorLine = -1;
         g_anchorBarTime = 0;
         LogState(r2_prev, g_state);
         if(InpDebugLog) PrintFormat("[SRJ-EA] SEEDVOID bar=%s dir=%s buf=%d line=%s evals=%d hi=%s lo=%s", TimeToString(barTime, TIME_DATE|TIME_MINUTES), DirName(g_dir), r2_buf, DoubleToString(r2_val, _Digits), r2_evals, DoubleToString(r2_hi, _Digits), DoubleToString(r2_lo, _Digits));
        }
     }
--- end C7 ---
--- EA 8793-8822 S5 disposition post-evict (30) ---
      if(!divOk)
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] CONFIRM_DIV_WAIT bar=%s dir=%s verdict=%d",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                     TIME_DATE|TIME_MINUTES),
                         DirName(g_dir), divVal);
          //--- [P-SLDEF-4 E33] the decided outcome rides the census.
          SrjOrderEmit(barShift, "DIV_WAIT");
         //--- [P-EVICT-1] refused S4 holders abort (squatter GC, positive test).
         ENUM_SRJ_STATE prevDiv = g_state;
         if(g_confirmFromState == ST_S4_ARMED)
           {
            GoAbort(ABORT_DIV_FALLBACK, g_state);
            return;
           }
         if(g_confirmFromState == ST_S3_ZONE_WAIT)
           {
            g_state = ST_S3_ZONE_WAIT;
            LogState(prevDiv, g_state);
            return;
           }
         PrintFormat("[SRJ-EA] EVICT_UNEXPECTED_ORIGIN bar=%s origin=%s",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                  TIME_DATE|TIME_MINUTES),
                     StateName(g_confirmFromState));
         g_state = ST_S4_ARMED;
         LogState(prevDiv, ST_S4_ARMED);
         return;
        }
--- end C8 ---
--- EA 10156-10166 alert-only mark (11) ---
      if(InpMode == MODE_ALERT_ONLY)
        {
         PrintFormat("[SRJ-EA] ALERT_ONLY mode - no order sent. Session %s marked used.",
                     SessionName(g_sessionAtEntry));
         MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
         ENUM_SRJ_STATE prevA = g_state;
         g_state = ST_SIGNAL;
         LogState(prevA, g_state);
         ResetSequence();
         return;
        }
--- end C9a ---
--- EA 10253-10258 take mark (6) ---
      MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
      ENUM_SRJ_STATE prev = g_state;
      g_state = ST_SIGNAL;
      LogState(prev, g_state);
      ResetSequence();
     }
--- end C9b ---

## 8. Close (what comes back, what happens next)

- Owed back: three verdicts (Q1 cause + Q2 re-squat edit + Q3 exit-executor edit) in the answer forms above, same text compared across seats; a checkable discrepancy from any seat halts per standing rule 19 with same-turn disk verification.
- Next: the builder folds the answers into a packet draft plus the pre-transport battery; nothing builds, runs, or commits on council text alone.

## 9. Byte audit (builder-measured same turn, recorded not carried)

- All spliced bytes ride by mechanical pull with per-block count + first-line asserts (16/16 green, markers 1x each pre-splice, zero markers left).
- ASCII lines are byte-identical to disk by construction (bytes below 128 are encoding-invariant).
- Five comment lines carry non-ASCII source bytes (relay lines 124/205/232/265/268 = EA lines 6292/7463/7490/7523/7526): em-dash, star, and section marks live in the EA file as single-byte ANSI and render here as UTF-8, so those five lines are text-identical but byte-differing; every other spliced line is byte-identical. Builder prose is pure ASCII (zero non-ASCII lines outside spliced blocks, audited).
- The single code ellipsis (relay line 535, Task-91 comment prose) and the single code bit-shift (relay line 715, R2 operator) are source-literals inside spliced regions; the two further occurrences on this audit line quote those same two; no unresolved marker and no author-typed ellipsis remain. V259 exit regions add zero non-ASCII bytes (file total still 101).

(End of file)
