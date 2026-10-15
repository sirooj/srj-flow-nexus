# BUILDER SLICE B-228 - raw rows (F5 reading 1 + probe; RESTORED)
Base: builder/B-228 cut at 0da3dc8 (= B-227W head). Verdict RESTORED (probe ran, undone).
## Start gate
```
log-1 0da3dc894f86279c4a31c83e137463b249e1651d (backup exact; B-228 cut here; rev-parse HEAD at cut + before commit).
diff 0da3dc8 EMPTY on pointer + RESULT_B227W + SLICE_B227W + REGISTER_TRUTH + grade_register + REVIEW_BATCH + EU_FIX_PLAN + LESSONS + READ_MAP + PLANNER_* + both skills + register. Status 836 (+1 helper script vs 835 = ACCOUNTED).
Disk SHAs: EA src b4db21c5 / ex5 61829f05; tini c725e437 (live config verified). CUT_B222K pair present (163994231/602470995 B). Ledger ^1374=1 ^1375=0 pre. No terminal64. Python 3.13.16.
POI marker Indicators/SRJ_POI_Marker.mq5 src 5af5e035 / ex5 e5cbe1a2 = B-206 kept; results B-207..B-227W name no later kept POI SHA (B-205 trial keep .B205K same pair). ACCOUNTED, K+T run.
G0 commands + output (byte-equal to RESULT_B227W lines 1-2; earlier False was UTF-16 capture artifact, text True):
python .../TOOLS/grade_register.py .../ROWPACK/DEALS_RECON62-B222K.csv .../REGISTER_TRUTH.csv RECON62-B222K 2026-08-26 2026-09-09
GRADE RECON62-B222K: KEEP entries exact 7/7; KEEP exits exact 5/7; NEVER fires 0; MACHINE-ONLY ungraded 1; trades 8
python .../TOOLS/grade_register.py .../ROWPACK/DEALS_EU0525TD-B222K.csv .../REGISTER_TRUTH.csv EU0525TD-B222K 2026-05-25 2026-10-15
GRADE EU0525TD-B222K: KEEP entries exact 7/8; KEEP exits exact 4/8; NEVER fires 3; MACHINE-ONLY ungraded 12; trades 22
```
## Part W (W1 ALREADY-CORRECT x2; W2 APPLIED count 1 x2)
```
W1 docstring "Usage: python grade_register.py <DEALS_csv> <REGISTER_TRUTH_csv> <run_name> <from YYYY-MM-DD> <to YYYY-MM-DD>" count 1 = five args in order. Template Part T grader line count 1 = five args in order. No edits.
W2 MEMORY "lines a planner agent saves to its own memory (kit PK-2)" -> "(kit PK-4)" count 1 APPLIED. "questions to him only as record-checked chart calls" -> "take grades and open rule questions reach him only through the review batch, record-checked first." count 1 APPLIED.
```
## Part K (K0 NO CONFLICT; print-only)
```
K1 backups: POI mq5.preB228 5af5e035 + ex5.preB228 e5cbe1a2 (B-212 beside-source); terminal.ini.preB228 c725e437 (content).
K2 spot (kept numbering; probe file +20): 2071 PrintFormat( / 2072 "[POI][DEPTH] pass=%I64d measured=%s measuredOn=%s unresolved=%d probeDays=%d", / 2073 g_passId, / 2074 POI_TimeSec(g_measuredDepth), / 2075 POI_TimeSec(g_depthMeasuredOn), / 2076 g_depthUnresolved, / 2077 InpDepthProbeDays / 2078 ); context: 2055-2063 POI_MeasureTickDepth(_Symbol, InpDepthProbeDays, g_depthUnresolved). Walk value used: g_measuredDepth.
K3 hunk inserted once (braces 233/233 -> 234/234; B228YD string count 2 = one hunk: comment + print tag; .preB228 0).
K4 compile_b228_poi.log: Result: 0 errors, 0 warnings. Probe src 3c9939ea / ex5 511bc747; .B228P copies verify equal.
```
## Part R (job_f5_yearly.py; YEARLY_B228.csv columns run,ea_sha,journal_line,date,time,tag,slot,line,value,raw)
```
R1 spots: slot-Y start CALENDAR 1 Jan (SEED_SLOT 2425/2450 prints filePeriodStart=2026.01.01); seed SRJ_SEED_EURUSD.bin (216116 B/617ff927) + ckpt SRJ_CKPT_EURUSD.bin (10267420 B/075c44ec) in Terminal\Common\Files, writes 8/20; adopt = seedPeriod==hostPeriod==seamPeriod (2401) else FILE_PERIOD_DIFFERS_* (2406-2417); ckpt want[] = adopted && active && cnt>0 && anchor+period match (847-865), refusals SEED_SLOT_NOT_ADOPTED/FILE_SLOT_INACTIVE/NO_RECORDS/ANCHOR_TYPE_MISMATCH/PERIOD_START_MISMATCH; FLOOR_SLOT 2828-2836 (reachesFloor = engineOpen && trueStart>=engineFloor); fold reads NATIVE ticks + checkpoint records (SRJ_SeedFormat.mqh: continues folding native ticks); EA reads POI_BUF_Y_POC=8/Y_VWAP=9 via iCustom InpPoiMarkerName (EA 12404), EMPTY_VALUE = missing (EA 8973/8982 B196 print NA).
R2: YRLY-substring RECON 3061 / EU 0; B-226 residual 2835 (tag-consumed rows excluded) - pattern difference named, EU 0 both ways. RECON slot-Y SEED CALENDAR JL8671330 + FLOOR adopted YES foldFrom 26.06 JL8671355 + CKPT_META adopted YES records 254041 + CKPT_RESULT ACTIVE first 1.1 last 26.06 JL8671337/8671343. EU slot-Y FLOOR adopted NO ckActive NO foldFrom 0 JL9724235; zero SEED_SLOT + zero CKPT-Y rows. EU zero-explained: [POI][CKPT] SKIPPED SEED_NOT_ACCEPTED "no ticks served at seam 2026.06.26 10:00:00 across 3 trading day(s)" (EU cut, 1 row); RECON CKPT_SLOT_META 13 rows. FOUND.
Yearly days RECON 11 (8.26:172 ... 9.04:382); 1Sep n=316, 7Sep n=282, 8Sep n=265. EU 0 days. YEARLY_B228.csv rows (RECON only).
R3 machine vs his: 8Sep 16:55-17:05 EXITCENSUS YPOC 1.16114 JL9696547 SAME + YVWAP 1.16317 JL9696548; EU ABSENT. 7Sep 16:40-16:50 YPOC 1.15987 JL9682126 + YVWAP 1.16318 JL9682127 vs his target 1.16315 (DIFF +3 on VWAP); EU ABSENT. 1Sep 17:40-17:50 EXITCENSUS 17:35/17:40 YPOC 1.16077 -> 17:45 WINLINE ADD YPOC 1.15987 JL9627701 + EXITCENSUS 1.15987 JL9627713 + MTEXIT POI_BODY_BREAK 1.15987 JL9627718 SAME as owed; EU ABSENT.
R4 raw: RECON62-B228P JL13017730 [B228YD] sym=EURUSD walk=2026.05.25 10:00 m1n=145539 m1first=2026.01.02 00:04 e1=0 tk0102n=0 e2=0 serFirst=2025.01.02 termFirst=2025.01.02 + SEED_SLOT ADOPTED JL13017740 + FLOOR adopted YES JL13017765 = BARS-ONLY. EU0525TD-B228P JL14070637 [B228YD] sym=EURUSD walk=1970.01.01 00:00 m1n=372013 m1first=2025.01.02 00:00 e1=0 tk0102n=0 e2=0 + FLOOR adopted NO JL14070649 = BARS-ONLY (walk 1970 = depth 0; EU T2 partial to 26May 12:00).
R5: Y2 ADOPT-FIX (refusal hits EU only); Y1 n/a (fold reads ticks); Y3 n/a (R4 not NO). Hunk + predictions in carried note.
```
## Part T (one terminal session; ex5 = .B228P pre/post each run; D: 153.1 -> 147.9 GB)
```
T1 RECON62-B228P full: dates 1787702400/1788998400 written + read back ([Tester] single pair; [TickLoad] pair untouched). Launch wrapper stalled on 4.3GB journal pre-read (WS 3GB, documented deviation, wrapper killed, no terminal had launched). Direct Start-Process launch PID 1280 (script file). Window verified (replay 26.08 + init rows). Test passed 11:46:24. Cut 1052907 lines (JL 13017621-14070527). DEALS_RECON62-B228P.csv 16 deals, all side/date/time/price identical to B222K. Grader == B227W line 1. No STOP.
T2 EU0525TD-B228P partial: leftover PID 1280 stopped per B-43; dates 1779667200/1791849600 written + read back; ex5 511bc747 verified; ini copied (25.05-10.13 window). Launch PID 8468. Window verified (replay 25.05 + [B228YD] + FLOOR slot-Y). Past 26 May 12:00 server (replay reached 04.06). Stopped by PID. Cut 891929 lines (JL 14070528-). No grade (partial, never compared).
T3 restored POI src 5af5e035 + ex5 e5cbe1a2 (= K1, verified) + terminal.ini c725e437 content (verified); no terminal64. Timing: T1 launch->pass ~7m; T2 ~5m window.
```
## Part X records
```
Pointer State B-228 + PK-4 entry + Lane F5 1/3 + Next B-229 (35 lines). Ledger 1375. FIXPLAN F5 State B-228. LESSONS fold L3 + B228-SEAM-AHEAD (130 chars). READ_MAP rewritten (+ job_f5_yearly.py, YEARLY_B228.csv, DEALS_RECON62-B228P.csv).
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4466/35 PASS; result 6149/20 PASS; slice 7825/56 PASS (this file); CONTEXT 8743 PASS; MEMORY 604 PASS; FIXPLAN 14034 PASS; 01b 16571 PASS; TRUTH 1600 PASS; GRADER-TOOL 3687 PASS; F5-JOB 5626 PASS; YEARLY 1195795 data PASS; B228P-DEALS 721 PASS; LESSONS 20038 disk / 19908 LF PASS; ARCHIVE 1745 PASS; READ_MAP rewritten. Register untouched. Strategy skill untouched (rules read only).
```
## Timing + final disk + housekeeping
```
Wall: gate + reads ~20m; K + compile ~10m; R ~15m; T1 ~10m; T2 ~8m; records ~15m; commit/push follow.
Final disk RESTORED: POI src 5af5e035 / ex5 e5cbe1a2; EA b4db21c5/61829f05; tini c725e437; no terminal64.
Housekeeping per 01b (B228P cuts are not the kept baseline; day logs + B222K cuts kept; nothing deleted).
```
(End of slice)
