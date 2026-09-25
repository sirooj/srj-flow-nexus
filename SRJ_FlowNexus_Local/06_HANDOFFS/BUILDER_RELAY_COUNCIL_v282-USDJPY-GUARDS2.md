# RELAY v282 — PACKET_P-USDJPY-2 v2 (amend-with-delta; abort dispositions, standing gate)



Project brief (standing - read first):

- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.

- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.

- History: packet P-USDJPY-2 v1 ruled AMEND by all four seats (tallied HALTED, filed whole under V281 headers); this v2 folds every verdict below. Rounds end in amend or clear, never silent drift.

- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.



Change (one plain sentence per question): E6a now blocks the E4b promotion on standing HTF opposition and aborts the candidate with the existing misalignment code. E6b now blocks on plain anchor body cross with exact seed lookup and aborts with a new break code, reporting the breaking bar.



File / function / lines: Experts\SRJ_FlowNexus_EA.mq5, S2 block of EvaluateClosedBar, EA 8086-8112 (27 lines, v7-built E4b branch, the edit site). Function SrjOrderEmit flip predicate EA 5117-5146 (30 lines). LTF invariant range EA 7119-7130 (12 lines). Abort defines EA 302-324 (23 lines). Task-76 comment EA 7099-7102 (4 lines). LogAbort EA 1728-1733 (6 lines, abort rows print unconditionally).

Source digest: CD95241F / 637583 bytes / 11552 lines (built tree, no build since v7; STAGE-1 must re-hash or diagnose a successor).

Packet: 01_TASKS\PACKET_P-USDJPY-2v2.md 3A1E640F / 18319 bytes / 182 lines (E4b old 27 / new 76 / NET +49; defines old 2 / new 4 / +2; comment old 4 / new 5 / +1; total +52, post 11604; acceptance B1-B8).

Segment: 06_HANDOFFS\RECON64-V7-USDJPY_JOURNAL.log C03D4774 / 3879744 bytes / 21450 lines (v7 run, DONE=PASSED).

