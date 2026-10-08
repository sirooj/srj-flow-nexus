# BUILDER SLICE B-118 - raw spots, diff, compile, run proof, grade rows, STOP checks, SHAs (suppression trial, RESTORED)

Scope: one narrow S3-arm suppression edit + one compile + RECON62 gate + June grade + restore-on-STOP. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-117` = `ee3a49649e92d0ac833fd693bc9eb1d182b1605b` (verified; cut builder/B-118 here).
- `git log -1` = `ee3a496 B-117 current kept-build June UJ fidelity grade (relay B-117)`.
- `git status --short` line count = 445 (pre-existing transition-work M files + untracked artifacts, preserved untouched, none staged).
- `git diff ee3a49649e92d0ac833fd693bc9eb1d182b1605b -- <6 stage paths>` EMPTY on every committed file named.
- EA disk `137076d9cf85160ab8cd8379575afd4801e71098ce97c0b10d88a42c7bf59671` LF same (CR=0, 695359 B). EX5 `fa4c924978f6...` (465572 B). Indicator `956bf3e3...` (70308 B) / EX5 `27b5f272...` (236500 B). Includes D542B458/80A466AC/5D14FCE2 (record only).
- terminal64 count 0 pre-launch. [Tester] read back exact both windows (RECON62 EURUSD 1787702400/1788998400; June USDJPY 1779667200/1781308800) + content preserved (`terminal.ini.preB118` 3604CBD0) + full `Profiles.preB118` backup (135 files). No STOP.

## PART B GREPS (before/after)

- Operator message = B-118 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- Lane-close block in relay SKILL.md FOUND line 69 -> `ALREADY_BANKED`; appended nothing.
- `B118-4JUN-SHORT-FALSE-FIRE` in 99_WORKFLOW 0->1 (context X1). `B-118` in 99_WORKFLOW 0->1 (handoff X2).
- `B118-4JUN-SHORT-FALSE-FIRE` in SRJ_FlowNexus_Local 0->1 (ledger 1263). `^1263.` 0->1; `^1262.` = 1 beside.
- Banked 4 June words: strategy skill line 198 verbatim B-70 veto + line 199 0604-LDN-NOT-HIS paraphrase; register section C line 50; journal rows 13 (4H Bear/1H Bull/15m Bull, D AVP, 'invalid XOB') + 314 (NOT HIS TAKE 09:55 SHORT + three reasons). Journal 1066 lines, NOT APPENDED.

## RAW SOURCE SPOTS (kept build, before edit; EvaluateClosedBar S3 block EA:8766)

- EA:8766 `if(g_state == ST_S3_ZONE_WAIT)` opens the S3 block (zone pick EA:8800-8803; S3INPLAY print EA:8964-8976 over s31 ladder BAR/SWING1/SWING2/SWINGLEG).
- EA:9203 `if(haveXob && !haveFvg && s31_zHi > 0.0 && s31_zLo > 0.0)` ... EA:9282 `s31_inPlay = t133_inPlay;` (Task-133 commit overwrite; S3INPLAY keeps the legacy verdict per EA:9176 placement note).
- EA:9308 `if((haveFvg || haveXob) && s31_inPlay)` -> EA:9314 `g_state = ST_S4_ARMED` (same-bar UJCONFIRMCARRY EA:9340; else-branch S3-waiting + CONFIRM_PREBIND EA:9391).
- Bias/CQD sites (untouched): S2SEEDBIAS_KILL EA:8708; UJDEFERAPPLY EA:8751-8758; ELIGSTATE/RGATE below EA:9419.

## DIFF (complete, vs .preB118; +7/-1, one transition)

```
@@ -9200,6 +9200,12 @@
       bool     t133_haveStop = false;   // hoisted mirror of s3_haveStop for the print

+      //--- [B-118] counted-candle XOB in-play verdict (the S3INPLAY result
+      //--- printed above) captured before the Task-133 commit overwrite below.
+      //--- The arming gate must not advance on a commit-only verdict while the
+      //--- recorded in-play result is false. No new selector, no touch rule.
+      bool s31_s3Counted = s31_inPlay;
+
       if(haveXob && !haveFvg && s31_zHi > 0.0 && s31_zLo > 0.0)
@@ -9305,7 +9311,8 @@
                      (int)t133_haveStop);

