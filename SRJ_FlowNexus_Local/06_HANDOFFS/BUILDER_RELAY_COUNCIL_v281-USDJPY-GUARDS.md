# RELAY v281 — PACKET_P-USDJPY-2 v1 (settled-rule guards, E4b branch only)

Project brief (standing - read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: packet P-USDJPY-1 v1-v7 built and run (RECON64); this packet P-USDJPY-2 v1 guards the E4b path his 2026-09-25 ruling faulted. Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

Change (one plain sentence per question): E6a blocks the E4b S2-to-S5 confirm promotion on fresh HTF opposition with S2WAIT retain. E6b blocks the same promotion on anchor POI-behind body cross between seed and confirm bars with S2WAIT retain.

File / function / lines: Experts\SRJ_FlowNexus_EA.mq5, S2 block of EvaluateClosedBar, EA 8086-8112 (27 lines, the E4b branch built by v7). Function SrjOrderEmit flip predicate EA 5117-5146 (30 lines). LTF invariant range EA 7119-7130 (12 lines).
Source digest: CD95241F / 637583 bytes / 11552 lines (built tree, measured after the line-ending repair, before compile; compile 0/0 on record).
Packet: 01_TASKS\PACKET_P-USDJPY-2v1.md 8457C2C1 / 13955 bytes / 158 lines (E6a rule P18, E6b rule P19, edit site P29 with old 27 / new 76 / NET +49, acceptance B1-B7).
Segment: 06_HANDOFFS\RECON64-V7-USDJPY_JOURNAL.log C03D4774 / 3879744 bytes / 21450 lines (v7 run, DONE=PASSED).
Priors (labeled, never as anyone's words): relay v280 (06_HANDOFFS\BUILDER_RELAY_COUNCIL_v280-USDJPY-CLEAR7.md 5BA413BE, cleared v7 3-0); packet v7 (01_TASKS\PACKET_P-USDJPY-1v7.md ECC1E56B); V280 grade (06_HANDOFFS\BUILDER_RESULT_V280-USDJPY-GRADE.md 2C89A68E); his retest-invalidation ruling (06_HANDOFFS\BUILDER_FINDING_RETEST-INVALIDATION-V1.md 8EF27EF8: 6/04 16:20 voided by pre-confirmation POI body-break, 6/08 09:35 killed by post-retest flip).

Q1 (E6a flip gate): the new code reads FL_BUF_HTF_HIGH/MID/LOW at the confirm bar and the prior bar, counts legs against the locked direction, and blocks promotion when anti-now>=2 with anti-prev in [0,2) - the ORDER census newness predicate verbatim - falling into the existing S2WAIT retain with no new abort code; unreadable reads mean no gate. Is this a correct reading of his S3.3 flip-kill for the E4b path, and is S2WAIT-retain (versus abort) the right disposition for a blocked promotion? Cite lines.
Q2 (E6b POI-break guard): the new code walks shifts confirm+1 through seed (seed shift via iBarShift on the anchor time; unreadable seed means no gate), reads the anchor POI value plus open/close per bar, and kills on behind-gated body cross both directions (LONG: anchor at/below open with open>=anchor and close<anchor; SHORT mirrored; EMPTY/unreadable skipped), E4b-only scope with S3/S4-path extension parked. Is the predicate a correct reading of spec S5.4 pre-confirmation invalidation, and is E4b-only scope acceptable? Cite lines.

Answer form: plain yes / no / discrepancy, with line numbers, per question (a NO on one never sinks the other).
Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.
Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Open disclosures (builder-stated, rule on them too): (1) never-aligned candidates still promote under E6a (A1 09:45 shape: flip=0, take preserved per his CONFIRM-ONCE ruling) - only fresh flips block; (2) unreadable reads mean no gate in both guards (census convention, fail direction stated); (3) the E6b behind gate uses per-bar open-relative side, not a latched side; (4) E4b-only scope leaves S3/S4-path flips and breaks at baseline behavior by design (refinement phase, his order).

Verification split: rule on the page only - genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.

P001: # PACKET_P-USDJPY-2 v1 DRAFT - settled-rule guards on the E4b path (nothing builds/runs/commits on this file)
P002: 
P003: Status: v1 DRAFT on built tree CD95241F/637583/11552 (packet v7 built, 0/0). Assembly rule: enumerated literal edits below only (E4b site); old block machine-read from disk under UNIQUE header; each edit-site header exactly once. Relay + battery owed before any transport.
P004: 
P005: Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E6a/E6b additive guards inside the E4b branch ONLY; S1 recount governs). No new indicator buffers. No new inputs. No new abort codes. No counter touches. Nothing under 02_TASK_CHECKPOINTS. Commits are builder-called (AGENTS 6.5); no council commit token exists or is asked.
P006: 
P007: ## Authority (his words + disk, no invention)
P008: 
P009: - His retest-invalidation ruling 2026-09-25 (finding RETEST-INVALIDATION-V1): 6/04 16:05 valid retest voided by pre-confirmation-close POI body-break (+1 retest cannot revive); 6/08 09:35 ignored post-retest 5m flip; severity: critical entry-logic mistake; orders: journal first, analysis after, refinement phase (no big overall-logic revision).
P010: - Record anchors: spec Part A v4.2 S5.4 pre-confirmation invalidation (candidate armed for confirming close is DEAD on POI-behind body-break) + S2-row-3 scope + S8 not-built admission; S3.3 Step 2 (5m flip against locked direction kills); skill srj-strategy section 6 (settled rules ride every refinement; refinement-phase scope).
P011: - V7 violations proved on rows (RECON64 C03D4774/3879744/21450): 6/04 16:20 SIGNAL+EXECUTED (ORDER flip=1 opposed=1, WAIVED 16:00 x2, PREBIND_S2 16:15) + 6/08 09:35 SIGNAL+EXECUTED (ORDER flip=1 opposed=1, PREBIND_S2 09:30) - both rode E4b with fresh HTF opposition the gate passed as PASS.
P012: - Discriminator proved (same segment): A1 09:45 ORDER flip=0 opposed=0 + PREBIND_S2 09:40 + SIGNAL + EXECUTED + TP win (never-aligned, no flip - valid shape per his CONFIRM-ONCE ruling); A4 09:10 ORDER flip=0 opposed=0 via S4 path (never touched E4b). Guards below kill exactly the flip=1 class and preserve the flip=0 class.
P013: - Code absence proved: BODY_BREAK x6 all post-entry exit-leg; PRECONFIRM/BEHIND_BROKEN/POI_SIDE 0 hits (two patterns each) - no pre-confirmation guard exists. LTF invariant EA:7119 covers S3..S5 only; E4b jumps S2->S5 same pass, never facing it (6/08 rows prove the bypass: jump + SIGNAL, no LTFFLIP/ABORT between).
P014: - S5.4-clean controls by row: A1 09:40-bar RETESTDIAG nearAbove Daily-POC 4.0pts (no break 09:35->09:40); A4 09:05-bar RETESTDIAG inside Daily-VWAP (no break 09:00->09:05).
P015: 
P016: ## Rule (two guards, E4b branch only; baseline S3/S4 paths untouched)
P017: 
P018: - E6a flip gate (his S3.3): at E4b promotion, compute fresh-HTF-opposition with the ORDER census predicate verbatim (anti-now>=2 with anti-prev in [0,2); unreadable reads = no gate, census convention; fail direction stated, council rules it). Flip=1 prints E4B_GUARD flip=1 and falls into the S2WAIT retain below (confirm-fail shape; no new abort code). Never-aligned flip=0 promotes as today (A1 shape preserved per his CONFIRM-ONCE ruling).
P019: - E6b POI-break guard (his S5.4 + spec S5.4): at E4b promotion, walk shifts confirm+1..seed (seed shift via iBarShift on g_anchorBarTime; unreadable seed = no gate, unprovable is not a break); per bar read anchor value (ReadBuf1, EMPTY/unreadable skipped) + open/close (zero reads skipped); kill on behind-gated body cross (LONG: anchor at/below open with open>=anchor and close<anchor; SHORT mirrored); side per bar (spec S5.2 dynamic). Fires print E4B_GUARD pobreak=1 and falls into S2WAIT retain. Scope E4b-only this round (both his instances rode E4b; S3/S4-path extension parked, council may demand it).
P020: - Untouched (fence): everything v7 built except the E4b branch interior; S3-prebind and S4-edge promotion paths; ORDER/DIV gates; abort codes; counters; buffers; inputs; R floor; exits; management.
P021: 
P022: ## Scope (refinement phase, his order)
P023: 
P024: - Narrow edits to the E4b branch only. No overall-logic revision. Any extension to S3/S4 paths needs his explicit scope word first (never council-first).
P025: - Windows: USDJPY 6/1-6/13 + EURUSD 8/26-9/10 (config-ini unix window per RUN-WINDOW GATE; separate ini carries Expert/Symbol/Period/Inputs only). InpDebugLog=true, InpMode=1, M5 pinned (RECON63/64 parity).
P026: 
P027: ## Edit set (exact verbatim old/new; STAGE-1 exact-diff gated; old block disk-read same turn under UNIQUE header; exactly one block per site)
P028: 
P029: - E6a+E6b (old EA 8086-8112 27 lines, new 76 lines, NET +49):
P030:   old:
P031: `   if(g_state == ST_S2_LTF_ALIGN)`
P032: `     {`
P033: `      bool aligned;`
P034: `      if(!CheckLtfAlign(barShift, g_dir, aligned))`
P035: `        { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }`
P036: `      if(!aligned)`
P037: `        {`
P038: `         //--- [P-USDJPY-1 E4b] his confirm-once rule 2026-09-25 + 2026-09-11 ruling extended to S2 as a deliberate exception (LTF-stay overridden for confirm-bearing candidates only; S3-only keeps the 6/5 miss dead). Identical predicate, identical S5 fall-through; FAIL retains at S2.`
P039: `         string cfTermS2 = "";`
P040: `         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermS2))`
P041: `           {`
P042: `            ENUM_SRJ_STATE prevS2 = g_state;`
P043: `            g_confirmFromState = prevS2;`
P044: `            g_state = ST_S5_GATE_CHECK;`
P045: `            LogState(prevS2, g_state);`
P046: `            if(InpDebugLog)`
P047: `               PrintFormat("[SRJ-EA] CONFIRM_PREBIND_S2 bar=%s dir=%s poi=%s seedbar=%s",`
P048: `                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),`
P049: `                           DirName(g_dir), AnchorStr(),`
P050: `                           TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES));`
P051: `           }`
P052: `         else`
P053: `           { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }`
P054: `        }`
P055: `      ENUM_SRJ_STATE prev = g_state;`
P056: `      if(g_state == ST_S2_LTF_ALIGN) { g_state = ST_S3_ZONE_WAIT; LogState(prev, g_state); }`
P057: `     }`
P058:   new (E6a flip gate + E6b POI-break walk inserted before the confirm attempt; retain falls into the existing S2WAIT shape):
P059: `   if(g_state == ST_S2_LTF_ALIGN)`
P060: `     {`
P061: `      bool aligned;`
P062: `      if(!CheckLtfAlign(barShift, g_dir, aligned))`
P063: `        { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }`
P064: `      if(!aligned)`
P065: `        {`
P066: `         //--- [P-USDJPY-1 E4b] his confirm-once rule 2026-09-25 + 2026-09-11 ruling extended to S2 as a deliberate exception (LTF-stay overridden for confirm-bearing candidates only; S3-only keeps the 6/5 miss dead). Identical predicate, identical S5 fall-through; FAIL retains at S2.`
P067: `         //--- [P-USDJPY-2 E6a] his S3.3 rule 2026-09-25: fresh HTF opposition blocks the S2 confirm promotion (ORDER-census newness predicate verbatim; unreadable reads = no gate). Falls into S2WAIT retain - no new abort code.`
P068: `         int e6a_antiNow = -1, e6a_antiPrev = -1;`
P069: `         int e6a_want = (g_dir == DIR_LONG) ? 1 : -1;`
P070: `         double e6a_h = 0.0, e6a_m = 0.0, e6a_l = 0.0;`
P071: `         if(ReadFlow(FL_BUF_HTF_HIGH, e6a_h, barShift) && ReadFlow(FL_BUF_HTF_MID, e6a_m, barShift) && ReadFlow(FL_BUF_HTF_LOW, e6a_l, barShift))`
P072: `           {`
P073: `            e6a_antiNow = 0;`
P074: `            if((int)MathRound(e6a_h) == -e6a_want) e6a_antiNow++;`
P075: `            if((int)MathRound(e6a_m) == -e6a_want) e6a_antiNow++;`
P076: `            if((int)MathRound(e6a_l) == -e6a_want) e6a_antiNow++;`
P077: `           }`
P078: `         double e6a_h1 = 0.0, e6a_m1 = 0.0, e6a_l1 = 0.0;`
P079: `         if(ReadFlow(FL_BUF_HTF_HIGH, e6a_h1, barShift + 1) && ReadFlow(FL_BUF_HTF_MID, e6a_m1, barShift + 1) && ReadFlow(FL_BUF_HTF_LOW, e6a_l1, barShift + 1))`
P080: `           {`
P081: `            e6a_antiPrev = 0;`
P082: `            if((int)MathRound(e6a_h1) == -e6a_want) e6a_antiPrev++;`
P083: `            if((int)MathRound(e6a_m1) == -e6a_want) e6a_antiPrev++;`
P084: `            if((int)MathRound(e6a_l1) == -e6a_want) e6a_antiPrev++;`
P085: `           }`
P086: `         bool e6a_flip = (e6a_antiNow >= 2 && e6a_antiPrev >= 0 && e6a_antiPrev < 2);`
P087: `         //--- [P-USDJPY-2 E6b] his S5.4 rule 2026-09-25 + spec S5.4: anchor POI-behind body-break between seed bar and confirm bar kills the promotion. Walk shifts confirm+1..seed; cross-based both dirs with behind gate per bar (spec S5.2 dynamic); EMPTY/unreadable skipped; unreadable seed = no gate.`
P088: `         bool e6b_broken = false;`
P089: `         int e6b_seedShift = iBarShift(_Symbol, PERIOD_CURRENT, g_anchorBarTime);`
P090: `         if(e6b_seedShift > barShift)`
P091: `           {`
P092: `            for(int e6b_s = barShift + 1; e6b_s <= e6b_seedShift; e6b_s++)`
P093: `              {`
P094: `               double e6b_v = 0.0;`
P095: `               if(!ReadBuf1(g_hPoi, g_anchorLine, e6b_v, e6b_s) || e6b_v == EMPTY_VALUE) continue;`
P096: `               double e6b_o = iOpen(_Symbol, PERIOD_CURRENT, e6b_s);`
P097: `               double e6b_c = iClose(_Symbol, PERIOD_CURRENT, e6b_s);`
P098: `               if(e6b_o == 0.0 || e6b_c == 0.0) continue;`
P099: `               bool e6b_behind = (g_dir == DIR_LONG) ? (e6b_v <= e6b_o) : (e6b_v >= e6b_o);`
P100: `               bool e6b_crossDn = (e6b_o >= e6b_v && e6b_c < e6b_v);`
P101: `               bool e6b_crossUp = (e6b_o <= e6b_v && e6b_c > e6b_v);`
P102: `               bool e6b_against = (g_dir == DIR_LONG) ? e6b_crossDn : e6b_crossUp;`
P103: `               if(e6b_behind && e6b_against) { e6b_broken = true; break; }`
P104: `              }`
P105: `           }`
P106: `         if(e6a_flip || e6b_broken)`
P107: `           {`
P108: `            if(InpDebugLog)`
P109: `               PrintFormat("[SRJ-EA] E4B_GUARD bar=%s dir=%s poi=%s seedbar=%s flip=%d pobreak=%d",`
P110: `                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),`
P111: `                           DirName(g_dir), AnchorStr(),`
P112: `                           TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES),`
P113: `                           (int)e6a_flip, (int)e6b_broken);`
P114: `            if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return;`
P115: `           }`
P116: `         string cfTermS2 = "";`
P117: `         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermS2))`
P118: `           {`
P119: `            ENUM_SRJ_STATE prevS2 = g_state;`
P120: `            g_confirmFromState = prevS2;`
P121: `            g_state = ST_S5_GATE_CHECK;`
P122: `            LogState(prevS2, g_state);`
P123: `            if(InpDebugLog)`
P124: `               PrintFormat("[SRJ-EA] CONFIRM_PREBIND_S2 bar=%s dir=%s poi=%s seedbar=%s",`
P125: `                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),`
P126: `                           DirName(g_dir), AnchorStr(),`
P127: `                           TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES));`
P128: `           }`
P129: `         else`
P130: `           { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }`
P131: `        }`
P132: `      ENUM_SRJ_STATE prev = g_state;`
P133: `      if(g_state == ST_S2_LTF_ALIGN) { g_state = ST_S3_ZONE_WAIT; LogState(prev, g_state); }`
P134: `     }`
P135: 
P136: ## Stages (T161N discipline; RECON64 precedent)
P137: 
P138: - S1 pre-hash gate: re-hash EA (must equal CD95241F/637583/11552 or DIAGNOSED successor, never assumed) plus one hit per anchor (E4b block) plus buffers unchanged (no new indicator buffers) plus R-gate/latch untouched (no edit there) plus call-site census unchanged (no new walker callers; E6 reads are Flow/POI/OHLC only) plus char-code assert every OLD anchor AND every insert byte plus HTF-buffer ids (HIGH/MID/LOW used at EA:5120) plus POI-handle read precedent (ReadBuf1 on the POI handle at the walker site) plus iBarShift precedent (14 hits) plus print-name uniqueness (E4B_GUARD new). M5 PINNED. Runs carry InpDebugLog=true.
P139: - S3 budget (mechanical from the pasted blocks, NET per site = new-site-total minus old-site-total; script-counted this block): E6a+E6b +49 (76-27); post 11552+49 = 11601 (S3 recount governs).
P140: 
P141: ## Acceptance (grade segment-vs-baselines; event tuples, never bare clock labels)
P142: 
P143: - B1 (6/04 16:15 pass): NO SIGNAL at 16:20; E4B_GUARD row prints (flip=1; pobreak per walk) with S2WAIT retain. A walk-away halt with cause also satisfies (cause named).
P144: - B2 (6/08 09:30 pass): NO SIGNAL at 09:35; E4B_GUARD flip=1 with S2WAIT retain.
P145: - B3 (A1 09:40 pass): SIGNAL 09:45 + EXECUTED 159.948 + TP_TOUCH 159.899 identical (flip=0, S5.4-clean by RETESTDIAG rows).
P146: - B4 (A4 6/03 09:05 pass): SIGNAL + fills 159.932/159.929/159.983 identical (S4 path untouched).
P147: - B5 (A2 16:50 refuse): TP_RR_FAIL_LATCH R0.38 ABORT identical (S3 path untouched).
P148: - B6 (6/03 18:35 refuse): TP_RR_FAIL_LATCH R0.28 identical.
P149: - B7 (EURUSD 8/26-9/10 join): his TAKEN rows must still take (guard-kill on his row = REGRESSION halt); each killed take carries its E4B_GUARD row; 7 baseline takes otherwise bit-identical on bar/entry/exit; rejects diagnostic.
P150: - L-final: B1-B7 above. Extra-venue takes resolve attributed-or-halted per the v7 convention + S5.4/S3.3 re-exam.
P151: 
P152: ## Run cost and novel evidence
P153: 
P154: - One build (STAGE-1 gated) plus two tester runs, ceiling 90 each: USDJPY June 1-13 (~45 min) + EURUSD full 8/26-9/10 (~50 min). Same cost as v7; in-period alternative unchanged.
P155: - E6a/E6b are guard-only (kill paths into existing retain shape); no rescued venue added, no timing moved for clean candidates.
P156: - Novel evidence vs RECON64/65: (a) E4B_GUARD kill rows on his two ruled instances with no 16:20/09:35 signals; (b) A1/A4 intact re-proof under the guards; (c) EU join with guard attribution on every killed take.
P157: 
P158: (End of file)

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