Priors (labeled, never as anyone's words): relay v281 (06_HANDOFFS\BUILDER_RELAY_COUNCIL_v281-USDJPY-GUARDS.md FF154006, tallied HALTED); packet v8 (01_TASKS\PACKET_P-USDJPY-2v1.md 8457C2C1); V281 grade (06_HANDOFFS\BUILDER_RESULT_V281-GRADE.md 56EBA8C0); his retest-invalidation ruling (06_HANDOFFS\BUILDER_FINDING_RETEST-INVALIDATION-V1.md 8EF27EF8).



Q1 (E6a amended): gate on standing opposition (antiNow>=2; flip kept as print field only) with GoAbort(ABORT_LTF_MISALIGN) on fire; Task-76 comment amended to cover E4b-guard kills; rule text relabeled as HTF-opposition proxy separating the ruled rows (A1 anti=1 promotes; 6/04 anti=2 and 6/08 anti=3 abort) with S3.3-5m mapping open to his word; LTF-seed-alignment alternative tested and rejected on rows (seedBiasAl 0/0/0/1 kills blessed A1). Is the standing gate plus abort disposition plus proxy wording a correct implementation of his kill rule for the E4b path? Cite lines.

Q2 (E6b amended): behind term deleted (proved no-op); plain dir-matched body cross; seed exact=true with anchor>0 and SEED anomaly print; breaking-bar evidence fields in the print; guards evaluated inside the confirm-true branch; abort with new ABORT_S54_POIBREAK on fire; E4b-only scope retained with S3/S4 extension parked. Is the predicate plus abort code plus scope a correct implementation of spec S5.4 for this refinement round? Cite lines.



Answer form: plain yes / no / discrepancy, with line numbers, per question (a NO on one never sinks the other).

Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.



Reviewer demands from v281, quoted complete with rulings (nothing built on unruled demands):
- Luna-B shared predicate: "The stronger long-term mechanism is a **single shared fresh-HTF-opposition predicate** used both by the existing ORDER census and by the E4b guard. That would remove duplicate counting logic and make "verbatim predicate" structural rather than textual. The relevant touch points would be the E4b insertion at the 8086-8112 site and the existing ORDER calculation at 5117-5146." RULED DEFERRED to a follow-on (new function surface, needs scope word).
- Luna-B three-state: "A better mechanism is a **dedicated anchor-body-break helper** returning a three-state result such as `CLEAN / BROKEN / UNREADABLE`, while preserving the packet's settled fail-open behavior for `UNREADABLE`. That makes the distinction observable instead of collapsing "could not prove a break" into ordinary clean state. The current logic lives entirely in the E4b block at the 8086-8112 region described by the packet. The current walk itself is specified at P087-P106." RULED DEFERRED (new function surface).
- Luna most-important: "Before touching either predicate, I would settle **what "S3.3 kills" means operationally**. If it means "this confirmation attempt is invalid but the armed candidate survives," the current S2WAIT return is coherent. If it means "the candidate is dead," the current E6a disposition is not sufficient. The page currently contains both meanings without resolving them." RULED - kill adopted via existing abort codes (candidate is dead; no S2 remainder).
- Sonnet-B latched side: "latch the POI-relative side once, at the seed bar, before the walk — e.g. compute `e6b_side` from the seed bar's own open/close relative to the anchor at `e6b_seedShift` (a single read, before the `for` loop at `P092`), store it as a fixed bool, and use *that* latched variable as the "behind" gate on every iteration instead of recomputing `e6b_behind` per-bar. Keep the per-bar `crossDn`/`crossUp` test as-is for the actual break detection. This would touch `P088–P105`, adding one small block above the loop and swapping `e6b_behind` inside the loop body from a per-bar recompute to the latched variable. This turns disclosure (3) from "known simplification" into an actual latched-side implementation, and stops the AND from being a no-op." RULED DEFERRED (behavior change needing its own row evidence; plain cross adopted).
- Sonnet-B helper factoring: "factor the antiNow/antiPrev leg-count logic (`C5120–5134` and `P071–P085`) into a single shared helper (e.g. `bool CountHtfAntiLegs(int shift, int want, int &antiOut)`) called from both the ORDER census site and the E6a site. Touches `C5117–5135` and `P068–P086`. Purely a maintenance/drift-prevention change — output is currently identical either way, so no behavior change, no B1–B7 risk." RULED DEFERRED (new function surface).
- Astra-B durability: "Amend P106–P114 so a proven killing event ends that candidate's eligibility. Prefer an appropriate existing terminal/reset mechanism if one exists; the supplied excerpts do not identify which existing abort code would be correct. If the state must remain S2, it needs a candidate-specific invalid latch that prevents subsequent promotion, including P133, and clears only on an authorized new-candidate lifecycle event. Merely retaining the current state is insufficient." RULED - durability via existing aborts (LTF_MISALIGN for flip; new S54_POIBREAK for break; no S2 remainder, no latch needed).
- Astra-B flip tracking: "P068–P086 can preserve the exact census transition predicate while recording that a qualifying post-retest event occurred. A bounded historical scan is an alternative if candidate start time and historical buffer semantics are reliable. Either mechanism can preserve never-aligned candidates that have never suffered a killing transition." RULED - flip kept as print field; standing-opposition gate preserves never-aligned clean candidates (A1 anti=1).
- Astra-B interval: "Amend P089–P103 to use the rule's actual start event, an exact seed-time contract, and the agreed confirmation-bar boundary. Define dynamic versus locked anchor value and equality/gap behavior before changing the inequalities." RULED ADOPTED (exact=true, anchor>0, seed-inclusive/confirm-exclusive stated, equality/gap choices stated).
- Astra-B outcome separation: "Replace the effective boolean-only decisions across P068–P105 with explicit validity status. Unknown evidence should defer promotion if the goal is mandatory settled-rule enforcement; it need not be mislabeled as a proven break or require a new abort code. Add the missing-read reason and first offending bar/value evidence to P109–P113." RULED ADOPTED as evidence fields in the print (flip/opposed/pobreak/bbar/bpx) plus SEED anomaly print; abort on proven kill only (unproved never mislabeled as break).
- Astra-B death grading: "Amend P143–P150 to require independent E6a/E6b attribution and to prove that the same invalidated candidate cannot confirm later or escape through later alignment. Keep broader S3/S4-origin coverage parked under P024 unless the operator authorizes that extension." RULED ADOPTED as B1/B2/B8 (independent attribution + post-kill silence window).
- Opus-B1 standing opposition: "Replace the block condition at P086/P106 with the state boolean your code already defines: `oOpp` / `biasOpposedAtGate` = `antiNow >= 2` (C5141). Keep `flipNewThisBar` as a print field (its correct role, C5135/C5144). Checked against all four evidence rows: A1 `biasAtGate=1` → 0, promotes ✓; A4 `biasAtGate=1` → 0, untouched ✓; 6/04 `biasAtGate=2` → 1, killed ✓; 6/08 `biasAtGate=3` → 1, killed ✓. Strictly safer, passes every row the newness predicate passes, and makes S2WAIT-retain a sound disposition because the block persists while the opposition does. Cost: more EURUSD takes may die under B7, which is diagnostic, not a regression. Touches P068-P086, P106, P109-P113 (print both fields), P018, P143-P144, P149." RULED ADOPTED (gate condition; disposition upgraded to abort per the kill consensus, making the S2WAIT-retain soundness point moot).
- Opus-B2 reorder inside confirm-true: "Evaluate P068-P105 after `IsConfirmationCandle` succeeds at P117, before the state assignment at P121. Then a fired guard is by definition a blocked promotion, one-to-one with a would-be take." RULED ADOPTED.
- Opus-B3 unconditional diagnostic: "Print one row per E4b promotion attempt with `antiNow`, `antiPrev`, `seedShift`, bars walked, and `poiReads`, whether or not the gate fires. Reuse the E4B_GUARD name with a `fired=` field, or add `E4B_GATEDIAG`. Touches P106-P115 plus one new print-name entry at P138." RULED ADOPTED as E4B_GUARD on every confirm-true with flip/opposed/pobreak/bbar/bpx fields (clean promotions print zeros; fired state derivable).
- Opus-B4 breaking bar: "Carry `e6b_s`, `iTime(...,e6b_s)`, `e6b_v`, `e6b_o`, `e6b_c` out of the loop at P103 and into the print at P109-P113. Makes B1's pobreak leg adjudicable post-run." RULED ADOPTED.
- Opus-B5 seed sanitation: "At P089: require `g_anchorBarTime > 0`, use `iBarShift(..., true)` or validate the resolved time against `g_anchorBarTime`, cap `seedShift - barShift` at a stated maximum, and print an anomaly row on `seedShift < barShift` or cap-exceeded instead of silently skipping." RULED ADOPTED except the lookback cap (REJECTED: a bar-count cap needs a number, prohibited by spec section 0; walk bounded by real seeds only; anomaly print on unresolvable seed).
- Opus-B6 behind term: "Delete P099 (behavior-identical, one less line to defend), or latch the side once at the seed bar and test `behind` against that, which is a genuine gate and a genuine behavior change needing its own row evidence. Do not keep a no-op term described in a disclosure as if it were doing work." RULED - delete ADOPTED; latch DEFERRED (behavior change needing row evidence).
- Opus-B7 parked S3/S4 insertion site: "the LTF invariant block at C7119-C7130 already runs for `ST_S3_ZONE_WAIT..ST_S5_GATE_CHECK`, already holds a `CheckLtfAlign` + `GoAbort`, and is exactly the block E4b bypasses (P013). Naming it now costs nothing and gives the parked item a single site instead of a re-survey next round. Note in P019/P024 only; no edit this round." RULED NOTED in packet scope prose; no edit this round.
- Opus-B8 retain-print helper: "One helper emitting the S2WAIT row with a cause argument (`LTF_UNALIGNED` / `E4B_GUARD`), called from both P114 and P130. Removes the duplicated literal and makes guard kills separable in the journal without a second grep." RULED DEFERRED (new function surface; abort removed the E6 S2WAIT copy, only the original remains).
- Blocking items from v281 (Opus-A4 self-clearing, A7 fail-open-no-trace, A17 E6b-no-positive, A19 B7): RULED - abort closes A4; ABORT rows (unconditional via LogAbort) + per-attempt GUARD rows close A7; pre-declared pobreak + B8 close A17; B7 rewritten (adjudicate kills on rows, halt only unattributable) closes A19.



Verification split: rule on the page only - genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.

Nothing else is asked. Thank you.



P001: # PACKET_P-USDJPY-2 v2 DRAFT - amend-with-delta on v1 verdicts (nothing builds/runs/commits on this file)

P002: 

P003: Status: v2 DRAFT (v1 8457C2C1/13955/158 SUPERSEDED untransported-folded - transported as v281 and ruled amend by all four seats: Luna DISCREPANCY-on-Q1 + YES-on-Q2; Astra NO/NO; Sonnet YES/DISCREPANCY; Opus AMEND blocking A4/A7/A17/A19; code UNCHANGED - this fold amends disposition + predicate + acceptance only). Assembly rule: enumerated literal edits below only (E4b branch interior + abort-define insert + Task-76 comment); old blocks machine-read from disk under UNIQUE headers; each edit-site header exactly once. Relay + battery owed before any transport.

P004: 

P005: Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E6a/E6b amended guards + one abort-define + one comment; S1 recount governs). No new indicator buffers. No new inputs. No counter touches. One new abort-define (council-ruled name below). Nothing under 02_TASK_CHECKPOINTS. Commits are builder-called (AGENTS 6.5); no council commit token exists or is asked.

