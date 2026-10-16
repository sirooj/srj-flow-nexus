GRADE RECON62-B245D12: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B245D12: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 4; MACHINE-ONLY ungraded 1; trades 18
# BUILDER RESULT B-245 - RESTORED (EURUSD): kill mark wiped by re-activation, zone sets too wide, D12
Trader summary: Your four invalid takes still go through, and the test showed why. Your 25 June block is marked dead at 10:05 but the machine switches it back on right after, so by 10:15 it reads alive again. Your 26 May, 4 June and 15 July takes each still count 10 to 39 standing zones at the confirmation candle, so the no-zone test never bites. Every keep is unchanged. The change is undone.
## Relay order (B-245 EU-CLEAN 1 of 6; RESTORED D12 NO-GAIN)
- Part 0 on builder/B-245 cut at f9bbe56 (backup exact). Python 3.13.16. Reads per 0.3 in order (B-240 hunks + B-244 batch quoted raw). Gate: log-1 f9bbe56, gated diff EMPTY, kept SHAs match, .B244K 4 files verified, tick STATIC EURUSD 2026.hcc 18678468, no terminal64, ledger ^1391=1 ^1392=0. Tini ff1dfcdf touch-class of b64523fc ACCOUNTED ([Tester]/[TickLoad] intact, RECON dates; RecompiledAll/LastStartTime/window-flag self-touches only).
- Part B: rules/53 banked (NO-CODE-STOP + GU-UJ-NEXT + M10JUN-SETUP-CLASS, counts 0) + index line. Part W: 4 edits applied (counts 0; SHAs 01a 8fd014ec, SKILL 09bb6939, CONTEXT 002ceb98, FIXPLAN fbe96dd5).
- Part K0/K1 in slice (raw spots, rule quotes, no conflict). K2 = .B244K H4a/H4b byte-exact (EA 3a365eff MATCH, Imb fc4408f1 MATCH after trailing-CRLF) + [B245KM] at the H1b site. K3 V1 = [B245ZS] buffers 55/56 + [B245ZG] gate. Braces EA +4/+4, Flow +21/+21, OB +0; markers once each. Flow compile 0 errors + 3 pre-existing warnings (none in hunks); EA 0/0. Trial EA 0a6affaf/c4e08e11 + Flow 18c362fb + OB 2d0b60a6; .B245D12K 6 files verified pre-run.
- Part T: RECON62-B245D12 (WMI launch 13:36:08, killed-tree relaunch 13:40:48, PASSED 13:45:06, grade 7/7-6/7-0) + EU0525TD-B245D12 (PID 17280, PASSED 14:16:41, grade 13/13-12/13-4 + machine 18:55). ex5 pre/post both runs unchanged. Cuts per segment (TOOLS/job_cut_b245.py) + grades raw in slice. T2 not triggered (no KEEP worse). T5 restore verified.
- Part T6 carriers: 25 Jun H1b fired 10:05 on 5747 but PROMOCENSUS 10:20 reads isValid=1 isActivated=1 (re-armed; obVal=obInval=110501) so 10:15 RV dead0 and 10:40 ZG SHORT v67 PASS (newest = 5747 itself, reached 10:25). Zone takes: 26May SHORT v39 (newest FVG 14:15 1.16420-1.16421), 4Jun LONG v10 (newest FVG 07:20 1.16055-1.16058), 15Jul LONG v13 (newest XOB 07-14 22:30 1.14210-1.14243). Next roads: KM-survive-activation guard + K4 leg-scope.
## Final disk state
- Restored: EA 18a1d49b/d85cf7d2 + Flow a8201128/61177aa5 + OB 915b4fc3 + Imb d9a38776 + POI d47a0e68/04fcd8a5, terminal.ini ff1dfcdf (from .preB245), 21 chart files, no terminal64. .B245D12K unstaged (6 files). Review batch: REPORT/REVIEW_BATCH_B245.md (10 Jun 18:55 TREND item, no register row).
## Record checklist (grep-verified in staged files)
- X ledger 1392 + fixplan State B-245 x2 + pointer State B-245 + Lane EU-CLEAN 1/6: FOUND
- B rules/53 + index + W 4-edits: FOUND
- T DEALS_B245D12 x2 + cuts + grades + KILL + S4RV: FOUND
- Q batch M10JUN setup-class item: FOUND
## Carried note
- Next roads: (1) KM-survive: a first-close-killed block never re-arms (activation skips KM-marked blocks, new bool, his kill has no activation step); (2) K4: reach must fall inside the current swing leg (spec 3.5), leg from the indicator's own swing points. D1/D2 isolation runs add nothing (same hunks, same rows).
- Next: planner decides.
