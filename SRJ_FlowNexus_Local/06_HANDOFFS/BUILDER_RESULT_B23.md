# BUILDER RESULT B-23 - his panel is the MTF panel, his instance differs by one input, and the EA vote lags a bar behind the panel; MEASURED (record)

Trader summary: no code changed, nothing ran. Three findings, all from records already on disk. First, the 15m number you read comes from the panel on your 5-minute chart - and on every one of your saved charts that panel runs with one setting different from the EA (yours shows the live read, the EA asks for the last-closed one). Second, the machine's vote at each bar lags about one bar behind your panel, and that lag flips the read exactly on your three missing trades' decision bars. Third, one small timing fix is now fully predicted bar by bar: it would reach your 7 Sep 09:20 long, leave the other two still missing, and it puts your 7 Sep afternoon long at risk - that risk is named below so the next build handles it. Verdict MEASURED.

## Part 0 - fresh-session start
- 0.1 ls-remote GitHub builder/B-22 returns 530faae (verified, no fallback). Branch builder/B-23 cut from it. Dirty tree kept (88 lines), nothing reset, no git-config/remote change. Push only to GitHub builder/B-23, only Part F files.
- 0.2 read in order: AGENTS.md, relay skill, strategy skill (sections 5/7/11), pointer, RESULT_B22 (carried first, P1, P3), RESULT_B21 (P/C/D), RESULT_B17 Part E, RESULT_B15 missing-valid rows.
- 0.4 SHAs match, no STOP-A: EA 964803F4 (688599 B); EX5 7C46B16C; HTFEngine D5FD5B06; FlowLogic.mq5 956BF3E3 (full); FlowLogic.ex5 27B5F272 (27B5F272 build, not B-21's FFD77DB7); relay skill 3D27264E (RAM bullet included); strategy 2B76301A.
- 0.5 no backups (no edit); SHAs re-taken at close, all unchanged (Part E).

## Part P - record reads (read-only)
- P1 his live settings. Searched all terminal data folders' Profiles/Charts for .chr holding SRJ_FlowLogic (198 charts scanned): 13 hits, all in this terminal's Default profile (charts 28-40). His EURUSD M5 chart (chart32.chr, symbol=EURUSD period_size=5) input block raw: `inChartTradingTF=1, inHtfLookbackBars=3000, inHtf1_manual=16388 (H4), inHtf2_manual=16385 (H1), inHtf3_manual=15 (M15), inUseConfirmedHTFOnly=false, inHtfMaxTrackedObjects=60` (rest defaults). All 13 charts (4 USDJPY + 9 EURUSD M5) carry confirmed=false, lookback=3000. EA iCustom (EA 11208-11213, located by text): `1, InpFL_HtfLookbackBars(=3000), H4, H1, M15, true, 60`. LIVE_INPUTS=differ: inUseConfirmedHTFOnly only (his false = live/forming panel; EA true = asks confirmed). No .tpl under MQL5; no SRJ_FlowLogic preset in Profiles/Tester. ENUM_CHARTTF offers only CTF_1MIN/CTF_5MIN (FlowLogic 232) - no 15-minute option exists.
- P2 panel feed, raw: `SRJ_HTF_RunAll(inHtfLookbackBars,inHtfMaxTrackedObjects, inUseConfirmedHTFOnly,time[last_bar_index]);` (FlowLogic 1446-1447, after the export loop); `SRJ_HTF_GetOutputs(g_htfLo, inUseConfirmedHTFOnly, h3_b, h3_2, h3_3, h3_o);` (1456); `SRJ_Panels_MTFBox(... h3_b, h3_2, h3_3, h3_o);` (1458-1465). Line: the panel's 15m row at pass P = g_htfLo output after RunAll of pass P, using the instance's own inUseConfirmedHTFOnly.

## Part C - journal reconstruction (no run; j8 primary, 77275 lines)
- C1 vote(b) from j8 UJPROBE m15: 3168 bars, full RECON62 coverage (weekend bars absent from the window, as expected). Zero bars needed filling (no UJALIGN/UJM15ROW fill used).
- C2 offset model: for each 15m candle, first M5 bar whose vote differs from the bar before the candle. Histogram: offset 0: 340, offset 5: 229, offset 10: 168 (737 changes). No single fixed offset - MODEL_UNPROVEN. Worse: 562 of 1055 full weekday candles change votes mid-candle, including reversals (e.g. 2026.08.26 00:15 reads +1/-1/+1) - the boundary-frozen reading of B-22 is dead on record; votes move per M5 pass. C3-C5 delivered with dominant offset X=0; every row in a chattering candle flagged (*).
- C3 panel rule (as ordered): Panel(P) = vote(floor15(P) + X), X=0. So Panel(P) = vote of the 15m-candle-open bar.
- C4 decision table (passes P-30 to P+10 in B23_M15_PANEL_RECON.csv, 81 rows, SHA 295B1454; confirm/guard columns carry j8 raw line numbers). Missing-valid windows pasted raw (date,pass_P,bar_b,ea_vote,panel,his_W6,confirm_row,guard_row):
```
2026.09.01,2026.09.01 17:30,2026.09.01 17:25,1.0,-1.0,,, 
2026.09.01,2026.09.01 17:35,2026.09.01 17:30,-1.0,-1.0,bull,27512:c1,
2026.09.01,2026.09.01 17:40,2026.09.01 17:35,-1.0,-1.0,,27536:c0,
2026.09.07,2026.09.07 09:15,2026.09.07 09:10,-1.0,-1.0,,47480:c0,47485:NOMATCH-1.0
2026.09.07,2026.09.07 09:20,2026.09.07 09:15,-1.0,-1.0,bull,47646:c1,47651:NOMATCH-1.0
2026.09.07,2026.09.07 09:25,2026.09.07 09:20,1.0,-1.0,,47812:c0,47817:PASS1.0
2026.09.08,2026.09.08 10:05,2026.09.08 10:00,-1.0,-1.0,,53705:c0,53734:PASS-1.0
2026.09.08,2026.09.08 10:10,2026.09.08 10:05,1.0,-1.0,bear,53908:c1,53928:NOMATCH1.0
2026.09.08,2026.09.08 10:15,2026.09.08 10:10,1.0,-1.0,,54110:c0,54114:NOMATCH1.0
```
- C5 verdicts: 9/1 17:35 LONG: panel=-1.0 vs bull, ea=-1.0 → **P** (clean read: 17:30 candle votes -1/-1/-1, no chatter). Second killer recorded: no 17:35 confirmation in the EA record (17:35 CONFIRMPOLL confirm=0; the 17:30 confirm=1 at j8:27512 belongs to a Monthly-VWAP S1 seed that never armed; the Yearly-POC line was held SHORT, aborted LTF_MISALIGN at 17:25). One plain sentence for 9/1: there is no 17:30 confirmation for his trade in the EA record, so even with matching 15m votes a 17:35 entry would still need a fresh confirmation bar first. 9/7 09:20 LONG: panel=-1.0 vs bull, ea=-1.0 → **P\*** (misfit-flagged: the 09:15 candle votes -1/+1/+1, so the panel value depends on where in the candle it is read; a contemporaneous read gives +1 = his read). 9/8 10:10 SHORT: panel=-1.0 = bear, ea=+1.0 → **T\*** (misfit-flagged: the 10:00 candle votes -1/+1/+1; a contemporaneous read gives +1 ≠ his read). Controls panel-agree check: 8/28 panel=+1 vs SHORT no (fired via BYPASS, value-immune); 9/4 panel=+1 vs LONG yes; 9/7-16:45 panel=-1 vs LONG no (fired via bar-read PASS +1.0); 9/8 panel=-1 vs SHORT yes. Refusals: 8/27 panel=-1 (killed at R, not guard); 9/1-09:55 panel=+1 (killed at 5m rule, not guard).
- C6 Hunk T prediction (vote_T(b) = panel(b+5min), X=0 rule): (a) 974 of 3168 bars would change (by offset 0:322, 5:312, 10:340). (b) 9/1-17:30 vote_T=-1 (want bull): still missing; 9/7-09:15 vote_T=+1 (want bull): guard would PASS - reached (firing then needs its confirm+R, unproven); 9/8-10:05 vote_T=+1 (want bear): still missing. (c) controls/refusals at guard bars: 8/28 BYPASS/NOMATCH unchanged (value-immune / same side); 9/4 BYPASS unchanged (15:50 PASS→NOMATCH path change only); 9/7-16:40 PASS→NOMATCH (**take at risk**, rescue unproven); 9/8 no guard read at 16:55 (unchanged); 8/27 NOMATCH/BYPASS unchanged; 9/1-09:50 still PASS then refused by UJ5MENTRY (5m rule untouched). (d) first-bar NA slots: none read by any RECON62 decision (full 3168 coverage, readFail=0 on cited rows).
- HUNK_T_PREDICTS=reaches 1 of 3; controls change: 9/7 16:45 LONG guard PASS→NOMATCH (take at risk).
- C7: no STOP-A (gate explained); STOP-E clean (Part E SHAs unchanged); no STOP-B/S/D (no edit, no EA run).

## Part D - not triggered (requires P3 = NO_RULING; P3 = 5m-MTF-panel). No question goes to him.

## Part E - final disk state
- Re-taken SHAs, all unchanged: EA 964803F4; EX5 7C46B16C (matches source); HTFEngine D5FD5B06; FlowLogic.mq5 956BF3E3; FlowLogic.ex5 27B5F272. EX5 matches its source.
- terminal.ini [Tester] June USDJPY (Symbol=USDJPY, 1780272000/1781308800), independently read; no terminal ran.
- k1/k2 absent (no runs, no sizes). j7/j8 on disk as before. CSV B23_M15_PANEL_RECON.csv 5796 B (SHA 295B1454), local, pushed per F3.

### Glossary (every log code cited, few words each)
- UJPROBE (ltf/m15/div): per-bar bias/div probe. UJALIGN_PASS/NOMATCH/BYPASS (m15/rf): 15m guard. UJM15ROW (m15time/m15vote): 15m vote at 15m ticks. CONFIRMPOLL (confirm): confirmation terms. SUPPRESSED (HELD): holder kept. STATE (S1/S2/S3/S4/ABORT): lifecycle. ANCHOR_ELECT (SEED): election. SIDE1T_SEEDBIAS: seed bias verdict. ABORT (LTF_MISALIGN): abort + reason. A6REFUSED (predicate): refusal. A6SUPP: census row. SIDE1D_BOTHDIRS: direction selection. UJDEFERABORT: deferred abort. MTSNAP/ENTRY_TICKET/MTEXIT/MTCLOSE/MTLIFE: election, fill, exit, close, life records. TPCENSUS: target census. UJ1R: R check. SIDE1O_ELIGSTATE: eligibility. SLNONFIRE: no-fire. UJ5MENTRY_REFUSE: entry-bias refusal.

## Part F - files, push
- F1 this file. F2 pointer updated (B-23 MEASURED; SHAs unchanged; C5 verdicts + HUNK_T_PREDICTS in one line each; Next = relay B-24).
- F3 commit + push to builder/B-23 on GitHub ONLY: BUILDER_RESULT_B23.md, BUILDER_SESSION_POINTER.md, B23_M15_PANEL_RECON.csv. Nothing else.
- F4 ls-remote check, pasted in the reply.

## Carried note (for the planner; B-24 per its plan)
- LIVE_INPUTS=differ: inUseConfirmedHTFOnly only (his charts false, EA true; rest identical incl. lookback 3000). Raw block: `inChartTradingTF=1, inHtfLookbackBars=3000, inHtf1_manual=16388 (H4), inHtf2_manual=16385 (H1), inHtf3_manual=15 (M15), inUseConfirmedHTFOnly=false, inHtfMaxTrackedObjects=60` (chart32.chr, his EURUSD M5; all 13 FlowLogic charts uniform).
- C2 histogram + model verdict: offsets 0:340 / 5:229 / 10:168 over 737 changes; 562 of 1055 full candles change mid-candle with reversals - MODEL_UNPROVEN, boundary-frozen reading dead on record.
- C3 panel rule with X: Panel(P) = vote(floor15(P) + 0). Misfit rows flagged (*): 9/7 09:20 and 9/8 10:10 read inside chattering candles.
- C5 verdicts: 9/1 P (clean) + no-17:35-confirmation second killer; 9/7 P* (live-model says T); 9/8 T* (live-model says P). Controls agree/disagree: 8/28 no, 9/4 yes, 9/7-16:45 no, 9/8 yes. Refusals unaffected (R-gate / 5m-rule kills).
- HUNK_T_PREDICTS=reaches 1 of 3 (9/7 09:20 only); controls change: 9/7 16:45 LONG PASS→NOMATCH (take at risk, rescue unproven); refusals hold (9/1 via UJ5MENTRY).
- Part D: not triggered. No question for him.
- W1 gap half still UNBUILT (no ruling on a VWAP jump).

(End of file)
