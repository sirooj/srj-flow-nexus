TASK 160-REG-R2: COMPLETED — outcome DIVERGENT AT 1 POINT. Disposition per packet PURPOSE: BLOCKED-FOR-COUNCIL. No revert performed. Nothing diagnosed, nothing attributed.
Authorization consumed: 160REG-A2
Production files modified: NONE      Source files written: ZERO
Compile: NOT PERFORMED
Chart attach: NOT PERFORMED   Orders placed: NONE   Deletes: ZERO
Timestamp: 2026-09-06, run window 20:57:04.185–21:29:07.938 (journal clock)
P17 attestation: every path used was the literal path stated in this packet; no filename search, glob, -Recurse, wildcard or Navigator selection was used for any of the sixteen files or either log. Run plumbing outside that file set is declared under RUN PLUMBING.
P10 attestation: no compile was performed.
Report channel: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local
Commands that failed: two shell-integration output-capture failures (capture layer, not command failures) on the STAGE 3 collection command and its first re-issue. Raw text, same form both times:
  [Command completion could not be observed; the command may still be running and must not be assumed to have succeeded.]
  Both re-issued to completion. The raw-log transcode is deterministic and was written twice byte-identically: 1005470 = (journal 2010942 - 2) / 2. No figure derives from an unverified run.
Splits declared: none   Truncations: none
Items reported NOT DERIVABLE: gate rows Aborts, Candidates seeded, S3 evaluation bars, Armings (STAGE 4d). Cross-check figures TPCENSUS winner=NONE 4 and SUPPRESSED opp=0 22 not derivable from either raw log (not gate rows).

