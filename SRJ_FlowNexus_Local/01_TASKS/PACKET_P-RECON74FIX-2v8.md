# PACKET_P-RECON74FIX-2 v8 DRAFT - RECON74 three imperfections, V347 fold (boundary fix + audit-map close; build gated on new key + run word; nothing builds/runs/commits on this file)

Status: v8 DRAFT (folds V347 verdicts on FIX-2 v7, ledger 997: Q1 0-2 OBJECT with dispositions; design: helper-boundary fence fix + audit-map close, zero other fence change; base = v26 tree 8C6468F4/676326/12202; STAGE-1/S3 disciplines attach; build needs a NEW key + his run word, neither spent nor asked here).

Canonical files: Experts\SRJ_FlowNexus_EA.mq5 ONLY (fixes R/B2/S3 below; indicator + FlowLogic untouched). No new indicator buffers, no new inputs, no new handles (helper reads iTime/iHigh/iLow + CurrentTradingWindow, all settled tree calls); one new function (UjClosedSessionTarget) + one new ABORT code + one modified print line (S2PROMOTE_M15) + four new prints (UJRETARGET/UJNORETARGET/UJSBTELEM/S2SEEDBIAS_KILL) + tpRef revision (managed only).

## Authority (his words verbatim + disk, no invention)

- His Ruling-1 (2026-09-29, chart, typos his filed verbatim in the intake): the 5 June New York LONG did not exit on the New York session high once it closed but closed on the day exit. Amended point: RETARGET fires (his standing rule): a session high/low that closes while a trade floats is a valid exit target. Scope note (Sonnet-3, builder prose call, scope narrowing disclosed): entry-session-type only at P054; other session types closing never retarget; the relay's Ruling-1 Rule line above reads within that scope; P009/P010/P011 below are normalized renderings with verbatim strings in the relay section 0 (GLM-A5).
- His Ruling-2 (2026-09-29, chart): the 8 June London SHORT is invalid because at 9:35 the structure had flipped bullish (flipped at 9:25). Amended point: STRUCTURAL-BIAS kills (his standing rule): a 5m bullish flip refuses SHORT confirmation; the seedbias REJECT verdict was correct and the promotion was the defect.
- His Ruling-3 (2026-09-29, chart): the 11 June is missed. Amended point: seed/detector gap stands as diagnosed (no LONG contender at the decision pass despite book hits).
- EU run ABORTED on his word same turn (key memo withdrawn, no key pasted, terminal.ini untouched June, nothing launched). The EU check rides a future word + key scope, never this packet.
- V340 grade (ledger 967, result BUILDER_RESULT_V340-GRADE.md 4E12A877): Q1 OBJECT-vs-CONFIRM (helper body owed - folded below as exact code); Q2 2-0 CLEAR (kill fail-closed, -1 pass - carried, fences below unchanged except the B3 print mod); Q3 telemetry 2-0 CLEAR (print below gains one field) + calibration SPLIT (telemetry now, term after UJSBTELEM rows; Luna one-liner carried as ruled candidate, never adopted); V341 grade (ledger 978, result BUILDER_RESULT_V341-GRADE.md A4CA05A6): all three 2-0 CLEAR with D1/D4/A actions - folded below).

## Record-first trail (spec + restatement + findings + journal + V340 verdicts searched before council)

