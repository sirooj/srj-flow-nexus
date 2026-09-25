# BUILDER RELAY COUNCIL v285-USDJPY-GUARDS5 - packet v5 prose-fold (code UNCHANGED, acceptance + ledger only)

## 0. What this round is (read first)
- Packet v5 (01_TASKS\PACKET_P-USDJPY-2v5.md 72236198/25207/194) folds the V284 verdicts with PROSE ONLY. The three EA edit blocks (P030-P167) are byte-identical to packet v11, script-verified 0 mismatches this block. No STAGE-1 code diff, no new behavior, no new review surface on code: all five V284 seats agree the code behavior (tripwire, narrowed proof, raw fields, abort wiring, scope, counts) is correct.
- EA built tree still CD95241FA9391D7AE46B694A03DA3679F5A89EBE6D2E809EF884F8363BEF6106 / 637583 B / 11552 lines (re-hashed this block, no build ran). Segment RECON64-V7-USDJPY_JOURNAL.log C03D4774/3879744/21450 (re-verified this block).
- V284 tally was NO-CLEAR on three prose/ledger items only: (a) Astra-Q1: P013/P017 "unreadable: both no-kill" overbroad vs the P093 either-leg trigger (disk-confirmed); (b) Opus-A1-A5: acceptance-battery prose gaps (disk-confirmed); (c) Opus-A6: demands-ledger mispairing in this relay's predecessor (disk-confirmed R586-R656). Triage closed both row questions on disk (CL exit row exists; single 159.932 fill, no second fill).
- This relay asks TWO questions (Q1 wording-fix verification, Q2 acceptance-battery verification). Same text to every seat. Nothing builds, runs, spends, or clears live activation here.

## Priors (labeled, never as anyone's words)
- Relay v284 (06_HANDOFFS\BUILDER_RELAY_COUNCIL_v284-USDJPY-GUARDS4.md F43073BD/72776/1303LF, battery-green, transported; V284 verdicts 4xYES/YES + 1xDISCREPANCY/YES tallied NO-CLEAR).
- Packet v11 (01_TASKS\PACKET_P-USDJPY-2v4.md F993D252/19188/194; code blocks carried byte-identical into v5).
- V284 grade (06_HANDOFFS\BUILDER_RESULT_V284-GRADE.md A999C6B3/6557/45: 5 verdicts filed whole 1x/1x, every checkable dissent claim disk-verified held, triage joins, fold v5).
- His retest-invalidation ruling (06_HANDOFFS\BUILDER_FINDING_RETEST-INVALIDATION-V1.md 8EF27EF8) + refinement-phase order.
- Label map (closes the dual-label scramble): FILE PACKET_P-USDJPY-2v5.md == "v5"; FILE PACKET_P-USDJPY-2v4.md (F993D252) == the old "v11"/"v4" labels, same bytes; FILE PACKET_P-USDJPY-2v3.md (25D60185) == the old "v10"/"v3" labels, same bytes. New prose uses FILE names.