P006: 

P007: ## Authority (his words + disk, no invention)

P008: 

P009: - His retest-invalidation ruling 2026-09-25 (finding RETEST-INVALIDATION-V1 8EF27EF8) + refinement-phase order + skill section 6 (settled rules ride every refinement).

P010: - v281 verdicts, all four filed whole (tallied HALTED, no clear anywhere): E6a predicate transcription unanimous-YES (Luna-a/Opus-a/Sonnet-Q1/Astra predicate-copy); E6a retain-disposition unanimous-NO (Luna-Q1/Astra-Q1/Opus-Q1c; Sonnet-Q1 YES noted and overruled by his kill words + 3 seats); E6b behind-gate dead logic unanimous (Sonnet-A1/Opus-A6/Q2-1/Astra-A10); standing-opposition gate endorsed (Opus-B1, evidence table 1/2/3/1); abort-via-existing-mechanism endorsed (Opus disposition-1 + Astra-B durability); HTF-proxy relabel demanded (Opus-Q1b); B7 rewrite demanded (Opus-A19); E6b-evidence acceptance demanded (Opus-A17/Q2-4); fail-open trace demanded (Opus-A7); breaking-bar evidence demanded (Opus-A13); seed sanitation demanded (Opus-Q2-3/A11/A12, Sonnet-A2); behind-term deletion demanded (Opus-B6); latched-side alternative deferred (Sonnet-B); reorder-inside-confirm demanded (Opus-B2); B1/B2 window hardening demanded (Opus-A16, Astra-15/16); S1 definitions demanded (Luna-A9/A10/A11).

P011: - Disclosure-1 risk recorded + ruled (Opus-A15: pass-through class includes standing maximal opposition beyond the ruled transition; no blessed shape carries anti>=2 on rows; S3.3-letter supports kill; his word governs any remap).

P012: - Deferred visibly (quoted + ruled by name for the v282 relay, no build on them): shared HTF helper (Luna-B), three-state outcome (Luna-B), latched-side behind (Sonnet-B), S3/S4-path extension (parked), retain-print helper (Opus-B8).

P013: - Row evidence carried forward (RECON64 C03D4774): ORDER flip/opposed 1/0 (A1 09:40), 2/1 (6/04 16:15), 3/1 (6/08 09:30), 1/0 (A4 09:05); seedBiasAl 0/0/0/1 (LTF-seed cannot separate - HTF proxy is the only row-proved discriminator); WAIVED 16:00 x2 + PREBIND_S2 16:15 + TPFALLBACK 160.028/20 + TP_RR_FAIL_LATCH R0.38 (A2 chain); PREBIND_S2 09:40 + SIGNAL + EXECUTED 159.948 + TP win (A1); S4-path SIGNAL + 159.932/159.929/159.983 (A4).

P014: 

P015: ## Rule (amended guards, E4b branch only; baseline S3/S4 paths untouched)

P016: 

P017: - E6a standing-opposition gate (amends v1 newness): at E4b promotion compute HTF legs exactly as v1 (same reads, same counts); print flip (diagnostic, newness formula kept) AND opposed (antiNow>=2); BLOCK on opposed. Never-aligned clean (A1 anti=1) promotes; fresh flips (2,3) and standing maximal opposition both abort. Wording relabeled: HTF-opposition proxy separating the ruled rows (not a citation of the 5m sentence; LTF-invariant covers S3+; E4b needs row-separation - his word governs any remap).

P018: - E6a disposition ABORT (amends v1 retain): opposed-fire prints E4B_GUARD evidence fields then GoAbort(ABORT_LTF_MISALIGN) - existing code, semantically true (standing opposition = misaligned); Task-76 comment amended (post-S2 invariant + E4b-guard kills). Durable: aborted candidates never revive via later confirm or later alignment. S2WAIT-retain survives ONLY for confirm-fail (pre-existing shape).

P019: - E6b POI-break guard (amended predicate): walk confirm+1 through seedShift inclusive (confirm bar excluded - belongs to IsConfirmationCandle; seed bar included - stated exactly); behind term DELETED (proved no-op: LONG behind (v<=o) identical to crossDn clause one; SHORT mirrored); plain dir-matched body cross (equality/gap choices kept from v1: open-at-level starts, close-exactly-on-level excluded, beyond-beyond excluded); EMPTY/unreadable skipped; seed resolution exact=true with anchor>0 (nearest-approximation removed); seedShift<0 prints E4B_GUARD_SKIP anomaly; equal shifts silent (confirm-on-seed, nothing intervening). Breaking-bar evidence carried out (bar time, anchor, open, close) into the print.

P020: - E6b disposition ABORT (amends v1 retain): new code ABORT_S54_POIBREAK (one string define, S1-censused; council-ruled name in v282 relay); print evidence fields first, then abort. Durable per S5.4 DEAD.

