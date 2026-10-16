GRADE RECON62-B242K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B241D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 4; MACHINE-ONLY ungraded 0; trades 17
GRADE RECON62-B247A: KEEP entries exact 4/7; KEEP exits exact 3/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 4
GRADE RECON62-B247B: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B247B: KEEP entries exact 12/13; KEEP exits exact 11/13; NEVER fires 3; MACHINE-ONLY ungraded 2; trades 17
GRADE EU0525TD-B247A: NOT RUN (T2 gate: build A loses A3/A7/K2SEP on RECON)
# BUILDER RESULT B-247 - RESTORED (EURUSD): flip-leg too tight, kill-alone fixes 25 Jun but loses 8 Oct
Trader summary: Your 25 June short is finally refused: the killed 10:00 block stays dead through the entry, and the 10:45 take never fires. But two prices were paid. Your 4 September long, 8 September evening short and 2 September short are still refused because their zones were reached before the current leg started, even when the leg starts on a bias flip. And your 8 October short is refused because a dead rising block vetoes your short through the shared flag. Every other take is unchanged. The change is undone.
## Relay order (B-247 EU-CLEAN 3 of 6; RESTORED D2/D2)
- Part 0 on builder/B-247 cut at 8ef01ec (backup exact; builder/B-247 absent on GitHub pre-cut). Python 3.13.16. Reads per 0.3 in order (rules/17, rules/25, spec 3.3 quoted). Gate: log-1 8ef01ec, gated diff EMPTY, kept + all 9 .B246K verified, tick STATIC 18678468, no terminal64, ledger ^1393=1 ^1394=0. Part B: M10JUN count 1 ALREADY_BANKED.
- Part K0/K1 in slice (rule quotes, writer list, leg spots; .preB247 x9 + base verified). K1 build A: removed the 2 renewal leg-start writes (raw before/after in slice); flip/initial writes kept. Braces +0; markers unchanged; Flow 0 errors + 3 pre-existing warnings, EA 0/0. .B247AK 9 files verified (EA 0a6affaf/a6dab535, Flow 86368712). K2 build B: .B246K base + leg term removed (2 lines, slice); compiles 0/0; .B247BK 9 files verified (EA f075fcdc, Flow 387f2822/e7883c59).
- Part T1/T2: RECON62-B247A (WMI; 12m log-read start owned; terminal PID 14732; PRE=18435759; PASSED 16:16:31 ~7m) grade 4/7-3/7-0 (A3/A7/K2SEP MISSING) -> T2 fallback: restored A to kept SHAs, went T3. T3: RECON62-B247B (busy-refusal owned, retry terminal PID 19308; PRE=19733109; PASSED 16:46:33) grade 7/7-6/7-0 -> EU0525TD-B247B (terminal PID 10424; PRE=21027570; Test passed 17:34:39 ~31m) grade 12/13-11/13-3 + M8/M12. ex5 pre/post all runs identical. Cuts once per run (b246 cutter; b247 script committed + verified compiling, same rows + leg-source post-pass).
- Part T4 codes: build A D2 (A3 sideB leg 15:35 FLIP, A7 sideS leg 16:30 INITIAL, K2SEP sideS leg 14:40 INITIAL; EU NOT RUN). Build B D2 (K8OCT worse; N25JUN silent). T5 FLIPLEG_B247.csv (181 rows, leg-source INITIAL/FLIP/RENEWAL). T5 restore verified (kept SHAs, 24 charts, tini, no terminal64). .B247AK/.B247BK unstaged.
## Final disk state
- Restored: EA 18a1d49b/d85cf7d2 + Flow a8201128/61177aa5 + Types d542b458 + OB 915b4fc3 + Imb d9a38776 + Bias 0b334063 + State 2e4f8a95 + POI d47a0e68/04fcd8a5, terminal.ini from .preB247, 24 chart files, no terminal64. Review batch: REPORT/REVIEW_BATCH_B247.md (M12 new TREND item; 10 Jun carried, not re-asked).
## Record checklist (grep-verified in staged files)
- X EU_FIX_PLAN F2+F3 State B-247: FOUND
- X ledger 1394 + pointer State B-247 + Lane 3/6: FOUND
- X LESSONS fold + B-246 line: FOUND
- T DEALS x3 + cuts + grades + FLIPLEG + day packs: FOUND
- Q batch M12 new + 10 Jun carry: FOUND
## Carried note
- Cleanup (his order 2026-10-16, disks critical): deleted MQL5-logs 1014/1015 (77GB), Tester-logs 1014/1015 (14GB), 33 superseded CUTs (10.6GB), s4_b244/s4_b245; D 91->182GB, C 3.1->15GB. Standing rule for planner: each relay deletes superseded day-logs + trial CUTs, keeps current-trial + kept-baseline + today.
- Next roads (D2/D2): (1) direction-scoped kill flags (a dead bullish block must not veto a short; K8OCT via 18451); (2) wider leg (flip-start still ends A3/A7-class zones; rules/25). No question to him.
- Next: planner decides.
