# RELAY v284 — PACKET_P-USDJPY-2 v4 (amend-with-delta; tripwire fix, proof narrowed, SKIP print)

Project brief (standing - read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: packet P-USDJPY-2 v3 ruled NO-CLEAR by three seats (tripwire bug genuine; P031-105 refuted as stale cites; tallied, filed whole under V283 headers); this v4 folds every verdict below. Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

Change (one plain sentence per question): E6a proof narrowed to block/no-block truth value with raw -1 fields plus an HTF SKIP print. E6b tripwire bounds explicit with abort, evidence, and scope unchanged.

File / function / lines: Experts\SRJ_FlowNexus_EA.mq5, S2 block of EvaluateClosedBar, EA 8086-8112 (27 lines, v7-built E4b branch, the edit site). Function SrjOrderEmit flip predicate EA 5117-5146 (30 lines). LTF invariant range EA 7119-7130 (12 lines). Abort defines EA 302-324 (23 lines). Task-76 comment EA 7099-7102 (4 lines). LogAbort EA 1728-1733 (6 lines, abort rows print unconditionally).
Source digest: CD95241F / 637583 bytes / 11552 lines (built tree, no build since v7; STAGE-1 must re-hash or diagnose a successor).
Packet: 01_TASKS\PACKET_P-USDJPY-2v4.md F993D252 / 19188 bytes / 194 lines (E4b old 27 / new 86 / NET +59; defines old 2 / new 4 / +2; comment old 4 / new 5 / +1; total +62, post 11614; acceptance B1-B8 plus sentinel/dynamic/pairing clauses).
Segment: 06_HANDOFFS\RECON64-V7-USDJPY_JOURNAL.log C03D4774 / 3879744 bytes / 21450 lines (v7 run, DONE=PASSED).
Priors (labeled, never as anyone's words): relay v283 (06_HANDOFFS\BUILDER_RELAY_COUNCIL_v283-USDJPY-GUARDS3.md E6D42D34, tallied NO-CLEAR); packet v10 (01_TASKS\PACKET_P-USDJPY-2v3.md 25D60185); V283 grade (06_HANDOFFS\BUILDER_RESULT_V283-GRADE.md 5B9D05A2); his retest-invalidation ruling (06_HANDOFFS\BUILDER_FINDING_RETEST-INVALIDATION-V1.md 8EF27EF8).

Q1 (E6a amended): gate on standing opposition (antiNow>=2; flip print-only) with GoAbort(ABORT_LTF_MISALIGN); proof narrowed to identical block/no-block truth value on all inputs (readable: same decision; unreadable: both no-kill with -1 carried adjudicably in raw antiNow/antiPrev fields, never in the gate bool); HTF-unreadable prints E4B_GUARD_SKIP reason=HTF; opposition-kill wording with two emitters; shared-helper refactor stays DEFERRED (new function surface, needs scope word). Does the narrowed proof plus SKIP print satisfy Q1 without the shared helper? Cite lines.
Q2 (E6b amended): behind term deleted; plain dir-matched cross (open inclusive, close strict, stated); seed exact=true with anchor-bar-time>0; SEEDORDER tripwire with explicit both bounds (equal falls silent); breaking-bar + raw anti/seed/walked/skipped fields; guards inside confirm-true; abort with ABORT_S54_POIBREAK; E4b-only scope retained. Is the predicate plus tripwire plus raw fields plus abort code plus scope a correct S5.4 implementation for this round? Cite lines.

Answer form: plain yes / no / discrepancy, with line numbers, per question (a NO on one never sinks the other).
Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.
Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Reviewer demands from v283, quoted complete with rulings (nothing built on unruled demands):
- Luna-Q1 proof wording: "The reads, shifts, and count formula are indeed the same at P073-P090 and C5117-C5134, and the blocking truth value is therefore the same. But the outputs are not identical on all inputs, contrary to P013's claim." RULED - proof narrowed to truth value (readable same decision; unreadable both no-kill, -1 in raw fields).
- Luna-Q1 structural: "The numerical predicate is the same on readable data, but the implementation does not literally follow that adopted mechanism." RULED - extensional proof offered (identical reads/shifts/formula/convention); literal shared helper DEFERRED for scope; ruling asked as v284 Q1.
- Luna-Q2 tripwire: "After the first two branches, P119 is true for both: 0 <= e6b_seedShift < barShift — desired SEEDORDER case — and e6b_seedShift == barShift — the explicitly ruled silent case." RULED ADOPTED as explicit both-bounds branch (equal falls silent).
- Luna-A1 P031: "P031 says old 27 → new 105, NET +78" with "the packet header and S3 say old 27 → new 76, NET +49." RULED - refuted on disk (v10 line 31 says 83/+56; 105/+78 appears nowhere; all three carried stale numbers); corrected on record.
- Luna-A2 duplication: "leaves two independently maintained implementations of the same HTF count." RULED DEFERRED (recorded drift; no behavior delta).
- Luna-A3/A4 unreadable collapse: "opposed=0 can mean either 0/1 opposing legs or HTF evidence unreadable" and "If every intervening bar is unreadable/empty, the final row is indistinguishable from a genuinely clean walk." RULED ADOPTED as raw fields plus HTF SKIP print (-1s and counts adjudicable).
- Luna-A5 inverted order: "both seedShift == barShift and the temporally inverted seedShift < barShift fall through to promotion." RULED ADOPTED as explicit tripwire (equal silent by ruling).
- Luna-A6 anchor wording: "the implementation checks g_anchorBarTime > 0, not g_anchorLine > 0." RULED - prose fixed to anchor-bar-time (already exact in v10, carried).
- Luna-A7 grader discretion: "Genuine flip/break, unattributable kill, and no genuine cause are not operationally defined." RULED ADOPTED as positive field predicate (opposed=1 with anti>=2; pobreak=1 with bbar not epoch) plus mismatch rule.
- Luna-B shared/three-state/hardening: shared helper and three-state DEFERRED (new function surface); hardening ADOPTED as raw fields plus tripwire.
- Sonnet-Q1 wording: "the claim "same outputs on all inputs" is overstated" and "the proof text itself should say "identical on readable inputs; e6a_block intentionally discards the -1 state that oOpp preserves, mitigated by the raw antiNow/antiPrev print" rather than "same outputs on all inputs."" RULED - proof narrowed as quoted.
- Sonnet-Q2 tripwire: "Branch 3's condition is just >= 0" catching "every remaining case, i.e. 0 <= seedShift <= barShift — which includes seedShift == barShift." With fix: "else if(e6b_seedShift >= 0 && e6b_seedShift < barShift), leaving equal to fall through all three branches doing nothing (true silence)." RULED ADOPTED verbatim.
- Sonnet-A1 P031: same contradiction as Luna-A1. RULED - refuted on disk, corrected on record.
- Sonnet-A2/A3 fail-open: "an unreadable HTF read promotes exactly like a genuinely aligned one" and "a fully-unreadable walk is visibly distinct from a genuinely clean one" (requested counters/SKIP). RULED ADOPTED as raw fields + walked/skipped counters + HTF SKIP print.
- Sonnet-A4 ordering: same as Gap-1. RULED ADOPTED as tripwire.
- Sonnet-A5 attribution: "only ABORT_LTF_MISALIGN fires; the GUARD row carries both opposed=1 and pobreak=1." RULED - GUARD-row pairing documented as the grade procedure (abort rows never read alone); positive predicate added.
- Sonnet-A6 comment: same as naming. RULED renamed.
- Sonnet-B1 HTF SKIP: "Split E6a's -1 (unreadable) state out from the <2 (aligned) state explicitly, with its own E4B_GUARD_SKIP reason=HTF print." RULED ADOPTED.
- Sonnet-B2 counters: "Add a walked/skipped-bar counter to the E6b loop and print both." RULED ADOPTED (walked/skipped fields).
- Sonnet-B3 tripwire: "Extend the seed-anomaly branch to also fire on 0 <= e6b_seedShift < barShift." RULED ADOPTED (explicit both bounds).
- Sonnet-B4 P031: same contradiction. RULED - refuted, corrected.
- GLM-Q1 YES: no demand; baseline understanding carried.
- GLM-Q2 one-line fix: "P119 → else if(e6b_seedShift < barShift) (≥0 already guaranteed by the P100 branch)." RULED ADOPTED in the explicit both-bounds form (equivalent given P100; Sonnet's explicit form chosen for readability).
- GLM-A1 P031: same contradiction. RULED - refuted, corrected.
- GLM-A2 labels: "Label should read bias/opposed." RULED - v11 authority uses bias/opposed pairs with flip values stated.
- GLM-A3 wording: "Say opposition kill or E4b-guard kill (standing HTF opposition)" and "now has exactly two emitters." RULED - renamed as quoted.
- GLM-A4 tripwire: same as Sonnet Gap-1. RULED ADOPTED.
- GLM-A5 tokens: "P161 must state token boundaries." RULED - S1 states trailing-space boundaries with SKIP subtracted.
- GLM-A6 raw: "the −1 state is carried adjudicably in the raw anti fields." RULED ADOPTED (plus SKIP print).
- GLM-A7 mismatch: "Add one global Acceptance clause." RULED ADOPTED (halt with attribution).
- GLM-A8 symmetry: "state it." RULED - B2 notes E6a-primary with pobreak adjudicated.
- GLM-A9 durability: "note it as an assumption the grade tests." RULED - noted with B8 window.
- GLM-A10 sentinel: "Graders should treat the epoch string as the sentinel." RULED ADOPTED as epoch clause.
- GLM-A11 site: "One clause in P026 executes the ruling." RULED - scope names EA 7119-7130.
- GLM-A12/A13 rows: "Route through his carry-check." RULED - both pasted in v283 rows fence (MTEXIT 1x, WAIVED pair count 2).
- GLM-A14/A15/A16: noted/recorded/dynamic clause adopted.
- GLM-A19/B7: "Collapse to one rule: killed EU takes are adjudicated on row evidence." RULED ADOPTED as rewritten B7.
- GLM-B1 raw fields: "Add antiNow, antiPrev, seedShift, and walked-bar count." RULED ADOPTED (plus skipped + SKIP print).
- GLM-B2 tripwire: same fix as adopted. RULED ADOPTED.
- Blocking items from v283 (tripwire bug; proof overclaim; P012 garble): RULED - tripwire explicit, proof narrowed, P012 pairs corrected.

Verification split: rule on the page only - genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.

P001: # PACKET_P-USDJPY-2 v4 DRAFT - amend-with-delta on v283 verdicts (nothing builds/runs/commits on this file)
P002: 
P003: Status: v4 DRAFT (v3 25D60185/18010/191 SUPERSEDED untransported-folded - transported as v283 and ruled: Luna Q1-DISCREPANCY + Q2-NO; Sonnet Q1-DISCREPANCY + Q2-DISCREPANCY; GLM Q1-YES + Q2-DISCREPANCY-one-line; tallied NO-CLEAR - tripwire boundary bug blocks all three; code UNCHANGED - this fold amends tripwire + proof wording + SKIP print only). Assembly rule: enumerated literal edits below only (E4b branch interior + abort-define insert + Task-76 comment); old blocks machine-read from disk under UNIQUE headers; each edit-site header exactly once. Relay + battery owed before any transport.
P004: 
P005: Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E6a/E6b amended guards + one abort-define + one comment; S1 recount governs). No new indicator buffers. No new inputs. No counter touches. One abort-define carried (ABORT_S54_POIBREAK, GLM-ratified). Nothing under 02_TASK_CHECKPOINTS. Commits are builder-called (AGENTS 6.5); no council commit token exists or is asked.
P006: 
P007: ## Authority (his words + disk, no invention)
P008: 
P009: - His retest-invalidation ruling 2026-09-25 (finding RETEST-INVALIDATION-V1 8EF27EF8) + refinement-phase order + skill section 6 (settled rules ride every refinement; section srj-strategy-6).
P010: - v283 verdicts, all three filed whole (Luna DISCREPANCY/NO; Sonnet DISCREPANCY/DISCREPANCY; GLM YES/DISCREPANCY-one-line; tallied NO-CLEAR - tripwire equal-case bug blocks Q2 on all three; Luna-Q1 proof wording blocks Q1).
P011: - v283 agreements adopted as fold (all seats): tripwire explicit bound (Luna-A2/Sonnet-Q2/GLM-Q2 + GLM-B2 + Sonnet-B3 - Sonnet's explicit form adopted: else-if with both bounds, equal falls silent); proof narrowed to block/no-block truth value (Luna-Q1/A1/A15, Sonnet-Q1/A2, GLM-A1); HTF SKIP print (Sonnet-B1); P012 pairs corrected to bias/opposed 1/0, 2/1, 3/1, 1/0 with flip 0/1/1/0 stated (GLM-A2/A3); asymmetric strictness named (Sonnet-A3: open inclusive, close strict); abort-pairing procedure (Sonnet-A5/Luna-A13: abort rows never read alone, always paired with preceding GUARD row); SEEDORDER-in-GUARD note (Sonnet-A5 second half: GUARD prints on SKIP bars with seed<barShift visible, pobreak=0, walk skipped).
P012: - Row evidence carried forward (RECON64 C03D4774): ORDER bias/opposed pairs 1/0 (A1 09:40), 2/1 (6/04 16:15), 3/1 (6/08 09:30), 1/0 (A4 09:05) with flip values 0/1/1/0; seedBiasAl 0/0/0/1; WAIVED pair at 16:05 (count 2, paired evaluations same pass); PREBIND_S2 chains; TPFALLBACK 160.028/20; TP_RR_FAIL_LATCH R0.38/R0.28; MTEXIT entry 159.929 exit 159.983 (A4 second fill); EXECUTED fills.
P013: - Luna-Q1 structural demand (oOpp literal) answered: extensional proof narrowed as ruled - identical block/no-block truth value on all inputs (readable: same decision; unreadable: both no-kill, -1 carried by raw anti fields, never by the gate bool); shared-helper refactor stays DEFERRED (new function surface, needs scope word); v284 relay asks her ruling on the narrowed proof.
P014: 
P015: ## Rule (amended guards, E4b branch only; baseline S3/S4 paths untouched)
P016: 
P017: - E6a standing-opposition gate: HTF legs exactly as v3; BLOCK on opposed (antiNow>=2); flip print-only. Wording: HTF-opposition proxy, identical block/no-block truth value as oOpp on all inputs (readable: same decision; unreadable: both no-kill with -1 carried adjudicably in raw fields, never in the gate bool); 5m-mapping open to his word.
P018: - E6a disposition ABORT_LTF_MISALIGN (existing code; Task-76 comment: opposition kill, two emitters separable by ABORT-row state field). HTF-unreadable prints E4B_GUARD_SKIP reason=HTF (new, print-only).
P019: - E6b POI-break guard: walk confirm+1 through seedShift inclusive; plain dir-matched cross (open inclusive, close strict - stated); exact seed with anchor-bar-time>0; SEED anomaly (unresolvable) + SEEDORDER anomaly (0<=seed<confirm, explicit both bounds); equal shifts silent (confirm-on-seed, ruled); breaking-bar evidence out; walked/skipped counters out; raw HTF/seed fields out.
P020: - E4B_GUARD on every confirm-true with flip/opposed/pobreak/anti/seed/walked/skipped/bbar/bpx fields (clean prints zeros and epoch sentinel; unreadable prints -1s - adjudicable, never clean-looking).
P021: - ABORT_S54_POIBREAK on break-fire (new define, GLM-ratified name).
P022: - Untouched (fence): everything v7 built except the E4b branch interior; S3/S4 paths; ORDER/DIV gates; other abort codes; counters; buffers; inputs; R floor; exits; management.
P023: 
P024: ## Scope (refinement phase, his order)
P025: 
P026: - Narrow edits to the E4b branch interior + one define + one comment. No overall-logic revision. S3/S4-path extension still parked (needs his explicit scope word first, never council-first). Parked insertion site named: LTF invariant block EA 7119-7130 (no edit this round).
P027: - Windows: USDJPY 6/1-6/13 + EURUSD 8/26-9/10 (config-ini unix window per RUN-WINDOW GATE). InpDebugLog=true (grading precondition, stated), InpMode=1, M5 pinned.
P028: 
P029: ## Edit set (exact verbatim old/new; STAGE-1 exact-diff gated; old blocks disk-read same turn under UNIQUE headers; exactly one block per site)
P030: 
P031: - E6a+E6b (old EA 8086-8112 27 lines, new 86 lines, NET +59):
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
P060:   new (confirm-first reorder; standing-opp gate; POI walk without behind term; evidence print with raw fields; abort dispositions; explicit tripwire; HTF SKIP print):
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
P093: `            bool e6a_unread = (e6a_antiNow < 0 || e6a_antiPrev < 0);`
P094: `            if(e6a_unread && InpDebugLog)`
P095: `               PrintFormat("[SRJ-EA] E4B_GUARD_SKIP bar=%s dir=%s poi=%s reason=HTF", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());`
P096: `            //--- [P-USDJPY-2 E6b] spec S5.4: anchor POI body cross from seed bar (inclusive) through confirm bar (exclusive) kills the promotion. Walk shifts confirm+1..seed; EMPTY/unreadable skipped with walked/skipped counts; exact seed with anchor-bar-time>0; open inclusive, close strict; anchor value dynamic per-bar read.`
P097: `            bool e6b_broken = false;`
P098: `            datetime e6b_bt = 0; double e6b_bv = 0.0, e6b_bo = 0.0, e6b_bc = 0.0;`
P099: `            int e6b_walked = 0, e6b_skipped = 0;`
P100: `            int e6b_seedShift = -1;`
P101: `            if(g_anchorBarTime > 0)`
P102: `               e6b_seedShift = iBarShift(_Symbol, PERIOD_CURRENT, g_anchorBarTime, true);`
P103: `            if(e6b_seedShift < 0)`
P104: `              {`
P105: `               if(InpDebugLog)`
P106: `                  PrintFormat("[SRJ-EA] E4B_GUARD_SKIP bar=%s dir=%s poi=%s reason=SEED", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());`
P107: `              }`
P108: `            else if(e6b_seedShift > barShift)`
P109: `              {`
P110: `               for(int e6b_s = barShift + 1; e6b_s <= e6b_seedShift; e6b_s++)`
P111: `                 {`
P112: `                  e6b_walked++;`
P113: `                  double e6b_v = 0.0;`
P114: `                  if(!ReadBuf1(g_hPoi, g_anchorLine, e6b_v, e6b_s) || e6b_v == EMPTY_VALUE) { e6b_skipped++; continue; }`
P115: `                  double e6b_o = iOpen(_Symbol, PERIOD_CURRENT, e6b_s);`
P116: `                  double e6b_c = iClose(_Symbol, PERIOD_CURRENT, e6b_s);`
P117: `                  if(e6b_o == 0.0 || e6b_c == 0.0) { e6b_skipped++; continue; }`
P118: `                  bool e6b_hit = (g_dir == DIR_LONG) ? (e6b_o >= e6b_v && e6b_c < e6b_v) : (e6b_o <= e6b_v && e6b_c > e6b_v);`
P119: `                  if(e6b_hit) { e6b_broken = true; e6b_bt = iTime(_Symbol, PERIOD_CURRENT, e6b_s); e6b_bv = e6b_v; e6b_bo = e6b_o; e6b_bc = e6b_c; break; }`
P120: `                 }`
P121: `              }`
P122: `            else if(e6b_seedShift >= 0 && e6b_seedShift < barShift)`
P123: `              {`
P124: `               if(InpDebugLog)`
P125: `                  PrintFormat("[SRJ-EA] E4B_GUARD_SKIP bar=%s dir=%s poi=%s reason=SEEDORDER", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());`
P126: `              }`
P127: `            if(InpDebugLog)`
P128: `               PrintFormat("[SRJ-EA] E4B_GUARD bar=%s dir=%s poi=%s seedbar=%s flip=%d opposed=%d pobreak=%d anti=%d/%d seed=%d walked=%d skipped=%d bbar=%s bpx=%s/%s/%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES), (int)e6a_flip, (int)e6a_block, (int)e6b_broken, e6a_antiNow, e6a_antiPrev, e6b_seedShift, e6b_walked, e6b_skipped, TimeToString(e6b_bt, TIME_DATE|TIME_MINUTES), DoubleToString(e6b_bv, _Digits), DoubleToString(e6b_bo, _Digits), DoubleToString(e6b_bc, _Digits));`
P129: `            if(e6a_block) { GoAbort(ABORT_LTF_MISALIGN, g_state); return; }`
P130: `            if(e6b_broken) { GoAbort(ABORT_S54_POIBREAK, g_state); return; }`
P131: `            ENUM_SRJ_STATE prevS2 = g_state;`
P132: `            g_confirmFromState = prevS2;`
P133: `            g_state = ST_S5_GATE_CHECK;`
P134: `            LogState(prevS2, g_state);`
P135: `            if(InpDebugLog)`
P136: `               PrintFormat("[SRJ-EA] CONFIRM_PREBIND_S2 bar=%s dir=%s poi=%s seedbar=%s",`
P137: `                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),`
P138: `                           DirName(g_dir), AnchorStr(),`
P139: `                           TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES));`
P140: `           }`
P141: `         else`
P142: `           { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }`
P143: `        }`
P144: `      ENUM_SRJ_STATE prev = g_state;`
P145: `      if(g_state == ST_S2_LTF_ALIGN) { g_state = ST_S3_ZONE_WAIT; LogState(prev, g_state); }`
P146: `     }`
P147: - Abort-define insert (old EA 323-324 2 lines, new 4 lines, NET +2):
P148:   old:
P149: `#define ABORT_POI_REPLACED     "POI_REPLACED"`
P150: `#define ABORT_DIV_FALLBACK     "DIV_FALLBACK"`
P151:   new:
P152: `#define ABORT_POI_REPLACED     "POI_REPLACED"`
P153: `#define ABORT_DIV_FALLBACK     "DIV_FALLBACK"`
P154: `//--- [P-USDJPY-2 E6b] settled-rule kill reason (S5.4 POI-break; council-ruled name).`
P155: `#define ABORT_S54_POIBREAK     "S54_POIBREAK"`
P156: - Task-76 comment amendment (old EA 7099-7102 4 lines, new 5 lines, NET +1):
P157:   old:
P158: `   //--- Reuses ABORT_LTF_MISALIGN and adds no new reason code. Task 76 removed`
P159: `   //--- the only other site that emitted it, so the string is now unambiguous:`
P160: `   //--- every LTF_MISALIGN abort is a post-S2 invariant failure. It is NOT the`
P161: `   //--- same population as the pre-Task-76 count and must not be compared to it.`
P162:   new:
P163: `   //--- Reuses ABORT_LTF_MISALIGN and adds no new reason code. Task 76 removed`
P164: `   //--- the only other site that emitted it: every LTF_MISALIGN abort is a post-S2`
P165: `   //--- invariant failure or an E4b-guard opposition kill (standing HTF opposition).`
P166: `   //--- The string now has exactly two emitters, separable by the ABORT-row state`
P167: `   //--- field. It is NOT the pre-Task-76 population and must not be compared to it.`
P168: 
P169: ## Stages (T161N discipline; RECON64 precedent)
P170: 
P171: - S1 pre-hash gate: re-hash EA (must equal CD95241F/637583/11552 or DIAGNOSED successor, never assumed; DIAGNOSED means disk-diagnosed drift filed in ledger and disclosed in relay, never assumed) plus one hit per anchor (one code occurrence per anchor outside history comments: E4b block + abort-define pair + Task-76 comment; print census with token boundaries: E4B_GUARD matches trailing-space form only, E4B_GUARD_SKIP matched and subtracted, ABORT_S54_POIBREAK) plus buffers unchanged (no new indicator buffers) plus R-gate/latch untouched (no edit there) plus call-site census (ComputeNearestTpTarget( = 5: definition + 7307 + 8918 + 2 fallback calls; E6 reads: 6 HTF-leg + POI-walk + OHLC + iBarShift, no new walker callers) plus char-code assert every OLD anchor AND every insert byte plus HTF-buffer ids (HIGH/MID/LOW used at EA:5120) plus POI-handle read precedent (ReadBuf1 on the POI handle at the walker site) plus iBarShift precedent (14 hits) plus M5 PINNED plus InpDebugLog=true grading precondition (guard control flow unconditional; guard rows debug-gated; ABORT rows unconditional via LogAbort; SKIP rows debug-gated). Runs carry InpDebugLog=true.
P172: - S3 budget (mechanical from the pasted blocks, NET per site = new-site-total minus old-site-total; script-counted this block): E4b +59 (86-27); defines +2 (4-2); comment +1 (5-4); total +62; post 11552+62 = 11614 (S3 recount governs).
P173: 
P174: ## Acceptance (grade segment-vs-baselines; event tuples, never bare clock labels)
P175: 
P176: - B1 (6/04 16:15 pass, SHORT Daily-POC): NO SIGNAL at 16:20 with NO CONFIRM_PREBIND_S2 + NO SIGNAL on this anchor for the rest of its S2 retention (window clause); E4B_GUARD opposed=1 anti=2/1 with ABORT_LTF_MISALIGN row at the kill minute; pobreak=1 expected with breaking bar adjudicated from the print fields at grade.
P177: - B2 (6/08 09:30 pass, SHORT Weekly-POC): NO SIGNAL at 09:35 with window clause as B1; E4B_GUARD opposed=1 with ABORT_LTF_MISALIGN row; pobreak field adjudicated, not pre-declared (E6a-primary instance).
P178: - B3 (A1 09:40 pass, SHORT Daily-POC): SIGNAL 09:45 + EXECUTED 159.948 + TP_TOUCH 159.899 identical; E4B_GUARD opposed=0 pobreak=0 anti=1/1 walked>=1 skipped=0 row at the pass (coverage proof; epoch bbar sentinel read as no-break-recorded).
P179: - B4 (A4 6/03 09:05 pass, LONG Daily-VWAP): SIGNAL + fills 159.932/159.929/159.983 identical (S4 path untouched - parity check, not cleanliness evidence).
P180: - B5 (A2 16:50 refuse, LONG Daily-POC): TP_RR_FAIL_LATCH R0.38 ABORT identical (S3 path untouched - parity check).
P181: - B6 (6/03 18:35 refuse, LONG Daily-POC): TP_RR_FAIL_LATCH R0.28 ABORT identical.
P182: - B7 (EURUSD 8/26-9/10 join): killed takes adjudicated on row evidence against S3.3/S5.4 (guard-kill on a take carrying genuine opposition-kill (opposed=1 with anti>=2) or genuine break-kill (pobreak=1 with bbar not epoch and bpx populated) = guard working, even on his rows - consistent with his declines; abort rows never read alone, always paired with the preceding GUARD row); HALT only on an unattributable kill or a kill with no genuine cause on the rows. Baseline takes otherwise bit-identical on bar/entry/exit; rejects diagnostic. Global mismatch rule: any evidence-field expectation mismatch = halt with attribution, never silent pass.
P183: - B8 (post-kill silence): NO CONFIRM_PREBIND_S2 and NO SIGNAL on the ruled anchors (6/04 SHORT Daily-POC; 6/08 SHORT Weekly-POC) after the kill minutes through window end.
P184: - Dynamic anchor clause: anchor value is the per-bar POI buffer read (dynamic), not locked to the arm-time level.
P185: - Epoch sentinel clause: bbar 1970.01.01 00:00 reads as no-break-recorded; anti/seed -1 reads as unreadable, never clean.
P186: - L-final: B1-B8 above plus the two clauses.
P187: 
P188: ## Run cost and novel evidence
P189: 
P190: - One build (STAGE-1 gated) plus two tester runs, ceiling 90 each: USDJPY June 1-13 (~45 min) + EURUSD full 8/26-9/10 (~50 min). Same cost as v10 (v10 unbuilt; cost carried).
P191: - E6 guards terminate (abort) with raw-field evidence; behind term deleted; seed exact; explicit tripwire; HTF SKIP print.
P192: - Novel evidence vs RECON64/65: (a) ABORT rows on his two ruled instances with raw fields and no takes and no post-kill revival; (b) A1/A4 intact re-proof with coverage rows; (c) EU join with guard attribution on every killed take.
P193: 
P194: (End of file)

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
hits=1: GM	0	17:44:50.204	Core 04	2026.06.03 10:00:00   [SRJ-EA] MTEXIT bar=2026.06.03 09:55 reason=TP_TOUCH line=- lineVal=- entry=159.929 exit=159.983
hits=1: HF	0	17:50:31.999	Core 04	2026.06.04 16:20:00   [SRJ-EA] A2_WAIVED_POC bar=2026.06.04 16:15 dir=SHORT
hits=2 pair: EQ	0	17:55:24.965	Core 04	2026.06.05 16:05:00   [SRJ-EA] A2_WAIVED_POC bar=2026.06.05 16:00 dir=SHORT
hits=2 pair: GK	0	17:55:24.965	Core 04	2026.06.05 16:05:00   [SRJ-EA] A2_WAIVED_POC bar=2026.06.05 16:00 dir=SHORT
