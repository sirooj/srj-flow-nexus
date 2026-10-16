GRADE RECON62-B248D: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B248D: KEEP entries exact 12/14; KEEP exits exact 11/14; NEVER fires 3; MACHINE-ONLY ungraded 2; trades 17
GRADE RECON62-B248C: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B248C: KEEP entries exact 12/14; KEEP exits exact 11/14; NEVER fires 3; MACHINE-ONLY ungraded 2; trades 17
# BUILDER RESULT B-248 - RESTORED (EURUSD): in-bias scope no-op, per-kind reach no-op on NEVERs
Trader summary: Your 25 June short stays refused and every keep except two is exact on both builds. Your 8 October short still does not fire: no dead block was held at any renewal that day, so the scope change bites nothing and the damage sits in the flip chain that starved once blocks stopped re-arming. Your 26 May, 4 June and 15 July takes still fire: the gap side is now near empty, but 15, 4 and 2 weeks-old standing blocks still count. Your 19 June long is banked valid with the 15:45 open, and your 10 June long is banked valid with the class open. Both changes are undone.
## Relay order (B-248 EU-CLEAN 4 of 6 + B-248A + B-248B; RESTORED)
- Part 0 on builder/B-248 cut at 5213732 (backup exact). Python 3.13.16. Reads per 0.3 in order (rules/17, rules/25, spec 3.3/3.7/3.8 quoted). Gate: log-1 5213732, gated diff EMPTY, kept + 9 .B247BK verified, tick STATIC 18678468, no terminal64, ledger ^1394=1 ^1395=0. Tini touch-class ACCOUNTED. Part B: nothing banked.
- Part S (B-247 rows): N25JUN silent via 5747 bearish KS-held (short=in-bias); K8OCT lost only via 18451-bullish cascade at 11:30 S3 ob1 for a SHORT; all other rows B-vs-kept identical -> D SEPARATES, no STOP.
- Part A-B/A-G first: rules/54 banked (counts 0) + index; register NOTE + READ/REGISTER A/C/D/E regenerated (sha 47cab1c3; B/F kept, noted); ledger 1395; truth K19JUN (15:45 open 1.14644, jl 22285746 on B247B cut); grader patch (2 lines, counts 1); kept baselines re-graded on new truth (EU 13/14-12/14-4, RECON 7/7-6/7-0).
- Part K/T: D = .B247BK + [B248D] RV-guard direction scope (raw in slice); braces +0; markers once per branch; compiles 0/0; .B248DK 9 verified (EA 6086e07c, Flow 5311d4a2, Imb 89a1e7d4). RECON-D PASSED 7/7-6/7-0; EU-D PASSED 12/14-11/14-3 + M8/M12. C = .B248DK + [B248C] per-kind reach (opposing-candle latches, no leg, B248C prints; raw in slice); compiles 0/0 + 3 pre-existing warnings; .B248CK 9 verified (Flow e938e7d8/0130c56b). RECON-C PASSED 7/7-6/7-0 (A1/A7 must-holds pass); EU-C PASSED 12/14-11/14-3 (NEVERs still fire). ex5 pre/post all runs identical. Cutter b247 + B248C regex; grades raw in slice.
- Part T2: D 12/14 (K8OCT + K19JUN missing; kept 13/14) -> NOT KEPT, D RESTORED. T3 carriers in REPORT/CARRIER_B248.csv (114 rows: first carriers per NEVER + per KEEP). T4 restore verified (kept SHAs, 27 charts, tini, no terminal64). .B248DK/.B248CK unstaged.
- Part A-R (EU-B248D cut): DIV19JUN_B248A.csv (90 rows: 15:05 KILL_S3 ob1/fvg1; hidden-bull latch=1 first at 15:45; entry one candle after owed); R2: EA reads CQD verdict buffer (iCustom EA:12465; latch walk EA:7024-7049 reads published verdicts, no next-close wait in EA NOT FOUND); R3: HTF10JUN_B248A.csv (ht=1/1/-1; London H/L + sweeps; sweepTag=0).
- Part B-248B: rules/55 banked; rules/54 correction line; index; register NOTE; READ copies regen (sha 25d7d082); truth K10JUN (machine exit marked); kept EU re-graded 13/15-12/15-4; SWING19JUN_B248B.csv; EU_FIX_PLAN F4a/F4b + amends.
## Final disk state
- Restored: EA 18a1d49b/d85cf7d2 + Flow a8201128/61177aa5 + Types d542b458 + OB 915b4fc3 + Imb d9a38776 + Bias 0b334063 + State 2e4f8a95 + POI d47a0e68/04fcd8a5, terminal.ini from .preB248, 27 chart files, no terminal64. Review batch: REPORT/REVIEW_BATCH_B248.md (10 Jun VALID class OPEN; 19 Jun closed banked).
## Record checklist (grep-verified in staged files)
- X EU_FIX_PLAN F2+F3 State B-248 + F4a/F4b: FOUND
- X ledger 1396 + pointer State B-248 + Lane 4/6: FOUND
- B rules/54-55 + index + register + truth K19JUN/K10JUN: FOUND
- T DEALS x4 + cuts + grades + CARRIER + R csvs: FOUND
- Q batch both items closed/new: FOUND
## Carried note
- Cleanup (his order, disks critical): MQL5-logs 1014/1015 + Tester-logs 1014/1015 + 33 CUTs + s4_b244/s4_b245 deleted with manifest (B-247 result); this relay deletes its superseded CUTs after push (manifest here): D 91->182GB, C 3.1->15GB standing.
- Next roads: flip-cascade starvation (K8OCT-class: frozen blocks starve renewal scans, no code-8 revival); swing-leg or zone-identity scope for NEVERs (history-wide XOB set); F4a/F4b open. No question to him.
- Next: planner decides.
