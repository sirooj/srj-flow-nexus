# CODE REVIEW REQUEST - v230 - 2026-09-22 (PACKET_P-VALIDITY-1 v5: V230 folds incl. E5 tri-state + cadence asserts; nothing builds or spends on this verdict alone)

## Project brief (standing - read first)

- Money: clearance ask for exactly one build (4 files + E1b comment, STAGE-1 exact-diff gated) plus one tester run under the stated envelope. Alert-only EA. No live trades. No funded money moves on any verdict here. Build and run only on dual-key clear plus his run word plus token. Nothing here builds, runs, or spends by itself.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: validity thread - v229 relay (0D331C55/67715/525, TRANSPORTED) drew Luna AMEND-WITH-DELTA (7 defects, no key) + Sonnet substance-ACCEPT (no authority, no key) + GLM ACCEPT-by-name (8 non-blocking findings, no key) + Kimi AMEND-WITH-DELTA (1 blocking + 5 minors, no key) (all filed whole 1x each under V230 markers). NO clearance (GLM volunteers no key; Luna sole key source), NO keys volunteered. This v5 folds every adopted V230 delta and disproves Luna-1 on machine enumeration. Prior texts ride labeled, never as words of any seat.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

## Change (one plain sentence)

Clear PACKET_P-VALIDITY-1 v5 by name for exactly one build (E1, E1b, E2, E3, E4, E5 per the literals below, STAGE-1 exact-diff gated) plus one run under RECON50_DEMO_USD using the RECON52 replay segment/acceptance baseline with G1-G4 graded as stated.

## Money (standing)

Behavior-change build confined to sweep state (SRJ_State.mqh decls), sweep detection (SRJ_Sessions.mqh), mask export (SRJ_FlowLogic.mq5 buffer 29, frozen baseline touched via route), and the seed site plus one comment line (EA). Alert-only EA. No live trades. No funded money moves on any verdict here. Build and run only on dual-key clear plus his run word plus token. No commit without token.

## Session

NEW fresh session every time (his order 2026-09-20). Prior texts ride labeled with file plus marker plus digest, never as anyone's words.

## Packet

01_TASKS\PACKET_P-VALIDITY-1.md v5 DRAFT: 0E44ED96C1CC12EF6FFF241B0C1D4DF88AB706E2CC7F034E2D745493492D0CF9 / 25765 B / 50 lines (V1 sweep wiring, V2 seed retirement with tri-state pre-bar swept-mask exclusion plus tick-cadence asserts, V230 folds, G1-G4, cost). Pre-build trees: EA DA97580358ED7ACCFB02208BFD9B0ED97185398BC3DC93D55F7AA3366E3742C4 / 616591 B / 11236 lines (v12-built, uncommitted; STAGE-1 halts on drift); FlowLogic/Sessions/State measured fresh at S1 (no pre-stated figures).

## Seat packaging

Identical text to Luna plus Sonnet plus GLM plus Kimi (same four seats as transported v229; the V230 round arrived from all four). Keys volunteered only (Luna remains sole key source); any seat halts on a checkable discrepancy with line numbers. v230-round verdicts file under V231 markers (V230 markers hold the v229 round).

## TWIN (v5 packet: all 50 packet-lines quoted whole below, R01-R50; bodies verbatim, generated mechanically from disk bytes)