-      if((haveFvg || haveXob) && s31_inPlay)
+      //--- [B-118] arm only when the recorded S3INPLAY verdict is also true.
+      if((haveFvg || haveXob) && s31_inPlay && s31_s3Counted)
```

- Edited src `.B1184JUN` = disk `097C7B84B38188D817C51B103A7D00EF312A855A3D4F04E2B4EB3FBAF1827A24` (695808 B, CR=0; LF-normalized identical).
- Scope from diff text: only s31/haveFvg/haveXob; zero FL_BUF_/payload/bias/CQD/target/stop/exit/concurrency lines.

## COMPILE (raw)

- `Result: 0 errors, 0 warnings, 6507 ms elapsed, cpu='X64 Regular'`; ok=true; binary_fresh=true.
- Trial EX5 `.B1184JUN` = `979DFE6FA33BD90E82F3F31C6C96E92406F90E6CB8A7145303C8916F38066405` (466208 B), never staged.
- Owned notes: 3x `compile_and_deploy` WinError-32 lock with zero compiler output (no terminal/metaeditor process; exclusive-open probe OK); 1x syntax-only ok=true 0/0; 1x full compile ok=true 0/0. Code unchanged between calls.

## RECON62 RUN PROOF (T2-T3; trial EX5 ran)

- Launch `launch_recon62_b118.ps1` (RECON50_DEMO_USD.ini byte-identical); WMI_PID=12388 RC=0; STATUS RUNNING with history synced (05-25 -> 05-26 bars, lines 71441 -> 85863 in ~30 s); window line `testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.08.26 00:00 to 2026.09.10 00:00`; wrapper killed post-verify (terminal 3956 survived); watcher 14412 PID-verified.
- Completion (direct UTF-16 64 KB tail read; DONE never written - see watcher defect): `EURUSD,M5: 563338 ticks, 3168 bars generated ... Test passed in 0:02:46.176` (same scale as reference; slot fix active).
- Deals (complete; only deals in-window): #2 sell 08-28 10:05 1.16466 + #3 buy 11:45:02 1.16440; #4 buy 09-01 17:35:01 1.16024 + #5 sell 17:51:04 1.15975; #6 buy 09-04 16:00 1.16019 + #7 sell 23:55 1.16129; #8 buy 09-07 09:20 1.16138 + #9 sell 10:53:07 1.16201; #10 buy 09-07 16:45 1.16264 + #11 sell 17:13:30 1.16315; #12 sell 09-08 10:10 1.16205 + #13 buy 10:42:46 1.16102; #14 sell 09-08 17:00 1.16220 + #15 buy 17:26:29 1.16275. All seven register-A entries exact; zero must-never fires. RECON62 UNCHANGED -> June authorized.

## JUNE RUN PROOF (T4-T5; trial EX5 ran)

- Launch `launch_june0525_b118.ps1` (USDJPY_DEMO_JUNE.ini byte-identical); WMI_PID=7652 RC=0; STATUS RUNNING synced (05-25 -> 05-26); window line `testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.05.25 00:00 to 2026.06.13 00:00`; wrapper killed post-verify (terminal 8416 survived); watcher 20880 PID-verified.
- Completion (direct tail read): `USDJPY,M5: 740873 ticks, 4320 bars generated ... Test passed in 0:03:31.513` (same scale as B101/B106/B117).
- Deals (complete; only deals 5/25-6/12): #2 buy 05-27 15:35 159.344 + #3 sell 20:08:14 159.535; #4 buy 06-03 09:10:00 159.932 + #5 sell 09:59:40 159.983; #6 sell 06-04 09:55:00 159.868 + #7 buy 10:40:20 159.920; #8 buy 06-05 16:55:00 160.120 + #9 sell 19:16:32 160.298; #10 buy 06-11 14:40:22 160.530 + #11 sell 15:23:06 160.588. No deals 06-01/06-02/06-05-morning/06-08/06-09/06-10/06-12.
- Grade: 2JUN silent / 3JUN MATCH / 4JUN STILL FIRES (deal #6) / 5JUN-LDN silent / 5JUN-NY 16:55 (no 16:15 deal, defect unchanged) / 11JUN MATCH / 10JUN silent. Changed deals/refusals/timestamps vs kept: NONE.

## 4 JUNE ROWS (kept 04:53 block vs B118 05:15 block, Core 04)

- Kept 09:50 pass (eval 09:45): S3INPLAY inPlay=0 via=none (zone 160.001-160.012 vs bar 159.850-159.895); INPLAYCOMMIT committed=1 legacy=0 changed=1 (applied=1 bounded=1 swings=20 hits=2 firstShift=95 firstVal=160.011); STATE S3_ZONE_WAIT->S4_ARMED; S3 zone src=XOB adopted; 09:50 CONFIRMPOLL touchAttr=1 confirm=1; S4->S5; ELIGSTATE cqd=UNREAD livePass=1; RGATE seedBT=09:10 livePass=1; SIGNAL; deal #6.
- B118 09:50 pass (eval 09:45): S3INPLAY inPlay=0 (same zone/bar/swings); INPLAYCOMMIT committed=1 legacy=0 changed=1; **`S3 waiting: no qualifying zone`** (gate HELD); CONFIRM_PREBIND_FAIL (confirm=0 term=B_BODY); FRESHSKIP PRE_BINDING; CQDRECHECK state=S3_ZONE_WAIT; SUPPRESSED heldState=S3_ZONE_WAIT action=HELD.
- B118 09:55 pass (eval 09:50): S3INPLAY **inPlay=1 via=SWINGLEG** (bar 159.860-159.886 close 159.868 sw1=159.895@1); INPLAYCOMMIT legacy=1 committed=1 changed=0 (swings=21 hits=2 firstShift=96 firstVal=160.011); gate passes (both true) -> S4 -> CONFIRMPOLL 09:50 confirm=1 -> S5 -> RGATE seedBT=09:10 livePass=1 -> SIGNAL -> deal #6 sell 09:55:00 at 159.868.
- Finding: arm-block works on its target bar; the same candidate arms one bar later when the recorded ladder flips to in-play=1 via a 96-bar-old swing witness. InPlay=0-arm suppression alone is INSUFFICIENT.

## STOP CHECKS + RESTORATION (raw SHAs)

- T6: 4 June remains a fire -> STOP and restore (applied). All other T6 lines pass (listed in result).
- Verdict RESTORED (trial ran both windows; STOP rules required undo; evidence complete).
- Source restored from `.preB118`: `137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671` (kept, 695359 B).
- EX5 restored from `.preB96` copy: `FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5` (kept; `.preB82`/`.preB84` carry the same bytes; `.preB87` does NOT - 41CFD4CE, never used).
- Indicator src/ex5 untouched at gate SHAs. terminal.ini restored-verified `3604CBD0`; Profiles restored (135 files both sides). Leftover terminals stopped by PID (3956, 8416) before restore.

## WATCHER DEFECT (owned)

- DONE never written on either run though both genuinely PASSED (RECON62 05:08:31; June 05:16:59). Cause: both watcher launches passed only `-RunName`; `watch_run.ps1` mandates `-DayLog` + `-StatusPath`, so each watcher sat on stdin (PIDs 14412/20880 alive, zero output). Completion verified by direct tail reads (skill fallback). Gate recorded in ledger: copy the usage line verbatim with all three args; re-check a live watcher PID against the direct tail read instead of blind re-polling. Skill file untouched (F3).

## RECORD LINES (exact)

- X1 context §4 appended once: `- B118-4JUN-SHORT-FALSE-FIRE (planner lesson 2026-10-09): tested one narrow pre-entry suppression of the 4 June false SHORT; 5 June 16:15 timing remains a separate unresolved defect.`
- X2 handoff §3 appended once: `- B-118: targeted the 4 June false SHORT; 5 June 16:15-versus-16:55 remains a separate unresolved fidelity defect.`
- X3 ledger `1263.` appended once (tag `B118-4JUN-SHORT-FALSE-FIRE`; edit + backup SHAs; RECON62/June tables + grades; 4 June reroute; 5 June timing; silence/take outcomes; restoration SHAs; watcher defect + gate; no rule invention).
- X4 pointer updated (cap 35): latest B-118 RESTORED; 4 June fires via next-bar arming; 5 June 16:15 separate; kept EA/EX5 restored; next relay chooses; goal open.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1262.` = 1; staged set = 6 relay files only; no source/EX5/journal/log/settings diff; run tables match the filed deal lists above.

(End of slice)
