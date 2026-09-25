# PACKET_P-USDJPY-2 v1 DRAFT - settled-rule guards on the E4b path (nothing builds/runs/commits on this file)

Status: v1 DRAFT on built tree CD95241F/637583/11552 (packet v7 built, 0/0). Assembly rule: enumerated literal edits below only (E4b site); old block machine-read from disk under UNIQUE header; each edit-site header exactly once. Relay + battery owed before any transport.

Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E6a/E6b additive guards inside the E4b branch ONLY; S1 recount governs). No new indicator buffers. No new inputs. No new abort codes. No counter touches. Nothing under 02_TASK_CHECKPOINTS. Commits are builder-called (AGENTS 6.5); no council commit token exists or is asked.

## Authority (his words + disk, no invention)

- His retest-invalidation ruling 2026-09-25 (finding RETEST-INVALIDATION-V1): 6/04 16:05 valid retest voided by pre-confirmation-close POI body-break (+1 retest cannot revive); 6/08 09:35 ignored post-retest 5m flip; severity: critical entry-logic mistake; orders: journal first, analysis after, refinement phase (no big overall-logic revision).
- Record anchors: spec Part A v4.2 S5.4 pre-confirmation invalidation (candidate armed for confirming close is DEAD on POI-behind body-break) + S2-row-3 scope + S8 not-built admission; S3.3 Step 2 (5m flip against locked direction kills); skill srj-strategy section 6 (settled rules ride every refinement; refinement-phase scope).
- V7 violations proved on rows (RECON64 C03D4774/3879744/21450): 6/04 16:20 SIGNAL+EXECUTED (ORDER flip=1 opposed=1, WAIVED 16:00 x2, PREBIND_S2 16:15) + 6/08 09:35 SIGNAL+EXECUTED (ORDER flip=1 opposed=1, PREBIND_S2 09:30) - both rode E4b with fresh HTF opposition the gate passed as PASS.
- Discriminator proved (same segment): A1 09:45 ORDER flip=0 opposed=0 + PREBIND_S2 09:40 + SIGNAL + EXECUTED + TP win (never-aligned, no flip - valid shape per his CONFIRM-ONCE ruling); A4 09:10 ORDER flip=0 opposed=0 via S4 path (never touched E4b). Guards below kill exactly the flip=1 class and preserve the flip=0 class.
- Code absence proved: BODY_BREAK x6 all post-entry exit-leg; PRECONFIRM/BEHIND_BROKEN/POI_SIDE 0 hits (two patterns each) - no pre-confirmation guard exists. LTF invariant EA:7119 covers S3..S5 only; E4b jumps S2->S5 same pass, never facing it (6/08 rows prove the bypass: jump + SIGNAL, no LTFFLIP/ABORT between).
- S5.4-clean controls by row: A1 09:40-bar RETESTDIAG nearAbove Daily-POC 4.0pts (no break 09:35->09:40); A4 09:05-bar RETESTDIAG inside Daily-VWAP (no break 09:00->09:05).

## Rule (two guards, E4b branch only; baseline S3/S4 paths untouched)

- E6a flip gate (his S3.3): at E4b promotion, compute fresh-HTF-opposition with the ORDER census predicate verbatim (anti-now>=2 with anti-prev in [0,2); unreadable reads = no gate, census convention; fail direction stated, council rules it). Flip=1 prints E4B_GUARD flip=1 and falls into the S2WAIT retain below (confirm-fail shape; no new abort code). Never-aligned flip=0 promotes as today (A1 shape preserved per his CONFIRM-ONCE ruling).
- E6b POI-break guard (his S5.4 + spec S5.4): at E4b promotion, walk shifts confirm+1..seed (seed shift via iBarShift on g_anchorBarTime; unreadable seed = no gate, unprovable is not a break); per bar read anchor value (ReadBuf1, EMPTY/unreadable skipped) + open/close (zero reads skipped); kill on behind-gated body cross (LONG: anchor at/below open with open>=anchor and close<anchor; SHORT mirrored); side per bar (spec S5.2 dynamic). Fires print E4B_GUARD pobreak=1 and falls into S2WAIT retain. Scope E4b-only this round (both his instances rode E4b; S3/S4-path extension parked, council may demand it).
- Untouched (fence): everything v7 built except the E4b branch interior; S3-prebind and S4-edge promotion paths; ORDER/DIV gates; abort codes; counters; buffers; inputs; R floor; exits; management.