[[TWIN-B]]
R01 (= packet L1, whole): # PACKET_P-VALIDITY-1 v5 DRAFT - swept-session absorption + seed renewal (v5 folds V230 returns)
R02 (= packet L2, whole): 
R03 (= packet L3, whole): Status: v5 DRAFT (not issued, not cleared, not executed). v4 F9BD0147/22919/50 adopted-as-base (transported twin 6DFAEAE9/20881/50 + V229 folds worked in post-transport, twin-broken, superseded by reference here; v3 00C17159 earlier; all AMEND rounds with NO clearance, NO keys; V230 round: Luna/Kimi AMEND + Sonnet substance-ACCEPT + GLM ACCEPT-by-name, NO clearance, NO keys). Nothing builds or runs on this file. Clearance via a clearance relay plus token plus his run word, all owed. Canonical files: exactly FOUR - Include\SRJ\SRJ_State.mqh (8 new swept-field decls, 18 held post-build), Include\SRJ\SRJ_Sessions.mqh (8 resets + 8 detection blocks), Indicators\SRJ_FlowLogic.mq5 (8 mask lines, frozen baseline touched via route), Experts\SRJ_FlowNexus_EA.mq5 (one seed-retirement block + one comment refresh). No new indicator buffers (mask-bit reuse + existing PD line buffers). Nothing under 02_TASK_CHECKPOINTS. No commit without token. Successor context: PACKET_P-EXITMODEL-2 v12 (F1/F2/F3 live tree DA975803, RECON52 graded); this packet changes NO booking order, NO gate, NO exit leg.
R04 (= packet L4, whole): 
R05 (= packet L5, whole): ## Authority (all on record, no invention)
R06 (= packet L6, whole): 
R07 (= packet L7, whole): - His absorption words 2026-09-22 (ledger 557, verbatim): session highs/lows swept even by wick are deleted by absorption; entry POI needs a fresh POC/VWAP touch; a valid retest hit by session liquidity before 5m retracement + confirmation needs another retest. Labeled hypothesis, now ordered implemented (ledger 559: "Implement my second half of hyphothesis now" - scope word for this item; exit-only scope preserved otherwise).
R08 (= packet L8, whole): - Spec Part A v4.2 section 3.7 L185 (nearest valid TP must imply 1R+) + L187 (a target is valid unless already swept as session liquidity or closed over). His suspicion matches spec - validity hinge, never a rule change.
R09 (= packet L9, whole): - His R boundary 2026-09-22 (ledger 559): flat 1.0 valid, 0.99 invalid; 7 Sep New York +1.06 valid; 9/4 New York valid with dynamic exit (exit may print below 1R); journal 0.84 retired flawed (day-close exit unimplemented), 9/4 exit reference TBD by day-close model. Code gate >= 1.0 conformant.
R10 (= packet L10, whole): - Code gap proved read-only (finding BUILDER_FINDING_SWEPT-ABSORPTION.md 8A9F0479/5721/50): EA consumer L2261-L2275 reads bits 14..21 but FlowLogic L1371-L1392 sets 0..13 only; zero PD-session swept fields include-wide; sweep test wick-based (Sessions L346-435); detector EA L1920 fresh per bar with no seed-retirement transition (abort set 7 reasons, FRESHSKIP single PRE_BINDING, EA zero liquidity refs).
R11 (= packet L11, whole): - Bar proof body-standard, all restorations buffer-conditional (body-cross does not imply overshoot+buffer): SWEPT 8/28 London + 9/4 New York + 9/7 New York + 9/8 New York; fresh 9/8 London take; unknown 9/7 London (closes silent on wicks - packet run-grade step); 8/28 New York never valid (A1 declined, moot - corrected same turn).
R12 (= packet L12, whole): - Exit-only scope (AGENTS rule 30): this packet touches validity only - booking race, gate constant, exit legs, census formats all UNCHANGED.
R13 (= packet L13, whole): - V230 returns (filed whole 1x each): Luna/Kimi AMEND-WITH-DELTA + Sonnet substance-ACCEPT (no authority) + GLM ACCEPT-by-name; NO clearance (GLM volunteers no key, Luna sole key source), NO keys. Folds below: Luna-1 DISPROVED on v4 literals (machine enumeration 33 splits minus 3 intra-code pluses = 30 spans, same convention as uncontested E3=64) with v5 E5 re-cut to 34 by Luna-2/3 + Kimi-2; Luna-2/3 ADOPTED (tri-state mValid + R2SKIP row + S1 mask-domain assert); Luna-4 ADOPTED (G2 admission-bar join semantics); Luna-5 accepted limitation; Luna-6/7 + GLM-1 ADOPTED (rounded, 2.35, dates clause); GLM-2/3/4 VERIFIED-on-page ADOPTED (L45 chain corrections; A-4 second condition corrected to pdAsiaLow with credit); GLM-5/6/7/8 ADOPTED (E2 verbatim-concat clause, vestigial >= pointer dropped, m= display note, typo + S7 sublist); Kimi-1 ADOPTED (S1 tick-cadence assert); Kimi-2 ADOPTED (eval counter + evals-in-rows + S7 report); Kimi-3/4/5 ADOPTED (SEEDDIAG bucket, TP-line fact, pool-boundary assumption); Kimi-6 parked; Sonnet residual dissolved by GLM four-site equal-value pairs.
R14 (= packet L14, whole): 
R15 (= packet L15, whole): ## Rule (validity hinge of his 536 nearest-VALID word; dead lines were never valid)
R16 (= packet L16, whole): 
R17 (= packet L17, whole): - V1 PD-sweep wiring (wick-standard, mirroring the session tests): 8 prev-session swept flags with reset-on-cache-overwrite lifecycle; mask bits 14..21 exported; existing EA consumer (L2265-L2267) filters them with ZERO EA logic change (E1b refreshes one stale comment only). Swept prev-day lines leave the race; nearest-VALID then skips to the next-nearest valid line, live or prev-day.
R18 (= packet L18, whole): - V2 seed retirement (his renewal word): while seeded-but-unconfirmed (named set ST_S1_REGIME..ST_S4_ARMED, S1 asserts contiguity), a bar whose wick touches any still-valid line of the 18 session/PD pool (packet's reading of his session liquidity: the 18 session/PD lines of R-POOL only - Yearly/Monthly/Quarterly/FOMC POC/VWAP and POI are not void triggers (stated assumption); pre-bar swept-mask exclusion per Luna-2 - levels already marked swept as of barShift+1 are deleted-for-TP and skipped here; mask unavailable-or-invalid at barShift+1 = R2SKIP (seed held, SEEDDIAG diagnostic row), never silent all-unswept; a sweep occurring on the current seed bar still counts because the pre-bar state is intentionally used) voids the seed (state to ST_IDLE, anchor cleared, SEEDVOID diagnostic row with bar, direction, buffer index, value); entry then needs a fresh DetectPoiRetest find. Placed after the per-bar seed block: single pass per bar blocks same-bar re-admission (s1f staleness dissolved by construction - readers L7716/L7744/L7777 diagnostic-only); seed bar covered by placement (R2 sits after the per-bar seed block: the retest bar IS the retest subject); R2 executes every tick while the guard holds (S1 asserts cadence: new-bar-gated site = HALT + relocate to a tick-driven site); pre-bar reads prevent false fire; S5+ committed to the gate outcome; anchor POI untouched; managed trades exempt. Touch test: current-bar wick vs pre-bar line state (barShift+1 settled slot; PD/prev lines fixed) so extension bars don't false-fire; runs before the state-machine body (S4 to S5 transitions later in file order).
R19 (= packet L19, whole): 
R20 (= packet L20, whole): ## Scope (validity ONLY)
R21 (= packet L21, whole): 
R22 (= packet L22, whole): - TpTargetUpdateBest reduction, tie-breaks, gate comparator, exit engine, censuses, ALERT kinds, regime, SL, entry pipeline otherwise: all UNCHANGED. SEEDVOID is a SEEDDIAG-family diagnostic row, never an ALERT kind; R2SKIP same family.; MTEXIT reasons unchanged. The 8/28 London daily-POC pool-coverage flag rides unchanged (not this packet); 8/28 New York is never valid (A1 declined, moot).
R23 (= packet L23, whole): - Naming: pd-prefix shared by day-extremes vs per-session swept flags (Sonnet note) - no rename under exact-diff minimalism. PD flags feed mask ONLY (no Sessions/fresh-sweep readers). E4 column shift forced by longest name, consistent among the eight.
R24 (= packet L24, whole): - Parked with reasons: Luna-helper + Kimi-B2/B3/B4 (exact-diff minimalism; Kimi-B1 adopted as barShift+1); Luna s1f-line idea dissolved (readers diagnostic-only); GLM-D1 relocation rejected (disproved - sole writer proof); table-driven E3 rejected (no member pointers, harder anchors).
R25 (= packet L25, whole): 
R26 (= packet L26, whole): ## Edit set (exact verbatim; STAGE-1 exact-diff gated; byte-verified anchors; S1 halts on any literal mismatch)
R27 (= packet L27, whole): 
R28 (= packet L28, whole): - E1 State decls (old verbatim SRJ_State.mqh L199-L208, 3-space indent byte-dumped): `...bool.....asiaHighSwept;` + `...bool.....asiaLowSwept;` + `...bool.....londonHighSwept;` + `...bool.....londonLowSwept;` + `...bool.....nyHighSwept;` + `...bool.....nyLowSwept;` + `...bool.....pmHighSwept;` + `...bool.....pmLowSwept;` + `...bool.....pdHighSwept;` + `...bool.....pdLowSwept;` - new verbatim: the ten lines above plus `   bool     pdAsiaHighSwept;` + `   bool     pdAsiaLowSwept;` + `   bool     pdLondonHighSwept;` + `   bool     pdLondonLowSwept;` + `   bool     pdNyHighSwept;` + `   bool     pdNyLowSwept;` + `   bool     pdPmHighSwept;` + `   bool     pdPmLowSwept;` after pdLowSwept (net +8 new; zero-init convention matches existing flags, S1 asserts).
R29 (= packet L29, whole): - E1b EA comment refresh (old verbatim EA L2266 byte-dumped): `   if(sessIdx >= 10 && sessIdx <= 17) sweptBit = sessIdx + 4;   // [S1-TP-PROMOTION-001] prev-day session swept bits 14..21 (no FlowLogic export sets them this stage -> admitted; future sweep detection wires here, never silently)` - new verbatim: `   if(sessIdx >= 10 && sessIdx <= 17) sweptBit = sessIdx + 4;   // [P-VALIDITY-1: PD-session sweep detection wired openly (E1-E4); mask bits 14..21 live post-build]` (modify-in-place, net +0 new +1 modified).
R30 (= packet L30, whole): - E2 PD-flag resets, all four sites explicit, appended same-line (6-space indent byte-dumped; modified-line accounting per Kimi-D3): Asia old `......g_s.asiaHighSwept.=.false;.g_s.asiaLowSwept.=.false;` gains `      g_s.pdPmHighSwept = false; g_s.pdPmLowSwept = false;` appended same line (cache PM overwritten same site); London old `......g_s.londonHighSwept.=.false;.g_s.londonLowSwept.=.false;` gains `      g_s.pdAsiaHighSwept = false; g_s.pdAsiaLowSwept = false;`; NY old `......g_s.nyHighSwept.=.false;.g_s.nyLowSwept.=.false;` gains `      g_s.pdLondonHighSwept = false; g_s.pdLondonLowSwept = false;`; PM old `......g_s.pmHighSwept.=.false;.g_s.pmLowSwept.=.false;` gains `      g_s.pdNyHighSwept = false; g_s.pdNyLowSwept = false;` (4 sites appended same-line: net +0 new, +4 modified; fragments concatenate verbatim, six-space lead lands mid-line as written).
R31 (= packet L31, whole): - E3 PD detection, all eight blocks explicit in bit order 14..21 (insert BEFORE the Asia-High block, single-hit anchor `   // --- Asia High ---` asserted at S1; substitution table: flag=pd<Session><High/Low>Swept, cache=prev<Session><High/Low>, tag=p<AS/LD/NY/PM>.<H/L>, operator mirrors session pattern): PD-Asia-High `   // --- PD Asia High (P-VALIDITY-1: prev-session cache sweep) ---` + `   if(!SrjIsNa(g_s.prevAsiaHigh) && !g_s.pdAsiaHighSwept && high[i] > g_s.prevAsiaHigh + liquiditySweepBuffer)` + `     {` + `      g_s.pdAsiaHighSwept = true;` + `      int sz = ArraySize(thisBarSweeps);` + `      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);` + `      thisBarSweeps[sz] = "pAS.H"; thisBarOvershoots[sz] = high[i] - g_s.prevAsiaHigh;` + `     }` + PD-Asia-Low `   // --- PD Asia Low (P-VALIDITY-1: prev-session cache sweep) ---` + `   if(!SrjIsNa(g_s.prevAsiaLow) && !g_s.pdAsiaLowSwept && low[i] < g_s.prevAsiaLow - liquiditySweepBuffer)` + `     {` + `      g_s.pdAsiaLowSwept = true;` + `      int sz = ArraySize(thisBarSweeps);` + `      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);` + `      thisBarSweeps[sz] = "pAS.L"; thisBarOvershoots[sz] = g_s.prevAsiaLow - low[i];` + `     }` + PD-London-High `   // --- PD London High (P-VALIDITY-1: prev-session cache sweep) ---` + `   if(!SrjIsNa(g_s.prevLondonHigh) && !g_s.pdLondonHighSwept && high[i] > g_s.prevLondonHigh + liquiditySweepBuffer)` + `     {` + `      g_s.pdLondonHighSwept = true;` + `      int sz = ArraySize(thisBarSweeps);` + `      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);` + `      thisBarSweeps[sz] = "pLD.H"; thisBarOvershoots[sz] = high[i] - g_s.prevLondonHigh;` + `     }` + PD-London-Low `   // --- PD London Low (P-VALIDITY-1: prev-session cache sweep) ---` + `   if(!SrjIsNa(g_s.prevLondonLow) && !g_s.pdLondonLowSwept && low[i] < g_s.prevLondonLow - liquiditySweepBuffer)` + `     {` + `      g_s.pdLondonLowSwept = true;` + `      int sz = ArraySize(thisBarSweeps);` + `      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);` + `      thisBarSweeps[sz] = "pLD.L"; thisBarOvershoots[sz] = g_s.prevLondonLow - low[i];` + `     }` + PD-NY-High `   // --- PD NY High (P-VALIDITY-1: prev-session cache sweep) ---` + `   if(!SrjIsNa(g_s.prevNYHigh) && !g_s.pdNyHighSwept && high[i] > g_s.prevNYHigh + liquiditySweepBuffer)` + `     {` + `      g_s.pdNyHighSwept = true;` + `      int sz = ArraySize(thisBarSweeps);` + `      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);` + `      thisBarSweeps[sz] = "pNY.H"; thisBarOvershoots[sz] = high[i] - g_s.prevNYHigh;` + `     }` + PD-NY-Low `   // --- PD NY Low (P-VALIDITY-1: prev-session cache sweep) ---` + `   if(!SrjIsNa(g_s.prevNYLow) && !g_s.pdNyLowSwept && low[i] < g_s.prevNYLow - liquiditySweepBuffer)` + `     {` + `      g_s.pdNyLowSwept = true;` + `      int sz = ArraySize(thisBarSweeps);` + `      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);` + `      thisBarSweeps[sz] = "pNY.L"; thisBarOvershoots[sz] = g_s.prevNYLow - low[i];` + `     }` + PD-PM-High `   // --- PD PM High (P-VALIDITY-1: prev-session cache sweep) ---` + `   if(!SrjIsNa(g_s.prevPMHigh) && !g_s.pdPmHighSwept && high[i] > g_s.prevPMHigh + liquiditySweepBuffer)` + `     {` + `      g_s.pdPmHighSwept = true;` + `      int sz = ArraySize(thisBarSweeps);` + `      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);` + `      thisBarSweeps[sz] = "pPM.H"; thisBarOvershoots[sz] = high[i] - g_s.prevPMHigh;` + `     }` + PD-PM-Low `   // --- PD PM Low (P-VALIDITY-1: prev-session cache sweep) ---` + `   if(!SrjIsNa(g_s.prevPMLow) && !g_s.pdPmLowSwept && low[i] < g_s.prevPMLow - liquiditySweepBuffer)` + `     {` + `      g_s.pdPmLowSwept = true;` + `      int sz = ArraySize(thisBarSweeps);` + `      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);` + `      thisBarSweeps[sz] = "pPM.L"; thisBarOvershoots[sz] = g_s.prevPMLow - low[i];` + `     }` (8 blocks x 8 lines, net +64 new; bare PD-X labels between spans are never assembled).
R32 (= packet L32, whole): - E4 mask export (old verbatim FlowLogic L1377-L1386, 9-space indent byte-dumped, 10 mask lines): new verbatim adds after the pmLow line `         if(g_s.pdAsiaHighSwept)   swMask |= (1 << 14);` + `         if(g_s.pdAsiaLowSwept)    swMask |= (1 << 15);` + `         if(g_s.pdLondonHighSwept) swMask |= (1 << 16);` + `         if(g_s.pdLondonLowSwept)  swMask |= (1 << 17);` + `         if(g_s.pdNyHighSwept)     swMask |= (1 << 18);` + `         if(g_s.pdNyLowSwept)      swMask |= (1 << 19);` + `         if(g_s.pdPmHighSwept)     swMask |= (1 << 20);` + `         if(g_s.pdPmLowSwept)      swMask |= (1 << 21);` before the liveSid line (net +8 new).
R33 (= packet L33, whole): - E5 EA retirement (old verbatim EA L7706-L7708 byte-dumped: `.........}`, blank, `.........//---.[S2-TIMING-SHADOW-001].seed-bias.recorder.(Luna.V94.F1,.cleared.BY.NAME`): new verbatim inserts the R2 block between the blank and L7708: `    //--- [P-VALIDITY-1 R2 2026-09-22, his renewal word: a held pre-confirmation seed dies on a session-liquidity touch, retest bar included; entry then needs a fresh POC/VWAP retest. Placed after the per-bar seed block: single pass per bar blocks same-bar re-admission. Fires ST_S1..ST_S4 named set only; S5+ committed; runs before the state-machine body; touch test reads pre-bar line state so extension bars don't false-fire; pre-bar swept-mask exclusion (Luna-2): R-POOL indices already swept as of barShift+1 skipped via disk-derived map, current-bar sweep still counts; tri-state (Luna-B): valid mask excludes, unavailable-or-invalid mask = R2SKIP hold with row; eval counter proves cadence.]` + `    if(g_state > ST_IDLE && g_state < ST_S5_GATE_CHECK && g_anchorBarTime > 0)` + `     {` + `      double r2_hi = iHigh(_Symbol, PERIOD_CURRENT, barShift);` + `      double r2_lo = iLow(_Symbol, PERIOD_CURRENT, barShift);` + `      const int r2_bufs[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW, FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW, FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW, FL_BUF_NY_HIGH, FL_BUF_NY_LOW, FL_BUF_PM_HIGH, FL_BUF_PM_LOW, FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW, FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW, FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW, FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };` + `      bool r2_touch = false;` + `      double r2_val = 0.0;` + `      int r2_buf = -1;` + `      double r2_mask;` + `      if(!ReadFlow(FL_BUF_SWEPT_MASK, r2_mask, barShift + 1)) r2_mask = EMPTY_VALUE;` + `      bool r2_mValid = (MathIsValidNumber(r2_mask) && r2_mask == MathFloor(r2_mask) && r2_mask >= 0.0 && r2_mask < 4194304.0);` + `      int r2_m = (r2_mValid ? (int)MathRound(r2_mask) : 0);` + `      static int r2_evals = 0;` + `      if(!r2_mValid && InpDebugLog) PrintFormat("[SRJ-EA] R2SKIP bar=%s evals=%d (mask unavailable or invalid - seed held)", TimeToString(barTime, TIME_DATE|TIME_MINUTES), r2_evals);` + `      if(r2_mValid) r2_evals++;` + `      for(int r2_k = 0; r2_k < 18 && !r2_touch && r2_mValid; r2_k++)` + `        {` + `         double r2_v;` + `         int r2_sweptBit = (r2_k <= 9 ? r2_k : r2_k + 4);` + `         if((r2_m & (1 << r2_sweptBit)) != 0) continue;` + `         if(ReadFlow(r2_bufs[r2_k], r2_v, barShift + 1) && r2_lo <= r2_v && r2_v <= r2_hi)` + `           { r2_touch = true; r2_val = r2_v; r2_buf = r2_bufs[r2_k]; }` + `        }` + `      if(r2_touch)` + `        {` + `         ENUM_SRJ_STATE r2_prev = g_state;` + `         g_state = ST_IDLE;` + `         g_anchorLine = -1;` + `         g_anchorBarTime = 0;` + `         LogState(r2_prev, g_state);` + `         if(InpDebugLog) PrintFormat("[SRJ-EA] SEEDVOID bar=%s dir=%s buf=%d line=%s evals=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), DirName(g_dir), r2_buf, DoubleToString(r2_val, _Digits), r2_evals);` + `        }` + `     }` (34 lines new: 30 + mValid predicate + R2SKIP row + eval-counter decl/inc; hit branch stays one line; swept-bit map disk-derived from R-FILTER EA L2261-L2275 (r2_k 0..9 -> bit r2_k, 10..17 -> bit r2_k+4; TpSessionLevelFiltered NOT reused - it also rejects live levels, R2 needs swept-only rejection); mask-read idiom per E6 L10907-L10908 at barShift+1 fail-open; ST ordering idiom per L6976/L7037; const-array idiom per L2284; detector iHigh/iLow idiom per L1923-1926; LogState shape per L7694; DirName idiom per L806).
R34 (= packet L34, whole): - E6 endpoint assert-only (no code change): MtNearestTpTarget recompute site EA L10907-L10914 (`   double s39_mask;` + `   if(!ReadFlow(FL_BUF_SWEPT_MASK, s39_mask, barShift)) s39_mask = EMPTY_VALUE;` + `   for(int i = 0; i < ArraySize(sessbufs); i++)` + `     {` + `      double v;` + `      if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask))` + `         TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);` + `     }`) consumes the same buffer-29 mask through the same filter - PD-swept flows with zero change; S1 asserts byte-identity of this span.
R35 (= packet L35, whole): 
R36 (= packet L36, whole): ## Stages (T161N discipline; RECON52 precedent)
R37 (= packet L37, whole): 
R38 (= packet L38, whole): S1 Pre-hash gate: re-hash EA (must equal DA97580358ED7ACCFB02208BFD9B0ED97185398BC3DC93D55F7AA3366E3742C4 / 616591 B / 11236 lines) + fresh-measure FlowLogic/Sessions/State (record, no pre-stated figures); literal diff whitelist for the four files (exactly E1, E1b, E2, E3, E4, E5 hunks and nothing else - extra bytes = DIAGNOSE/HALT); single-hit + char-code assert every OLD anchor above; assert PD buffer writers (FlowLogic L1172-1179), ST ordering + contiguity + named set, LogState shape, 18 FL_BUF_ names pre-declared, barTime pin, E6 span above byte-identical, seven-family taxonomy (SIGNAL, TP_ELECT, SIDE1X, SIDE1E, STOPRESOLVE, SEEDDIAG, SESSION_LIMIT - v12 set), zero-init convention, tag count-once per level with no thisBarSweeps-keyed consumer outside the mask print, seed-block to R2 to S-advance execution order with single pass per bar, s1f chain diagnostic-only (L7657 decl + L7716/L7744/L7777 readers), no seed-assignment path after the R2 block in file order, assert all managed/committed trade states outside the R2 guard interval, assert no stale dir/anchor metadata authorizes seed/admission post-SEEDVOID, single 18-line candidate-walk consumer set (L2284, L10906, r2_bufs new), r2 swept-bit map == R-FILTER map (0..9 identity, 10..17 +4, byte-compared), assert R2 executes every tick while the guard holds, not new-bar-gated (new-bar-gated site = HALT + relocate R2 to a tick-driven site), assert mask-domain (r2_mValid predicate: MathIsValidNumber + integral + range [0, 4194304)), accept m= as the PD-bit display (swept= 10-char + live= 4-char widths unchanged), r2 value-domain (EMPTY_VALUE/SRJ_NA_DBL/real price at barShift+1, no 0.0-sentinel/NaN writer), leading-underscore identifiers char-coded. Miss = DIAGNOSE, never assume, never revert. S2 Apply E1, E1b, E2-E5 exact-diff (E1b counts as modified-line, E2 appends count as modified-lines, all others insertions). S3 Post-hash per file + budget arithmetic from literal counts (inserted-vs-modified split). S4 Compile EA + indicator metaeditor64: 0 errors 0 warnings. S5 One run under RECON50_DEMO_USD using the RECON52 replay segment/acceptance baseline (explicit values authoritative: InpMode 1, 08-26 to 09-10, InpDebugLog=true, same terminal, 90-min ceiling, DONE-file based; exact time/date boundary identical to the RECON52 acceptance baseline; no DONE by ceiling = VOID run, hard failure, transport stops). S6 Gates G1-G4 below. S7 Result file BUILDER_RESULT_<RUN>-VALIDITY-V1.md pattern plus tabulate with DONE file plus stated design facts: R2 touch inclusive without buffer vs V1 exclusion wick-through-plus-buffer (his hit-vs-swept wording); R2 voids on pre-confirmation touch of the would-be TP line too; void-trigger pool = 18 R-POOL lines only (Yearly/Monthly/Quarterly/FOMC + POI not triggers); result states r2_evals max + per-row evals, S1 asserts ticked as numbered sublist.
R39 (= packet L39, whole): 
R40 (= packet L40, whole): ## Acceptance (graded on the replay segment vs RECON52 94C248E7; validity deltas only)
R41 (= packet L41, whole): 
R42 (= packet L42, whole): G1 Build: 0 errors 0 warnings both targets; post-hashes recorded; per-file budget from literals (State +8 new, Sessions +64 new +4 modified, FlowLogic +8 new, EA +34 new +1 modified; R displayed rounded to 2dp); commit text prepared, commit only on token.
R43 (= packet L43, whole): G2 Selection: PD-swept exclusions attributed per bar with join key (bar, direction, buffer index, value - value display-only); census admitted= is EMPTY+DIRECTION context only, attribution joins LATCH/consumed rows; SEEDVOID kills attributed bar + line value + evals + fresh re-seed after, graded when observed (zero occurrences is not a gate failure - mechanism present vs exercised distinguished via r2_evals); R2SKIP rows attributed by bar + evals (seed held, mask unknown); multi-touch shows first-hit attribution in R-POOL order (single line per bar, no per-level enumeration); exclusion joins at the admission/take bar, sweep-origin bar via mask-history walk when needed, TPCENSUS admitted-walk authoritative; take identity = admission serial + bar/dir/entry/SL; seven-family identity otherwise (enumerated above); zero unpredicted families (hard gate); flat-1.0 takes (boundary inclusive, code conformant).
R44 (= packet L44, whole): G3 Exits: exit legs untouched; MTEXIT/MTLIFE deltas only downstream of takes changed by validity/renewal (restored or renewal-lost); DAY_CLOSE may fire on restored held takes (mark-joined; 9/4 New York candidacy revived; 9/7 London promotion path mark-joined against pdLondonLow timing - pre-admission re-derives the take, post-admission E6 recompute drops YLOL mid-trade); MTFLIP zero (F2 holds); no new ALERT kinds (SEEDVOID diagnostic only).
R45 (= packet L45, whole): G4 Goal join (0.84 retired - model-R plus day-close TBD, never cited): takes re-joined bar-for-bar with the observed winner required to equal recomputed nearest-valid from the joined valid set (named candidates/prices are expectation checks only; pass == observed winner equals deterministic nearest-valid recomputation) - 9/4 New York take expected via YNYH-class (~1.16301 R~1.65; price sits below YASL/YPML then under YLOL; after YLOL drops YNYH:283 is nearest) or Yearly-VWAP 1.16315 (his line, R 1.74; pdNyHigh expected set pre-16:00, buffer-conditional); 9/7 New York via Yearly-VWAP 1.16315 (his line, R 2.35; NYH live-excluded M05-bit12 so YNYH-drop exposes it directly; pdNyHigh expected set pre-16:40, buffer-conditional); 8/28 London via PDL-class (~1.16364 R~2.43, conditional in-zone; LOL live-excluded M01-bit11; needs pdPmLow + pdAsiaLow (low under 1.16455 post-London-rising; LOL already live-excluded M01-bit11; YLOL absent from the C01 walk); 102-pt tie resolves to PDL by earliest sessbufs index; YASL:11 R 0.26 no-restoration branch when pdAsiaLow stays clear); 9/7 London conditional restoration via ASH (~1.16200 R~1.76) where pdPmHigh + pdLondonLow set (pdAsia-clear inert: ASH idx2 beats YASH idx10 either way), plus general clause (all seven re-joined bar-for-bar; restorations beyond the named set attributed per G2, never silent, never hard-gate failures); 9/8 London unaffected; 9/8 New York conditional via YLOL-class (needs pdPmLow + pdNyLow; YNYL:11 R 0.20 otherwise; MEANREV scope noted); 8/28 New York never valid (A1 declined, moot); 9/7 London residue otherwise stands (fresh-by-close; preference-order parked, wick-join run-graded). Rejects silent both runs. Deployment still shut (full-journal open).
R46 (= packet L46, whole): 
R47 (= packet L47, whole): ## Run cost and novel evidence
R48 (= packet L48, whole): 
R49 (= packet L49, whole): One build (4 files + E1b comment, STAGE-1 exact-diff gated) plus one tester run under RECON50_DEMO_USD using the RECON52 replay segment/acceptance baseline, ceiling 90 minutes, explicit values authoritative (InpMode 1, 08-26 to 09-10, InpDebugLog=true, same terminal). Novel evidence vs RECON52 (DA975803, takes 1/7): (a) first swept-validity run with mask bits 14-21 live and PD exclusions census-joined; (b) renewal run instrumented to produce first renewal evidence if SEEDVOID occurs (rows + fresh re-seeds when observed); (c) restored takes on live lines with kept gate inclusive; (d) wick-join for the open unknown (9/7 London); (e) first tri-state mask audit (R2SKIP rows + r2_evals proving evaluation cadence). Exit= figures are target figures, never realized fills.
R50 (= packet L50, whole): L-final Graded set authoritative: G1/G2/G3/G4 above; the ask G1-G4 covers V1-V2 as stated.
[[TWIN-E]]

## FILTER (whole EA L2261-L2275, byte-exact fresh pull; the consumer V1 relies on; Luna-2 map derives from L2265-L2266)

[[R-FILTER-B]]
bool TpSessionLevelFiltered(int sessIdx, double mask)
  {
   if(mask == EMPTY_VALUE) return false;
   int m = (int)MathRound(mask);
   int sweptBit = sessIdx;
   if(sessIdx >= 10 && sessIdx <= 17) sweptBit = sessIdx + 4;   // [S1-TP-PROMOTION-001] prev-day session swept bits 14..21 (no FlowLogic export sets them this stage -> admitted; future sweep detection wires here, never silently)
   if((m & (1 << sweptBit)) != 0) return true;              // EA-26: already swept
   int liveBit = -1;
   if(sessIdx == 2 || sessIdx == 3)      liveBit = 10;     // Asia
   else if(sessIdx == 4 || sessIdx == 5) liveBit = 11;     // London
   else if(sessIdx == 6 || sessIdx == 7) liveBit = 12;     // NY
   else if(sessIdx == 8 || sessIdx == 9) liveBit = 13;     // PM
   if(liveBit >= 0 && (m & (1 << liveBit)) != 0) return true; // EA-51: session live
   return false;
  }
[[R-FILTER-E]]
POOL (whole EA L2282-L2292, the 18-line table V1/V2 share):
[[R-POOL-B]]
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
[[R-POOL-E]]

## MASK (whole FlowLogic L1371-L1392, byte-exact fresh pull; the producer that never sets 14-21)

[[R-MASK-B]]
         // [Task 39 / EA-26 + EA-51] Packed swept + session-live mask, buffer 29.
         // Read via ReadFlow in the EA; the settled-slot offset the rest of this
         // block relies on applies unchanged. g_s swept flags reflect bar i's
         // processing (SRJ_Sessions_Pass has already run this bar); SRJ_GetSessionId
         // is evaluated on the same bar time so swept and live states are aligned.
         int swMask = 0;
         if(g_s.pdHighSwept)     swMask |= (1 << 0);
         if(g_s.pdLowSwept)      swMask |= (1 << 1);
         if(g_s.asiaHighSwept)   swMask |= (1 << 2);
         if(g_s.asiaLowSwept)    swMask |= (1 << 3);
         if(g_s.londonHighSwept) swMask |= (1 << 4);
         if(g_s.londonLowSwept)  swMask |= (1 << 5);
         if(g_s.nyHighSwept)     swMask |= (1 << 6);
         if(g_s.nyLowSwept)      swMask |= (1 << 7);
         if(g_s.pmHighSwept)     swMask |= (1 << 8);
         if(g_s.pmLowSwept)      swMask |= (1 << 9);
         int liveSid = SRJ_GetSessionId(time[i]);
         if(liveSid == 0)      swMask |= (1 << 10);
         else if(liveSid == 1) swMask |= (1 << 11);
         else if(liveSid == 2) swMask |= (1 << 12);
         else if(liveSid == 3) swMask |= (1 << 13);
         g_bufSweptMask[target] = (double)swMask;
[[R-MASK-E]]

## RESET (whole Sessions Asia-rising site L275-L283, byte-exact fresh pull; London/NY/PM sites mirror at L284-292/L293-301/L302-310)

[[R-RESET-B]]
   if(risingAsia)
     {
      // Asia follows PM in the daily cycle — cache PM before resetting Asia
      g_s.prevPMHigh = g_s.pmHigh;
      g_s.prevPMLow  = g_s.pmLow;
      g_s.asiaHigh = SRJ_NA_DBL; g_s.asiaLow = SRJ_NA_DBL;
      g_s.asiaHighSwept = false; g_s.asiaLowSwept = false;
      if(g_s.freshSweepExpirySession == "Asia") g_s.freshSweepExpired = true;
     }
[[R-RESET-E]]

## DETECT (whole Sessions Asia-High block L365-L373, byte-exact fresh pull; the wick-standard pattern E3 mirrors)

[[R-DETECT-B]]
   // --- Asia High ---
   double effAsiaHigh = !SrjIsNa(g_s.asiaHigh) ? g_s.asiaHigh : g_s.prevAsiaHigh;
   if(!SrjIsNa(effAsiaHigh) && !g_s.asiaHighSwept && high[i] > effAsiaHigh + liquiditySweepBuffer)
     {
      g_s.asiaHighSwept = true;
      int sz = ArraySize(thisBarSweeps);
      ArrayResize(thisBarSweeps, sz + 1); ArrayResize(thisBarOvershoots, sz + 1);
      thisBarSweeps[sz] = "AS.H"; thisBarOvershoots[sz] = high[i] - effAsiaHigh;
     }
[[R-DETECT-E]]

## STATE (whole SRJ_State.mqh L199-L208, byte-exact fresh pull; E1 extends below pdLowSwept)

[[R-STATE-B]]
   bool     asiaHighSwept;
   bool     asiaLowSwept;
   bool     londonHighSwept;
   bool     londonLowSwept;
   bool     nyHighSwept;
   bool     nyLowSwept;
   bool     pmHighSwept;
   bool     pmLowSwept;
   bool     pdHighSwept;
   bool     pdLowSwept;
[[R-STATE-E]]

## SEED2 (whole EA L7706-L7708 with blank L7707, byte-exact fresh pull; E5 inserts between the blank and L7708)

[[R-SEED2-B]]
         }

         //--- [S2-TIMING-SHADOW-001] seed-bias recorder (Luna V94 F1, cleared BY NAME