P021: - Order: guards evaluated INSIDE the confirm-true branch (amends v1 pre-confirm evaluation): a fired guard is by definition a blocked promotion; E4B_GUARD prints on every E4b confirm-true evaluation (fired fields; clean promotions print zeros - coverage trace); no POI walk runs without a confirm shape.

P022: - Untouched (fence): everything v7 built except the E4b branch interior; S3-prebind and S4-edge paths; ORDER/DIV gates; other abort codes; counters; buffers; inputs; R floor; exits; management.

P023: 

P024: ## Scope (refinement phase, his order)

P025: 

P026: - Narrow edits to the E4b branch interior + one define + one comment. No overall-logic revision. S3/S4-path extension still parked (needs his explicit scope word first, never council-first).

P027: - Windows: USDJPY 6/1-6/13 + EURUSD 8/26-9/10 (config-ini unix window per RUN-WINDOW GATE). InpDebugLog=true (grading precondition, stated), InpMode=1, M5 pinned.

P028: 

P029: ## Edit set (exact verbatim old/new; STAGE-1 exact-diff gated; old blocks disk-read same turn under UNIQUE headers; exactly one block per site)

P030: 

P031: - E6a+E6b (old EA 8086-8112 27 lines, new 105 lines, NET +78):

P032:   old:

P033: `   if(g_state == ST_S2_LTF_ALIGN)`

P034: `     {`

P035: `      bool aligned;`

P036: `      if(!CheckLtfAlign(barShift, g_dir, aligned))`

P037: `        { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }`

P038: `      if(!aligned)`

P039: `        {`

P040: `         //--- [P-USDJPY-1 E4b] his confirm-once rule 2026-09-25 + 2026-09-11 ruling extended to S2 as a deliberate exception (LTF-stay overridden for confirm-bearing candidates only; S3-only keeps the 6/5 miss dead). Identical predicate, identical S5 fall-through; FAIL retains at S2.`

P041: `         string cfTermS2 = "";`

P042: `         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermS2))`

P043: `           {`

P044: `            ENUM_SRJ_STATE prevS2 = g_state;`

P045: `            g_confirmFromState = prevS2;`

P046: `            g_state = ST_S5_GATE_CHECK;`

P047: `            LogState(prevS2, g_state);`

P048: `            if(InpDebugLog)`

P049: `               PrintFormat("[SRJ-EA] CONFIRM_PREBIND_S2 bar=%s dir=%s poi=%s seedbar=%s",`

P050: `                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),`

P051: `                           DirName(g_dir), AnchorStr(),`

P052: `                           TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES));`

P053: `           }`

P054: `         else`

P055: `           { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }`

P056: `        }`

P057: `      ENUM_SRJ_STATE prev = g_state;`

P058: `      if(g_state == ST_S2_LTF_ALIGN) { g_state = ST_S3_ZONE_WAIT; LogState(prev, g_state); }`

P059: `     }`

P060:   new (confirm-first reorder; standing-opp gate; POI walk without behind term; evidence print; abort dispositions):

P061: `   if(g_state == ST_S2_LTF_ALIGN)`

P062: `     {`

P063: `      bool aligned;`

P064: `      if(!CheckLtfAlign(barShift, g_dir, aligned))`

P065: `        { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }`

P066: `      if(!aligned)`

P067: `        {`

P068: `         //--- [P-USDJPY-1 E4b] his confirm-once rule 2026-09-25 + 2026-09-11 ruling extended to S2 as a deliberate exception (LTF-stay overridden for confirm-bearing candidates only; S3-only keeps the 6/5 miss dead). Identical predicate, identical S5 fall-through; FAIL retains at S2.`

P069: `         string cfTermS2 = "";`

P070: `         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermS2))`

P071: `           {`

P072: `            //--- [P-USDJPY-2 E6a] HTF-opposition proxy separating the ruled rows (A1 anti=1 promotes; 6/04 anti=2 and 6/08 anti=3 abort): gate on STANDING opposition (antiNow>=2); flip kept as print field only. S3.3 5m-mapping: LTF invariant covers S3+; E4b needs row-separation - his word governs any remap.`

P073: `            int e6a_antiNow = -1, e6a_antiPrev = -1;`

P074: `            int e6a_want = (g_dir == DIR_LONG) ? 1 : -1;`

P075: `            double e6a_h = 0.0, e6a_m = 0.0, e6a_l = 0.0;`

P076: `            if(ReadFlow(FL_BUF_HTF_HIGH, e6a_h, barShift) && ReadFlow(FL_BUF_HTF_MID, e6a_m, barShift) && ReadFlow(FL_BUF_HTF_LOW, e6a_l, barShift))`

P077: `              {`

P078: `               e6a_antiNow = 0;`

P079: `               if((int)MathRound(e6a_h) == -e6a_want) e6a_antiNow++;`

P080: `               if((int)MathRound(e6a_m) == -e6a_want) e6a_antiNow++;`

P081: `               if((int)MathRound(e6a_l) == -e6a_want) e6a_antiNow++;`

P082: `              }`

P083: `            double e6a_h1 = 0.0, e6a_m1 = 0.0, e6a_l1 = 0.0;`

P084: `            if(ReadFlow(FL_BUF_HTF_HIGH, e6a_h1, barShift + 1) && ReadFlow(FL_BUF_HTF_MID, e6a_m1, barShift + 1) && ReadFlow(FL_BUF_HTF_LOW, e6a_l1, barShift + 1))`

P085: `              {`

P086: `               e6a_antiPrev = 0;`

P087: `               if((int)MathRound(e6a_h1) == -e6a_want) e6a_antiPrev++;`

P088: `               if((int)MathRound(e6a_m1) == -e6a_want) e6a_antiPrev++;`

P089: `               if((int)MathRound(e6a_l1) == -e6a_want) e6a_antiPrev++;`

P090: `              }`

P091: `            bool e6a_flip = (e6a_antiNow >= 2 && e6a_antiPrev >= 0 && e6a_antiPrev < 2);`

P092: `            bool e6a_block = (e6a_antiNow >= 2);`

