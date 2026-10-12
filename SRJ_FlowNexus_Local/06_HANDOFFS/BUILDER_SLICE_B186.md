# BUILDER SLICE B-186 - seeder/probe spots, SHAs, table samples

Base: builder/B-186 cut at 74ae90c (backup exact). No EA/include/indicator edit, no compile, no run. STOP before S2 (reason first).

## Seeder + probe spots (located by text, read-only)
- Script: `Scripts/SRJ_POI_Seeder.mq5` v2.00 (+`.ex5` present): pre-folds archive into 6 accumulators; header :1-86 (seam window v1.10: measured depth <= seam <= newest archive tick :83-85; depth walk v1.21 :68-76; ckpt v1.20 :78-81). Inputs: archive/native symbols :96-97 (defaults EURUSD_RAW/EURUSD), AUTO seam `InpSeamServer = ""` :129, depth150 :131, margin60 :136, binPips 0.1 :104 (= EA `InpPoi_BinPips = 0.1` :42), weightMode 0 :105 (= EA `InpPoi_WeightMode = 0` :43). EA handle: `iCustom(..., InpPoiMarkerName, InpPoi_UseSeed, InpPoi_BinPips, InpPoi_WeightMode)` (EA :11912-11913; `InpPoi_UseSeed = true` :41).
- EA probe (`Indicators/SRJ_POI_Marker.mq5`): seed block :2043-2168 (SEEDFILE/PARSED/COMPATIBLE/REFUSED/FINAL prints); `InpRefuseSeamHole = true` :125; triple-match adoption :2306-2307 (`seedPeriod == hostPeriod && seedPeriod == seamPeriod`); Q/Y truncated without seed :2161-2168; ckpt skipped if refused :2438 (`SKIPPED reason=SEED_NOT_ACCEPTED`).
- Yearly anchor = 1 January (`SRJ_TickCore.mqh` AnchorStartFor :383-384). Format: `SRJ_SeedFormat.mqh` SEED_Write :323-401 (FILE_COMMON :331), FNV-1a init :169, Put I/L/D/Str :279-309.
- S1 SHAs: GBPUSD seed `0f67b6ed` + ckpt `5954bc9d` (`.preB186` MATCH); EURUSD `617ff927`; USDJPY `9f2d33cc`; terminal.ini `78d143fa`; Charts 19 files 0 mismatch.

## Why S2 stops (measured)
1. Chart Script unrunnable headless/tester (no CLI path; GUI attach only; scope: no new EA, no compile - no runner buildable).
2. AUTO seam needs the in-tester depth probe (depth + 60d, both ends); any offline seam = hand-picked date (forbidden); tester serving at pass=1 unknowable offline (EU depth June-1 vs GU depth 0 on the same log).
3. Tick containers opaque: zero timestamp-likes in 8KB `202606.tkc` (LE/BE, seconds/ms); `.hcc` 0/200 plausible M1 records at all standard headers/strides.

## Table samples
- O1 LIVETERM_B186.csv (7 rows): CONFIRM_STRUCT_FAIL 15:50 bar=15:45 SHORT term=A_OPP both builds (day-log 9749096/10688307); STATE IDLE->S1 14:55 (pack 1538); REGIMECENSUS 0/0 14:55-15:45, trendOk=1 only 15:50 (packs 1540-1865); S1->S2->S3->S4 inside 15:50 pass (1865-1874); kill 15:55 (1902).
- O2 TPPOOL_0707_B186.csv (6 rows): 1.33747 = XOB-2855 low (B152PR pack 115); pool source NOT PRINTED (method :12343: 18 session buffers + uj_pool + 12 POI lines); post-exit lows vs band strict NOT FOUND; VALUE-DIFFERS UNKNOWN; MTEXIT 16:50 TP_TOUCH + DEAL 16:54:59 (16:50-bar last second, exact).
- O4-new: 14:15 o 1.34293 h 1.34300 l 1.34260 c 1.34286 (B176HZ pack 1305); machine Y-POC NOT PRINTED.
- X5: F2/F3 B186a quotes verbatim (count 2, distinct); defects NOTE. Skill EXIT-JOURNAL-THOROUGH + journal 327 (unstaged).
(End of slice)
