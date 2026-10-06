# BUILDER SLICE B-57 - raw rows behind R1-R3, E3, C1/C2, MCAND, W1 (EA 958D5AA1 F11-OFF, ex5 A2A47B9F; j26 F6E30E77; j27 DD3E6855)

## R1 F11 block raw (disk EA pre-edit, by text "Fix F11")
7430: `if(g_state >= ST_S3_ZONE_WAIT && g_state <= ST_S5_GATE_CHECK)`
7438: `bool t79_aligned = false;`
7439: `if(!CheckLtfAlign(barShift, g_dir, t79_aligned))`
7440: `{ GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }`
7441: `if(!t79_aligned)`
7444: `PrintFormat("[SRJ-EA] LTFFLIP bar=%s dir=%s poi=%s state=%s - LTF bias "`
7488: `double uj_hm15 = 0.0;`
7489: `bool uj_hm15r = ReadFlow(FL_BUF_HTF_LOW, uj_hm15, barShift);`
7490: `double uj_hwant = (g_dir == DIR_LONG ? 1.0 : -1.0);`
7491: `string uj_hterm = "";`
7492: `bool uj_hcarve = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_hterm);`
7493: `if((uj_hm15r && uj_hm15 == uj_hwant) || uj_hcarve)` <- hold condition, exactly one `if((uj_hm15r` hit in disk EA
7494: `{ if(InpDebugLog) PrintFormat("[SRJ-EA] UJLTFHOLD ... - LTF opposed, hold (Fix F11)", ...); }`
7495: `else`
7497: `uj_saAbort = true; ... (Fix S-a deferred-abort flag)`
7498: `if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERABORT ... - LTF opposed, abort deferred past evaluation (Fix S-a)", ...);`
- "Fix F11" text hits: EA:7494 (print string) + EA:8506 (comment `set in Fix F11 t...`).

## R2 scope raw
EA:222-224 enum: `{ ST_IDLE, ST_S1_REGIME, ST_S2_LTF_ALIGN, ST_S3_ZONE_WAIT, ST_S4_ARMED, ST_S5_GATE_CHECK, ST_SIGNAL, ST_ABORT };`
F11_SCOPE = PRE_ENTRY (S3..S5 before ST_SIGNAL).

## R3 pin-recheck raws
- Strategy skill (terms hold/15m agree/5m against/LTF): :84 ONE-TAKE (no-take rule, not a hold), :106 CHART-READS-6/5 (entry reads), :116 5M-FLIP-KILL verbatim "it must kill the trade if the 5m structure bias has flipped", :139 5M-BIAS-AT-ENTRY (refuse entry-against-bias), :141 15M-READS (entry reads). "LTF opposed": 0 hits. No verbatim allows holding while the 5m runs against.
- Findings: BUILDER_FINDING_USDJPY-MISSES.md:18 SHORT trail (analysis, no pin), :33 FRESHSKIP/FRESHCOUNT HOLD (different mechanism), :86 withdrawn, :87/90 holder analysis. None quotes him.
- His trade journal (OPERATOR_TRADE_JOURNAL.csv 1061 lines): only line 1 header matches (LTF column name). No pin.
- Ledger: "15m agree|5m against|holding against the 5m|held while 5m|authorizes holding" = 1 hit at :6858 (B-17 BANK 15M-READS, entry reads, not a hold); "LTF opposed" = 0; "F11 + quot/verbatim/his words" = 0.
- F11_PIN_RECHECK = NONE.

## E3 diff vs .preB57 raw
diff --git a/Experts/SRJ_FlowNexus_EA.mq5.preB57 b/Experts/SRJ_FlowNexus_EA.mq5
@@ -7490,7 +7490,9 @@ void EvaluateClosedBar(int barShift, datetime barTime)
           double uj_hwant = (g_dir == DIR_LONG ? 1.0 : -1.0);
           string uj_hterm = "";
           bool uj_hcarve = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_hterm);