## Twin (packet v5, 194 lines - mechanical splice, battery-verified 194/194 diff 0)
P001: # PACKET_P-USDJPY-2 v5 DRAFT - amend-with-delta on V284 verdicts (nothing builds/runs/commits on this file; code blocks byte-identical to v11, prose + acceptance + ledger only)
P002: 
P003: Status: v5 DRAFT (v11 file 01_TASKS\PACKET_P-USDJPY-2v4.md F993D252/19188/194 SUPERSEDED untransported-folded - transported as v284 and ruled: Luna YES/YES + Astra DISCREPANCY(Q1-wording)/YES + Sonnet YES/YES + Opus YES/YES + GLM YES/YES-amend-with-delta; tallied NO-CLEAR - Q1 unreadability sentence overbroad (Astra-Q1, disk-confirmed P093 either-leg vs P092 antiNow-only) + acceptance-battery prose gaps (Opus-A1-A5, disk-confirmed) + demands-ledger mispairing (Opus-A6, disk-confirmed R586-R656); code behavior unanimous (tripwire + narrowed proof + raw fields + abort + scope + counts all check on all five seats) - this fold amends prose + acceptance + ledger only, code UNCHANGED). Assembly rule: enumerated literal edits below only (E4b branch interior + abort-define insert + Task-76 comment, all three carried byte-identical from v11); old blocks machine-read from disk under UNIQUE headers; each edit-site header exactly once. Relay + battery owed before any transport. Label map (one line, closes Opus-A8/GLM-A9): FILE PACKET_P-USDJPY-2v5.md == "v5" this round; FILE PACKET_P-USDJPY-2v4.md (F993D252) == the "v11"/"v4" prior labels, same bytes; FILE PACKET_P-USDJPY-2v3.md (25D60185) == the "v10"/"v3" prior labels, same bytes. New prose uses FILE names; bare v-numbers appear only inside labeled priors quotes.
P004: 
P005: Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E6a/E6b amended guards + one abort-define + one comment, all carried byte-identical from v11; S1 recount governs). No new indicator buffers. No new inputs. No existing/global strategy counters touched; the guard introduces local evidence variables only (e6a_unread, e6b_walked, e6b_skipped - nothing reads them for control flow). One abort-define carried (ABORT_S54_POIBREAK, GLM-ratified). Nothing under 02_TASK_CHECKPOINTS. Commits are builder-called (AGENTS 6.5); no council commit token exists or is asked.
P006: 
P007: ## Authority (his words + disk, no invention)
P008: 
P009: - His retest-invalidation ruling 2026-09-25 (finding RETEST-INVALIDATION-V1 8EF27EF8) + refinement-phase order + skill section 6 (settled rules ride every refinement; section srj-strategy-6).
P010: - V284 verdicts, all five filed whole (Luna YES/YES; Astra DISCREPANCY(Q1-wording)/YES; Sonnet YES/YES; Opus YES/YES; GLM YES/YES-amend-with-delta; tallied NO-CLEAR - Q1 unreadability sentence overbroad + acceptance-battery prose gaps + demands-ledger mispairing; code behavior unanimous, no code defect found by any seat).
P011: - V284 agreements adopted as fold (all seats, behavior unanimous; prose-only fold, code UNCHANGED): unreadability narrowed to current-bundle with exact predicate (Astra-Q1 wording adopted: e6a_block == (oOpp == 1); no helper); HTF SKIP either-leg predicate documented (Astra-Q1/Sonnet-A1/Opus-A11/Luna-A5/GLM-A6: P093 fires on antiNow<0 OR antiPrev<0, gate reads antiNow only, SKIP bars may still abort); walked/read semantics pinned (Luna-A1/Opus-A12/Astra-A5/GLM-carried: walked = attempted, readable = walked-skipped, B3 conjoins skipped=0); breaking-bar selection pinned (Opus-A16/Astra-A6/GLM-A7: first hit walking confirm-to-seed, newest-to-oldest); B1/B2 pobreak posture aligned to adjudicated (Sonnet-A3/Opus-A2); B1/B3 anti prev-digits adjudicated (Opus-A1: 2/{0,1} and 1/*); kill-minute ORDER-row absence expected (Opus-A3) with same-bar diagnostic fate declared (GLM-A5); B4 field-named with sourced-differently gap (Opus-A4/Astra-A17: single deal #2 at 159.932 in both runs, no second fill on disk, MTEXIT entry sourced differently, "(second fill)" WITHDRAWN); A1 exit row pasted (Opus-A5/GLM-A4: CL bar 12:15 entry=159.948 exit=159.899, segment-spliced 1x this block); S1 census pinned with counts (Opus-A13/GLM-A3/Astra-A14); abort-pairing key + E6a precedence stated (Astra-A9/A11, Opus-A20: key = GUARD bar time + ABORT state field); B8 seed-instance identity (Astra-A13); epoch clause extended to seedbar (Opus-A17/GLM-A11); WAIVED emission-time qualifier (Astra-A16/GLM-A12); B7 POI-break label (GLM-A10); demands-ledger re-paired content-keyed (Opus-A6/A9/A10, Astra-A15, GLM-A8: Sonnet-B1/B3 tags WITHDRAWN as unattested, SKIP print recorded builder-originated with v282 trace; GLM ruling column re-paired, code/packet unaffected); GJ collision noted (Sonnet-A4/Opus-A7/GLM-A2: cite by timestamp+token, never ID alone); float idioms + span-bound + cause-less aborts recorded as bounded (Opus-A18/A19/A20); C318 mojibake carried as pre-existing outside anchors (Opus-A22).
P012: - Row evidence carried forward (RECON64 C03D4774): ORDER bias/opposed pairs 1/0 (PN: A1 09:40), 2/1 (HJ: 6/04 16:15), 3/1 (RE: 6/08 09:30), 1/0 (RF: A4 09:05) with flip values 0/1/1/0 (row tokens cited, closes Opus-A10); seedBiasAl 0/0/0/1; WAIVED pair emitted 16:05 log minute for bar 16:00 (EQ/GK hits=2 pair); PREBIND_S2 chains (CM/GG/EJ); TPFALLBACK 160.028/20; TP_RR_FAIL_LATCH R0.38/R0.28; MTEXIT GM entry=159.929 exit=159.983 field-named (A4; single deal #2 at 159.932 in both runs - no second fill on disk); A1 exit MTEXIT CL bar=2026.06.05 12:15 entry=159.948 exit=159.899 (pasted v5 fence, segment-spliced 1x this block, timestamp unique); EXECUTED fills (MH 159.932, HS 159.948).
P013: - Luna-Q1 predicate form adopted: e6a_block == (oOpp == 1) stated exactly (Luna wording nit; oOpp int with -1 sentinel per C5141, never raw truthiness); shared-helper refactor stays DEFERRED (new function surface, needs scope word); code hardenings DEFERRED with reasons (behavior-neutral log hardenings, unanimous behavior agreement needs no code this round: HTF/HTF_PREV split + gate-on-antiNow per Sonnet-B1/Opus-B2; seed/cbar SKIP fields per Opus-B4; read counter per Opus-B3); shared helper + three-state break result + latched side + retain-print helper + S3/S4 extension stay parked (needs his explicit scope word first, never council-first).
P014: 
P015: ## Rule (amended guards, E4b branch only; baseline S3/S4 paths untouched)
P016: 
P017: - E6a standing-opposition gate: HTF legs exactly as v3; BLOCK on opposed (antiNow>=2); flip print-only. Exact relation: e6a_block == (oOpp == 1) on identical inputs (readable: same decision; current-bundle unreadable (antiNow=-1): no opposition kill on both, -1 carried adjudicably in raw fields, never in the gate bool; previous-bundle unreadability (antiPrev=-1) affects flip observability only and does not suppress a readable current opposition kill); 5m-mapping open to his word.
P018: - E6a disposition ABORT_LTF_MISALIGN (existing code; Task-76 comment: opposition kill, two emitters separable by ABORT-row state field). HTF-unreadable prints E4B_GUARD_SKIP reason=HTF (new, print-only, debug-gated; fires on either leg unreadable per P093 while the gate reads antiNow only, so a SKIP bar may still abort via E6a on readable current opposition or via E6b on break evidence - raw anti fields adjudicate).
P019: - E6b POI-break guard: walk confirm+1 through seedShift inclusive; plain dir-matched cross (open inclusive, close strict - stated); exact seed with anchor-bar-time>0; SEED anomaly (unset or unresolvable seed) + SEEDORDER anomaly (0<=seed<confirm, explicit both bounds); equal shifts silent (confirm-on-seed, ruled - scoped to the SEEDORDER SKIP: the GUARD row still prints, an HTF SKIP may print, E6a may abort); breaking-bar evidence out (recorded bar = first hit walking confirm-to-seed, newest-to-oldest); walked/skipped counters out (walked = bars attempted, readable = walked-skipped); raw HTF/seed fields out. SEED/SEEDORDER anomalies fail open (no break-kill possible that bar, same as a clean pass).
P020: - E4B_GUARD on every confirm-true with flip/opposed/pobreak/anti/seed/walked/skipped/bbar/bpx fields (clean rows carry positive readable anti/seed/walked values; zeros and epoch sentinel appear only on break fields (pobreak, bbar, bpx); unreadable prints -1s with skipped counts - adjudicable, never clean-looking).
P021: - ABORT_S54_POIBREAK on break-fire when E6a has not already aborted (E6a precedence P129-then-P130; the GUARD row carries both flags; new define, GLM-ratified name).
P022: - Untouched (fence): everything v7 built except the E4b branch interior; S3/S4 paths; ORDER/DIV gates; other abort codes; counters; buffers; inputs; R floor; exits; management.
P023: 
P024: ## Scope (refinement phase, his order)
P025: 
P026: - Narrow edits to the E4b branch interior + one define + one comment (all three carried byte-identical from v11 this round - prose-only fold, no STAGE-1 code diff). No overall-logic revision. S3/S4-path extension still parked (needs his explicit scope word first, never council-first). Parked insertion site named: LTF invariant block EA 7119-7130 (no edit this round).
P027: - Windows: USDJPY 6/1-6/13 + EURUSD 8/26-9/10 (config-ini unix window per RUN-WINDOW GATE). InpDebugLog=true (grading precondition, stated), InpMode=1, M5 pinned.
P028: 
P029: ## Edit set (exact verbatim old/new; STAGE-1 exact-diff gated; old blocks disk-read same turn under UNIQUE headers; exactly one block per site; all three blocks byte-identical to v11 - verified 0-diff this block)
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
P171: - S1 pre-hash gate: re-hash EA (must equal CD95241F/637583/11552 or DIAGNOSED successor, never assumed; DIAGNOSED means disk-diagnosed drift filed in ledger and disclosed in relay, never assumed) plus one hit per anchor (one code occurrence per anchor outside history comments: E4b block + abort-define pair + Task-76 comment; print census with token boundaries and pinned counts: E4B_GUARD print sites = 1 (P128); E4B_GUARD_SKIP print sites = 3 (P095 reason=HTF, P106 reason=SEED, P125 reason=SEEDORDER); ABORT_S54_POIBREAK occurrences = 2 post-build / 0 pre (P155 define + P130 call); GoAbort(ABORT_LTF_MISALIGN) call sites = 2 post-edit (P129 + the invariant site) backing the Task-76 two-emitter claim (P166); census rule: exact trailing-space "E4B_GUARD " form OR broad-prefix count minus SKIP matches, never both mixed; P/C source-line refs below are v11-packet-file refs, and EA line numbers shift by the insertion delta post-build) plus buffers unchanged (no new indicator buffers) plus R-gate/latch untouched (no edit there) plus call-site census (ComputeNearestTpTarget( = 5: definition + 7307 + 8918 + 2 fallback calls; E6 reads: 6 HTF-leg + POI-walk + OHLC + iBarShift, no new walker callers) plus char-code assert every OLD anchor AND every insert byte plus HTF-buffer ids (HIGH/MID/LOW used at EA:5120) plus POI-handle read precedent (ReadBuf1 on the POI handle at the walker site) plus iBarShift precedent (14 hits) plus M5 PINNED plus InpDebugLog=true grading precondition (guard control flow unconditional; guard rows debug-gated; ABORT rows unconditional via LogAbort; SKIP rows debug-gated). Runs carry InpDebugLog=true.
P172: - S3 budget (mechanical from the pasted blocks, NET per site = new-site-total minus old-site-total; script-counted this block; v5: all three code blocks byte-identical to v11, re-verified 0-diff this block): E4b +59 (86-27); defines +2 (4-2); comment +1 (5-4); total +62; post 11552+62 = 11614 (S3 recount governs).
P173: 
P174: ## Acceptance (grade segment-vs-baselines; event tuples, never bare clock labels)
P175: 
P176: - B1 (6/04 16:15 pass, SHORT Daily-POC): NO SIGNAL at 16:20 with NO CONFIRM_PREBIND_S2 + NO SIGNAL on this anchor for the rest of its S2 retention (window clause); E4B_GUARD opposed=1 anti=2/{0,1} (prev digit adjudicated at grade: flip=1 constrains prev to {0,1} per C5135, row HJ carries flip=1) with ABORT_LTF_MISALIGN row at the kill minute; pobreak field adjudicated from the print fields at grade (E6a-primary instance, mirror of B2); ORDER-row absence at the kill minute expected (guard returns before the ORDER site); same-bar HF diagnostic absence attributable to the kill return, presence not a mismatch.
P177: - B2 (6/08 09:30 pass, SHORT Weekly-POC): NO SIGNAL at 09:35 with window clause as B1; E4B_GUARD opposed=1 with ABORT_LTF_MISALIGN row; pobreak field adjudicated, not pre-declared (E6a-primary instance); ORDER-row absence at the kill minute expected.
P178: - B3 (A1 09:40 pass, SHORT Daily-POC): SIGNAL 09:45 + EXECUTED 159.948 + TP_TOUCH 159.899 via CL exit row (bar 2026.06.05 12:15, entry=159.948, segment-spliced 1x this block, timestamp unique) identical; E4B_GUARD opposed=0 pobreak=0 anti=1/* (prev digit wholly unconstrained at antiNow=1 since flip=0 for every prev, adjudicated) walked>=1 skipped=0 row at the pass (readable-bar coverage proof: readable = walked-skipped >= 1; epoch bbar sentinel read as no-break-recorded).
P179: - B4 (A4 6/03 09:05 pass, LONG Daily-VWAP): field-named parity - EXECUTED fill=159.932 (MH) + ALERT SL 159.889 TP 159.983 (KK) + MTEXIT entry=159.929 exit=159.983 reason=TP_TOUCH (GM); 0.3-pip entry gap (159.932 vs 159.929) recorded as sourced-differently (single deal #2 at 159.932 in both the 09:49 run and RECON64; no second fill on disk); parity = booked SL/TP levels + TP_TOUCH exit, not three-value fill equality (S4 path untouched - parity check, not cleanliness evidence).
P180: - B5 (A2 16:50 refuse, LONG Daily-POC): TP_RR_FAIL_LATCH R0.38 ABORT identical (S3 path untouched - parity check).
P181: - B6 (6/03 18:35 refuse, LONG Daily-POC): TP_RR_FAIL_LATCH R0.28 ABORT identical.
P182: - B7 (EURUSD 8/26-9/10 join): killed takes adjudicated on row evidence against S3.3/S5.4 (guard-kill on a take carrying genuine opposition-kill (opposed=1 with anti>=2) or genuine POI-break kill (pobreak=1 with bbar not epoch and bpx populated) = guard working, even on his rows - consistent with his declines; abort rows never read alone, always paired (pairing key = GUARD bar time + ABORT state field; E6a precedence on dual-cause bars); HALT only on an unattributable kill or a kill with no genuine cause on the rows. Baseline takes otherwise bit-identical on bar/entry/exit; rejects diagnostic. Global mismatch rule: any evidence-field expectation mismatch = halt with attribution, never silent pass.
P183: - B8 (post-kill silence): NO CONFIRM_PREBIND_S2 and NO SIGNAL on the ruled anchors (6/04 SHORT Daily-POC; 6/08 SHORT Weekly-POC) after the kill minutes through window end; silence binds the killed seed instance (bar + seedbar identity); later re-seeded candidates sharing POI label and direction are out of scope.
P184: - Dynamic anchor clause: anchor value is the per-bar POI buffer read (dynamic), not locked to the arm-time level.
P185: - Epoch sentinel clause: bbar 1970.01.01 00:00 reads as no-break-recorded; anti/seed -1 reads as unreadable, never clean; seedbar 1970.01.01 00:00 reads as anchor-time-unset (pairs with seed=-1); walked = bars attempted, readable bars = walked-skipped.
P186: - L-final: B1-B8 above plus the two clauses.
P187: 
P188: ## Run cost and novel evidence
P189: 
P190: - One build (STAGE-1 gated; code blocks byte-identical to v11 so the code diff is a re-proof, not a re-review) plus two tester runs, ceiling 90 each: USDJPY June 1-13 (~45 min) + EURUSD full 8/26-9/10 (~50 min). Same cost as v10/v11 (both unbuilt; cost carried).
P191: - E6 guards terminate (abort) with raw-field evidence; behind term deleted; seed exact; explicit tripwire; HTF SKIP print; unreadability rule narrowed to current-bundle.
P192: - Novel evidence vs RECON64/65: (a) ABORT rows on his two ruled instances with raw fields and no takes and no post-kill revival; (b) A1/A4 intact re-proof with coverage rows (A1 exit now row-proved via CL); (c) EU join with guard attribution on every killed take; (d) B4 field-named parity with the sourced-differently entry gap on record.
P193: 
P194: (End of file)

## Code companion (EA disk pulls, byte-verified 0-diff - code UNCHANGED, behavior already ruled 5-0 in V284)
- C5117-C5146: ORDER HTF read/count/flip/print block (the computation the Q1 proof mirrors; oOpp int with -1 sentinel at C5141; oOpp/oFlip print-only into the ORDER row at C5144-C5146; HJ row shows biasOpposedAtGate=1 with gateOutcome=PASS).
- C1728-C1733: LogAbort (reason + state + poi + dir; TimeCurrent-stamped; no cause fields - pairing procedure P182 stands).
- C7119-C7130: invariant state guard (ST_S3_ZONE_WAIT..ST_S5_GATE_CHECK range gate; abort call itself off-page past C7130 - two-emitter census stays STAGE-1 disk work).
- C302-C324: abort-define block (insert anchors C323-C324 clean; C318 mojibake pre-existing outside all anchors, carry-check note only).
- C8086-C8112 + C7099-C7102: old E4b block + Task-76 comment (STAGE-1 anchors).
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

## Rows fence (segment-spliced, each pattern 1x except the WAIVED pair 2x; CL is new this round)
- CL (new, closes the A1-exit page gap): MTEXIT bar 12:15 entry=159.948 exit=159.899, timestamp unique 1x in the segment, 144 chars ASCII-clean, byte-compared against the journal duplicate.
- B4 field rows (re-carried, unchanged record): MH (EXECUTED fill=159.932), KK (ALERT SL 159.889 TP 159.983), GM (MTEXIT entry=159.929 exit=159.983).
- Fill corroboration (segment pull): deal #2 buy 3.71 USDJPY at 159.932 hits exactly 1x in the segment (single fill; no second fill on disk anywhere in the run).
- B3 signal/fill rows (re-carried): KS (ALERT TP 159.899), HS (EXECUTED 159.948).
- Opposition pairs (re-carried): PN/HJ/RE/RF with flip values; PREBIND chains CM/GG/EJ; EQ/GK WAIVED pair (bar 16:00, logged 16:05, hits=2 pair); GG+HF same-bar pair (kill-bar diagnostic fate declared in P176).
- GJ collision noted (re-carried): GJ labels two rows (CONFIRM_PREBIND_FAIL 6/05 16:10 + TP_RR_FAIL_LATCH 6/03 18:40) - cite by timestamp+token, never ID alone.
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
hits=1: CL	0	17:54:42.241	Core 04	2026.06.05 12:20:00   [SRJ-EA] MTEXIT bar=2026.06.05 12:15 reason=TP_TOUCH line=- lineVal=- entry=159.948 exit=159.899
hits=2 pair: EQ	0	17:55:24.965	Core 04	2026.06.05 16:05:00   [SRJ-EA] A2_WAIVED_POC bar=2026.06.05 16:00 dir=SHORT
hits=2 pair: GK	0	17:55:24.965	Core 04	2026.06.05 16:05:00   [SRJ-EA] A2_WAIVED_POC bar=2026.06.05 16:00 dir=SHORT

## Demands ledger (content-keyed; every quote substring-verified against its filed source this block)
- Astra-Q1 (filed V284 ASTRA verdict): "produces `e6a_unread=true`" + "prints `reason=HTF` at P095" + "and **kills** at P129" - behavior agreed correct; the sentence repaired is P013/P017 "unreadable: both no-kill". Adopted narrow (v5 P013/P017): "current-bundle unreadable (`antiNow=-1`): no opposition kill; previous-bundle unreadability does not suppress a readable current opposition kill." Exact predicate adopted (v5 P013/P017): e6a_block == (oOpp == 1). Disposition: ADOPTED as prose (no helper, no code).
- Luna-Q1-nit (filed V284 LUNA verdict): "should ideally mean `e6a_block == (oOpp==1)`" - adopted exactly in v5 P013/P017 (oOpp int with -1 sentinel per C5141, never raw truthiness). Disposition: ADOPTED as prose.
- Sonnet-A1 (filed V284 SONNET verdict): "still prints `E4B_GUARD_SKIP reason=HTF`" and separately "with a determinate decision" (either-leg trigger vs antiNow-only gate, no return after P095) - documented in v5 P018 (SKIP bars may still abort; raw anti fields adjudicate). Disposition: ADOPTED as prose (HTF/HTF_PREV split deferred with reason: behavior-neutral log hardening, unanimous behavior agreement).
- Sonnet-A3 (filed V284 SONNET verdict, B1-vs-B2 pobreak posture): v5 P176 mirrors P177 ("pobreak field adjudicated from the print fields at grade"). Disposition: ADOPTED as prose.
- Opus-A1 (filed V284 OPUS verdict): "Fix: write `anti=2/{0,1}` and `anti=1/*`, or move the prev digit to adjudicated." - adopted exactly in v5 P176/P178 (flip=1 constrains prev to {0,1} per C5135; prev wholly unconstrained at antiNow=1). Disposition: ADOPTED as prose.
- Opus-A2/A3 (filed V284 OPUS verdict, B1 pobreak evidence + ORDER-row absence): v5 P176 adjudicates pobreak + expects ORDER-row absence at kill minutes (+P177 same clause); same-bar HF fate declared. Disposition: ADOPTED as prose.
- Opus-A4 (filed V284 OPUS verdict): "contradicts the EXECUTED fill for the same trade by 0.3 pip, and 159.983 is an exit, not a fill" - v5 P179 field-named (fill vs SL/TP vs MTEXIT entry/exit); "(second fill)" WITHDRAWN (single deal #2 at 159.932 in-segment). Disposition: ADOPTED as prose.
- Opus-A5 (filed V284 OPUS verdict, B3 exit row): CL row pasted in v5 fence (segment-spliced 1x, byte-compared). Disposition: ADOPTED as evidence.
- Opus-A6 LEDGER REPAIR (v284 relay demands block, filed record - demand lines and ruling lines quoted separately, each verified this block): "GLM-A2 (filed V283 GLM verdict):" demands "P119 equal-case defect" but is ruled "RULED - pairs corrected to bias/opposed with flip stated." (that ruling answers the pairs demand, not the tripwire demand); "GLM-A3 (filed V283 GLM verdict):" demands "P012 garbled sequence" but is ruled "RULED - renamed opposition kill with two emitters." (that ruling answers the opposition-kill demand); "GLM-A4 (filed V283 GLM verdict):" demands "SKIP prints carry no numbers" but is ruled "RULED ADOPTED as explicit tripwire." (that ruling answers the equal-case demand); "GLM-A5 (filed V283 GLM verdict):" demands the "open==POI-level equality choice" clause but is ruled "RULED - S1 states trailing-space boundaries with SKIP subtracted." (census answer to a strictness demand); "GLM-A7 (filed V283 GLM verdict):" demands "P168 census ambiguities" but is ruled "RULED ADOPTED as global mismatch clause" (and the census stayed unpinned - pinned now in v5 P171); "GLM-A8 (filed V283 GLM verdict):" demands the "Rows-fence token collision" fix but is ruled "RULED - B2 notes E6a-primary with pobreak adjudicated." (unrelated; GJ still collides - citation rule adopted instead); "GLM-A10 (filed V283 GLM verdict):" demands the "Naming drift" alignment but is ruled "RULED ADOPTED as epoch-sentinel clause." (unrelated); "GLM-B1 (filed V283 GLM verdict):" demands the "Shared HTF-opposition helper" but is ruled "RULED ADOPTED as raw fields (plus skipped count)."; "GLM-B2 (filed V283 GLM verdict):" demands the "Three-state break result" but is ruled "RULED ADOPTED as explicit tripwire." (neither ruled mechanism is in the code; v5 P013 keeps the helper DEFERRED). Code and packet came out right regardless (tripwire, P012 pairs, prose clauses all landed and ruled 5-0); the damage was carry-check comparability only. This relay re-pairs content-keyed: equal-case defect BELONGS to the explicit both-bounds tripwire (P122, v11, ruled 5-0); P012 garble BELONGS to the bias/opposed pairs with flip (P012, v11, ruled 5-0); SKIP-no-numbers BELONGS to GUARD-row cross-reference adjudication (P128 seed/seedbar/bar, no new fields in refinement); open==POI equality BELONGS to the stated asymmetric strictness (P019/P096, v11); census counts BELONG to the pinned S1 counts (v5 P171); GJ BELONGS to noted-with-citation-rule (no relabel); naming drift BELONGS to the one-line label map (v5 P003); helper/three-state BELONG to parked scope (needs his scope word). Disposition: RE-PAIRED in this relay; v5 packet cites content, never bare tags.
- Opus-A9 attribution repair (v284 relay P011; filed V283 SONNET demands carry the three labels "SONNET-B-Q2fix", "SONNET-B-Q1wording", "SONNET-B-durable" only): "Sonnet-B1"/"Sonnet-B3" WITHDRAWN as unattested tags; the HTF SKIP print is recorded builder-originated (v282 Luna-A3/Sonnet-A2/GLM-A6 trace; LUNA-A3 ruling text carried it). The SKIP print, explicit tripwire, pairs fix, strictness naming, pairing procedure, and GUARD cross-reference all LANDED in v11 and ruled 5-0 on behavior - attribution repaired, substance untouched.
- Astra-A15/GLM-A8 (same class): v5 P011 + this ledger key rulings by content quote, never bare tags.
- Remaining V284 notes carried as recorded (none blocking, none code): P005 locals qualifier (v5); P020 clean-row conventions (v5); P021 E6a precedence qualifier (v5); P012 row tokens + emission-time qualifier (v5); P185 seedbar epoch + walked/readable sentence (v5); B7 POI-break label (v5 P182 + pairing key GUARD-bar-time + ABORT-state); B8 seed-instance identity (v5 P183); float idioms + span-bound + cause-less aborts recorded bounded (no change); C318 carried as pre-existing outside anchors.
- Deferred with reasons (behavior-neutral, unanimous agreement needs no code): HTF/HTF_PREV split, seed/cbar SKIP fields, read counter, shared helper, three-state break result, latched side, retain-print helper, S3/S4 extension (last four need his scope word).

## Q1 - wording-fix verification (packet v5 P013/P017 vs P092/P093/C5141)
Q1: Does v5 P013/P017 state exactly e6a_block == (oOpp == 1) for identical inputs, with current-bundle unreadability yielding no opposition kill and previous-bundle unreadability affecting flip observability only (packet 72236198 P013/P017 twinned above; predicates P092/P093 twinned; C5141/C5135 carried whole above)?
Q1 verdict line: Q1-YES / Q1-NO (one).
Q1 plain answer form: "Q1 YES - the unreadability sentence is exact" or "Q1 NO - <exact line> still overbroad because <disk reason>".

## Q2 - acceptance-battery verification (packet v5 P171/P176-P179/P182/P183/P185 + rows fence above)
Q2: Is the acceptance battery gradeable as written - B1 anti=2/{0,1} with pobreak adjudicated and ORDER-row absence expected (P176), B2 same clause (P177), B3 anti=1/* with CL exit row entry=159.948 exit=159.899 (P178 + fence), B4 field-named with sourced-differently gap (P179 + fence), S1 counts pinned (P171), pairing key + precedence + seed-instance + seedbar epoch in place (P182/P183/P185)?
Q2 verdict line: Q2-YES / Q2-NO (one).
Q2 plain answer form: "Q2 YES - the battery is gradeable" or "Q2 NO - <exact line> ungradeable because <disk reason>".

## Seat packaging (identical text all seats; key seat Luna-only after verdicts)
- Transport seats: his choice. Review: all carried seats rule Q1+Q2 with halt power; either seat halts per dual-key.
- Key ask rides AFTER verdicts, to Luna only (run word already banked for one build + two runs). No key spent here. No build/run here.

## Verification split (every model tier shares the same paste blind spot)
- Rule on the page only. Disk genuineness (EA re-hash CD95241F/637583/11552, STAGE-1 exact-diff of the carried-identical blocks, segment C03D4774 counts) is proven on builder disk + his eyes only, never from chat by any model tier. File-access proof is builder-disk + his-eyes only. Do not ask for files.
- Twin/code/rows battery numbers (P-count vs packet lines, prefix-stripped bodies diff 0; code regions byte-diff 0 vs EA disk; rows pattern hits + pair count; anchors 0 leftover; P-sequence unbroken; ellipsis 0; quotes substring-verified) are pasted in the transport memo from the battery run, never asserted here.

Nothing else is asked. Thank you.
