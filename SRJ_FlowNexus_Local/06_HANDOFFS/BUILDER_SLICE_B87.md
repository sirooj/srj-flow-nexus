# BUILDER SLICE B-87 - raw spots, diff, compile, RECON62 tables, STOP checks, restoration (STOP at RECON62; no June run)

Conventions: kept EA 137076D9 (695359 B, LF-only); diag source 5066BAB9 (+24/-0); diag EX5 41CFD4CE; kept EX5 FA4C9249; terminal.ini 88A0DEB1. j43 = RECON62-B81 (kept, 7/7); jB87 = RECON62-B87 (diag, PASSED 13:52:43, 563338 ticks, 3168 bars, bal 10422.36 vs j43 10474.64). No j47/j48 (no June run).

## K1 QUOTES (disk sources)

- Operator s177-178 (strategy skill, verbatim): "That 14:20 candle is annotated in my journal: there is no valid XOB retracement or touch there, so no setup ever forms for me. The machine buying at 15:35 (159.774, aiming at the 30 April high) is answering a touch I do not count."
- Spec v4.2 §3.6 table: "| **XOB** | **Not required.** A touch is **permitted** and is **never disqualifying**. |"; relaxation note: "An implementation must accept an XOB-sourced candidate whose opposing candle touches the zone **and** one whose opposing candle does not."; §10: "Permitted / not required / need not | accept either way ... | never [rejects]".
- B-86 R3: 2 June pick 159.679-159.694 promoT 11:30 NOT in play (0/0), FIRED r25.73 INVALID; 5 June pick 159.881-159.916 promoT 15:40 IN PLAY (xobInPlay=1), FIRED r1.44 (16:15) VALID.

## K3 RAW SPOTS (kept EA, by text)

- Signature :2481 `bool IsConfirmationCandle(const int barShift, const int anchorLine,` + :2482 `const ENUM_SRJ_DIR dir, string &failTerm, const bool allowReclaim = false)` (kept 5-param; zero `retestShift|g_b61RetestTime|B60C|uj60_` hits on disk).
- Call sites :9340 `if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm) && ...` / :9360 `bool cfPassZ = IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermZ);` / :9548 `if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))`.
- Selected zone :6911 `bool haveXob = ReadFlow(FL_BUF_XOB_ZONE_HIGH, xobHi, barShift) && xobHi != EMPTY_VALUE &&` (+ :6912 _LOW; same pair :8800-8801); promo :8790 `if(!ReadFlow(FL_BUF_XOB_PROMO_TIME, t123_promoT, barShift)) t123_promoT = -1.0;`.
- ZoneInPlay :7118 `bool ZoneInPlay(int barShift, double zHi, double zLo,`.
- Hunk-C ctx (B-84): decl :1111 `ENUM_SRJ_STATE   g_confirmFromState = ST_IDLE;`; ResetSequence :6808; seed `g_anchorBarTime = barTime` :8164/:8191/:8245/:8422; counted shift on kept = `g_anchorBarTime` via `iBarShift(..., true)` (B60C shift NOT FOUND - by design).

## K5 RAW DIFF (.preB87 -> diag; +24/-0)

