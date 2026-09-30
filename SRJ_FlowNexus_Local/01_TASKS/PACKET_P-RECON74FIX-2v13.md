# PACKET_P-RECON74FIX-2 v13 DRAFT - V352 fence fixes + H3 substitute (compile-scope + single-print + guard + overlap + column + resets + fields; build gated on new key + run word; nothing builds/runs/commits on this file)

Status: v13 DRAFT (folds V352 verdicts, ledger 1009: Q1 0-2 OBJECT HALT with dispositions; design: H1 guard + single-print + resets + fields, H2 elapsed contract, H3 contender-scoped substitute, S3TELEM fields, ABORT2 form; base = v27 tree 21501194/681197/12259; STAGE-1/S3 disciplines attach; build needs a NEW key + his run word, neither spent nor asked here).

Status: v11 DRAFT (folds V350 verdicts on FIX-2 v10, ledger 1003: Q1 1-1 SPLIT with dispositions; design: B4 indent form fix + anchors rebuttal + prose close, zero logic change; base = v26 tree 8C6468F4/676326/12202; STAGE-1/S3 disciplines attach; build needs a NEW key + his run word, neither spent nor asked here).

Canonical files: Experts\SRJ_FlowNexus_EA.mq5 ONLY (fixes R/B2/B3/S3/B4 below; indicator + FlowLogic untouched). No new indicator buffers, no new inputs, no new handles (helper reads iTime/iHigh/iLow + CurrentTradingWindow, all settled tree calls); one new function (UjClosedSessionTarget) + one new ABORT code + one modified print line (S2PROMOTE_M15) + four new prints (UJRETARGET/UJNORETARGET/UJSBTELEM/S2SEEDBIAS_KILL) + seq/admit args on both retarget prints + tpRef revision (managed only) + B4 seed-block condition/print-head mods (EA-8126/EA-8134); v13 deltas: H1 guard + single UJRESEED (al/ok) + UJOPCONF folded in (H4 retired) + transfer reset mirror, H2 elapsed contract, H3sub default-off param (13 EU callers strict-identical), S3TELEM o1/c0/c1/arm fields, ABORT2 form (col 32).

## Authority (his words verbatim + disk, no invention)

- His Ruling-1 (2026-09-29, chart, typos his filed verbatim in the intake): the 5 June New York LONG did not exit on the New York session high once it closed but closed on the day exit. Amended point: RETARGET fires (his standing rule): a session high/low that closes while a trade floats is a valid exit target. Scope note (Sonnet-3, builder prose call, scope narrowing disclosed): entry-session-type only at P054; other session types closing never retarget; the relay's Ruling-1 Rule line above reads within that scope; P009/P010/P011 below are normalized renderings with verbatim strings in the relay section 0 (GLM-A5).
- His Ruling-2 (2026-09-29, chart): the 8 June London SHORT is invalid because at 9:35 the structure had flipped bullish (flipped at 9:25). Amended point: STRUCTURAL-BIAS kills (his standing rule): a 5m bullish flip refuses SHORT confirmation; the seedbias REJECT verdict was correct and the promotion was the defect. Kill implemented on the M15-fallback path only (B2-INTENT carried); aligned-path promotions ungated by design pending his word (V348 Luna-3). Concrete ungated case: seed refused (sb=0) then LTF re-aligns pre-S2 so the aligned path promotes (word owed on this case, parked - V350 Sonnet).
- His Ruling-3 (2026-09-29, chart): the 11 June is missed. Amended point: seed/detector gap stands as diagnosed (no LONG contender at the decision pass despite book hits).
- EU run ABORTED on his word same turn (key memo withdrawn, no key pasted, terminal.ini untouched June, nothing launched). The EU check rides a future word + key scope, never this packet.
- V340 grade (ledger 967, result BUILDER_RESULT_V340-GRADE.md 4E12A877): Q1 OBJECT-vs-CONFIRM (helper body owed - folded below as exact code); Q2 2-0 CLEAR (kill fail-closed, -1 pass - carried, fences below unchanged except the B3 print mod); Q3 telemetry 2-0 CLEAR (print below gains one field) + calibration SPLIT (telemetry now, term after UJSBTELEM rows; Luna one-liner carried as ruled candidate, never adopted); V341 grade (ledger 978, result BUILDER_RESULT_V341-GRADE.md A4CA05A6): all three 2-0 CLEAR with D1/D4/A actions - folded below).

## Record-first trail (spec + restatement + findings + journal + V340 verdicts searched before council)

- Spec Part A v4.2 (file, 35807 bytes): "retarget" 0x, "session high" exit 0x, "bias flip" 5x (generalities only). The retarget rule lives in his later words alone (strategy skill RETARGET section); the bias-gate mechanism lives nowhere on record (seedbias carriage exists, promotion ignores it).
- Findings: EXIT-BREAK-RETEST (break-retest, not retarget), EXITMODEL-1 (Q6 nearest-recompute, entry-scoped), RETEST-INVALIDATION-V1 (grading rules S5.4/S3.3, unaffected below), USDJPY-MISSES Rulings-J (entry triple, reused).
- Journal: no rows rule these venues (6/8 false has no journal row and is ruled INVALID by him; 6/11 + 6/5 rows cited in the death chains).
- V340 verdicts (delta-memory sweep for the fold; every demand below names its disposition in the fold map): Luna OBJECT Q1 (helper body) + CONFIRM Q2 + OBJECT Q3b (exact one-liner) + Analytics A/B; GLM CONFIRM x3 with contract + build-gate + 20 analytics + 6 mechanisms; Sonnet advisory CONFIRM x3 with 9 + 6 + 4 + date + Ask-B notes. No birth/selection authorship question ships (all venues are his ruled trades or the ruled-invalid false; nothing hypothesized as his candidate). V341 verdicts swept the same way (D1/D4/A-pins + carry confirmations); dispositions in the fold map.

## Death chains (RECON74 round - graded long ago; retained as history)

- R-venue (5 June NY LONG, entry 16:55 open 160.115): TP booked 160.723 DH at fire and NEVER revised (all TP rows 16:50-fire through 6/8 carry tp=160.723; EXITVERDICT curTp=none); NY session high 160.262 closed 19:00 while floating (TPCENSUS NYH pool 147pts at 16:50 ref 160.115; 16:00 bar high 160.262); exit 6/8 00:50 POI_BODY_BREAK at 160.226 (multi-day float). Death = no retarget leg (managed TP frozen at booking).
- B-venue (8 June London SHORT, entry 09:35 open 160.294): UJPROBE ltf flipped +1.0 bullish at the 09:25 bar (m15 still -1.0); SEEDBIAS 09:25 SHORT biasAligned=0 REJECT-BIAS-TIMING (correct refusal); S2PROMOTE_M15 fired 09:25 on M15-align anyway (promotion ignores the verdict); S3ARM/S2POLL/S5 ran to a TP_TOUCH 11:50 win R3.47 (invalid winner, rejected per NO-OVERFIT). Death = promotion path never reads s1g_seedBiasAl (int carriage, decl EA-1151 default -1, set EA-8133 -1/1/0, consumed only at S1H EA-10357).
- S-venue (11 June NY LONG, owed entry 14:40 open 160.524): SHORT S4 squatter held 14:20-14:35 (seeded 14:05 CONSIDER); state never IDLE so no LONG seed could form (seed branch IDLE-gated EA-8002); RETESTBOOK 14:35 hits=2 dL (potential) with zero LONG candidate rows; SIDE1D_BOTHDIRS 14:30 + 14:35 sel=LONG Daily-POC (detector SAW the retest); S-b transfer found no contender (YIELD 0x run-wide); holder correctly deferred (UJDEFERABORT 14:35) and aborted 14:40:22 on identity (S-a fires as designed); LONG seeds only at 11:05 (aborted 12:05 SESSION_CLOSED, correct) and 15:00. Death = confirmation predicate refused the 14:35 bar (uj_sbConfC false; no LONG poll rows exist because polls run the held anchor) + no contender observability.

## Death chains (RECON75-V11-UJ segment 060D8133/5777305/30249, DONE=PASSED; binary v27 21501194 + ex5 413D7004; window testing-line proven 06-01->06-13)

