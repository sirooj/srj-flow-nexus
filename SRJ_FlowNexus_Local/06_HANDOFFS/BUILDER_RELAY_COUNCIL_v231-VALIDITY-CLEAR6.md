# CODE REVIEW REQUEST - v231 - 2026-09-22 (PACKET_P-VALIDITY-1 v6: S1-halt TEXT amendment only, zero literal changes; nothing builds or spends on this verdict alone)

## Project brief (standing - read first)

- Money: clearance ask for exactly one build (E1, E1b, E2, E3, E4, E5 per the v5 literals, unchanged in v6, STAGE-1 exact-diff gated) plus one tester run under the stated envelope. Alert-only EA. No live trades. No funded money moves on any verdict here. Build and run only on dual-key clear plus his run word plus token. Nothing here builds, runs, or spends by itself.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: validity thread - v230 relay (45515324/72425/563, TRANSPORTED) drew 4x ACCEPT (Luna by name + 9 non-blocking, Sonnet by name + 2 notes, GLM + 9 findings, Kimi + 4 notes; all filed whole 1x each under V231 markers; ledger 578 triaged every finding into an existing gate with no edit-set change owed). NO clearance (zero keys volunteered), NO keys. Then STAGE-1 execution of cleared v5 HALTED on the packet's own tick-cadence assert: the disk tree runs once-per-bar closed-bar, so the assert's tick-execution demand is unsatisfiable (diagnosis filed whole as 06_HANDOFFS\BUILDER_FINDING_S1-CADENCE-HALT.md, ledger 580; packet and EA untouched, nothing reverted). This v6 answers the halt with TEXT ONLY. Prior texts ride labeled, never as words of any seat.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money. Note: the v5 Luna key does not cover the v6 digest (new key owed post-clearance).

## Change (one plain sentence)

Clear PACKET_P-VALIDITY-1 v6 TEXT AMENDMENT by name (S1 cadence assert plus L18 clause reworded to the measured closed-bar model plus one typo fix; E1-E5 literals byte-identical to cleared v5) for exactly one build plus one run under RECON50_DEMO_USD using the RECON52 replay segment/acceptance baseline with G1-G4 graded as stated.

## Money (standing)

Behavior-change build confined to sweep state (SRJ_State.mqh decls), sweep detection (SRJ_Sessions.mqh), mask export (SRJ_FlowLogic.mq5 buffer 29, frozen baseline touched via route), and the seed site plus one comment line (EA). Alert-only EA. No live trades. No funded money moves on any verdict here. Build and run only on dual-key clear plus his run word plus token. No commit without token.

## Session

NEW fresh session every time (his order 2026-09-20). Prior texts ride labeled with file plus marker plus digest, never as anyone's words.

## Packet

01_TASKS\PACKET_P-VALIDITY-1.md v6 DRAFT: F15B1777C31664A6E9FF2067A379A9776B83DE31DCB8D1E82A5486AD317040C2 / 25729 B / 50 lines (TEXT AMENDMENT ONLY over v5 0E44ED96/25765/50: S1 + L18 closed-bar wording, L22 typo; E1-E5 literals untouched). Pre-build trees: EA DA97580358ED7ACCFB02208BFD9B0ED97185398BC3DC93D55F7AA3366E3742C4 / 616591 B / 11236 lines (v12-built, uncommitted; STAGE-1 halts on drift); FlowLogic/Sessions/State measured fresh at S1 (no pre-stated figures).

## Seat packaging

Identical text to Luna plus Sonnet plus GLM plus Kimi (same four seats as transported v230). Keys volunteered only (Luna remains sole key source); any seat halts on a checkable discrepancy with line numbers. v231-round verdicts file under V232 markers (V231 markers hold the v230 round).

## TWIN (v6 packet: all 50 packet-lines quoted whole below, R01-R50; bodies verbatim, generated mechanically from disk bytes)