[[R-SEED2-E]]

## E6 (whole EA L10907-L10914, byte-exact fresh pull; assert-only endpoint, PD-swept flows with zero change)

[[R-E6-B]]
   double s39_mask;
   if(!ReadFlow(FL_BUF_SWEPT_MASK, s39_mask, barShift)) s39_mask = EMPTY_VALUE;
   for(int i = 0; i < ArraySize(sessbufs); i++)
     {
      double v;
      if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask))
         TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);
     }
[[R-E6-E]]

## S1F (whole EA L7777-L7778, byte-exact fresh pull; diagnostic-only readers, s1f-line idea dissolved)

[[R-S1F-B]]
     bool s1f_seedThisBar = (s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0);
     if(s1f_seedThisBar)
[[R-S1F-E]]

## PM-SITE (whole Sessions PM-rising site L302-L310, byte-exact fresh pull; sole prevNY writer - GLM-D1 dissolved, GLM withdrew plainly this round)

[[R-PMSITE-B]]
   if(risingPM)
     {
      // PM follows NY — cache NY before resetting PM
      g_s.prevNYHigh = g_s.nyHigh;
      g_s.prevNYLow  = g_s.nyLow;
      g_s.pmHigh = SRJ_NA_DBL; g_s.pmLow = SRJ_NA_DBL;
      g_s.pmHighSwept = false; g_s.pmLowSwept = false;
      if(g_s.freshSweepExpirySession == "PM") g_s.freshSweepExpired = true;
     }
