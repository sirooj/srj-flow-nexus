# PACKET_P-UJIMPL-IMPL-2 v17 DRAFT - V329-OBJECT fold: fail-funnel completion (CLOCK/DAY rows + per-site reasons + per-pass reset) + status/annex/label/name corrections (build gated on new key + run word; nothing builds/runs/commits on this file)

Status: v17 DRAFT (v16 + V329 answers: Q1 1-1 HALT / Q2 2-0 CLEAR / R1 2-0 CLEAR (Luna+GLM tallied; Sonnet+Opus advisory zero weight; Astra silent; Correction-926 carried: V328 Q2 was 1-1 HALT, the v16 Status 2-0 withdrawn): H2b fail-funnel completion (CLOCK/DAY rows + per-site RSIZE/COMMIT reasons + per-pass reset + first-failure guard) + G2/P033/state wording + status/annex/label/name corrections; design: v17 amendments (budget +153 = carried +53 + F11 +10 (17/27) + G1 +12 (29/41) + H1 +1 (15/16) + H2a +6 + H2b-D1 +70 (H2b 85 / D1 15) + P033b +1; H2a +6 = 4 store decls + 2 fail decls (the +2 names the fail-decl subset); external-interface surface unchanged; EA-side day-high arrays are new state, S3-recounted at build); base = built tree 48EDC504/664981/12028 (v9 built); STAGE-1/S3 disciplines attach; build needs a NEW key + his run word, neither spent nor asked here).

Canonical files: Experts\SRJ_FlowNexus_EA.mq5 ONLY (fixes A-H below; HTF include + FlowLogic untouched). No new indicator buffers, no new inputs, no new handles, no EA-side mirror; EA-side day-high arrays are new state (FIX H2, S3-recounted at build).