[[TWIN-B]]
R01 (= packet L1, whole): # PACKET_P-VALIDITY-1 v6 DRAFT - swept-session absorption + seed renewal (v6 S1-halt text amendment, zero literal changes)
R02 (= packet L2, whole): 
R03 (= packet L3, whole): Status: v6 DRAFT (not issued, not cleared, not executed). v5 0E44ED96/25765/50 adopted-as-base (transported twin, V231 4x ACCEPT 0 keys, S1-HALTED on the tick-cadence assert vs once-per-bar disk, superseded by reference here; diagnosis BUILDER_FINDING_S1-CADENCE-HALT.md). TEXT AMENDMENT ONLY: S1 cadence assert + L18 clause reworded to the measured closed-bar model + L22 typo fixed; E1, E1b, E2, E3, E4, E5 literals byte-identical to cleared v5 (all prior accepts stand on them). The v5 Luna key does not carry to the v6 digest (new key owed post-clearance). Nothing builds or runs on this file. Nothing builds or runs on this file. Clearance via a clearance relay plus token plus his run word, all owed. Canonical files: exactly FOUR - Include\SRJ\SRJ_State.mqh (8 new swept-field decls, 18 held post-build), Include\SRJ\SRJ_Sessions.mqh (8 resets + 8 detection blocks), Indicators\SRJ_FlowLogic.mq5 (8 mask lines, frozen baseline touched via route), Experts\SRJ_FlowNexus_EA.mq5 (one seed-retirement block + one comment refresh). No new indicator buffers (mask-bit reuse + existing PD line buffers). Nothing under 02_TASK_CHECKPOINTS. No commit without token. Successor context: PACKET_P-EXITMODEL-2 v12 (F1/F2/F3 live tree DA975803, RECON52 graded); this packet changes NO booking order, NO gate, NO exit leg.
R04 (= packet L4, whole): 
R05 (= packet L5, whole): ## Authority (all on record, no invention)
R06 (= packet L6, whole): 
R07 (= packet L7, whole): - His absorption words 2026-09-22 (ledger 557, verbatim): session highs/lows swept even by wick are deleted by absorption; entry POI needs a fresh POC/VWAP touch; a valid retest hit by session liquidity before 5m retracement + confirmation needs another retest. Labeled hypothesis, now ordered implemented (ledger 559: "Implement my second half of hyphothesis now" - scope word for this item; exit-only scope preserved otherwise).
R08 (= packet L8, whole): - Spec Part A v4.2 section 3.7 L185 (nearest valid TP must imply 1R+) + L187 (a target is valid unless already swept as session liquidity or closed over). His suspicion matches spec - validity hinge, never a rule change.
R09 (= packet L9, whole): - His R boundary 2026-09-22 (ledger 559): flat 1.0 valid, 0.99 invalid; 7 Sep New York +1.06 valid; 9/4 New York valid with dynamic exit (exit may print below 1R); journal 0.84 retired flawed (day-close exit unimplemented), 9/4 exit reference TBD by day-close model. Code gate >= 1.0 conformant.
R10 (= packet L10, whole): - Code gap proved read-only (finding BUILDER_FINDING_SWEPT-ABSORPTION.md 8A9F0479/5721/50): EA consumer L2261-L2275 reads bits 14..21 but FlowLogic L1371-L1392 sets 0..13 only; zero PD-session swept fields include-wide; sweep test wick-based (Sessions L346-435); detector EA L1920 fresh per bar with no seed-retirement transition (abort set 7 reasons, FRESHSKIP single PRE_BINDING, EA zero liquidity refs).
R11 (= packet L11, whole): - Bar proof body-standard, all restorations buffer-conditional (body-cross does not imply overshoot+buffer): SWEPT 8/28 London + 9/4 New York + 9/7 New York + 9/8 New York; fresh 9/8 London take; unknown 9/7 London (closes silent on wicks - packet run-grade step); 8/28 New York never valid (A1 declined, moot - corrected same turn).
R12 (= packet L12, whole): - Exit-only scope (AGENTS rule 30): this packet touches validity only - booking race, gate constant, exit legs, census formats all UNCHANGED.
R13 (= packet L13, whole): - S1-halt amendment (ledger 580, diagnosis S1-CADENCE-HALT): S1 tick-cadence assert (Kimi-1 fold) vs disk once-per-bar closed-bar tree (OnTick L11220-11223 early-return; sole tick entry; site inside EvaluateClosedBar(1, currentBarTime), barShift = 1 finalized wick, barShift+1 = 2 settled). Kimi-1 a/b/c/d ruled FALSE/FALSE/FALSE/MOOT on disk; mechanism sound under closed-bar; per-tick chattiness trio moot. V231 returns absorbed with no folds owed (all findings non-blocking per authors, each in an existing gate; Sonnet L42 note stale; L22 typo fixed here). Folds below: S1 assert reworded to closed-bar (HALT only if the site leaves the EvaluateClosedBar path) + L18 cadence clause to match; E1-E5 literals untouched.
R14 (= packet L14, whole): 
R15 (= packet L15, whole): ## Rule (validity hinge of his 536 nearest-VALID word; dead lines were never valid)
R16 (= packet L16, whole): 
R17 (= packet L17, whole): - V1 PD-sweep wiring (wick-standard, mirroring the session tests): 8 prev-session swept flags with reset-on-cache-overwrite lifecycle; mask bits 14..21 exported; existing EA consumer (L2265-L2267) filters them with ZERO EA logic change (E1b refreshes one stale comment only). Swept prev-day lines leave the race; nearest-VALID then skips to the next-nearest valid line, live or prev-day.
R18 (= packet L18, whole): - V2 seed retirement (his renewal word): while seeded-but-unconfirmed (named set ST_S1_REGIME..ST_S4_ARMED, S1 asserts contiguity), a bar whose wick touches any still-valid line of the 18 session/PD pool (packet's reading of his session liquidity: the 18 session/PD lines of R-POOL only - Yearly/Monthly/Quarterly/FOMC POC/VWAP and POI are not void triggers (stated assumption); pre-bar swept-mask exclusion per Luna-2 - levels already marked swept as of barShift+1 are deleted-for-TP and skipped here; mask unavailable-or-invalid at barShift+1 = R2SKIP (seed held, SEEDDIAG diagnostic row), never silent all-unswept; a sweep occurring on the current seed bar still counts because the pre-bar state is intentionally used) voids the seed (state to ST_IDLE, anchor cleared, SEEDVOID diagnostic row with bar, direction, buffer index, value); entry then needs a fresh DetectPoiRetest find. Placed after the per-bar seed block: single pass per bar blocks same-bar re-admission (s1f staleness dissolved by construction - readers L7716/L7744/L7777 diagnostic-only); seed bar covered by placement (R2 sits after the per-bar seed block: the retest bar IS the retest subject); R2 executes in the once-per-bar closed-bar pass (site inside EvaluateClosedBar: barShift = 1 finalized wick, barShift+1 settled pre-bar; S1 asserts the site has not left that path); pre-bar reads prevent false fire; S5+ committed to the gate outcome; anchor POI untouched; managed trades exempt. Touch test: current-bar wick vs pre-bar line state (barShift+1 settled slot; PD/prev lines fixed) so extension bars don't false-fire; runs before the state-machine body (S4 to S5 transitions later in file order).
R19 (= packet L19, whole): 
R20 (= packet L20, whole): ## Scope (validity ONLY)
R21 (= packet L21, whole): 
R22 (= packet L22, whole): - TpTargetUpdateBest reduction, tie-breaks, gate comparator, exit engine, censuses, ALERT kinds, regime, SL, entry pipeline otherwise: all UNCHANGED. SEEDVOID is a SEEDDIAG-family diagnostic row, never an ALERT kind; R2SKIP same family; MTEXIT reasons unchanged. The 8/28 London daily-POC pool-coverage flag rides unchanged (not this packet); 8/28 New York is never valid (A1 declined, moot).
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
R38 (= packet L38, whole): S1 Pre-hash gate: re-hash EA (must equal DA97580358ED7ACCFB02208BFD9B0ED97185398BC3DC93D55F7AA3366E3742C4 / 616591 B / 11236 lines) + fresh-measure FlowLogic/Sessions/State (record, no pre-stated figures); literal diff whitelist for the four files (exactly E1, E1b, E2, E3, E4, E5 hunks and nothing else - extra bytes = DIAGNOSE/HALT); single-hit + char-code assert every OLD anchor above; assert PD buffer writers (FlowLogic L1172-1179), ST ordering + contiguity + named set, LogState shape, 18 FL_BUF_ names pre-declared, barTime pin, E6 span above byte-identical, seven-family taxonomy (SIGNAL, TP_ELECT, SIDE1X, SIDE1E, STOPRESOLVE, SEEDDIAG, SESSION_LIMIT - v12 set), zero-init convention, tag count-once per level with no thisBarSweeps-keyed consumer outside the mask print, seed-block to R2 to S-advance execution order with single pass per bar, s1f chain diagnostic-only (L7657 decl + L7716/L7744/L7777 readers), no seed-assignment path after the R2 block in file order, assert all managed/committed trade states outside the R2 guard interval, assert no stale dir/anchor metadata authorizes seed/admission post-SEEDVOID, single 18-line candidate-walk consumer set (L2284, L10906, r2_bufs new), r2 swept-bit map == R-FILTER map (0..9 identity, 10..17 +4, byte-compared), assert R2 executes in the once-per-bar closed-bar pass inside EvaluateClosedBar (barShift = 1 finalized wick vs barShift+1 settled pre-bar; site left that path = HALT), assert mask-domain (r2_mValid predicate: MathIsValidNumber + integral + range [0, 4194304)), accept m= as the PD-bit display (swept= 10-char + live= 4-char widths unchanged), r2 value-domain (EMPTY_VALUE/SRJ_NA_DBL/real price at barShift+1, no 0.0-sentinel/NaN writer), leading-underscore identifiers char-coded. Miss = DIAGNOSE, never assume, never revert. S2 Apply E1, E1b, E2-E5 exact-diff (E1b counts as modified-line, E2 appends count as modified-lines, all others insertions). S3 Post-hash per file + budget arithmetic from literal counts (inserted-vs-modified split). S4 Compile EA + indicator metaeditor64: 0 errors 0 warnings. S5 One run under RECON50_DEMO_USD using the RECON52 replay segment/acceptance baseline (explicit values authoritative: InpMode 1, 08-26 to 09-10, InpDebugLog=true, same terminal, 90-min ceiling, DONE-file based; exact time/date boundary identical to the RECON52 acceptance baseline; no DONE by ceiling = VOID run, hard failure, transport stops). S6 Gates G1-G4 below. S7 Result file BUILDER_RESULT_<RUN>-VALIDITY-V1.md pattern plus tabulate with DONE file plus stated design facts: R2 touch inclusive without buffer vs V1 exclusion wick-through-plus-buffer (his hit-vs-swept wording); R2 voids on pre-confirmation touch of the would-be TP line too; void-trigger pool = 18 R-POOL lines only (Yearly/Monthly/Quarterly/FOMC + POI not triggers); result states r2_evals max + per-row evals, S1 asserts ticked as numbered sublist.
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

## FILTER (whole EA L2261-L2275, byte-exact fresh pull; the consumer V1 relies on)

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

## S1F (whole EA L7777-L7778, byte-exact fresh pull; diagnostic-only readers)

[[R-S1F-B]]
     bool s1f_seedThisBar = (s1f_seedArmed && g_state == ST_S1_REGIME && g_dir != DIR_NONE && g_anchorLine >= 0);
     if(s1f_seedThisBar)
[[R-S1F-E]]

## PMSITE (whole Sessions PM-rising site L302-L310, byte-exact fresh pull; sole prevNY writer)

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

## ONTICK (whole EA L11218-L11235, byte-exact fresh pull; the once-per-bar gate - S1-halt proof part 1)

[[R-ONTICK-B]]
void OnTick()
  {
   static datetime s_lastBarTime = 0;
   datetime currentBarTime = iTime(_Symbol, PERIOD_CURRENT, 1);
   if(currentBarTime == s_lastBarTime) return;
   s_lastBarTime = currentBarTime;
   LoadWorkingSet(1, currentBarTime);
   EvaluateClosedBar(1, currentBarTime);
   StoreWorkingSet(1, currentBarTime);
   //--- [P-EXITMODEL] the section 4 site-3 exit phase: runs AFTER the entry pipeline
   //--- and AFTER the working-set store (it touches NO working-set field - section 7
   //--- separation). Evaluates the managed trade at the NEXT candle's open.
   EvaluateManagedTrade(1);
   //--- [P-NEWS-1 E22] blackout census hook, last: observes the settled state.
   SrjNewsInit();
   if(InpDebugLog && SHADOW_NEWS)
      SrjNewsOnBar(currentBarTime);
  }
[[R-ONTICK-E]]

## EVALSIG (EA L6587, byte-exact fresh pull; closed-bar entry signature - S1-halt proof part 2)

[[R-EVALSIG-B]]
void EvaluateClosedBar(int barShift, datetime barTime)
[[R-EVALSIG-E]]

## R2SITE (EA L7693-L7708, byte-exact fresh pull; seed assign precedes the R2 insert point - S1-halt proof part 3)

[[R-R2SITE-B]]
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

         //--- [S2-TIMING-SHADOW-001] seed-bias recorder (Luna V94 F1, cleared BY NAME
[[R-R2SITE-E]]

## HALT RECORD (builder S1 diagnosis, filed whole as 06_HANDOFFS\BUILDER_FINDING_S1-CADENCE-HALT.md 4BF86E5994A09F914823959ACFE1F0FE5D013C6803E3E5D11005FDC5343E7E54/4744 B; operative measurements quoted inline from the byte-exact pulls above)

The v5 S1 assert demanded R2 execution on every tick while the guard holds, with HALT plus relocate on a new-bar-gated site. Disk proves the demand unsatisfiable: OnTick returns early unless bar-1 time changed (whole function above); OnInit/OnDeinit/OnTick are the only entry points (timer/chart/trade/tester handler count zero); the seed/R2 site sits inside EvaluateClosedBar(int barShift, datetime barTime), called once per new bar as EvaluateClosedBar(1, currentBarTime) — so barShift is the just-closed bar with finalized wick and barShift+1 is settled pre-bar. A tick-driven relocation target does not exist in this tree. The v4 premises underneath (Kimi-1 a/b/c/d) were ruled FALSE/FALSE/FALSE/MOOT on the same disk the same turn: closed-bar range is non-degenerate, same-pass seed coverage holds, pre-bar skip aging is correct. The mechanism is sound under the measured cadence; only the assert wording was wrong. The per-tick chattiness notes fall with the premise (at most one R2 row per bar while the guard holds).

## FOLDS (v6 text diffs: each names its packet anchor; E1-E5 carry by reference to cleared v5, byte-identical)

- L1/L3: version bump plus supersession chain (transported v5 twin 0E44ED96 superseded by reference, adopted as base; V231 absorptions noted; v5 Luna key does not carry).
- L13: S1-halt amendment record (ledger 580 + diagnosis reference; Kimi-1 a/b/c/d dispositions; V231 no-folds-owed with Sonnet-stale-note and L22-typo callouts).
- L18: cadence clause reworded (every-tick plus HALT-plus-relocate replaced by once-per-bar closed-bar pass with barShift/barShift+1 values plus HALT-only-if-relocated).
- L22: typo fixed (stray period removed).
- L38-S1: cadence assert reworded (tick execution replaced by closed-bar-pass membership with the same HALT consequence on relocation).
- E1, E1b, E2, E3, E4, E5, S2-S7, G1-G4, envelope, budgets: UNCHANGED from cleared v5 (EA +34 new +1 modified stands; 34-count stands).

## G-RULES (packet v6 G1-G4 operative, identical to cleared v5, carried by reference to the twin above)

G1 build 0/0 both targets plus post-hash plus per-file budget (State +8 new, Sessions +64 new +4 modified, FlowLogic +8 new, EA +34 new +1 modified; R rounded to 2dp); G2 PD-exclusions plus SEEDVOID kills plus R2SKIP holds attributed per bar with join key plus admission-bar semantics plus conditional rows plus SEEDDIAG bucket plus zero-unpredicted hard gate plus inclusive flat-1.0 boundary; G3 exit legs untouched with downstream-only deltas plus mark-joins plus MTFLIP zero; G4 deterministic nearest-valid recomputation with corrected conditional chains, 8/28 New York never-valid moot, residue otherwise, model-R retired, rejects silent, deployment shut.

## DISSENT AND PARKS (open, carried from v5)

Luna-1 disproved (30 stands; 34 counted); Luna-2/3/4/6/7 folded; Luna-5 limitation; Luna-B adopted; GLM-D1 withdrawn; GLM-F1/F5/F6/F7/F8 folded; GLM-F2/F3/F4 verified-folded with A-4 correction; Kimi-1 superseded by this amendment (tick assert replaced with closed-bar assert, same HALT consequence); Kimi-2/3/4/5 folded; Kimi-6 parked; Sonnet notes absorbed. V231 findings absorbed at existing gates, no folds owed. Parked with reasons (unchanged): Luna-helper plus Kimi-B2/B3/B4; table-driven E3 rejected. His veto on substance stands.

## RUN-COST

One build (E1, E1b, E2, E3, E4, E5 literals per packet v5, byte-identical in v6, STAGE-1 exact-diff gated) plus one tester run under RECON50_DEMO_USD using the RECON52 replay segment/acceptance baseline, ceiling 90 minutes, explicit values authoritative (InpMode 1, 08-26 to 09-10, InpDebugLog=true, same terminal; exact time/date boundary identical to the RECON52 acceptance baseline). Build and run only on dual-key clear plus his run word plus token. No commit without token.

## NOVEL-EVIDENCE

This run returns what no prior run did, named against RECON52 (DA975803, takes 1/7): (a) first swept-validity run with mask bits 14-21 live and PD exclusions census-joined; (b) renewal run instrumented to produce first renewal evidence if SEEDVOID occurs (rows plus fresh re-seeds when observed); (c) restored takes on live lines under the kept inclusive gate; (d) wick-join for the open unknown (9/7 London); (e) first tri-state mask audit (R2SKIP rows plus r2_evals proving evaluation cadence). Exit= figures are target figures, never realized fills.

## Question (one, specific)

Clear PACKET_P-VALIDITY-1 v6 TEXT AMENDMENT by name for exactly one build plus one run under the envelope above, with G1-G4 graded as stated - accept, amend-with-delta, or halt, with line numbers and any volunteered key.

## Analytic ask A (standing)

Name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.

## Analytic ask B (standing, code relays)

State any better mechanism you see for the stated goal, with the code lines it would touch.

## Answer form

Plain accept / amend-with-delta / halt, with line numbers, plus analytic answers and any volunteered key.

## Verification split

Rule on the page only - genuineness vs disk is proven on disk (digests plus counts above) and is not answerable from chat by any model tier. Do not ask for files.

Nothing else is asked. Thank you.
