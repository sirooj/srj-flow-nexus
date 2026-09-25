# BUILDER RELAY COUNCIL v286-ENTRY-GUARDS - packet P-ENTRY-1 v1 (S5.4 gate + recency; UJ owed)

## 0. What this round is (read first)
- Packet v1 (01_TASKS\PACKET_P-ENTRY-1.md EC920021/14766/162) builds the entry-path missing pieces his chart proved: E1 S5.4 pre-confirmation invalidation gate (spec Part A v4.2 S5.4, filed NOT BUILT) + E2 confirm-recency (retest must stand before the confirm bar). Base tree D74FE972/633552/11502 (his 7-trade EU tree, current disk, reverted + recompiled 0/0).
- UJ 3-row detector is OWED post-evidence, NOT in v1 (his 3 objections open; consented run stopped; diagnosis spec in packet). A relay grading UJ takes on v1 is defective BY FORMAT.
- This relay asks TWO questions (Q1 S5.4 rule, Q2 recency + preservation). Same text to every seat. Nothing builds, runs, spends, or clears live activation here.

## Priors (labeled, never as anyone's words)
- His chart rulings R3/R4 (finding RETEST-INVALIDATION-V1 section 6: 8/27 last-valid-retest 18:05 dead by 18:10+18:15 closes; 9/1 same-pass retest+confirm off-by-one; segment-proved same turn).
- His blind critic (ledger 749/750 + finding USDJPY-MISSES whole: 3 valid UJ rows missed + confirm-once + 3 open objections).
- Spec Part A v4.2 S5.4 + S5.5 + section 6 + §3.4 (operative sentences quoted in the packet Authority; status NOT BUILT on record).
- Matrix (BUILDER_MATRIX_TREETAKES.md: D74FE972 7/7 per his report + RECON60; E6E90831 6/7 + 1 false; v7 EU unknown).
- His reports (ticket 1359506594 EU 8/26-9/10 7 trades + UJ June 7 trades, read whole, mtime-filed).
- Segments: RECON67-V5-EU E8B0E582/5833128/31450 (ruled bars) + RECON60-RESQUAT-V12 4824FE61/6465733/34269 (9/7 path) + RECON63 blind (UJ misses).
- Prior relay v285 (32A8138B/50841/391, guards round, superseded for entries by this packet; E6 removed from tree by his revert).