## Authority (his words + disk + CLEAR, no invention)
- RECON71 rows (result BUILDER_RESULT_RECON71-V8-UJ.md, ledger 878): 6/3 UJMISMATCH (memo sl 159.905 via SlRefMemo vs fire sl 159.889 via ComputeSlReference, TP agreed 159.983); 6/5 S2WAIT-LTF retained 09:05/09:20/09:25/09:30/09:35/09:40/09:45 (machine enumeration P016) then R-killed 09:50 + NO_TP_TARGET at S2 16:10; 6/11 TPCENSUS #76 (bar 14:35, ref 160.524 = his entry, winner YLOH 160.587, R 1.75 PASS, promoted) + #77 (bar 14:40, winner Daily-VWAP 160.522, R 0.11 FAIL, abort from S4).
- His Rulings-J (finding USDJPY-MISSES): entry POC+VWAP confluence never targets own POI source; POC-over-VWAP hierarchy in booking; entry-bar triple (14:35 confirm, 14:40 open 160.524; 160.520 is the 14:45 open, post-entry).
- His 4-valid word (2026-09-27): four valid June trades (6/3 London LONG + 6/5 09:45 SHORT + 6/5 16:15 LONG + 6/11 14:40 LONG); the initial build got the 6/3 right, now none executes. Miss-to-fix map: 6/3 Fix A, 6/5 09:45 Fix C, 6/5 16:15 Fix D, 6/11 Fix B.
- Cited-build diff (RECON63 A82F15E7 vs RECON71, same 09:05 bar, diffed before diagnosis): SIGNAL identical both trees (R 1.35, SL 159.889, TP 159.983 YASH); old MTSNAP sl 159.889 TOOK (TP win); v8 guard killed on memo sl 159.905 (SlRefMemo: ext1 never applied behind dormant InpAdoptExt1) vs fire sl 159.889 (ext1Take applied); SLEXT43 agree=1 (memoExt1 = freshExt1 = 159.889); ladder rungs r0 159.905 R2.25 / r1 159.889 R1.35. Regression class: v8's own cross-check vs pre-existing ext1Take asymmetry. Fix A restores parity (latch fire locals = 159.889).
- 16:05 five-line rows (TPCENSUS #27: winner NONE, admitted PDH:65 NYH:253 PMH:23 YNYH:19 YPMH:23; SWEPTMASK: PDH swept, NYH live, PMH swept, YNYH/YPMH swept) -> NO_TP_TARGET at S2 16:10. (RECON71 rows per P008 framing).
- 6/5am M15 series (machine-checked UJPROBE votes: m15=-1.0 SHORT-aligned at eval 09:05/09:10/09:15, +1.0 opposed at 09:20/09:25, -1.0 aligned at 09:30/09:35, +1.0 opposed at 09:40/09:45; ltf=+1.0 opposed throughout; CONFIRMPOLL confirm=1 first at eval-09:40) -> Fix C path (first S2 evaluation at the 09:10 pass promotes on the 09:05-signal vote, confirm 09:40, fire 09:45). Buffer definition on disk: FL SetIndexBuffer(21, g_bufHtfLo) at FL-705; vote encoding Bull 1.0 / Bear -1.0 / else 0.0 at FL-1200; M15 slot fixed at F251.
- His NEAREST-ONLY-TP pin (strategy skill 2026-09-25): pool never empty, book nearest, refuse ONLY below 1R (6/5 16:05 instance) -> Fix D executes it. Scope: empty-election-only (a present masked winner means the fallback never runs).
- Design CLEAR lineage carried (IMPL-1 v8 2-0 CONFIRM; E1/E2 + IE1-IE10B untouched by this packet except the narrow E2 census-naming exception at B3, stated above; v8 built tree was the v9 base; v9 built tree 48EDC504/664981/12028 is the v10 base).
- S2 census (RECON71 journal, machine-counted same turn + full S2WAIT enumeration, 54 rows): the SHORT/Daily-POC/LONDON candidate printed S2WAIT at 09:05/09:20/09:25/09:30/09:35/09:40/09:45 only (no 09:00/09:10/09:15: not in S2 those passes; S2WAIT prints every LTF-opposed S2 pass and ltf is opposed at every 6/5am probe); first S2 evaluation at the 09:10 pass (eval 09:05, m15=-1.0 == SHORT want) fires Fix C immediately, so promotion lands 09:05-signal; R19-R22 fence the pre-trigger series; R06/R14/R18 are post-promotion telemetry in the fixed run; CONFIRMPOLL series confirm=0 from eval-09:05 through eval-09:35, first-1 at eval-09:40 (fire preserved 09:45). UJPROBE prints unconditionally every new bar (EA 11963). (Run labels: S2WAIT enumeration = RECON71 rows; promotion pins R29-R31 = RECON72 rows across v323+ relays.) CONFIRMPOLL cross-run drift flagged (not a defect): P016 RECON71 confirm=0 eval-09:05 through eval-09:35 first-1 eval-09:40 vs R32 RECON72 confirm=1 eval-09:15 same key; the field is state-sensitive across trees (P462 CONFIRMPOLL-as-classification covers semantics).
- Touch setters (two, both disk-read): leg path EA 8940-8946 (no print in v8; touch located at s52_shift) + opposite-dir path EA 8961-8967 (E print; the test reads the evaluated barShift OHLC, so the physical touch IS barShift); after E2 both print evalBar+touchBar+dir+anchor, correlation key dir+anchor+touchBar with evalBar inside the candidate S3 window.
- 6/11 S2 series (machine-checked same turn): LONG/Daily-POC/NYAM S2WAIT at eval 14:20/14:25/14:30 only (10:45 is SHORT/LONDON, different key); m15=+1.0 == LONG want at all three; first in-S2 evaluation at the 14:25 pass promotes at 14:20-signal (R23/R24/R25 fence the trigger; R15/R16 post-promotion telemetry/witness). (RECON71 rows; RECON72 promotion pins R37/R38 in rows across v323+ relays.)
- FindLegTouch premise (EA-6692-6722 function span, disk-read; EA-6663-6691 is caller-side print/comment context): scans s from barShift over the passed zone bounds, tests oppositeDir && (!fromFvg || touchesZone) with touchesZone = (sh >= zLo && sl <= zHi); a found shift with fromFvg true PROVES geometric intersection, with fromFvg false proves the setter ran only. This is the entire basis for zoneTouch.
- FL HTF enum EA-side precedent: ReadFlow(FL_BUF_HTF_LOW, m15var, barShift) call shape at EA-8783/8934 (S2-adjacent) plus 2318/4052/6910/8111; the Fix-C constant/signature rides established call shapes, compile fail-closed stands.
- Full UpdateBest body now in companion (C2379-C2402 replacing the close-only pull): EMPTY_VALUE/in-direction/zone guards on-page for the D1 premise.
- Call signatures on record: SrjUjAssert1R defined EA-11768, UjDbl defined EA-11750; barShift in scope at the touch book (used EA 8942/8966). Compile fail-closed stands.
- Settled-rules audit for Fix C (strategy skill SETTLED-RULES pin): the S2 promotion edge feeds S3 unchanged - S5.4 is a standing GRADING rule (finding RETEST-INVALIDATION-V1 section 5), not an implemented guard on this tree (ABORT_ census: zero body-break kill); S3.3 flip-kill, zone/confirmation guards run downstream of the edge untouched (S3 block, S4 edge, S5 election); the edge changes WHEN S3 is entered on M15-aligned passes, never what S3 checks. The M5 path is byte-unchanged (refine-only).
- Base tree was 14C7476C/660687/11975 (v8 built; v9 base; alert-only stands).
- RECON72 rows (result BUILDER_RESULT_RECON72-V9-UJ.md 2499FB87/10374/70, ledger 902; v9 tree 48EDC504/664981/12028; DONE=PASSED 2026-09-27 22:42:43; segment 06_HANDOFFS\RECON72-V9-UJ_JOURNAL.log 23002 lines = ARCHIVED_LINES; gates from segment: Test passed 0:48:06, 542258 ticks, 2880 bars, deposit 10000.00, final balance 10118.27): A-SL1 PASS (3 June London USDJPY LONG, confirmation 09:05 bar, entry 09:10 open 159.929, SL 159.889, TP 159.983, fire R1.35, TP_TOUCH 09:55 +118.27; S5.4/S3.3 audit clean); three misses each with death rows (A-S2P UJ-NOADMIT+UJ-NOPROMO; A-POIV UJ-NOTOUCH+UJ-NOPROMO; A-FB UJ-NOADMIT); no UJ-EXTRA (ALERT/UJADMIT/UJMEMO_PASS/MTSNAP each 1x run-wide).
- A-S2P death chain (5 June London USDJPY SHORT, Daily-POC line; owed confirmation 09:40 bar, entry 09:45 open): S2PROMOTE_M15 at 09:05 + 09:15 + 09:30 bars same key (S2WAIT 0 rows at/bar<=09:00 on 6/5); ABORT LTF_MISALIGN at the 09:15 + 09:25 + 09:40 passes (LTFFLIP at 09:10/09:20/09:35 evals); CONFIRMPOLL confirm=1 at 09:15 bar with predicate FAIL term=A2_CLOSE_BREAK (consumed); RETESTBOOK hits=0 at 09:40 + 09:45 bars; CONFIRM_PREBIND_FAIL at 09:15 + 09:30 bars; SHADOW_CONVERT fail=LTF_MISALIGN opened 09:25 barsToConvert=3.
- A-POIV death chain (11 June New York USDJPY LONG, Daily-POC line; retest + confirmation 14:35 bar, entry 14:40 open 160.524 his number): S2PROMOTE_M15 at 14:20 + 14:30 bars; first instance ABORT LTF_MISALIGN at the 14:30 pass; second instance CONFIRMPOLL confirm=1 at 14:35 bar, S3->S4 armed at the 14:40 pass, HEADS-UP, TPCENSUS #45 YLOH 160.587 ref 160.524 UJ1R R1.75 PASS; fire refused at the 14:45 pass: CONFIRM_STRUCT_FAIL bar=14:40 term=A_OPP (no UJMEMO_PASS, no FIRE, no ADMIT); FRESHCOUNT #21-24 HOLD (fvgDead=1 adverse=1); touch census run-wide: UJTOUCHSEEN 25 rows all zoneTouch=0 (LEGTOUCH found=1 x33 all fromFvg=false; sole key row zoneTouch=0 evalBar 14:40 outside [14:20,14:35]); UJALIGN_PASS at 14:30 + 14:40 (m15=+1.0), no UJALIGN row at 14:35; CONFIRM_PREBIND 1x run-wide elsewhere with 28 FAILs; TPCENSUS #46 bar=14:40 ref=160.520 is post-entry territory (his ENTRY-BAR ruling), never selection evidence. Relay-row vs census-number namespaces: relay R45 splices census #45 and R46 splices census #20; census #46 exists (6/11 14:40 ref=160.520, segment-verified, unspliced) - R-row labels never equal census counters.
- A-FB death chain (5 June New York USDJPY LONG; owed signal 16:10 bar, entry 16:15 open 160.059 his number): 16:00 bar range 159.726-160.262 close 160.034 (S3INPLAY row; swept the session ladder same session); 16:05 election ref 160.009: TPCENSUS #20 winner YNYH 160.028 distPts=19, UJFBPOOL pool PDH:65 NYH:253 PMH:23 YNYH:19 YPMH:23, TPFALLBACK tp=160.028 src=YNYH, UJ1R POLL R0.15 FAIL; ABORT SUB_1R at the 16:10 pass (S2POLL gate); RETESTBOOK hits=0 at 16:10 + 16:15 bars; TPCENSUS 0 rows at 16:10/16:15 (no entry-time election); UJFBPOOL 0 rows on 6/3 (fallback never ran for A-SL1); 160.72x absent run-wide (0/0/0 triple-pattern); his line April-30 previous-day high 160.723 (his A2/A4: valid nearest, any age; reads R~3.7 at entry-open);.
- His-frame baselines for v10 (AGENTS HIS-FRAME-FIRST; strategy pins named, no new words from him): 6/5 09:45 SHORT governed by R-AT-OPEN + STRUCTURAL-BIAS (5m flips first, 15m confirms at the entry candle) + TIMING-N/N+1 + CONFIRM-ONCE; 6/11 14:40 LONG governed by CONFIRM-ONCE + VENUE-CORRECTION + SAME-CANDLE + A3 FVG-irrelevance + ENTRY-BAR + OWN-SOURCE-EXCLUSION; 6/5 16:15 LONG governed by R-AT-OPEN + NEAREST-ANY-AGE + MANAGE-NEAREST (entry-vs-manage) + RETARGET-CLOSED-AM + Rulings-H.
- V323 verdicts (Luna + GLM + Sonnet-advisory filed whole 1x under V323 headers, novel inbound; Astra silent): Q1 1-1 SPLIT-HALT (GLM: relay v323 P013 series vs P355 acceptance - 09:25 hold impossible, two promotions forced, 09:45 fire-pass abort undescribed) / Q2a 0-2 HALT (Luna touch-state + GLM elided-tail no-return proof) / Q2b 1-1 SPLIT-HALT (Luna P359/P360 contradiction; GLM CONFIRM with notes) / Q3 0-2 HALT (Luna hierarchy sentence + GLM DH naming); Sonnet advisory CONFIRM/CONFIRM/CONFIRM/OBJECT zero weight; credit Luna + GLM + Sonnet-notes; NO clearance; ledger 906.
- v11 evidence closes (all machine-pulled this turn): t79_aligned declared + used inside the invariant block only (EA-7253/7254/7256 v9 pin: block-local, no downstream reader - Sonnet-A1 closed); g_touchSeen reader census 21 hits (decl/mirror/resets/prints/book-locals; NO S5/fire/managed admission predicate reads it - Luna-A1/A2 closed); arming-branch tail EA-8791-8812 carries no return (HEADS-UP if + close; the only returns before the S5 block are UJALIGN_NOMATCH + prebind-FAIL on other branches - GLM no-return proof); g_confirmFromState consumer EA-9053 (DIV-fallback S4-origin abort: cascade sets S4, shared path - Luna-A4/GLM-A12 closed); RETESTDIAG 14:35 inside=Daily-POC Daily-VWAP (anchor-line inclusion per the inside list - G2-exact input; not R64-zone intersection); HEADS-UP block EA-8803-8811 (G1 re-siting target); Task-135 SINGLETON comment EA-7347-7348 (Sonnet-Q3 exclusivity proof).
- V324 verdicts (Luna + GLM + Astra + Sonnet-advisory filed whole 1x under V324 headers, novel inbound; Luna/Sonnet/GLM re-filed ledger 914): Q1 2-1 HALT / Q2a 1-2 HALT / Q2b 1-2 HALT (corrected: GLM Q2b OBJECT per filed bytes) / Q3 2-1 HALT (Astra OBJECT all four with P-cites, no derivations; Luna all-CONFIRM with notes; GLM CONFIRM/OBJECT/OBJECT/CONFIRM; Sonnet advisory OBJECT/OBJECT/OBJECT/CONFIRM zero weight); bare-OBJECT carries halt power; credit Astra + Luna + GLM + Sonnet-notes; NO clearance.
- P033: UJALIGN lives in the S3-unbound else branch (EA-8820-8828): it runs whenever the arming-if (EA-8784) fails, because s31_inPlay recomputes per pass from zone-hit tests (EA-8365/8375/8383/8411/8427) committed by the t133 verdict at EA-8758 (init false EA-8666; BAR EA-8715; hits EA-8755; unconditional commit overwrites BAR; INPLAYCOMMIT changed= flags divergence; INPLAYCOMMIT EA-8761-8782). The earlier unconditional sentence (S4-held candidates skip it) is REPLACED by this conditional rule, never retained beside it. 09:45 path (hypothesis term): the 09:40 arming latches the zone (EA-8786-8788) and the 09:45 pass evaluates the 09:40 confirmation bar, which still intersects the zone, so the t133 BAR test (EA-8715, mirroring the legacy BAR test EA-8374 on the same evaluated bar and zone) sets s31_inPlay and the arming-if holds and the arming-if holding skips UJALIGN (the cascade fires only on M15-agree; it is not the skip mechanism); row-proof of the 09:45 arming-takes is absent in BASE (no UJ-series row there), hence hypothesis (haveFvg/haveXob persistence unproven). Fallback if council still OBJECTs: gate UJALIGN to ST_S3_ZONE_WAIT (code, stated now so the next round needs no new design). PREBIND 1x-vs-28 counts are BASE observations on the v9 tree, not bounds on the cascade branch.
- P033b (V329 closeouts, disk-read this turn): state-at-each-pass (Sonnet-Q2-1 answered structurally): P462 carries S4-armed-at-09:40 while the arming-if evaluation runs only for candidates evaluated in the S3 arming branch - a 09:45 pass with the candidate S4-held takes the S4-to-S5 edge (EA-8990-9002) and never reaches the arming-if; BASE carries no LogState row run-wide (segment 0x, two patterns) and no S3-state row at the 09:40/09:45 passes, so the grade battery asserts the fixed tree's 09:45-pass state from its rows before any 09:45-path credit; the 09:45 path stays full-hypothesis (state + mechanism). BAR display (Sonnet-Q2-2/GLM-Q2-A1/Luna-limitation closed): EA-8714/8715 sit inside if(s3_haveStop) (EA-8709): the BAR setter sets t133_inPlay=true via="BAR" on zone touch; applied-gated context (GLM-Q2-A3 stated: t133_applied/t133_bounded EA-8664-8665, commit EA-8758 inside the same if-block closing EA-8756): P033's 'unconditional' reads as unconditioned-on-BAR-outcome within the applied gate. P033-fallback retained verbatim (Opus-A4 noted, moot under CONFIRM-majority, zero behavioral surface).

## Edit set (exact anchors; STAGE-1 exact-diffs each; convention: NET per site = NEW-block lines minus OLD-block lines; S3 recount governs)
- FIX A (SL-doctrine truce; 6/3 cited diff): the guard enforces memo-liveness + candidate identity; value-equality retired (disk proves two live SL doctrines: ladder-today memo 159.905 vs ext-1-applied fire 159.889; equality unmeetable when ext1Take fires). Latch consumes fire locals (parity with the cited take: sl 159.889); S5 election + SL stay; memo stays evidence + liveness for the S1-cascade fallback. Order documented: A4 runs before the liveness check, so sub-1R-with-stale-memo aborts SUB_1R first by construction. Memo doctrine (answers Luna 3 structurally): the memo is evidence + liveness keyed by anchor/dir, never proof of the admitted tuple; A9 binds admission provenance fire-side. Ordering proof (all disk-read): OnTick memo-clear EA-11962, probe EA-11963, entry pipeline EA-11964 (election->memo->fire->admit inline), managed loop EA-11969 post-admission; census uses locals (no UpdateBest call in the census region; base-tree sites 2488/2495/2503/11349/11356/11367 plus the D1 fallback site post-edit as seventh); no UpdateBest runs between the fire election and the A9b snapshot in the admission pass (Compute/D1 precede it inline; Mt sites run post-admission in EvaluateManagedTrade per the OnTick order and cannot interleave).
```mql5-old-A3
         if(uj_memo_anchor != g_anchorLine || uj_memo_dir != (int)g_dir || uj_memo_tp != tpTarget || uj_memo_sl != slRef)
           { if(InpDebugLog) PrintFormat("[SRJ-EA] UJMISMATCH bar=%s memo_tp=%s memo_sl=%s fire_tp=%s fire_sl=%s memo_src=%s", uj_bk9, DoubleToString(uj_memo_tp, _Digits), DoubleToString(uj_memo_sl, _Digits), DoubleToString(tpTarget, _Digits), DoubleToString(slRef, _Digits), uj_memo_src); GoAbort(ABORT_MEMO_MISMATCH, g_state); return; }
```mql5-new-A3
         if(uj_memo_anchor != g_anchorLine || uj_memo_dir != (int)g_dir)
           { if(InpDebugLog) PrintFormat("[SRJ-EA] UJMEMO_FAIL bar=%s reason=IDENTITY src=%s", uj_bk9, uj_memo_src); GoAbort(ABORT_MEMO_IDENTITY, g_state); return; }
```
```mql5-new-A8
#define ABORT_MEMO_IDENTITY  "MEMO_IDENTITY"
```
A8 sits beside the other ABORT defines (C394-C397 region): separates the identity abort from the liveness abort (reason field already distinguished them; codes now do too).
```mql5-new-A4
         double uj_frisk = 0.0, uj_freward = 0.0;
         if(!SrjUjAssert1R(currentPrice, slRef, tpTarget, uj_bk9, "FIRE", uj_frisk, uj_freward, uj_fireR))
           { GoAbort(ABORT_SUB_1R, g_state); return; }
```
A4 sits immediately after the uj_bk9 definition line, before the NO_MEMO check (same block scope): 1R enforced on the exact fire-local tuple, so a passing memo R never certifies a failing latched R (fire-time tp divergence backstopped by A4 economics + A9 provenance; memo R stays evidence). Order documented: A4 runs before the liveness check, so sub-1R-with-stale-memo aborts SUB_1R first by construction.
```mql5-new-A6
      double uj_fireR = -1.0;
```
A6 sits immediately before the guard-block opening brace (function scope, visible at the latch): carries the fire-local R to the admission tuple.
```mql5-old-A7
         PrintFormat("[SRJ-EA] UJADMIT bar_key=%s trade_seq=%I64d admit_bar=%s entry=%s sl=%s tp=%s R=%.2f poolGen=%d wsrc=%s wday=%s wage=%d", uj_abk, g_mtrade.uj_tradeSeq, TimeToString(barTime, TIME_DATE|TIME_MINUTES), DoubleToString(currentPrice, _Digits), DoubleToString(slRef, _Digits), DoubleToString(tpTarget, _Digits), uj_memo_R, uj_memo_wgen, uj_memo_wsrc, uj_memo_wday, uj_memo_wage);
```mql5-new-A7
         PrintFormat("[SRJ-EA] UJADMIT bar_key=%s trade_seq=%I64d admit_bar=%s entry=%s sl=%s tp=%s R=%.2f poolGen=%d wsrc=%s wday=%s wage=%d", uj_abk, g_mtrade.uj_tradeSeq, TimeToString(barTime, TIME_DATE|TIME_MINUTES), DoubleToString(currentPrice, _Digits), DoubleToString(slRef, _Digits), DoubleToString(tpTarget, _Digits), uj_fireR, uj_fireWgen, uj_fireWsrc, uj_fireWday, uj_fireWage);
```
A7 swaps the UJADMIT R field to the fire-local R and the provenance fields to the fire-side snapshot (single UJADMIT line; MTSNAP carries no R field): invariant UJADMIT == fire tuple (entry/sl/tp already fire locals; R + provenance now too). UJMEMO_PASS keeps memo R + memo provenance as evidence only.
```mql5-new-A9a
      string uj_fireWsrc = "";
      string uj_fireWday = "";
      int    uj_fireWgen = -1;
      int    uj_fireWage = -1;
```
A9a sits beside A6 (same function scope, visible at the latch): fire-side provenance carriers.
```mql5-new-A9b
         uj_fireWsrc = uj_winnerSource; uj_fireWday = uj_winnerDayKey;
         uj_fireWgen = uj_winnerPoolGen; uj_fireWage = UjDayDiff(barTime, uj_winnerDayKey);
```
A9b sits immediately after uj_admitCount++ (EA 10475), before the UJADMIT block brace (EA 10478): snapshots the live election provenance at admission; by the OnTick ordering proof above this is the fire election's winner in both the Compute path and the D-fallback path (a fallback winner IS the fire winner). Answers Astra #1 structurally: no memo/fire split can publish, and SL equality stays retired.
```mql5-old-A5
      //--- [P-UJIMPL-IMPL-1 v8 IE9] fire-edge memo guard (candidate identity +
      //--- value equality; cross-check tuple on pass).
```mql5-new-A5
      //--- [P-UJIMPL-IMPL-2 v4 Fix A] fire-edge memo guard (liveness + identity;
      //--- admitted tuple validated by the FIRE 1R gate below, evidenced by MTSNAP).
```
Plus: retire the ABORT_MEMO_MISMATCH define (one line at EA 396; STAGE-1 greps its uses, sole use at the retired guard line, and compile proves the retirement). UJMEMO_PASS print unchanged (memo tuple + memo provenance stay evidence-only). The 1R assertions at both memo-write points stay (single-sourced arithmetic stands).
- FIX B (POI own-source exclusion + hierarchy; 6/11 rows + his ruling): helper after the TpTargetUpdateBest closing brace (head ~2379, close C2402).
```mql5-new-B0
bool UjPoiTargetValid(int k, int anchor)
  {
   if(k == anchor) return false;
   string ak = ((anchor >= 0 && anchor < POI_NLINES) ? g_lineCode[anchor] : "");
   string ck = g_lineCode[k];
   int ap = StringFind(ak, "-"), cp = StringFind(ck, "-");
   if(ap < 0 || cp < 0) return true;
   if(StringSubstr(ak, 0, ap) != StringSubstr(ck, 0, cp)) return true;
   if(StringSubstr(ak, ap + 1) == "POC" && StringSubstr(ck, cp + 1) == "VWAP") return false;
   return true;
  }
```
Call-site inserts (each: gated skip print + unconditional continue; the helper is an ADDITIONAL gate, the existing rank filter stays untouched at every site).
```mql5-new-B1
   if(!UjPoiTargetValid(kf, g_anchorLine))
     { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[kf], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
```mql5-new-B2
   if(!UjPoiTargetValid(k, g_mtrade.anchorLine))
     { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[k], (g_mtrade.anchorLine >= 0 ? g_lineCode[g_mtrade.anchorLine] : "none")); continue; }
```mql5-new-B3
   if(!UjPoiTargetValid(k2, g_anchorLine))
     { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[k2], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
```
B1 sits first in the Compute POI loop (EA 2498-region); B2 sits in the Mt POI loop (EA 11361-region) AFTER the C11363-C11364 anchor/rank skip and BEFORE `double v` (C11365), testing the managed anchor (global anchor diverges from the managed anchor during management); B3 first in the census POI loop (EA 2559-region, print-only coherence: explicitly OVERRIDES the E2 anchor-naming path there, the anchor no longer appears with "*" nor "(ANCHOR)"). Placement is load-bearing: the C11363-C11364 skip removes anchors (and higher-rank lines) before B2 runs, so B2's anchor arm is dead by construction and no UJPOISKIP-anchor rows occur on managing passes; same-family VWAP lines reach B2 and print normally as helper-execution proof (positive-only). The arm text is retained for helper uniformity across B1/B2/B3 (B1/B3 have no pre-existing anchor-exclusion skip; their helper calls precede their rank skips at C2500/C2561). Reorder/removal declined with cause (relocates deadness + noise; breaks B1/B3).
```mql5-old-B3b
            admitted += g_lineCode[k2] +
                        ((k2 == g_anchorLine) ? "*" : "") + ":" +
                        DoubleToString(MathAbs(pv - currentPrice) / _Point, 0) + " ";
            if(haveBest && pv == best)
               winner = g_lineCode[k2] + ((k2 == g_anchorLine) ? "(ANCHOR)" : "");
```mql5-new-B3b
            admitted += g_lineCode[k2] + ":" +
                        DoubleToString(MathAbs(pv - currentPrice) / _Point, 0) + " ";
            if(haveBest && pv == best)
               winner = g_lineCode[k2];
```mql5-old-B3c
   //--- [P-TP-FAMILYPASS E2 2026-09-17, print-only] census second loop ADMITS
   //--- the anchor (rank filter unchanged) so an anchor win is nameable;
   //--- behavior unchanged, gates read winner reliably.
```mql5-new-B3c
    //--- [P-TP-FAMILYPASS E2 2026-09-17, print-only, OVERRIDDEN by IMPL-2 Fix B:
    //--- the helper skips the anchor + same-family VWAP first:
    //--- anchor wins are excluded from the Compute POI election (B1) and from the POI census (B3); no anchor win survives to be named.]
```
Anchor exclusion (k == anchor) is deliberate: without it Daily-POC at 3pts in-direction wins the nearest race at R~0.14 and the 6/11 venue dies again. Exclusion is one-directional (anchor-POC blocks same-family VWAP; a VWAP-anchored entry may still book family POC) per his hierarchy reading. String version stands (readability; enum pairing already evidenced at the call sites; arithmetic alternative declined with cause). Rank-parity alternative recorded for a future audit: string matching fails OPEN on a lineCode rename (a renamed Daily-POC silently passes as a valid target); rank parity (same family via g_authorityRank/2, anchor rank even + candidate rank odd) ties to the enum ordering. No change this round.
- FIX C (S2/M15 promotion edge; 6/5 rows): restructure the !aligned block (EA 8195-8196) so M15-confirmed alignment promotes instead of retaining.
```mql5-old-C
      if(!aligned)
        { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
```mql5-new-C
      if(!aligned)
        {
         double uj_m15b = 0.0;
         bool uj_m15r = ReadFlow(FL_BUF_HTF_LOW, uj_m15b, barShift);
         double uj_wantb = (g_dir == DIR_LONG ? 1.0 : -1.0);
         if(uj_m15r && uj_m15b == uj_wantb)
           { double uj_ltfb = 0.0; int uj_ltfOk = ReadFlow(FL_BUF_LTF_BIAS, uj_ltfb, barShift) ? 1 : 0;
             int uj_m15s = (int)iTime(_Symbol, PERIOD_CURRENT, barShift);
             datetime uj_m15src = (datetime)(uj_m15s - uj_m15s % 900);
             if(InpDebugLog) PrintFormat("[SRJ-EA] S2PROMOTE_M15 bar=%s dir=%s poi=%s sess=%s m15=%s m15src=%s ltf=%s rf=%d/%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry), DoubleToString(uj_m15b, 1), TimeToString(uj_m15src, TIME_DATE|TIME_MINUTES), UjDbl(uj_ltfb), (uj_m15r ? 1 : 0), uj_ltfOk); }
         else
           { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
        }
```
- FIX D (SUPERSEDED v10 by FIX H2 below - its fence is retained as H2b's removal target; NEAREST-ONLY-TP pin + empty-election-only scope unchanged): when the masked walk finds nothing, re-walk the session lines mask-off and book the nearest in-direction line (zone + in-direction still apply via UpdateBest); the 1R gate (not emptiness) decides. Sits after the Compute POI loop close, before the TASK-23 census comment (so the census names the fallback winner). Truly-empty still falls to NO_TP_TARGET.
```mql5-new-D1
if(!haveBest)
  {
   string uj_fbpool = "";
   for(int i = 0; i < ArraySize(sessbufs); i++)
     {
      double dv = 0.0;
      if(!ReadFlow(sessbufs[i], dv, barShift)) continue;
      bool uj_inD = (dir == DIR_LONG) ? (dv > currentPrice) : (dv < currentPrice);
      if(uj_inD) uj_fbpool += sname[i] + ":" + DoubleToString(MathAbs(dv - currentPrice) / _Point, 0) + " ";
      TpTargetUpdateBest(dv, dir, currentPrice, best, haveBest, sname[i], uj_dk, -1);
     }
   if(haveBest && InpDebugLog)
     { PrintFormat("[SRJ-EA] UJFBPOOL bar=%s dir=%s pool=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(dir), uj_fbpool);
       PrintFormat("[SRJ-EA] TPFALLBACK bar=%s dir=%s tp=%s distPts=%s src=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(dir), DoubleToString(best, _Digits), DoubleToString(MathAbs(best - currentPrice) / _Point, 0), uj_winnerSource); }
  }
```
Walk order session, then pool, then POI (existing); uj_fbpool is the pre-zone in-direction candidate list (NOT the post-zone eligible pool; post-zone eligibility is evidenced by the TPFALLBACK tp/src pair); zone enforced inside UpdateBest, same call; the 1R gate (not emptiness) decides downstream. Pool walk (EA 2492-2496) is consumable-gated, never mask-filtered: a consumable pool line already contests the masked election, so the mask-off fallback re-walks session lines only; no pool fallback exists nor is one needed.
Managed-side retarget deliberately untouched (admission-scoped per his pin; future round if rows demand).
- FIX E (touch-transition prints; 6/11 touch gap): print-only evidence for the touch prerequisite (no behavior change). Two setters print the identical row shape: the opposite-dir setter (E) and the leg-touch setter at EA 8940-8946 (E2). barShift is in scope at both (used EA 8942/8966); g_anchorLine is global. The anchor field joins the candidate key for grade-time correlation: direction + anchor + physical touchBar, with evalBar inside the admitted candidate's evidenced S3-active window (P181 rule as filed in the v9 relays; substance stated here). v16 pin: v9-tree setter sites EA 8940-8946 (leg) + EA 8961-8967 (E), LEGTOUCH census EA 8947-8960 (disk-read this turn; older numbers superseded).
```mql5-old-E
         if(oppositeDir && (!s35_fromFvg || touchesZone))
           { g_touchSeen = true; g_touchBarHi = h; g_touchBarLo = l; }
```mql5-new-E
         if(oppositeDir && (!s35_fromFvg || touchesZone))
           { if(InpDebugLog) PrintFormat("[SRJ-EA] UJTOUCHSEEN evalBar=%s touchBar=%s dir=%s anchor=%s zoneTouch=%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none"), (touchesZone ? 1 : 0)); g_touchSeen = true; g_touchBarHi = h; g_touchBarLo = l; }
```
```mql5-old-E2
      if(s52_found && !g_touchSeen)
        {
         g_touchSeen  = true;
```mql5-new-E2
      if(s52_found && !g_touchSeen)
        {
         if(InpDebugLog) PrintFormat("[SRJ-EA] UJTOUCHSEEN evalBar=%s touchBar=%s dir=%s anchor=%s zoneTouch=%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), TimeToString(iTime(_Symbol, PERIOD_CURRENT, s52_shift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none"), (s35_fromFvg ? 1 : 0));
         g_touchSeen  = true;
```
E2 inserts the transition print at the leg-touch setter (EA 8940-8946 v9 pin; fence shape carried; block remainder shared, outside the fence): every touch set now prints evalBar (firing pass) + touchBar (physical candle: s52_shift here, barShift at the E setter where the test reads the evaluated OHLC), so row-presence == setter-fired and touchBar == the setter-accepted candle; zoneTouch classifies geometry at source (1 where the setter rule required zone intersection: leg path with s35_fromFvg true, since FindLegTouch scans the passed zone bounds per its predicate EA-6692-6722 (oppositeDir EA-6716, touchesZone EA-6717); E setter with touchesZone true. 0 where the setter fired without geometric proof). The E branch without touchesZone when s35_fromFvg is false accepts without independently proving geometric zone intersection - the field says so instead of hiding it; the v5 progression alternative is WITHDRAWN as redundant. E print intentionally passes the same iTime(barShift) for evalBar and touchBar (at this setter the physical touch IS the evaluated bar per the paragraph above); do not 'fix' the duplication. E sits in the touch book (EA 8940-8971 span): the touch-vs-retest rule question itself goes to council visibly (quoted gap + rows, ruled by name), never decided here. v16 pin: E2 leg-setter EA 8940-8946 (print L8942, set L8943)
- FIX F (M15-governed LTF hold for the 5 June London + 11 June New York USDJPY venues; 6/5 + 6/11 ABORT rows + his STRUCTURAL-BIAS rule): the post-S2 LTF direction invariant (EA 7245-7305, v9 tree 48EDC504) aborts candidates reaching the invariant 1-2 bars after promotion, before the confirmation bar (broad mechanism as shown; not M15-promotion-scoped) (RECON72: ABORT LTF_MISALIGN at the 6/5 09:15 + 09:25 + 09:40 passes and the 6/11 14:30 pass, each preceded by LTFFLIP at the prior evaluation; the invariant fires first on the bar AFTER alignment was confirmed, EA-7222 v9 pin). His rule (strategy STRUCTURAL-BIAS + Rulings-D, 5 June 09:45 instance): the 5m structural bias flips first and the 15m bias confirms at the entry candle - the 15m flip ENABLES the bias. Refined rule carried: the enabling timeframe governs - a 5m flip alone no longer kills a candidate the 15m vote still supports; with readable opposed LTF, abort only when M15 agreement is absent and the confirmation predicate fails (F11 carve-out supersedes the older unconditional form; carve-out deliberately wider than M15-gated reads: predicate-gated holds need no readable M15). Stateless re-read at the invariant (no latch added); S2 entry gate (FIX C block EA-8219-8240 v9 pin + LTF-align check) byte-unchanged; SESSION_CLOSED ordering, freshness poll, memo/1R/fire, zone guards all unchanged; S5.4 has no code path on this tree (ABORT_ census this turn: 20 distinct reasons, zero body-break kill) so the hold weakens nothing built. The EA 7245-7304 invariant IS the tree's S3.3 flip-kill implementation being refined here; refinement authority is STRUCTURAL-BIAS + Rulings-D.
```mql5-old-F
            PrintFormat("[SRJ-EA] LTFDIAG bar=%s dir=%s state=%s kind=%s "
                        "ok0=%d bias0=%d ob0=%d fvg0=%d opp0=%d "
                        "ok1=%d bias1=%d ob1=%d fvg1=%d opp1=%d",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                     TIME_DATE|TIME_MINUTES),
                        DirName(g_dir), StateName(g_state),
                        (t81_weak ? "WEAK" : (t81_k1 ? "STRONG" : "UNKNOWN")),
                        (int)t81_k0, (int)MathRound(t81_bi0),
                        (int)MathRound(t81_ob0), (int)MathRound(t81_fv0),
                        (int)MathRound(t81_op0),
                        (int)t81_k1, (int)MathRound(t81_bi1),
                        (int)MathRound(t81_ob1), (int)MathRound(t81_fv1),
                        (int)MathRound(t81_op1));
           }
         GoAbort(ABORT_LTF_MISALIGN, g_state);
         return;
        }
```
```mql5-new-F
          PrintFormat("[SRJ-EA] LTFDIAG bar=%s dir=%s state=%s kind=%s "
                         "ok0=%d bias0=%d ob0=%d fvg0=%d opp0=%d "
                         "ok1=%d bias1=%d ob1=%d fvg1=%d opp1=%d",
                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                      TIME_DATE|TIME_MINUTES),
                         DirName(g_dir), StateName(g_state),
                         (t81_weak ? "WEAK" : (t81_k1 ? "STRONG" : "UNKNOWN")),
                         (int)t81_k0, (int)MathRound(t81_bi0),
                         (int)MathRound(t81_ob0), (int)MathRound(t81_fv0),
                         (int)MathRound(t81_op0),
                         (int)t81_k1, (int)MathRound(t81_bi1),
                         (int)MathRound(t81_ob1), (int)MathRound(t81_fv1),
                         (int)MathRound(t81_op1));
            }
          double uj_hm15 = 0.0;
          bool uj_hm15r = ReadFlow(FL_BUF_HTF_LOW, uj_hm15, barShift);
          double uj_hwant = (g_dir == DIR_LONG ? 1.0 : -1.0);
          string uj_hterm = "";
          bool uj_hcarve = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_hterm);
          if((uj_hm15r && uj_hm15 == uj_hwant) || uj_hcarve)
            { if(InpDebugLog) PrintFormat("[SRJ-EA] UJLTFHOLD bar=%s dir=%s poi=%s state=%s m15=%s rf=%d mode=%s term=%s - LTF opposed, hold (Fix F11)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), StateName(g_state), DoubleToString(uj_hm15, 1), (uj_hm15r ? 1 : 0), ((uj_hm15r && uj_hm15 == uj_hwant) ? "M15" : "CARVE"), uj_hterm); }
          else
            {
             GoAbort(ABORT_LTF_MISALIGN, g_state);
             return;
            }
         }
```
Sits inside the !t79_aligned branch after the LTFDIAG PrintFormat close (EA 7301 v9 pin), replacing the unconditional GoAbort (EA 7303 with return EA 7304): agree-hold with UJLTFHOLD telemetry, else abort byte-identical. MQL5 audit: double/bool/string literals + ReadFlow/FL_BUF_HTF_LOW/DoubleToString/TimeToString/iTime/DirName/AnchorStr/StateName/PrintFormat/InpDebugLog/GoAbort all established call shapes (FIX C block EA-8226-8233 v9 pin rides the identical shapes); bool-to-int for the print field per quirks; new names uj_hm15/uj_hm15r/uj_hwant/uj_hterm/uj_hcarve 0 hits pre-edit (name census at battery). v11 carve-out (GLM Analytic-B option 1 adopted; Luna-A3/A4 closed here): the hold fires on M15-agree OR a passing confirmation on the evaluated bar (IsConfirmationCandle 4-arg shape EA-8842/8991 v9 pins; pure test, term out-param only); the UJLTFHOLD row carries mode=M15 vs mode=CARVE plus the predicate term, so the two hold kinds grade separately. Semantic-buffer pin: FL_BUF_HTF_LOW is the enabling 15m vote per the FIX-C buffer definition (FL-705 SetIndexBuffer + FL-1200 vote encoding, carried v9 authority). t79 locality: t79_aligned is declared + used inside the invariant block only (EA-7253/7254/7256 v9 pin: block-local, no downstream reader - the HELD path needs no flag fix). Takes check (Rule-vs-takes, pre-draft): 6/3 LONG path carries 0 ABORT/LTFFLIP rows (window rows on file) - unaffected; EU takes are fenced at grade (A-EU-PRESERVE entry-bar compare + blocking rule; kill-relaxation adds admissions via fire PASS (hypothesis; the EU battery proves)); new falses ride the grade battery with C-silence (register section C). Interaction F x G: the hold keeps candidates alive across passes; the G1 cascade fires them - separated by site (invariant vs arming edge), scoped jointly in acceptance. Scope disclaimer (non-covered siblings): S2 entry alignment, SESSION_CLOSED attribution, freshness-poll verdicts, memo/1R/fire gates, zone guards, pre-S3 states, S5.4-absent. Retained LTFDIAG lines carry normalized indents (STAGE-1 shows whitespace churn on those lines beside the insert).
- FIX G1 (same-pass arm-and-fire cascade for the 11 June New York USDJPY venue; 6/11 STRUCT_FAIL row + his SAME-CANDLE + CONFIRM-ONCE rules): architecture proof (RECON72 rows): S3->S4 arming consumes the pass (S3->S4 + HEADS-UP at the 14:40 pass, then TPCENSUS #46 + FRESHCOUNT #21 + STRUCT_FAIL all bar=14:40 at the 14:45 pass; no STRUCT_FAIL row and no UJALIGN row at 14:35); when retest + confirmation share one bar (his SAME-CANDLE rule: 11 June 14:35 retest + confirmation, entry 14:40 open), the arming pass IS the confirmation pass and the fire pass sees a spent bar (CONFIRM_STRUCT_FAIL bar=14:40 term=A_OPP). His rule: entry stays next-bar open off the confirmation bar. Refined rule: a candidate arming S3->S4 on a bar that ALSO passes IsConfirmationCandle with M15 agreeing on the evaluated bar cascades to S5 the same pass (S5-block-same-pass precedent: prebind comment EA-8835 v9 pin); entry next open. Touch-state closure: g_touchSeen reader census 21 hits (decl/mirror/resets/prints/book-locals; NO S5/fire/managed admission predicate reads it); arming resets it false (EA-8788) so cascade passes carry false deterministically (a skip cannot stale it); g_confirmFromState consumer EA-9053 (DIV-fallback S4-origin abort) takes the cascade the shared path (equivalence stated). S5-input shift named: the cascade evaluates the arming bar, one bar earlier than BASE fire-bar evaluation (DIV/freshness kills unchanged in code, not in input). Split-bar cases unchanged by construction (predicate fails retest-only bars: 6/3 09:00 bar confirm=0 poll with no prebind row; the cascade never fires there).
```mql5-old-G1
      if((haveFvg || haveXob) && s31_inPlay)
        {
         if(haveFvg) { g_zoneHi = MathMax(fvgHi, fvgLo); g_zoneLo = MathMin(fvgHi, fvgLo); }
         else        { g_zoneHi = MathMax(xobHi, xobLo); g_zoneLo = MathMin(xobHi, xobLo); }
         g_touchSeen = false;
         ENUM_SRJ_STATE prev = g_state;
         g_state = ST_S4_ARMED;
         LogState(prev, g_state);
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] %s S3 zone: src=%s haveFvg=%d haveXob=%d "
                        "zoneLo=%s zoneHi=%s%s",
                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
                        haveFvg ? "FVG" : "XOB",
                        (int)haveFvg, (int)haveXob,
                        DoubleToString(g_zoneLo, _Digits),
                        DoubleToString(g_zoneHi, _Digits),
                        (haveFvg && haveXob)
                          ? "  <- BOTH QUALIFIED, unadjudicated precedence applied (EA-1)"
                          : "");
         if(InpAlertHeadsUp && !g_alertedArmed)
           {
            g_alertedArmed = true;
            EmitAlert("HEADS-UP",
                      StringFormat("zone %s-%s awaiting confirm",
                                   DoubleToString(g_zoneLo, _Digits),
                                   DoubleToString(g_zoneHi, _Digits)),
                      false);
           }
        }
```
```mql5-new-G1
      if((haveFvg || haveXob) && s31_inPlay)
        {
         if(haveFvg) { g_zoneHi = MathMax(fvgHi, fvgLo); g_zoneLo = MathMin(fvgHi, fvgLo); }
         else        { g_zoneHi = MathMax(xobHi, xobLo); g_zoneLo = MathMin(xobHi, xobLo); }
         g_touchSeen = false;
         ENUM_SRJ_STATE prev = g_state;
         g_state = ST_S4_ARMED;
         LogState(prev, g_state);
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] %s S3 zone: src=%s haveFvg=%d haveXob=%d "
                        "zoneLo=%s zoneHi=%s%s",
                        TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
                        haveFvg ? "FVG" : "XOB",
                        (int)haveFvg, (int)haveXob,
                        DoubleToString(g_zoneLo, _Digits),
                        DoubleToString(g_zoneHi, _Digits),
                        (haveFvg && haveXob)
                          ? "  <- BOTH QUALIFIED, unadjudicated precedence applied (EA-1)"
                          : "");
         if(InpAlertHeadsUp && !g_alertedArmed)
           {
            g_alertedArmed = true;
            EmitAlert("HEADS-UP",
                      StringFormat("zone %s-%s awaiting confirm",
                                   DoubleToString(g_zoneLo, _Digits),
                                   DoubleToString(g_zoneHi, _Digits)),
                      false);
           }
          string uj_carryTerm = "";
          double uj_carryM15 = 0.0;
          bool uj_carryR = ReadFlow(FL_BUF_HTF_LOW, uj_carryM15, barShift);
          double uj_carryWant = (g_dir == DIR_LONG ? 1.0 : -1.0);
          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm) && uj_carryR && uj_carryM15 == uj_carryWant)
            {
             if(InpDebugLog) PrintFormat("[SRJ-EA] UJCONFIRMCARRY bankBar=%s fireBar=%s dir=%s poi=%s term=%s m15=%s - same-bar retest+confirm, S4 armed and firing same pass (Fix G1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), TimeToString(iTime(_Symbol, PERIOD_CURRENT, 0), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), uj_carryTerm, DoubleToString(uj_carryM15, 1));
             ENUM_SRJ_STATE uj_cprev = g_state;
             g_confirmFromState = uj_cprev;
             g_state = ST_S5_GATE_CHECK;
             LogState(uj_cprev, g_state);
            }
        }
