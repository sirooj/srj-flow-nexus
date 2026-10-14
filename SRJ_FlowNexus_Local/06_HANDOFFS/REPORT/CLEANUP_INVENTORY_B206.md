# REPORT/CLEANUP_INVENTORY_B206 - disk inventory (read-only; nothing deleted, moved or staged as a delete)

Batch: B-206, 7 runs, one terminal session, verdict KEPT. All sizes measured 2026-10-14 after the batch, before the cut
(day-log bytes) and after filing (packs/CUTs). Nothing below was deleted; nothing is asked yet - pick from D4.

## D0 - free space
- D: 92.3 GB free before the first launch, 73.5 GB after the batch (batch used ~18.8 GB: Tester day log +2.9,
  MQL5 day log +~15.3, tick file growth the rest).
- C: 17.4 GB free before, 14.1 GB after (batch CUTs 1.47 GB + packs 0.06 GB + STATUS/DONE/scripts live here).

## D1 - measure by folder (GB + file count)
- Tester/logs (junction to D:\SRJ Venture\Tester-logs): 26.0 GB / 5 files before batch, +2.9 GB this batch.
- Tester tick history (bases/Dukascopy-demo-mt5-1/ticks): 0.99 GB / 121 files (monthly 202309.tkc-202610.tkc per pair;
  Custom 0.21 GB / 35, Default empty).
- MQL5/logs (junction to D:\SRJ Venture\MQL5-logs): 98.1 GB / 3 files (20261012 31.3, 20261013 51.5, 20261014 15.3).
- work-archive (D:\SRJ Venture\work-archive): 0.64 GB / 3849 files.
- 00_CURRENT_WORKING: 2.53 GB / 1415 files before batch (CUT class 2.49 GB / 9 files dominates); +1.47 GB B-206 CUTs
  + small STATUS/DONE/scripts after (about 4.0 GB now).
- 06_HANDOFFS/ROWPACK: 1.64 GB / 1390 files before; +61.7 MB B-206 packs (9 week + 41 day files) + INDEX + 4 DEALS.
- 06_HANDOFFS/REPORT: 0.024 GB / 106 files before; +5 B-206 files (FOMC_CHANGES, REVIEW, DEPTH, CLEANUP, + slice/result side).
- 06_HANDOFFS/JOURNAL_*: six tiny B-202 archive CSVs (under 1 KB each, committed record).

## D2 - largest 20 files and the batch's own output per run
Largest (GB | path): 51.5 MQL5/logs/20261013.log; 31.3 MQL5/logs/20261012.log; 15.3 MQL5/logs/20261014.log;
10.3 Tester/logs/20261013.log; 9.3 Tester/logs/20261012.log; 3.2 Tester/logs/20261011.log; 2.0 Tester/logs/20261010.log;
1.2 Tester/logs/20261014.log (pre-batch; +2.9 this batch); 0.58 CUT_EU0525TD-B202.log; 0.58 CUT_EU0525TD-B206T.log;
0.52 CUT_UJ0525TD-B202.log; 0.51 CUT_GU0525TD-B202.log; then B-202/B-206 short CUTs 0.14-0.16 each; 0.008 ckpt backups.
Batch output: day log +2.933 GB (886625150 to 3819499142); CUTs 1.466 GB (7 files);
packs 61.7 MB (9 week + 41 day + INDEX + 4 DEALS); MT5 tester reports ~0.2 MB (Files/MT5_*B206*);
tester tick cache growth in 202610.tkc (updated 07:20 during the long run).

