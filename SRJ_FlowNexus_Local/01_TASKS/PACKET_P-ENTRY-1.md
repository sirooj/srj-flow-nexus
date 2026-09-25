# PACKET_P-ENTRY-1 v1 DRAFT - S5.4 gate + confirm-recency on D74FE972 (nothing builds/runs/commits on this file)

Status: v1 DRAFT on his orders (8/27 + 9/1 chart rulings; blind-test rework: S5.4 entry gate + confirm-recency; UJ 3-row detector OWED post-evidence, NOT in v1). Base tree D74FE972/633552/11502 (his 7-trade EU tree, current disk). Assembly rule: enumerated literal edits below only (one S5.4 block + two recency clauses); old blocks machine-read from disk under UNIQUE headers; each edit-site header exactly once. Relay + battery owed before any transport. No council commit token exists or is asked (builder-called commits per AGENTS 6.5).

Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E1 S5.4 block + E2 recency clauses x2; S1 recount governs). No new indicator buffers. No new inputs. No existing/global strategy counters touched; the gate introduces local evidence variables only (s54_* - nothing reads them for control flow). No new abort codes (SEEDVOID-style IDLE disposition reused, no new reason string). Nothing under 02_TASK_CHECKPOINTS.

## Authority (his words + disk, no invention)

- His chart rulings (finding RETEST-INVALIDATION-V1 section 6, filed whole): Ruling 3 (8/27: last valid retest 18:05, dead by 18:10 + 18:15 body closes; tester confirmed 18:15 touch, entered 18:20) + Ruling 4 (9/1: retest+confirm same pass 15:30 after 4 dead bars; entered 15:30, off by one). Segment-proved same turn on RECON67 (E8B0E582).
- His blind critic (ledger 749/750 + finding USDJPY-MISSES whole): 3 valid UJ rows missed (6/5 09:45 + 6/5 16:15 + 6/11 14:40) + CONFIRM-ONCE (9:35 retest + 9:40 confirm + 9:45 entry; later bars never re-litigate) + his 3 objections still open (direction #1, TP levels #2/#3, FVG/block reads - UJ detector gated on his answers, NOT in v1).
- Spec Part A v4.2 S5.4 (Pre-confirmation invalidation): a candidate armed and waiting for its confirming close is **dead** if the POI behind it is body-broken before that close; below-or-touching without a body close through stays valid; +1 retest cannot revive a dead candidate (his Ruling 1 words). Status on record: NOT BUILT, no new upstream export needed. Two deaths, no overlap (1R-relocation gate vs POI-side test).
- Spec S5.5: entry is a limit at the confirming candle's close; staleness and structural renewal do not cancel; if the filling candle's own close invalidates, exit immediately.
- Spec section 6: a rejected setup consumes nothing; the same POI may be re-approached later in the same window after a rejection (so voided seeds may reseed fresh - new seed, not revived candidate).
- His renewal word (P-VALIDITY-1 R2, live on D74FE972 EA 7822): a held pre-confirmation seed dies on session-liquidity touch, retest bar included; entry needs a fresh retest. E1 mirrors this disposition shape.
- Matrix (BUILDER_MATRIX_TREETAKES.md): D74FE972 took his 7 valid EU (incl 9/7 NY 16:45); E6E90831 6/7 + 1 false; v7 EU unknown; v5 enumerated with 2 ruled-invalid. Preservation battery below guards the 7.

## Rule E1 - S5.4 gate in the entry path (kills invalidated pre-confirmation seeds)

- Siting: seed block, immediately AFTER the R2 block closes (EA 7855), BEFORE the state-machine body. Same fence as R2 (states above IDLE and below S5 with anchor set); NO regime gate (spec S5.4 is regime-blind - stated reason; R2 keeps its own MEANREV gate untouched).
- Window: (seedbar, evaluation bar] - seed-exclusive, CURRENT-bar-inclusive (the 8/27 lesson: the confirm bar's own close kills; E6b's confirm-exclusion was the hole). Seedbar proxies the retest bar (anchor model: seed IS the retest time; his Ruling 1 blesses seed-anchored windows: +1 retest cannot revive).
- Predicate per walked bar: POI-behind body-break of the entry-anchor line value (dynamic per-bar ReadBuf1 on g_anchorLine, E6b precedent), direction-matched strict cross (LONG: open at-or-above AND close below; SHORT: open at-or-below AND close above - the v11-unanimous asymmetric idiom). Wick-through never kills (spec: below-or-touching stays valid).
- Disposition: mirror R2 exactly (state IDLE, anchor line cleared, anchor time cleared, LogState, S54VOID row with bar/dir/line/break-bar/break-values/walked/skipped). Fail-open on unreadable (EMPTY POI or zero OHLC increments skipped, never kills). Rows debug-gated; void unconditional.
- Reseed semantics: a voided seed may reseed fresh on a later retest (spec section 6: rejection consumes nothing); the dead candidate never revives.
- NON-COVERAGE (scope-disclaimer, blocking-grade): anchor-line only (his retest line may differ from the entry anchor - line mapping is future work); flip/S3.3 untouched (distinct object); recency separate (E2); detector gaps separate (E3 owed). A relay claiming S5.4 beyond this boundary is defective.

## Rule E2 - confirm-recency (retest must stand before the confirm bar)

- Predicate: no promotion on a bar whose anchor time is not strictly before the confirm bar time (seedbar < barTime(barShift) required). 9/1 dies here (seedbar == confirmBar 15:25); 9/7 lives (retest 16:35 stands before confirm 16:40 - grade-time rows).
- Sites (D74FE972 has NO S2-exception branch - PREBIND_S2 0 hits on disk; exactly TWO promotion sites, each proven separately): (a) S3-PREBIND true branch (EA 8668) - print STALE row + return (retain, mirror the FAIL arm); (b) S4 edge true branch (EA 8805) - print STALE row + skip promotion (retain). No touch to IsConfirmationCandle (12 call sites - blast radius refused) and no touch to the confirm predicate itself.
- His confirm-once rule rides unchanged (9:35 + 9:40 + 9:45 sequence still promotes: seedbar 9:35 < confirm 9:40 - grade-time UJ rows if evidenced).

## Rule E3 - UJ detector OWED, not in v1 (evidence spec, no criteria)

- Owed evidence: D74FE972-UJ segment rows for his 3 blind rows (which gate refuses each: confirm terms per bar, TP census winners, FVG/block flags) + HIS 3 objections answered (direction #1, TP levels #2/#3, FVG/block reads - batched plain questions ride the transport memo, never as riders).
- v1 ships E1 + E2 only. A v1 relay claiming UJ coverage is defective BY FORMAT.

## Scope (his orders + refinement discipline)

- Narrow edits: one S5.4 block + two recency clauses. No overall-logic revision. S3/S4-path extension, shared helper, three-state result, latched side, retain-print helper all parked (need his explicit scope word first, never council-first).
- Windows for grade runs (on key + word): EU 8/26-9/10 + UJ 6/1-6/13 (config-ini unix window per RUN-WINDOW GATE). InpDebugLog=true (grading precondition), InpMode=1, M5 pinned.

## Edit set (exact verbatim old/new; STAGE-1 exact-diff gated; old blocks disk-read same turn under UNIQUE headers; exactly one block per site)

- E1 S5.4 block (insert after EA 7855 R2-close, before EA 7856 S2-shadow comment):
  old:
`        }`
`     }`
`         //--- [S2-TIMING-SHADOW-001] seed-bias recorder (Luna V94 F1, cleared BY NAME`
  new:
`         }`
`      }`
`         //--- [P-ENTRY-1 E1] S5.4 pre-confirmation invalidation (his 8/27 ruling + spec S5.4): seed dies on POI-behind body-break over (seedbar, evaluation bar], confirm bar included; +1 cannot revive (fresh reseed allowed per spec section 6). Siting mirrors R2 (same fence, no regime gate - spec unscoped).`
`         if(g_state > ST_IDLE && g_state < ST_S5_GATE_CHECK && g_anchorBarTime > 0)`
`           {`
`            int s54_seedShift = iBarShift(_Symbol, PERIOD_CURRENT, g_anchorBarTime, true);`
`            bool s54_broken = false;`
`            datetime s54_bt = 0; double s54_bv = 0.0, s54_bo = 0.0, s54_bc = 0.0;`
`            int s54_walked = 0, s54_skipped = 0;`
`            if(s54_seedShift >= 0)`
`              {`
`               for(int s54_s = barShift; s54_s <= s54_seedShift; s54_s++)`
`                 {`
`                  s54_walked++;`
`                  double s54_v = 0.0;`
`                  if(!ReadBuf1(g_hPoi, g_anchorLine, s54_v, s54_s) || s54_v == EMPTY_VALUE) { s54_skipped++; continue; }`
`                  double s54_o = iOpen(_Symbol, PERIOD_CURRENT, s54_s);`
`                  double s54_c = iClose(_Symbol, PERIOD_CURRENT, s54_s);`
`                  if(s54_o == 0.0 || s54_c == 0.0) { s54_skipped++; continue; }`
`                  bool s54_hit = (g_dir == DIR_LONG) ? (s54_o >= s54_v && s54_c < s54_v) : (s54_o <= s54_v && s54_c > s54_v);`
`                  if(s54_hit) { s54_broken = true; s54_bt = iTime(_Symbol, PERIOD_CURRENT, s54_s); s54_bv = s54_v; s54_bo = s54_o; s54_bc = s54_c; break; }`
`                 }`
`              }`
`            if(s54_broken)`
`              {`
`               ENUM_SRJ_STATE s54_prev = g_state;`
`               g_state = ST_IDLE;`
`               g_anchorLine = -1;`
`               g_anchorBarTime = 0;`
`               LogState(s54_prev, g_state);`
`               if(InpDebugLog)`
`                  PrintFormat("[SRJ-EA] S54VOID bar=%s dir=%s poi=%s bbar=%s bpx=%s/%s/%s walked=%d skipped=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), TimeToString(s54_bt, TIME_DATE|TIME_MINUTES), DoubleToString(s54_bv, _Digits), DoubleToString(s54_bo, _Digits), DoubleToString(s54_bc, _Digits), s54_walked, s54_skipped);`
`              }`
`           }`
`          //--- [S2-TIMING-SHADOW-001] seed-bias recorder (Luna V94 F1, cleared BY NAME`
- E2a recency clause (S3-PREBIND true branch, EA 8668):
  old:
`         string cfTermPB = "";`
`         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermPB))`
`           {`
`            ENUM_SRJ_STATE prevPB = g_state;`
  new:
`          string cfTermPB = "";`
`          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermPB))`
`            {`
`             if(!(g_anchorBarTime > 0 && g_anchorBarTime < iTime(_Symbol, PERIOD_CURRENT, barShift)))`
`               {`
`                if(InpDebugLog)`
`                   PrintFormat("[SRJ-EA] CONFIRM_STALE_SKIP bar=%s dir=%s poi=%s seedbar=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES));`
`                return;`
`               }`
`             ENUM_SRJ_STATE prevPB = g_state;`
- E2b recency clause (S4 edge full confirm-if, EA 8804-8817, balanced site):
  old:
`         string cfTerm = "";`
`         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))`
`           {`
`            ENUM_SRJ_STATE prev = g_state;`
`            g_confirmFromState = prev;`
`            g_state = ST_S5_GATE_CHECK;`
`            LogState(prev, g_state);`
`           }`
`         else if(InpDebugLog)`
`            PrintFormat("[SRJ-EA] CONFIRM_STRUCT_FAIL bar=%s dir=%s term=%s",`
`                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),`
`                                     TIME_DATE|TIME_MINUTES),`
`                        DirName(g_dir), cfTerm);`
`        }`
  new:
`         string cfTerm = "";`
`         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))`
`           {`
`            if(!(g_anchorBarTime > 0 && g_anchorBarTime < iTime(_Symbol, PERIOD_CURRENT, barShift)))`
`              {`
`               if(InpDebugLog)`
`                  PrintFormat("[SRJ-EA] CONFIRM_STALE_SKIP bar=%s dir=%s poi=%s seedbar=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES));`
`              }`
`            else`
`              {`
`               ENUM_SRJ_STATE prev = g_state;`
`               g_confirmFromState = prev;`
`               g_state = ST_S5_GATE_CHECK;`
`               LogState(prev, g_state);`
`              }`
`           }`
`         else if(InpDebugLog)`
`            PrintFormat("[SRJ-EA] CONFIRM_STRUCT_FAIL bar=%s dir=%s term=%s",`
`                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),`
`                                     TIME_DATE|TIME_MINUTES),`
`                         DirName(g_dir), cfTerm);`
`        }`

## Stages (T161N discipline; RECON67/RECON60 precedent)

- S1 pre-hash gate: re-hash EA (must equal D74FE972/633552/11502 or DIAGNOSED successor, never assumed) plus one hit per anchor (E1 insert anchor EA 7854-7856; E2a anchor EA 8667-8670; E2b anchor EA 8804-8817; R2 block untouched; S5.4 uses existing ReadBuf1/iOpen/iClose/iBarShift/iTime precedents, no new walker callers) plus buffers unchanged plus R-gate/latch untouched plus print census with pinned counts (S54VOID print sites = 1; CONFIRM_STALE_SKIP print sites = 2, one per promotion site) plus char-code assert every OLD anchor AND every insert byte plus M5 PINNED plus InpDebugLog=true grading precondition (gate control flow unconditional; S54VOID/STALE rows debug-gated). Runs carry InpDebugLog=true.
- S3 budget (mechanical from the pasted blocks, NET per site = new-site-total minus old-site-total; script-counted this block): E1 +32 (35-3); E2a +6 (10-4); E2b +8 (22-14); total +46; post 11502+46 = 11548 (S3 recount governs).

## Acceptance (grade segment-vs-baselines; event tuples, never bare clock labels)

- A-S54-827 (8/27 SHORT Weekly-POC): S54VOID row at the 18:10 evaluation (bbar 18:10, break values populated, walked/skipped printed) + NO SIGNAL at 18:20 + NO CONFIRM_PREBIND at 18:20 + anchor cleared (no takes on the dead seed; fresh reseed allowed per spec section 6).
- A-STALE-901 (9/1 SHORT Monthly-POC): CONFIRM_STALE_SKIP row at the 15:30 evaluation (seedbar == 15:25 confirm bar printed) + NO SIGNAL at 15:30 + NO take.
- A-97NY (9/7 LONG Weekly-POC): SIGNAL + take at 16:45 + TP exit preserved (seedbar stands strictly before 16:40 confirm - grade-time rows; E1 walk over (seed, 16:40] finds no POI break; NO S54VOID + NO STALE on this path).
- A-7PRESERVE: all 7 valid EU takes present (8/28 + 9/1 17:35 + 9/4 + 9/7 x2 + 9/8 x2); invalid still dead (9/4 10:40, 8/28 NY silent, 8/27 + 9/1-15:30 gone by the new gates).
- A-UJ-OWED: UJ 3-row evidence spec only (which gate refuses each on D74FE972 rows + his 3 objections answered) - NO criteria in v1; a v1 relay grading UJ takes is defective BY FORMAT.
- L-final: A-S54-827 + A-STALE-901 + A-97NY + A-7PRESERVE + A-UJ-OWED above.

## Run cost and novel evidence

- One build (STAGE-1 gated) plus two tester runs, ceiling 90 each: EU full 8/26-9/10 (~50 min) + UJ full 6/1-6/13 (~45 min, on key + his explicit evidence-word; no slices - history fidelity).
- S5.4 + recency terminate pre-confirmation with row evidence; 9/7 path preserved; UJ detector owed.
- Novel evidence vs RECON67/RECON60/his report: (a) S54VOID + STALE rows on the ruled bars with no takes; (b) all-7 preservation re-proof under the new gates; (c) UJ take-arise only if E3 lands (v2 scope).

(End of file)