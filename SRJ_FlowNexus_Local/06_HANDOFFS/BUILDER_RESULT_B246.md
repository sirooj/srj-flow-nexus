GRADE RECON62-B242K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B241D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 4; MACHINE-ONLY ungraded 0; trades 17
GRADE RECON62-B246D: KEEP entries exact 4/7; KEEP exits exact 3/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 4
GRADE EU0525TD-B246D: NOT RUN (T3 gate: RECON keeps worse, no EU launch)
# BUILDER RESULT B-246 - RESTORED (EURUSD): kill mark survives, leg-scope too tight, D2
Trader summary: Your 25 June block now stays dead once killed, proven 1,317 times on the short run. But the new zone test is too strict the other way: it refuses your 4 September long, your 8 September evening short and your 2 September short because their zones were reached before the current leg started. Your other four keeps are unchanged. The change is undone.
## Relay order (B-246 EU-CLEAN 2 of 6; RESTORED D2 NARROW-NEXT)
- Part 0 on builder/B-246 cut at 5ada5ce (backup exact; builder/B-246 absent on GitHub pre-cut). Python 3.13.16. Reads per 0.3 in order (B-226 R1/S quoted). Gate: log-1 5ada5ce, gated diff EMPTY, kept SHAs + all 6 .B245D12K verified, tick STATIC 18678468, no terminal64, ledger ^1392=1 ^1393=0. Part B: M10JUN count 1 ALREADY_BANKED, no new words.
- Part K0/K1 in slice (rule quotes, writer list, panel leg-start spot NOT FOUND as named value -> built through; .preB246 x8 + K1 base verified). K2 KS: b246KmDead field + KM set + 2 activation skips with [B246KS] prints. K3: per-side leg starts (initial/flip/renewal) + ZS reach>=leg + KM-killed-at-KM-bar + 2 [B246ZS] rows/bar. Braces OB +2/+2 rest +0; markers per site; Flow 0 errors + 3 pre-existing warnings, EA 0/0. Trial EA 0a6affaf/2f61bd1a + Flow a14c76a8/0d28f876; .B246K 9 files verified pre-launch.
- Part T1/T2: RECON62-B246D (dates read back; WMI launcher; terminal PID 17388; PRE=17138629; window 2026.08.26 verified; launcher killed; watcher PID 5504 verified; DONE PASSED 14:54:56 ~4m). ex5 pre/post identical. Cut once (TOOLS/job_cut_b246.py: b245 + KS/ZS regexes; legStart-with-space fix owned here), grade raw in slice: 4/7 entries, 3/7 exits, NEVER 0, trades 4 (A3/A7/K2SEP MISSING).
- Part T3 gate fired (keeps worse) -> no EU launch. T5 code D2: ZG REFUSE v0 rows refuse A3 (9-04 15:55 LONG, leg 15:35), A7 (9-08 16:40 SHORT, leg 16:30), K2SEP (9-02 14:40 SHORT, leg 14:40); keeps pass with legs 25-65 min old (KSLEG_B246.csv: 643 rows). KS proven (1317 skips, live site) but its 25 Jun EU effect untested. T6 restore verified (kept SHAs, 23 charts, tini, no terminal64). .B246K unstaged.
## Final disk state
- Restored: EA 18a1d49b/d85cf7d2 + Flow a8201128/61177aa5 + Types d542b458 + OB 915b4fc3 + Imb d9a38776 + Bias 0b334063 + State 2e4f8a95 + POI d47a0e68/04fcd8a5, terminal.ini from .preB246, 23 chart files, no terminal64. .B246K unstaged (9 files). Review batch: REPORT/REVIEW_BATCH_B246.md (no new machine rows; 10 Jun item carried, not re-asked).
## Record checklist (grep-verified in staged files)
- X EU_FIX_PLAN F2+F3 State B-246 + folds + archive: FOUND
- X LESSONS fold + archive: FOUND
- X ledger 1393 + pointer State B-246 + Lane 2/6: FOUND
- T DEALS_RECON62-B246D + cut + grade + KILL + KSLEG + day packs: FOUND
- Q batch carry-forward: FOUND
## Carried note
- Next roads (D2): (1) advance the per-side leg only when the renewal replaces the in-bias OB the panel adopts (not every flip/renewal event); (2) spec-3.5 swing-leg scope from the indicator's own swing points (B-245 K4 design). KS ships as-is inside either (25 Jun EU effect still to measure). No question to him.
- Next: planner decides.
