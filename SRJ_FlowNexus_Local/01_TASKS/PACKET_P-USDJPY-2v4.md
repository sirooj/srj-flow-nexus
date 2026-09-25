# PACKET_P-USDJPY-2 v4 DRAFT - amend-with-delta on v283 verdicts (nothing builds/runs/commits on this file)

Status: v4 DRAFT (v3 25D60185/18010/191 SUPERSEDED untransported-folded - transported as v283 and ruled: Luna Q1-DISCREPANCY + Q2-NO; Sonnet Q1-DISCREPANCY + Q2-DISCREPANCY; GLM Q1-YES + Q2-DISCREPANCY-one-line; tallied NO-CLEAR - tripwire boundary bug blocks all three; code UNCHANGED - this fold amends tripwire + proof wording + SKIP print only). Assembly rule: enumerated literal edits below only (E4b branch interior + abort-define insert + Task-76 comment); old blocks machine-read from disk under UNIQUE headers; each edit-site header exactly once. Relay + battery owed before any transport.

Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E6a/E6b amended guards + one abort-define + one comment; S1 recount governs). No new indicator buffers. No new inputs. No counter touches. One abort-define carried (ABORT_S54_POIBREAK, GLM-ratified). Nothing under 02_TASK_CHECKPOINTS. Commits are builder-called (AGENTS 6.5); no council commit token exists or is asked.

## Authority (his words + disk, no invention)

