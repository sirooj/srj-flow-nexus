TASK 155-REG: COMPLETED
Authorization consumed: 155REG-A1 (single use)
Production files modified: NONE
Compile: NOT PERFORMED
Chart attach: NOT PERFORMED
Orders placed: NONE
Timestamp: <fill, e.g. 2026-09-05T22:0x:xx+07:00>

Commands that failed: six measurement pairs executed before the Stage 5 extraction commands
that create their targets — Get-ChildItem Length and (Get-Content).Count against each of
D:\Videos\Task 155REG Signals.txt, Aborts.txt, Armings.txt, FreshSkip.txt, FreshCount.txt,
Suppressed.txt. Raw error text, same form for all six:
  Get-ChildItem : Cannot find path 'D:\Videos\Task 155REG <name>.txt' because it does not exist.
  CategoryInfo : ObjectNotFound; FullyQualifiedErrorId : PathNotFound
Re-run after extraction: all six pairs succeeded. The 0 figures printed beside each failed
(Get-Content).Count are an artifact of .Count on a failed command, not measurements, and are
discarded. No tester failure occurred; the authorized retry was not consumed; the raw log was
not touched.
Splits declared: none
Truncations: none

PRE-FLIGHT BACKFILL — retained Task 135 log, pre-run, no authorization consumed
  real-ticks journal line, verbatim:
  HE      0       17:24:16.353    Core 04 EURUSD,M5 (Dukascopy-demo-mt5-1): generating based on real ticks
  BIASCENSUS_FINAL, verbatim:
  RF      0       17:49:46.752    Core 04 2026.08.21 23:59:58   [SRJ-EA] BIASCENSUS_FINAL bars=1728 | sh1 neg=699 zero=0 pos=1029 empty=0 other=0 fail=0 | sh2 neg=700 zero=0 pos=1028 empty=0 other=0 fail=0
  SRJ XOB-PROMOCENSUS 372 | ZONEPICK bar= 54 | TPCENSUS 174 | TPCENSUS winner=NONE 4 |
  INPLAYCOMMIT 54 | XOBPROMO bar= 54 | ZONECENSUS_FVG 0
  baseline log provenance: D:\Videos\Task 135 Full Logs.txt | 702962 bytes | 3719 lines
  SUPPRESSED opp=0, two-stage: 22
  Every expected value returned exact. Backfilled gate targets adopted: S3 evaluation bars 54,
  TPCENSUS 174.