## Twin (packet v1, 162 lines - mechanical splice, battery-verified diff 0)
P001: # PACKET_P-ENTRY-1 v1 DRAFT - S5.4 gate + confirm-recency on D74FE972 (nothing builds/runs/commits on this file)
P002: 
P003: Status: v1 DRAFT on his orders (8/27 + 9/1 chart rulings; blind-test rework: S5.4 entry gate + confirm-recency; UJ 3-row detector OWED post-evidence, NOT in v1). Base tree D74FE972/633552/11502 (his 7-trade EU tree, current disk). Assembly rule: enumerated literal edits below only (one S5.4 block + two recency clauses); old blocks machine-read from disk under UNIQUE headers; each edit-site header exactly once. Relay + battery owed before any transport. No council commit token exists or is asked (builder-called commits per AGENTS 6.5).
P004: 
P005: Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E1 S5.4 block + E2 recency clauses x2; S1 recount governs). No new indicator buffers. No new inputs. No existing/global strategy counters touched; the gate introduces local evidence variables only (s54_* - nothing reads them for control flow). No new abort codes (SEEDVOID-style IDLE disposition reused, no new reason string). Nothing under 02_TASK_CHECKPOINTS.
P006: 
P007: ## Authority (his words + disk, no invention)
P008: 
P009: - His chart rulings (finding RETEST-INVALIDATION-V1 section 6, filed whole): Ruling 3 (8/27: last valid retest 18:05, dead by 18:10 + 18:15 body closes; tester confirmed 18:15 touch, entered 18:20) + Ruling 4 (9/1: retest+confirm same pass 15:30 after 4 dead bars; entered 15:30, off by one). Segment-proved same turn on RECON67 (E8B0E582).
P010: - His blind critic (ledger 749/750 + finding USDJPY-MISSES whole): 3 valid UJ rows missed (6/5 09:45 + 6/5 16:15 + 6/11 14:40) + CONFIRM-ONCE (9:35 retest + 9:40 confirm + 9:45 entry; later bars never re-litigate) + his 3 objections still open (direction #1, TP levels #2/#3, FVG/block reads - UJ detector gated on his answers, NOT in v1).
P011: - Spec Part A v4.2 S5.4 (Pre-confirmation invalidation): a candidate armed and waiting for its confirming close is **dead** if the POI behind it is body-broken before that close; below-or-touching without a body close through stays valid; +1 retest cannot revive a dead candidate (his Ruling 1 words). Status on record: NOT BUILT, no new upstream export needed. Two deaths, no overlap (1R-relocation gate vs POI-side test).
P012: - Spec S5.5: entry is a limit at the confirming candle's close; staleness and structural renewal do not cancel; if the filling candle's own close invalidates, exit immediately.
P013: - Spec section 6: a rejected setup consumes nothing; the same POI may be re-approached later in the same window after a rejection (so voided seeds may reseed fresh - new seed, not revived candidate).
P014: - His renewal word (P-VALIDITY-1 R2, live on D74FE972 EA 7822): a held pre-confirmation seed dies on session-liquidity touch, retest bar included; entry needs a fresh retest. E1 mirrors this disposition shape.
P015: - Matrix (BUILDER_MATRIX_TREETAKES.md): D74FE972 took his 7 valid EU (incl 9/7 NY 16:45); E6E90831 6/7 + 1 false; v7 EU unknown; v5 enumerated with 2 ruled-invalid. Preservation battery below guards the 7.
P016: 
P017: ## Rule E1 - S5.4 gate in the entry path (kills invalidated pre-confirmation seeds)
P018: 
P019: - Siting: seed block, immediately AFTER the R2 block closes (EA 7855), BEFORE the state-machine body. Same fence as R2 (states above IDLE and below S5 with anchor set); NO regime gate (spec S5.4 is regime-blind - stated reason; R2 keeps its own MEANREV gate untouched).
P020: - Window: (seedbar, evaluation bar] - seed-exclusive, CURRENT-bar-inclusive (the 8/27 lesson: the confirm bar's own close kills; E6b's confirm-exclusion was the hole). Seedbar proxies the retest bar (anchor model: seed IS the retest time; his Ruling 1 blesses seed-anchored windows: +1 retest cannot revive).
P021: - Predicate per walked bar: POI-behind body-break of the entry-anchor line value (dynamic per-bar ReadBuf1 on g_anchorLine, E6b precedent), direction-matched strict cross (LONG: open at-or-above AND close below; SHORT: open at-or-below AND close above - the v11-unanimous asymmetric idiom). Wick-through never kills (spec: below-or-touching stays valid).
P022: - Disposition: mirror R2 exactly (state IDLE, anchor line cleared, anchor time cleared, LogState, S54VOID row with bar/dir/line/break-bar/break-values/walked/skipped). Fail-open on unreadable (EMPTY POI or zero OHLC increments skipped, never kills). Rows debug-gated; void unconditional.
P023: - Reseed semantics: a voided seed may reseed fresh on a later retest (spec section 6: rejection consumes nothing); the dead candidate never revives.
P024: - NON-COVERAGE (scope-disclaimer, blocking-grade): anchor-line only (his retest line may differ from the entry anchor - line mapping is future work); flip/S3.3 untouched (distinct object); recency separate (E2); detector gaps separate (E3 owed). A relay claiming S5.4 beyond this boundary is defective.
P025: 
P026: ## Rule E2 - confirm-recency (retest must stand before the confirm bar)
P027: 
P028: - Predicate: no promotion on a bar whose anchor time is not strictly before the confirm bar time (seedbar < barTime(barShift) required). 9/1 dies here (seedbar == confirmBar 15:25); 9/7 lives (retest 16:35 stands before confirm 16:40 - grade-time rows).
P029: - Sites (D74FE972 has NO S2-exception branch - PREBIND_S2 0 hits on disk; exactly TWO promotion sites, each proven separately): (a) S3-PREBIND true branch (EA 8668) - print STALE row + return (retain, mirror the FAIL arm); (b) S4 edge true branch (EA 8805) - print STALE row + skip promotion (retain). No touch to IsConfirmationCandle (12 call sites - blast radius refused) and no touch to the confirm predicate itself.
P030: - His confirm-once rule rides unchanged (9:35 + 9:40 + 9:45 sequence still promotes: seedbar 9:35 < confirm 9:40 - grade-time UJ rows if evidenced).
P031: 
P032: ## Rule E3 - UJ detector OWED, not in v1 (evidence spec, no criteria)
P033: 
P034: - Owed evidence: D74FE972-UJ segment rows for his 3 blind rows (which gate refuses each: confirm terms per bar, TP census winners, FVG/block flags) + HIS 3 objections answered (direction #1, TP levels #2/#3, FVG/block reads - batched plain questions ride the transport memo, never as riders).
P035: - v1 ships E1 + E2 only. A v1 relay claiming UJ coverage is defective BY FORMAT.
P036: 
P037: ## Scope (his orders + refinement discipline)
P038: 
P039: - Narrow edits: one S5.4 block + two recency clauses. No overall-logic revision. S3/S4-path extension, shared helper, three-state result, latched side, retain-print helper all parked (need his explicit scope word first, never council-first).
P040: - Windows for grade runs (on key + word): EU 8/26-9/10 + UJ 6/1-6/13 (config-ini unix window per RUN-WINDOW GATE). InpDebugLog=true (grading precondition), InpMode=1, M5 pinned.
P041: 
P042: ## Edit set (exact verbatim old/new; STAGE-1 exact-diff gated; old blocks disk-read same turn under UNIQUE headers; exactly one block per site)
P043: 
P044: - E1 S5.4 block (insert after EA 7855 R2-close, before EA 7856 S2-shadow comment):
P045:   old:
P046: `        }`
P047: `     }`
P048: `         //--- [S2-TIMING-SHADOW-001] seed-bias recorder (Luna V94 F1, cleared BY NAME`
P049:   new:
P050: `         }`
P051: `      }`
P052: `         //--- [P-ENTRY-1 E1] S5.4 pre-confirmation invalidation (his 8/27 ruling + spec S5.4): seed dies on POI-behind body-break over (seedbar, evaluation bar], confirm bar included; +1 cannot revive (fresh reseed allowed per spec section 6). Siting mirrors R2 (same fence, no regime gate - spec unscoped).`
P053: `         if(g_state > ST_IDLE && g_state < ST_S5_GATE_CHECK && g_anchorBarTime > 0)`
P054: `           {`
P055: `            int s54_seedShift = iBarShift(_Symbol, PERIOD_CURRENT, g_anchorBarTime, true);`
P056: `            bool s54_broken = false;`
P057: `            datetime s54_bt = 0; double s54_bv = 0.0, s54_bo = 0.0, s54_bc = 0.0;`
P058: `            int s54_walked = 0, s54_skipped = 0;`
P059: `            if(s54_seedShift >= 0)`
P060: `              {`
P061: `               for(int s54_s = barShift; s54_s <= s54_seedShift; s54_s++)`
P062: `                 {`
P063: `                  s54_walked++;`
P064: `                  double s54_v = 0.0;`
P065: `                  if(!ReadBuf1(g_hPoi, g_anchorLine, s54_v, s54_s) || s54_v == EMPTY_VALUE) { s54_skipped++; continue; }`
P066: `                  double s54_o = iOpen(_Symbol, PERIOD_CURRENT, s54_s);`
P067: `                  double s54_c = iClose(_Symbol, PERIOD_CURRENT, s54_s);`
P068: `                  if(s54_o == 0.0 || s54_c == 0.0) { s54_skipped++; continue; }`
P069: `                  bool s54_hit = (g_dir == DIR_LONG) ? (s54_o >= s54_v && s54_c < s54_v) : (s54_o <= s54_v && s54_c > s54_v);`
P070: `                  if(s54_hit) { s54_broken = true; s54_bt = iTime(_Symbol, PERIOD_CURRENT, s54_s); s54_bv = s54_v; s54_bo = s54_o; s54_bc = s54_c; break; }`
P071: `                 }`
P072: `              }`
P073: `            if(s54_broken)`
P074: `              {`
P075: `               ENUM_SRJ_STATE s54_prev = g_state;`
P076: `               g_state = ST_IDLE;`
P077: `               g_anchorLine = -1;`
P078: `               g_anchorBarTime = 0;`
P079: `               LogState(s54_prev, g_state);`
P080: `               if(InpDebugLog)`
P081: `                  PrintFormat("[SRJ-EA] S54VOID bar=%s dir=%s poi=%s bbar=%s bpx=%s/%s/%s walked=%d skipped=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), TimeToString(s54_bt, TIME_DATE|TIME_MINUTES), DoubleToString(s54_bv, _Digits), DoubleToString(s54_bo, _Digits), DoubleToString(s54_bc, _Digits), s54_walked, s54_skipped);`
P082: `              }`
P083: `           }`
P084: `          //--- [S2-TIMING-SHADOW-001] seed-bias recorder (Luna V94 F1, cleared BY NAME`
P085: - E2a recency clause (S3-PREBIND true branch, EA 8668):
P086:   old:
P087: `         string cfTermPB = "";`
P088: `         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermPB))`
P089: `           {`
P090: `            ENUM_SRJ_STATE prevPB = g_state;`
P091:   new:
P092: `          string cfTermPB = "";`
P093: `          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermPB))`
P094: `            {`
P095: `             if(!(g_anchorBarTime > 0 && g_anchorBarTime < iTime(_Symbol, PERIOD_CURRENT, barShift)))`
P096: `               {`
P097: `                if(InpDebugLog)`
P098: `                   PrintFormat("[SRJ-EA] CONFIRM_STALE_SKIP bar=%s dir=%s poi=%s seedbar=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES));`
P099: `                return;`
P100: `               }`
P101: `             ENUM_SRJ_STATE prevPB = g_state;`
P102: - E2b recency clause (S4 edge full confirm-if, EA 8804-8817, balanced site):
P103:   old:
P104: `         string cfTerm = "";`
P105: `         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))`
P106: `           {`
P107: `            ENUM_SRJ_STATE prev = g_state;`
P108: `            g_confirmFromState = prev;`
P109: `            g_state = ST_S5_GATE_CHECK;`
P110: `            LogState(prev, g_state);`
P111: `           }`
P112: `         else if(InpDebugLog)`
P113: `            PrintFormat("[SRJ-EA] CONFIRM_STRUCT_FAIL bar=%s dir=%s term=%s",`
P114: `                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),`
P115: `                                     TIME_DATE|TIME_MINUTES),`
P116: `                        DirName(g_dir), cfTerm);`
P117: `        }`
P118:   new:
P119: `         string cfTerm = "";`
P120: `         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))`
P121: `           {`
P122: `            if(!(g_anchorBarTime > 0 && g_anchorBarTime < iTime(_Symbol, PERIOD_CURRENT, barShift)))`
P123: `              {`
P124: `               if(InpDebugLog)`
P125: `                  PrintFormat("[SRJ-EA] CONFIRM_STALE_SKIP bar=%s dir=%s poi=%s seedbar=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES));`
P126: `              }`
P127: `            else`
P128: `              {`
P129: `               ENUM_SRJ_STATE prev = g_state;`
P130: `               g_confirmFromState = prev;`
P131: `               g_state = ST_S5_GATE_CHECK;`
P132: `               LogState(prev, g_state);`
P133: `              }`
P134: `           }`
P135: `         else if(InpDebugLog)`
P136: `            PrintFormat("[SRJ-EA] CONFIRM_STRUCT_FAIL bar=%s dir=%s term=%s",`
P137: `                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),`
P138: `                                     TIME_DATE|TIME_MINUTES),`
P139: `                         DirName(g_dir), cfTerm);`
P140: `        }`
P141: 
P142: ## Stages (T161N discipline; RECON67/RECON60 precedent)
P143: 
P144: - S1 pre-hash gate: re-hash EA (must equal D74FE972/633552/11502 or DIAGNOSED successor, never assumed) plus one hit per anchor (E1 insert anchor EA 7854-7856; E2a anchor EA 8667-8670; E2b anchor EA 8804-8817; R2 block untouched; S5.4 uses existing ReadBuf1/iOpen/iClose/iBarShift/iTime precedents, no new walker callers) plus buffers unchanged plus R-gate/latch untouched plus print census with pinned counts (S54VOID print sites = 1; CONFIRM_STALE_SKIP print sites = 2, one per promotion site) plus char-code assert every OLD anchor AND every insert byte plus M5 PINNED plus InpDebugLog=true grading precondition (gate control flow unconditional; S54VOID/STALE rows debug-gated). Runs carry InpDebugLog=true.
P145: - S3 budget (mechanical from the pasted blocks, NET per site = new-site-total minus old-site-total; script-counted this block): E1 +32 (35-3); E2a +6 (10-4); E2b +8 (22-14); total +46; post 11502+46 = 11548 (S3 recount governs).
P146: 
P147: ## Acceptance (grade segment-vs-baselines; event tuples, never bare clock labels)
P148: 
P149: - A-S54-827 (8/27 SHORT Weekly-POC): S54VOID row at the 18:10 evaluation (bbar 18:10, break values populated, walked/skipped printed) + NO SIGNAL at 18:20 + NO CONFIRM_PREBIND at 18:20 + anchor cleared (no takes on the dead seed; fresh reseed allowed per spec section 6).
P150: - A-STALE-901 (9/1 SHORT Monthly-POC): CONFIRM_STALE_SKIP row at the 15:30 evaluation (seedbar == 15:25 confirm bar printed) + NO SIGNAL at 15:30 + NO take.
P151: - A-97NY (9/7 LONG Weekly-POC): SIGNAL + take at 16:45 + TP exit preserved (seedbar stands strictly before 16:40 confirm - grade-time rows; E1 walk over (seed, 16:40] finds no POI break; NO S54VOID + NO STALE on this path).
P152: - A-7PRESERVE: all 7 valid EU takes present (8/28 + 9/1 17:35 + 9/4 + 9/7 x2 + 9/8 x2); invalid still dead (9/4 10:40, 8/28 NY silent, 8/27 + 9/1-15:30 gone by the new gates).
P153: - A-UJ-OWED: UJ 3-row evidence spec only (which gate refuses each on D74FE972 rows + his 3 objections answered) - NO criteria in v1; a v1 relay grading UJ takes is defective BY FORMAT.
P154: - L-final: A-S54-827 + A-STALE-901 + A-97NY + A-7PRESERVE + A-UJ-OWED above.
P155: 
P156: ## Run cost and novel evidence
P157: 
P158: - One build (STAGE-1 gated) plus two tester runs, ceiling 90 each: EU full 8/26-9/10 (~50 min) + UJ full 6/1-6/13 (~45 min, on key + his explicit evidence-word; no slices - history fidelity).
P159: - S5.4 + recency terminate pre-confirmation with row evidence; 9/7 path preserved; UJ detector owed.
P160: - Novel evidence vs RECON67/RECON60/his report: (a) S54VOID + STALE rows on the ruled bars with no takes; (b) all-7 preservation re-proof under the new gates; (c) UJ take-arise only if E3 lands (v2 scope).
P161: 
P162: (End of file)

## Code companion (EA disk pulls, byte-verified 0-diff)
- R2 seed-death block + insert site (EA 7822-7856: session-liquidity touch void, MEANREV-gated; E1 lands after its close with the same fence minus regime).
- S3-PREBIND branch (EA 8655-8691: confirm-anywhere ruling with the declared pre-bind freshness exemption; E2a lands in its true arm).
- S4 edge (EA 8795-8818: confirm-gate with A2 retracement term; E2b lands in its true arm).
- No IsConfirmationCandle touch (12 call sites, blast radius refused); no new walker callers; no new abort codes; no new inputs/buffers.
C7822:     //--- [P-VALIDITY-1 R2 2026-09-22, his renewal word: a held pre-confirmation seed dies on a session-liquidity touch, retest bar included; entry then needs a fresh POC/VWAP retest. Placed after the per-bar seed block: single pass per bar blocks same-bar re-admission. Fires ST_S1..ST_S4 named set only; S5+ committed; runs before the state-machine body; touch test reads pre-bar line state so extension bars don't false-fire; pre-bar swept-mask exclusion (Luna-2): R-POOL indices already swept as of barShift+1 skipped via disk-derived map, current-bar sweep still counts; tri-state (Luna-B): valid mask excludes, unavailable-or-invalid mask = R2SKIP hold with row; eval counter proves cadence.]
C7823:     if(g_state > ST_IDLE && g_state < ST_S5_GATE_CHECK && g_anchorBarTime > 0)
C7824:      {
C7825:       double r2_hi = iHigh(_Symbol, PERIOD_CURRENT, barShift);
C7826:       double r2_lo = iLow(_Symbol, PERIOD_CURRENT, barShift);
C7827:       const int r2_bufs[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW, FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW, FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW, FL_BUF_NY_HIGH, FL_BUF_NY_LOW, FL_BUF_PM_HIGH, FL_BUF_PM_LOW, FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW, FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW, FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW, FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };
C7828:       bool r2_touch = false;
C7829:       double r2_val = 0.0;
C7830:       int r2_buf = -1;
C7831:       double r2_mask;
C7832:       if(!ReadFlow(FL_BUF_SWEPT_MASK, r2_mask, barShift + 1)) r2_mask = EMPTY_VALUE;
C7833:       bool r2_mValid = (MathIsValidNumber(r2_mask) && r2_mask == MathFloor(r2_mask) && r2_mask >= 0.0 && r2_mask < 4194304.0);
C7834:       int r2_m = (r2_mValid ? (int)MathRound(r2_mask) : 0);
C7835:       static int r2_evals = 0;
C7836:       if(!r2_mValid && InpDebugLog) PrintFormat("[SRJ-EA] R2SKIP bar=%s evals=%d (mask unavailable or invalid - seed held)", TimeToString(barTime, TIME_DATE|TIME_MINUTES), r2_evals);
C7837:       if(r2_mValid) r2_evals++;
C7838:       for(int r2_k = 0; r2_k < 18 && !r2_touch && r2_mValid; r2_k++)
C7839:         {
C7840:          double r2_v;
C7841:          int r2_sweptBit = (r2_k <= 9 ? r2_k : r2_k + 4);
C7842:          if((r2_m & (1 << r2_sweptBit)) != 0) continue;
C7843:          if(ReadFlow(r2_bufs[r2_k], r2_v, barShift + 1) && r2_lo <= r2_v && r2_v <= r2_hi)
C7844:             { r2_touch = true; r2_val = r2_v; r2_buf = r2_bufs[r2_k]; }
C7845:          }
C7846:       if(r2_touch && g_regime == REGIME_MEANREV)
C7847:         {
C7848:          ENUM_SRJ_STATE r2_prev = g_state;
C7849:          g_state = ST_IDLE;
C7850:          g_anchorLine = -1;
C7851:          g_anchorBarTime = 0;
C7852:          LogState(r2_prev, g_state);
C7853:          if(InpDebugLog) PrintFormat("[SRJ-EA] SEEDVOID bar=%s dir=%s buf=%d line=%s evals=%d hi=%s lo=%s", TimeToString(barTime, TIME_DATE|TIME_MINUTES), DirName(g_dir), r2_buf, DoubleToString(r2_val, _Digits), r2_evals, DoubleToString(r2_hi, _Digits), DoubleToString(r2_lo, _Digits));
C7854:         }
C7855:      }
C7856:          //--- [S2-TIMING-SHADOW-001] seed-bias recorder (Luna V94 F1, cleared BY NAME
C8655:          //--- [P-CONFIRM-ANYSTATE E1 2026-09-11, operator ruling verbatim: "if
C8656:          //--- all my conditions are met, the trade is ON. The EA must take the
C8657:          //--- confirmation candle whenever it appears (even while its own prep
C8658:          //--- is unfinished), keeping the one-bar rule."] A PRE-BINDING
C8659:          //--- candidate (S3_ZONE_WAIT: zone unbound or not in play) now ALSO
C8660:          //--- evaluates the confirmation predicate at this bar's close. PASS ->
C8661:          //--- promote DIRECTLY to ST_S5_GATE_CHECK (the S5 block below runs in
C8662:          //--- this same pass: divergence walk -> R latch -> fire); FAIL -> the
C8663:          //--- confirmation is consumed (no carry-forward; the candidate stays
C8664:          //--- at S3). DECLARED: the pre-confirmation freshness poll cannot run
C8665:          //--- pre-binding (it tests the BOUND zone), so a pre-bind firing
C8666:          //--- proceeds without it; S2 candidates are OUTSIDE the ruled scope.
C8667:          string cfTermPB = "";
C8668:          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermPB))
C8669:            {
C8670:             ENUM_SRJ_STATE prevPB = g_state;
C8671:             g_confirmFromState = prevPB;
C8672:             g_state = ST_S5_GATE_CHECK;
C8673:             LogState(prevPB, g_state);
C8674:             if(InpDebugLog)
C8675:                PrintFormat("[SRJ-EA] CONFIRM_PREBIND bar=%s dir=%s poi=%s",
C8676:                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
C8677:                                         TIME_DATE|TIME_MINUTES),
C8678:                            DirName(g_dir), AnchorStr());
C8679:             //--- no return: fall through to the ST_S5_GATE_CHECK block below
C8680:            }
C8681:          else
C8682:            {
C8683:             if(InpDebugLog)
C8684:                PrintFormat("[SRJ-EA] CONFIRM_PREBIND_FAIL bar=%s dir=%s term=%s",
C8685:                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
C8686:                                         TIME_DATE|TIME_MINUTES),
C8687:                            DirName(g_dir), cfTermPB);
C8688:             return;
C8689:            }
C8690:         }
C8691:      }
C8795:          //--- [P-CONFIRM-GATE E2] the S4->S5 edge IS the confirmation predicate
C8796:          //--- now (terms A/A2/B/C; the ruled retracement term A2: the prior
C8797:          //--- candle's CLOSE stays on the setup side of the anchor line - a wick
C8798:          //--- through is the retracement, a CLOSE through is a line break).
C8799:          //--- One-bar validity: promotion happens ONLY on a true test bar; a
C8800:          //--- failed term consumes the confirmation (no carry-forward) and a
C8801:          //--- later bar can present a fresh confirmation while the candidate is
C8802:          //--- alive and in-window. The touch fallback above STAYS (it sets
C8803:          //--- g_touchSeen - the retracement detection; unchanged).
C8804:          string cfTerm = "";
C8805:          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))
C8806:            {
C8807:             ENUM_SRJ_STATE prev = g_state;
C8808:             g_confirmFromState = prev;
C8809:             g_state = ST_S5_GATE_CHECK;
C8810:             LogState(prev, g_state);
C8811:            }
C8812:          else if(InpDebugLog)
C8813:             PrintFormat("[SRJ-EA] CONFIRM_STRUCT_FAIL bar=%s dir=%s term=%s",
C8814:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
C8815:                                      TIME_DATE|TIME_MINUTES),
C8816:                         DirName(g_dir), cfTerm);
C8817:         }
C8818:      }