```
Sits spanning the whole arming branch (EA 8784-8812 v9 pin) with the cascade inserted after the HEADS-UP block close (EA 8811): predicate + M15-agree cascade with UJCONFIRMCARRY telemetry, else fall through byte-identical (log order chronological: HEADS-UP then CARRY when emitted, on cascade passes). No-return proof: the arming branch carries no return between the cascade site and the S4 block (EA 8791-8812: HEADS-UP if + close only); the only returns before the S5 block sit on other branches (UJALIGN_NOMATCH EA-8826, prebind-FAIL EA-8862); the S4 block (EA-8867) then the S5 block (EA-9006) evaluate top-down the same pass. MQL5 audit: string/double/bool/ENUM_SRJ_STATE all in-scope shapes (g_confirmFromState assigned EA-8845/8994 v9 pins; IsConfirmationCandle(barShift, anchor, dir, term&) call shape EA-8842/8991; M15 shapes FIX-C block; shift-0 forming-bar convention EA-10458 + quirks); new names uj_carryTerm/uj_carryM15/uj_carryR/uj_carryWant/uj_cprev 0 hits pre-edit (battery census). Falses-bounds: BASE observations (CONFIRM_PREBIND 1x vs 28 FAILs run-wide on the v9 tree; not bounds on the cascade branch); S5 downstream kills unchanged (DIV walk EA-9006-9054 + memo + FIRE 1R + S5 freshness poll per Task-135 comment EA-7329-7331 v9 pin); split-bar no-cascade proof (6/3 09:00-bar class); C-silence + L-final DUPADMIT check (admission consumes to MT_MANAGING). Takes check (Rule-vs-takes, pre-draft): 6/3 fully verified (retest-only arm bar fails the predicate: no prebind row, poll confirm=0 - identical path); EU same-candle takes (8/28 10:00, 9/7 16:40 per strategy SAME-CANDLE) ride the grade battery as the NAMED REMAINDER (exact risk stated: cascade may fire them one pass earlier; any moved entry-bar BLOCKS the packet per ENGINE-REFINE-KEEPS-VALID-TAKES; D74/51 row shapes cited from matrix + register, never re-derived here).
- FIX G2 (touch-evidence resolution for the 11 June New York USDJPY venue; NO code change; touch-vs-retest visible-route promise from the v9 round kept): the single route-specific predicate RETEST_CORROBORATED (all terms machine-checkable; replaces the v12 dual wording): (1) RETESTBOOK hit for same (direction, anchor) at touchBar - row schema per EA-2167: `<lineCode>:r<rank>:<dL|dS>` (code, authority rank, L=longHit/S=shortHit); a hit names the anchor code in the hits list with the direction letter (LONG requires dL, SHORT requires dS; BASE R62: Daily-POC:r10:dL at 14:35); (2) RETESTDIAG `inside` list CONTAINS that anchor at the same touchBar (containment, never equality; BASE R63: inside=Daily-POC Daily-VWAP at 14:35); (3) confirmation-verdict evidence at confirmBar - cascade venues: UJCONFIRMCARRY row correlated by (dir, anchor, bankBar == touchBar) (BASE R64 supplies associated zone bounds only (14:35 bar armed at the 14:40:22 pass, zone 160.489-160.504 matching R42 bounds); the row carries wall-time + bounds only per EA-8792-8802 with no bankBar/verdict fields, so association is same-pass ordered-trace-based, stated openly; future CARRY rows must supply bankBar=14:35 plus the verdict evidence); split-bar venues: S4-to-S5 edge pass with no CONFIRM_STRUCT_FAIL on confirmBar (stated explicitly: evidence is the observed candidate-associated S4-to-S5 transition (LogState at EA-8996 on the S4 edge; the prebind route prints LogState at EA-8847 plus CONFIRM_PREBIND at EA-8849-8852, covered as its own route below) plus no CONFIRM_STRUCT_FAIL on confirmBar plus downstream admission rows (ALERT/UJADMIT/UJMEMO_PASS at the fire pass are the positive evidence; FAIL-absence corroborates); FAIL-absence plus an admission alone never substitutes for identifying the route) with CONFIRMPOLL confirm=1 as supporting candle-classification only; (4) zone report - cascade venues: the S3-zone arming print (EA-8792-8802) via the ordered trace; split-bar venues: LEGTOUCH bounds with candidate + evaluated-bar association (BASE R42 found=0 bounds-only, explicitly NOT touch evidence; candidate association by ordered trace (direction + evaluated bar alone never establish the anchor)); (5) S3-window correlation (14:20-14:35 class) with same anchor/dir on both bars; touchBar == confirmBar on cascade venues (same-bar), hit-bar (touchBar) vs verdict-bar (confirmBar) on split-bar venues with touchBar < confirmBar in one uninterrupted episode (same anchor/dir never joins across an abort plus reseed); (6) cascade-pass touch absence as route-consistency check: zero UJTOUCHSEEN/LEGTOUCH prints expected ON the cascade evaluation pass only (touch book skipped with the S4 block), corroborating the taken route; terms 1-5 carry the proof, earlier passes rows neither satisfy terms nor invalidate; (7) any missing/ambiguous term fails UJ-NOEVID naming the term. Prebind-terms map: T4 = CONFIRM_PREBIND print (EA-8849-8852, positive verdict evidence); T5 = same-bar equality (touchBar==confirmBar on prebind takes); bound zone = the EA-8842-confirmed zone; T7 fires UJ-NOEVID naming the unmapped term. zoneTouch=1 RETIRED with reason (dual-pattern x33-fromFvg-false + 0 zoneTouch run-wide + his A3 FVG-irrelevance + FindLegTouch opposite-candle EA-6716 vs bullish confirmation bars); UJTOUCHSEEN prints UNCHANGED (setter-ran evidence, corroborating only). If council OBJECTS, the predicate is revised per the ruling (never a silent zoneTouch=1 restore). Rule statement: this standard rules retest-as-touch (RETEST_CORROBORATED proof substitutes for the retired geometric touch demand per the retirement reason above). Row legend: RETESTBOOK `bar/hits/nHits + hits-list` (EA-2171-2174); RETESTDIAG `bar/inside/nearAbove/nearBelow` (EA-2210-2215); CONFIRMPOLL `bar/anchor/dir/oppCandle/bodyDir/body/doji/touchAttr/confirm` (EA-2244-2250, shadow=true constant); LEGTOUCH `bar/dir/found/atShift/atBar/legBound/zoneLo/zoneHi/touchSeen` (EA-8948-8960); UJCONFIRMCARRY `bankBar/fireBar/dir/poi/term/m15` (G1 fence analogue below); S3-zone `wall-time/src/haveFvg/haveXob/zoneLo/zoneHi` (EA-8792-8802, no dir/anchor/bar fields). Prebind route: same-bar-in-S3 takes that PASS the prebind confirmation (EA-8842) transition S3-to-S5 (S3/prebind route, skipping the S4-to-S5 edge) with the CONFIRM_PREBIND print (EA-8849-8852) as positive verdict evidence (no FAIL-absence inference needed there). Scope note (Sonnet-Q2-3 closed on record): venue 6/11 is split-bar (retest 14:35, entry 14:40); prebind is the second mechanism on that venue (takes-sheet relay L37); the take-shape via prebind is same-bar-in-S3 (PASS at EA-8842 yields S3-to-S5); the three wordings hold at venue/route/shape scopes, never interchangeably.
- FIX H1 (poll-abort retire for the 5 June New York USDJPY venue; R-AT-OPEN authority + 16:10 ABORT row): the S2POLL 1R gate (EA 7473-7487 v9 pin) aborts SUB_1R on poll-ref (16:05 ref 160.009 vs his entry 160.059; the v8 IE7 comment claims entry-open while the code asserts poll ref - comment-code defect repaired here). Retired as an abort; UJ1R POLL print + memo write stay (telemetry + liveness). The SUB_1R verdict fires ONLY at the fire approach (FIRELOCAL EA-10419 + FIRE EA-10439 v9 pins, currentPrice ~= entry-open by the shift-0 fill convention EA-10458 + quirks; Assert1R arithmetic EA-11820-11842 fails a below-entry TP by the direction gate, so entry-side exclusion needs NO code). A4 order preserved (fire order untouched: FIRELOCAL asserts R first, then memo liveness/identity, so stale-memo still resolves SUB_1R-first where both fail).
```mql5-old-H1
      //--- [P-UJIMPL-IMPL-1 v8 IE7] 1R gate on the entry-open price + memo write
      //--- (single successful election point: TP/SL/1R pass; poll route).
        {
         double uj_risk = 0.0, uj_reward = 0.0, uj_R = 0.0;
         string uj_bk7 = TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES);
         if(!SrjUjAssert1R(currentPrice, slRef, tpTarget, uj_bk7, "POLL", uj_risk, uj_reward, uj_R))
           { GoAbort(ABORT_SUB_1R, g_state); return; }
         uj_memo_tp = tpTarget; uj_memo_sl = slRef; uj_memo_entry = currentPrice;
         uj_memo_valid = true;
         uj_memo_anchor = g_anchorLine; uj_memo_dir = (int)g_dir; uj_memo_barTime = barTime;
         uj_memo_risk = uj_risk; uj_memo_reward = uj_reward; uj_memo_R = uj_R;
         uj_memo_src = "POLL";
         uj_memo_wsrc = uj_winnerSource; uj_memo_wday = uj_winnerDayKey;
         uj_memo_wgen = uj_winnerPoolGen; uj_memo_wage = UjDayDiff(barTime, uj_winnerDayKey);
        }