P093: `            //--- [P-USDJPY-2 E6b] spec S5.4: anchor POI body cross from seed bar (inclusive) through confirm bar (exclusive) kills the promotion. Walk shifts confirm+1..seed; EMPTY/unreadable skipped; exact seed with anchor>0; equality/gap choices as stated in packet.`

P094: `            bool e6b_broken = false;`

P095: `            datetime e6b_bt = 0; double e6b_bv = 0.0, e6b_bo = 0.0, e6b_bc = 0.0;`

P096: `            int e6b_seedShift = -1;`

P097: `            if(g_anchorBarTime > 0)`

P098: `               e6b_seedShift = iBarShift(_Symbol, PERIOD_CURRENT, g_anchorBarTime, true);`

P099: `            if(e6b_seedShift < 0)`

P100: `              {`

P101: `               if(InpDebugLog)`

P102: `                  PrintFormat("[SRJ-EA] E4B_GUARD_SKIP bar=%s dir=%s poi=%s reason=SEED", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());`

P103: `              }`

P104: `            else if(e6b_seedShift > barShift)`

P105: `              {`

P106: `               for(int e6b_s = barShift + 1; e6b_s <= e6b_seedShift; e6b_s++)`

P107: `                 {`

P108: `                  double e6b_v = 0.0;`

P109: `                  if(!ReadBuf1(g_hPoi, g_anchorLine, e6b_v, e6b_s) || e6b_v == EMPTY_VALUE) continue;`

P110: `                  double e6b_o = iOpen(_Symbol, PERIOD_CURRENT, e6b_s);`

P111: `                  double e6b_c = iClose(_Symbol, PERIOD_CURRENT, e6b_s);`

P112: `                  if(e6b_o == 0.0 || e6b_c == 0.0) continue;`

P113: `                  bool e6b_hit = (g_dir == DIR_LONG) ? (e6b_o >= e6b_v && e6b_c < e6b_v) : (e6b_o <= e6b_v && e6b_c > e6b_v);`

P114: `                  if(e6b_hit) { e6b_broken = true; e6b_bt = iTime(_Symbol, PERIOD_CURRENT, e6b_s); e6b_bv = e6b_v; e6b_bo = e6b_o; e6b_bc = e6b_c; break; }`

P115: `                 }`

P116: `              }`

P117: `            if(InpDebugLog)`

P118: `               PrintFormat("[SRJ-EA] E4B_GUARD bar=%s dir=%s poi=%s seedbar=%s flip=%d opposed=%d pobreak=%d bbar=%s bpx=%s/%s/%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES), (int)e6a_flip, (int)e6a_block, (int)e6b_broken, TimeToString(e6b_bt, TIME_DATE|TIME_MINUTES), DoubleToString(e6b_bv, _Digits), DoubleToString(e6b_bo, _Digits), DoubleToString(e6b_bc, _Digits));`

P119: `            if(e6a_block) { GoAbort(ABORT_LTF_MISALIGN, g_state); return; }`

P120: `            if(e6b_broken) { GoAbort(ABORT_S54_POIBREAK, g_state); return; }`

P121: `            ENUM_SRJ_STATE prevS2 = g_state;`

P122: `            g_confirmFromState = prevS2;`

P123: `            g_state = ST_S5_GATE_CHECK;`

P124: `            LogState(prevS2, g_state);`

P125: `            if(InpDebugLog)`

P126: `               PrintFormat("[SRJ-EA] CONFIRM_PREBIND_S2 bar=%s dir=%s poi=%s seedbar=%s",`

P127: `                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),`

P128: `                           DirName(g_dir), AnchorStr(),`

P129: `                           TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES));`

P130: `           }`

P131: `         else`

P132: `           { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }`

P133: `        }`

P134: `      ENUM_SRJ_STATE prev = g_state;`

P135: `      if(g_state == ST_S2_LTF_ALIGN) { g_state = ST_S3_ZONE_WAIT; LogState(prev, g_state); }`

P136: `     }`

P137: - Abort-define insert (old EA 323-324 2 lines, new 4 lines, NET +2):

P138:   old:

P139: `#define ABORT_POI_REPLACED     "POI_REPLACED"`

P140: `#define ABORT_DIV_FALLBACK     "DIV_FALLBACK"`

P141:   new:

P142: `#define ABORT_POI_REPLACED     "POI_REPLACED"`

P143: `#define ABORT_DIV_FALLBACK     "DIV_FALLBACK"`

P144: `//--- [P-USDJPY-2 E6b] settled-rule kill reason (S5.4 POI-break; council-ruled name).`

P145: `#define ABORT_S54_POIBREAK     "S54_POIBREAK"`

P146: - Task-76 comment amendment (old EA 7099-7102 4 lines, new 5 lines, NET +1):

P147:   old:

P148: `   //--- Reuses ABORT_LTF_MISALIGN and adds no new reason code. Task 76 removed`

P149: `   //--- the only other site that emitted it, so the string is now unambiguous:`

P150: `   //--- every LTF_MISALIGN abort is a post-S2 invariant failure. It is NOT the`

P151: `   //--- same population as the pre-Task-76 count and must not be compared to it.`

P152:   new:

P153: `   //--- Reuses ABORT_LTF_MISALIGN and adds no new reason code. Task 76 removed`

P154: `   //--- the only other site that emitted it, so the string is now unambiguous:`

P155: `   //--- every LTF_MISALIGN abort is a post-S2 invariant failure or an E4b-guard`

P156: `   //--- flip kill (P-USDJPY-2 E6a, same standing opposition). It is NOT the`

P157: `   //--- same population as the pre-Task-76 count and must not be compared to it.`

P158: 

P159: ## Stages (T161N discipline; RECON64 precedent)

P160: 