## Rows fence (segment-spliced, each pattern 1x in its labeled source)
- 8/27 invalidation path [R67]: 18:05 book (hits=0) + 18:10 book (hits=2) + 18:15 book + 18:15 confirm=1 (touch) + 18:20 PREBIND seedbar=17:45 + 18:15 GUARD pass (E6-era, superseded tree).
- 9/1 same-pass path [R67]: 15:25 book (hits=2) + 15:25 confirm=1 same pass + PREBIND seedbar=15:25 + GUARD walked=0 silent.
- 9/7 preservation path [R60]: 16:35 book (hits=2) + 16:40 confirm=1 + 16:45 take (his report deal).
hits=1 [R67]: PN	0	01:24:23.184	Core 04	2026.08.27 18:10:01   [SRJ-EA] RETESTBOOK bar=2026.08.27 18:05 hits=0 
hits=1 [R67]: OS	0	01:24:23.184	Core 04	2026.08.27 18:15:00   [SRJ-EA] RETESTBOOK bar=2026.08.27 18:10 hits=2 Daily-VWAP:r11:dL Weekly-POC:r8:dS
hits=1 [R67]: LD	0	01:24:23.184	Core 04	2026.08.27 18:20:01   [SRJ-EA] CONFIRMPOLL bar=2026.08.27 18:15 anchor=Weekly-POC dir=SHORT oppCandle=1 bodyDir=1 body=9pts doji=0 touchAttr=1 confirm=1 shadow=true
hits=1 [R67]: HS	0	01:24:23.184	Core 04	2026.08.27 18:20:01   [SRJ-EA] CONFIRM_PREBIND_S2 bar=2026.08.27 18:15 dir=SHORT poi=Weekly-POC seedbar=2026.08.27 17:45
hits=1 [R67]: GO	0	01:24:23.184	Core 04	2026.08.27 18:20:01   [SRJ-EA] E4B_GUARD bar=2026.08.27 18:15 dir=SHORT poi=Weekly-POC seedbar=2026.08.27 17:45 flip=0 opposed=0 pobreak=0 anti=1/1 seed=7 walked=6 skipped=0 bbar=1970.01.01 00:00 bpx=0.00000/0.00000/0.00000
hits=1 [R67]: JN	0	01:37:06.121	Core 04	2026.09.01 15:30:00   [SRJ-EA] RETESTBOOK bar=2026.09.01 15:25 hits=2 Daily-POC:r10:dS Monthly-POC:r6:dS
hits=1 [R67]: CH	0	01:37:06.121	Core 04	2026.09.01 15:30:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.01 15:25 anchor=Monthly-POC dir=SHORT oppCandle=1 bodyDir=1 body=9pts doji=0 touchAttr=1 confirm=1 shadow=true
hits=1 [R67]: PD	0	01:37:06.121	Core 04	2026.09.01 15:30:00   [SRJ-EA] CONFIRM_PREBIND_S2 bar=2026.09.01 15:25 dir=SHORT poi=Monthly-POC seedbar=2026.09.01 15:25
hits=1 [R67]: KO	0	01:37:06.121	Core 04	2026.09.01 15:30:00   [SRJ-EA] E4B_GUARD bar=2026.09.01 15:25 dir=SHORT poi=Monthly-POC seedbar=2026.09.01 15:25 flip=0 opposed=0 pobreak=0 anti=0/0 seed=1 walked=0 skipped=0 bbar=1970.01.01 00:00 bpx=0.00000/0.00000/0.00000
hits=1 [R60]: EH	0	05:59:32.183	Core 04	2026.09.07 16:40:15   [SRJ-EA] RETESTBOOK bar=2026.09.07 16:35 hits=2 Daily-POC:r10:dL Weekly-POC:r8:dL
hits=1 [R60]: RJ	0	05:59:32.183	Core 04	2026.09.07 16:45:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.07 16:40 anchor=Weekly-POC dir=LONG oppCandle=1 bodyDir=1 body=11pts doji=0 touchAttr=1 confirm=1 shadow=true
hits=1 [R60]: KL	0	05:59:32.183	Core 04	2026.09.07 16:45:00   [SRJ-EA] RETESTBOOK bar=2026.09.07 16:40 hits=0 