```
@@ -2485,2 +2485,26 @@
    if(anchorLine < 0 || dir == DIR_NONE) { failTerm = "NO_ANCHOR"; return false; }
+   //--- [B-87 PICK-XOB-INPLAY-DIAG] selected-XOB in-play gate at counted source (always-restored; touch optional, never disqualifying; pick-only, no 5m bias, no threshold)
+   if(g_anchorBarTime > 0)
+     {
+      int b87_cntShift = iBarShift(_Symbol, PERIOD_CURRENT, g_anchorBarTime, true);
+      if(b87_cntShift >= 0)
+        {
+         double b87_xobHi = 0.0, b87_xobLo = 0.0;
+         bool b87_haveXob = ReadFlow(FL_BUF_XOB_ZONE_HIGH, b87_xobHi, b87_cntShift) && b87_xobHi != EMPTY_VALUE &&
+                            ReadFlow(FL_BUF_XOB_ZONE_LOW, b87_xobLo, b87_cntShift) && b87_xobLo != EMPTY_VALUE;
+         bool b87_inPlay = false;
+         if(b87_haveXob)
+            b87_inPlay = ZoneInPlay(b87_cntShift, MathMax(b87_xobHi, b87_xobLo), MathMin(b87_xobHi, b87_xobLo), 0.0, false);
+         if(InpDebugLog)
+            PrintFormat("[SRJ-EA] B87PICKXOB bar=%s cntBar=%s haveXob=%d xob=%s-%s inPlay=%d verdict=%s",
+                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
+                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, b87_cntShift), TIME_DATE|TIME_MINUTES),
+                        (int)b87_haveXob,
+                        b87_haveXob ? DoubleToString(MathMin(b87_xobHi, b87_xobLo), _Digits) : "-",
+                        b87_haveXob ? DoubleToString(MathMax(b87_xobHi, b87_xobLo), _Digits) : "-",
+                        (int)b87_inPlay,
+                        (b87_inPlay ? "PASS" : "REFUSE"));
+         if(!b87_inPlay) { failTerm = "B87_XOB_NOT_INPLAY"; return false; }
+        }
+     }
    double o1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1);
```

- SHAs: .preB87 137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671 (disk=LFnorm); diag 5066BAB96E1EFD9A02567221480B1693B80C2CEF583BF3915ABA5B8C7D40A8F5 (disk=LFnorm); `.B87PICKXOB` same as diag. Whitespace drift caught by diff review, reapplied byte-clean (python insertion, +24/-0 verified).
- K6 compile: `Result: 0 errors, 0 warnings, 16281 ms elapsed, cpu='X64 Regular'`; binary fresh; diag EX5 41CFD4CE642DA0F3F48579869F374B93EF33E3FE3367D7CACDAB58E13AF25E3F.

## T RUNS (provenance per row)

- T2: terminal64 none before runs. Content copies: terminal.ini.preB87, ex5.preB87, Charts.preB87 (39 files). RECON62 window set + read back: DateFrom 1787702400 / DateTo 1788998400. Script launches (b82-pattern). Wrapper verified: STATUS RUN/PID/TERMINAL_BUSY=False/PRE_JOURNAL_LINES + window line `EQ 0 13:34:47.697 Tester EURUSD,M5 ... testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.08.26 00:00 to 2026.09.10 00:00`. Watcher false-positive measured: premature DONE 13:34:44 from stale tail marker - removed, watcher killed, completion from wrapper new-segment scan.
- Attempt 1: stopped 13:37:41 `tester is stopped because the account has been changed` (16L). Attempt 2: agent disconnect 13:45:52 `history synchronization interrupted` + `connection closed` (15L). Both environment, not diagnostic. Leftovers cleared by PID.
- Clean RECON62-B87: DONE PASSED 13:52:43; gates: 3 ALERT SRJ SIGNAL rows (below), `final balance 10422.36`, BIASCENSUS_FINAL bars=3168, ZONECENSUS_FINAL bars=3168, WS161_CENSUS loads=3168 stores=3168 mismatch=0, `563338 ticks, 3168 bars ... Test passed in 0:02:54.812`; XOB_PROMOCENSUS 469; ARCHIVED 82532L (PRE 414698).

## T3 FILED-TRADE TABLE (before j43 kept 7/7 vs after jB87 diag 3/7)

