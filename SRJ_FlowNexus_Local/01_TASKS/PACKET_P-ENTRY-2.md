# PACKET_P-ENTRY-2 v1 DRAFT - S5.4 gate + recency + UJ proposals (nothing builds/runs/commits on this file)

Status: v13 DRAFT (v12 + his-words fold (bias-flip timing ruling + NEAREST-ANY-AGE + TOUCH-RETARGET + CLOSE-ONLY-GAP-BREAK + divergence example-only; v11 bypass dropped whole on his confirm): E-UJ1-15M road PROPOSED under his rule + E-UJ2-SPEC PROPOSED under his rules + E-UJ3 carried; E1/E2 byte-identical; budget carried +47/post 11549); v12 history retained below; v11 + v295-halt fold (Luna/Astra Q3-NO vs GLM YES = 1-2 HALT: UJ1 WITHDRAWN as unbuildable-without-scope + UJ2 PARKED for his words + UJ3 carried alone; E1/E2 byte-identical; budget carried +47/post 11549); v11 history retained below; v10 + v294-halt fold (Luna/Astra/GLM Q3-NO, Sonnet none): narrowed single bypass (touch-fallback EA 8786-8792 + FRESHCOUNT holds; STAND-DOWN + A2-post dropped with cause) + E1/E2 precedence + P003 conditional cut + UJ2 measured source facts + 09:45 census filed + CE fence row + traceability fixed; separator question WITHDRAWN as moot per message C (no open ask on it); v292 verdicts: Q3-NO Luna/Astra/GLM + Sonnet non-seat refusal; folds: E2-interaction carve-out (standing-retest rule + E2a/E2b in census, EU-inert) + A2-softening + P010 mapping fix + traceability locked-fix + MH/PG drop per FN-redundancy; E1/E2 byte-identical; the 9/1-vs-6/5 separator itself is withdrawn as moot per message C (no open ask, no dependency); v7 9C4A247E stands; v6/v5/v4/v3/v2/v1 history. No code-surface change, budget carried +47/post 11549). Base tree D74FE972/633552/11502 (his 7-trade EU tree, current disk). Assembly rule: v4 sections carried byte-identical except the folded lines (each named below with old-to-new, verified 0-diff elsewhere this block); E-UJ is PROSE proposals only (no code until council rules predicates); old blocks machine-read from disk under UNIQUE headers; each edit-site header exactly once. Relay + battery owed before any transport. No council commit token exists or is asked (builder-called commits per AGENTS 6.5).

Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E1 S5.4 block + E2 recency clauses x2; E-UJ proposes predicates only, no code in v2; S1 recount governs). No new indicator buffers. No new inputs. No existing/global strategy counters touched; the gate introduces local evidence variables only (s54_* - nothing reads them for control flow). No new abort codes (SEEDVOID-style IDLE disposition reused, no new reason string). Nothing under 02_TASK_CHECKPOINTS.

## Authority (his words + disk, no invention)