## Rule traceability (his words to packet lines; quotes verified against filed sources)
- Ruling 3 invalidation (finding section 6): "last valid retest is at 18:05" + "invalidated by breaking it with a candle body close at 18:10 and 18:15" BELONGS to E1 (walk seed-exclusive..eval-inclusive, dir-matched strict cross, void + S54VOID row).
- Ruling 4 recency (finding section 6): "POI line retest after the confirmation candle" + "OFF BY +1 candle" BELONGS to E2 (seedbar < confirmBar strict at both promotion sites + STALE row).
- Spec S5.4 "is **dead** if the POI behind it is body-broken before that close" + "rejected setup consumes nothing" (section 6) BELONG to E1 window + reseed semantics.
- Confirm-once (ledger 750: 9:35 retest + 9:40 confirm + 9:45 entry) is preserved: seedbar 9:35 < confirm 9:40 passes E2 (grade-time UJ rows if evidenced).
- 9/7 NY (his report deal 16:45 + RECON60 rows): retest 16:35 stands before confirm 16:40; E1 walk finds no break; E2 passes. Preservation battery at grade.
- UJ misses (finding MISSES + ledger 749): E3 owed; v1 carries the evidence spec only.

## Q1 - S5.4 gate rule verification (packet E1 vs spec S5.4 + R2 shape)
Q1: Does E1 implement exactly the spec sentence (dead on POI-behind body-break before the confirming close; wick/touch valid; +1 cannot revive; reseed-fresh allowed) at the R2-adjacent siting with the stated fence, disposition, fail-open behavior, and non-coverage boundary (anchor-line only; confirm-bar included; flips/recency/detectors out)?
Q1 verdict line: Q1-YES / Q1-NO (one).
Q1 plain answer form: "Q1 YES - the gate matches the rule" or "Q1 NO - <exact line> mismatches because <disk reason>".