```
```mql5-new-H1
      //--- [P-UJIMPL-IMPL-2 v10 Fix H1] poll verdict is telemetry + memo write
      //--- (R-AT-OPEN: the admission verdict fires ONLY at the fire approach
      //--- on entry-open ref; a poll FAIL no longer aborts).
        {
         double uj_risk = 0.0, uj_reward = 0.0, uj_R = 0.0;
         string uj_bk7 = TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES);
         if(!SrjUjAssert1R(currentPrice, slRef, tpTarget, uj_bk7, "POLL", uj_risk, uj_reward, uj_R))
           { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOLLRISK bar=%s dir=%s R=%.2f - poll-ref verdict telemetry only, admission verdict at fire (Fix H1)", uj_bk7, DirName(g_dir), uj_R); }
         uj_memo_tp = tpTarget; uj_memo_sl = slRef; uj_memo_entry = currentPrice;
         uj_memo_valid = true;
         uj_memo_anchor = g_anchorLine; uj_memo_dir = (int)g_dir; uj_memo_barTime = barTime;
         uj_memo_risk = uj_risk; uj_memo_reward = uj_reward; uj_memo_R = uj_R;
         uj_memo_src = "POLL";
         uj_memo_wsrc = uj_winnerSource; uj_memo_wday = uj_winnerDayKey;
         uj_memo_wgen = uj_winnerPoolGen; uj_memo_wage = UjDayDiff(barTime, uj_winnerDayKey);
        }
