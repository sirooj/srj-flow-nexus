GRADE RECON62-B222K: KEEP entries exact 7/7; KEEP exits exact 5/7; NEVER fires 0; MACHINE-ONLY ungraded 1; trades 8
GRADE EU0525TD-B222K: KEEP entries exact 7/8; KEEP exits exact 4/8; NEVER fires 3; MACHINE-ONLY ungraded 12; trades 22
# BUILDER RESULT B-228 - RESTORED (EURUSD): F5 reading 1, why the long run has no Yearly line
Trader summary: Your long run prints no Yearly line because it refuses your seed at the start: the walk begins 25 May but the checkpoint seam is 26 June, and the tester has served no ticks there yet. The short run starts 26 August, past the seam, so it adopts the checkpoint and carries Yearly values. The probe proves price bars reach back to January 2025 on both runs, but no ticks come with them. Machine Yearly prices equal yours where both print (8 Sep Yearly 1.16114, 1 Sep break 1.15987). B-229 installs one tester-only undo-able change so the long run adopts the same checkpoint.
## Relay order (B-228 F5-YEARLY-DEPTH 1 of 3; probe ran and was undone)
- Part 0 on builder/B-228 cut at 0da3dc8 (backup exact; rev-parse HEAD at cut + before commit). Python 3.13.16. Reads per 0.3 (pointer, RESULT/SLICE_B227W, EU_FIX_PLAN F5, REGISTER_TRUTH.csv, grade_register.py, DEPTH_B206, RESULT/SLICE_B226 R2/R3/IDX, REGISTER A2/A3/A5/A7 + C F4, SPEC 2.md/3.7, rules/19+43+47). Gate: log-1 0da3dc8, status 836 ACCOUNTED, gated diff EMPTY, SHAs kept b4db21c5/61829f05 + tini c725e437, CUT pair at sizes, ledger ^1374=1 ^1375=0, no terminal64. POI marker src 5af5e035 / ex5 e5cbe1a2 = B-206 kept, no later kept POI SHA anywhere. G0 grader lines match B-227W lines 1-2 byte-for-byte (commands in slice).
- Part B: review batch unanswered, open; nothing banked. Part W: W1 docstring + template Part T both ALREADY-CORRECT (five args in order); W2 both FINDs count 1 APPLIED (PK-4 memory lines).
- Part K (print-only, always restored): K0 NO CONFLICT. K1 backups POI src 5af5e035 + ex5 e5cbe1a2 + terminal.ini c725e437 content. K2 [POI][DEPTH] print at marker lines 2071-2078 (walk value used: g_measuredDepth). K3 probe hunk inserted once (braces 233/233 -> 234/234). K4 compile 0 errors 0 warnings; probe src 3c9939ea / ex5 511bc747; .B228P copies verified.
- Part R (TOOLS/job_f5_yearly.py, one pass per kept cut): R1 code map (slot-Y CALENDAR 1 Jan; seed SRJ_SEED_EURUSD.bin + ckpt SRJ_CKPT_EURUSD.bin in Common\Files, 216116/617ff927 + 10267420/075c44ec, 8/20 writes; adopt = seedPeriod==host==seam, refusals listed; fold reads native ticks + checkpoint records; EA reads Yearly buffers, EMPTY_VALUE = missing). R2 census (RECON substring-3061 vs B-226 residual-2835 pattern named, EU 0 both; RECON adopted YES foldFrom 26.06 ckpt 254041 records, EU FLOOR adopted NO + no SEED/CKPT rows). R3 machine 8 Sep YPOC 1.16114 SAME + YVWAP 1.16317, 7 Sep YPOC 1.15987 + YVWAP 1.16318 vs his 1.16315, 1 Sep 17:45 YPOC 1.15987 SAME; EU all ABSENT. R4 probe rows (RECON walk 25.05 m1n 145539 e1 0 ticks 0 = BARS-ONLY; EU walk 1970 depth 0 m1n 372013 ticks 0 = BARS-ONLY). R5 Y2 ADOPT-FIX for B-229 (full hunk in carried note; predictions EU A3 entry, A2 exit, A5 exit; RECON unchanged).
- Part T: T1 RECON62-B228P full (dates written + read back; ex5 511bc747 pre/post; D: 153.1 GB -> 147.9 GB): Test passed 11:46:24; cut 1052907 lines; DEALS 16 identical; grader == B227W line 1, no STOP. T2 EU partial (dates written + read back; leftover PID 1280 stopped per B-43): window verified 25.05 + [B228YD], past 26 May 12:00, stopped by PID; cut 891929 lines; no grade (partial). T3 restored POI src 5af5e035 + ex5 e5cbe1a2 + tini c725e437, all verified; no terminal64.
- Part X: pointer State B-228 + PK-4 entry + Lane F5 1/3 + Next B-229 (35 lines); ledger 1375; FIXPLAN F5 State B-228; LESSONS fold L3 + B228-SEAM-AHEAD (130 chars); READ_MAP rewritten.
- Part F: RESULT_B228 + SLICE_B228; ledger; pointer; READ_MAP; size gate in slice; stage explicit paths only (probe scripts/cuts uncommitted); commit + push via backup, ls-remote verify; housekeeping per 01b (B228P cuts not the kept baseline).
- Timing: gate + reads ~20m; K + compile ~10m; R ~15m; T1 ~10m (incl wrapper stall, direct relaunch); T2 ~10m; records ~15m; commit/push follow.
## Final disk state
- RESTORED: POI src 5af5e035 / ex5 e5cbe1a2 (= .preB228, verified); EA b4db21c5/61829f05 untouched; terminal.ini c725e437; no terminal64. Python 3.13.16. Review batch REPORT/REVIEW_BATCH_B227W.md open (unanswered).
## Carried note
- R5 pick for B-229: Y2 ADOPT-FIX (tester-gated seam refusal). R2 names the refusal that hits only the long run: seed parsed but checkpoint SKIPPED, SEED_NOT_ACCEPTED, no ticks served at the 26 June seam, because the walk starts 25 May, ahead of the seam. Y1 does not apply (both probe runs are BARS-ONLY and the fold reads ticks, not bars); Y3 does not apply (R4 is not NO). Predictions only: long-run 4 Sep 16:00 entry appears, 1 Sep exit becomes the 17:45 Yearly break 1.15987, 7 Sep target moves toward 1.16318; short run unchanged.
- Full hunk for B-229 (Indicators/SRJ_POI_Marker.mq5 kept lines; FIND -> REPLACE, no new number):
FIND 2241-2260:
2241:       else if(reach == 0)
2242:         {
2243:          string whyR = StringFormat(
2244:             "no ticks served at seam %s across 3 trading day(s)",
2245:             POI_TimeMsAsSec(adoptSeamMs)
2246:          );
2247: 
2248:          if(InpRefuseSeamHole)
2249:            {
2250:             g_seedRefusal = whyR;
2251:             g_seedLoaded  = false;
2252: 
2253:             PrintFormat(
2254:                "[POI][SEED] pass=%I64d stage=REFUSED reason=SEAM_UNREACHABLE "
2255:                "seam=%s tradingDaysProbed=3 detail=\"%s\"",
2256:                g_passId,
2257:                POI_TimeMsAsSec(adoptSeamMs),
2258:                whyR
2259:             );
2260:            }
REPLACE (one-line condition + marker; body unchanged):
         // [B229YD] tester-gated seam refusal (B-229 diagnostic, always restored)
         if(InpRefuseSeamHole && !MQLInfoInteger(MQL_TESTER))
- Live terminal behavior unchanged (MQL_TESTER false); short run unchanged (reach==1 never enters the branch); long run adopts the same 254041-record checkpoint the short run carries.