RUN PLUMBING (declared; outside the packet's sixteen-file set):
  terminal64.exe: C:\Program Files\Dukascopy MetaTrader 5\terminal64.exe — located via uninstall-registry and Start-Menu shortcut scan over seven literal candidate paths, chosen first because the baseline journal names server Dukascopy-demo-mt5-1; correctness verified by the run's journal appearing in this data folder (DF\Tester\logs\20260906.log).
  Launcher ini written: DF\config\160REG-R2-tester.ini (281 bytes, ASCII). [Tester] Expert=SRJ_FlowNexus_EA.ex5 | Symbol=EURUSD | Period=M5 | Model=4 | FromDate=2026.08.14 | ToDate=2026.08.22 | Deposit=10000 | Currency=JPY | Leverage=100 | Optimization=0 | Visual=0 | ShutdownTerminal=1 | ReplaceReport=1 | UseLocal=1 | UseRemote=0 | UseCloud=0; [TesterInputs] InpDebugLog=true | InpMode=0. Every other EA input at default.

STAGE 1  sixteen MATCH, none changed. EA target = BUILDER_RESULT_160-R2.md 5d (93d3639c778416d899750b81a1ce8395f96acb66ddbd6be1455dbf583744eced), observed equal; the other fifteen targets parsed from the STAGE 1 SECTION ONLY of BUILDER_RESULT_160-PreL.md (its lines 15-119; that report's own EA row 0f1f44cb.. NOT used). Comparison case-insensitive.
  EA byte size / integer line count: 191970 / 3850 — exact.
  Artifact FILE LINES, before:
  09/06/2026  06:42 PM            118130 SRJ_FlowNexus_EA.ex5
  09/05/2026  05:39 PM            226444 SRJ_FlowLogic.ex5

STAGE 2  2a configuration verbatim (BUILDER_RESULT_155-REG.md STAGE 2, eleven items): EURUSD | M5 | 2026.08.14 – 2026.08.22 | every tick based on real ticks | 10000 JPY | 1:100 | SRJ_FlowNexus_EA | InpDebugLog=true | InpMode=0 MODE_ALERT_ONLY | optimisation OFF | visual mode OFF.
  2b eleven gate rows, quoted as they appear:
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
  2c signal line verbatim from [SRJ-EA] onward: [SRJ-EA] ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-VWAP | NYAM | R=1.42 SL 1.15870 TP 1.16141 spr=2 — P8a fingerprint 372 — P9 bars=1728.
  2d baseline raw log D:\Videos\Task 155REG Full Logs.txt: exists, 1005333 bytes, 6577 lines — both exactly as expected. NOT RELAYED.
  2e baseline tag table (derivation at 4a): distinct keys 43, lines matched 5992, UNTAGGED 3457.

STAGE 3  configuration used: the ini under RUN PLUMBING above — field-identical to 2a on all eleven items (symbol, timeframe, model, date range, deposit, leverage, EA, both input values, optimisation OFF, visual mode OFF). CHARACTER-IDENTICAL TO BASELINE.
  3a new raw log: D:\Videos\Task 160REG-R2 Full Logs.txt | 1005470 bytes | 6580 lines. NOT RELAYED. Provenance: byte-image of journal DF\Tester\logs\20260906.log (UTF-16LE, 2010942 bytes) minus BOM, transcoded to UTF-8 no BOM — the same transformation the baseline log provably is for 20260905.log.
  3b P8, verbatim, PRESENT: CN        0       20:57:24.830    Core 04 EURUSD,M5 (Dukascopy-demo-mt5-1): generating based on real ticks
  3c P8a: 372 — REAL TICKS (607 would void). No stop.
  3d P8b, verbatim, NEW RECORD (baseline carries none): EJ        0       20:57:24.830    Core 04 2026.08.14 00:00:00   SRJ BUILD 2026.09.05 17:39:20 refOk=invOnly diag=v9_perm
  3e P9: bars=1728, beside baseline 1728 — IDENTICAL; full BIASCENSUS_FINAL line byte-identical from the simulated timestamp onward:
    EE        0       21:29:07.931    Core 04 2026.08.21 23:59:58   [SRJ-EA] BIASCENSUS_FINAL bars=1728 | sh1 neg=699 zero=0 pos=1029 empty=0 other=0 fail=0 | sh2 neg=700 zero=0 pos=1028 empty=0 other=0 fail=0

STAGE 4  4a the derivation, applied identically to both logs (the same function, twice): lines containing the literal [SRJ; from each, discard everything up to and including the LAST ']'; from the remainder take the FIRST whitespace-delimited token; if that token is solely A-Z, 0-9, underscore and >= 4 chars it is the TAG KEY, else UNTAGGED; frequency table over the whole file.
    baseline: distinct 43, matched 5992, UNTAGGED 3457 (file lines 6577)
    observed: distinct 43, matched 5992, UNTAGGED 3457 (file lines 6580)
  4b DIFFERENCE SET: EMPTY. Aggregate line: 43 of 43 keys count-identical. (No agreeing rows pasted, per packet.)
  4c  matched-line counts: baseline 5992, observed 5992 — IDENTICAL.
      total file line counts: baseline 6577, observed 6580 — DIFFERENT (+3). Raw output beside this figure — every journal content line whose count differs (per-line random tag / 0 / wall-clock prefix stripped):
      baseline=1 observed=0 delta=-1 [Core 04	1118 Mb available, 13 blocks set for ticks generating]
      baseline=1 observed=0 delta=-1 [Core 04	113 Mb memory used including 10 Mb of history data, 64 Mb of tick data]
      baseline=1 observed=0 delta=-1 [Core 04	129 Kb of total initialization data received]
      baseline=0 observed=1 delta=1  [Core 04	132 Kb of total initialization data received]
      baseline=1 observed=0 delta=-1 [Core 04	2026.08.14 00:00:00   SRJ CQD timing [full recalc] window=30.00 days, src=CQD_PRICE_BID | CopyTicksRange: 1169717 ticks in 129.8 ms | classify loop: 1169717 ticks in 31.0 ms (37723.1 k ticks/s) | total 160.8 ms | resets=21]
      baseline=0 observed=1 delta=1  [Core 04	2026.08.14 00:00:00   SRJ CQD timing [full recalc] window=30.00 days, src=CQD_PRICE_BID | CopyTicksRange: 1169717 ticks in 342.6 ms | classify loop: 1169717 ticks in 57.8 ms (20251.3 k ticks/s) | total 400.3 ms | resets=21]
      baseline=0 observed=1 delta=1  [Core 04	70 Mb memory used including 10 Mb of history data, 64 Mb of tick data]
      baseline=1 observed=0 delta=-1 [Core 04	EURUSD,M5: 321404 ticks, 1728 bars generated. Environment synchronized in 0:00:00.017. Test passed in 0:26:56.982 (including ticks preprocessing 0:00:00.016).]
      baseline=0 observed=1 delta=1  [Core 04	EURUSD,M5: 321404 ticks, 1728 bars generated. Environment synchronized in 0:00:00.061. Test passed in 0:31:49.615 (including ticks preprocessing 0:00:00.079).]
      baseline=1 observed=0 delta=-1 [Core 04	EURUSD,M5: total time from login to stop testing 0:26:56.999 (including 0:00:00.017 for history data synchronization)]
      baseline=0 observed=1 delta=1  [Core 04	EURUSD,M5: total time from login to stop testing 0:31:49.676 (including 0:00:00.061 for history data synchronization)]
      baseline=1 observed=0 delta=-1 [Core 04	EURUSD: load 27 bytes of history data to synchronize in 0:00:00.000]
      baseline=0 observed=1 delta=1  [Core 04	EURUSD: load 27 bytes of history data to synchronize in 0:00:00.002]
      baseline=1 observed=0 delta=-1 [Core 04	expert file added: Experts\SRJ_FlowNexus_EA.ex5. 115470 bytes loaded]
      baseline=0 observed=1 delta=1  [Core 04	expert file added: Experts\SRJ_FlowNexus_EA.ex5. 118162 bytes loaded]
      baseline=1 observed=0 delta=-1 [Core 04	log file "C:\Users\winar\AppData\Roaming\MetaQuotes\Tester\3CA1B4AB7DFED5C81B1C7F1007926D06\Agent-127.0.0.1-3003\logs\20260905.log" written]
      baseline=0 observed=1 delta=1  [Core 04	log file "C:\Users\winar\AppData\Roaming\MetaQuotes\Tester\3CA1B4AB7DFED5C81B1C7F1007926D06\Agent-127.0.0.1-3003\logs\20260906.log" written]
      baseline=1 observed=0 delta=-1 [Tester	"SRJ_FlowNexus_EA.ex5" AVX2]
      baseline=0 observed=1 delta=1  [Tester	"SRJ_FlowNexus_EA.ex5" X64]
      baseline=0 observed=1 delta=1  [Tester	automatic testing finished]
      baseline=0 observed=1 delta=1  [Tester	Cloud servers switched off]
      baseline=0 observed=1 delta=1  [Tester	Local network farm switched off]
      baseline=0 observed=1 delta=1  [Tester	USDJPY: history check started]
      Channel composition, mechanical: Core 04 6561 -> 6560 (-1); Tester 16 -> 20 (+4). Net +3.
  4d  the eleven gate rows. Derivation basis declared per row; the 4a tag table is the primary instrument. Seven rows derived, all IDENTICAL:
      Signals             baseline 1, observed 1   IDENTICAL (count of lines containing ALERT SRJ SIGNAL; 155-REG records the signal line verbatim and its Signals extract = 1 line)
      FRESHSKIP           baseline 141, observed 141   IDENTICAL (4a tag-key count; 155-REG's FreshSkip extract line count coincides exactly)
      FRESHCOUNT          baseline 22, observed 22   IDENTICAL (4a tag-key count; 155-REG marks the row "(printed lines)")
      SUPPRESSED          baseline 43, observed 43   IDENTICAL (4a tag-key count; coincides with 155-REG's Suppressed extract line count)
      TPCENSUS            baseline 174, observed 174   IDENTICAL (4a tag-key count; 155-REG's own derivation unrecorded, figures coincide in both logs)
      ZONEPICK=INPLAYCOMMIT=XOBPROMO  baseline 54=54=54, observed 54=54=54   IDENTICAL (4a tag-key counts)
      ZONECENSUS_FVG      baseline 0, observed 0   IDENTICAL (key absent from both tables)
      Four rows NOT DERIVABLE, named, not guessed: Aborts; Candidates seeded; S3 evaluation bars; Armings. 155-REG records extract files with line counts but not their derivation patterns; no tag-key counterpart exists; the 4a table does not depend on these rows.
  4e  signal line, observed, verbatim: MQ        0       21:10:32.987    Core 04 2026.08.17 16:20:01   [SRJ-EA] ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-VWAP | NYAM | R=1.42 SL 1.15870 TP 1.16141 spr=2
      From [SRJ-EA] onward: IDENTICAL to the baseline signal line. Count of such lines: baseline 1, observed 1. Journal tag and wall clock differ, per the packet's non-determinism note. SL 1.15870 did not move.
  4f  ONE LINE, MECHANICAL: DIVERGENT AT 1 POINT.
      N = 4b difference set (0) + 4c DIFFERENT rows (1: total file line counts) + 4d DIFFERENT rows (0) + 4e DIFFERENT rows (0) = 1. NOT DERIVABLE rows not counted.

STAGE 5  sixteen hashes re-computed post-run: sixteen EQUAL, none changed.
  SRJ_FlowNexus_EA.ex5, dir /-c file line, after - UNCHANGED:
  09/06/2026  06:42 PM            118130 SRJ_FlowNexus_EA.ex5
  SRJ_FlowLogic.ex5, dir /-c file line, after - UNCHANGED:
  09/05/2026  05:39 PM            226444 SRJ_FlowLogic.ex5

STAGE 6  report persisted: 06_HANDOFFS\BUILDER_RESULT_160-REG-R2.md (this file). Resolved absolute path:
  C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_160-REG-R2.md
  Post-write verification read: delivered as the final line of this file.

TASK 160-REG-R2 VERDICT, five lines, mechanical only:
  provenance: P8 present, P8a 372, P9 1728, P8b "SRJ BUILD 2026.09.05 17:39:20 refOk=invOnly diag=v9_perm"
  configuration: CHARACTER-IDENTICAL TO BASELINE
  tag tables: 43 of 43 keys count-identical, difference set size 0
  behaviour vs Task 155REG: DIVERGENT AT 1 POINT
  tree: sixteen EQUAL, both artifacts UNCHANGED

OVERALL VERDICT: DIVERGENT AT 1 POINT — BLOCKED-FOR-COUNCIL. No revert. No diagnosis. No attribution.

RECORD NOTES, none gating:
  1. Run duration: journal "Test passed in 0:31:49.615" vs baseline "Test passed in 0:26:56.982" (both lines pasted verbatim at 4c). Journal wall clock 20:57:04.185 - 21:29:07.938.
  2. The +3 total-line difference decomposes mechanically as 13 content lines observed-only and 10 baseline-only (all 23 pasted at 4c); by channel, Tester +4 and Core 04 -1. No attribution is made.
  3. The tester loaded the EA as "X64" where the baseline journal records "AVX2", and "expert file added ... 118162 bytes loaded" vs baseline "115470 bytes loaded" (verbatim at 4c). No attribution is made. The on-disk artifact file line is UNCHANGED before/after the run (STAGE 1/STAGE 5).
  4. The four new Tester-channel lines and the one baseline-only Core 04 line are pasted verbatim at 4c. No attribution is made.



STAGE 6  post-write verification read: 13863 bytes | 122 lines (complete file, including this line)
