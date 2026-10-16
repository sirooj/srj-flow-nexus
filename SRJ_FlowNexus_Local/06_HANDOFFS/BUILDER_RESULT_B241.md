GRADE RECON62-B238K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B237D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 6; MACHINE-ONLY ungraded 0; trades 19
GRADE RECON62-B241D: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B241D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 4; MACHINE-ONLY ungraded 0; trades 17
# BUILDER RESULT B-241 - RESTORED (EURUSD): early-kill regrade refuses 10 Jun + 22 Jul, D1 GAIN
Trader summary: Your early kill from the spring was rebuilt on today's machine and run on both windows, then undone. Your 10 June long and your 22 July short are refused again with every keep unchanged, and your 25 June short still goes through, exactly as it did then. Two never-takes silent for no keep worse is a gain, so the next relay installs it. Your zone-count question is answered by your own new words: only zones price has actually reached count as in play.
## Relay order (B-241 F1/F2 regrade 1 of 6; RESTORED D1 GAIN)
- Part 0 on builder/B-241 cut at c7d698c (backup exact). Python 3.13.16. Reads per 0.3 in order. Gate: log-1 c7d698c, status 1022 (+B-240 artifacts ACCOUNTED, listed), gated diff EMPTY, EA a62194f8/a975ea27 + Flow a8201128/c82f175e + POI + tini a512582a + .B216K SHAs verified, tick STATIC (10-06 18678468), no terminal64, ledger ^1387=1 ^1388=0. rules/21 L2 + 28 L2 actual (relay said L3); 50 L4 exact.
- Part B + addendum: no new rule words from the relay; his B-241 words banked verbatim to rules/50 (counts 0 pre) + REACHED-ONLY-INPLAY pin + index bytes 1344->1807. Filing: not a new defect, no defect row, no LESSONS line.
- Part K0 (port map in slice): all five includes MATCH B-217 pristine -> .B216K copies byte-exact installed; FlowLogic.mq5 = B-216 src (a8201128). H3 re-applied by text at today's S3 arming site (EA:9500, barShift in scope; all identifiers verified). Whole-hunk rule: every piece applied, no STOP.
- Part K (K1 rule check in slice): spec 3.4 + must-nevers + dead-until-renewed, no conflict. Backups .preB241 (9 files). Markers once each (B215H1/H2/H3, B216H1b/H1c, B215F1, B216H1); braces match B-216 deltas (OB +6, Imb +4, Bias +2, State +1, Panels 0, EA +2). Flow compile 0 errors + 3 pre-existing warnings; EA 0/0. Trial EA 18a1d49b/d85cf7d2 + Flow 61177aa5 (differs from B-216's 839dec09: other-include drift + compiler, disclosed); .B241K (9 files) verified pre-run.
- Part T (both ex5 pre/post both runs): RECON62-B241D window JL 2019301 verified, PASSED, grade 7/7-6/7-0 (T2 gate passes); EU0525TD-B241D window JL 3063931 verified, PASSED, grade 13/13-12/13-4. Cuts once per segment (TOOLS/job_cut_b241.py; DAYLOG day fix + bracket/regex repairs disclosed). D1 GAIN: 10 Jun + 22 Jul silent, 25 Jun fires, no KEEP worse, no new NEVER.
- Part T6 (KILL_B241.csv, 924 rows: RECON 11 F1 + 129 H1, EU 97 F1 + 687 H1): 10 Jun KILL_S3 15:05/15:15/15:55 + 18:35 post-entry; 22 Jul KILL_S3 14:45; 25 Jun zero F1 rows. Deal diff: RECON none; EU only the two pairs gone.
- Part T4 restored all 9 files + 17 charts + tini from .preB241, SHAs verified; .B241K unstaged.
## Final disk state
- Kept: EA a62194f8/a975ea27, Flow a8201128/c82f175e, POI d47a0e68/04fcd8a5, terminal.ini a512582a (touch-class), 17 chart files, no terminal64. Review batch: REPORT/REVIEW_BATCH_B241.md (no new items, 4 June dropped answered).
## Record checklist (grep-verified in staged files)
- B addendum rules/50 pin + index: FOUND
- K port records in slice: FOUND
- T DEALS_B241D x2 + cuts + grades + KILL: FOUND
- Q batch (no 4 June item): FOUND
- X fixplan F3-park + F1 + pointer State B-241 + ledger 1388: FOUND
## Carried note
- The B-216 flow ex5 (839dec09) does not reproduce from the same sources today (61177aa5): other includes drifted since B-216 plus the compiler moved on. Sources that matter are byte-exact; behavior re-proved by grade.
- Next: install relay (KEPT trial with Part S) per D1 GAIN.
