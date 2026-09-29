# PACKET_P-RECON74FIX-1 v1 DRAFT - RECON74 three imperfections (his chart rulings; build gated on new key + run word; nothing builds/runs/commits on this file)

Status: v1 DRAFT (RECON74-V11-UJ graded ledger 965: A-SL1 + A-S2P pass, A-FB late, 6/8 false, 6/11 miss diagnosed; design: FIX R (session-close retarget) + FIX B2 (seedbias promotion gate) + FIX S3 (contender observability + confirm-term ruling); base = v26 tree 8C6468F4/676326/12202; STAGE-1/S3 disciplines attach; build needs a NEW key + his run word, neither spent nor asked here).

Canonical files: Experts\SRJ_FlowNexus_EA.mq5 ONLY (fixes R/B2/S3 below; indicator + FlowLogic untouched). No new indicator buffers, no new inputs (session arrays + seedbias carriage already on tree), no new handles; one new print family (UJRETARGET/UJSEEDBIAS_KILL/UJSBTELEM) + tpRef revision (managed only).

## Authority (his words verbatim + disk, no invention)

- His Ruling-1 (2026-09-29, chart, typos his filed verbatim in the intake): the 5 June New York LONG did not exit on the New York session high once it closed but closed on the day exit. Amended point: RETARGET fires (his standing rule): a session high/low that closes while a trade floats is a valid exit target.
- His Ruling-2 (2026-09-29, chart): the 8 June London SHORT is invalid because at 9:35 the structure had flipped bullish (flipped at 9:25). Amended point: STRUCTURAL-BIAS kills (his standing rule): a 5m bullish flip refuses SHORT confirmation; the seedbias REJECT verdict was correct and the promotion was the defect.
- His Ruling-3 (2026-09-29, chart): the 11 June is missed. Amended point: seed/detector gap stands as diagnosed (no LONG contender at the decision pass despite book hits).
- EU run ABORTED on his word same turn (key memo withdrawn, no key pasted, terminal.ini untouched June, nothing launched). The EU check rides a future word + key scope, never this packet.

## Record-first trail (spec + restatement + findings + journal searched before council)

- Spec Part A v4.2 (file, 35807 bytes): "retarget" 0x, "session high" exit 0x, "bias flip" 5x (generalities only). The retarget rule lives in his later words alone (strategy skill RETARGET section); the bias-gate mechanism lives nowhere on record (seedbias carriage exists, promotion ignores it).
- Findings: EXIT-BREAK-RETEST (break-retest, not retarget), EXITMODEL-1 (Q6 nearest-recompute, entry-scoped), RETEST-INVALIDATION-V1 (grading rules S5.4/S3.3, unaffected below), USDJPY-MISSES Rulings-J (entry triple, reused).
- Journal: no rows rule these venues (6/8 false has no journal row and is ruled INVALID by him; 6/11 + 6/5 rows cited in the death chains).
- No birth/selection authorship question ships (all venues are his ruled trades or the ruled-invalid false; nothing hypothesized as his candidate).

## Death chains (RECON74-V11-UJ_JOURNAL.log, 7.3MB, DONE=PASSED; binary re-verified 8C6468F4 at grade)

- R-venue (5 June NY LONG, entry 16:55 open 160.115): TP booked 160.723 DH at fire and NEVER revised (all TP rows 16:50-fire through 6/8 carry tp=160.723; EXITVERDICT curTp=none); NY session high 160.262 closed 19:00 while floating (TPCENSUS NYH pool 147pts at 16:50 ref 160.115; 16:00 bar high 160.262); exit 6/8 00:50 POI_BODY_BREAK at 160.226 (multi-day float). Death = no retarget leg (managed TP frozen at booking).
- B-venue (6 June London SHORT, entry 09:35 open 160.294): UJPROBE ltf flipped +1.0 bullish at the 09:25 bar (m15 still -1.0); SEEDBIAS 09:25 SHORT biasAligned=0 REJECT-BIAS-TIMING (correct refusal); S2PROMOTE_M15 fired 09:25 on M15-align anyway (promotion ignores the verdict); S3ARM/S2POLL/S5 ran to a TP_TOUCH 11:50 win R3.47 (invalid winner, rejected per NO-OVERFIT). Death = promotion path never reads s1g_seedBiasAl (carriage exists: decl EA-1151, set EA-8133, consumed only at S1H EA-10357).
- S-venue (11 June NY LONG, owed entry 14:40 open 160.524): SHORT S4 squatter held 14:20-14:35 (seeded 14:05 CONSIDER); state never IDLE so no LONG seed could form (seed branch IDLE-gated EA-8002); RETESTBOOK 14:35 hits=2 dL (potential) with zero LONG candidate rows; SIDE1D_BOTHDIRS 14:30 + 14:35 sel=LONG Daily-POC (detector SAW the retest); S-b transfer found no contender (YIELD 0x run-wide); holder correctly deferred (UJDEFERABORT 14:35) and aborted 14:40:22 on identity (S-a fires as designed); LONG seeds only at 11:05 (aborted 12:05 SESSION_CLOSED, correct) and 15:00. Death = confirmation predicate refused the 14:35 bar (uj_sbConfC false; no LONG poll rows exist because polls run the held anchor) + no contender observability.