STAGE 1  sixteen hashes, supplied vs observed
  SRJ_FlowNexus_EA.mq5 | supplied 0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322 (packet 3.4, probable-current) | observed 0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322 | MATCH — CONFIRMED
  SRJ_FlowLogic.mq5 | supplied 1EA7858F9B1A8F4F42D90D58A0BB8873063D874E40E32A6A4E69DD8099F73B08 (S1) | observed 1ea7858f9b1a8f4f42d90d58a0bb8873063d874e40e32a6a4e69dd8099f73b08 | MATCH (case-insensitive)
  SRJ_State.mqh | supplied C6D56BC197AF8585517CDA2038780F281329BCE32B1A9978AA5EA71ECC2EFD2E (S1) | observed c6d56bc197af8585517cda2038780f281329bce32b1a9978aa5ea71ecc2efd2e | MATCH (case-insensitive)
  SRJ_OrderblockMgr.mqh | supplied 524D5D40AC1F0C2F6909F01742DFE13FC9A4954118A55B3008FE1CD80D18E60F (S1) | observed 524d5d40ac1f0c2f6909f01742dfe13fc9a4954118a55b3008fe1cd80d18e60f | MATCH (case-insensitive)
  SRJ_ImbalanceMgr.mqh | supplied 64CF32756A6A1EB417F2A4A33793F43A27FDDD11D243F5D84F5CB8F0880502AE (S1) | observed 64cf32756a6a1eb417f2a4a33793f43a27fddd11d243f5d84f5cb8f0880502ae | MATCH (case-insensitive)
  SRJ_BiasEngine.mqh | supplied FC1E3871F07439D418D628C3FCDD9A77A1604CBD3A3920296E3F278051E4092B (S1) | observed fc1e3871f07439d418d628c3fcdd9a77a1604cbd3a3920296e3f278051e4092b | MATCH (case-insensitive)
  SRJ_Alerts.mqh | no admissible target | observed a9c9c2ef9e53253d4a1b31de73fb23028d326922d6a655123128f19061ebcdec | RECORDED-NO-TARGET
  SRJ_Draw.mqh | no admissible target | observed fd2b3716d319e34fe904fd593ee8e4ad80479349667150fb5d08f24cf496183e | RECORDED-NO-TARGET
  SRJ_Fractals.mqh | no admissible target | observed e4b99da55ab278853c6d8fa9bc8fac599306d01e6e5b14ab64682e3f04473597 | RECORDED-NO-TARGET
  SRJ_HTFEngine.mqh | no admissible target | observed d0b0641278b5885b726b6fdf2797f4a7f4737bcb48c82bf83350ce04df76ce26 | RECORDED-NO-TARGET
  SRJ_Panels.mqh | no admissible target | observed 199ad6b104cce28a30aa610a632c1fffa42f1d529280e24c33519b81c700c736 | RECORDED-NO-TARGET
  SRJ_SeedFormat.mqh | no admissible target | observed d94b49225f3110c31d5cd66f4fc679721fa5e9a04b8eafcc6c7dba6f2db4eed4 | RECORDED-NO-TARGET
  SRJ_Sessions.mqh | no admissible target | observed a0c8542a4f25dab78d2a7fbbc8cb4eddef87643164cb5038ffbbec27040b0886 | RECORDED-NO-TARGET
  SRJ_Text.mqh | no admissible target | observed 2825d071778e624e4b5837b05954582c215d439441d44cd57b6f4d11ac0e3455 | RECORDED-NO-TARGET
  SRJ_TickCore.mqh | no admissible target | observed 89730c6cadfa86f4da7e09877d282bdb1741bd623678ccfb73e7a77d49fea27c | RECORDED-NO-TARGET
  SRJ_Types.mqh | no admissible target in this packet | observed 773d99444b958b98ce3aeca87690f40b743a5f6a71e47ba9e644d751808e78dc | RECORDED-NO-TARGET (record note 4)
  Hex case: supplied values uppercase, certutil observed lowercase; compared case-insensitively.
  SRJ_FlowLogic.ex5, dir /-c file line, before — required 2026-09-05, 226444 — MATCH:
  09/05/2026  05:39 PM            226444 SRJ_FlowLogic.ex5
  SRJ_FlowNexus_EA.ex5, dir /-c file line, before — RECORD:
  08/30/2026  10:31 AM            115438 SRJ_FlowNexus_EA.ex5

STAGE 2  harness as set, eleven items: EURUSD | M5 | 2026.08.14 – 2026.08.22 | every tick
  based on real ticks | 10000 JPY | 1:100 | SRJ_FlowNexus_EA | InpDebugLog=true | InpMode=0
  MODE_ALERT_ONLY | optimisation OFF | visual mode OFF. No source file opened in MetaEditor;
  no Compile All, at any point.

STAGE 3  tester start 20:58:51.163 (KL Tester "SRJ_FlowNexus_EA.ex5" AVX2)
  tester finish 21:25:50.858 (MG Core 04 connection closed)
  duration 26 min 59.7 s (expected ~25 — record note 2)
  raw log: D:\Videos\Task 155REG Full Logs.txt | 1005333 bytes | 6577 lines | NOT relayed

STAGE 4  real-ticks journal line, verbatim — PRESENT:
  LE      0       20:59:00.154    Core 04 EURUSD,M5 (Dukascopy-demo-mt5-1): generating based on real ticks
  SRJ XOB-PROMOCENSUS: 372 (required 372; 607 would void) — PASS
  BIASCENSUS_FINAL, verbatim — bars=1728 fail=0 — PASS:
  RJ      0       21:25:50.853    Core 04 2026.08.21 23:59:58   [SRJ-EA] BIASCENSUS_FINAL bars=1728 | sh1 neg=699 zero=0 pos=1029 empty=0 other=0 fail=0 | sh2 neg=700 zero=0 pos=1028 empty=0 other=0 fail=0
  byte-identical to the baseline line from 2026.08.21 23:59:58 onward, sh1/sh2 included.