- Spec Part A v4.2 (file, 35807 bytes): "retarget" 0x, "session high" exit 0x, "bias flip" 5x (generalities only). The retarget rule lives in his later words alone (strategy skill RETARGET section); the bias-gate mechanism lives nowhere on record (seedbias carriage exists, promotion ignores it).
- Findings: EXIT-BREAK-RETEST (break-retest, not retarget), EXITMODEL-1 (Q6 nearest-recompute, entry-scoped), RETEST-INVALIDATION-V1 (grading rules S5.4/S3.3, unaffected below), USDJPY-MISSES Rulings-J (entry triple, reused).
- Journal: no rows rule these venues (6/8 false has no journal row and is ruled INVALID by him; 6/11 + 6/5 rows cited in the death chains).
- V340 verdicts (delta-memory sweep for the fold; every demand below names its disposition in the fold map): Luna OBJECT Q1 (helper body) + CONFIRM Q2 + OBJECT Q3b (exact one-liner) + Analytics A/B; GLM CONFIRM x3 with contract + build-gate + 20 analytics + 6 mechanisms; Sonnet advisory CONFIRM x3 with 9 + 6 + 4 + date + Ask-B notes. No birth/selection authorship question ships (all venues are his ruled trades or the ruled-invalid false; nothing hypothesized as his candidate). V341 verdicts swept the same way (D1/D4/A-pins + carry confirmations); dispositions in the fold map.

## Death chains (RECON74-V11-UJ_JOURNAL.log, 7.3MB, DONE=PASSED; binary re-verified 8C6468F4 at grade)