P161: - S1 pre-hash gate: re-hash EA (must equal CD95241F/637583/11552 or DIAGNOSED successor, never assumed; DIAGNOSED means disk-diagnosed drift filed in ledger and disclosed in relay, never assumed) plus one hit per anchor (one code occurrence per anchor outside history comments: E4b block + abort-define pair + Task-76 comment; print census: E4B_GUARD + E4B_GUARD_SKIP + ABORT_S54_POIBREAK) plus buffers unchanged (no new indicator buffers) plus R-gate/latch untouched (no edit there) plus call-site census (ComputeNearestTpTarget( = 5: definition + 7307 + 8918 + 2 fallback calls; E6 reads: 6 HTF-leg + POI-walk + OHLC + iBarShift, no new walker callers) plus char-code assert every OLD anchor AND every insert byte plus HTF-buffer ids (HIGH/MID/LOW used at EA:5120) plus POI-handle read precedent (ReadBuf1 on the POI handle at the walker site) plus iBarShift precedent (14 hits) plus M5 PINNED plus InpDebugLog=true grading precondition (guard control flow unconditional; guard rows debug-gated; ABORT rows unconditional via LogAbort). Runs carry InpDebugLog=true.

P162: - S3 budget (mechanical from the pasted blocks, NET per site = new-site-total minus old-site-total; script-counted this block): E4b +49 (76-27); defines +2 (4-2); comment +1 (5-4); total +52; post 11552+52 = 11604 (S3 recount governs).

P163: 

P164: ## Acceptance (grade segment-vs-baselines; event tuples, never bare clock labels)

P165: 

P166: - B1 (6/04 16:15 pass, SHORT Daily-POC): NO SIGNAL at 16:20 and NO CONFIRM_PREBIND_S2 + NO SIGNAL on this anchor for the rest of its S2 retention (window clause); E4B_GUARD opposed=1 with ABORT_LTF_MISALIGN row at the kill minute; pobreak=1 expected with breaking bar adjudicated from the print fields at grade.

P167: - B2 (6/08 09:30 pass, SHORT Weekly-POC): NO SIGNAL at 09:35 and window clause as B1; E4B_GUARD opposed=1 with ABORT_LTF_MISALIGN row.

P168: - B3 (A1 09:40 pass, SHORT Daily-POC): SIGNAL 09:45 + EXECUTED 159.948 + TP_TOUCH 159.899 identical; E4B_GUARD opposed=0 pobreak=0 row at the pass (coverage proof).

P169: - B4 (A4 6/03 09:05 pass, LONG Daily-VWAP): SIGNAL + fills 159.932/159.929/159.983 identical (S4 path untouched - parity check, not cleanliness evidence).

P170: - B5 (A2 16:50 refuse, LONG Daily-POC): TP_RR_FAIL_LATCH R0.38 ABORT identical (S3 path untouched - parity check).

P171: - B6 (6/03 18:35 refuse, LONG Daily-POC): TP_RR_FAIL_LATCH R0.28 ABORT identical.

P172: - B7 (EURUSD 8/26-9/10 join): killed takes adjudicated on row evidence against S3.3/S5.4 (guard-kill on a take carrying genuine flip/break = guard working, even on his rows - consistent with his declines); HALT only on an unattributable kill or a kill with no genuine cause on the rows. Baseline takes otherwise bit-identical on bar/entry/exit; rejects diagnostic.

P173: - B8 (post-kill silence): NO CONFIRM_PREBIND_S2 and NO SIGNAL on the ruled anchors (6/04 SHORT Daily-POC; 6/08 SHORT Weekly-POC) after the kill minutes through window end.

P174: - L-final: B1-B8 above.

P175: 

P176: ## Run cost and novel evidence

P177: 

P178: - One build (STAGE-1 gated) plus two tester runs, ceiling 90 each: USDJPY June 1-13 (~45 min) + EURUSD full 8/26-9/10 (~50 min). Same cost as v7.

P179: - E6 guards now terminate (abort) instead of defer; behind term deleted; seed exact; evidence print on every confirm-true.

P180: - Novel evidence vs RECON64/65: (a) ABORT rows on his two ruled instances with no takes and no post-kill revival; (b) A1/A4 intact re-proof with coverage rows; (c) EU join with guard attribution on every killed take.

P181: 

P182: (End of file)



C8086:    if(g_state == ST_S2_LTF_ALIGN)

C8087:      {

C8088:       bool aligned;

C8089:       if(!CheckLtfAlign(barShift, g_dir, aligned))

C8090:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }

C8091:       if(!aligned)

C8092:         {

C8093:          //--- [P-USDJPY-1 E4b] his confirm-once rule 2026-09-25 + 2026-09-11 ruling extended to S2 as a deliberate exception (LTF-stay overridden for confirm-bearing candidates only; S3-only keeps the 6/5 miss dead). Identical predicate, identical S5 fall-through; FAIL retains at S2.

C8094:          string cfTermS2 = "";

C8095:          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermS2))

C8096:            {

C8097:             ENUM_SRJ_STATE prevS2 = g_state;

C8098:             g_confirmFromState = prevS2;

C8099:             g_state = ST_S5_GATE_CHECK;

C8100:             LogState(prevS2, g_state);

C8101:             if(InpDebugLog)

C8102:                PrintFormat("[SRJ-EA] CONFIRM_PREBIND_S2 bar=%s dir=%s poi=%s seedbar=%s",

C8103:                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),

C8104:                            DirName(g_dir), AnchorStr(),

C8105:                            TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES));

C8106:            }

C8107:          else

C8108:            { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }

C8109:         }

C8110:       ENUM_SRJ_STATE prev = g_state;

C8111:       if(g_state == ST_S2_LTF_ALIGN) { g_state = ST_S3_ZONE_WAIT; LogState(prev, g_state); }

C8112:      }

C5117:     int oWant = (g_dir == DIR_LONG) ? 1 : -1;

C5118:     double oH = 0.0, oM = 0.0, oL = 0.0;

C5119:     int oAntiNow = -1, oAntiPrev = -1;

C5120:     if(ReadFlow(FL_BUF_HTF_HIGH, oH, barShift) && ReadFlow(FL_BUF_HTF_MID, oM, barShift) && ReadFlow(FL_BUF_HTF_LOW, oL, barShift))

C5121:       {

C5122:        oAntiNow = 0;

C5123:        if((int)MathRound(oH) == -oWant) oAntiNow++;

C5124:        if((int)MathRound(oM) == -oWant) oAntiNow++;

C5125:        if((int)MathRound(oL) == -oWant) oAntiNow++;

C5126:       }

