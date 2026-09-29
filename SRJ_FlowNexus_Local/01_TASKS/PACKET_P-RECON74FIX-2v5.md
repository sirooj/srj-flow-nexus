# PACKET_P-RECON74FIX-2 v5 DRAFT - RECON74 three imperfections, V344 fold (equality tolerance + prose dispositions; build gated on new key + run word; nothing builds/runs/commits on this file)

Status: v5 DRAFT (folds V344 verdicts on FIX-2 v4, ledger 991: Q1 2-0 CLEAR with tolerance + disposition actions; design: price-aware equality + prose dispositions; base = v26 tree 8C6468F4/676326/12202; STAGE-1/S3 disciplines attach; build needs a NEW key + his run word, neither spent nor asked here).

Canonical files: Experts\SRJ_FlowNexus_EA.mq5 ONLY (fixes R/B2/S3 below; indicator + FlowLogic untouched). No new indicator buffers, no new inputs, no new handles (helper reads iTime/iHigh/iLow + CurrentTradingWindow, all settled tree calls); one new function (UjClosedSessionTarget) + one new ABORT code + one modified print line (S2PROMOTE_M15) + four new prints (UJRETARGET/UJNORETARGET/UJSBTELEM/S2SEEDBIAS_KILL) + tpRef revision (managed only).

## Authority (his words verbatim + disk, no invention)