STAGE 5  gate table, target vs observed
  Signals              1    1   PASS
  Aborts              22   22   PASS
  Candidates seeded   23   23   PASS
  Armings             12   12   PASS
  S3 evaluation bars   54   54   PASS (target backfilled pre-run)
  FRESHSKIP          141  141   PASS
  FRESHCOUNT           22   22   PASS (printed lines)
  SUPPRESSED           43   43   PASS
  TPCENSUS            174  174   PASS (target backfilled pre-run)
  ZONEPICK=INPLAYCOMMIT=XOBPROMO  equal  54=54=54  PASS
  ZONECENSUS_FVG        0    0   PASS
  extracts, path | bytes | lines:
  D:\Videos\Task 155REG Signals.txt | 148 | 1
  D:\Videos\Task 155REG Aborts.txt | 3218 | 22
  D:\Videos\Task 155REG Armings.txt | 1740 | 12
  D:\Videos\Task 155REG FreshSkip.txt | 21352 | 141
  D:\Videos\Task 155REG FreshCount.txt | 3990 | 22
  D:\Videos\Task 155REG Suppressed.txt | 9565 | 43
  cross-checks, not gate rows: TPCENSUS winner=NONE 4 (baseline 4) | SUPPRESSED opp=0 22 (baseline 22)

STAGE 6  observed signal line, verbatim:
  KG      0       21:06:44.019    Core 04 2026.08.17 16:20:01   [SRJ-EA] ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-VWAP | NYAM | R=1.42 SL 1.15870 TP 1.16141 spr=2
  from [SRJ-EA] onward: IDENTICAL. The simulated timestamp 2026.08.17 16:20:01 also matches the
  baseline; journal tag and wall clock differ, per the packet's non-determinism note.

STAGE 7  sixteen hashes re-computed post-run: all sixteen EQUAL to STAGE 1; each re-observed
  digest character-identical to its STAGE 1 value (values as recorded at STAGE 1).
  SRJ_FlowLogic.ex5, dir /-c file line, after — UNCHANGED:
  09/05/2026  05:39 PM            226444 SRJ_FlowLogic.ex5
  SRJ_FlowNexus_EA.ex5, dir /-c file line, after — UNCHANGED:
  08/30/2026  10:31 AM            115438 SRJ_FlowNexus_EA.ex5
  The "bytes free" line of both dir outputs differs before/after (10263003136 -> 18274570240);
  disk free space, not file provenance; the file lines are identical.

STAGE 8  report: 06_HANDOFFS\BUILDER_RESULT_155-REG.md | bytes: <fill> | lines: <fill>
  (figures from the post-write verification read)

RECORD NOTES, none gating:
  1. Raw log 6577 lines / 1005333 bytes vs baseline Task 135 log 3719 lines / 702962 bytes.
     Every gate-table counter, both census lines, and the signal line are identical to baseline.
  2. Duration 26 min 59.7 s vs packet expectation ~25 min. Like-for-like span (real-ticks line
     to BIASCENSUS_FINAL) 26 min 50.7 s vs baseline 25 min 30.4 s.
  3. SRJ_FlowNexus_EA.ex5 on disk 115438 bytes, 2026-08-30 10:31, vs packet Stage 1 figure
     115062; verdict column RECORD; unchanged across the run.
  4. Packet Stage 1 says "nine remaining .mqh" with no recorded value; sixteen files less six
     with admissible targets leaves ten, all ten hashed and recorded. SRJ_Types.mqh carries a
     recorded digest in BUILDER_RESULT_155-R2.md 8.3(a) that this packet's Stage 1 does not cite;
     "nine" is consistent if Types is counted as targeted there.
  5. Operator slip, declared above: measurement block run before extraction; re-run clean;
     no retry consumed.

OVERALL VERDICT: BYTE-IDENTICAL