## Q2 - recency + preservation verification (packet E2 + acceptance battery)
Q2: Is E2 correct and complete at both promotion sites (strict seedbar<confirmBar, STALE row + retain, no confirm-function touch), with 9/7 preserved by rule text and the 7-preservation + invalid-still-dead battery gradeable as written (S54VOID at 18:10, STALE at 15:30, no UJ criteria)?
Q2 verdict line: Q2-YES / Q2-NO (one).
Q2 plain answer form: "Q2 YES - recency and battery hold" or "Q2 NO - <exact line> fails because <disk reason>".

## Seat packaging (identical text all seats; key Luna-only at build time)
- Transport seats: his choice. Review: all carried seats rule Q1+Q2 with halt power; either seat halts per dual-key.
- No key spent here. No build/run here (key + word spent; next build needs a new key).

## Verification split (every model tier shares the same paste blind spot)
- Rule on the page only. Disk genuineness (EA re-hash D74FE972/633552/11502, STAGE-1 exact-diff, segment counts) is proven on builder disk + his eyes only, never from chat by any model tier. File-access proof is builder-disk + his-eyes only. Do not ask for files.
- Twin/code/rows battery numbers (P-count vs packet lines, prefix-stripped bodies diff 0; code regions byte-diff 0 vs EA disk; rows pattern hits per labeled source + pair counts; anchors 0 leftover; P-sequence unbroken; ellipsis 0; quotes substring-verified) are pasted in the transport memo from the battery run, never asserted here.

Nothing else is asked. Thank you.