-          if((uj_hm15r && uj_hm15 == uj_hwant) || uj_hcarve)
+          const bool uj_f11HoldOn = false; // [B-57 F11-OFF] no pin authorizes holding against the 5m (GATE-AUTHORIZATION, 5M-FLIP-KILL; B-56 F11_PIN=NONE)
+          // Original: if((uj_hm15r && uj_hm15 == uj_hwant) || uj_hcarve)
+          if(uj_f11HoldOn && ((uj_hm15r && uj_hm15 == uj_hwant) || uj_hcarve))
             { if(InpDebugLog) PrintFormat("[SRJ-EA] UJLTFHOLD bar=%s dir=%s poi=%s state=%s m15=%s rf=%d mode=%s term=%s - LTF opposed, hold (Fix F11)", ...); }
           else
             {
- E4 compile: `Result: 0 errors, 0 warnings, 6790 ms elapsed, cpu='X64 Regular'` (binary fresh).

## C1 j26 vs j23 deal rows raw (j26 left, j23 right; identical tickets/prices/times)
j26:15101 deal #2 sell 2026.08.28 10:05:00 1.16466 / j23:17168 same
j26:15509 deal #3 buy 2026.08.28 11:45:02 1.16440 / j23:17576 same
j26:28532 deal #4 buy 2026.09.01 17:35:01 1.16024 / j23:34494 same
j26:28609 deal #5 sell 2026.09.01 17:51:04 1.15975 / j23:34571 same
j26:42407 deal #6 buy 2026.09.04 16:00:00 1.16019 / j23:50132 same
j26:44102 deal #7 sell 2026.09.04 23:55:00 1.16129 / j23:51827 same
j26:45277 deal #8 buy 2026.09.07 09:20:00 1.16138 / j23:53002 same
j26:45647 deal #9 sell 2026.09.07 10:53:07 1.16201 / j23:53372 same
j26:48017 deal #10 buy 2026.09.07 16:45:00 1.16264 / j23:56070 same
j26:48121 deal #11 sell 2026.09.07 17:13:30 1.16315 / j23:56174 same
j26:49788 deal #12 sell 2026.09.08 10:10:00 1.16205 / j23:57841 same
j26:49926 deal #13 buy 2026.09.08 10:42:46 1.16102 / j23:57978 same
j26:52140 deal #14 sell 2026.09.08 17:00:00 1.16220 / j23:60192 same
j26:52271 deal #15 buy 2026.09.08 17:26:29 1.16275 / j23:60321 same
- A6FIRED 7/7 both, same bars (8/28 10:05, 9/1 17:35, 9/4 16:00, 9/7 09:20, 9/7 16:45, 9/8 10:10, 9/8 17:00).
- UJLTFHOLD j26 0 / j23 84. UJDEFERABORT j26 32 / j23 4. UJ5MENTRY_REFUSE j26 3 (j26:25935 bar 9/1 09:50 LONG; j26:27049 bar 9/1 15:25 SHORT; j26:49290 bar 9/8 09:35 LONG) / j23 8 (same three + 8/27 x3 SHORT 10:05/18:15/18:35 + 9/2 x2 SHORT 11:05/11:25, which die via UJDEFERABORT on j26 with zero deals either date).
- Window/balance proof j26:13 Tester testing-of EURUSD from 2026.08.26; j26:40 Core testing-of 2026.08.26; j26:55653 final balance 10474.64; j26:68244 563338 ticks 3168 bars; j26:68248 connection closed. DONE PASSED 04:43:22.

## C2 j27 vs j25 deal rows raw
j27:6041 deal #2 buy 2026.05.27 15:35:00 159.344 / j25:6040 same; j27:6536 deal #3 sell 20:08:14 159.535 / j25:6535 same
j27:27656 deal #4 buy 2026.06.03 09:10:00 159.932 / j25:30474 same (C-3June)
j27:27783 deal #5 sell 09:59:40 159.983 / j25:30601 same
j27:33059 deal #6 sell 2026.06.04 09:55:00 159.868 / j25:36291 same
j27:33212 deal #7 buy 10:40:20 159.920 / j25:36444 same
j27:37037 deal #8 buy 2026.06.05 16:55:00 160.120 / j25: NONE (machine trade back, like j24 deal #6)
j27:37414 deal #9 sell 19:16:32 160.298 / (same)
j25:54516 deal #8 buy 2026.06.09 16:55:03 160.209 + j25:54587 sell 17:15 160.194 / j27: NONE (machine trade gone)
j27:55528 deal #10 buy 2026.06.11 14:40:22 160.530 / j25:64571 same (B3, vol 5.63 vs 5.59 sizing drift)
j27:55647 deal #11 sell 15:23:06 160.588 / j25:64690 same
- MTEXIT: j27 5 rows (5/27 entry=159.340 exit=159.535; 6/03 entry=159.929 exit=159.983; 6/04 SL entry=159.868 exit=159.920; 6/05 19:15 TP_TOUCH entry=160.115 exit=160.298; 6/11 15:20 TP_TOUCH entry=160.524 exit=160.587) vs j25 5 rows (same first three; 6/09 17:10 POI_BODY_BREAK entry=160.202 exit=160.194; 6/11 15:20 TP_TOUCH entry=160.524 exit=160.587).
- A6FIRED j27 5 (5/27, 6/03, 6/04, 6/05 16:55 machine, 6/11); B1 window 09:40-09:50 zero fires.
- 6/05 16:55 machine row raw j27:37026 `[SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.06.05 16:50 dir=LONG tp=160.723 r=1.56 sl=159.726 mode=1SWING div=regular`; UJPROBE ltf=+1.0 at 16:50/16:55.
- Window/balance proof j27:15 Tester testing-of USDJPY from 2026.05.25; j27:41 Core testing-of 2026.05.25; j27:58631 final balance 10395.28 (j25 10324.99); j27:66900 740873 ticks 4320 bars; j27:66904 connection closed. DONE PASSED 04:56:45.

## MCAND_J25 on j27 rows raw (Monthly-POC LONG; UJPROBE ltf per bar 15:25-16:55)
j27:35757 `[SRJ-EA] 2026.06.05 15:25:00 STATE IDLE->S1_REGIME dir=LONG poi=Monthly-POC`
j27:35758 `[SRJ-EA] ANCHOR_ELECT bar=2026.06.05 15:20 action=SEED poi=Monthly-POC rank=6 tier=3 dir=LONG`
j27:35833 `[SRJ-EA] 2026.06.05 15:50:00 STATE S1_REGIME->S2_LTF_ALIGN dir=LONG poi=Monthly-POC`
j27:35834 `[SRJ-EA] 2026.06.05 15:50:00 STATE S2_LTF_ALIGN->S3_ZONE_WAIT dir=LONG poi=Monthly-POC`
j27:36228 `[SRJ-EA] LTFFLIP bar=2026.06.05 16:00 dir=LONG poi=Monthly-POC state=S3_ZONE_WAIT - LTF bias turned against the locked direction`
j27:36230 `[SRJ-EA] UJDEFERABORT bar=2026.06.05 16:00 dir=LONG poi=Monthly-POC state=S3_ZONE_WAIT - LTF opposed, abort deferred past evaluation (Fix S-a)`
j27:36398 `[SRJ-EA] UJDEFERAPPLY bar=2026.06.05 16:00 dir=LONG poi=Monthly-POC - deferred LTF abort applies, holder unchanged (Fix S-a)`
j27:36399 `[SRJ-EA] 2026.06.05 16:05:00 ABORT reason=LTF_MISALIGN state=S3_ZONE_WAIT poi=Monthly-POC dir=LONG`
j27:36401 `[SRJ-EA] 2026.06.05 16:05:00 STATE S3_ZONE_WAIT->ABORT dir=LONG poi=Monthly-POC`
j27:36410 `[SRJ-EA] 2026.06.05 16:10:00 SHADOW_CONVERT fail=LTF_MISALIGN dir=LONG poi=Monthly-POC` (shadow only, no candidate)
- UJPROBE ltf: 15:00-15:25 -1.0; 15:30-15:55 +1.0; 16:00 -1.0; 16:05-16:55 +1.0 (per-bar unique).

## W1 PLANNER_CONTEXT.md before/after
Before Roles: `- Planner: the SuperApp AI in the operator's dedicated SuperApp thread for this project. Read-only GitHub access through the SuperApp GitHub connector. No terminal, cannot push.`
After Roles: `- Planner: the AI planner session the operator opens (his SuperApp thread, or a PromptQL bot - used again from relay B-57). Read-only GitHub access. No terminal, cannot push.`
Before History tail: `- 2026-10-06: planner moved to SuperApp (relay B-52).`
After History tail: same line plus `- 2026-10-07: planner session ran as a PromptQL bot for relay B-57; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).`

(End of slice)