- His Ruling-1 (2026-09-29, chart, typos his filed verbatim in the intake): the 5 June New York LONG did not exit on the New York session high once it closed but closed on the day exit. Amended point: RETARGET fires (his standing rule): a session high/low that closes while a trade floats is a valid exit target.
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
- FIX RHELP (exact helper body with instance containment; answers V341 D1 + Sonnet Q1-1 with zero new carriage): closed entry-session-INSTANCE extreme read from price history (immune to buffer reset semantics by construction - only bars whose CurrentTradingWindow equals the entry session contribute; buffer route parked with cause: session-buffer post-close latch semantics unpinned on the page). Sits after the CurrentTradingWindow close (EA-1887) before the P-RESQUAT-1 F-a comment (EA-1889); definition precedes the EA-11829 caller so no prototype is needed. Walk cap 600 bars with admission-time containment (uj_admitBarTime set at admission EA-10647 near sessionAtEntry EA-10627 in the same admission block, 20 lines apart; zero struct change is retired - pre-existing member, no struct change by this packet; GLM B1(b) path, no latch field, P005 surface holds); a later same-type close finds a run NOT containing the admission bar and returns false, so the revision fires at most once per trade instance (D1(a) re-word below); entry session NONE/-1 or unset admission time returns false (contract pins). Other session types closing never retarget (entry-session-type scope, stated per D2). Below-entry extremes accepted per his literal rule (no profit-side guard - D3 pinned accept; Sonnet Q1-2 floor declined canon-order). Type pins (D5): struct SManagedTrade EA-239, enum ENUM_SRJ_DIR EA-226, enum ENUM_SRJ_SESSION EA-228 - all defined before the EA-1887 site. Window pin (Luna A2): ENUM_SRJ_SESSION CurrentTradingWindow(datetime barTimeServer) EA-1865, pure half-open session map (London 02:00-05:00 ET, NYAM 07:00-12:00 ET, server-converted); helper reads bar-open times only. Walk arithmetic (GLM replay numbers, credited): 2880 bars per 10 trading days (288/day, weekends empty) - any intra-week post-close pass reaches the entry instance in 40-250 bars and Friday NYAM close to Monday pre-open in 130-350 bars; the cap binds only past a 2-trading-day evaluation gap and fails closed. M5 timeframe pinned (PERIOD_CURRENT walk - Sonnet timeframe note).
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
    double ext = 0.0;
    bool have = false;
    bool uj_ended = false;
    datetime uj_newest = 0;
    datetime uj_oldest = 0;
    for(int k = barShift; k < barShift + 600; k++)
      {
       datetime bk = iTime(_Symbol, PERIOD_CURRENT, k);
       if(bk == 0) break;
       if((int)CurrentTradingWindow(bk) != es)
         {
          if(have) { uj_ended = true; break; }
          continue;
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
Sits between the promotion-block close (end of EA-8343) and the S2WAIT else (EA-8344): promote / kill / wait. New ABORT code rides the ABORT-define family (last define EA-406, insert before the Task-160 block EA-408; quote column 32 to match the family - battery asserts):
```mql5-new-ABORT
#define ABORT_SEEDBIAS_REFUSED "SEEDBIAS_REFUSED"
```
-1 (never-seeded) passes (no seed info); 0 (REJECT) kills; V340 ruled otherwise nowhere.
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
Sits inside the S3/S4-held Scomb block after the confirm pair is computed (EA-8360/8361), before the transfer if (EA-8362). Specifiers 10 = arguments 10. (b) The 14:35 confirm-term calibration rides v2-with-telemetry (V340 ruled branch): the v2 build carries the instrument; the term is ruled from UJSBTELEM rows (sbL answers the A2_CLOSE_BREAK question alone). Luna exact one-liner parked as labeled prior (filed V340-UJFIX2-1 Luna:13787-13792, region 13720-13836), never adopted: relay carries the filed cite. EU proof obligation: IsConfirmationCandle is shared with the EU entry pipeline - no term change adopts without bar-for-bar EU Rule-vs-takes vs register A1-7.
- Settled-rules audit (strategy skill SETTLED-RULES pin): R + RHELP touch managed exits only (entry pipeline + S5 election untouched; helper site-enumerated: defined once after EA-1887, called once at the EA-11829 call site; S5.4 grades exits, still applicable); B2/B3 kill and print pre-confirmation promotion only (S5.4/S3.3 run downstream/elsewhere; S3 block, S4 edge, S5 election untouched); S3 prints only (zero behavior). Refinement phase: narrow edits to the named paths only.
- Fold budget (script-counted from the fenced blocks at fold battery, same convention NET per site = new-site lines minus retained-context lines): R call +13 (insert; v5 P042/P048 NormalizeDouble equality, UJNORETARGET 6=6 kept, UJRETARGET 5=5, spec census UJSBTELEM 10=10, S2SEEDBIAS_KILL 3=3) / RHELP +36 (insert: helper comment + 35 code lines) / B2 +3 (condition 0 + kill branch 2 + ABORT define 1) / B3 +0 (line mod) / S3 +2 (decl + print). Total NET +54 vs v26 12202; final tree 12256. S3 recount governs at build.

## Acceptance (grade-time proofs on a future UJ 6/1-6/13 run with InpDebugLog=true pinned under the same replay configuration as RECON63/71/72/73/74 (tick model, spread, pass timing); STAGE-1 exact-diffs the edit, S1 pre-hash gates the tree digest, S3 recounts the surface, and a fail-closed outcome is a failed proof unless its finding predicate fires)

- R-venue (5 June NY LONG): UJRETARGET row at the 19:00 session-close pass (tpRef revised 160.723 toward the closed NY high 160.262, old/sess fields on the row); exit branches grade-read: (i) touch of 160.262 on any later bar proves the fix end to end (touch-fill or the subsequent exit row carrying the revised reference); (ii) no touch through 6/8 00:50 proves the revision only (UJRETARGET row + tpRef-carry rows) with the Monday 00:50 BREAK exit graded as divergence finding vs R01. Session-close retarget (Sonnet Q1-8 wording adopted; "day-exit reconciliation" retired as overbroad, Luna-A4): his "day exit" is the Friday close region the unfixed tree floated past (held to Monday 00:50 POI_BODY_BREAK vDAY=0); branch (i) exits at the touched session high, branch (ii) floats to the Monday 00:50 break exactly as R01 because Fix R implements no Friday exit (Sonnet-7); post-revision eq rows read as tpRef-carry evidence, and an eq row with no prior UJRETARGET in the instance is coincidence, not revision proof (Sonnet-6).
- B-venue (8 June London SHORT): NO S2PROMOTE at the 09:25 pass (S2SEEDBIAS_KILL row instead, seedbias REJECT on record, sb=-gated promotion rows run-wide); run-wide admissions == {6/3, 6/5 x2} + 6/11 conditional (see S-venue); EU takes identical (register A1-7 structural fence).
- S-venue (11 June NY LONG): UJSBTELEM rows at S3/S4 passes (Have/ConfC/ConfH + sbL + terms, exposing the 14:35 refusal term); 6/11 YIELD/entry absence at 14:40 is EXPECTED until the term fix (carve-out: UJ-NOEVID mis-fire guard); term ruled post-run from the rows per the pre-ruled tree (A2_CLOSE_BREAK: sbL vs 14:30 close; A_OPP: flat/doji candle-1; C_TOUCH: Luna candidate); have=0 grades as detector finding, never term finding (A12).
- Findings map: missing row UJ-NOEVID (predicate named, 6/11 carve-out above); wrong-bar UJ-SIGNALBAR; extra-venue UJ-EXTRA; failed retarget UJ-NORETARGET (no UJRETARGET row at the close of the trade entry session while floating with a strictly tighter closed in-direction extreme); refused promotion taken UJ-BIASDEFY (S2PROMOTE_M15 on a seedbias-REJECT bar on the m15-fallback path; aligned path logs STATE rows, invisible to this predicate - stated); second-retarget UJ-RERETARGET (more than one UJRETARGET row per trade instance - pre-ruled divergence finding, grade maps each row to its session instance); S4 edge + C-silence + DUPADMIT carried. Trades with no booked TP get no retarget and no row under the P038 guard; UJ-NORETARGET does not apply to them (Sonnet-8). Loose echoes recur per pass and are condition-counted like eq echoes; UJ-NORETARGET keys on UJRETARGET absence, never row multiplicity (GLM-3). Grade greps anchor on the bracketed [SRJ-EA] tag form because UJ-NORETARGET vs UJNORETARGET differ by one hyphen (GLM-4).

## Fold map (V342 verdict dispositions; every demand adopted, parked, or refuted with anchor or reason)

- Adopted as code: uj_ended truncation guard (Sonnet Defect-1 exact text, credit Sonnet; GLM D1 converges on the class); UJNORETARGET diagnostic print (GLM B-offer; helper-true-not-tighter only; containment-blocked and truncation-blocked reads produce no row because the helper returns false - stated precisely, Luna-A3; v4 fields why+sess self-identify the equal case. Loose echoes recur per pass and are condition-counted like eq echoes; UJ-NORETARGET keys on UJRETARGET absence, never row multiplicity (GLM-3). Grade greps anchor on the bracketed [SRJ-EA] tag form because UJ-NORETARGET vs UJNORETARGET differ by one hyphen (GLM-4)).
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

- MOD-TOL - Luna-A1 plus Sonnet-4 plus Sonnet-B, first-fire edge only: P042 strict compare and P048 why ternary compare NormalizeDouble both sides at _Digits (displayed-price equality; bit-exact ulp fires retired); same lines, no arg change, spec counts kept (UJNORETARGET 6=6); P048 indent normalized 10sp to 7sp to match its P041 if (GLM-2, carried indent retired) plus trailing helper-true-discriminator comment (GLM-8). Old-fence = v26 EA-11826-11842, same as v4 old-R; new shape = v5 R fence P037-P049. Once-only untouched because post-revision tpRef is bit-identical to rt on all seats' reads. Rule-vs-takes: R-venue revision spans 461 points (160.723 to 160.262, far above any ulp band); B-venue and S-venue run no retarget path; EU entry and selection untouched; no valid take moves.
- ROWS-SOURCE - Sonnet-2 plus GLM-1: canonical chain "v342 via v343" because the bytes agree either way; v345 Rows heading carries the chain so audits single-count.
- CITE-P153 - Sonnet-1: old-R fence precision - the 3-line fence is EA-11829-11831 while EA-11826-11842 names the whole (b) TP block region; the (b) TP comment now heads the retarget insert, cosmetic, stated.
- PIN-ENUM - Luna-A5 plus Sonnet-5: session map pinned once - SESSION_NONE=0, SESSION_LONDON=1, SESSION_NYAM=2 at EA-228; sess is constant per trade while instance mapping rides UJADMIT trade_seq at R13 plus timestamps, per the UJ-RERETARGET predicate.
- PIN-ET - GLM-5: ET/server offset pinned once - session map quoted in ET, journal and acceptance times server; 19:00 server close coincides with the 14:00 ET NYAM-window end used on the page.
- MARK-T160 - GLM-7: Task-160 retirement marked carried/re-pinned (v3 packet disposition plus P155 PROSE-L054, reconciled by P146).
- COORD - GLM-9: EA anchors name v26 pre-insert coordinates (the EA-11829 caller names the anchor region, not the post-insert call line).
- PARKED with cause: Sonnet-B live-flip refusal (seat-parked for a future touch, no re-rule); GLM-B bound/seq hardening (optional, not required); single-writer latch (GLM-10 plus Luna-A2, UJ-RERETARGET backstop stands); Luna-A3/A4 acknowledged limits ride as stated; GLM-6 ABORT (battery 31=31 stands).
- Budget recount (mechanical): R +13 / RHELP +36 / B2 +3 / B3 +0 / S3 +2. Total NET +54 vs v26 12202; final tree 12256. Unchanged from v4 because the tolerance edit is same-line and prose edits are same-line.

## Run cost and novel evidence

- No run proposed (draft round; build gated on a NEW key + his run word, neither spent nor asked here). Cost when gated: build + ~50m UJ June window + grade battery; key scope per seat (one build + one UJ run; EU sibling needs its own word + key scope).
- Novel evidence vs RECON74: UJRETARGET row with old/sess fields (no prior run revises TP), UJNORETARGET row with why+sess fields (helper-true-not-tighter diagnostic, equal case self-identified), S2SEEDBIAS_KILL row (no prior run gates promotion on seedbias), UJSBTELEM rows with sbL (no prior run exposes the contender evaluation with its line value).

(End of file)