- His retest-invalidation ruling 2026-09-25 (finding RETEST-INVALIDATION-V1 8EF27EF8) + refinement-phase order + skill section 6 (settled rules ride every refinement; section srj-strategy-6).
- v283 verdicts, all three filed whole (Luna DISCREPANCY/NO; Sonnet DISCREPANCY/DISCREPANCY; GLM YES/DISCREPANCY-one-line; tallied NO-CLEAR - tripwire equal-case bug blocks Q2 on all three; Luna-Q1 proof wording blocks Q1).
- v283 agreements adopted as fold (all seats): tripwire explicit bound (Luna-A2/Sonnet-Q2/GLM-Q2 + GLM-B2 + Sonnet-B3 - Sonnet's explicit form adopted: else-if with both bounds, equal falls silent); proof narrowed to block/no-block truth value (Luna-Q1/A1/A15, Sonnet-Q1/A2, GLM-A1); HTF SKIP print (Sonnet-B1); P012 pairs corrected to bias/opposed 1/0, 2/1, 3/1, 1/0 with flip 0/1/1/0 stated (GLM-A2/A3); asymmetric strictness named (Sonnet-A3: open inclusive, close strict); abort-pairing procedure (Sonnet-A5/Luna-A13: abort rows never read alone, always paired with preceding GUARD row); SEEDORDER-in-GUARD note (Sonnet-A5 second half: GUARD prints on SKIP bars with seed<barShift visible, pobreak=0, walk skipped).
- Row evidence carried forward (RECON64 C03D4774): ORDER bias/opposed pairs 1/0 (A1 09:40), 2/1 (6/04 16:15), 3/1 (6/08 09:30), 1/0 (A4 09:05) with flip values 0/1/1/0; seedBiasAl 0/0/0/1; WAIVED pair at 16:05 (count 2, paired evaluations same pass); PREBIND_S2 chains; TPFALLBACK 160.028/20; TP_RR_FAIL_LATCH R0.38/R0.28; MTEXIT entry 159.929 exit 159.983 (A4 second fill); EXECUTED fills.
- Luna-Q1 structural demand (oOpp literal) answered: extensional proof narrowed as ruled - identical block/no-block truth value on all inputs (readable: same decision; unreadable: both no-kill, -1 carried by raw anti fields, never by the gate bool); shared-helper refactor stays DEFERRED (new function surface, needs scope word); v284 relay asks her ruling on the narrowed proof.

## Rule (amended guards, E4b branch only; baseline S3/S4 paths untouched)

- E6a standing-opposition gate: HTF legs exactly as v3; BLOCK on opposed (antiNow>=2); flip print-only. Wording: HTF-opposition proxy, identical block/no-block truth value as oOpp on all inputs (readable: same decision; unreadable: both no-kill with -1 carried adjudicably in raw fields, never in the gate bool); 5m-mapping open to his word.
- E6a disposition ABORT_LTF_MISALIGN (existing code; Task-76 comment: opposition kill, two emitters separable by ABORT-row state field). HTF-unreadable prints E4B_GUARD_SKIP reason=HTF (new, print-only).
- E6b POI-break guard: walk confirm+1 through seedShift inclusive; plain dir-matched cross (open inclusive, close strict - stated); exact seed with anchor-bar-time>0; SEED anomaly (unresolvable) + SEEDORDER anomaly (0<=seed<confirm, explicit both bounds); equal shifts silent (confirm-on-seed, ruled); breaking-bar evidence out; walked/skipped counters out; raw HTF/seed fields out.
- E4B_GUARD on every confirm-true with flip/opposed/pobreak/anti/seed/walked/skipped/bbar/bpx fields (clean prints zeros and epoch sentinel; unreadable prints -1s - adjudicable, never clean-looking).
- ABORT_S54_POIBREAK on break-fire (new define, GLM-ratified name).
- Untouched (fence): everything v7 built except the E4b branch interior; S3/S4 paths; ORDER/DIV gates; other abort codes; counters; buffers; inputs; R floor; exits; management.

## Scope (refinement phase, his order)

- Narrow edits to the E4b branch interior + one define + one comment. No overall-logic revision. S3/S4-path extension still parked (needs his explicit scope word first, never council-first). Parked insertion site named: LTF invariant block EA 7119-7130 (no edit this round).
- Windows: USDJPY 6/1-6/13 + EURUSD 8/26-9/10 (config-ini unix window per RUN-WINDOW GATE). InpDebugLog=true (grading precondition, stated), InpMode=1, M5 pinned.

## Edit set (exact verbatim old/new; STAGE-1 exact-diff gated; old blocks disk-read same turn under UNIQUE headers; exactly one block per site)

- E6a+E6b (old EA 8086-8112 27 lines, new 86 lines, NET +59):
  old:
`   if(g_state == ST_S2_LTF_ALIGN)`
`     {`
`      bool aligned;`
`      if(!CheckLtfAlign(barShift, g_dir, aligned))`
`        { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }`
`      if(!aligned)`
`        {`
`         //--- [P-USDJPY-1 E4b] his confirm-once rule 2026-09-25 + 2026-09-11 ruling extended to S2 as a deliberate exception (LTF-stay overridden for confirm-bearing candidates only; S3-only keeps the 6/5 miss dead). Identical predicate, identical S5 fall-through; FAIL retains at S2.`
`         string cfTermS2 = "";`
`         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermS2))`
`           {`
`            ENUM_SRJ_STATE prevS2 = g_state;`
`            g_confirmFromState = prevS2;`
`            g_state = ST_S5_GATE_CHECK;`
`            LogState(prevS2, g_state);`
`            if(InpDebugLog)`
`               PrintFormat("[SRJ-EA] CONFIRM_PREBIND_S2 bar=%s dir=%s poi=%s seedbar=%s",`
`                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),`
`                           DirName(g_dir), AnchorStr(),`
`                           TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES));`
`           }`
`         else`
`           { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }`
`        }`
`      ENUM_SRJ_STATE prev = g_state;`
`      if(g_state == ST_S2_LTF_ALIGN) { g_state = ST_S3_ZONE_WAIT; LogState(prev, g_state); }`
`     }`
  new (confirm-first reorder; standing-opp gate; POI walk without behind term; evidence print with raw fields; abort dispositions; explicit tripwire; HTF SKIP print):
`   if(g_state == ST_S2_LTF_ALIGN)`
`     {`
`      bool aligned;`
`      if(!CheckLtfAlign(barShift, g_dir, aligned))`
`        { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }`
`      if(!aligned)`
`        {`
`         //--- [P-USDJPY-1 E4b] his confirm-once rule 2026-09-25 + 2026-09-11 ruling extended to S2 as a deliberate exception (LTF-stay overridden for confirm-bearing candidates only; S3-only keeps the 6/5 miss dead). Identical predicate, identical S5 fall-through; FAIL retains at S2.`
`         string cfTermS2 = "";`
`         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermS2))`
`           {`
`            //--- [P-USDJPY-2 E6a] HTF-opposition proxy separating the ruled rows (A1 anti=1 promotes; 6/04 anti=2 and 6/08 anti=3 abort): gate on STANDING opposition (antiNow>=2); flip kept as print field only. S3.3 5m-mapping: LTF invariant covers S3+; E4b needs row-separation - his word governs any remap.`
`            int e6a_antiNow = -1, e6a_antiPrev = -1;`
`            int e6a_want = (g_dir == DIR_LONG) ? 1 : -1;`
`            double e6a_h = 0.0, e6a_m = 0.0, e6a_l = 0.0;`
`            if(ReadFlow(FL_BUF_HTF_HIGH, e6a_h, barShift) && ReadFlow(FL_BUF_HTF_MID, e6a_m, barShift) && ReadFlow(FL_BUF_HTF_LOW, e6a_l, barShift))`
`              {`
`               e6a_antiNow = 0;`
`               if((int)MathRound(e6a_h) == -e6a_want) e6a_antiNow++;`
`               if((int)MathRound(e6a_m) == -e6a_want) e6a_antiNow++;`
`               if((int)MathRound(e6a_l) == -e6a_want) e6a_antiNow++;`
`              }`
`            double e6a_h1 = 0.0, e6a_m1 = 0.0, e6a_l1 = 0.0;`
`            if(ReadFlow(FL_BUF_HTF_HIGH, e6a_h1, barShift + 1) && ReadFlow(FL_BUF_HTF_MID, e6a_m1, barShift + 1) && ReadFlow(FL_BUF_HTF_LOW, e6a_l1, barShift + 1))`
`              {`
`               e6a_antiPrev = 0;`
`               if((int)MathRound(e6a_h1) == -e6a_want) e6a_antiPrev++;`
`               if((int)MathRound(e6a_m1) == -e6a_want) e6a_antiPrev++;`
`               if((int)MathRound(e6a_l1) == -e6a_want) e6a_antiPrev++;`
`              }`
`            bool e6a_flip = (e6a_antiNow >= 2 && e6a_antiPrev >= 0 && e6a_antiPrev < 2);`
`            bool e6a_block = (e6a_antiNow >= 2);`
`            bool e6a_unread = (e6a_antiNow < 0 || e6a_antiPrev < 0);`
`            if(e6a_unread && InpDebugLog)`
`               PrintFormat("[SRJ-EA] E4B_GUARD_SKIP bar=%s dir=%s poi=%s reason=HTF", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());`
`            //--- [P-USDJPY-2 E6b] spec S5.4: anchor POI body cross from seed bar (inclusive) through confirm bar (exclusive) kills the promotion. Walk shifts confirm+1..seed; EMPTY/unreadable skipped with walked/skipped counts; exact seed with anchor-bar-time>0; open inclusive, close strict; anchor value dynamic per-bar read.`
`            bool e6b_broken = false;`
`            datetime e6b_bt = 0; double e6b_bv = 0.0, e6b_bo = 0.0, e6b_bc = 0.0;`
`            int e6b_walked = 0, e6b_skipped = 0;`
`            int e6b_seedShift = -1;`
`            if(g_anchorBarTime > 0)`
`               e6b_seedShift = iBarShift(_Symbol, PERIOD_CURRENT, g_anchorBarTime, true);`
`            if(e6b_seedShift < 0)`
`              {`
`               if(InpDebugLog)`
`                  PrintFormat("[SRJ-EA] E4B_GUARD_SKIP bar=%s dir=%s poi=%s reason=SEED", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());`
`              }`
`            else if(e6b_seedShift > barShift)`
`              {`
`               for(int e6b_s = barShift + 1; e6b_s <= e6b_seedShift; e6b_s++)`
`                 {`
`                  e6b_walked++;`
`                  double e6b_v = 0.0;`
`                  if(!ReadBuf1(g_hPoi, g_anchorLine, e6b_v, e6b_s) || e6b_v == EMPTY_VALUE) { e6b_skipped++; continue; }`
`                  double e6b_o = iOpen(_Symbol, PERIOD_CURRENT, e6b_s);`
`                  double e6b_c = iClose(_Symbol, PERIOD_CURRENT, e6b_s);`
`                  if(e6b_o == 0.0 || e6b_c == 0.0) { e6b_skipped++; continue; }`
`                  bool e6b_hit = (g_dir == DIR_LONG) ? (e6b_o >= e6b_v && e6b_c < e6b_v) : (e6b_o <= e6b_v && e6b_c > e6b_v);`
`                  if(e6b_hit) { e6b_broken = true; e6b_bt = iTime(_Symbol, PERIOD_CURRENT, e6b_s); e6b_bv = e6b_v; e6b_bo = e6b_o; e6b_bc = e6b_c; break; }`
`                 }`
`              }`
`            else if(e6b_seedShift >= 0 && e6b_seedShift < barShift)`
`              {`
`               if(InpDebugLog)`
`                  PrintFormat("[SRJ-EA] E4B_GUARD_SKIP bar=%s dir=%s poi=%s reason=SEEDORDER", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());`
`              }`
`            if(InpDebugLog)`
`               PrintFormat("[SRJ-EA] E4B_GUARD bar=%s dir=%s poi=%s seedbar=%s flip=%d opposed=%d pobreak=%d anti=%d/%d seed=%d walked=%d skipped=%d bbar=%s bpx=%s/%s/%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES), (int)e6a_flip, (int)e6a_block, (int)e6b_broken, e6a_antiNow, e6a_antiPrev, e6b_seedShift, e6b_walked, e6b_skipped, TimeToString(e6b_bt, TIME_DATE|TIME_MINUTES), DoubleToString(e6b_bv, _Digits), DoubleToString(e6b_bo, _Digits), DoubleToString(e6b_bc, _Digits));`
`            if(e6a_block) { GoAbort(ABORT_LTF_MISALIGN, g_state); return; }`
`            if(e6b_broken) { GoAbort(ABORT_S54_POIBREAK, g_state); return; }`
`            ENUM_SRJ_STATE prevS2 = g_state;`
`            g_confirmFromState = prevS2;`
`            g_state = ST_S5_GATE_CHECK;`
`            LogState(prevS2, g_state);`
`            if(InpDebugLog)`
`               PrintFormat("[SRJ-EA] CONFIRM_PREBIND_S2 bar=%s dir=%s poi=%s seedbar=%s",`
`                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),`
`                           DirName(g_dir), AnchorStr(),`
`                           TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES));`
`           }`
`         else`
`           { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }`
`        }`
`      ENUM_SRJ_STATE prev = g_state;`
`      if(g_state == ST_S2_LTF_ALIGN) { g_state = ST_S3_ZONE_WAIT; LogState(prev, g_state); }`
`     }`
- Abort-define insert (old EA 323-324 2 lines, new 4 lines, NET +2):
  old:
`#define ABORT_POI_REPLACED     "POI_REPLACED"`
`#define ABORT_DIV_FALLBACK     "DIV_FALLBACK"`
  new:
`#define ABORT_POI_REPLACED     "POI_REPLACED"`
`#define ABORT_DIV_FALLBACK     "DIV_FALLBACK"`
`//--- [P-USDJPY-2 E6b] settled-rule kill reason (S5.4 POI-break; council-ruled name).`
`#define ABORT_S54_POIBREAK     "S54_POIBREAK"`
- Task-76 comment amendment (old EA 7099-7102 4 lines, new 5 lines, NET +1):
  old:
`   //--- Reuses ABORT_LTF_MISALIGN and adds no new reason code. Task 76 removed`
`   //--- the only other site that emitted it, so the string is now unambiguous:`
`   //--- every LTF_MISALIGN abort is a post-S2 invariant failure. It is NOT the`
`   //--- same population as the pre-Task-76 count and must not be compared to it.`
  new:
`   //--- Reuses ABORT_LTF_MISALIGN and adds no new reason code. Task 76 removed`
`   //--- the only other site that emitted it: every LTF_MISALIGN abort is a post-S2`
`   //--- invariant failure or an E4b-guard opposition kill (standing HTF opposition).`
`   //--- The string now has exactly two emitters, separable by the ABORT-row state`
`   //--- field. It is NOT the pre-Task-76 population and must not be compared to it.`

## Stages (T161N discipline; RECON64 precedent)

- S1 pre-hash gate: re-hash EA (must equal CD95241F/637583/11552 or DIAGNOSED successor, never assumed; DIAGNOSED means disk-diagnosed drift filed in ledger and disclosed in relay, never assumed) plus one hit per anchor (one code occurrence per anchor outside history comments: E4b block + abort-define pair + Task-76 comment; print census with token boundaries: E4B_GUARD matches trailing-space form only, E4B_GUARD_SKIP matched and subtracted, ABORT_S54_POIBREAK) plus buffers unchanged (no new indicator buffers) plus R-gate/latch untouched (no edit there) plus call-site census (ComputeNearestTpTarget( = 5: definition + 7307 + 8918 + 2 fallback calls; E6 reads: 6 HTF-leg + POI-walk + OHLC + iBarShift, no new walker callers) plus char-code assert every OLD anchor AND every insert byte plus HTF-buffer ids (HIGH/MID/LOW used at EA:5120) plus POI-handle read precedent (ReadBuf1 on the POI handle at the walker site) plus iBarShift precedent (14 hits) plus M5 PINNED plus InpDebugLog=true grading precondition (guard control flow unconditional; guard rows debug-gated; ABORT rows unconditional via LogAbort; SKIP rows debug-gated). Runs carry InpDebugLog=true.
- S3 budget (mechanical from the pasted blocks, NET per site = new-site-total minus old-site-total; script-counted this block): E4b +59 (86-27); defines +2 (4-2); comment +1 (5-4); total +62; post 11552+62 = 11614 (S3 recount governs).

## Acceptance (grade segment-vs-baselines; event tuples, never bare clock labels)

- B1 (6/04 16:15 pass, SHORT Daily-POC): NO SIGNAL at 16:20 with NO CONFIRM_PREBIND_S2 + NO SIGNAL on this anchor for the rest of its S2 retention (window clause); E4B_GUARD opposed=1 anti=2/1 with ABORT_LTF_MISALIGN row at the kill minute; pobreak=1 expected with breaking bar adjudicated from the print fields at grade.
- B2 (6/08 09:30 pass, SHORT Weekly-POC): NO SIGNAL at 09:35 with window clause as B1; E4B_GUARD opposed=1 with ABORT_LTF_MISALIGN row; pobreak field adjudicated, not pre-declared (E6a-primary instance).
- B3 (A1 09:40 pass, SHORT Daily-POC): SIGNAL 09:45 + EXECUTED 159.948 + TP_TOUCH 159.899 identical; E4B_GUARD opposed=0 pobreak=0 anti=1/1 walked>=1 skipped=0 row at the pass (coverage proof; epoch bbar sentinel read as no-break-recorded).
- B4 (A4 6/03 09:05 pass, LONG Daily-VWAP): SIGNAL + fills 159.932/159.929/159.983 identical (S4 path untouched - parity check, not cleanliness evidence).
- B5 (A2 16:50 refuse, LONG Daily-POC): TP_RR_FAIL_LATCH R0.38 ABORT identical (S3 path untouched - parity check).
- B6 (6/03 18:35 refuse, LONG Daily-POC): TP_RR_FAIL_LATCH R0.28 ABORT identical.
- B7 (EURUSD 8/26-9/10 join): killed takes adjudicated on row evidence against S3.3/S5.4 (guard-kill on a take carrying genuine opposition-kill (opposed=1 with anti>=2) or genuine break-kill (pobreak=1 with bbar not epoch and bpx populated) = guard working, even on his rows - consistent with his declines; abort rows never read alone, always paired with the preceding GUARD row); HALT only on an unattributable kill or a kill with no genuine cause on the rows. Baseline takes otherwise bit-identical on bar/entry/exit; rejects diagnostic. Global mismatch rule: any evidence-field expectation mismatch = halt with attribution, never silent pass.
- B8 (post-kill silence): NO CONFIRM_PREBIND_S2 and NO SIGNAL on the ruled anchors (6/04 SHORT Daily-POC; 6/08 SHORT Weekly-POC) after the kill minutes through window end.
- Dynamic anchor clause: anchor value is the per-bar POI buffer read (dynamic), not locked to the arm-time level.
- Epoch sentinel clause: bbar 1970.01.01 00:00 reads as no-break-recorded; anti/seed -1 reads as unreadable, never clean.
- L-final: B1-B8 above plus the two clauses.

## Run cost and novel evidence

- One build (STAGE-1 gated) plus two tester runs, ceiling 90 each: USDJPY June 1-13 (~45 min) + EURUSD full 8/26-9/10 (~50 min). Same cost as v10 (v10 unbuilt; cost carried).
- E6 guards terminate (abort) with raw-field evidence; behind term deleted; seed exact; explicit tripwire; HTF SKIP print.
- Novel evidence vs RECON64/65: (a) ABORT rows on his two ruled instances with raw fields and no takes and no post-kill revival; (b) A1/A4 intact re-proof with coverage rows; (c) EU join with guard attribution on every killed take.

(End of file)
