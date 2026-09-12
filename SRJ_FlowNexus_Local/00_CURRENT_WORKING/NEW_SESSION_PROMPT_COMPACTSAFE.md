# NEW SESSION — COMPACT-SAFE (2026-09-11 ~18:05 UTC)
# Purpose: start fresh WITHOUT triggering auto-compact. Small on purpose.
# In-flight: RECON4-FIXS2POLL (P-FIX-S2POLL S5). Launched 16:14:31. Wait for operator nudge. NO polling.

## 1. What happened
Platform compacted context twice today. Full-file reads caused it.
This prompt is the fix: keep context small. Work from disk in tiny steps.

## 2. Baselines (re-hash at open, one file per call)
- EA: Experts\SRJ_FlowNexus_EA.mq5 = 1478ADCF9DC2DC57C73A53002E7690723841A9E06E3DA161EB32526669CBBA74 (261040 B)
- CQD: Indicators\SRJ_CQD_TickBased_MT5.mq5 = BE6FD84FB970B255F7809EF81CDDE829644DCC8B859166E8B2CEB9BF1D8A421F (50555 B)
- OBMGR: Include\SRJ\SRJ_OrderblockMgr.mqh = D286621CD8E2AB92B67FBA2BE0FD60BC861FF277C7516A2CFF6F79564E220B7B (48050 B)
- FlowLogic: Indicators\SRJ_FlowLogic.mq5 = 1EA7858F9B1A8F4F42D90D58A0BB8873063D874E40E32A6A4E69DD8099F73B08 (58657 B)
- GIT HEAD: c50b737. Tag Task162-T162SLREF. T162_BUILD3 + FIXS2POLL uncommitted. No git move without token.

## 3. In-flight run (do FIRST on nudge)
- Run: RECON4-FIXS2POLL. Ini: 00_CURRENT_WORKING\RECON1_P1.ini (unchanged, window 8/26-9/10, 3168 bars).
- Status: 00_CURRENT_WORKING\RECON4-FIXS2POLL_STATUS.txt (PID 29080, PRE_JOURNAL_LINES=64592).
- Done marker: 00_CURRENT_WORKING\RECON4-FIXS2POLL_DONE.txt (ABSENT at 18:03 — run still going).
- Day log: Tester/logs/20260911.log (25 MB — NEVER read whole. Tail 5 only).
- Packet: 01_TASKS\PACKET_P-FIX-S2POLL.md §7 = S6/S7 gates.
- On nudge: read DONE (one file), archive segment from PRE_JOURNAL_LINES, run tabulate_fixrun.ps1, gates, write BUILDER_RESULT_RECON4-FIXS2POLL.md.

## 4. Anti-compact rules (this is the bug fix)
1. ONE small read per turn. Never read .clinerules fully. Tail only: .clinerules start_line 1500 to end.
2. NEVER Get-Content the day log without -Tail 5. NEVER read EA/CQD/FlowLogic whole. Search + ranged read only.
3. NO sleep loops, NO polling. Operator sends completion nudge.
4. No second rules tree exists. One .clinerules only. MQL5 folder IS the data tree.
5. Measure before belief: hash/bytes/lines verbatim. No invented paths. No unmeasured figures in records.