- His chart rulings (finding RETEST-INVALIDATION-V1 section 6, filed whole): Ruling 3 (8/27: last valid retest 18:05, dead by 18:10 + 18:15 body closes; tester confirmed 18:15 touch, entered 18:20) + Ruling 4 (9/1: retest+confirm same pass 15:30 after 4 dead bars; entered 15:30, off by one). Segment-proved same turn on RECON67 (E8B0E582).
- His blind critic (ledger 749/750 + finding USDJPY-MISSES whole): 3 valid UJ rows missed (6/5 09:45 + 6/5 16:15 + 6/11 14:40) + CONFIRM-ONCE (9:35 retest, 9:40 confirmation, 9:45 open entry; later bars never re-litigate) + his UJ answers 2026-09-26 (finding USDJPY-MISSES His-answers section, filed whole): A1 "no, short" (miss-1 direction settled SHORT) + A2 "no such thing as no profit target" with "april 30th previous day high for 160.723" valid nearest + "i want your solution" (old-high pool + retarget rule commissioned) + A3 "confirmation candle of 14:35" as bullish flip + "FVG invalidation does not matter" (flip governs; FVG corpus recalled: fresh/unfilled valid, partial-without-close valid, sole-death no-kill; A2 line settled 2026-09-26: Daily-POC = the candidate's anchor (segment CONFIRMPOLL 14:45 anchor field).
- FVG-validity corpus (his 2026-09-11 words + Ruling 1 + SEP8): FVG dead only on full-range wick-through or body-close-through; remaining untested range stays POI; partial fill without close never invalidates; older-structure FVG valid while fresh/unfilled.
- Spec Part A v4.2 S5.4 (Pre-confirmation invalidation): a candidate armed and waiting for its confirming close is **dead** if the POI behind it is body-broken before that close; below-or-touching without a body close through stays valid; +1 retest cannot revive a dead candidate (his Ruling 1 words). Status on record: NOT BUILT, no new upstream export needed. Two deaths, no overlap (1R-relocation gate vs POI-side test).
- Spec S5.5: entry is a limit at the confirming candle's close; staleness and structural renewal do not cancel; if the filling candle's own close invalidates, exit immediately.
- Spec section 6: a rejected setup consumes nothing; the same POI may be re-approached later in the same window after a rejection (so voided seeds may reseed fresh - new seed, not revived candidate).
- His renewal word (P-VALIDITY-1 R2, live on D74FE972 EA 7822): a held pre-confirmation seed dies on session-liquidity touch, retest bar included; entry needs a fresh retest. E1 mirrors this disposition shape.
- Matrix (BUILDER_MATRIX_TREETAKES.md): D74FE972 took his 7 valid EU (incl 9/7 NY 16:45); E6E90831 6/7 + 1 false; v7 EU unknown; v5 enumerated with 2 ruled-invalid. Preservation battery below guards the 7.

## Rule E1 - S5.4 gate in the entry path (kills invalidated pre-confirmation seeds)

- Siting: seed block, immediately AFTER the R2 block closes (EA 7855), BEFORE the state-machine body. Same fence as R2 (states above IDLE and below S5 with anchor set); NO regime gate (spec S5.4 is regime-blind - stated reason; R2 keeps its own MEANREV gate untouched).
- Window: (seedbar, evaluation bar] - seed-exclusive, CURRENT-bar-inclusive (the 8/27 lesson: the confirm bar's own close kills; E6b's confirm-exclusion was the hole). Seedbar proxies the retest bar (anchor model: seed IS the retest time; his Ruling 1 blesses seed-anchored windows: +1 retest cannot revive). SEED-EDGE RULING (v3, four-seat halt folded): the seed bar itself is NEVER walked (code-side `s54_s < s54_seedShift`, P068) - the retest-establishment bar cannot invalidate its own retest; text, code, and A-97NY agree at this edge.
- Predicate per walked bar: POI-behind body-break of the entry-anchor line value (dynamic per-bar ReadBuf1 on g_anchorLine, E6b precedent), direction-matched strict cross (LONG: open at-or-above AND close below; SHORT: open at-or-below AND close above - the v11-unanimous asymmetric idiom). Wick-through never kills (spec: below-or-touching stays valid).
- Disposition: mirror R2 exactly (state IDLE, anchor line cleared, anchor time cleared, LogState, S54VOID row with bar/dir/line/break-bar/break-values/walked/skipped). Fail-open on unreadable (EMPTY POI or zero OHLC increments skipped, never kills). Rows debug-gated; void unconditional.
- Reseed semantics: a voided seed may reseed fresh on a later retest (spec section 6: rejection consumes nothing); the dead candidate never revives.
- NON-COVERAGE (scope-disclaimer, blocking-grade): anchor-line only (his retest line may differ from the entry anchor - line mapping is future work); flip/S3.3 untouched (distinct object); recency separate (E2); detector gaps separate (E3 retired v2, P040). A relay claiming S5.4 beyond this boundary is defective.

## Rule E2 - confirm-recency (retest must stand before the confirm bar)

- Predicate: no promotion on a bar whose anchor time is not strictly before the confirm bar time (seedbar < barTime(barShift) required). 9/1 dies here (seedbar == confirmBar 15:25); 9/7 lives (retest 16:35 stands before confirm 16:40 - grade-time rows).
- Sites (D74FE972 has NO S2-exception branch - PREBIND_S2 0 hits on disk; exactly TWO promotion sites, each proven separately): (a) S3-PREBIND true branch (EA 8668) - print STALE row + return (retain, mirror the FAIL arm); (b) S4 edge true branch (EA 8805) - print STALE row + skip promotion (retain). No touch to IsConfirmationCandle (12 call sites - blast radius refused) and no touch to the confirm predicate itself.
- His confirm-once rule rides unchanged (9:35 retest, 9:40 confirmation, 9:45 open entry - his corrected words 2026-09-26, superseding the same-bar framing; the ledger-750 "(9:35 + 9:40 + 9:45)" middle terms were builder EA-mapping, withdrawn; universal: later bars never re-litigate - ledger 750 as amended ledger 809).

## Rule E-UJ - blind-test mechanisms (PROPOSALS for clearance, no code in v2)
- E-UJ1-15M v13 (his bias-flip ruling 2026-09-26 specifies the road; v11 bypass dropped whole on his word, nothing carries; v7/v8 withdrawn with cause on record): PROPOSED rule - 5m retest + 5m confirmation standing, PLUS 15m structural bias flipped at the entry-candle open (his words: 5m flipped 9:25, 15m confirms 09:45 open = entry candle, enabling the trend-following short; journal row 17 corroborates the waiting-for-15m shape; finding USDJPY-MISSES Rulings-D filed whole). Entry fires at the entry-candle open off the 5m confirm with the 15m flip present. CASCADE GUARD: lineup-before-entry shapes stay silent (1 Sep 15:30 S2WAIT retained under the NO-SIGNAL acceptance) - the road takes ONLY the 15m-flip-on-entry-candle shape. 15m-bias data sourcing is council-routed mechanism (not asserted). PRECEDENCE: E1-walk + E2-recency first; no DIV machinery touched; E-UJ stays PROSE.
- E-UJ2-SPEC v13 (his Rulings-C specify the trade; far-back lookup cost is council mechanism work, never his): NEAREST-ANY-AGE (nearest previous day/session high/low at entry, any age) + TOUCH-RETARGET (session H/L valid once closed; revise on price/wick touch to today's NY high/low) + CLOSE-ONLY-GAP-BREAK (closes validate POC/VWAP gap breaks only) + 1R-floor admission gate (nearest must give 1R at entry, else no trade per his invalid-RR rule) + DEGENERATE PIN carried (exact-landing keeps NO_TP_TARGET; strictly-forward NY high required) + preservation carried (nearest-wins, direction/in-zone/swept-live/tier filters unchanged). E-UJ stays PROSE.

- E-UJ1 WITHDRAWN v12, SUPERSEDED v13 (history condensed, full text in git + relay v295 twin: v11 narrowed bypass = touch-fallback EA 8786-8792 + FRESHCOUNT holds for the confirmed bar; 09:45-pass census 18 rows filed v11 - pre-arm S2 FRESHSKIP, SL/TPCENSUS machinery, DL confirm=1, zero DIV/HOLD/VETO/ABORT/STALE; DIV intertwine 8851-8890 refused; A2 inside predicate 2224-2225; live proposal = E-UJ1-15M above)
- E-UJ2 v12 PARKED body retained below as history (its opens now RULED by his Rulings-C; live proposal = E-UJ2-SPEC above): old-high pool + retarget (miss-2: seeded 16:00, killed 16:10 NO_TP_TARGET, 5 levels invalid; his rule: old highs valid, retarget on touch-past): MY SOLUTION as commissioned - (a) extend the BOOKING race (EA 2396-2409: session loop + POI loop through TpTargetUpdateBest into best/haveBest) AND the census naming loops (EA 2441-2465) together with an older-highs source ("booking+census pool" v3 - census alone is read-only per EA 2410-2413 and cannot change booking); DATA QUESTION NARROWED for council (measured v11, disk): H1 600-bar snapshot (SrjSelSnapTF) + limbs scan (SrjLimbsScanTF) + H1 fractals exist; NO weekly source; NO 3000-bar depth anywhere (that figure is withdrawn - never on disk); April-30 high sits ~36 days back, past the H1-600 reach (~25 days) - HTF-insufficient by measurement; swing store exists (302 refs, depth unmeasured); source RULED v13: nearest previous day/session high/low at entry, any age (his NEAREST-ANY-AGE; lookup mechanism routes council); (b) retarget rule: once price/wick touches past the booked old-high, booked target revises to the current NY session high (booked-value store best/haveBest, 15 refs - predicate-time cites the exact store/consume lines; trigger RULED v13: price/wick touch per his TOUCH-RETARGET, closes validate gap breaks only). DEGENERATE PIN (v3): exceed landing exactly on the sampled high leaves no forward target - NO_TP_TARGET stands; the trigger requires a strictly-forward NY high. Preservation: nearest-wins + direction/in-zone/swept-live/tier filters unchanged; booked levels otherwise identical; 1R-floor admission gate added v13 (nearest must give 1R at entry, else no trade).
- E-UJ3 CARRIED v13 (unchanged live proposal; v12 single-re-clear superseded by the three-leg ask) - FVG-yield proposal (miss-3: 14:35 flip confirmed - decision-pass CONFIRMPOLL confirm=1 (oppCandle=1 bodyDir=1 touchAttr=1, anchor Daily-POC [R63 FN]) with RETESTBOOK hits=2 ([R63 QF]); entry owed at 14:40 open, refused post-confirm by FRESHCOUNT HOLD on fvgDead; his words: 14:35 flip-bar IS the confirmation, FVG irrelevant post-flip; his correction 2026-09-26: the 14:45+ bars are post-entry territory, never selection evidence (confirm-once: later bars never re-litigate, ledger 750)): PROPOSED rule - QUALIFYING FLIP (v3 fields, now the yield trigger only): a with-direction bar carrying oppCandle=1 + bodyDir=direction + touchAttr=1 on the standing candidate's line; the decision-pass confirm already succeeds (no confirm-term change); PRECEDENCE: E1-walk + E2-recency evaluate first; FVG-YIELD BOUNDARY: FRESHCOUNT HOLDs (EA 2286/2295/7190/7220/7222/7223) + FRESH_OPP_FVG/FRESH_OB_DEAD vetoes (7 hits each on disk) yield ONLY on the qualifying-flip bar (proceed past the hold to the proven confirm; sole-death no-kill already his corpus). WITHDRAWN v6 (his correction): A2-close-waiver + FLIPSEEN state + same-pass edge (v4/v5 scaffolding built on the post-entry 14:45 row - the decision row shows confirm=1 with no waiver and no carry). SETTLED 2026-09-26: A2 line IS Daily-POC = anchor (segment row proves); no line change; mechanism = flip-confirmation + FVG-yield only.
- S3 budget: E1/E2 carried (v3 battery: +47/post 11549; v4-v13: no code-surface change, budget carried +47/post 11549); E-UJ is PROSE (no code yet - budget unchanged on clearance unless council adds surface).

## Rule E3 - SUPERSEDED by E-UJ above (v1 placeholder retired in v2; UJ now proposed, not owed; v1 evidence-spec lines below retained as history)

- v1 placeholder retired: UJ coverage now proposed in E-UJ above (not owed, not defective to relay).

## Scope (his orders + refinement discipline)

- Narrow edits: one S5.4 block + two recency clauses + E-UJ proposals (no code until council rules predicates). No overall-logic revision. S3/S4-path extension, shared helper, three-state result, latched side, retain-print helper all parked (need his explicit scope word first, never council-first).
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
`               for(int s54_s = barShift; s54_s < s54_seedShift; s54_s++)`
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
`               string s54_poi = AnchorStr();`
`               g_state = ST_IDLE;`
`               g_anchorLine = -1;`
`               g_anchorBarTime = 0;`
`               LogState(s54_prev, g_state);`
`               if(InpDebugLog)`
`                  PrintFormat("[SRJ-EA] S54VOID bar=%s dir=%s poi=%s bbar=%s bpx=%s/%s/%s walked=%d skipped=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), DirName(g_dir), s54_poi, TimeToString(s54_bt, TIME_DATE|TIME_MINUTES), DoubleToString(s54_bv, _Digits), DoubleToString(s54_bo, _Digits), DoubleToString(s54_bc, _Digits), s54_walked, s54_skipped);`
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

- S1 pre-hash gate: re-hash EA (must equal D74FE972/633552/11502 or DIAGNOSED successor, never assumed) plus one hit per anchor (E1 insert anchor EA 7854-7856; E2a anchor EA 8667-8670; E2b anchor EA 8804-8817; R2 block untouched; S5.4 uses existing ReadBuf1/iOpen/iClose/iBarShift/iTime precedents, no new walker callers) plus buffers unchanged plus R-gate/latch untouched plus print census with pinned counts (S54VOID print sites = 1; CONFIRM_STALE_SKIP print sites = 2, one per promotion site) plus UJ touch anchors cited (TPCENSUS EA 2395, booking race EA 2396-2409, census naming EA 2441-2465, booked store best/haveBest, confirm terms EA 2222-2233, FRESHCOUNT EA 2286/2295/7190/7220/7222/7223, FRESH_OPP_FVG/FRESH_OB_DEAD vetoes, NO_TP_TARGET abort sites, STAND-DOWN EA 622 + 8851-8869 recorded non-bypassed (DIV-intertwined, v11) - cited for council, not edits) plus char-code assert every OLD anchor AND every insert byte (E2b old-block render note answered v4: 14/14 byte-diff 0 on disk, rendering artifact only; E1/E2a old blocks 7/7 byte-diff 0 v5; NEW-block carried lines are authored bytes written byte-exact at build, twin diff 0 governs) plus M5 PINNED plus InpDebugLog=true grading precondition (gate control flow unconditional; S54VOID/STALE rows debug-gated). Runs carry InpDebugLog=true.
- S3 budget (mechanical from the pasted blocks, NET per site = new-site-total minus old-site-total; script-counted v3, carried v4-v11 with no code-surface change): E1 +33 (36-3); E2a +6 (10-4); E2b +8 (22-14); total +47; post 11502+47 = 11549 (S3 recount governs).

## Acceptance (grade segment-vs-baselines; event tuples, never bare clock labels)

- A-S54-827 (8/27 SHORT Weekly-POC, RE-TUPLED v4 on disk closed-bar timing): EVAL-TIMING (EA 11487-11491: OnTick fires once per new bar with EvaluateClosedBar(1, iTime(_Symbol, PERIOD_CURRENT, 1)) - barShift=1, barTime=last-closed-bar; walk starts at the last closed bar, prints name barTime): S54VOID row at the 18:15:00 evaluation pass (evaluated bar 18:10; walk (seedbar 17:45, 18:10]; expected bbar 18:10 per his ruling "dead by 18:10", break values populated, walked/skipped printed; grade-time row decides bbar AND whether the void prints) + NO SIGNAL at 18:20 conditional on the void (if no void prints and 18:20 takes, the acceptance fails closed with the P025 anchor-mapping gap as recorded cause - no new question, no re-ask) + NO CONFIRM_PREBIND at 18:20 + anchor cleared (no takes on the dead seed; fresh reseed allowed per spec section 6). D74 base rows: ANCHOR_ELECT seed 17:45 + RETESTBOOK bar=18:10 at pass 18:15:00 + CONFIRMPOLL bar=18:15 confirm=1 at 18:20:01 (RECON60 segment, D74FE972). E4B-RECONCILIATION: pobreak/bbar/bpx are v5-build (E8B0E582) guard-walk fields, 0 hits on D74FE972 - not E1's predicate (s54_hit, per-bar ReadBuf1 on g_anchorLine) and no evidence against it; excluded from this acceptance.
- A-STALE-901 (9/1 SHORT Monthly-POC, RE-TARGETED v3 on D74 rows): NO STALE row is demanded (none can print - the 15:25-pass candidate never reaches a promotion site on D74FE972: CONFIRMPOLL bar=15:25 confirm=1 at pass 15:30:00, then STATE S1_REGIME->S2_LTF_ALIGN + S2WAIT retained; PREBIND_S2 0 hits on disk; R67 PD/KO rows are build E8B0E582, not D74). Acceptance = NO SIGNAL at 15:30 + NO take (negative; pre-existing S2-hold structure, not E2) + E2 declared defense-in-depth for same-bar seed+confirm coincidence (no same-bar case in the EU window reaches a site; STALE print-spec at both sites stands for the grade run to falsify).
- A-97NY (9/7 LONG Weekly-POC): SIGNAL + take at 16:45 + TP exit preserved (seedbar 14:55 per RECON60 ANCHOR_ELECT [D74] fence row, 1x, stands ~2h before confirm 16:40 - E2 margin wide; retest 16:35 < confirm 16:40 - grade-time rows; E1 walk over (seed, 16:40] finds no POI break (code-side `<` agreed v3); NO S54VOID + NO STALE on this path; seeds are long-lived by retention, same-bar seed+confirm coincidence is the exception E2 targets).
- A-7PRESERVE: all 7 valid EU takes present (8/28 + 9/1 17:35 + 9/4 + 9/7 x2 + 9/8 x2); invalid still dead (9/4 10:40, 8/28 NY silent, 8/27 by E1 S54VOID conditional on the walked-bar break (grade-decided, P025 fallback recorded), 9/1-15:30 by pre-existing S2-hold structure with E2 defense-in-depth).
- A-UJ-V1MARKER (retired v3): v1 carried evidence-spec only (which gate refuses each on D74FE972 rows + his 3 objections answered) - superseded by the PROPOSED criteria A-UJ1/2/3 below, which are the v3 UJ acceptance set (proposals for clearance, no code).
- A-UJ1 (6/5 09:45 SHORT, PROPOSED v13): fire at the 09:45 open off the 5m 09:40 confirm=1 ([R63 DL]) with the standing 09:35 retest ([R63] FF/DK) AND the 15m flipped at the entry candle (his bias-flip rule); 1 Sep 15:30 stays silent (cascade guard).: confirm-lock fire at 09:45 open off 09:40 confirm=1 ([R63 DL]) with standing 09:35 retest ([R63] FF/DK); downstream gates bypassed for the confirmed bar; 10:40-excluded by pre-confirm death.
- A-UJ2 (6/5 16:15 LONG, PROPOSED v13): TP pool admits the nearest old high any age + touch-retarget to today's NY high; 1R gate at admission; NO_TP_TARGET gone on this path only.: TP pool admits the old high (160.723-class) + retarget to current NY high on exceed; NO_TP_TARGET gone on this path.
- A-UJ3 (6/11 14:40 LONG, PROPOSED): fire at 14:40 open off the 14:35 confirm=1 ([R63 FN]) with the FVG-hold yielded; A2 line = anchor Daily-POC (segment-proved at decision [R63 FN], no change; the 14:45 pair is dropped as redundant with cause).
- L-final v13: A-S54-827 + A-STALE-901 + A-97NY + A-7PRESERVE + A-UJ-V1MARKER + A-UJ1 + A-UJ2 + A-UJ3 above (all three UJ PROPOSED v13).

## Run cost and novel evidence

- One build (STAGE-1 gated) plus two tester runs, ceiling 90 each: EU full 8/26-9/10 (~50 min) + UJ full 6/1-6/13 (~45 min, on key + his explicit evidence-word; no slices - history fidelity).
- UJ predicates proposed (clearance + predicate-time 10:40 rows); E-UJ stays PROSE until council rules predicates.
- Novel evidence vs RECON67/RECON60/his report: (a) S54VOID + STALE rows on the ruled bars with no takes; (b) all-7 preservation re-proof under the new gates; (c) UJ take-arise on ruled predicates (A-UJ1/2/3 gradeable once cleared).

(End of file)