- R75-1 (5 June London SHORT miss, entry owed 09:45 open 159.948): 09:05 SHORT seed REJECT-killed (S2SEEDBIAS_KILL, premature seed, moot); 09:10 LONG seed CONSIDER took S1 holder; 09:20-09:50 SHORT retests (incl. 09:35 his-retest hits=1 dS) all SUPPRESSED (heldPoi Daily-POC heldDir LONG - holder's own line); 11:05 VWAP SHORT seeded (different line proceeds, same-POI contention proven); 12:05 LONG holder SESSION_CLOSED-aborted after 2h50m unconfirmed. Death = same-POI holder veto + no-expiry (F1/F2). WOULDPREEMPT rows prove t78_opp TRUE 09:20-09:40 with zero displace fires (split retest->confirm unreachable by same-bar opConf design).
- R75-2 (5 June NY LONG late + retarget proof): 16:00 LONG seed REJECT-killed; no retest 16:05-16:40 (hits=0, detector gap at owed 16:15); 16:45 retest + SEEDBIAS CONSIDER; 16:50 CONFIRMPOLL confirm=1; 16:55 UJADMIT entry 160.115 R1.56 (late completion, hypothesized); 19:00 UJRETARGET tp 160.723->160.298 seq=2 admit=16:50 (first keyed row); tpB-carry 19:00-19:15; 19:15 TP_TOUCH exit 160.298. Session max 160.298 proven by 18:45-bar EXITVERDICT (h=160.298); acceptance 160.262 withdrawn as pool-time value (C1).
- R75-3 (8 June London SHORT invalid, silent): 09:25 REJECT-kill fired, no promotion, no take. Design goal MET (first mechanism refusal; was invalid winner in v26).
- R75-4 (11 June NY LONG miss, term named): SHORT squatter held (UJDEFERABORT 14:35, SUPPRESSED HELD); LONG contender at 14:40:22 pass evaluating 14:35: have=1 sbDir=LONG confC=0 sbL=160.523 termC=A2_CLOSE_BREAK. Death = A2 predicate refusal (term fix = H3).

## Edit set (exact anchors; STAGE-1 exact-diffs each; old blocks mechanical-spliced at build battery; convention: NET per site = NEW minus OLD; S3 recount governs)

- FIX R (session-close retarget; T3 class): revise the booked TP to the closed session H/L when a trade floats across the close. Sits in EvaluateManagedTrade before the TP block (EA-11826-11842 region; function signature void EvaluateManagedTrade(const int barShift) EA-11760, so barShift is the parameter and in scope - Sonnet Q1-1 answered on disk; g_mtrade.sessionAtEntry set at admission EA-10627, reset -1 EA-355 - Sonnet Q1-4 answered on disk, no new carriage; MTEXIT consumes tpRef EA-11944).
```mql5-old-R
    bool tpBookedTouch = false;
    if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
      {
```
```mql5-new-R
    //--- [P-RECON74FIX-2 R] session-close retarget (his RETARGET rule; closed-session values only; instance-contained plus caller-strict-tighter jointly bound the revision to one per trade instance).
    if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
      {
       double uj_rtPx = 0.0;
       if(UjClosedSessionTarget(g_mtrade, barShift, uj_rtPx) && uj_rtPx > 0.0
          && ((g_mtrade.dir == DIR_LONG && NormalizeDouble(uj_rtPx, _Digits) < NormalizeDouble(g_mtrade.tpRef, _Digits)) || (g_mtrade.dir == DIR_SHORT && NormalizeDouble(uj_rtPx, _Digits) > NormalizeDouble(g_mtrade.tpRef, _Digits))))
         {
          double uj_oldRef = g_mtrade.tpRef;
          g_mtrade.tpRef = uj_rtPx;
          if(InpDebugLog) PrintFormat("[SRJ-EA] UJRETARGET bar=%s dir=%s old=%s sess=%d tp=%s seq=%I64d admit=%s - session-close retarget (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(uj_oldRef, _Digits), g_mtrade.sessionAtEntry, DoubleToString(g_mtrade.tpRef, _Digits), (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES));
         }
       else if(InpDebugLog && uj_rtPx > 0.0) PrintFormat("[SRJ-EA] UJNORETARGET bar=%s dir=%s tp=%s rt=%s why=%s sess=%d seq=%I64d admit=%s - helper true but not tighter (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(g_mtrade.tpRef, _Digits), DoubleToString(uj_rtPx, _Digits), (NormalizeDouble(uj_rtPx, _Digits) == NormalizeDouble(g_mtrade.tpRef, _Digits) ? "eq" : "loose"), g_mtrade.sessionAtEntry, (long)g_mtrade.uj_tradeSeq, TimeToString(g_mtrade.uj_admitBarTime, TIME_DATE|TIME_MINUTES)); // helper-true discriminator
      }
    bool tpBookedTouch = false;
    if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
      {
```
- FIX RHELP (exact helper body with instance containment; answers V341 D1 + Sonnet Q1-1 with zero new carriage): closed entry-session-INSTANCE extreme read from price history (immune to buffer reset semantics by construction - only bars whose CurrentTradingWindow equals the entry session contribute; buffer route parked with cause: session-buffer post-close latch semantics unpinned on the page). Sits after the CurrentTradingWindow close (EA-1887) before the P-RESQUAT-1 F-a comment (EA-1889); definition precedes the EA-11829 caller so no prototype is needed. Walk cap 600 bars with admission-time containment (uj_admitBarTime set at admission EA-10647 near sessionAtEntry EA-10627 in the same admission block, 20 lines apart; no struct change; uj_admitBarTime pre-exists (EA-264) - GLM B1(b) path, no latch field, P005 surface holds); a later same-type close finds a run NOT containing the admission bar and returns false, so the revision fires at most once per trade instance; entry session NONE/-1 or unset admission time returns false (contract pins). Other session types closing never retarget (entry-session-type scope, stated per D2). Below-entry extremes accepted per his literal rule (no profit-side guard - D3 pinned accept; Sonnet Q1-2 floor declined canon-order). Type pins (D5): struct SManagedTrade EA-239, enum ENUM_SRJ_DIR EA-226, enum ENUM_SRJ_SESSION EA-228 - all defined before the EA-1887 site. Window pin (Luna A2): ENUM_SRJ_SESSION CurrentTradingWindow(datetime barTimeServer) EA-1865, pure half-open session map (London 02:00-05:00 ET, NYAM 07:00-12:00 ET, server-converted); helper reads bar-open times only. Walk geometry (post-fix, V348 Sonnet-1/GLM-6): the walk covers only the contiguous entry-session run (about 36 M5 bars London, about 60 NYAM); the revision can fire only on the pass evaluating the first out-of-session bar; the 600-bar cap never binds and the Friday-Monday span is unreachable (a Monday evaluation walks the Friday NYAM run, never the older London instance, and fails containment for a London trade under 24h June bars; the Friday-NYAM Monday-walk case arises only if the broker Friday run ends at the 19:00 close, making Monday first bar the first out-bar - V350 GLM-A6). M5 timeframe pinned (PERIOD_CURRENT walk - Sonnet timeframe note). Design pins (V349 Sonnet): the walked run includes pre-entry bars, so the target can come from a pre-entry extreme (EXIT-LONDON evidence-gap handling is one instance of this rule); below-entry extremes accepted per his literal rule with exposure bounded to near-breakeven targets (a LONG high over a run containing the entry sits at/above the entry save spread-level difference). First-out-bar rule (V347 Luna-2): the evaluation must be the first bar outside the entry-session run (barShift+1 in es) - enforced in the fence below.
```mql5-old-RHELP
  }

//--- [P-RESQUAT-1 F-a] eviction-paired suppression SET (fire-or-expire):
```
```mql5-new-RHELP
  }
//--- [P-RECON74FIX-2 v2] closed entry-session-instance extreme from price history (his RETARGET rule; instance-contained; buffer-reset immune; 600-bar walk covers intra-week closes).
bool UjClosedSessionTarget(const SManagedTrade &t, const int barShift, double &px)
   {
    px = 0.0;
    if(t.dir != DIR_LONG && t.dir != DIR_SHORT) return false;
    int es = t.sessionAtEntry;
    if(es != SESSION_LONDON && es != SESSION_NYAM) return false;
    if(t.uj_admitBarTime <= 0) return false;
     datetime bt = iTime(_Symbol, PERIOD_CURRENT, barShift);
     if(bt == 0) return false;
     if((int)CurrentTradingWindow(bt) == es) return false;
     datetime bp = iTime(_Symbol, PERIOD_CURRENT, barShift + 1);
     if(bp == 0) return false;
     if((int)CurrentTradingWindow(bp) != es) return false;  // first-out-bar pin (V347 Luna-2): barShift must be the first bar outside the entry-session run
     double ext = 0.0;
    bool have = false;
    bool uj_ended = false;
    datetime uj_newest = 0;
    datetime uj_oldest = 0;
     for(int k = barShift + 1; k < barShift + 601; k++)
       {
        datetime bk = iTime(_Symbol, PERIOD_CURRENT, k);
        if(bk == 0) break;
        if((int)CurrentTradingWindow(bk) != es)
          {
           if(have) uj_ended = true;
           break;  // contiguous-run end (V347 Luna-2): the walk starts inside an es run by the barShift+1 pin; admission containment is the separate P097 test, so any non-es bar ends the walk - fail-closed when no price seen yet
          }
       if(uj_newest == 0) { uj_newest = bk; uj_oldest = bk; }
       else uj_oldest = bk;
       double v = (t.dir == DIR_LONG) ? iHigh(_Symbol, PERIOD_CURRENT, k) : iLow(_Symbol, PERIOD_CURRENT, k);
       if(v <= 0.0) continue;
       if(!have || (t.dir == DIR_LONG && v > ext) || (t.dir == DIR_SHORT && v < ext)) { ext = v; have = true; }
      }
    if(!have || !uj_ended || ext <= 0.0) return false;
    if(t.uj_admitBarTime < uj_oldest || t.uj_admitBarTime > uj_newest) return false;
    px = ext;
    return true;
   }

//--- [P-RESQUAT-1 F-a] eviction-paired suppression SET (fire-or-expire):
```
- FIX B2 (seedbias promotion gate; 8 June class): promotion requires a non-refused seedbias verdict. Sits at the S2 promotion edge (EA-8339; single-candidate machine + IDLE-gated reseed mean the eval reads its own seed; value space -1/1/0 proven EA-1151/EA-8133).
```mql5-old-B2FULL
         if(uj_m15r && uj_m15b == uj_wantb)
           { double uj_ltfb = 0.0; int uj_ltfOk = ReadFlow(FL_BUF_LTF_BIAS, uj_ltfb, barShift) ? 1 : 0;
```
```mql5-new-B2FULL
         if(uj_m15r && uj_m15b == uj_wantb && s1g_seedBiasAl != 0)
           { double uj_ltfb = 0.0; int uj_ltfOk = ReadFlow(FL_BUF_LTF_BIAS, uj_ltfb, barShift) ? 1 : 0;
```
Plus the refused-seed kill branch (RULED kill fail-closed, V340/V341 Q2 2-0 CLEAR carried):
```mql5-new-B2KILL
         else if(uj_m15r && uj_m15b == uj_wantb)
           { if(InpDebugLog) PrintFormat("[SRJ-EA] S2SEEDBIAS_KILL bar=%s dir=%s poi=%s - seedbias refused, promotion killed (Fix B2)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr()); GoAbort(ABORT_SEEDBIAS_REFUSED, g_state); return; }
```
Sits between the promotion-block close (end of EA-8343) and the S2WAIT else (EA-8344): promote / kill / wait. New ABORT code rides the ABORT-define family (last define EA-406, insert between EA-406 and EA-407 (blank line) before the Task-160 block EA-408; quote column 32 to match the family - battery asserts):
```mql5-new-ABORT
#define ABORT_SEEDBIAS_REFUSED "SEEDBIAS_REFUSED"
```
-1 (never-seeded) passes (no seed info); 0 (REJECT) kills; V340 ruled otherwise nowhere. Post-B4 state (V349 Luna-1): setter EA-8133 runs unconditionally in the seed block (EA-8126, debug term dropped); the SIDE1T_SEEDBIAS print stays debug-gated; replay rows identical under the pinned InpDebugLog=true config and the fallback path converges to the accepted behavior (REJECT kills, -1/1 pass - narrowed scope, not lifecycle-wide, V349 Luna-2); single-candidate reseed overwrites with no per-route reset (lifecycle-bound shadows are a separate behavior round per Luna-AB; reset-at-abort/IDLE stays the named fix path demo-first per GLM-B4; 5 June London SHORT most exposed). -1 covers never-seeded AND unavailable-reads (UNREAD path at EA-8133); distinguished only at the setter, never carried (shadows-separate-round stands - V350 Luna-8).
- FIX B3 (gate-input visibility; GLM B3 adopted): every S2PROMOTE_M15 row carries its gate input (makes -1-pass cases and any future aligned-path promotion visible; proves the Luna lifecycle at grade). Modifies the EA-8343 print line only (0 net lines):
```mql5-old-B3LINE
             if(InpDebugLog) PrintFormat("[SRJ-EA] S2PROMOTE_M15 bar=%s dir=%s poi=%s sess=%s m15=%s m15src=%s ltf=%s rf=%d/%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry), DoubleToString(uj_m15b, 1), TimeToString(uj_m15src, TIME_DATE|TIME_MINUTES), UjDbl(uj_ltfb), (uj_m15r ? 1 : 0), uj_ltfOk); }
```
```mql5-new-B3LINE
             if(InpDebugLog) PrintFormat("[SRJ-EA] S2PROMOTE_M15 bar=%s dir=%s poi=%s sess=%s m15=%s m15src=%s ltf=%s sb=%d rf=%d/%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry), DoubleToString(uj_m15b, 1), TimeToString(uj_m15src, TIME_DATE|TIME_MINUTES), UjDbl(uj_ltfb), s1g_seedBiasAl, (uj_m15r ? 1 : 0), uj_ltfOk); }
```
- FIX B4 (seedbias setter un-gating; V348 Luna-2; enforcement independent of diagnostics): the EA-8133 assignment moves out of the InpDebugLog gate (EA-8126 condition drops the debug term; the SIDE1T_SEEDBIAS print goes debug-gated single-statement, zero behavior change to the print). Sits at the seed block (EA-8125-8142, block per R-SEED region span; single-candidate machine + IDLE-gated reseed; value space -1/1/0 proven EA-1151/EA-8133; CheckLtfAlign probe read-only, no writes - same call, wider gate). Behavior: replay rows identical under the pinned InpDebugLog=true config (setter ran there in both trees); production converges to the accepted behavior on the fallback path (REJECT kills, -1/1 pass). Stale-value hazard across routes stays carried (reset-at-abort/IDLE named as the fix path if the lifecycle demo shows the leak; 5 June London SHORT most exposed - Sonnet-6). Q2 regression battery: B-venue kill preserved (setter runs under acceptance config in both trees); lifecycle demo at build.
```mql5-old-B4
          if(InpDebugLog && s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0)
```
```mql5-new-B4
          if(s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0)
```
```mql5-old-B4P
            PrintFormat("[SRJ-EA] SIDE1T_SEEDBIAS bar=%s dir=%s biasAligned=%s verdict=%s",
```
```mql5-new-B4P
            if(InpDebugLog) PrintFormat("[SRJ-EA] SIDE1T_SEEDBIAS bar=%s dir=%s biasAligned=%s verdict=%s",
```
NET 0 (same-line swaps; B4 +0).
- FIX S3 (contender observability + confirm-term ruling; 11 June class): (a) print the Scomb contender evaluation (zero behavior). Sits at the Scomb site (EA-8351+; uj_sbHave/uj_sbDir/uj_sbLine/uj_sbConfC/uj_sbConfH + uj_sbTermC/uj_sbTermH shapes per the Scomb fence; DirName prints NONE for DIR_NONE per EA-1779 - GLM A16 answered on disk).
```mql5-old-S3TELEM
        double uj_sbLineVal = 0.0; if(uj_sbHave && uj_sbLine >= 0 && !ReadBuf1(g_hPoi, uj_sbLine, uj_sbLineVal, barShift)) uj_sbLineVal = 0.0;
        if(InpDebugLog) PrintFormat("[SRJ-EA] UJSBTELEM bar=%s dir=%s have=%d sbDir=%s sbLine=%d confC=%d confH=%d sbL=%s termC=%s termH=%s - contender evaluation (Fix S3)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (int)uj_sbHave, DirName(uj_sbDir), uj_sbLine, (int)uj_sbConfC, (int)uj_sbConfH, DoubleToString(uj_sbLineVal, _Digits), uj_sbTermC, uj_sbTermH);
```
(Specifiers 10 = arguments 10; EA-true 9sp site indent.)
```mql5-new-S3TELEM
        double uj_sbLineVal = 0.0; if(uj_sbHave && uj_sbLine >= 0 && !ReadBuf1(g_hPoi, uj_sbLine, uj_sbLineVal, barShift)) uj_sbLineVal = 0.0;
        double uj_sbo1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc0 = iClose(_Symbol, PERIOD_CURRENT, barShift); int uj_sbarm = 1;
        if(InpDebugLog) PrintFormat("[SRJ-EA] UJSBTELEM bar=%s dir=%s have=%d sbDir=%s sbLine=%d confC=%d confH=%d sbL=%s o1=%s c1=%s c0=%s arm=%d termC=%s termH=%s - contender evaluation (Fix S3)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (int)uj_sbHave, DirName(uj_sbDir), uj_sbLine, (int)uj_sbConfC, (int)uj_sbConfH, DoubleToString(uj_sbLineVal, _Digits), DoubleToString(uj_sbo1, _Digits), DoubleToString(uj_sbc1, _Digits), DoubleToString(uj_sbc0, _Digits), uj_sbarm, uj_sbTermC, uj_sbTermH);
```
(Specifiers 14 = arguments 14; arm=1 always at the contender site under the substitute; A-6 closed.)
Sits inside the S3/S4-held Scomb block after the confirm pair is computed (EA-8360/8361), before the transfer if (EA-8362). Specifiers 10 = arguments 10. (b) The 14:35 confirm-term calibration rides v2-with-telemetry (V340 ruled branch): the v2 build carries the instrument; the term is ruled from UJSBTELEM rows (sbL answers the A2_CLOSE_BREAK question alone). Luna exact one-liner parked as labeled prior (filed V340-UJFIX2-1 Luna:13787-13792, region 13720-13836), never adopted: relay carries the filed cite. EU proof obligation: IsConfirmationCandle is shared with the EU entry pipeline - no term change adopts without bar-for-bar EU Rule-vs-takes vs register A1-7. EU sibling check replays exits plus later admissions bar-for-bar (FIX R shares the managed-exit path; an earlier EU exit can free the slot and move later admissions) (Sonnet-12).
- Settled-rules audit (strategy skill SETTLED-RULES pin): R + RHELP touch managed exits only (S5 election untouched; pre-confirmation promotion gated by B2 by design under his entry-side scope word (relay section 0); helper site-enumerated: defined once after EA-1887, called once at the EA-11829 call site; S5.4 grades exits, still applicable); B2/B3 kill and print pre-confirmation promotion only (S5.4/S3.3 run downstream/elsewhere; S3 block, S4 edge, S5 election untouched); S3 prints only (zero behavior). Exit-to-admission coupling stated: a revised EU exit can free the trade slot and move later admissions; EU grade replays both (Sonnet-13). B4 scope (V349 GLM-A3): S1 seed block only (setter carriage EA-8133; CheckLtfAlign read-only proved EA-2371-2377 with no globals and no counters; EA-10357 consumer print-only SIDE1R_RGATE row (10357 read site; 10362-72 print span); fallback-path convergence only; no S3/S4/S5 touch. Refinement phase: narrow edits to the named paths only.
- Fold budget (script-counted from the fenced blocks at fold battery, same convention NET per site = new-site lines minus retained-context lines): R call +13 (insert; v5 P042/P048 NormalizeDouble equality, UJNORETARGET 8=8 kept, UJRETARGET 7=7, spec census UJSBTELEM 10=10, S2SEEDBIAS_KILL 3=3) / RHELP +39 (insert: helper comment + 38 code lines) / B2 +3 (condition 0 + kill branch 2 + ABORT define 1) / B3 +0 (line mod) / S3 +2 (decl + print) / B4 +0 (same-line swaps). Total NET +57 vs v26 12202; final tree 12259. S3 recount governs at build.

## Edit set (FIX-2v12: op-reseed + holder-expiry + term calibration + t78 telemetry; STAGE-1 exact-diffs each; old blocks mechanical-spliced at build battery; base = v27 tree 21501194/681197/12259)

- FIX H1 (op-reseed in S1; R75-1 class): when S1 holds UNCONFIRMED (!t78_heldConf) and an opposite-direction retest prints on the evaluated bar with op unconfirmed (!t78_opConf), seed it immediately (overwrite holder; normal confirm path evaluates next bar). Sits in the t78 S1 clause (EA-7868-7873); SessionAlreadyUsed gates admission downstream (same-session reseed allowed until a take - potential, never a second take); site-based safety (no RESEED_BLOCKED row can appear: the H1 site never passes the R-SEEDBR gate - the resquat invariant carries a t78-site exception by design, stated plainly; the withdrawn bit-difference claim was false on rows NN + P032, GLM A-7); seedbias evaluated at reseed (CheckLtfAlign mirror) so B2 reads the op verdict, never stale; B2 kill stands on sb=0 (rule-wins: reseed never overrides the kill - D5); tier bypass stated-as-intended (WOULDPREEMPT unconsulted - D8); no per-session cap this round (churn bounded by SessionAlreadyUsed + H2 expiry; cap parked with cause - D7); confirm-once/post-entry/booking pins (his settled rules ride this path): one confirmation bar suffices with entry at the next open and later bars never re-litigate - the reseeded candidate confirms once on the post-reseed path; selection ends at entry (post-entry bars never judge selection); booking runs only after election (BOOKING-INNOCENT - target rules never cause a selection miss).
```mql5-old-H1
          if(g_state == ST_S1_REGIME && t78_opp)
            {
             string t78_failOp = "", t78_failHeld = "";
             t78_opConf = IsConfirmationCandle(barShift, t78_pr.topLine, t78_dir, t78_failOp);
             t78_heldConf = IsConfirmationCandle(barShift, g_anchorLine, g_dir, t78_failHeld);
            }
```
```mql5-new-H1
          if(g_state == ST_S1_REGIME && t78_opp)
            {
             string t78_failOp = "", t78_failHeld = "";
             t78_opConf = IsConfirmationCandle(barShift, t78_pr.topLine, t78_dir, t78_failOp);
             t78_heldConf = IsConfirmationCandle(barShift, g_anchorLine, g_dir, t78_failHeld);
             if(InpDebugLog) PrintFormat("[SRJ-EA] UJOPCONF bar=%s poi=%s dir=%s opConf=%d heldConf=%d opTerm=%s heldTerm=%s - displace-gate inputs (Fix H1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[t78_pr.topLine], DirName(t78_dir), (int)t78_opConf, (int)t78_heldConf, t78_failOp, t78_failHeld);
              if(!t78_opConf && !t78_heldConf && !SessionAlreadyUsed(sess, barTime) && (t78_pr.topLine != g_anchorLine || t78_dir != g_dir))
                {
                 bool t78_al = false; bool t78_alOk = CheckLtfAlign(barShift, t78_dir, t78_al);
                 if(InpDebugLog) PrintFormat("[SRJ-EA] UJRESEED bar=%s poi=%s dir=%s fromPoi=%s fromDir=%s al=%d ok=%d - op-retest reseeded over unconfirmed holder (Fix H1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[t78_pr.topLine], DirName(t78_dir), g_lineCode[g_anchorLine], DirName(g_dir), (t78_alOk ? (t78_al ? 1 : 0) : -1), (int)t78_alOk);
                 s1g_legDir = t78_pr.isLong ? 1 : -1;
                 s1g_seedBiasAl = (!t78_alOk ? -1 : (t78_al ? 1 : 0));
                 g_anchorLine = t78_pr.topLine;
                 ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
                 g_anchorBarTime = barTime;
                 g_dir = S2ResolveLive(t78_pr.isLong ? DIR_LONG : DIR_SHORT);
                 g_sessionAtEntry = sess;
                 g_zoneHi = 0.0;
                 g_zoneLo = 0.0;
                 g_touchSeen = false;
                 g_touchBarHi = 0.0;
                 g_touchBarLo = 0.0;
                 g_latchedEntry = 0.0;
                 g_latchedSl = 0.0;
                 g_latchedTp = 0.0;
                 g_latchedR = 0.0;
                 g_latchBarTime = 0;
                 g_confirmFromState = ST_IDLE;
                 uj_memo_valid = false;
                }
             }
```
(sess/barTime in scope per t78-region usage; S2ResolveLive contract pinned pass-through (EA-4250 returns legDir - P188 equivalent to sibling EA-7881/EA-8104); s1c_fromLine/s1c_fromDir WITHDRAWN from H1 (declared EA-7876/7877 in the sibling transfer block opening EA-7874 - out of scope at the H1 site closing EA-7873; the D1 compile blocker); s1f_seedArmed NOT set in H1 (local declared EA-8040, after the H1 site - out of scope; observability rides the UJRESEED al/ok fields instead - GLM B-4 declined with scope proof under council s38 SCOPE-AT-USE); overwrite set widened to the transfer mirror (B-3).)
- FIX H2 (holder expiry; R75-1 backstop): unconfirmed S1 holder expires after 3600 elapsed seconds (about 12 M5 bars on a continuous feed; session/data gaps stretch the bar count - elapsed-time contract, not a bar count) with no confirmation, via new abort code WITHOUT eviction marking (expiry is not eviction - reseed stays allowed; mechanism: R-ABORT comment EA-403/404 "no gate reads an abort reason" + R75-2 rows FI-kill/OM-proceed prove aborts do not auto-mark). Sits in the S1-wait block (EA-8356-8357); under the next-bar confirm cadence the candidate sees 11 confirm evaluations (T+5..T+55); ABORT row timestamps read as pass time (CS 12:05 pass vs 12:00 barTime). POI-break/structure-flip invalidation parked as named extension (helper-pin requirement stated, his SESSION-BOUNDARY words cited).
```mql5-old-H2
     if(g_state == ST_S1_REGIME)
     {
```
```mql5-new-H2
     if(g_state == ST_S1_REGIME)
     {
      if((barTime - g_anchorBarTime) >= 3600 && g_anchorLine >= 0)
        {
         if(InpDebugLog) PrintFormat("[SRJ-EA] UJHOLDEXPIRE bar=%s poi=%s dir=%s heldMin=%d - unconfirmed holder expired, no eviction (Fix H2)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), AnchorStr(), DirName(g_dir), (int)((barTime - g_anchorBarTime) / 60));
         GoAbort(ABORT_HOLDER_EXPIRED, g_state); return;
        }
```
```mql5-new-ABORT2
#define ABORT_HOLDER_EXPIRED   "HOLDER_EXPIRED"
```
(Rides the ABORT-define family per R-ABORT region; quote column 32 - battery executes the lint (ASSERT-EXECUTION). Siting corrected: insert after EA-407 (SEEDBIAS_REFUSED at 407, Sonnet-D4), before the blank line.)
- FIX H3 (11 June term calibration; R75-4 class): contender LONG refused with A2_CLOSE_BREAK (sbL 160.523) against his SAME-CANDLE/VENUE words. RECOMMENDED Alt-A (reclaim-aware A2); Alt-B = keep A2 (zero diff, miss stands as detector-grade). Council rules. EU battery: RECON62 zero-delta re-proof (REFINE-ONLY anchor) + EU takes preserved, or contender-scoped siting if council prefers.
```mql5-old-H3
    bool closeSideOk = (dir == DIR_LONG) ? (c1 >= L) : (c1 <= L);
    if(!closeSideOk) { failTerm = "A2_CLOSE_BREAK"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
```
```mql5-new-H3
    bool closeSideOk = (dir == DIR_LONG) ? (c1 >= L || (allowReclaim && o1 <= L && c0 >= o1)) : (c1 <= L || (allowReclaim && o1 >= L && c0 <= o1));
    if(!closeSideOk) { failTerm = "A2_CLOSE_BREAK"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
```
(Contender-scoped substitute, GLM B-2: default-off param; 13 existing callers default-strict, EU structural zero-delta; Alt-A global retired, Alt-B keep retired by adoption.)
```mql5-old-SIG
bool IsConfirmationCandle(const int barShift, const int anchorLine,
                          const ENUM_SRJ_DIR dir, string &failTerm)
```
```mql5-new-SIG
 bool IsConfirmationCandle(const int barShift, const int anchorLine,
                           const ENUM_SRJ_DIR dir, string &failTerm, const bool allowReclaim = false)
```
```mql5-old-CALL
       bool uj_sbConfC = (uj_sbHave && (uj_sbDir != g_dir)) ? IsConfirmationCandle(barShift, uj_sbLine, uj_sbDir, uj_sbTermC) : false;
```
```mql5-new-CALL
        bool uj_sbConfC = (uj_sbHave && (uj_sbDir != g_dir)) ? IsConfirmationCandle(barShift, uj_sbLine, uj_sbDir, uj_sbTermC, true) : false;
```
(Alt-A reads: prior-open at/below the line (retest side) plus evaluated close holding above prior open (no close back over) - his "open side plus next close holding" words; RECOMMENDED, council may substitute.)
- FIX H4 (t78 conf-pair telemetry; future-grade audit): print opConf/heldConf + fail terms at the S1 displace site (print-only, zero behavior).
```mql5-old-H4
             t78_heldConf = IsConfirmationCandle(barShift, g_anchorLine, g_dir, t78_failHeld);
```
```mql5-new-H4
RETIRED in v13 (folded into new-H1 as the UJOPCONF print at the P178/P179 seam; single H1 splice only - splice order pinned; G3 closed).
```

## Acceptance (FIX-2v11 round - graded by RECON75 ledger 1007; retained as history)

- R-venue (5 June NY LONG): UJRETARGET row at the 19:00 session-close pass (tpRef revised 160.723 toward the closed NY high 160.262, old/sess fields on the row); exit branches grade-read: (i) touch of 160.262 on that bar or any later bar proves the fix end to end (touch-fill or the subsequent exit row carrying the revised reference); (ii) no touch through 6/8 00:50 proves the revision only (UJRETARGET row + tpRef-carry rows) with the Monday 00:50 BREAK exit identical to R01 (revision-only proof; "divergence finding" retired as imprecise - V347 Sonnet-D7). Session-close retarget (Sonnet Q1-8 wording adopted; "day-exit reconciliation" retired as overbroad, Luna-A4): his "day exit" is the Friday close region the unfixed tree floated past (held to Monday 00:50 POI_BODY_BREAK vDAY=0); branch (i) exits at the touched session high, branch (ii) floats to the Monday 00:50 break exactly as R01 because Fix R implements no Friday exit (Sonnet-7); no post-revision eq row can recur given one evaluation per closed bar (single fire per instance under the first-out-bar pin; sole call EA-12191 - V349 Sonnet); tpRef-carry evidence is the tpB= field on EXITVERDICT rows, and an eq row with no prior UJRETARGET in the instance is coincidence, not revision proof (V346 Sonnet-6; V348 Sonnet-3); grade matches on the bar= field (first out-of-session bar opens 19:00, evaluated about 19:05 tick time; R03 shape, V346 Sonnet-5); the grade joins UJRETARGET to UJADMIT for retarget distance because P046 carries no entry (Sonnet-9). Join scoped to the future run (the RECON74 segment rows carry no R-venue UJADMIT row - V347 Sonnet-D9).
- B-venue (8 June London SHORT): NO S2PROMOTE at the 09:25 pass (S2SEEDBIAS_KILL row instead, seedbias REJECT on record, every S2PROMOTE_M15 row carries sb=, and none carries sb=0); run-wide admissions == {6/3, 6/5 x2} + 6/11 absent (see S-venue); EU takes identical (register A1-7 structural fence); 09:25-11:50 freed-machine window: any admission there grades as a UJ-EXTRA candidate against the register and takes sheet, not an automatic failure (V345 Sonnet-4, round-tagged - V347 GLM-D4).
- S-venue (11 June NY LONG): UJSBTELEM rows at S3/S4 passes (Have/ConfC/ConfH + sbL + terms, exposing the 14:35 refusal term); 6/11 YIELD/entry absence at 14:40 is EXPECTED until the term fix (carve-out: UJ-NOEVID mis-fire guard); term ruled post-run from the rows per the pre-ruled tree (A2_CLOSE_BREAK: sbL vs 14:30 close; A_OPP: wrong-direction candle-1 (c1-vs-o1) or flat/doji candle-1 with the doji test on candle-0 under B_BODY (R09 co-occurrence noted - V350 GLM-A5); C_TOUCH: Luna candidate); have=0 grades as detector finding, never term finding (A12); read have/sbDir/confC first because empty termC is not a pass (failTerm="" on success and on entry, termC unwritten when unevaluated, Sonnet-8).
- Findings map: missing row UJ-NOEVID (predicate named, 6/11 carve-out above); wrong-bar UJ-SIGNALBAR; extra-venue UJ-EXTRA; failed-retarget finding RETARGET-ABSENT (no UJRETARGET row at the first close of the trade entry session while floating with a strictly tighter closed in-direction extreme; name retired from UJ-NORETARGET - collides with the emitted UJNORETARGET tag by one hyphen - V347 Luna-4); absence of a qualifying extreme vs missing history indistinguishable (honestly-disclosed gap - V350 Luna-9); refused promotion taken UJ-BIASDEFY (S2PROMOTE_M15 row with sb=0, greppable via P128, on a seedbias-REJECT bar on the m15-fallback path; aligned path logs STATE rows, invisible to this predicate - stated); second-retarget UJ-RERETARGET (more than one UJRETARGET row per trade instance - pre-ruled divergence finding; only the first-out-bar pass can fire, so the predicate is unreachable-by-construction and expects zero rows - V348 Sonnet-3); off-venue kill UJ-KILLEXTRA (S2SEEDBIAS_KILL row at any bar other than 8 June 09:25; expected 1 run-wide as the stale-leak observable; lifecycle demo gates it - V350 Sonnet); S4 edge + C-silence + DUPADMIT carried. Trades with no booked TP get no retarget and no row under the P038 guard; RETARGET-ABSENT does not apply to them (Sonnet-8). Loose-echo counting and tag-anchoring: UJSBTELEM print at P147 with the adopted-code disposition at P162 (V349 GLM-A4/Sonnet-4). sb=0 kills on the m15-fallback path only; later aligned-path promotions are ungated by design (fallback-scoped kill); UJ-BIASDEFY stays fallback-scoped to match, fences untouched (Sonnet-10). A row with sb=0 signals a gate bug (V349 Sonnet). tpB-carry on verdict rows (revised 160.262 vs R03-family 160.723) grades as expected-benign UJ-CARRY class, never divergence (GLM-A2).

## Acceptance (FIX-2v13 validation on a future UJ 6/1-6/13 run with InpDebugLog=true pinned under the same replay configuration as RECON75; STAGE-1 exact-diffs the edit, S3 recounts the surface, and a fail-closed outcome is a failed proof unless its finding predicate fires)

- H1a (5 June London SHORT, entry owed 09:45 open 159.948): exactly one UJRESEED row at the first opposite-retest pass (Daily-POC/SHORT over the unconfirmed LONG holder; al/ok fields carry the fresh bias verdict; evidence reads RETESTBOOK + UJRESEED, never SIDE1T_SEEDBIAS - H1 never sets s1f_seedArmed, A-1) + 09:45 UJADMIT entry 159.948 (conditional on sb=1 at the reseed bar; rule-wins: B2 kill stands on sb=0 and the miss grades as detector-grade finding, council rules next - D5); fallback branch: refusal + expiry/session-close rows grade as detector-grade finding with the refusing term named. No RESEED_BLOCKED row can appear for any triple (site-based safety: the H1 site never passes the R-SEEDBR gate - A-7). Grade keys on first-reseed-bar, never a fixed 09:40 pass (D6); entry may complete earlier than 09:45 under the carried confirm path.
- H1-expiry: expect zero UJHOLDEXPIRE rows this window (reseed carries 6/5; no other zombie exceeds 12 bars); grade proves the zero by two differently-formed patterns before ruling it.
- H3 (11 June NY LONG, entry owed 14:40 open 160.524): scoped arm at the contender call only (EA-8402 true; 13 other callers strict); 14:40 UJADMIT with UJSBTELEM rows (o1/c0/c1/arm pin the arm per bar) showing non-A2_CLOSE_BREAK confirmation on the 14:35 re-evaluation; refusal grades as detector-grade finding with the refusing arm named (strict vs reclaim attributable per row - A-6). Row GD carries sbL=160.523 only and proves no bar admission by itself (D11); the run decides. EU structural zero-delta (all EU callers default-strict); RECON62 battery re-proves at build.
- Preserved: R-venue 19:00 fire at the walked session max (C1 proved-max semantics, never pool-time values); B-venue 09:25 kill with sb=0 row; 6/3 take identical; 8-June silent; 6/5-NY late path preserved (16:00 kill + 16:55 admit mapped; H1 cannot advance the NY path - machine IDLE post-16:00-kill with hits=0 16:05-16:40, A-14; "or-better" withdrawn); 5 June London fire conditional on pre-admission 09:00-09:40 lows (stated gap, A-11); EU structural fence (no August run; RECON62 zero-delta re-proof at build; substitute keeps EU callers byte-behavioral).
- Rule-vs-takes: no valid take moves except the owed ones (6/5 London SHORT in, 11 June LONG in on Alt-A). Q2 battery: lifecycle demo rows (B-venue kill + KILLEXTRA count + aligned-path promotion count) + debug-off replay (owed word + scope, carried build-gate, never this round).

## Fold map (V342 verdict dispositions; every demand adopted, parked, or refuted with anchor or reason)

- Adopted as code: uj_ended truncation guard (Sonnet Defect-1 exact text, credit Sonnet; GLM D1 converges on the class); UJNORETARGET diagnostic print (GLM B-offer; helper-true-not-tighter only; containment-blocked and truncation-blocked reads produce no row because the helper returns false - stated precisely, Luna-A3; fields why+sess+seq+admit self-identify the equal case and the instance (v9 instance keys). Single-fire per instance given one evaluation per closed bar (sole call EA-12191), so echoes cannot recur; grade reads each row once (V348 Sonnet-3; V349 Sonnet); RETARGET-ABSENT keys on UJRETARGET absence, never row multiplicity (V345 GLM-3). Grade greps anchor on the bracketed [SRJ-EA] tag form because the retired UJ-NORETARGET finding-name vs the UJNORETARGET tag differ by one hyphen (V345 GLM-4, V347 Luna-4)).
- Adopted as prose: admitBarTime pins (decl EA-264, set EA-10647, resets EA-374/10582 - pre-existence holds, PIN-A3 chain stands; "P005/P132" retired as a wrong cross-ref, Sonnet-3); Task-160 label fix (EA-1889 is P-RESQUAT); 600-bar arithmetic + M5 pin; window-signature pin EA-1865; joint one-shot wording (Luna A1); Q2 wording note (S2PROMOTE_M15-specific already on page - answered); Luna fail-closed-vs-unavailable distinction documented in B2 prose; A7 sentinel documented; branch-(ii) already plain (A6 answered); second-UJRETARGET (UJ-RERETARGET predicate adopted below - divergence pre-ruled).
- Parked with cause: latch-bool (needs new carriage + his word); B2 drift-guard hoist (Q2 fence clear - rides a future touch); buffer route (affirmed parked); sbRead + c1-fields (GLM sufficiency: sbL plus bar data decide; ride only if grade fails to decide); A10 fire ordinal (containment removes the ratchet class); transition-bar alternative (fragile on skipped passes, self-heal preferred).
- Refuted/declined with cause: profit-side floor (Sonnet Q1-2/GLM B3 - his literal words govern, NO-OVERFIT, canon-order); broad C_TOUCH adoption (GLM exclusion set + Sonnet inference agree it cannot be the 14:35 fix); touchAttr-definition pin (stands open, telemetry decides).
- Retired FIX-2 v2 defects (owned, never shipped): none new this fold - v2v2 never transported (superseded pre-transport); carried standing: D4 blank fence, v1-frame retags, splice-repair discipline, Contains-last-match + comma-flatten saves.

## V343 fold delta (v4; ledger 989 Q1 2-0 CLEAR with field/pin actions; P-numbers below are v4 twin lines; lines 1-149 numbering unchanged from v3)

- MOD-R48 - GLM-B2 plus GLM-A7 plus Sonnet-3, diagnostic-only, booking-neutral: v3 line-48 UJNORETARGET gains why=%s (eq when uj_rtPx == tpRef else loose) plus sess=%d (g_mtrade.sessionAtEntry, same source as UJRETARGET at P046; zero behavior change); specifiers 6 = arguments 6; indent and brace structure unchanged; the equal-case echo now self-identifies so the grade counts conditions, not rows. Old-fence = v26 EA-11826-11842, same as v3 old-R; new shape = v4 R fence P037-P049.
- PROSE-L005 - GLM-A1: "three new prints" retired by "four new prints (UJRETARGET/UJNORETARGET/UJSBTELEM/S2SEEDBIAS_KILL)"; fence blocks P101-P126 byte-unchanged, no re-rule.
- PROSE-L054 - Sonnet-2 plus GLM-A6: Task-160 label retired by P-RESQUAT label, matches P058 anchor plus P146; walk arithmetic retired by GLM replay numbers (intra-week 40-250, Fri-Mon 130-350, cap binds past a 2-trading-day evaluation gap).
- PIN-A3 - GLM-A3/B4 plus Sonnet-7, prose only: uj_admitBarTime is bar-OPEN time - EA-264 datetime member, EA-10647 assigns the EvaluateClosedBar barTime param at EA-6890, sole call at EA-12191 passes EA-12181 currentBarTime = iTime bar-open. P094 upper bound safe on disk; code alternative parked.
- NOTE-S4 - Sonnet-4, accepted edge, prose only: have conflates run-entered with price-seen; unreachable on disk because a valid iTime implies a valid OHLC; no code change.
- NOTE-S5 - Sonnet-5, accepted edge plus grade predicate, prose only: containment tests the admission bar, not the entry bar; a wrong-side revised TP grades as accepted-edge finding under MANAGE-NEAREST, never a defect.
- NOTE-S6 - Sonnet-6, prose only: uj_ended proves the run's older (opening) edge was reached; internal data holes stay undetectable, same class as Luna-A2, stated.
- NOTE-A4 - GLM-A4, prose only: revision needs the single first-out-bar pass under the v8 pin (pre-fix window [entry-session close, next same-type session start) retired); a skipped pass, restart, or catch-up pass forfeits silently. Replay-safe with 2880 bars proven.
- LUNA-A1/A4 - relay-side, v344: "truncation-closed" retired by "truncation-guarded (boundary only; internal gaps undetectable)"; "day-exit reconciliation" retired by "session-close retarget".
- LUNA-A3 - packet L145 reworded in place; v344 Q1 tail carries the precise scope.
- Budget recount (mechanical, NET per site = new minus retained-context): R +13 / RHELP +36 / B2 +3 / B3 +0 / S3 +2. Total NET +54 vs v26 12202; final tree 12256. Unchanged from v3 because the P048 edit is same-line and prose edits are same-line.

## V344 fold delta (v5; ledger 991 Q1 2-0 CLEAR with tolerance + disposition actions; P-numbers below are v5 twin lines; lines 1-164 numbering unchanged from v4)

- MOD-TOL - Luna-A1 plus Sonnet-4 plus Sonnet-B, first-fire edge only: P042 strict compare and P048 why ternary compare NormalizeDouble both sides at _Digits (decimal quantization/rounding to _Digits; raw-equality artifacts at displayed precision suppressed); same lines, no arg change, spec counts kept (UJNORETARGET 6=6); P048 indent normalized 10sp to 7sp to match its P041 if (GLM-2, carried indent retired) plus trailing helper-true-discriminator comment (GLM-8). Old-fence = v26 EA-11826-11842, same as v4 old-R; new shape = v5 R fence P037-P049. Once-only untouched because post-revision tpRef is bit-identical to rt on all seats' reads, identical-by-assignment at P045 per GLM-A6. Rule-vs-takes: R-venue revision spans 461 points (160.723 to 160.262, far above any ulp band); B-venue and S-venue run no retarget path; EU entry and selection untouched; no valid take moves.
- ROWS-SOURCE - Sonnet-2 plus GLM-1: canonical chain "v342 via v343" because the bytes agree either way; v345 Rows heading carries the chain so audits single-count.
- CITE-P153 - Sonnet-1: old-R fence precision - the 3-line fence is EA-11829-11831 while EA-11826-11842 names the whole (b) TP block region; the (b) TP comment now heads the retarget insert, cosmetic, stated.
- PIN-ENUM - Luna-A5 plus Sonnet-5: session map pinned once - SESSION_NONE=0, SESSION_LONDON=1, SESSION_NYAM=2 at EA-228; sess is constant per trade while instance mapping rides UJADMIT trade_seq at R13 plus timestamps, per the UJ-RERETARGET predicate; R13 reads as format exemplar only and mapping keys on admit_bar timestamps (Sonnet-2).
- PIN-ET - GLM-5: ET/server offset pinned once - session map quoted in ET, journal and acceptance times server; offset +7 derived on-page (London end 12:00 server per P026 12:05 SESSION_CLOSED, NYAM runs 14:00-19:00 server); corrected: 19:00 server close = 12:00 ET NYAM end with the window quoted from EA-1873-1876 (London 02:00-05:00 ET, NYAM 07:00-12:00 ET); the 14:00-ET text retired as a server-start mislabeled end (GLM-A1, Sonnet-1).
- MARK-T160 - GLM-7: Task-160 retirement marked carried/re-pinned (v3 packet disposition plus P155 PROSE-L054, reconciled by P146).
- COORD - GLM-9: EA anchors name v26 pre-insert coordinates (the EA-11829 caller names the anchor region, not the post-insert call line).
- PARKED with cause: Sonnet-B live-flip refusal (seat-parked for a future touch, no re-rule); GLM-B bound/seq hardening plus P045 normalize-assign (optional, needs its own round); single-writer latch (GLM-10 plus Luna-A2, UJ-RERETARGET backstop stands); Luna-A3/A4 acknowledged limits ride as stated; GLM-6 ABORT (battery 31=31 stands).
- Budget recount (mechanical): R +13 / RHELP +36 / B2 +3 / B3 +0 / S3 +2. Total NET +54 vs v26 12202; final tree 12256. Unchanged from v4 because the quantization edit is same-line and prose edits are same-line.

## V345 fold delta (v6; ledger 993 Q1 2-0 CLEAR with disposition actions; prose-only, no fence change; P-numbers below are v6 twin lines; lines 1-176 numbering unchanged from v5)

- PIN-ET-HOUR - GLM-A1 plus Sonnet-1, corrected: session map quoted from EA-1873-1876 (London 02:00-05:00 ET, NYAM 07:00-12:00 ET, server-converted); offset +7 derived on-page (London end 12:00 server per P026 12:05 SESSION_CLOSED; NYAM runs 14:00-19:00 server); 19:00 server close = 12:00 ET NYAM end; the v5 14:00-ET text retired as a server-start mislabeled end; +7 scoped to the June replay configuration (Luna-A1).
- WORD-TOL - Luna-A1 plus Luna-A2: "tolerance" retired by decimal quantization/rounding to _Digits (no epsilon band, no ulp promise); "bit-exact ulp fires retired" retired by raw floating-point equality artifacts at the displayed precision are suppressed (rounding-boundary crossers still normalize differently).
- EXEMPLAR - Sonnet-2: R13 as format exemplar only (B-venue admit removed by B2; no R-venue UJADMIT row exists); instance mapping keys on admit_bar timestamps.
- SCOPE-SENT - Sonnet-3: entry-session-type narrowing disclosed at P009/section 0 scope (builder prose call, P054 already implements it, no scope change proposed).
- FREED-WINDOW - Sonnet-4: 09:25-11:50 freed-machine window admissions grade as UJ-EXTRA candidates vs register and takes sheet, not automatic failure.
- BARFIELD - Sonnet-5: grade matches on the bar= field (about 19:05 tick evaluation of the 19:00-open bar); tpRef-carry evidence is the tpB= field on EXITVERDICT rows (R03 shape).
- REWORD-P054 - Sonnet-6: "zero struct change is retired" retired by no struct change with uj_admitBarTime pre-existing at EA-264. A7 variance acceptance lives here: REWORD-P054 disposition string vs P054 live text accepted as variance (V346 GLM-A7).
- ZERO-ROWS - Sonnet-7: one revision per trade expected, so UJ-RERETARGET expects zero rows; per-session mapping step vacuous, stated once.
- TERMC - Sonnet-8: read have/sbDir/confC first because empty termC is not a pass (failTerm="" on success and on entry, termC unwritten when unevaluated).
- NEAR-ENTRY - Sonnet-9: grade joins UJRETARGET to UJADMIT for retarget distance because P046 carries no entry (near-extreme entries retarget near breakeven under his literal rule).
- B2-INTENT - Sonnet-10: sb=0 kills on the m15-fallback path only by design (fallback-scoped kill); later aligned-path promotions ungated; UJ-BIASDEFY stays fallback-scoped to match, fences untouched, no re-rule.
- SESS-SENT - Luna-A5 plus Sonnet-5: why self-identifies; sess constant per trade; instance mapping via admit_bar timestamps per the UJ-RERETARGET predicate.
- PARKED with cause: Sonnet-B normalize-at-assignment plus aligned-print (explicitly future, not this packet); latch/edge capture (P147); GLM-B P045 normalize-assign plus bound/seq hardening (optional, needs its own round); single-key hardening (Luna-B future); Luna-A3/A4 acknowledged limits ride as stated; GLM-A2/A3/A4 no-action.
- Budget recount (mechanical): R +13 / RHELP +36 / B2 +3 / B3 +0 / S3 +2. Total NET +54 vs v26 12202; final tree 12256. Unchanged from v5 because v6 is prose-only.

## V346 fold delta (v7; ledger 995 Q1 2-0 CLEAR with disposition actions; prose + audit-side, zero fence change; P-numbers below are v7 twin lines; lines 1-193 numbering unchanged from v6)

- MANIFEST - GLM-A1: in-place touched lines vs v6 packet (9580C192/32921/199) are exactly 1, 3, 9, 132, 133, 138, 139, 141, 167, 175, 179; all other lines 1-193 byte-identical to v6; appended section lines 194-206 carry the new dispositions.
- EXIT-LONDON - Sonnet-11: 3 June London LONG entry 09:10 159.929 TP_TOUCH exit bar 09:55 at 159.983 (MTLIFE closeBar 09:55) - before the 12:00 server London close with no session close crossed, FIX R cannot touch it. 5 June London SHORT entry 09:45 159.948 TP_TOUCH exit bar 12:15 at 159.900 - floated past the 12:00 close; session min over all journal-proven wick-low bars 09:45-12:00 = 159.908 > booked 159.900, so the London-close retarget fires by rule (TP 159.900 toward about 159.908, exit earlier than 12:15); pre-admission 09:00-09:40 wick lows unproven from journal rows, stated as evidence gap; grade expects the revised exit and treats a missing London-close UJRETARGET row as a no-fire finding. Fire claim conditional on the pre-admission 09:00-09:40 lows (stated gap); "earlier than 12:15" reads "at or before 12:15" (strictly earlier only with a 12:00-12:10 low at 159.908) - V347 Sonnet-D8.
- EU-OBL - Sonnet-12 plus Sonnet-13: EU sibling check replays exits plus later admissions bar-for-bar (in L132 tail); exit-to-admission coupling stated in the settled-rules audit (in L133 tail).
- A1-WORD - Luna-A1: +7 scoped to the June replay configuration (in PIN-ET-HOUR tail).
- A2-BAR - Luna-A2: 19:00-open-bar terminology already precise in P138, verified, no edit.
- A5-TAG - GLM-A5: P009/P010/P011 carry the normalized-rendering tag (in Authority head note).
- A6-EXACT - GLM-A6: MOD-TOL tail reads identical-by-assignment at P045, in MOD-TOL tail.
- A7-VAR - GLM-A7: REWORD-P054 disposition string vs P054 live text accepted as variance (in REWORD-P054 tail).
- PARKED-REST - V345 Sonnet-B plus V345 GLM-B plus V345 Luna-B plus V345 Luna-A3/A4 plus V345 GLM-A2/A3/A4 (labels as filed at V345 P191; adopted V346 items of the same names live at P138 Luna-A4 day-exit wording, P141 GLM-A2 UJ-CARRY tail, v347-relay section-0 GLM-A3 R-SESS span - never parked): normalize-at-assignment, aligned-print, P045 wrap, bound/seq hardening, single-key hardening, acknowledged limits - all parked with prior causes, no new round opened.
- Budget recount (mechanical): R +13 / RHELP +36 / B2 +3 / B3 +0 / S3 +2. Total NET +54 vs v26 12202; final tree 12256. Unchanged from v6 because v7 is prose-only.

## V347 fold delta (v8; ledger 997 Q1 0-2 OBJECT with dispositions; helper-boundary fence fix + audit-map close; P-numbers below are v8 twin lines; lines 1-209 carried from v7 - 1-72 identical numbering, 76-209 equal v7 73-206 with +3 shift modulo the enumerated edits)

- MANIFEST-8 - V347 GLM-B1 per-line map: fence old L62-99 to new L62-102 (+3: new L73-75 bp first-out-bar pins; L81 loop start barShift+1 bound +601; L87-88 contiguous-run-end rework; all other fence lines byte-carried); in-place prose 1 (title), 3 (status), 54 (first-out-bar rule), 118 (EA-406/407 siting), 122 (debug-gated setter pin), 136 (S5-election scope), 137 (budget +57/12259), 141 (branch-ii revision-only), 142 (6/11 absent + V345 Sonnet-4 tag), 144 (RETARGET-ABSENT rename + P145 ref + join scope), 148 (finding-name + V345 GLM-3/4 tags), 188 (A7 tail), 197 (1-193 header), 200 (EXIT-LONDON conditions), 207 (V345 PARKED-REST prefixes); appended section lines 210-220 carry the dispositions at 212-219 (210-211 heading/blank, 220 separator blank).
- BOUNDARY-FIX - V347 Luna-2 plus Analytic B, fence change: evaluation pinned to the first bar outside the entry-session run (new L73-75 barShift+1-in-es guards), walk confined to the contiguous es run (L85-89 break on first non-es; non-es `continue` retired, price-guard `continue` retained - V348 Sonnet-5); late-close reuse of an older instance is unreachable by construction; once-only preserved (caller tighter-check) and fail-closed preserved (no price or no older edge returns false); comment tag [P-RECON74FIX-2 v2] frozen per cosmetic note.
- SCOPE-TRUE - V347 Luna-1: relay Q1 change-sentence and P136 audit retired "zero entry-pipeline change" (B2/B3 gate pre-confirmation promotion by design); scope now reads S5-election-untouched with promotion-gated-by-design under his entry-side scope word (relay section 0). No fence change for this item.
- MAP-CLOSE - V347 Sonnet-D1 plus GLM-D1: P197 header reads 1-193 (v6 199 + appended 13 = v7 212; v6 tail 194-199 == v7 tail 207-212 byte-equal, mechanically diffed). V347 Sonnet-D2 plus GLM-D2: A7-VAR closes on the P188 tail added this fold (P206 parenthetical now true; V346 P203). V347 Sonnet-D3: v7 L175 word-roll (tolerance-to-quantization under V345 WORD-TOL) owned here as fold housekeeping without a named disposition; v8 carries the line unchanged (now L178).
- LABELS - V347 Sonnet-D4/D5 plus GLM-D4/D5/D6: P207 parks V345-prefixed labels only (adopted V346 items live at P144 GLM-A2 tail, v347-relay section-0 GLM-A3 span, P141 Luna-A4 day-exit wording - never parked); P142 Sonnet-4 round-tagged V345 (matches V345 P183); relay Q1 scope list re-derived from this manifest; relay "Sonnet 1/3-10" corrected to 1-10 (V346 note 2 adopted at PROSE-L054, Task-160 label).
- WORDING - V347 Sonnet-D6/D7/D8/D9/D10 plus minors plus GLM-D7: P144/P148 P-line refs; P141 branch-(ii) revision-only proof (exit identical to R01); V346 EXIT-LONDON line carries the fire conditions (pre-admission gap bounds the claim; "at or before 12:15"); UJADMIT-join scoped to the future run (segment carries no R-venue UJADMIT row); P142 reads "6/11 absent"; P118 EA-406/407 siting; P009 self-ref and RHELP blank-line cosmetic noted, unfixed.
- PINS - V347 Sonnet Ask-A plus GLM-D8/D9: +7 derivation bounds London end at-or-before 12:05 (P026 row; "12:00" reads as the June-configuration take, softened, never his number); R-SESS span starts EA-1873 with signature EA-1865 outside it ("pure" stays prose-only); seedbias setter EA-8133 debug-gated (B2 input valid under InpDebugLog=true, pinned); GLM-D8 v6-tail fate stated in MANIFEST-8; GLM-D10 tag-style cosmetic frozen, never edited.
- Budget recount (mechanical): R +13 / RHELP +39 / B2 +3 / B3 +0 / S3 +2. Total NET +57 vs v26 12202; final tree 12259. Changed from v7 by the +3 boundary-fix lines; prose edits same-line.

## V348 fold delta (v9; ledger 999 Q1 1-1 SPLIT with dispositions; instance-key prints + B4 setter un-gating + audit-map close; P-numbers below are v9 twin lines; lines 1-234 carried from v8 - 1-129 identical numbering, 144-234 equal v8 130-220 with +14 shift modulo the enumerated edits)

- MANIFEST-9 - V348 GLM-B root-cause sweep (re-base or section-prefix every bare P-ref below the L73-75 insert): fence prints old L46/L48 to new (seq=%I64d admit=%s args appended, counts UJRETARGET 5->7 / UJNORETARGET 6->8); B4 insert L130-143 (old-B4 cond + new cond + old-B4P print + new debug-gated print, NET 0); in-place prose 1 (title), 3 (status), 10 (fallback scope), 54 (walk geometry + D1(a) retired), 88 (walk-start precision), 122 (reset-path pin), 151 (counts 7=7/8=8), 155 (eq impossibility), 158 (RETARGET-ABSENT completion + P148 ref + RERETARGET unreachable), 162 (instance-keyed fields + single-fire), 177 (one-bar forfeit), 221 (v347 round-name), 226 (span tightened), 227 (non-es continue qualifier), 229 (P206 number), 230 (v347 round-name); appended section lines 235-247 (dispositions at 237-246; 235-236 heading/blank, 247 separator blank); tail 248-253 byte-carried from v8 221-226 (run-cost carried intact).
- INSTKEY - V348 Luna-1 plus Analytic B: UJRETARGET + UJNORETARGET prints carry seq (SManagedTrade.uj_tradeSeq, long EA-265, set EA-10648, printed as g_mtrade.uj_tradeSeq) + admit (g_mtrade.uj_admitBarTime); RETARGET-ABSENT, UJ-RERETARGET, and retarget-distance grading join deterministically on (seq, admit) with no session/date/time reconstruction; UJADMIT-join sentence retained for segment context only.
- SETTER - V348 Luna-2 plus Analytic B (FIX B4): EA-8133 assignment un-gated (EA-8126 drops the debug term; print stays debug-gated single-statement); replay rows identical under the pinned InpDebugLog=true config; the fallback path converges to the accepted behavior (REJECT kills, -1/1 pass). Q2 regression battery at build: B-venue kill preserved + lifecycle demo (carried Q2 build-gate).
- SCOPE3 - V348 Luna-3: STRUCTURAL-BIAS kill stated fallback-scoped (P010 authority + relay Q1 sentence); aligned-path gating (EA-8329-8336) parked pending his word, never asked here.
- DESC11 - V348 Luna-4: the 11 June leg described as telemetry-only (relay scope + takes-sheet carry the diagnostic wording; packet S-venue already diagnostic; behavioral term fix after the run).
- WALK - V348 Sonnet-1/GLM-6 plus Sonnet-2: P054 post-fix geometry (36 London / 60 NYAM M5 bars, first-out-bar pass only, 600 cap vestigial, Monday span unreachable); NOTE-A4 one-bar forfeit stated honestly; blackout-tolerant variant rejected per Sonnet-B1 (keep the pin, state the forfeit); 600-cap tightening parked for its own round per Sonnet-B2/GLM-B.
- ECHO - V348 Sonnet-3 plus V349 Sonnet: eq/loose echoes cannot recur given one pass per bar (first-pass rows legitimate); tpB-carry only; UJ-RERETARGET unreachable-by-construction.
- REFS - V348 Sonnet-4/GLM-1/2/3/4 plus V349 GLM-A4: re-based this fold to P162 (tag-anchoring adopted-code), P128 (sb= line; v9-P125 old line), RETARGET-ABSENT (rename completed); P215 re-based to P206 (V346 P203); retired-name mentions on the page: P158 (retired-from clause), P162 (retired-vs-tag clause), completion site now REFS10 (P254) - battery asserts line-scoped; "per P148" retired (S3TELEM fence-close; tag-anchoring content at P162, print at P147); convention going forward: bare refs below an insert carry current numbers, carried-section refs keep their declared historical numbering.
- PINS9 - V348 Sonnet-5/6 plus GLM-7/8: P088 walk-start precision (containment stays the P097 test); price-guard continue retained; uj_newest redundancy + mixed indent noted, untouched; reset-at-abort/IDLE named as the leak fix path (5 June London SHORT most exposed); section-0 refs round-named; P212 span tightened to dispositions at 212-219.
- Budget recount (mechanical): R +13 / RHELP +39 / B2 +3 / B3 +0 / S3 +2 / B4 +0. Total NET +57 vs v26 12202; final tree 12259. Changed from v8 by print-arg appends (same-line) + B4 same-line swaps; prose edits same-line.

## V349 fold delta (v10; ledger 1001 Q1 1-1 SPLIT with dispositions; P122 fix + casts + audit close; P-numbers below are v10 twin lines; lines 1-247 carried from v9 identical numbering modulo the enumerated edits)

- MANIFEST-10 - V349 Luna-AB manifest-assert (every entry below changed to its successor - battery proves): fence casts old L46/L48 args to (long)g_mtrade.uj_tradeSeq (identity, NET 0, counts held 7=7/8=8); in-place prose 1 (title), 3 (status), 5 (surface census +B3/B4), 54 (design pins), 122 (post-B4 rewrite), 150 (B4 scope), 151 (B4+0), 155 (tpB-dedupe + per-bar qualifier), 158 (P162 ref + zero-row pin + retired-name completion), 162 (per-bar qualifier), 238 (SManagedTrade wording + long pin), 243 (E-phase qualifier), 244 (REFS precision); appended section lines 248-258 (dispositions at 250-257; 248-249 heading/blank, 258 separator blank); tail 259-264 byte-carried from v9 248-253 (run-cost carried intact).
- STALEP122 - V349 Luna-1 plus GLM-A1 plus Sonnet-1: P122 rewritten to the post-B4 state (setter unconditional EA-8126; print gated; replay-identical under pinned config; fallback-path convergence only, not lifecycle-wide); stale v8 clause fully retired, no dual-state text remains.
- CASTS - V349 GLM-A5 plus Sonnet-type: (long) casts at P046/P048 args (identity on long EA-265, NET 0, counts unchanged); uj_tradeSeq pinned long at struct EA-265 (set EA-10648, printed UJADMIT EA-10654); print sites use g_mtrade (wording fixed at P238).
- SCOPENARROW - V349 Luna-2/3/4: P239 narrowed to fallback-path convergence; un-gating not described as lifecycle-safe (stale-value gap carried openly); STRUCTURAL-BIAS kill stated fallback-scoped (P010 authority + relay Q1 sentence; aligned EA-8329-8336 parked); 11 June leg telemetry-only (relay scope + takes-sheet + packet S-venue agree).
- REFS10 - V349 Sonnet-4/GLM-A4/A9: tag-anchoring re-based to P162 (adopted-code) with print at P147; retired-name mentions exactly P158 (retired-from), P162 (retired-vs-tag), this line (completion); "per P148" retired; tpB-dedupe at P155; P151 carries B4+0; convention (current-numbers below inserts, historical numbering inside carried sections) restated unchanged.
- GATES - V349 Sonnet Ask-A plus GLM-A6/A7 plus Luna-AB battery: disk pins s1f_seedArmed local-unconditional EA-8000, s1g_legDir seed-captured EA-8057, CheckLtfAlign pure EA-2371-2377 (no globals/counters), consumer print-only EA-10362-10372; build-gates: debug-off replay admissions-equal (seq + admit bars), purity re-affirm, lifecycle demo, pre-key fence-in-EA assert (GLM-B5); battery rules live: manifest-assert (every manifest entry changed) + ref-lint (every bare ref resolves, GLM-B2). Debug-off baseline: post-B4 debug-off must equal the debug-on replay, never the v26 debug-off tree (V350 Sonnet-5).
- PARKS - V349 Luna-AB plus Sonnet-B plus GLM-B: lifecycle-bound shadows are a separate behavior round (not this fold); EXITVERDICT keys ride a future word (only on join friction, GLM-B1); blackout-tolerant variant rejected, keep pin + honest forfeit (Sonnet-B1, carried); 600-cap tightening its own round (Sonnet-B2/GLM-B, carried); aligned-path gate pending his word (Sonnet-B3, carried); EA print-only comments corrected with the next behavior touch (Sonnet, explicit); pre-emptive reset stays demo-first (GLM-B4).
- Budget recount (mechanical): R +13 / RHELP +39 / B2 +3 / B3 +0 / S3 +2 / B4 +0. Total NET +57 vs v26 12202; final tree 12259. Unchanged (casts identity, prose same-line).

## V350 fold delta (v11; ledger 1003 Q1 1-1 SPLIT with dispositions; B4 indent form fix + anchors rebuttal + prose close; P-numbers below are v11 twin lines; lines 1-258 carried from v10 identical numbering modulo the enumerated edits)

- MANIFEST-11 - V350 Luna-AB manifest-assert (every entry below changed to its successor - battery proves by mechanical diff): fence form old-B4/new-B4/old-B4P/new-B4P each left one space to EA-true bytes (10/10/12/12sp at L132/135/138/141, NET 0, zero logic); in-place prose 1 (title), 3 (status), 5 (8134), 10 (aligned scenario), 54 (Monday unpack), 122 (-1 pin), 130 (block-vs-region), 150 (10357 split), 157 (A_OPP precision), 158 (gap caveat + KILLEXTRA), 238 (g_mtrade wording), 244 (single-site REFS), 255 (debug-off baseline); appended section L358-366 (dispositions 360-365; 358-359 heading/blank, 366 separator); tail 367-372 byte-carried from v11 353-358 (run-cost carried intact).
- ANCHORS - V350 Luna-1..7 (regions-are-anchors rebuttal with proof): relay regions are pre-edit anchors 0-diff vs the unbuilt v26 tree (packet Status + relay section 0 both state unbuilt; STAGE-1 exact-diffs at build; final-tree excerpts cannot exist pre-key); old-fences byte-match regions line-for-line (old-R 3/3, old-B2FULL 9sp at EA-8339, old-B3LINE 13sp at EA-8343, B4 now EA-true at EA-8126/8134, RHELP anchors EA-1887-1889); new-fences are the ruled change, never claimed present in regions.
- FORMFIX - V350 GLM-A8 plus Sonnet-7: B4 indent corrected to EA bytes and verified (EA-8126 10sp, EA-8134 12sp); B2/B3/R/RHELP old-fences match exactly (render-noise suspicion void by byte-compare); fence-vs-region byte lint is battery-live from this fold (every old-fence line naming an EA anchor must byte-equal the region rendering).
- SENTINEL - V350 Luna-8: -1 covers never-seeded AND unavailable-reads (UNREAD path at EA-8133); distinguished only at the setter, never carried; lifecycle-bound shadows stay a separate behavior round.
- GAPPINS - V350 Luna-9/10: RETARGET-ABSENT carries the absence-vs-history caveat (data holes undetectable, honestly disclosed); post-build helper span EA-1888-EA-1926 by arithmetic (anchor EA-1887 close + 39 insert lines: comment + 38 code; STAGE-1 verifies).
- PRECISION - V350 Sonnet-1..6 plus GLM-A1/A2/A4-A7: P005 print head EA-8134; P238 g_mtrade wording; single completion site REFS (P244; REFS10 points at it); 10357 read site vs 10362-72 print span; debug-off baseline is post-B4 debug-off equals debug-on replay (never v26 debug-off); Q1 wording unified (relay); UJ-KILLEXTRA finding (off-venue kills, 1 run-wide, demo-gated); takes demo-gate on the sheet (relay); aligned case concrete (P010); block-vs-region note (P130); A_OPP direction-first precision (P157); Monday unpacked (P054); P010 carried authority (not a v11 edit).
- CENSUS - V350 Sonnet-B sweep (190 guards, enclosing verified): behavioral writes under debug gates are B4 setter (fixed v9) plus sl41_o* (EA-9296-99, read at stop path 3260/5595 - OPEN future round, exit scope needs his word, named never touched); all else is print-only rows/counters/statics, diagnostic shadow/audit state, or unconditional writes (touchSeen, admission, confirmFromState, legDir, seedArmed, N1 restore-by-construction).
- PARKS11 - V350 Luna-AB plus Sonnet-B plus GLM-B/A3: lifecycle-bound shadows separate behavior round; EXITVERDICT keys future-word (GLM-B1); blackout variant rejected (Sonnet-B1, carried); 600-cap tightening own round (Sonnet-B2/GLM-B, carried); aligned gate pending his word (Sonnet-B3, carried); EA print-only comments next behavior touch (Sonnet, explicit); pre-emptive reset demo-first (GLM-B4); "(Fix R)" KILL-tail string rides the next fence touch (GLM-A3, named never made); sl41 stop-carry future round (exit scope).
- Budget recount (mechanical): R +13 / RHELP +39 / B2 +3 / B3 +0 / S3 +2 / B4 +0. Total NET +57 vs v26 12202; final tree 12259. Unchanged (whitespace-only form fix, prose same-line).

## V351-graded fold delta (v12; ledger 1007 RECON75 diagnosis; op-reseed + holder-expiry + term calibration + t78 telemetry; P-numbers below are v12 twin lines; v11 276 + title +2 + death 7 + H-block 70 + acceptance 8 + section 9 = 372; SUPERSEDED by the v13 section below - history, never live claims)

- MANIFEST-12 - mechanical diff v11->v12 proves every entry (content-line numbers): title 1-3 (+2), death insert L30-36, H-block L162-231 (old-H1 L166-171 / new-H1 L174-192 (+13); old-H2 L197-198 / new-H2 L201-207 + ABORT2 L210 (+6); old-H3 L215-216 / new-H3 L219-220 (0); old-H4 L225 / new-H4 L228-229 (+1)), acceptance insert L238-245, appended section L358-366 (dispositions 360-365; 358-359 heading/blank, 366 separator); tail 367-372 byte-carried from v11 271-276 (run-cost carried intact).
- ANCHD - RECON75 death chains R75-1..R75-4 (segment 060D8133; WOULDPREEMPT opp-TRUE with zero displace fires; 12:05 SESSION_CLOSED end of 2h50m holder; UJSBTELEM term A2_CLOSE_BREAK sbL 160.523; UJRETARGET branch-i proof tp 160.298).
- MECH - H1 op-reseed (S1 + opp retest -> overwrite holder, normal confirm path next bar; SessionAlreadyUsed + eviction-bit-difference + seedbias-evaluated guards; 09:45 entry arithmetic holds); H2 expiry (12-bar timer + new abort code, eviction-exempt; POI-break/flip triggers parked with helper-pin requirement); H3 Alt-A reclaim-aware A2 (RECOMMENDED, council may substitute Alt-B keep); H4 conf-pair print (print-only).
- ACCEPT12 - H1a 09:45 UJADMIT + no-RESEED_BLOCKED triple; H1-expiry zero rows (two-pattern proof); H3 14:40 UJADMIT on Alt-A (else detector-grade + council rules next); preserved (R-venue max, B-venue kill, 6/3, 8-June silent, 6/5-NY path, EU structural + RECON62 battery); rule-vs-takes (owed in, rest preserved); Q2 battery (demo rows + debug-off replay owed).
- PARKS12 - weekend instance-key, lifecycle shadows, EXITVERDICT keys, sl41 stop-carry (exit scope, his word), aligned gate, pre-emptive reset, Fix-R string, cap tightening, blackout variant: all parked with causes, none in this fold.
- Budget recount (mechanical): H1 +13 / H2 +6 / H3 +0 / H4 +1. Total NET +20 vs v27 12259; final tree 12279. S3 recount governs at build (no new inputs/buffers/handles - fences carry none).

## V352-graded fold delta (v13; ledger 1009 Q1 0-2 OBJECT HALT with dispositions; P-numbers below are v13 twin lines)

- MANIFEST-13 - mechanical diff v12->v13 proves every entry: title/status/census/prose (A/B/C/D/F/G/O/P same-line or scoped prose, zero fence); new-H1 span (E: 19-line v12 shape replaced by 29-line shape: guard + UJOPCONF + al/ok + reset mirror, P190 deleted); ABORT2 form + P212 lint-execution (H); H4 retired (I); H3 substitute + SIG/CALL fences (J); S3TELEM old-trued + fields (K/L); acceptance H1a/H3/takes (M/N/O); this section appended; tail run-cost carried.
- MECH13 - H1: guard && !t78_heldConf (EA-7866 basis) + single UJRESEED (al/ok, post-eval, pre-overwrite from-values) + UJOPCONF at seam + transfer reset mirror (zone/touch/latch/confirmFromState + uj_memo_valid global EA-302) + CheckLtfAlign mirror kept + S2ResolveLive kept (pass-through EA-4250); H2: elapsed contract + 11-eval count + pass-time pin + eviction mechanism pin; H3sub: default-off param (EA-2334) + arm (EA-2365) + contender-true (EA-8402), 13 callers strict; S3: o1/c0/c1/arm fields (14=14).
- ACCEPT13 - H1a single-row + rule-wins + fallback; H1-expiry zero rows (two-pattern proof, unchanged); H3 scoped-admit with arm-attributable rows; preserved (conditioned takes-sheet); rule-vs-takes (owed in, rest preserved); Q2 battery unchanged (demo rows + debug-off replay owed).
- PARKS13 - per-session reseed cap (D7) + tier-gate option (D8) + original-seed-time expiry key (Sonnet B-2) + GoAbort-body trace exhibit (D12, answered by comment+rows, exhibit parked) + admit-path render (A-17, graded by row presence) + weekend/sl41/shadows/aligned/reset/EXITVERDICT/cap/comments/Fix-R-string (carried).
- Budget recount (mechanical): H1 +25 / H2 +6 / H3 +0 / S3 +1. Total NET +32 vs v27 12259; final tree 12291. S3 recount governs at build (no new inputs/buffers/handles - fences carry none).

## Run cost and novel evidence

- No run proposed (draft round; build gated on a NEW key + his run word, neither spent nor asked here). Cost when gated: build + ~50m UJ June window + grade battery; key scope per seat (one build + one UJ run; EU sibling needs its own word + key scope).
- Novel evidence vs RECON74: UJRETARGET row with old/sess fields (no prior run revises TP), UJNORETARGET row with why+sess fields (helper-true-not-tighter diagnostic, equal case self-identified), S2SEEDBIAS_KILL row (no prior run gates promotion on seedbias), UJSBTELEM rows with sbL (no prior run exposes the contender evaluation with its line value).

(End of file)