## Scope (refinement phase, his order)

- Narrow edits to the E4b branch only. No overall-logic revision. Any extension to S3/S4 paths needs his explicit scope word first (never council-first).
- Windows: USDJPY 6/1-6/13 + EURUSD 8/26-9/10 (config-ini unix window per RUN-WINDOW GATE; separate ini carries Expert/Symbol/Period/Inputs only). InpDebugLog=true, InpMode=1, M5 pinned (RECON63/64 parity).

## Edit set (exact verbatim old/new; STAGE-1 exact-diff gated; old block disk-read same turn under UNIQUE header; exactly one block per site)

- E6a+E6b (old EA 8086-8112 27 lines, new 76 lines, NET +49):
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
  new (E6a flip gate + E6b POI-break walk inserted before the confirm attempt; retain falls into the existing S2WAIT shape):
`   if(g_state == ST_S2_LTF_ALIGN)`
`     {`
`      bool aligned;`
`      if(!CheckLtfAlign(barShift, g_dir, aligned))`
`        { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }`
`      if(!aligned)`
`        {`
`         //--- [P-USDJPY-1 E4b] his confirm-once rule 2026-09-25 + 2026-09-11 ruling extended to S2 as a deliberate exception (LTF-stay overridden for confirm-bearing candidates only; S3-only keeps the 6/5 miss dead). Identical predicate, identical S5 fall-through; FAIL retains at S2.`
`         //--- [P-USDJPY-2 E6a] his S3.3 rule 2026-09-25: fresh HTF opposition blocks the S2 confirm promotion (ORDER-census newness predicate verbatim; unreadable reads = no gate). Falls into S2WAIT retain - no new abort code.`
`         int e6a_antiNow = -1, e6a_antiPrev = -1;`
`         int e6a_want = (g_dir == DIR_LONG) ? 1 : -1;`
`         double e6a_h = 0.0, e6a_m = 0.0, e6a_l = 0.0;`
`         if(ReadFlow(FL_BUF_HTF_HIGH, e6a_h, barShift) && ReadFlow(FL_BUF_HTF_MID, e6a_m, barShift) && ReadFlow(FL_BUF_HTF_LOW, e6a_l, barShift))`
`           {`
`            e6a_antiNow = 0;`
`            if((int)MathRound(e6a_h) == -e6a_want) e6a_antiNow++;`
`            if((int)MathRound(e6a_m) == -e6a_want) e6a_antiNow++;`
`            if((int)MathRound(e6a_l) == -e6a_want) e6a_antiNow++;`
`           }`
`         double e6a_h1 = 0.0, e6a_m1 = 0.0, e6a_l1 = 0.0;`
`         if(ReadFlow(FL_BUF_HTF_HIGH, e6a_h1, barShift + 1) && ReadFlow(FL_BUF_HTF_MID, e6a_m1, barShift + 1) && ReadFlow(FL_BUF_HTF_LOW, e6a_l1, barShift + 1))`
`           {`
`            e6a_antiPrev = 0;`
`            if((int)MathRound(e6a_h1) == -e6a_want) e6a_antiPrev++;`
`            if((int)MathRound(e6a_m1) == -e6a_want) e6a_antiPrev++;`
`            if((int)MathRound(e6a_l1) == -e6a_want) e6a_antiPrev++;`
`           }`
`         bool e6a_flip = (e6a_antiNow >= 2 && e6a_antiPrev >= 0 && e6a_antiPrev < 2);`
`         //--- [P-USDJPY-2 E6b] his S5.4 rule 2026-09-25 + spec S5.4: anchor POI-behind body-break between seed bar and confirm bar kills the promotion. Walk shifts confirm+1..seed; cross-based both dirs with behind gate per bar (spec S5.2 dynamic); EMPTY/unreadable skipped; unreadable seed = no gate.`
`         bool e6b_broken = false;`
`         int e6b_seedShift = iBarShift(_Symbol, PERIOD_CURRENT, g_anchorBarTime);`
`         if(e6b_seedShift > barShift)`
`           {`
`            for(int e6b_s = barShift + 1; e6b_s <= e6b_seedShift; e6b_s++)`
`              {`
`               double e6b_v = 0.0;`
`               if(!ReadBuf1(g_hPoi, g_anchorLine, e6b_v, e6b_s) || e6b_v == EMPTY_VALUE) continue;`
`               double e6b_o = iOpen(_Symbol, PERIOD_CURRENT, e6b_s);`
`               double e6b_c = iClose(_Symbol, PERIOD_CURRENT, e6b_s);`
`               if(e6b_o == 0.0 || e6b_c == 0.0) continue;`
`               bool e6b_behind = (g_dir == DIR_LONG) ? (e6b_v <= e6b_o) : (e6b_v >= e6b_o);`
`               bool e6b_crossDn = (e6b_o >= e6b_v && e6b_c < e6b_v);`
`               bool e6b_crossUp = (e6b_o <= e6b_v && e6b_c > e6b_v);`
`               bool e6b_against = (g_dir == DIR_LONG) ? e6b_crossDn : e6b_crossUp;`
`               if(e6b_behind && e6b_against) { e6b_broken = true; break; }`
`              }`
`           }`
`         if(e6a_flip || e6b_broken)`
`           {`
`            if(InpDebugLog)`
`               PrintFormat("[SRJ-EA] E4B_GUARD bar=%s dir=%s poi=%s seedbar=%s flip=%d pobreak=%d",`
`                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),`
`                           DirName(g_dir), AnchorStr(),`
`                           TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES),`
`                           (int)e6a_flip, (int)e6b_broken);`
`            if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return;`
`           }`
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