## D3/D4 - grades and candidate list (totals each class frees; no candidate deleted here)
- CLEAR-AFTER-YOUR-OK (regenerable from a kept source; frees ~129 GB):
  - MQL5/logs 3 files, 98.1 GB (terminal-side logs; no record is cut from them; they regrow on every run).
  - Tester/logs 20261010 (2.01 GB), 20261011 (3.22 GB), 20261012 (9.34 GB), 20261013 (10.31 GB): every pack drawn
    from them is committed (pack journal_file census 20261009-13). Total 24.9 GB.
  - CUT_*.log 19 files, ~4.0 GB (9 old B-201/B-202 + 7 new B-206 + 3 cut_b*_run smalls; regenerable from day logs).
    Examples: CUT_EU0525TD-B206T.log 0.58, CUT_GU0525TD-B202.log 0.51, CUT_UJ0525TD-B202.log 0.52.
  - STATUS/DONE 522+ files, 0.005 GB (run markers; superseded by result/slice records).
  - launch_*.ps1 155 files + compile logs 16 files, ~0 GB (mirrored patterns + build echoes).
  - job_* scripts and job outputs (DEALS/GRADE working CSVs), ~0.002 GB (method lives in result files).
  - Stale .preB/.B source+ex5 copies (Indicators, Experts, Include, 00_CURRENT_WORKING), ~0.03 GB - all superseded,
    every byte recoverable from git history; current kept (.B205K src 5AF5E035 / ex5 E5CBE1A2, now on disk) excluded.
  - Uncommitted superseded packs (prior RESTORED/MEASURED trials: DEALS_B190/B197/B198/B200 sets + day files),
    93 files, 0.18 GB (B-206's own staged packs excluded from this number at write time).
  - Stale Profiles.preB* chart copies, ~0 GB (live Profiles excluded).
- HOLD (needed for a held or future run; not offered for clearing):
  - Tick history back to 25 May (whole 1.2 GB tick tree; the held year-start run needs it).
  - Tester/logs/20261014.log (3.8 GB): B-206 CUTs done and packs built, commit landing with this batch - flips to
    CLEAR after the B-206 push verifies.
  - Live checkpoints Files/SRJ_CKPT_GBPUSD.bin + SRJ_CKPT_USDJPY.bin (2 x 3 MB): the identity baseline adopts them
    (CKPT_SLOT_RESULT); deleting breaks reproducibility of the T1 reference.
  - Run inis (88 files, tiny): run reproduction.
  - work-archive (0.64 GB): his own archive.
  - MT5 tester reports in Files/ (~0.2 MB B-206 + older): not saved to REPORT, tiny, left alone.
- NEVER (the record; never touched):
  journal, ledger, register, strategy skill, pointer, PLANNER_CONTEXT, PLANNER_HANDOFF, committed packs and DEALS,
  kept sources (EA 7c392767, POI .B205K 5AF5E035, flow a8201128, Sessions 16573a5b), blessed terminal.ini chain
  (a5834591), live Profiles.

## D5 - day logs
- Tester 20261010 (2.01 GB): cut long ago, packs committed -> CLEAR-AFTER-YOUR-OK.
- Tester 20261011 (3.22 GB): same -> CLEAR-AFTER-YOUR-OK.
- Tester 20261012 (9.34 GB): same -> CLEAR-AFTER-YOUR-OK.
- Tester 20261013 (10.31 GB): B-202 long CUTs + packs committed -> CLEAR-AFTER-YOUR-OK.
- Tester 20261014 (3.82 GB): B-206 batch (7/7 PASSED, CUTs done, packs built, push pending) -> HOLD, flips to CLEAR
  after the push below verifies.
- MQL5 20261012/13/14 (31.3/51.5/15.3 GB): nothing cut from them, no pack source -> CLEAR-AFTER-YOUR-OK.

## D6 - where the space goes (trader words, one line per folder)
- Tester day logs (29 GB): every bar the machine replays, kept per day; only the day being graded is needed.
- Terminal MQL5 logs (98 GB): the terminal's own chatter, three days; no trading record is read from them.
- Tick history (1.2 GB): the price history every run replays; the held full-year run still needs it.
- Work archive (0.6 GB): old work files moved aside in October; your archive, untouched.
- Current-working cuts and markers (4.0 GB): run segments plus status files; the segments re-cut from the day logs.
- Row packs (1.7 GB): the committed per-day evidence; old trials' uncommitted packs (0.18 GB) are the only fat here.
- Reports (small): the filed record; never cleared.