## Edit set (exact anchors; STAGE-1 exact-diffs each; old blocks mechanical-spliced at build battery; convention: NET per site = NEW minus OLD; S3 recount governs)

- FIX R (session-close retarget; T3 class): revise the booked TP to the closed session H/L when a trade floats across the close. Sits in EvaluateManagedTrade before the TP block (EA-11826-11842 region; g_mtrade.tpRef struct ~250; MTEXIT consumes tpRef EA-11944; session level buffers FL_BUF_NY_HIGH (14) + family per EA-2477/2646 shapes; TPCENSUS pool as the value pattern).
```mql5-old-R
     bool tpBookedTouch = false;
     if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
       {
```
```mql5-new-R
     //--- [P-RECON74FIX-1 R] session-close retarget (his RETARGET rule; closed-session values only; stateless/idempotent: tpRef converges so the revision fires once by construction).
     if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
       {
        double uj_rtPx = 0.0;
        if(UjClosedSessionTarget(g_mtrade, barShift, uj_rtPx) && uj_rtPx > 0.0
           && ((g_mtrade.dir == DIR_LONG && uj_rtPx < g_mtrade.tpRef) || (g_mtrade.dir == DIR_SHORT && uj_rtPx > g_mtrade.tpRef)))
          {
           g_mtrade.tpRef = uj_rtPx;
           if(InpDebugLog) PrintFormat("[SRJ-EA] UJRETARGET bar=%s dir=%s tp=%s - session-close retarget (Fix R)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_mtrade.dir), DoubleToString(g_mtrade.tpRef, _Digits));
          }
       }
     bool tpBookedTouch = false;
     if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
       {
```
Helper contract (council rules the body; call shapes above are established): `bool UjClosedSessionTarget(const SManagedTrade &t, const int barShift, double &px)` returns the closed session H/L for the trade's entry session once that session has closed (barTime session != entry session), in-direction extreme only, EMPTY when none. Session level source: the TPCENSUS-admitted pool shapes (session buffers per EA-2477/2646). MANAGE-NEAREST governs (exit even revised-below-1R; his words).
- FIX B2 (seedbias promotion gate; 6/8 class): promotion requires a non-refused seedbias verdict. Sits at the S2 promotion edge (EA-8339; s1g_seedBiasAl decl EA-1151, set EA-8133; single-candidate machine + IDLE-gated reseed mean the eval reads its own seed).
```mql5-old-B2FULL
         if(uj_m15r && uj_m15b == uj_wantb)
           { double uj_ltfb = 0.0; int uj_ltfOk = ReadFlow(FL_BUF_LTF_BIAS, uj_ltfb, barShift) ? 1 : 0;
```
```mql5-new-B2FULL
         if(uj_m15r && uj_m15b == uj_wantb && s1g_seedBiasAl != 0)
           { double uj_ltfb = 0.0; int uj_ltfOk = ReadFlow(FL_BUF_LTF_BIAS, uj_ltfb, barShift) ? 1 : 0;
```
Plus the refused-seed kill branch (council rules kill-vs-retain; proposed fail-closed to match the refusal):
```mql5-new-B2KILL
         else if(uj_m15r && uj_m15b == uj_wantb)
           { if(InpDebugLog) PrintFormat("[SRJ-EA] S2SEEDBIAS_KILL bar=%s dir=%s poi=%s - seedbias refused, promotion killed (Fix B2)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr()); GoAbort(ABORT_SEEDBIAS_REFUSED, g_state); return; }
```
Sits after the promotion-block close (EA-8344) before the S2WAIT else. New ABORT code rides the ABORT-define family (C394-C397 region, S3-recounted). -1 (never-seeded) passes (no seed info); 0 (REJECT) kills; council rules otherwise.
- FIX S3 (contender observability + confirm-term ruling; 6/11 class): (a) print the Scomb contender evaluation (zero behavior). Sits at the Scomb site (EA-8351+; uj_sbHave/uj_sbDir/uj_sbLine/uj_sbConfC/uj_sbConfH + uj_sbTermC/uj_sbTermH shapes per the Scomb fence).
```mql5-new-S3TELEM
        if(InpDebugLog) PrintFormat("[SRJ-EA] UJSBTELEM bar=%s dir=%s have=%d sbDir=%s sbLine=%d confC=%d confH=%d termC=%s termH=%s - contender evaluation (Fix S3)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (int)uj_sbHave, DirName(uj_sbDir), uj_sbLine, (int)uj_sbConfC, (int)uj_sbConfH, uj_sbTermC, uj_sbTermH);
```
Sits inside the S3/S4-held Scomb block after the confirm pair is computed (uj_sbConfC/uj_sbConfH scope per the fence). (b) The 14:35 confirm-term calibration is RULED by council (whole IsConfirmationCandle EA-2294-2335 rides the relay + BOTHDIRS 14:30/14:35 sel=LONG rows + RETESTBOOK hits=2 + his SAME-CANDLE/VENUE words): which term refuses his bar and what replaces it. If the ruling carries exact code it folds pre-build under this same key scope; otherwise it rides v2 with the telemetry as its instrument (stated openly).
- Settled-rules audit (strategy skill SETTLED-RULES pin): R touches managed exits only (entry pipeline + S5 election untouched; S5.4 grades exits, still applicable); B2 kills pre-confirmation promotion only (S5.4/S3.3 run downstream/elsewhere; S3 block, S4 edge, S5 election untouched); S3 prints only (zero behavior). Refinement phase: narrow edits to the three named paths only.
- v1 budget (script-counted from the fenced blocks at fold battery, same convention NET per site = new minus old): R +11 (helper contract excluded - council-ruled body counted at build) / B2 +2 (condition 0 + kill branch 2) / S3 +1 (telemetry print). Total NET +14 vs v26 12202; final tree 12216. S3 recount governs at build.