## Stages (T161N discipline; RECON64 precedent)

- S1 pre-hash gate: re-hash EA (must equal CD95241F/637583/11552 or DIAGNOSED successor, never assumed) plus one hit per anchor (E4b block) plus buffers unchanged (no new indicator buffers) plus R-gate/latch untouched (no edit there) plus call-site census unchanged (no new walker callers; E6 reads are Flow/POI/OHLC only) plus char-code assert every OLD anchor AND every insert byte plus HTF-buffer ids (HIGH/MID/LOW used at EA:5120) plus POI-handle read precedent (ReadBuf1 on the POI handle at the walker site) plus iBarShift precedent (14 hits) plus print-name uniqueness (E4B_GUARD new). M5 PINNED. Runs carry InpDebugLog=true.
- S3 budget (mechanical from the pasted blocks, NET per site = new-site-total minus old-site-total; script-counted this block): E6a+E6b +49 (76-27); post 11552+49 = 11601 (S3 recount governs).

## Acceptance (grade segment-vs-baselines; event tuples, never bare clock labels)

- B1 (6/04 16:15 pass): NO SIGNAL at 16:20; E4B_GUARD row prints (flip=1; pobreak per walk) with S2WAIT retain. A walk-away halt with cause also satisfies (cause named).
- B2 (6/08 09:30 pass): NO SIGNAL at 09:35; E4B_GUARD flip=1 with S2WAIT retain.
- B3 (A1 09:40 pass): SIGNAL 09:45 + EXECUTED 159.948 + TP_TOUCH 159.899 identical (flip=0, S5.4-clean by RETESTDIAG rows).
- B4 (A4 6/03 09:05 pass): SIGNAL + fills 159.932/159.929/159.983 identical (S4 path untouched).
- B5 (A2 16:50 refuse): TP_RR_FAIL_LATCH R0.38 ABORT identical (S3 path untouched).
- B6 (6/03 18:35 refuse): TP_RR_FAIL_LATCH R0.28 identical.
- B7 (EURUSD 8/26-9/10 join): his TAKEN rows must still take (guard-kill on his row = REGRESSION halt); each killed take carries its E4B_GUARD row; 7 baseline takes otherwise bit-identical on bar/entry/exit; rejects diagnostic.
- L-final: B1-B7 above. Extra-venue takes resolve attributed-or-halted per the v7 convention + S5.4/S3.3 re-exam.

## Run cost and novel evidence

- One build (STAGE-1 gated) plus two tester runs, ceiling 90 each: USDJPY June 1-13 (~45 min) + EURUSD full 8/26-9/10 (~50 min). Same cost as v7; in-period alternative unchanged.
- E6a/E6b are guard-only (kill paths into existing retain shape); no rescued venue added, no timing moved for clean candidates.
- Novel evidence vs RECON64/65: (a) E4B_GUARD kill rows on his two ruled instances with no 16:20/09:35 signals; (b) A1/A4 intact re-proof under the guards; (c) EU join with guard attribution on every killed take.

(End of file)