## 5. Queue (after FIXS2POLL gates)
1. FVG-validity packet (ruled rule in 06_HANDOFFS\BUILDER_FINDING_0828-FVG.md).
2. SL imbalance criterion (reserved, in BUILDER_RESULT_T162-SLREF.md §5).
## STATE UPDATE 2026-09-11 (session close) — read this FIRST
- RECON4-FIXS2POLL (P-FIX-S2POLL) EXECUTED AND VERIFIED: Test passed in 0:48:57.099, 563338 ticks, 3168 bars, RESULT=PASSED 17:03:44. Journal archived manually (wrapper died before DONE; SEG=15319). Result: 06_HANDOFFS\BUILDER_RESULT_RECON4-FIXS2POLL.md. Packet STATUS updated in place (01_TASKS).
- ALL GATES PASS. Signals = the RECON3-BUILD3 four-signal set VERBATIM (8/28 10:05 SHORT D-VWAP R=2.43 SL 1.16508; 9/4 16:00 LONG Y-POC R=2.56; 9/7 09:20 R=1.76 + 16:45 R=1.25). WS161 mismatch=0 loads=stores=3168 changes=205. BIAS 1554/1614 x2, ZONE 3168/1056, PROMO 469 verbatim. Post-run 4 digests byte-identical.
- NEW EA BASELINE: 1478ADCF9DC2DC57C73A53002E7690723841A9E06E3DA161EB32526669CBBA74 (261040 B) — the 7BB1E9B6 state SUPERSEDED. CQD BE6FD84F / OBMGR D286621C / FlowLogic 1EA7858F unchanged.
- FIXS2POLL deltas (declared): aborts 51->52 (LTF 24->21, OB_DEAD 7->9, OPP_FVG 5->6, TP_RR_FAIL 5->6); TP_RR_FAIL_LATCH 5->6 (new 8/27 17:00 SHORT R=0.20 died at the 1R gate, no signal); INPLAYCOMMIT applied=1 213->157, committed=1 42->46; CONFIRMPOLL 590->555; PREBIND passes 4->3; CONFIRM_STRUCT_FAIL=198; CONFIRM_DIV_WAIT=6; FRESHSKIP 293->237; SUPPRESSED 156=156; SL_REF 2-swing 60->51; ANCHOR_SUPERSEDE=8 identical. E1 inert (NO_SL_REF=0); E3 haveStop=1 on all 157 lines; defect closed.
- NEXT TASK (queued #1): PACKET_P-FVGVALIDITY.md DRAFT. Ruled rule: BUILDER_FINDING_0828-FVG.md section 5 — dead = full wick traversal OR body close; else the remaining untested range is the valid POI.
- MEASURED ANCHORS (FVG packet): fill pass SRJ_ImbalanceMgr.mqh L364-392 (body midpoint tests L382/384); tickvalid L394-430 (L429 tickFVGIsValid = !latestBiasFVGIsFilled); CImbalance SRJ_Types.mqh L97-137 already carries isWickFilled/wickFillBar (dead state, only set by the NewImbalance factory); call site FlowLogic L871 SRJ_FVG_FillDetectionPass(open,close,i,withinLookbackWindow,barClosed) — the signature must gain high[]/low[]; FVG zone export = buffers 24/25 g_bufFvgLegZoneHigh/Low (EMPTY write FL L1053-1054; freshFvg.objId at ~L1028) = the remaining-range shrink site; BiasEngine L382 consumes tickFVGIsValid in a composite flag -> BIASCENSUS may move (declare); pass order creation(868)->fill(871)->tickvalid(873); no detectionBar guard exists today -> the wick guard i > fvg.detectionBar is a packet design decision to declare; fvgOnly=0 and haveFvg=0 across the whole RECON window -> a-priori zero signal/zone movement in-window; full gates still run.
- DRAFT PACKET then await the operator's explicit issuance (invariant-1 gate; P-DIVCON-B precedent).
- QUEUE AFTER: 2 P-SL-IMBALANCE (operator-reserved); 3 P-TRIM-S2POLL (council-sequenced, the baseline is now established); 4 RECON Phase-2 re-run on the fixed build; 5 debris deletion word (EA_STATE_REG.md, recovery_compile.ps1); 6 git snapshot on explicit token.
- UNCOMMITTED FRAGILE: the T162_FIXS2POLL EA state + every record since 8371669 (the working tree is the only copy).
3. RECON Phase-2 re-run on fixed build.
4. Debris delete word: EA_STATE_REG.md, recovery_compile.ps1.
5. Snapshot on explicit token only.

## 6. Talk rule
Plain words to operator. Dates, sessions, line names. Short sentences. Gloss codes (TP_RR_FAIL = not worth 1R).