- R-venue (5 June NY LONG, entry 16:55 open 160.115): TP booked 160.723 DH at fire and NEVER revised (all TP rows 16:50-fire through 6/8 carry tp=160.723; EXITVERDICT curTp=none); NY session high 160.262 closed 19:00 while floating (TPCENSUS NYH pool 147pts at 16:50 ref 160.115; 16:00 bar high 160.262); exit 6/8 00:50 POI_BODY_BREAK at 160.226 (multi-day float). Death = no retarget leg (managed TP frozen at booking).
- B-venue (8 June London SHORT, entry 09:35 open 160.294): UJPROBE ltf flipped +1.0 bullish at the 09:25 bar (m15 still -1.0); SEEDBIAS 09:25 SHORT biasAligned=0 REJECT-BIAS-TIMING (correct refusal); S2PROMOTE_M15 fired 09:25 on M15-align anyway (promotion ignores the verdict); S3ARM/S2POLL/S5 ran to a TP_TOUCH 11:50 win R3.47 (invalid winner, rejected per NO-OVERFIT). Death = promotion path never reads s1g_seedBiasAl (int carriage, decl EA-1151 default -1, set EA-8133 -1/1/0, consumed only at S1H EA-10357).
- S-venue (11 June NY LONG, owed entry 14:40 open 160.524): SHORT S4 squatter held 14:20-14:35 (seeded 14:05 CONSIDER); state never IDLE so no LONG seed could form (seed branch IDLE-gated EA-8002); RETESTBOOK 14:35 hits=2 dL (potential) with zero LONG candidate rows; SIDE1D_BOTHDIRS 14:30 + 14:35 sel=LONG Daily-POC (detector SAW the retest); S-b transfer found no contender (YIELD 0x run-wide); holder correctly deferred (UJDEFERABORT 14:35) and aborted 14:40:22 on identity (S-a fires as designed); LONG seeds only at 11:05 (aborted 12:05 SESSION_CLOSED, correct) and 15:00. Death = confirmation predicate refused the 14:35 bar (uj_sbConfC false; no LONG poll rows exist because polls run the held anchor) + no contender observability.

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
          if(InpDebugLog) PrintFormat("[SRJ-EA] UJRETARGET bar=%s dir=%s old=%s sess=%d tp=%s - session-close retarget (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(uj_oldRef, _Digits), g_mtrade.sessionAtEntry, DoubleToString(g_mtrade.tpRef, _Digits));
         }
       else if(InpDebugLog && uj_rtPx > 0.0) PrintFormat("[SRJ-EA] UJNORETARGET bar=%s dir=%s tp=%s rt=%s why=%s sess=%d - helper true but not tighter (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(g_mtrade.tpRef, _Digits), DoubleToString(uj_rtPx, _Digits), (NormalizeDouble(uj_rtPx, _Digits) == NormalizeDouble(g_mtrade.tpRef, _Digits) ? "eq" : "loose"), g_mtrade.sessionAtEntry); // helper-true discriminator
      }
    bool tpBookedTouch = false;
    if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
      {
```
- FIX RHELP (exact helper body with instance containment; answers V341 D1 + Sonnet Q1-1 with zero new carriage): closed entry-session-INSTANCE extreme read from price history (immune to buffer reset semantics by construction - only bars whose CurrentTradingWindow equals the entry session contribute; buffer route parked with cause: session-buffer post-close latch semantics unpinned on the page). Sits after the CurrentTradingWindow close (EA-1887) before the P-RESQUAT-1 F-a comment (EA-1889); definition precedes the EA-11829 caller so no prototype is needed. Walk cap 600 bars with admission-time containment (uj_admitBarTime set at admission EA-10647 near sessionAtEntry EA-10627 in the same admission block, 20 lines apart; no struct change; uj_admitBarTime pre-exists (EA-264) - GLM B1(b) path, no latch field, P005 surface holds); a later same-type close finds a run NOT containing the admission bar and returns false, so the revision fires at most once per trade instance (D1(a) re-word below); entry session NONE/-1 or unset admission time returns false (contract pins). Other session types closing never retarget (entry-session-type scope, stated per D2). Below-entry extremes accepted per his literal rule (no profit-side guard - D3 pinned accept; Sonnet Q1-2 floor declined canon-order). Type pins (D5): struct SManagedTrade EA-239, enum ENUM_SRJ_DIR EA-226, enum ENUM_SRJ_SESSION EA-228 - all defined before the EA-1887 site. Window pin (Luna A2): ENUM_SRJ_SESSION CurrentTradingWindow(datetime barTimeServer) EA-1865, pure half-open session map (London 02:00-05:00 ET, NYAM 07:00-12:00 ET, server-converted); helper reads bar-open times only. Walk arithmetic (GLM replay numbers, credited): 2880 bars per 10 trading days (288/day, weekends empty) - any intra-week post-close pass reaches the entry instance in 40-250 bars and Friday NYAM close to Monday pre-open in 130-350 bars; the cap binds only past a 2-trading-day evaluation gap and fails closed. M5 timeframe pinned (PERIOD_CURRENT walk - Sonnet timeframe note). First-out-bar rule (V347 Luna-2): the evaluation must be the first bar outside the entry-session run (barShift+1 in es) - enforced in the fence below.
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
           break;  // contiguous-run end (V347 Luna-2): entry inside the run is guaranteed by the barShift+1 pin, so any non-es bar ends the walk - fail-closed when no price seen yet
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
-1 (never-seeded) passes (no seed info); 0 (REJECT) kills; V340 ruled otherwise nowhere. Setter EA-8133 runs inside the seed block under InpDebugLog (EA-8126), so the B2 gate input is valid only with InpDebugLog=true (acceptance pins it); single-candidate reseed overwrites with no per-route reset (V347 Sonnet Ask-A lifecycle answered on disk; B1/prebind route covered by the carried lifecycle-demo build-gate).
- FIX B3 (gate-input visibility; GLM B3 adopted): every S2PROMOTE_M15 row carries its gate input (makes -1-pass cases and any future aligned-path promotion visible; proves the Luna lifecycle at grade). Modifies the EA-8343 print line only (0 net lines):
```mql5-old-B3LINE
             if(InpDebugLog) PrintFormat("[SRJ-EA] S2PROMOTE_M15 bar=%s dir=%s poi=%s sess=%s m15=%s m15src=%s ltf=%s rf=%d/%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry), DoubleToString(uj_m15b, 1), TimeToString(uj_m15src, TIME_DATE|TIME_MINUTES), UjDbl(uj_ltfb), (uj_m15r ? 1 : 0), uj_ltfOk); }
```
```mql5-new-B3LINE
             if(InpDebugLog) PrintFormat("[SRJ-EA] S2PROMOTE_M15 bar=%s dir=%s poi=%s sess=%s m15=%s m15src=%s ltf=%s sb=%d rf=%d/%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry), DoubleToString(uj_m15b, 1), TimeToString(uj_m15src, TIME_DATE|TIME_MINUTES), UjDbl(uj_ltfb), s1g_seedBiasAl, (uj_m15r ? 1 : 0), uj_ltfOk); }
```
- FIX S3 (contender observability + confirm-term ruling; 11 June class): (a) print the Scomb contender evaluation (zero behavior). Sits at the Scomb site (EA-8351+; uj_sbHave/uj_sbDir/uj_sbLine/uj_sbConfC/uj_sbConfH + uj_sbTermC/uj_sbTermH shapes per the Scomb fence; DirName prints NONE for DIR_NONE per EA-1779 - GLM A16 answered on disk).
```mql5-new-S3TELEM
        double uj_sbLineVal = 0.0; if(uj_sbHave && uj_sbLine >= 0 && !ReadBuf1(g_hPoi, uj_sbLine, uj_sbLineVal, barShift)) uj_sbLineVal = 0.0;
        if(InpDebugLog) PrintFormat("[SRJ-EA] UJSBTELEM bar=%s dir=%s have=%d sbDir=%s sbLine=%d confC=%d confH=%d sbL=%s termC=%s termH=%s - contender evaluation (Fix S3)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (int)uj_sbHave, DirName(uj_sbDir), uj_sbLine, (int)uj_sbConfC, (int)uj_sbConfH, DoubleToString(uj_sbLineVal, _Digits), uj_sbTermC, uj_sbTermH);
```
Sits inside the S3/S4-held Scomb block after the confirm pair is computed (EA-8360/8361), before the transfer if (EA-8362). Specifiers 10 = arguments 10. (b) The 14:35 confirm-term calibration rides v2-with-telemetry (V340 ruled branch): the v2 build carries the instrument; the term is ruled from UJSBTELEM rows (sbL answers the A2_CLOSE_BREAK question alone). Luna exact one-liner parked as labeled prior (filed V340-UJFIX2-1 Luna:13787-13792, region 13720-13836), never adopted: relay carries the filed cite. EU proof obligation: IsConfirmationCandle is shared with the EU entry pipeline - no term change adopts without bar-for-bar EU Rule-vs-takes vs register A1-7. EU sibling check replays exits plus later admissions bar-for-bar (FIX R shares the managed-exit path; an earlier EU exit can free the slot and move later admissions) (Sonnet-12).
- Settled-rules audit (strategy skill SETTLED-RULES pin): R + RHELP touch managed exits only (S5 election untouched; pre-confirmation promotion gated by B2 by design under his entry-side scope word (relay section 0); helper site-enumerated: defined once after EA-1887, called once at the EA-11829 call site; S5.4 grades exits, still applicable); B2/B3 kill and print pre-confirmation promotion only (S5.4/S3.3 run downstream/elsewhere; S3 block, S4 edge, S5 election untouched); S3 prints only (zero behavior). Exit-to-admission coupling stated: a revised EU exit can free the trade slot and move later admissions; EU grade replays both (Sonnet-13). Refinement phase: narrow edits to the named paths only.
- Fold budget (script-counted from the fenced blocks at fold battery, same convention NET per site = new-site lines minus retained-context lines): R call +13 (insert; v5 P042/P048 NormalizeDouble equality, UJNORETARGET 6=6 kept, UJRETARGET 5=5, spec census UJSBTELEM 10=10, S2SEEDBIAS_KILL 3=3) / RHELP +39 (insert: helper comment + 38 code lines) / B2 +3 (condition 0 + kill branch 2 + ABORT define 1) / B3 +0 (line mod) / S3 +2 (decl + print). Total NET +57 vs v26 12202; final tree 12259. S3 recount governs at build.

## Acceptance (grade-time proofs on a future UJ 6/1-6/13 run with InpDebugLog=true pinned under the same replay configuration as RECON63/71/72/73/74 (tick model, spread, pass timing); STAGE-1 exact-diffs the edit, S1 pre-hash gates the tree digest, S3 recounts the surface, and a fail-closed outcome is a failed proof unless its finding predicate fires)

- R-venue (5 June NY LONG): UJRETARGET row at the 19:00 session-close pass (tpRef revised 160.723 toward the closed NY high 160.262, old/sess fields on the row); exit branches grade-read: (i) touch of 160.262 on that bar or any later bar proves the fix end to end (touch-fill or the subsequent exit row carrying the revised reference); (ii) no touch through 6/8 00:50 proves the revision only (UJRETARGET row + tpRef-carry rows) with the Monday 00:50 BREAK exit identical to R01 (revision-only proof; "divergence finding" retired as imprecise - V347 Sonnet-D7). Session-close retarget (Sonnet Q1-8 wording adopted; "day-exit reconciliation" retired as overbroad, Luna-A4): his "day exit" is the Friday close region the unfixed tree floated past (held to Monday 00:50 POI_BODY_BREAK vDAY=0); branch (i) exits at the touched session high, branch (ii) floats to the Monday 00:50 break exactly as R01 because Fix R implements no Friday exit (Sonnet-7); post-revision eq rows read as tpRef-carry evidence, and an eq row with no prior UJRETARGET in the instance is coincidence, not revision proof (Sonnet-6); grade matches on the bar= field (first out-of-session bar opens 19:00, evaluated about 19:05 tick time); tpRef-carry evidence is the tpB= field on EXITVERDICT rows (R03 shape, Sonnet-5); the grade joins UJRETARGET to UJADMIT for retarget distance because P046 carries no entry (Sonnet-9). Join scoped to the future run (the RECON74 segment rows carry no R-venue UJADMIT row - V347 Sonnet-D9).
- B-venue (8 June London SHORT): NO S2PROMOTE at the 09:25 pass (S2SEEDBIAS_KILL row instead, seedbias REJECT on record, every S2PROMOTE_M15 row carries sb=, and none carries sb=0); run-wide admissions == {6/3, 6/5 x2} + 6/11 absent (see S-venue); EU takes identical (register A1-7 structural fence); 09:25-11:50 freed-machine window: any admission there grades as a UJ-EXTRA candidate against the register and takes sheet, not an automatic failure (V345 Sonnet-4, round-tagged - V347 GLM-D4).
- S-venue (11 June NY LONG): UJSBTELEM rows at S3/S4 passes (Have/ConfC/ConfH + sbL + terms, exposing the 14:35 refusal term); 6/11 YIELD/entry absence at 14:40 is EXPECTED until the term fix (carve-out: UJ-NOEVID mis-fire guard); term ruled post-run from the rows per the pre-ruled tree (A2_CLOSE_BREAK: sbL vs 14:30 close; A_OPP: flat/doji candle-1; C_TOUCH: Luna candidate); have=0 grades as detector finding, never term finding (A12); read have/sbDir/confC first because empty termC is not a pass (failTerm="" on success and on entry, termC unwritten when unevaluated, Sonnet-8).
- Findings map: missing row UJ-NOEVID (predicate named, 6/11 carve-out above); wrong-bar UJ-SIGNALBAR; extra-venue UJ-EXTRA; failed-retarget finding RETARGET-ABSENT (no UJRETARGET row at the first close of the trade entry session while floating with a strictly tighter closed in-direction extreme; name retired from UJ-NORETARGET - collides with the emitted UJNORETARGET tag by one hyphen - V347 Luna-4); refused promotion taken UJ-BIASDEFY (S2PROMOTE_M15 row with sb=0, greppable via P125, on a seedbias-REJECT bar on the m15-fallback path; aligned path logs STATE rows, invisible to this predicate - stated); second-retarget UJ-RERETARGET (more than one UJRETARGET row per trade instance - pre-ruled divergence finding, grade maps each row to its session instance; one revision per trade expected, so UJ-RERETARGET expects zero rows and the per-session mapping step is vacuous, Sonnet-7); S4 edge + C-silence + DUPADMIT carried. Trades with no booked TP get no retarget and no row under the P038 guard; UJ-NORETARGET does not apply to them (Sonnet-8). Loose-echo counting and tag-anchoring per P145. sb=0 kills on the m15-fallback path only; later aligned-path promotions are ungated by design (fallback-scoped kill); UJ-BIASDEFY stays fallback-scoped to match, fences untouched (Sonnet-10). tpB-carry on verdict rows (revised 160.262 vs R03-family 160.723) grades as expected-benign UJ-CARRY class, never divergence (GLM-A2).

## Fold map (V342 verdict dispositions; every demand adopted, parked, or refuted with anchor or reason)

- Adopted as code: uj_ended truncation guard (Sonnet Defect-1 exact text, credit Sonnet; GLM D1 converges on the class); UJNORETARGET diagnostic print (GLM B-offer; helper-true-not-tighter only; containment-blocked and truncation-blocked reads produce no row because the helper returns false - stated precisely, Luna-A3; v4 fields why+sess self-identify the equal case. Loose echoes recur per pass and are condition-counted like eq echoes; RETARGET-ABSENT keys on UJRETARGET absence, never row multiplicity (V345 GLM-3). Grade greps anchor on the bracketed [SRJ-EA] tag form because the retired UJ-NORETARGET finding-name vs the UJNORETARGET tag differ by one hyphen (V345 GLM-4, V347 Luna-4)).
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
- NOTE-A4 - GLM-A4, prose only: revision needs >=1 EvaluateManagedTrade pass in [entry-session close, next same-type session start); a live evaluation blackout spanning it forfeits silently. Replay-safe with 2880 bars proven.
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
- PARKED-REST - V345 Sonnet-B plus V345 GLM-B plus V345 Luna-B plus V345 Luna-A3/A4 plus V345 GLM-A2/A3/A4 (labels as filed at V345 P191; adopted V346 items of the same names live at P138 Luna-A4 day-exit wording, P141 GLM-A2 UJ-CARRY tail, relay section-0 GLM-A3 R-SESS span - never parked): normalize-at-assignment, aligned-print, P045 wrap, bound/seq hardening, single-key hardening, acknowledged limits - all parked with prior causes, no new round opened.
- Budget recount (mechanical): R +13 / RHELP +36 / B2 +3 / B3 +0 / S3 +2. Total NET +54 vs v26 12202; final tree 12256. Unchanged from v6 because v7 is prose-only.

## V347 fold delta (v8; ledger 997 Q1 0-2 OBJECT with dispositions; helper-boundary fence fix + audit-map close; P-numbers below are v8 twin lines; lines 1-209 carried from v7 - 1-72 identical numbering, 76-209 equal v7 73-206 with +3 shift modulo the enumerated edits)

- MANIFEST-8 - V347 GLM-B1 per-line map: fence old L62-99 to new L62-102 (+3: new L73-75 bp first-out-bar pins; L81 loop start barShift+1 bound +601; L87-88 contiguous-run-end rework; all other fence lines byte-carried); in-place prose 1 (title), 3 (status), 54 (first-out-bar rule), 118 (EA-406/407 siting), 122 (debug-gated setter pin), 136 (S5-election scope), 137 (budget +57/12259), 141 (branch-ii revision-only), 142 (6/11 absent + V345 Sonnet-4 tag), 144 (RETARGET-ABSENT rename + P145 ref + join scope), 148 (finding-name + V345 GLM-3/4 tags), 188 (A7 tail), 197 (1-193 header), 200 (EXIT-LONDON conditions), 207 (V345 PARKED-REST prefixes); appended section lines 210-220 carry the dispositions below.
- BOUNDARY-FIX - V347 Luna-2 plus Analytic B, fence change: evaluation pinned to the first bar outside the entry-session run (new L73-75 barShift+1-in-es guards), walk confined to the contiguous es run (L85-89 break on first non-es, `continue` retired); late-close reuse of an older instance is unreachable by construction; once-only preserved (caller tighter-check) and fail-closed preserved (no price or no older edge returns false); comment tag [P-RECON74FIX-2 v2] frozen per cosmetic note.
- SCOPE-TRUE - V347 Luna-1: relay Q1 change-sentence and P136 audit retired "zero entry-pipeline change" (B2/B3 gate pre-confirmation promotion by design); scope now reads S5-election-untouched with promotion-gated-by-design under his entry-side scope word (relay section 0). No fence change for this item.
- MAP-CLOSE - V347 Sonnet-D1 plus GLM-D1: P197 header reads 1-193 (v6 199 + appended 13 = v7 212; v6 tail 194-199 == v7 tail 207-212 byte-equal, mechanically diffed). V347 Sonnet-D2 plus GLM-D2: A7-VAR closes on the P188 tail added this fold (P203 parenthetical now true). V347 Sonnet-D3: v7 L175 word-roll (tolerance-to-quantization under V345 WORD-TOL) owned here as fold housekeeping without a named disposition; v8 carries the line unchanged (now L178).
- LABELS - V347 Sonnet-D4/D5 plus GLM-D4/D5/D6: P207 parks V345-prefixed labels only (adopted V346 items live at P144 GLM-A2 tail, relay section-0 GLM-A3 span, P141 Luna-A4 day-exit wording - never parked); P142 Sonnet-4 round-tagged V345 (matches V345 P183); relay Q1 scope list re-derived from this manifest; relay "Sonnet 1/3-10" corrected to 1-10 (V346 note 2 adopted at PROSE-L054, Task-160 label).
- WORDING - V347 Sonnet-D6/D7/D8/D9/D10 plus minors plus GLM-D7: P144/P148 P-line refs; P141 branch-(ii) revision-only proof (exit identical to R01); V346 EXIT-LONDON line carries the fire conditions (pre-admission gap bounds the claim; "at or before 12:15"); UJADMIT-join scoped to the future run (segment carries no R-venue UJADMIT row); P142 reads "6/11 absent"; P118 EA-406/407 siting; P009 self-ref and RHELP blank-line cosmetic noted, unfixed.
- PINS - V347 Sonnet Ask-A plus GLM-D8/D9: +7 derivation bounds London end at-or-before 12:05 (P026 row; "12:00" reads as the June-configuration take, softened, never his number); R-SESS span starts EA-1873 with signature EA-1865 outside it ("pure" stays prose-only); seedbias setter EA-8133 debug-gated (B2 input valid under InpDebugLog=true, pinned); GLM-D8 v6-tail fate stated in MANIFEST-8; GLM-D10 tag-style cosmetic frozen, never edited.
- Budget recount (mechanical): R +13 / RHELP +39 / B2 +3 / B3 +0 / S3 +2. Total NET +57 vs v26 12202; final tree 12259. Changed from v7 by the +3 boundary-fix lines; prose edits same-line.

## Run cost and novel evidence

- No run proposed (draft round; build gated on a NEW key + his run word, neither spent nor asked here). Cost when gated: build + ~50m UJ June window + grade battery; key scope per seat (one build + one UJ run; EU sibling needs its own word + key scope).
- Novel evidence vs RECON74: UJRETARGET row with old/sess fields (no prior run revises TP), UJNORETARGET row with why+sess fields (helper-true-not-tighter diagnostic, equal case self-identified), S2SEEDBIAS_KILL row (no prior run gates promotion on seedbias), UJSBTELEM rows with sbL (no prior run exposes the contender evaluation with its line value).

(End of file)