C5127:     double oH1 = 0.0, oM1 = 0.0, oL1 = 0.0;

C5128:     if(ReadFlow(FL_BUF_HTF_HIGH, oH1, barShift + 1) && ReadFlow(FL_BUF_HTF_MID, oM1, barShift + 1) && ReadFlow(FL_BUF_HTF_LOW, oL1, barShift + 1))

C5129:       {

C5130:        oAntiPrev = 0;

C5131:        if((int)MathRound(oH1) == -oWant) oAntiPrev++;

C5132:        if((int)MathRound(oM1) == -oWant) oAntiPrev++;

C5133:        if((int)MathRound(oL1) == -oWant) oAntiPrev++;

C5134:       }

C5135:     int oFlip = (oAntiNow >= 2 && oAntiPrev >= 0 && oAntiPrev < 2) ? 1 : 0;

C5136:     if(oFlip == 1 && outcome == "PASS") g_order_flipPassN++;

C5137:     //--- [P-SLDEF-5 E40] renames: flipNewThisBar (same newness predicate),

C5138:     //--- biasOpposedAtGate (state boolean beside the anti count; -1 unreadable

C5139:     //--- passes through). [P-SLDEF-5 E38] SEQ_UNSTAMPED naming: the bias site

C5140:     //--- did not run for this bar (S4→S5 cause); R1's 4 unstamped rows.

C5141:     int oOpp = (oAntiNow < 0) ? -1 : ((oAntiNow >= 2) ? 1 : 0);

C5142:     string oStamp = (oSeqB < 0) ? "SEQ_UNSTAMPED" : "STAMPED";

C5143:     string oCause = (oSeqB < 0) ? "S4S5_NOBIAS" : "-";

C5144:     string oLine = StringFormat("[SRJ-EA] ORDER fields=10 bar=%d barTime=%s seqBias=%d seqS5=%d biasAtGate=%d biasOpposedAtGate=%d flipNewThisBar=%d gateOutcome=%s seqStamp=%s seqCause=%s",

C5145:               barShift, TimeToString(obt, TIME_DATE|TIME_MINUTES),

C5146:               oSeqB, oSeqS5, oAntiNow, oOpp, oFlip, outcome, oStamp, oCause);

C7119:    if(g_state >= ST_S3_ZONE_WAIT && g_state <= ST_S5_GATE_CHECK)

C7120:      {

C7121:       //--- [P-SLDEF-4 E33] bias-site stamp: the pipeline's per-bar bias read

C7122:       //--- runs in this block (live LTF-align invariant). Print-only; every

C7123:       //--- branch below is untouched.

C7124:       g_order_seq++;

C7125:       g_order_seqBias = g_order_seq;

C7126:       g_order_biasBarT = iTime(_Symbol, PERIOD_CURRENT, barShift);

C7127:       bool t79_aligned = false;

C7128:       if(!CheckLtfAlign(barShift, g_dir, t79_aligned))

C7129:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }

C7130:       if(!t79_aligned)

C302: #define ABORT_FRESH_OB_DEAD    "FRESH_OB_DEAD"

C303: #define ABORT_FRESH_OPP_FVG    "FRESH_OPP_FVG"

C304: #define ABORT_FRESH_VETO       "FRESH_VETO"

C305: #define ABORT_TP_RR_FAIL       "TP_RR_FAIL"

C306: #define ABORT_NO_REGIME        "NO_REGIME"

C307: #define ABORT_LTF_MISALIGN     "LTF_MISALIGN"

C308: #define ABORT_UPSTREAM_UNREADY "UPSTREAM_UNREADY"

C309: #define ABORT_SESSION_LIMIT    "SESSION_LIMIT"

C310: #define ABORT_SESSION_CLOSED   "SESSION_CLOSED"

C311: #define ABORT_LOT_TOO_SMALL    "LOT_TOO_SMALL"

C312: #define ABORT_CONCURRENCY      "CONCURRENCY_LIMIT"

C313: //--- [S1-DEMO-GUARD-001] demo-guard abort reasons (Luna V128 clearance; run on token+word).

C314: #define ABORT_DEMO_GUARD       "DEMO_GUARD"

C315: #define ABORT_BELOW_STOPS      "BELOW_STOPS"

C316: //--- TASK 21 (EA-21): S5_NO_SL_REF and S5_NO_TP_TARGET previously aborted

C317: //--- with reason=TP_RR_FAIL, which misattributes the cause in the journal.

C318: //--- These two codes are diagnostic only Ã¢â‚¬â€ no gate reads a reason string.

C319: #define ABORT_NO_SL_REF        "NO_SL_REF"

C320: #define ABORT_NO_TP_TARGET     "NO_TP_TARGET"

C321: //--- [Task 78] Part A Step 8 / D-3 / G-2 replacement. Diagnostic string only;

C322: //--- no gate reads an abort reason.

C323: #define ABORT_POI_REPLACED     "POI_REPLACED"

C324: #define ABORT_DIV_FALLBACK     "DIV_FALLBACK"

C7099:    //--- Reuses ABORT_LTF_MISALIGN and adds no new reason code. Task 76 removed

C7100:    //--- the only other site that emitted it, so the string is now unambiguous:

C7101:    //--- every LTF_MISALIGN abort is a post-S2 invariant failure. It is NOT the

C7102:    //--- same population as the pre-Task-76 count and must not be compared to it.

C1728: void LogAbort(const string reason, ENUM_SRJ_STATE atState)

C1729:   {

C1730:    PrintFormat("[SRJ-EA] %s ABORT reason=%s state=%s poi=%s dir=%s",

C1731:                TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),

C1732:                reason, StateName(atState), AnchorStr(), DirName(g_dir));

C1733:   }



hits=1: PN	0	17:54:17.827	Core 04	2026.06.05 09:45:00   [SRJ-EA] ORDER fields=10 bar=1 barTime=2026.06.05 09:40 seqBias=-1 seqS5=86 biasAtGate=1 biasOpposedAtGate=0 flipNewThisBar=0 gateOutcome=PASS seqStamp=SEQ_UNSTAMPED seqCause=S4S5_NOBIAS