[[R-PMSITE-E]]

## J-ROWS (RECON52 segment pulls, machine-verified, carried from v229; close==entry marks the admission call; C01/C04/C07 decide GLM-F2/F3/F4)

[[R-JROWS-B]]
B01 TP_RR_FAIL_LATCH bar=2026.08.28 10:00 dir=SHORT entry=1.16466 sl=1.16508 tp=1.16459 R=0.17
B02 TP_RR_FAIL_LATCH bar=2026.08.28 16:20 dir=SHORT entry=1.16430 sl=1.16508 tp=1.16416 R=0.18
B03 TP_RR_FAIL_LATCH bar=2026.09.04 15:55 dir=LONG entry=1.16018 sl=1.15847 tp=1.16188 R=0.99
B04 TP_RR_FAIL_LATCH bar=2026.09.07 09:15 dir=LONG entry=1.16135 sl=1.16098 tp=1.16158 R=0.62
B05 TP_RR_FAIL_LATCH bar=2026.09.07 16:40 dir=LONG entry=1.16261 sl=1.16238 tp=1.16270 R=0.39
B06 TP_RR_FAIL_LATCH bar=2026.09.08 16:55 dir=SHORT entry=1.16220 sl=1.16274 tp=1.16210 R=0.19
C01 TPCENSUS #95 bar=2026.08.28 10:00 dir=SHORT close=1.16466 winner=YPML best=1.16459 distPts=7 empties=0 admitted= PDL:102 ASL:11 LOL:37 NYL:102 PML:7 YASL:11 YNYL:102 YPML:7 Monthly-POC:1042 Monthly-VWAP:602 Quarterly-POC:2132 Quarterly-VWAP:1588 Yearly-POC:1067 Yearly-VWAP:144 FOMC-POC:1099 FOMC-VWAP:793
C02 TPCENSUS #119 bar=2026.08.28 16:20 dir=SHORT close=1.16430 winner=YLOL best=1.16416 distPts=14 empties=0 admitted= PDL:66 LOL:14 NYL:38 YLOL:14 YNYL:66 Monthly-POC:1006 Monthly-VWAP:557 Quarterly-POC:2096 Quarterly-VWAP:1542 Yearly-POC:1031 Yearly-VWAP:108 FOMC-POC:1062 FOMC-VWAP:747
C03 TPCENSUS #329 bar=2026.09.04 15:55 dir=LONG close=1.16018 winner=YLOL best=1.16188 distPts=170 empties=0 admitted= PDH:394 ASH:313 ASL:206 LOH:284 LOL:170 NYH:252 PMH:361 PML:234 YASH:313 YASL:206 YLOH:284 YLOL:170 YNYH:283 YPMH:361 YPML:234 Yearly-VWAP:297
C04 TPCENSUS #348 bar=2026.09.07 09:15 dir=LONG close=1.16135 winner=YPMH best=1.16158 distPts=23 empties=0 admitted= PDH:196 ASH:65 LOH:8 NYH:135 PMH:23 YASH:65 YLOH:167 YLOL:53 YNYH:135 YPMH:23 Yearly-VWAP:180
C05 TPCENSUS #376 bar=2026.09.07 16:40 dir=LONG close=1.16261 winner=YNYH best=1.16270 distPts=9 empties=0 admitted= PDH:70 LOH:97 NYH:21 YLOH:97 YNYH:9 Yearly-VWAP:54
C06 TPCENSUS #385 bar=2026.09.08 10:05 dir=SHORT close=1.16205 winner=YLOL best=1.16102 distPts=103 empties=0 admitted= PDL:155 LOL:7 YLOL:103 Monthly-VWAP:133 Quarterly-POC:1871 Quarterly-VWAP:1154 Yearly-POC:218 FOMC-POC:837 FOMC-VWAP:427
C07 TPCENSUS #412 bar=2026.09.08 16:55 dir=SHORT close=1.16220 winner=YPML best=1.16210 distPts=10 empties=0 admitted= PDL:170 LOL:137 NYL:141 PML:10 YLOL:137 YNYL:11 YPML:10 Monthly-VWAP:143 Quarterly-POC:1886 Quarterly-VWAP:1161 Yearly-POC:106 FOMC-POC:852 FOMC-VWAP:437
M01 SWEPTMASK bar=2026.08.28 10:00 raw=2824.0 m=2824 swept=0001000011 live=0100
M02 SWEPTMASK bar=2026.08.28 16:20 raw=4920.0 m=4920 swept=0001110011 live=0010
M03 SWEPTMASK bar=2026.09.04 15:55 raw=4648.0 m=4648 swept=0001010001 live=0010
M04 SWEPTMASK bar=2026.09.07 09:15 raw=2816.0 m=2816 swept=0000000011 live=0100
M05 SWEPTMASK bar=2026.09.07 16:40 raw=4869.0 m=4869 swept=1010000011 live=0010
M06 SWEPTMASK bar=2026.09.08 10:05 raw=3020.0 m=3020 swept=0011001111 live=0100
M07 SWEPTMASK bar=2026.09.08 16:55 raw=4908.0 m=4908 swept=0011010011 live=0010
A01 EXITVERDICT bar=2026.09.07 10:45 dir=LONG entry=1.16135 curTp=1.16188 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=1 htfM=1 htfL=1 want=1 anti=0 tpB=1.16315 h=1.16181 l=1.16149 sup=15
A02 EXITVERDICT bar=2026.09.07 10:50 dir=LONG entry=1.16135 curTp=1.16270 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=1 htfM=1 htfL=1 want=1 anti=0 tpB=1.16315 h=1.16203 l=1.16162 sup=15
[[R-JROWS-E]]