- BEFORE (B81 kept, EA 137076D9): 8/28 SHORT FIRED 10:00 tp1.16364 r2.43 exit 11:40 BREAK 1.16439; 9/1 LONG FIRED 17:30 tp1.16077 r1.17 exit 17:50 SL; 9/4 LONG FIRED 15:55 tp1.16302 r1.66 exit DAY_CLOSE 1.16129; 9/7L LONG FIRED 09:15 tp1.16200 r1.76 exit TP 1.16200; 9/7NY LONG FIRED 16:40 tp1.16315 r2.34 exit TP 1.16315; 9/8L SHORT FIRED 10:05 tp1.16102 r1.94 exit TP 1.16102; 9/8NY SHORT FIRED 16:55 tp1.16114 r1.96 exit SL.
- AFTER (B87 diag, EA 5066BAB9): 9/4 LONG FIRED 15:55 tp1.16302 r1.66 ENTRY deal=2 exit DAY_CLOSE 1.16018->1.16129 IDENTICAL; 9/7L LONG FIRED 09:15 tp1.16200 r1.76 ENTRY deal=4 exit TP 1.16135->1.16200 IDENTICAL; 9/7NY LONG FIRED 16:40 tp1.16315 r2.34 ENTRY deal=6 exit TP 1.16261->1.16315 IDENTICAL. 8/28, 9/1, 9/8L, 9/8NY: NO FIRE.
- Diagnostic tie (EA 5066BAB9 rows): 674x `B87_XOB_NOT_INPLAY`; 1217x `B87PICKXOB`. 8/28: `bar=2026.08.28 09:55 cntBar=2026.08.28 09:55 xob=1.16492-1.16507 inPlay=0 REFUSE`. 9/1: `bar=2026.09.01 16:00 cntBar=2026.09.01 15:55 xob=1.15855-1.15862 inPlay=0 REFUSE` (seed path; 17:30 bar itself PASSed but seed refused upstream). 9/8: `bar=2026.09.08 16:05 cntBar=16:05 xob=1.16079-1.16140 inPlay=0 REFUSE`; `16:30/16:35 cntBar=16:30 xob=1.16362-1.16377 inPlay=0 REFUSE`; `17:25 cntBar=17:25 xob=1.16079-1.16140 inPlay=0 REFUSE`.
- Must-never check: zero 9/4-10:40 / 8/28-16:25 / 9/1-15:30 / 9/8-16:45 signals on both runs.

## T6 STOP CHECKS (right after the table)

- RECON62 deal disappears (4 valid: 8/28, 9/1, 9/8L, 9/8NY): STOP (hit).
- Known must-never fire remains: none appeared - no STOP.
- 5 June valid long disappears: June never ran - no STOP (ungraded, not claimed).
- Unrelated fire/refusal outside the named path: none (only B87-gated confirmations differ) - no STOP.
- Result not tied to diag SHA/journal: every row cites j43/jB87 + EA SHA - no STOP.
- Verdict: STOP at RECON62. No June run (T3). 2 June / 5 June / 27 August UNGRADED (B-86 stands).

## T7 RESTORATION (hashes)

- EA from `.preB87`: 137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671 ✓ (695359 B).
- EX5: FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5 ✓ via `.preB84` (defect owned: `.preB87` EX5 copy holds diag build 41CFD4CE - taken post-compile; recorded, unstaged, never a restore source; future gate: EX5 backup precedes compile).
- terminal.ini: 88A0DEB1924C8A1E68D0CDF1FCCFA7353C7027237259121EFE605C535A1E10D2 ✓.
- Charts 39/39 from content copies; no terminal64; `.B87PICKXOB` + `.preB87` on disk uncommitted, unstaged.

## X RECORDS (before/after)

- X1 BEFORE grep `B-87-PICK-XOB-INPLAY-DIAG` = 0 -> AFTER = 1 (lesson appended §4).
- X2 BEFORE grep `B-87` = 0 -> AFTER = 1 (arc line appended §3).
- X3 BEFORE grep tag = 0, last item 1231 -> AFTER item 1232 count 1.
- X4 pointer 22 -> 25 lines (cap 35): latest B-87 STOP, restored, next B-88 follows the grade.

(End of slice)