## Acceptance (grade-time proofs on a future UJ 6/1-6/13 run with InpDebugLog=true pinned under the same replay configuration as RECON63/71/72/73/74 (tick model, spread, pass timing); STAGE-1 exact-diffs the edit, S1 pre-hash gates the tree digest, S3 recounts the surface, and a fail-closed outcome is a failed proof unless its finding predicate fires)

- R-venue (5 June NY LONG): UJRETARGET row at the 19:00 session-close pass (tpRef revised 160.723 toward the closed NY high 160.262); exit grade-read (touch-fill or the subsequent exit row with the revised reference).
- B-venue (6 June London SHORT): NO S2PROMOTE at the 09:25 pass (S2SEEDBIAS_KILL row instead, seedbias REJECT on record); run-wide admissions == {6/3, 6/5 x2} + 6/11 conditional (see S-venue); EU takes identical (register A1-7 structural fence).
- S-venue (11 June NY LONG): UJSBTELEM rows at S3/S4 passes (Have/ConfC/ConfH + terms, exposing the 14:35 refusal term); YIELD + LONG evidence at the 14:40 pass + entry 160.524 conditional on the Q3b predicate ruling (stated openly: telemetry firm, take conditional).
- Findings map: missing row UJ-NOEVID (predicate named); wrong-bar UJ-SIGNALBAR; extra-venue UJ-EXTRA; failed retarget UJ-NORETARGET (no UJRETARGET row at a session close with a floating trade); refused promotion taken UJ-BIASDEFY (S2PROMOTE on a seedbias-REJECT bar); S4 edge + C-silence + DUPADMIT carried.

## Run cost and novel evidence

- No run proposed (draft round; build gated on a NEW key + his run word, neither spent nor asked here). Cost when gated: build + ~50m UJ June window + grade battery; key scope per seat (one build + one UJ run; EU sibling needs its own word + key scope).
- Novel evidence vs RECON74: UJRETARGET row (no prior run revises TP), S2SEEDBIAS_KILL row (no prior run gates promotion on seedbias), UJSBTELEM rows (no prior run exposes the contender evaluation).

(End of file)