## FOLDS (V230 demands: quoted complete with packet anchor plus ruling by name)

## Luna-1 (blocking, E5 count) - DISPROVED on packet literals, v5 re-cut and recounted

I would **not clear PACKET_P-VALIDITY-1 v4 yet**. The V1/V2 mechanism is coherent, Luna-2 is integrated correctly, and the GLM-D1 dispute is properly dissolved on the page. I see two blocking issues and several non-blocking gaps/imprecisions.

**No key volunteered. No build/run clearance.**

### Analytic A — defects, gaps, and imprecisions

**1. Blocking — E5's stated EA line budget does not match the literal E5 insertion.**
Packet **R33** says E5 is **“30 lines new”**, and **R42** budgets **EA +30 new +1 modified**.

But the E5 literal shown in R33 is **32 physical inserted lines** from the comment through the final `}`. The displayed block contains the comment, guard, brace structure, declarations, mask read/decode, loop, hit branch, void branch, logging, and closing braces; counted literally, it is 32 lines.

That makes **R33 / R38-S3 / R42 internally inconsistent** under the packet's stated exact-diff discipline. R31's eight PD blocks are explicitly 8 physical lines each, so there is no stated alternative brace-exclusion convention that explains E5.

**Required delta:** either correct the E5 literal so the actual insertion is 30 lines, or correct the packet's E5/EA budget to the literal count and propagate the arithmetic through R33, R38-S3, and R42.

RULING (builder, machine-enumerated): DISPROVED. The v4 E5 literal splits into 33 spans on the joiner, of which 3 are intra-code pluses (barShift + 1 twice, r2_k + 4 once), leaving 30 true spans - the same line-span convention under which E3 counts 8 spans per block (its tag-pair single-liner counts one) and which no seat disputes at 64 total. Sonnet, GLM, and Kimi each counted 30 independently. A bare 32 with no itemization cannot stand against four-way agreement plus machine output. v5 E5 is a new literal at 34 spans (30 + mValid predicate + R2SKIP row + eval-counter decl/inc), counted from its own bytes in the battery below.

## Luna-2/3 (blocking, fail-open plus mask-domain) - ADOPTED E5 edit plus S1 assert

**2. Blocking — E5's mask-read failure is fail-open in a validity-critical path.**
Packet **R18/R33** requires R2 to use the **pre-bar swept-valid pool**. But E5 does:

```text
if(!ReadFlow(...)) r2_mask = EMPTY_VALUE;
int r2_m = (r2_mask == EMPTY_VALUE ? 0 : ...)
```

A failed mask read therefore becomes `r2_m=0`, which means **no previously swept level is excluded**. A stale/deleted level can then void the seed.

That does not satisfy the absolute wording in **R18** that levels already swept as of `barShift+1` are skipped. It is a conservative false-positive-void failure mode, but it is still a semantic failure of the stated mechanism.

**Required delta:** make mask-read failure an explicit `UNKNOWN` condition that prevents R2 from being evaluated, or make it a run-diagnostic/hard failure. At minimum, **R38-S1/G2** needs to specify and grade mask-read failures rather than silently converting them to an all-unswept mask.

---

**3. Blocking/verification gap — no mask-domain assertion exists for `r2_mask`.**
Packet **R38-S1** adds a value-domain assertion for the **18 R-POOL buffers**, but that assertion does not cover the mask itself.

E5 only distinguishes `EMPTY_VALUE`; otherwise it does `MathRound()` and casts to `int`. The page does not assert that buffer 29 at `barShift+1` is:

* `EMPTY_VALUE`, or
* a finite, integral mask in the legal bit range.

There is no explicit protection against `SRJ_NA_DBL`, NaN, negative values, non-integral values, or an out-of-range mask.

**Required delta:** add a mask-domain S1 assertion, or make E5 reject any non-`EMPTY_VALUE`, non-finite/integer-valid mask rather than decoding it.

This is closely related to defect 2 but is a separate verification problem.

RULING (builder): ADOPTED as tri-state exactly per Luna-B. New mValid predicate (MathIsValidNumber plus integral plus range [0, 4194304)) covers the whole Luna-3 list: EMPTY_VALUE is huge so range-rejects, NaN fails the number check, negatives and non-integrals and out-of-range masks reject. The loop is gated span-neutrally; the only new evaluation path on unknown mask is the R2SKIP row (bar plus evals, seed held). Rationale for graded-hold over hard-fail: warmup-edge misses must not void the run, and holding the seed is the safe direction; G2 grades every R2SKIP row. The E6 read idiom is kept, its silent fallback is not. Packet anchors: L18 tri-state sentence, L33 mValid plus R2SKIP plus gated loop, L38-S1 mask-domain assert, L43 R2SKIP grading.

## Luna-4/5/6/7 (wording and traceability) - ADOPTED, ADOPTED, ADOPTED, accepted limitation

**4. Non-blocking but important — G2's PD-exclusion observability is underspecified.**
**R43** requires PD-swept exclusions to be attributed by `(bar, direction, buffer index, value)`, but the new E3 mechanism itself only records sweep tags through the existing `thisBarSweeps` path and exports the state through the mask.

The packet does not precisely define **which result row is the authoritative exclusion record**, nor whether the `bar` in the join key means:

* the bar on which the level was swept,
* the bar on which it was excluded from TP selection,
* or the admission/take bar.

That matters because a PD level can be swept several bars before the take that consumes the exclusion.

**Delta:** specify the exact join semantics and authoritative row/source for an exclusion carried across bars. The value may remain display-only as stated.

---

**5. Non-blocking — exact-diff traceability is asymmetric for E2.**
**R30** gives the full old/new Asia reset line, but the London, NY, and PM reset sites are only described as mirrors. **R38-S1** says the actual anchors will be asserted on disk.

That is sufficient for machine-side validation, but it means the page itself does not independently expose the complete four-site E2 old-byte baseline despite calling the packet self-contained and exact-diff gated.

I would keep this as a **traceability limitation**, not a clearance blocker.

---

**6. Non-blocking — the R precision convention is still scoped ambiguously.**
**R42** says R is “displayed truncated to 2dp,” but several G4 expectation figures in **R45** are mathematically rounded rather than truncated:

* 8/28 London: `102/42 = 2.42857…` → **2.42 truncated**, not 2.43.
* 9/4 NY Yearly-VWAP: `297/171 = 1.73684…` → **1.73 truncated**, not 1.74.
* 9/7 London ASH: `65/37 = 1.75675…` → **1.75 truncated**, not 1.76.

By contrast, the J-ROWS figures also clearly contain conventional rounding examples such as `7/42 = 0.1666…` shown as `0.17`.

This does **not** threaten the deterministic G4 winner test because the named R figures are explicitly expectation checks, but the precision rule should be stated consistently.

---

**7. Minor — run-date boundaries are not fully explicit.**
**R38/R49** identify `08-26 to 09-10`, but do not state the exact terminal timezone or whether the upper date is inclusive through the final bar.

Since the packet says the explicit values are authoritative, this is probably inherited from the RECON52 baseline, but the cleanest wording is to say that the exact time/date boundary is **identical to the RECON52 acceptance baseline**.

RULING (builder): Luna-4 ADOPTED in G2 (exclusion joins at the admission/take bar, sweep-origin via mask-history walk when needed, TPCENSUS admitted-walk authoritative). Luna-5 accepted as traceability limitation (S1 single-hit anchors cover the unquoted sites; non-blocking by Luna's own tag). Luna-6 ADOPTED (rounded to 2dp in L42; 2.34 corrected to 2.35 in L45). Luna-7 ADOPTED (exact time/date boundary identical to the RECON52 acceptance baseline, L38-S5).

## Luna coherence plus better mechanism plus clearance list - ADOPTED whole, no deviation

### What is already coherent

The following parts do **not** give me a reason to halt the design:

* **R17/R32:** bits 14–21 are correctly aligned with `TpSessionLevelFiltered()`'s `sessIdx + 4` mapping.
* **R18/R33:** Luna-2's pre-bar swept exclusion is conceptually the right way to reconcile “deleted by absorption” with the seed-touch rule.
* **R30/R31:** the E2 reset/caching symmetry and E3 PD detection pattern are coherent on the page.
* **R33:** R2's 18-element ordering matches the R-POOL ordering, and the explicit map `0..9` / `10..17 → +4` is correct.
* **R33:** the inclusive R2 wick intersection is consistent with the deliberately documented “hit” versus “swept” asymmetry.
* **R38:** the S1 assertions around state ordering, stale authorization, seed-assignment ordering, R-POOL ordering, and value-domain are the right verification targets.
* **R43/R44:** the separation of SEEDVOID as diagnostic-only and the unchanged exit-leg scope are internally consistent.
* **R45:** the deterministic nearest-valid recomputation is correctly made the actual G4 pass criterion rather than the named candidate narratives.

### Analytic B — better mechanism

I would **not introduce a second sweep-tracking subsystem**. The current architecture is the right mechanism:

**E3 → existing swept-state fields → buffer-29 mask → E5 pre-bar R2 filter → existing nearest-valid consumer.**

The cleanest improvement is to make the E5 mask read **tri-state rather than fail-open**:

`valid mask` → perform swept-bit exclusion;
`EMPTY/unavailable/invalid mask` → do not claim the pre-bar validity state is known.

That would touch only the **E5 block at EA L7706 area / packet R33**, plus the corresponding **S1 verification at R38**. I would leave E2/E3/E4 and `TpSessionLevelFiltered()` unchanged.

### Clearance result

**AMEND-WITH-DELTA.**

The minimum amendments I would require before clearance are:

1. Reconcile the **E5 literal line count with R33/R38/R42**.
2. Resolve the **R2 mask-read failure behavior** so a failed read cannot silently become “all levels unswept.”
3. Add a **mask-domain assertion** in S1.
4. Tighten G2's **cross-bar PD-exclusion attribution semantics**.
5. Clean up the **R precision convention** in R45/R42.

Everything else is verification/traceability tightening rather than a redesign.

**Key: none volunteered.**

RULING (builder): Luna-B implemented span-for-span (mValid plus gate plus R2SKIP; E2/E3/E4 and the filter untouched as prescribed). The five clearance items land as: item 1 answered above (30 stands on v4 literals, 34 counted on v5); items 2-5 folded per the three rulings above.

## GLM verdict plus D1 withdrawal - carried dissolved, E2 stands on four-site proof

# VERDICT: ACCEPT

Clear **PACKET_P-VALIDITY-1 v4 by name** for exactly one build (E1, E1b, E2, E3, E4, E5 per the packet v4 literals, STAGE-1 exact-diff gated) plus one run under **RECON50_DEMO_USD using the RECON52 replay segment/acceptance baseline** (InpMode 1, 08-26 to 09-10, InpDebugLog=true, same terminal, 90-minute ceiling, DONE-file based), with **G1-G4 graded as stated**.

**Key: none volunteered.** Luna remains sole key source. This is a rules-on-the-page ruling only; nothing builds, runs, or spends on it.

---

## GLM-D1 — dissolved, and the dissolve is correct

My prior-round D1 is disproved and I withdraw it plainly. Three independent points, all on this page:

1. **The misquote was mine.** D1 cited "C01 … YNYL:66." C01 (J-ROWS) reads `YNYL:102` — the 66 value is C02's. The entire "flip at NY-rising" premise rested on that misquote.
2. **The page-proof holds.** C01 shows `NYL:102 … YNYL:102` — equal. At Friday 10:00, nyLow still holds Thursday's NY low (it resets at Friday NY-rising), so equality is only consistent with prevNY written at **PM-rising** (PM-SITE L305-306, quoted whole). C02 confirms the discriminating direction: post-NY-rising `NYL:38 ≠ YNYL:66` — NY-rising does not write prevNY.
3. **D1's fix would have been the bug it warned against.** Resetting pdNy at NY-rising resets a flag whose line (prevNY) does not change at NY-rising — erasing valid sweep memory mid-lifecycle, the false-admission failure mode D1 itself flagged. E2's placement stands.

RULING (builder): GLM ACCEPT-by-name recorded; it volunteers no key so the gate stays NO CLEARANCE. The D1 withdrawal is accepted with credit (falsifiable form, dissolved by its own terms). E2 placement now rests on four page-proven equal-value pairs (PML/YASL/LOL/NYL classes) plus the standing disk proof (sole prevNY writer PM-rising L305-306); S1 still asserts all four sites on disk with the NY-rising block as the highest-value eyeball per Sonnet.

## GLM findings 1-8 - ADOPTED or annotated, none touching the edit set except E5

## Analytic A — defects and imprecisions (all non-blocking; each with the gate that absorbs it)

**1. R-display convention is self-contradicted by the page's own rows (L42 vs J-ROWS B01/B02/B06 vs L45).** L42/G1 states "R displayed truncated to 2dp." The latch rows prove the code **rounds**: B01 7/42 = 0.1667 printed `R=0.17` (truncation prints 0.16); B02 14/78 = 0.1795 printed 0.18 (trunc 0.17); B06 10/54 = 0.1852 printed 0.19 (trunc 0.18). Under rounding, L45's figures 1.74 (297/171), 2.43 (102/42), 1.76 (65/37) are correct, but **"R 2.34" for 9/7 NY (54/23 = 2.3478) should read 2.35**. This is exactly the phantom-mismatch class my D3 warned about, inverted by the fold's word choice. One word at L42, one figure at L45. Cannot flip a grade (G4's pass rule is the recomputation; the ≥1.0 boundary operates on the true value), but it is a checkable page-internal contradiction and should be corrected or annotated before S7.