hits=1: HJ	0	17:50:31.999	Core 04	2026.06.04 16:20:00   [SRJ-EA] ORDER fields=10 bar=1 barTime=2026.06.04 16:15 seqBias=-1 seqS5=82 biasAtGate=2 biasOpposedAtGate=1 flipNewThisBar=1 gateOutcome=PASS seqStamp=SEQ_UNSTAMPED seqCause=S4S5_NOBIAS

hits=1: RE	0	17:58:40.280	Core 04	2026.06.08 09:35:01   [SRJ-EA] ORDER fields=10 bar=1 barTime=2026.06.08 09:30 seqBias=-1 seqS5=97 biasAtGate=3 biasOpposedAtGate=1 flipNewThisBar=1 gateOutcome=PASS seqStamp=SEQ_UNSTAMPED seqCause=S4S5_NOBIAS

hits=1: RF	0	17:44:37.998	Core 04	2026.06.03 09:10:00   [SRJ-EA] ORDER fields=10 bar=1 barTime=2026.06.03 09:05 seqBias=42 seqS5=43 biasAtGate=1 biasOpposedAtGate=0 flipNewThisBar=0 gateOutcome=PASS seqStamp=STAMPED seqCause=-

hits=1: CM	0	17:54:17.827	Core 04	2026.06.05 09:45:00   [SRJ-EA] CONFIRM_PREBIND_S2 bar=2026.06.05 09:40 dir=SHORT poi=Daily-POC seedbar=2026.06.05 09:35

hits=1: KS	0	17:54:17.827	Core 04	2026.06.05 09:45:00   [SRJ-EA] ALERT SRJ SIGNAL SHORT USDJPY M5 | Daily-POC | LONDON | R=2.04 SL 159.972 TP 159.899 spr=3

hits=1: HS	0	17:54:17.827	Core 04	2026.06.05 09:45:00   [SRJ-EA] EXECUTED fill=159.948 slPts=24 tpPts=49 R_executed=2.04 R_logged_at_signal=2.04 delta=0.00

hits=1: GJ	0	17:55:24.965	Core 04	2026.06.05 16:10:00   [SRJ-EA] CONFIRM_PREBIND_FAIL bar=2026.06.05 16:05 dir=LONG term=B_BODY

hits=1: GG	0	17:50:31.999	Core 04	2026.06.04 16:20:00   [SRJ-EA] CONFIRM_PREBIND_S2 bar=2026.06.04 16:15 dir=SHORT poi=Daily-POC seedbar=2026.06.04 16:00

hits=1: OD	0	17:55:24.965	Core 04	2026.06.05 16:10:00   [SRJ-EA] TPFALLBACK bar=2026.06.05 16:05 dir=LONG tp=160.028 distPts=20

hits=1: IS	0	17:55:37.173	Core 04	2026.06.05 16:55:00   [SRJ-EA] TP_RR_FAIL_LATCH bar=2026.06.05 16:50 dir=LONG entry=160.115 sl=159.726 tp=160.262 R=0.38

hits=1: MH	0	17:44:37.998	Core 04	2026.06.03 09:10:00   [SRJ-EA] EXECUTED fill=159.932 slPts=43 tpPts=51 R_executed=1.19 R_logged_at_signal=1.35 delta=-0.16

hits=1: KK	0	17:44:37.998	Core 04	2026.06.03 09:10:00   [SRJ-EA] ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-VWAP | LONDON | R=1.35 SL 159.889 TP 159.983 spr=3

hits=1: LO	0	17:54:17.827	Core 04	2026.06.05 09:45:00   [SRJ-EA] RETESTDIAG bar=2026.06.05 09:40 inside=- nearAbove=Daily-POC:4.0pts nearBelow=-:-pts

hits=1: FR	0	17:44:37.998	Core 04	2026.06.03 09:10:00   [SRJ-EA] RETESTDIAG bar=2026.06.03 09:05 inside=Daily-VWAP nearAbove=-:-pts nearBelow=Daily-POC:20.0pts

hits=1: EJ	0	17:58:40.280	Core 04	2026.06.08 09:35:01   [SRJ-EA] CONFIRM_PREBIND_S2 bar=2026.06.08 09:30 dir=SHORT poi=Weekly-POC seedbar=2026.06.08 09:25

hits=1: PS	0	17:58:40.280	Core 04	2026.06.08 09:35:01   [SRJ-EA] ALERT SRJ SIGNAL SHORT USDJPY M5 | Weekly-POC | LONDON | R=3.47 SL 160.353 TP 160.089 spr=4

hits=1: DN	0	18:12:42.561	Core 04	2026.06.11 15:20:00   [SRJ-EA] A2_WAIVED_POC bar=2026.06.11 15:15 dir=LONG

hits=1: QL	0	17:46:27.860	Core 04	2026.06.03 18:40:00   [SRJ-EA] A2_WAIVED_POC bar=2026.06.03 18:35 dir=LONG

hits=1: JO	0	17:54:17.827	Core 04	2026.06.05 09:40:00   [SRJ-EA] SIDE1T_SEEDBIAS bar=2026.06.05 09:35 dir=SHORT biasAligned=0 verdict=REJECT-BIAS-TIMING

hits=1: PM	0	17:50:25.895	Core 04	2026.06.04 16:05:01   [SRJ-EA] SIDE1T_SEEDBIAS bar=2026.06.04 16:00 dir=SHORT biasAligned=0 verdict=REJECT-BIAS-TIMING

hits=1: IR	0	17:58:40.280	Core 04	2026.06.08 09:30:00   [SRJ-EA] SIDE1T_SEEDBIAS bar=2026.06.08 09:25 dir=SHORT biasAligned=0 verdict=REJECT-BIAS-TIMING

hits=1: NH	0	17:44:37.998	Core 04	2026.06.03 09:05:05   [SRJ-EA] SIDE1T_SEEDBIAS bar=2026.06.03 09:00 dir=LONG biasAligned=1 verdict=CONSIDER

hits=1: GJ	0	17:46:27.860	Core 04	2026.06.03 18:40:00   [SRJ-EA] TP_RR_FAIL_LATCH bar=2026.06.03 18:35 dir=LONG entry=159.984 sl=159.945 tp=159.995 R=0.28