```
Sits inside the S2POLL 1R block (EA 7473-7487 v9 pin): abort lines become UJPOLLRISK telemetry plus comment swap; memo write untouched; fire order untouched. No new identifiers (print literal only).
- FIX H2 (old-high pool for the 5 June New York USDJPY venue; his commissioned solution + A4 NEAREST-ANY-AGE): the D1 mask-off SESSION re-walk (EA 2518-2532 v9 pin) is REMOVED (it re-books swept lines the masked walk rejected: TPCENSUS #20 five + SWEPTMASK 16:05 row + mask body EA-2424-2438 + v9 line-12 mask reading; the 16:00 bar 159.726-160.262 swept the ladder same session). Replaced by a back-day H/L store (day-age 2+; session pool owns age 0-1 per sname/buffers EA-2449-2462; today excluded per RETARGET-CLOSED-AM spirit; union = any age per A4 under formal hierarchy (any age is subordinate to empty-election scope: historical ages enter the race only when the masked election is empty; within the fallback race nearest wins regardless of age)): file-scope arrays (uj_memo-decl precedent EA-300-318, no static keyword) refreshed on day rollover from D1 iHigh/iLow until history exhaustion (FindLegTouch bt<=0-break precedent; no cap number; pre-sized by probe-loop count with fill by index; D1 shifts are contiguous existing bars so weekends need no gap logic); consulted ONLY inside D1 (empty-election scope preserved: 6/3 FBPOOL-0 proves unreachability at masked winners); tester history is static within a run (no mid-run growth, so day-change refresh cannot stale; live-terminal growth is out of scope, alert-only). in-direction + zone via the same UpdateBest call; winner source DH-YYYYMMDD; UJHISTPOOL census print (pool list like uj_fbpool); H2 lines carry their own day (uj_histDay) into winnerDayKey so wday/wage describe the line's day (Astra-A1 closed); refresh commits histToday only inside count>0 (empty reads stay distinguishable from exhaustion). MQL5 audit: iHigh/iLow 34 uses each; PERIOD_D1 1 use (EA-10903 v9 pin); StringSubstr/StringFind B0 shapes; UjDayKey/UjDayDiff/StringToTime called (EA-11809 UjDayKey def + EA-11815 UjDayDiff def; format proven EA-11808-11813: TIME_DATE renders YYYY.MM.DD, offsets (0,4)/(5,2)/(8,2) valid; StringToTime standard builtin inside both shapes); ArrayResize 10 uses; TimeToString/DoubleToString/_Point/ArraySize established; no new indicator buffers/inputs/handles; new state S3-recounted at build. New names (0 hits pre-edit, battery census): uj_histHi/uj_histLo/uj_histDay/uj_histToday/uj_hdayk/uj_hdayt/uj_dcount/uj_dc/uj_dct/uj_dch/uj_dcl/uj_dd/uj_n/uj_hpool/uj_hj/uj_hsrc/uj_hinD/uj_hv. v13 refresh semantics (fence below): probe into temps with per-read validation, record-day filter (recent-to-oldest running max/min), resize-checked commit with histToday assigned LAST, clear-on-fail to empty arrays, consult gated on histToday == today (failed loads consult nothing). New names v13 (0 hits pre-edit, battery census): uj_dcap/uj_tmpHi/uj_tmpLo/uj_tmpDay/uj_hok/uj_dr/uj_ds/uj_drt/uj_drh/uj_drl/uj_runM/uj_hasM/uj_fi/uj_keep/uj_kHi/uj_kLo/uj_kDay/uj_n/uj_commit/uj_ci. Swept-record rule pin: his swept-line challenge + FRESH-SWEEP govern (stale-swept lines are dead map); any-age untouched (unswept old lines stay eligible). Midnight day-key + unbounded hpool print parked (cosmetic/inert for prove windows). v14 refresh semantics (fence below): probe counts time-valid shifts (exhaustion stops, keeps prefix); fill validates time+hi+lo+order per read and ANY invalid available record fails the refresh (no truncated publish); commit resizes-checked with histToday LAST; clear-on-fail to empty arrays; consult gated on histToday == today AND witness-ok; swept eligibility per consult over the direction-independent snapshot with yesterday/today witnesses (days never target sources); equality counts as swept (touch-or-exceed); pool print on consult-run even with no winner (GLM B2 adopted), TPFALLBACK only on election. Integrity conditions established: positive, non-EMPTY, self-equal (non-NaN), high>=low, strictly decreasing D1 times (comparisons only, no new builtins). Names retired: uj_dcount/uj_dd (v12 probe counters, superseded by uj_dcap/uj_dc/uj_dr/uj_ds) plus v13-only uj_runM/uj_hasM/uj_fi/uj_keep/uj_kHi/uj_kLo/uj_kDay/uj_n (record filter moved to consult). New names v14 (0 hits pre-edit, battery census): uj_tmpT/uj_prevT/uj_hasP/uj_dok/uj_yHi/uj_yLo/uj_tHi/uj_tLo/uj_wok/uj_cRun/uj_swept. Midnight day-key still parked (inert for prove windows); dcap==0 retry counter parked (refresh prints nothing, no log cost). v14 names retired from fence code: uj_dcount/uj_dd (v12 probe counters; v13 fence uses uj_dcap/uj_dc/uj_dr/uj_ds). v15: day-key sentinel guards (uj_hdayt>0 at refresh + consult; M5-clock-dead mode cannot consult an empty store). Census-winner print-only proof (EA-2561 local, set EA-2573/2585/2600, zero gate reads outside the print; UJREELECT separate): grades never key on the census winner string. v16 authoritative names (battery census this turn): live: uj_histHi/uj_histLo/uj_histDay/uj_histToday/uj_hdayk/uj_hdayt/uj_dcap/uj_tmpHi/uj_tmpLo/uj_tmpDay/uj_hok/uj_dr/uj_ds/uj_drt/uj_drh/uj_drl/uj_histFail/uj_histWhy (+ uj_prevT/uj_hasP/uj_dok/uj_yHi/uj_yLo/uj_tHi/uj_tLo/uj_wok/uj_cRun/uj_swept carried v14); retired: uj_dcount/uj_dd (v12 probe), uj_runM/uj_hasM/uj_fi/uj_keep/uj_kHi/uj_kLo/uj_kDay/uj_n (v13 record filter), uj_tmpT (v14 temp, dropped v16); live-appended v17 (fence locals, carried): uj_dc/uj_dct/uj_commit/uj_ci/uj_hpool/uj_hj/uj_hsrc/uj_hinD/uj_hv; single-dispositions v17: uj_n = v13-new record-filter, retired v16 (never both-live); uj_dcount/uj_dd = v12-probe/v13-new, retired v14+, superseded by uj_dcap/uj_dc/uj_dr/uj_ds (one line each, never re-listed). Earlier versioned lists on this line are superseded by this paragraph.
```mql5-new-H2a
double uj_histHi[];
double uj_histLo[];
string uj_histDay[];
datetime uj_histToday = 0;
bool uj_histFail = false;
string uj_histWhy = "";
```
H2a sits beside the uj_memo declarations (EA-300-318 v9 pin): file-scope globals persist per the uj_memo precedent, no static keyword.
```mql5-new-H2b
if(!haveBest)
  {
   string uj_hdayk = UjDayKey(iTime(_Symbol, PERIOD_CURRENT, 0));
   datetime uj_hdayt = StringToTime(uj_hdayk);
   uj_histFail = false; uj_histWhy = "";
   if(uj_hdayt <= 0) { uj_histFail = true; uj_histWhy = "CLOCK"; }
   else if(UjDayKey(iTime(_Symbol, PERIOD_D1, 0)) != uj_hdayk) { uj_histFail = true; uj_histWhy = "DAY"; }
   if(uj_hdayt != uj_histToday && uj_hdayt > 0 && UjDayKey(iTime(_Symbol, PERIOD_D1, 0)) == uj_hdayk)
     {
      int uj_dcap = 0;
      bool uj_hok = true;
      for(int uj_dc = 2; uj_hok; uj_dc++)
        {
         datetime uj_dct = iTime(_Symbol, PERIOD_D1, uj_dc);
         if(uj_dct <= 0) break;
         uj_dcap++;
        }
      double uj_tmpHi[]; double uj_tmpLo[]; string uj_tmpDay[];
      if(uj_dcap <= 0) { uj_hok = false; uj_histWhy = "EMPTY"; }
      if(uj_hok && ArrayResize(uj_tmpHi, uj_dcap) < 0) { uj_hok = false; uj_histWhy = "RSIZE"; }
      if(uj_hok && ArrayResize(uj_tmpLo, uj_dcap) < 0) { uj_hok = false; uj_histWhy = "RSIZE"; }
      if(uj_hok && ArrayResize(uj_tmpDay, uj_dcap) < 0) { uj_hok = false; uj_histWhy = "RSIZE"; }
      //--- v16: uj_tmpT retired (ordering uses uj_prevT/uj_hasP locals).
      datetime uj_prevT = 0; bool uj_hasP = false;
      for(int uj_dr = 0; uj_dr < uj_dcap && uj_hok; uj_dr++)
        {
         int uj_ds = uj_dr + 2;
         datetime uj_drt = iTime(_Symbol, PERIOD_D1, uj_ds);
         double uj_drh = iHigh(_Symbol, PERIOD_D1, uj_ds);
         double uj_drl = iLow(_Symbol, PERIOD_D1, uj_ds);
         bool uj_dok = (uj_drt > 0) && (uj_drh > 0.0) && (uj_drl > 0.0) && (uj_drh != EMPTY_VALUE) && (uj_drl != EMPTY_VALUE) && (uj_drh == uj_drh) && (uj_drl == uj_drl) && (uj_drh >= uj_drl) && (!uj_hasP || (uj_drt < uj_prevT));
         if(!uj_dok) { uj_hok = false; uj_histWhy = "INVALID"; break; }
         uj_tmpHi[uj_dr] = uj_drh; uj_tmpLo[uj_dr] = uj_drl; uj_tmpDay[uj_dr] = UjDayKey(uj_drt);
         uj_prevT = uj_drt; uj_hasP = true;
        }
      bool uj_commit = (uj_hok && uj_dcap > 0);
      if(uj_commit && ArrayResize(uj_histHi, uj_dcap) != uj_dcap) { uj_commit = false; uj_histWhy = "COMMIT"; }
      if(uj_commit && ArrayResize(uj_histLo, uj_dcap) != uj_dcap) { uj_commit = false; uj_histWhy = "COMMIT"; }
      if(uj_commit && ArrayResize(uj_histDay, uj_dcap) != uj_dcap) { uj_commit = false; uj_histWhy = "COMMIT"; }
      if(uj_commit)
        {
         for(int uj_ci = 0; uj_ci < uj_dcap; uj_ci++)
           { uj_histHi[uj_ci] = uj_tmpHi[uj_ci]; uj_histLo[uj_ci] = uj_tmpLo[uj_ci]; uj_histDay[uj_ci] = uj_tmpDay[uj_ci]; }
         uj_histToday = uj_hdayt; uj_histFail = false; uj_histWhy = "";
        }
      else
        {
         ArrayResize(uj_histHi, 0); ArrayResize(uj_histLo, 0); ArrayResize(uj_histDay, 0); uj_histFail = true;
        }
     }
   bool uj_wok = true;
   double uj_yHi = iHigh(_Symbol, PERIOD_D1, 1);
   double uj_yLo = iLow(_Symbol, PERIOD_D1, 1);
   double uj_tHi = iHigh(_Symbol, PERIOD_D1, 0);
   double uj_tLo = iLow(_Symbol, PERIOD_D1, 0);
   if(uj_yHi <= 0.0 || uj_yLo <= 0.0 || uj_yHi == EMPTY_VALUE || uj_yLo == EMPTY_VALUE || uj_yHi != uj_yHi || uj_yLo != uj_yLo || uj_yHi < uj_yLo) uj_wok = false;
   if(uj_tHi <= 0.0 || uj_tLo <= 0.0 || uj_tHi == EMPTY_VALUE || uj_tLo == EMPTY_VALUE || uj_tHi != uj_tHi || uj_tLo != uj_tLo || uj_tHi < uj_tLo) uj_wok = false;
   if(!uj_wok && !uj_histFail) { uj_histFail = true; uj_histWhy = "WITNESS"; }
   if(uj_histFail && InpDebugLog) PrintFormat("[SRJ-EA] UJHISTFAIL bar=%s dir=%s reason=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(dir), uj_histWhy);
   if(uj_histToday == uj_hdayt && uj_hdayt > 0 && uj_wok && UjDayKey(iTime(_Symbol, PERIOD_D1, 0)) == uj_hdayk)
     {
      double uj_cRun = 0.0;
      if(dir == DIR_LONG)
        { uj_cRun = ((uj_yHi > uj_tHi) ? uj_yHi : uj_tHi); }
      else
        { uj_cRun = ((uj_yLo < uj_tLo) ? uj_yLo : uj_tLo); }
      string uj_hpool = "";
      for(int uj_hj = 0; uj_hj < ArraySize(uj_histHi); uj_hj++)
        {
         bool uj_swept = false;
         if(dir == DIR_LONG)
           { if(uj_histHi[uj_hj] > uj_cRun) uj_cRun = uj_histHi[uj_hj]; else uj_swept = true; }
         else
           { if(uj_histLo[uj_hj] < uj_cRun) uj_cRun = uj_histLo[uj_hj]; else uj_swept = true; }
         if(uj_swept) continue;
         double uj_hv = (dir == DIR_LONG) ? uj_histHi[uj_hj] : uj_histLo[uj_hj];
         string uj_hsrc = (dir == DIR_LONG ? "DH" : "DL") + StringSubstr(uj_histDay[uj_hj], 0, 4) + StringSubstr(uj_histDay[uj_hj], 5, 2) + StringSubstr(uj_histDay[uj_hj], 8, 2);
         bool uj_hinD = (dir == DIR_LONG) ? (uj_hv > currentPrice) : (uj_hv < currentPrice);
         if(uj_hinD) uj_hpool += uj_hsrc + ":" + DoubleToString(MathAbs(uj_hv - currentPrice) / _Point, 0) + " ";
         TpTargetUpdateBest(uj_hv, dir, currentPrice, best, haveBest, uj_hsrc, uj_histDay[uj_hj], -1);
        }
      if(InpDebugLog) PrintFormat("[SRJ-EA] UJHISTPOOL bar=%s dir=%s pool=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(dir), uj_hpool);
      if(haveBest && InpDebugLog) PrintFormat("[SRJ-EA] TPFALLBACK bar=%s dir=%s tp=%s distPts=%s src=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(dir), DoubleToString(best, _Digits), DoubleToString(MathAbs(best - currentPrice) / _Point, 0), uj_winnerSource);
     }
  }
```
H2b replaces the D1 mask-off session re-walk body at the same siting (after the Compute POI loop close, before the TASK-23 census comment): old session loop + prints out, H2 store-refresh + consult in. uj_dk/dir/currentPrice/best/haveBest/barShift all in scope (ComputeNearestTpTarget params per EA-2440-2442 v9 pin); TpTargetUpdateBest signature per EA-2379-2382 v9 pin (companion carried). Record-day filter sits in the refresh fill (recent-to-oldest running max/min per Sonnet demand; rule pin above governs).
- H3 collapse + exclusions (no code): entry-side exclusion needs NO code (Assert1R direction gate EA-11825-11826 fails a below-entry TP by arithmetic at fire); own-source N/A for day-H/L vs POI anchor (disjoint name sets: sname EA-2459-2462 vs g_lineCode, helper scoped to the POI loop only per B1 fence); stale-swept-death beyond entry-side explicitly NON-COVERED (standing FRESH-SWEEP council item; scope disclaimer below). H2b now filters swept record days (FRESH-SWEEP item closed for H2b scope; session-pool staleness unchanged).
- H takes + cascade (Rule-vs-takes, pre-draft): 6/3 identical (fallback never ran there; fire code untouched; poll still PASSes); EU takes are fenced at grade (A-EU-PRESERVE entry-bar compare + blocking rule; retiring a poll abort or swapping an unreachable fallback adds admissions via fire PASS (hypothesis; the EU battery proves; code unchanged)); single-candidate exclusivity cited (Task-135 SINGLETON comment EA-7347-7348 v9 pin: one g_state/g_dir/g_anchorLine set; Sonnet-Q3 closed by cite, slot telemetry parked as scope creep). empty-masked EU elections + C-silence ride the grade battery (D1 is v9-new, so no D74 behavior changes wherever the masked walk succeeds).

## Parked with cause (no code; Analytic-B responsiveness without churn)
- Shared enabling-timeframe helper (Luna-B/Sonnet-B: one UjEnablingTfAgrees for FIX C + F): parked (refactor churn; convention locked by dual cite + UJLTFHOLD/S2PROMOTE m15-value parity at grade).
- touchClass UJADMIT field (Sonnet-B G2): parked (print-schema churn; UJCONFIRMCARRY already distinguishes the route at grade).
- Candidate-slot-occupied telemetry (Sonnet-B H1): parked (scope creep; SINGLETON cited + preserve battery fences at grade).
- Union-election across all pools (GLM-B Q3 alternative): parked (more regression surface; GLM concedes empty-election-only is the lower-cascade version; hierarchy sentence governs).
- Entry-candle-governed kill (GLM-B Q1 alternative 2): parked (larger surface: invariant block + managed loop; the carve-out delivers the venue).
- Swept-max-filter for old highs (Sonnet-Q3 note 1): ADOPTED in the H2b refresh fill above (record days only; rule pin FRESH-SWEEP + his swept-line challenge; any-age untouched).
Fall-through to the shared S3 promote (byte-unchanged). m15src is the containing-M15 open derived from the evaluated barShift (containing-M15 time mapping, not confirmed indicator-source timing; source-time mapping needs indicator work, future round). Budget (script-counted from the fenced blocks above, same turn): A3 -1 (retired define; guard 2-vs-2) + A4 +3 (fire-local 1R gate) + A5 0 (comment swap) + A6 +1 (fire-R carrier) + A7 0 (UJADMIT R + provenance swap) + A8 +1 (MEMO_IDENTITY define) + A9 +6 (fire-provenance carriers + snapshot) + B0 +11 + B1/B2/B3 +2 each (+6) + B3b -1 (suffix removal) + B3c 0 (comment swap) + C +11 (2-vs-13, containing-m15 time-mapping field) + D1 +15 (pre-zone census list) + E 0 (print-only schema) + E2 +1 (leg-setter print). Total NET +153 = carried v9 +53 (touchBar fields +0, B3b/E2-print indent normalization +0, all v9 sites presence-asserted at battery) + F11 +10 (old-F 17 / new-F11 27) + G1 +12 (old-G1 29 / new-G1 41) + H1 +1 (old-H1 15 / new-H1 16) + H2a +6 + H2b-D1 +70 (H2b 85 / D1 fence 15 retained as removal target). S3 recount governs at build. v8: zero fence-byte changes vs v7 (B2 relocation is siting-prose-only; all counts re-verified identical). v9: zoneTouch fields +0, P048 normalization +0; fences re-verified identical.

## Acceptance (grade-time proofs on a future UJ 6/1-6/13 run with InpDebugLog=true pinned under the same replay configuration as RECON63/71 (tick model, spread, pass timing) (all cited rows gated); discipline sentence: STAGE-1 exact-diffs the edit, S1 pre-hash gates the tree digest, S3 recounts the surface, and a fail-closed outcome is a failed proof unless its finding predicate fires. Per-venue record required: candidate/admission identity, direction, signal bar, fill bar, actual entry/SL/TP, target source (fire wsrc), actual-tuple 1R verdict, admission count; mechanism rows ride as supporting evidence. Values pre-declared below must match; fields marked grade-read are read at grade, never pre-filled.)
- A-SL1-PRESERVE: 6/3 09:05 bar takes with entry 159.929, SL 159.889, TP 159.983 (signal 09:05 bar, fill 09:10 bar: R53 ALERT at the 09:10 pass + R55 MTSNAP bar=09:05; parity tuple: MTSNAP sl=159.889 booking parity on values (MTSNAP sl=159.889; R02 is on no relay page); memo sl=159.905 labeled evidence only); UJMEMO_PASS memo tuple + UJ1R R=1.35 PASS on the fire tuple (co-resident poll-tuple UJ1R R=2.25 on sl 159.905 expected beside it; grade reads src=FIRE) + MT managing open; MEMO_MISMATCH path absent from the tree (S1 pre-hash proves retirement, never a run row). v10 preserve proof: H1/H2/F/G1 unreachable on this path (UJHISTPOOL 0 rows on 6/3 plus the masked-success take (wsrc=ASH); 0 ABORT/LTFFLIP rows on the 6/3 path; retest-only arm bar fails the G1 predicate with no prebind row at 09:00; fire code untouched) - identical admission required. YASH/ASH lineage: YASH is the RECON63 cited-build rung label, R54 wsrc=ASH on RECON72 (values agree: entry 159.929, sl 159.889, tp 159.983, R 1.35); parity is on values, never labels.
- A-S2P-RETAKE (HYPOTHESIS - fixed-run prediction; BASE fencing on-page): 5 June London USDJPY SHORT, Daily-POC line, signal 09:40 bar, fill 09:45 bar (his TIMING-N/N+1: 09:35 retest, 09:40 confirmation, 09:45 open entry): promotions exactly {09:05 (pass 09:10), 09:30 (pass 09:35)} or fail UJ-NOPROMO; UJLTFHOLD rows mode=M15 at the 09:15 + 09:20 + 09:40 passes and mode=CARVE at the 09:45 pass (evaluating the 09:40 confirmation bar); EXPECTED ABORT at the 09:25 pass (eval 09:20: M15-oppose + not-confirm - expected row, never a finding); RETESTBOOK hits on 09:35 (hypothesis term: his retest; re-seed off RETESTBOOK 09:25 hits=1 BASE); S4 armed at the 09:40 pass; confirm predicate PASS at 09:40 (hypothesis term; CONFIRMPOLL confirm rows are candle-classification components, the verdict is the predicate); UJADMIT with entry/SL/TP/seq grade-read (one admission in this venue's window; four run-wide per L-final; G1-cascade not exercised on this split-bar venue; F×G composition: F holds to the confirm bar with predicate-pass rarity PREBIND 1x vs 28 FAILs run-wide; falses bound by C-silence + exactly-four + DUPADMIT); per-venue record per the preamble. 09:45 arming-takes hypothesis: P033 diagnosis governs (zone persists from 09:40 arming; row-proof absent in BASE).
- A-POIV-RETAKE (HYPOTHESIS - fixed-run prediction; BASE fencing on-page): 11 June New York USDJPY LONG, Daily-POC line, signal 14:35 bar, fill 14:40 bar, entry 160.524, TP YLOH 160.587, entry-open R PASS, SL grade-read (BASE values from RECON72 TPCENSUS #45 ref 160.524 + UJ1R R1.75/R3.05; TPCENSUS #46 ref 160.520 stays post-entry per his ENTRY-BAR ruling, never evidence): UJCONFIRMCARRY row (bankBar=14:35, fireBar=14:40; cascade M15 condition on the evaluated 14:35 bar; predicate PASS on 14:35 is the hypothesis term with poll confirm=1 + his confirmation ruling as basis) INSTEAD of CONFIRM_STRUCT_FAIL at the 14:40 evaluation; corroborating touch as RETEST_CORROBORATED (RETESTBOOK hits=2 + verdict-evidence per G2 + RETESTDIAG inside + S3-zone arming print R64; zoneTouch=1 demand RETIRED per G2 with reason on-page); OWN-SOURCE exclusion rows (Daily-VWAP 2pt line must not kill: UJPOISKIP execution proof per B siting); FRESHCOUNT HOLDs allowed (never aborts); predicate-pass on 14:35 is the hypothesis term (poll confirm=1 + his confirmation ruling as basis; a STRUCT_FAIL at fire fails the venue with UJ-NOADMIT, never regraded). 6/11 promotion-set hypothesis: v16 trajectory (carried, code unchanged) {14:20-signal} with the 14:30 R38 promotion REPLACED by the F11 hold (no reseed), so no second promotion is expected (UJ-NOPROMO covers; asymmetry with the pinned 6/5 set is acceptance imprecision, GLM-A16). M15 at eval-14:35 == +1.0 stays hypothesis (R38 14:30 + R58 14:40 bracket, no 14:35 row). M15 at eval-14:25 likewise hypothesis (no spliced 14:25-evaluating row on the page).
- A-FB-RETAKE (HYPOTHESIS - fixed-run prediction; BASE fencing on-page): 5 June New York USDJPY LONG, signal 16:10 bar, fill 16:15 bar (his entry 160.059): UJHISTPOOL row with post-sweep eligible pool (unswept-per-witness days only, pre-zone); grade asserts UJHISTPOOL contains DH20260430 else finding UJ-NOEVID history-depth (DH20260430 MANDATORY per his A2 window-fact: no nearer unswept day-high exists 30-Apr to 4-Jun; any other elected winner fails UJ-IDENTITY with the pool list attached); elected winner == nearest unswept in-direction zone-eligible above election-ref (160.009); ref-insensitivity hypothesis term: the poll-ref nearest equals the entry-open (160.059) nearest, compared at grade from the pool list (the two reference prices are NOT claimed equal); availability (pool list on a consult-run print, even with no winner) vs eligibility (post-zone, evidenced by TPFALLBACK tp/src + fire wsrc) vs election (fire tuple) stated separately, separation beyond existing rows hypothesis-marked; UJFBPOOL must be ABSENT at the 16:05 election (removal proof: no mask-off session re-walk); UJPOLLRISK telemetry allowed (H1 proof: POLL FAIL no longer aborts; an S2POLL SUB_1R abort fails the venue outright; a UJPOLLRISK FAIL with fire PASS is the expected H1 shape, never a finding); fire wsrc in DH-family; entry-open R PASS on the fire tuple (grade reads src=FIRE); seed chain reaches the 16:10 evaluation (else UJ-NOPROMO). Census-winner NONE expected on this venue (census loops cover session/POI/census only, never D1 arrays); election proved by TPFALLBACK + fire wsrc, never the census string. Near-boundary rounding ambiguity fails UJ-NOEVID (exact source data on his machine decides; the pool list is evidence, never proof, at the boundary).
- A-EU-PRESERVE: baseline D74FE972 RECON60 rows; EU prove run on the August window 8/26-9/9 (RECON62 full-window zero-delta lineage; terminal.ini [Tester] window changed under CLOSE-FIRST order for this run): 7 takes identical entry/bar (register A1-7); zero unmatched take identities in both directions; REGIMECENSUS populations equal by (session, regime) keys with counts; C-silence (register section C); TPCENSUS + raw-log text + cumulative counters excluded as volatile. June UJ window proves UJ venues only (no EU take-identity role; corrects the v10/v11 sibling wording). v16 remainder named: empty-masked EU elections + same-candle entry-identity (G1 risk: cascade may fire them one pass earlier; any moved entry-bar BLOCKS the packet per ENGINE-REFINE-KEEPS-VALID-TAKES).
- L-final v16: A-SL1-PRESERVE + three RETAKE legs (each exactly one matching admission per named venue; repeated diagnostics counted separately, never as admissions) + A-EU-PRESERVE + C-silence (register section C invalids: 9/4 10:40 SHORT, 8/28 NY news, 8/27, 9/1 15:30, 9/8 16:45, 8/28 16:25). EU comparison graded on the August sibling run (P465 correction). Failed proof names its finding. Multiple findings may attach to one failed venue; one RESOLUTION per venue stands. UJ-NOTOUCH is RETIRED v10 (superseded by G2 corroborating-touch with reason on-page; a NOTOUCH demand in a grade is a format defect). Exactly four UJ admissions in 6/1-6/13 (his four-valid word); any admission outside the four venues fails with UJ-EXTRA.
- Findings map (every failed predicate names one; several may attach): wrong parity tuple UJ-PARITY; missing admission UJ-NOADMIT; duplicate admissions UJ-DUPADMIT (admissions only, promotions/diagnostics counted separately); required promotion predicate failed (missing, duplicate, or wrong-bar promotion/confirmation) UJ-NOPROMO; source mismatch (incl. empty fire wsrc) UJ-SRCMISM; wrong signal bar UJ-SIGNALBAR; wrong fill UJ-TIMEBASE; wrong direction/candidate identity UJ-IDENTITY; every admitted tuple failing grade 1R recompute, any leg incl. fallback UJ-SUB1R; touch unproven (no qualifying row by the signal pass: row absent, or present but wrong anchor/dir/timestamp/window) UJ-NOTOUCH-RETIRED (see L-final; corroborating-touch failures grade UJ-NOEVID with the predicate named); unsuccessful fallback-election event AT THE ADMISSION PASS (evaluating the signal bar: elects nothing or sub-1R, no admission) UJ-FBDEAD; required evidence row/field absent (named) UJ-NOEVID; admission outside the four venues UJ-EXTRA; EU differences UJ-EUDIFF. A missing row fails the proof; it never asserts the event did not occur. UJ-NOTOUCH retired v10 (see L-final; G2). New telemetry rows (UJLTFHOLD/UJCONFIRMCARRY/UJPOLLRISK/UJHISTPOOL) are evidence, never failure predicates.

## Run cost and novel evidence
- No run proposed (draft round; build gated on a NEW key + his run word, neither spent nor asked here). Cost when gated: build + ~48m UJ June window (measured RECON72 0:48:06) + ~50m EU August window (8/26-9/9; terminal.ini window change under CLOSE-FIRST order) + grade battery; key scope per seat (last key covered exactly one build + one run: build+UJ needs a new Luna key + his word, EU sibling needs its own word + key scope).
- Novel evidence vs RECON72: hold rows (F), carry row (G1), telemetry poll row (H1), old-high pool row (H2) answering all three diagnosed deaths; EU sibling re-proves the preserve battery on the new tree.

## Annex: design history (one line each; operative path above is the only authority)
- IMPL-1 v8 (D3A66F97): DIV + provenance closure, built 14C7476C, RECON71 0-take diagnosed (SL divergence / S2-held / VWAP wrong-kill). IMPL-2 v1-v3: RECON71 fixes. IMPL-2 v4: V316 amend (A4 fire-1R gate, A5 comment, B full texts + gating + managed anchor + direction/boundary sentences, C enriched print, D/legs/EU restated, R14 boundary row). IMPL-2 v5: V317 split amend (B3b suffix removal + E2 comment swap, C containing-m15 source field, D pre-zone census list, ABORT_MEMO_IDENTITY separation, E touch-transition print, findings map, EU comparator, per-venue record contract). IMPL-2 v6: V318 fold (A9 fire provenance + snapshot, E2 leg-setter print + anchor key, S2PROMOTE 09:30 + A-FB 16:10/16:15 corrections with two owned withdrawals, findings-v2, byte-exact B3b/B3c/E fences, R18, signature/scope cites, reachability notes). IMPL-2 v7: V319 fold (touchBar schema on both touch prints, first-S2-eval 09:05 promotion pin with owned second withdrawal, S3-window correlation rule, findings-v3 with NOPROMO/SUB1R/NOEVID, EU population pinned, B2 prose corrected, census restated post-edit, new-block indents normalized, R19-R22). IMPL-2 v8: V320 fold (B2 post-skip geometry, UJ-EXTRA venue bound, pool-walk status, scoped census claim, touch wording, rows-fence 09:05 fix). IMPL-2 v9: V321 fold (zoneTouch geometry field, 6/11 promotion pin + numeric window + R23-R25, fallback taxonomy aligned, TPFALLBACK status, P003/V320-tally + P048 + P096/P115 precision, full-helper companion). IMPL-2 v10: V323 fold (FIX F M15-hold + FIX G1 cascade + G2 touch-resolution + FIX H1/H2 old-high pool; acceptance rewritten as PRESERVE + three HYPOTHESIS retakes; UJ-NOTOUCH retired; budget +96). IMPL-2 v11: V324 fold (F11 carve-out per GLM design + G1 re-sited with no-return proof and touch census + G2 exact predicate + H DH-line and hierarchy sentence + pre-size adopt + parked section; acceptance re-pinned: two promotions, expected P09:25 abort, hypothesis terms; budget +103). IMPL-2 v12: V325 fold (G1 full-branch fence per GLM-B + term-2 verdict form + DH/daykey/guard fixes + EU window correction + closures; budget +106). IMPL-2 v13: V326 fold (G2 single predicate + H2b snapshot/refresh hardening + swept-record filter + P033 qualifier + wording closures; budget +140). IMPL-2 v14: V327 fold (H2b re-surgery + G2/R1 wording batches + P033 diagnosis + census reconciliation; budget +145). IMPL-2 v15: V328 fold (sentinel guards + census proof + stale purge + wording; budget +145). Setter numbers 8900-series/8920-region retired v15 (v9 pins EA 8940-8946/8961-8967 govern since v13). IMPL-2 v16: V329 fold (sentinels/day-check + fail flag + tmpT drop + G2 prebind/S3 label + P033 operative + purge-verified + labels + names; budget +149). Withdrawn history relocated here v16: v6 09:30 pin (owned second mispin) + v9 correct-refusal correctness claim (ledger 904, D3).

(End of file)