**2. The 8/28 London named chain names the wrong second condition (L45; A-4 ruling).** With pdPmLow dropping YPML:7, the next-nearest valid line in the C01 walk is **YASL:11** (1.16455) — ASL:11 is excluded by M01-bit3 but YASL rides only bit 15 — not the 102-pt tier. PDL (R = 102/42 = 2.43) therefore requires **pdPmLow AND pdAsiaLow** (low < 1.16455 − buffer after the London-rising reset), then the 102-tie resolves PDL (index 1) over NYL (7) and YNYL (15). The stated pdLondonLow condition is moot at this bar: YLOL is absent from C01's admitted walk (8/27's London low sits on the wrong side of the 1.16466 SHORT entry; it is not a candidate regardless of its swept status). If pdAsiaLow stays clear, the winner is YASL:11, R = 11/42 = 0.26 → no restoration — attributed per the L45 general clause, never a hard-gate failure. A-4's demand was "state them"; the fold states a chain C01 itself falsifies.

**3. The 9/7 London ASH branch omits its decisive condition (L45).** With pdPmHigh dropping YPMH:23, the next-nearest valid line at C04 is **YLOL:53** (1.16188), not ASH:65. YLOL rides bit 17, so the ASH outcome requires **pdLondonLow** — which is near-certain on this tape (pdLondonLow has tracked 9/4's London low 1.16188 since the Friday NY-rising reset, and 9/7 price at 09:15 is 1.16135, 53 pts under the line; it fires for any buffer < ~53 pts) — but it is unstated. Conversely the stated "pdAsia clear" is inert: ASH:65 and YASH:65 share the price and ASH (index 2) wins the earliest-index tie whether or not pdAsiaHigh drops YASH (index 10). Correct chain: pdPmHigh + pdLondonLow → ASH:65, R 1.76. Related result-file note: A01/A02 show the current 9/7 London take riding curTp = 1.16188 (YLOL) then promoting to 1.16270 (YNYH) — if pdLondonLow fired before admission the take re-derives; if after, the held take's E6 recompute drops YLOL mid-trade and the promotion path changes. G3's downstream-only clause covers both; mark-join will attribute.

**4. Same shape at 9/8 New York (L45).** YLOL-class (137/54 = 2.54) requires **pdPmLow AND pdNyLow** — with only pdPmLow, the winner is YNYL:11 (1.16209), R = 11/54 = 0.20 → no take. "Conditional" is honest (pdNyLow is genuinely buffer-dependent here — 9/8 morning traded only ~4 pts under the 1.16209 line), but the co-condition is unnamed.

**5. E2 join bytes unpinned (L30).** The appended fragments carry a six-space leading indent; whether that indent lands mid-line as the separator or is stripped is unstated. Line accounting (+0 new, +4 modified) and compilation are unaffected, and the S1 whitelist is generated from the same text, so no halt is possible — but one clause ("appended after one space" or "appended verbatim including its six-space lead") removes the last free byte in E2.

**6. Vestigial "(>= per Kimi-D1)" in L18.** v4's E5 contains no barTime-vs-anchorBarTime comparison — Kimi-D1's original one-char target no longer exists; coverage is by placement, which is correct. The phrasing points a future reader at a line that isn't there. One-clause rewording.

**7. SWEPTMASK display width (L38/G2, no assert).** The M-row prints `swept=` as a 10-char field (bits 0-9) and `live=` as 4 (bits 10-13). Post-change, `m=` carries bits 14-21 in the integer and E3's p-tags carry per-level attribution, so G2 attribution survives — but if the swept= formatter is hard-fixed at 10 chars, the new bits never render per-bit in that field. One S1 note (or accept m= as the PD-bit display) closes it. Display-only.

**8. Cosmetics.** L45 "YASL/Y PML" stray space. L38-S1 packs ~25 asserts into one sentence — complete, but a numbered sublist in the result file would let the operator tick items one by one.

RULING (builder): F1 ADOPTED (rounded; 2.35). F2/F3/F4 VERIFIED on the C01/C04/C07 admitted-walks and ADOPTED as L45 corrections - with one prior fold partially withdrawn per rule 19: the A-4 second condition is pdAsiaLow, not pdLondonLow (credit GLM); the surviving A-4 conclusion (three-event shape, earliest-index tie-break, general clause) stands. F5 ADOPTED as clause (fragments concatenate verbatim; six-space lead lands mid-line as written). F6 ADOPTED (vestigial pointer dropped; placement-plus-cadence wording). F7 ADOPTED as S1 note (m= accepted as PD-bit display). F8 ADOPTED (typo fixed; S7 sublist note). F2/F3/F4 live in the expectation layer L45 subordinates; no grade can flip on them.

## Kimi required delta plus minors - ADOPTED (S1 cadence assert plus counter plus S7 records)

## Verdict: AMEND-WITH-DELTA (one required verification delta; three minor folds). No key volunteered.

The page holds where it matters. I re-derived the load-bearing arithmetic and it reconciles: bit map 10..17 → 14..21 matches `TpSessionLevelFiltered` (`sessIdx + 4`) exactly against the R-POOL order; E2 reset sites match the cache-overwrite sites in R-RESET (PM cached at Asia-rising → pdPm resets at Asia site; NY cached at PM-rising → pdNy resets at PM site — the GLM-D1 page-proof correctly reads C01 `YNYL:102 == NYL:102`); R values check out (283/171=1.65, 297/171=1.74, 54/23=2.35, 102/42=2.43, 65/37=1.76); the 102-pt tie resolves to PDL by earliest sessbufs index (0 < 6 < 14); budgets reconcile (Sessions 8×8=64 new + 4 modified; EA 30 new + 1 modified; E5's own literal count is 30). But there is one genuinely unasserted execution-semantics hole, and it sits exactly where Kimi-D1 was folded.

---

## Required delta (blocking)

### 1. R2's execution cadence is nowhere asserted — and Kimi-D1's `>=` adoption silently depends on it (packet L18, L33, L38-S1)

E5 reads `iHigh/iLow(_Symbol, PERIOD_CURRENT, barShift)` — the **forming bar's range so far**. The touch test is only non-degenerate if the R2 block executes **intrabar**, on ticks after the current bar's wick has extended. The packet never states this. If the containing per-bar site runs once at bar open (consistent with "single pass per bar blocks same-bar re-admission," L18), then at execution time `r2_hi == r2_lo == open`, and:

- the adopted Kimi-D1 semantics ("seed bar covered too — the retest bar IS the retest subject," L18) is **vacuous**: the retest bar's own wick is never actually tested;
- a sweep occurring on the bar after seeding is caught only if R2 re-runs during that bar; if it waits for the next bar's open, the Luna-2 pre-bar mask skip (L33) has already excluded the freshly-swept line, and the touch is swallowed silently;
- and G2's "zero SEEDVOID occurrences is not a gate failure" (L43) then launders the whole failure mode — a never-firing mechanism and a non-exercised one produce identical logs.

**Required S1 assert (L38):** "assert the R2 block executes on every tick while the guard holds (`g_state > ST_IDLE && g_state < ST_S5_GATE_CHECK && g_anchorBarTime > 0`), not gated to new-bar; if the containing block is new-bar-gated, HALT and relocate R2 to a tick-driven site." This is verification-only, zero design change — but without it the mechanism's correctness is unprovable from the page.

---

## Minor folds (non-blocking)

**2. Mechanism-presence needs an audit trail when SEEDVOID count is zero (L43, L49, L38-S7).** "Mechanism present vs exercised distinguished" is asserted but not instrumented. Add a cheap counter (e.g., increment a diagnostic int inside the R2 guard, print in the result summary, or log an `R2EVAL` diagnostic row) so a zero-SEEDVOID run can still *prove* the touch test ran N times with a live range. Two lines inside E5, zero anchor cost.

**3. SEEDVOID's census family bucket is unnamed (L22, L33, L38-S1, G2).** G2 makes "zero unpredicted families" a hard gate against a seven-family taxonomy; the SEEDVOID row is a new row prefix. Map it explicitly to **SEEDDIAG** ("SEEDVOID is a SEEDDIAG-family diagnostic row") so the hard gate has a stated bucket and a result file can't be read as an eighth family either way.

**4. R2 voids on a pre-confirmation touch of the would-be TP line too (L18, L38-S7).** R2 fires on touch of *any* of the 18, including the line that would have been the take. That is the correct conservative reading of his sentence 3, but it should sit in the result file as a stated design fact next to the Kimi-A-6 asymmetry — not be discovered there.

**5. The void-trigger pool boundary is the packet's reading, not his verbatim word (L18).** "Session liquidity" is mapped to the 18 R-POOL lines only; Yearly/Monthly/Quarterly/FOMC POC/VWAP and POI are not void triggers. G4's 9/7 New York expectation (take at Yearly-VWAP 1.16315) *depends* on this — the seed survives a Yearly-VWAP touch. Record it as a stated assumption in S7 so a future "his sentence 3 meant all drawn liquidity" reading doesn't retroactively void this run.

**6. The r2 index→bit map is derived twice (L33 vs R-FILTER L2265-2266).** S1's byte-compare assert covers drift, so this is parked, not blocking — but note that a shared one-line helper (`SweptBitForPoolIndex`) would make the equality definitional rather than asserted. Exact-diff minimalism legitimately parks it; the assert is the right call at this stage.

---

## Analytic ask B — better mechanism

For the stated goal (one source of truth for "deleted by absorption," pre-bar semantics, no new state), Luna-B's mask-reuse prescription remains the right mechanism and E5 implements it span-for-span. The only mechanism change I'd advocate is **delta 1's consequence**: make R2's tick-driven execution an explicit property of the design (move it out of any new-bar gate if S1 finds one), because the pre-bar mask read + current-bar wick combination is *correct but only under intrabar execution* — the semantics and the cadence are one decision, and the page currently specifies only half of it. Rejected-by-me-and-parked alternatives, for the record: settle-bar wick testing (a sweep on bar N evaluated at bar N+1 is swallowed by Luna-2's own pre-bar exclusion — self-defeating); macro-generated E3 blocks (cleaner duplication control, violates exact-diff minimalism); `TpSessionLevelFiltered` reuse (already correctly rejected — it would exclude live lines R2 must keep).

---

## On the question asked

I cannot clear v4 by name as-is because of delta 1: not because the design is wrong, but because the page asserts twenty things about R2 and not the one that makes the other nineteen observable. Fold delta 1 into L38-S1, optionally folds 2-5, and the edit set is the cleanest version of this thread — I'd have nothing left to amend. Disk truth, hashes, and the four sites' symmetry remain his machine's proof, not mine. No key volunteered; nothing here builds, runs, or spends.

RULING (builder): Delta 1 ADOPTED as S1 text (tick-driven assert with HALT-plus-relocate; verification-only, zero design change). The swallow scenario it names is closed by cadence plus placement jointly. Minor 2 ADOPTED (static counter decl plus inc; evals piggybacked span-neutrally onto SEEDVOID and R2SKIP rows; S7 reports max plus per-row evals; the fully-silent healthy path rests on the S1 cadence assert - stated here, not hidden). Minors 3/4/5 ADOPTED (SEEDDIAG bucket in L22/G2; TP-line fact and pool-boundary assumption in S7). Minor 6 parked (shared helper; byte-compare assert stands).

## Sonnet substance-accept - ACCEPTED; residual dissolved by GLM pairs, S1 eyeball stays

Reading this on the page only, not claiming any authority to clear, build, run, or spend anything.

**Verdict: substance-accept, no authority, no key volunteered.**

What I checked and what holds up:

**r2_bufs vs sessbufs ordering (the fragile assumption Sonnet flagged) — verified matching, index for index.** Both arrays are given in full in this message. Walking them side by side:

```
idx  sessbufs (R-POOL)         r2_bufs (E5)
0    FL_BUF_PDAY_HIGH          FL_BUF_PDAY_HIGH
1    FL_BUF_PDAY_LOW           FL_BUF_PDAY_LOW
...  (identical through)
17   FL_BUF_PD_PM_LOW          FL_BUF_PD_PM_LOW
```

They match exactly. That closes Sonnet's one open caveat as far as this page goes.

**Swept-bit mapping is consistent across all three sites that use it.** `TpSessionLevelFiltered` maps sessIdx 10..17 → bit sessIdx+4; E4's mask export sets pdAsiaHighSwept→bit14 ... pdPmLowSwept→bit21; E5's `r2_sweptBit = r2_k<=9 ? r2_k : r2_k+4` produces the same bit for the same index. One source of truth, correctly threaded through producer, filter, and R2.

**GLM-D1's citation doesn't survive a direct read of the J-ROWS you pasted.** GLM claims C01 shows `NYL:102 ... YNYL:66`. Actual C01 line: `NYL:102 ... YNYL:102` — YNYL:66 is C02's value, not C01's. That's a cross-row misquote, and it's the entire evidentiary basis for D1. The disproof stands on the page as given.

**Residual risk I'd flag before S1, not new, but worth restating plainly:** the London and NY reset sites (L284-301) were never quoted in this document — only Asia-rising and PM-rising were. The final E2 placement (NY site resets pdLondon, PM site resets pdNy) is verified *for the PM site* by R-PMSITE-B (prevNYHigh/Low cached there, so that's correctly where pdNy should reset). It is *not* verified for the NY site's pdLondon reset, since the NY-rising block isn't shown here. Your own S1 already requires eyeballing this — I'd treat it as the single highest-value thing to actually look at before the build, since it's the one claim in the whole packet I can't check from what's on this page.

**E2/E3/E4 line-budget arithmetic checks out by hand count:** E3's 8 sites × 8 lines = 64; E5's block, counted line by line, lands at 30. Both match the stated G1 budget.

No line-numbered defect beyond the unverifiable NY-rising site above. No better mechanism to add beyond what Luna-B/Sonnet already converged on.

RULING (builder): Ordering match, bit-map threading, and E5 30-count concurrence carried as verified. The NY-rising-site residual is dissolved on the page by GLM's four equal-value pairs and remains a disk assert in S1 (highest-value pre-build eyeball, unchanged). No authority claimed or needed.

## G-RULES (packet v5 G1-G4 operative, carried by reference to the twin above)

G1 build 0/0 both targets plus post-hash plus per-file budget (State +8 new, Sessions +64 new +4 modified, FlowLogic +8 new, EA +34 new +1 modified; R rounded to 2dp); G2 PD-exclusions plus SEEDVOID kills plus R2SKIP holds attributed per bar with join key (bar, direction, buffer index, value) plus admission-bar join semantics plus census-context note plus conditional SEEDVOID/R2SKIP plus take-identity plus multi-touch first-hit note plus seven-family identity (SEEDVOID/R2SKIP in SEEDDIAG) plus zero-unpredicted hard gate plus inclusive flat-1.0 boundary; G3 exit legs untouched with deltas only downstream of takes changed by validity/renewal plus DAY_CLOSE mark-joined on restored held takes plus 9/7 London promotion-path mark-join plus MTFLIP zero; G4 takes re-joined bar-for-bar with expectation-checks-only named candidates and deterministic nearest-valid recomputation as the pass rule, corrected conditional chains (8/28 London pdPmLow plus pdAsiaLow with YASL branch; 9/7 London pdPmHigh plus pdLondonLow; 9/8 New York pdPmLow plus pdNyLow), 8/28 New York never-valid moot, residue otherwise, model-R with 0.84 retired, rejects silent, deployment shut.

## DISSENT AND PARKS (open)

Luna-1 disproved on enumeration (30 stands; 34 counted on v5); Luna-2/3/4/6/7 folded (anchors above); Luna-5 accepted limitation; Luna-B adopted whole; GLM-D1 withdrawn with credit, E2 on four-site proof; GLM-F1/F5/F6/F7/F8 folded; GLM-F2/F3/F4 verified and folded with A-4 correction credited; Kimi-1/2/3/4/5 folded; Kimi-6 parked (shared helper; assert stands); Sonnet residual dissolved on page, S1 eyeball stays. Parked with reasons (unchanged): Luna-helper plus Kimi-B2/B3/B4 (exact-diff minimalism; Kimi-B1 adopted as barShift+1); Luna s1f-line idea dissolved (readers diagnostic-only); table-driven E3 rejected (no member pointers, harder anchors). His veto on substance stands; prior alternatives stay parked operator-vetoable.

## RUN-COST

One build (E1, E1b, E2, E3, E4, E5 literals per packet v5, STAGE-1 exact-diff gated) plus one tester run under RECON50_DEMO_USD using the RECON52 replay segment/acceptance baseline, ceiling 90 minutes, explicit values authoritative (InpMode 1, 08-26 to 09-10, InpDebugLog=true, same terminal; exact time/date boundary identical to the RECON52 acceptance baseline). Build and run only on dual-key clear plus his run word plus token. No commit without token.

## NOVEL-EVIDENCE

This run returns what no prior run did, named against RECON52 (DA975803, takes 1/7): (a) first swept-validity run with mask bits 14-21 live and PD exclusions census-joined; (b) renewal run instrumented to produce first renewal evidence if SEEDVOID occurs (rows plus fresh re-seeds when observed); (c) restored takes on live lines under the kept inclusive gate; (d) wick-join for the open unknown (9/7 London); (e) first tri-state mask audit (R2SKIP rows plus r2_evals proving evaluation cadence). Exit= figures are target figures, never realized fills.

## Question (one, specific)

Clear PACKET_P-VALIDITY-1 v5 by name for exactly one build plus one run under the envelope above, with G1-G4 graded as stated - accept, amend-with-delta, or halt, with line numbers and any volunteered key.

## Analytic ask A (standing)

Name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.

## Analytic ask B (standing, code relays)

State any better mechanism you see for the stated goal, with the code lines it would touch.

## Answer form

Plain accept / amend-with-delta / halt, with line numbers, plus analytic answers and any volunteered key.

## Verification split

Rule on the page only - genuineness vs disk is proven on disk (digests plus counts above) and is not answerable from chat by any model tier. Do not ask for files.

Nothing else is asked. Thank you.
