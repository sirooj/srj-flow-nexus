# BUILDER SLICE B-221 - raw rows (close-kill vs list-missing; no reading separates; MEASURED)
Base: builder/B-221 cut at b3af3cb (= B-220 head). Verdict MEASURED (P3-0618 4 of 6; R1 511 releases graded; R2 kept-path first-release per session; R3 kill record FOUND; S V1 fails 6 kept sessions, V2 fails 13; no trial).
## Start gate
```
log-1 b3af3cbef46e5de725c8e18183172d377563d86e (backup exact; B-221 cut here; push via backup, never origin; rev-parse HEAD before each commit per B149).
diff b3af3cb EMPTY on pointer + RESULT_B220 + SLICE_B220 + both skills + CONTEXT + HANDOFF + LESSONS + FIXPLAN + READ_MAP. Status 784 (dirty tree as B-220 = ACCOUNTED: B-220 job scripts/outs/CUTs/inis/STATUS/DONE/.preB220/.B220K/tini+Charts.preB220).
Disk SHAs: EA 7c392767/83ac8bde; Panels 4335f703; flow a8201128/c82f175e; OB 8bbf936b; Imbalance 568f4ce9; Bias 3b1d9d3d; State 80a466ac; POI 5AF5E035/E5CBE1A2 (case-only); SESS 16573a5b; tini c725e437 blessedB208; Charts 25 files. .B220K src 6f51bfcd ex5 51b63926. CUT_B218 (a8cbbf63/b5b71897) + CUT_B220D pair present. Ledger ^1367=1 ^1368=0 pre. No terminal64. Python 3.13.16 (py launcher absent, same as B-220). Tick history ACCOUNTED (2026.hcc 14:27 predates B-220; 202610.tkc 00:32:05 = B-220 T2 own end; grade vs CUT_B218).
Pins: rules/18 "Dead is dead" L6 count 1, RETEST-DIES-BY-BODY-CLOSE-ONLY L12 count 1 -> ALREADY_BANKED. rules/22 DIVERGENCE-RENEWED-ONLY L4. Spec 3.4 L28, 3.6, 3.8 L135, 6 (dedup while-alive). Kept deal lists FOUND: ROWPACK/DEALS_RECON62-B218K.csv (16) + DEALS_EU0525TD-B218K.csv (44).
```
## Part R (job_r_b221.py, offline only, no runs, no day log)
```
R1 HALF over 511 [B220DH] rows (RECON 46, EU 465 = relay counts): CLOSE = judged close through holder line (row values); ABSENT split by same-session WINLINE JL-order: KILLED/REVIVED/NEVER-IN.
RECON: CLOSE 6 (3 KILLED + 3 REVIVED), ABSENT 40 (20 KILLED + 20 NEVER-IN). EU: CLOSE 98 (43 KILLED + 51 REVIVED + 4 NEVER-IN), ABSENT 367 (194 KILLED + 63 REVIVED + 172 NEVER-IN). Filed REPORT/RELEASEHALF_B221.csv (511 rows).
Named proofs: 18Jun 09:35 CLOSE (1.15224 < 1.15233, split REVIVED: ADD@2096105 before SUPPRESSED same pass) PROVED; 1Sep 17:00 ABSENT (1.16012 > 1.16007, NEVER-IN) PROVED; 7Sep 15:05 ABSENT/NEVER-IN + 16:05 ABSENT/KILLED + 16:15 ABSENT/KILLED PROVED; 27Aug 10:00 CLOSE (1.16551 > 1.16541, REVIVED) PROVED; 28Jul 10:25 ABSENT/KILLED + 10:35 ABSENT/KILLED from the rows PROVED.
R2 KEPT-PATH FIRST RELEASE (CUT_B218, 176 sessions): per SUPPRESSED row holder line+side, judged close (B196BAR), line value (WINLINE val= first, B196BAR hPx fallback tagged HPRICE, else NOT PRINTED). V1 = close-through (exact KILL test EA L2363/L2387 re-found). V2 = V1 or proven same-session KILL with no later OPEN/ADD. Strict JL order: first UNKNOWN-evaluable row before any TRUE poisons the session (none occurred: HPRICE fallback decided every S session).
R3 BUILDABLE: FOUND. The only per-session WINLINE-KILL record is the g_wl set itself (g_wlLong/g_wlShort + N per WlSessIdx slot, day-scoped via g_wlDay; removal written at the KILL print EA L2365-2366/L2389-2390; readable at the census spot as B-220 did). No separate kill flag or list exists in EA source (all other g_wl touches live inside WinlineUpdate/WinlineFreeze L2300-2415). Caveat: set-absence cannot tell KILLED from NEVER-IN (R1 EU NEVER-IN 172) - the buildable V2 (V1 + absence) is wider than the graded V2-strict.
R4 PROVENANCE on kept rows: 28Jul short seed 10:40 anchor Daily-VWAP rt=10:10 gapTouch=1.0 PASS (B177HZ 3441468) div latch0 regular dbar10:10 FIRE 3442047. 1Sep A2 seed 17:00 anchor Monthly-VWAP rt=16:50 xobWin=1.0 PASS (B177HZ 4181654) latch1 hidden dbar17:15 FIRE 4182397. B-220 broke both by moving rt (28Jul 10:10->10:35 gapTouch 0.0 HISZONE_NONE) and wiping latch/rt (1Sep 17:00 reset, 17:35 confirm=0).
```
## Part S (job_s_b221.py; REPORT/SEPARATOR_B221.csv 36 rows; row,run,session,kept entry,V1,V2,verdicts)
```
V1 first-release before entry FAILS the kept pair; P3 needs the 09:40 FOMC-VWAP row; C-only OPEN on any release; UNKNOWN fails (none occurred).
V1: P3 PASS (09:40 FOMC-VWAP/LONG c=1.15224 L=1.15233 WINLINE JL 2881023). Kept FAILS: A5 both runs (16:10 Weekly-POC/LONG c=1.16245 L=1.16249 WINLINE JL 1007991/4287878, entry 16:45); 10Jun (15:10 Monthly-POC/SHORT c=1.15385 L=1.15384 HPRICE JL 2773721, entry 16:15); 28Jul (09:40 Weekly-POC/LONG c=1.13701 L=1.13702 WINLINE JL 3437640, entry 10:45); 22Sep (15:25 Daily-POC/SHORT c=1.14651 L=1.14638 WINLINE JL 4598846, entry 19:00); 8Oct (11:15 Daily-VWAP/SHORT c=1.11981 L=1.11975 WINLINE JL 5023975, entry 11:35). Rest PASS (A1/A2/A3/A4/A6/A7 both runs; 26May/28May/4Jun/25Jun/29Jun/8Jul/15Jul/22Jul/5Aug/17Aug/2Sep/4Sep pairs). C-only all PASS. -> V1 does NOT separate.
V2: P3 PASS (same row via=CLOSE). Kept FAILS: all V1 fails plus A6 both (09:40 Monthly-POC KILLED JL 1017868/4306680), A7 both (RECON 15:20 Yearly-POC KILLED JL 1021509; EU 14:50 Daily-POC KILLED JL 4312874), 26May (15:05 Daily-POC KILLED JL 2617088), 5Aug (10:40 Daily-POC KILLED JL 3606306), 17Aug (15:50 Weekly-VWAP KILLED JL 3814118). C-only OPEN on 27Aug (18:25 KILLED JL 4089487), 28Aug1625 (15:05 KILLED JL 4108849), 8Sep1645 (14:50 KILLED JL 4312874); 4Sep1040 + 1Sep1530 PASS. -> V2 does NOT separate (R3 FOUND moot).
PICK: V1 no; V2 no (despite R3 FOUND). No trial. Verdict MEASURED. Blocking rows in trader words in the carried note.
```
PICK: V1 no; V2 no (despite R3 FOUND). No trial. Verdict MEASURED. Blocking rows in trader words in the carried note.
```
## Part X records
```
CONTEXT sec5 +1 B-221 (2026-10-15 PK-3), sec4 P3-0618 B-221 MEASURED. HANDOFF 3a B-218-B-221 open 4 of 6 + 3b drop oldest dup add B-221 keep10 (B-212..B-221; B-221 line 101 chars). FIXPLAN F8 State B-221. Ledger 1368 B221-EU-P3-CLOSEKILL (^1368=1). Pointer latest B-221, P3 4 of 6, Next planner direction (4638 B/35 lines). LESSONS +1 B-221-SEPARATE-FIRST (144 chars), B-68 folded to ARCHIVE/LESSONS_ARCHIVE_B220.md (19900 B).
```
## Size gate (READ_MAP files; caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4638/35 PASS; result 5122/15 PASS; slice 7313/42 PASS (this file); CONTEXT 7516 PASS; HANDOFF 4934 PASS; LESSONS 19900 PASS (fold applied); FIXPLAN 11731 PASS; SEPARATOR_B221 4031 PASS; RELEASEHALF_B221 67787 (pack-exempt REPORT, filed interim) PASS; READ_MAP rewritten. Strategy max + relay + READ max per READ_MAP.
```
## Timing + final disk + housekeeping
```
Wall: gate+reads ~15m est (0.1-0.5 + B + R0 pins + spec/register/lines); R scripts ~15m (CUT_B218 2-pass index + CUT_B220D pass + 3 script fixes with recounts); S script ~10m (full CUT_B218 rescan + HPRICE fallback + kept-count fix); interim commit + push (8100c92, ls-remote verified); X records ~10m est; final commit + push follow.
Final disk: no edit, no runs (EA 7c392767/83ac8bde; Panels 4335f703; flow a8201128/c82f175e; OB 8bbf936b; Imbalance 568f4ce9; Bias 3b1d9d3d; State 80a466ac; POI 5AF5E035/E5CBE1A2; SESS 16573a5b; tini c725e437; Charts 25 files). .B220K on disk unstaged (6f51bfcd/51b63926). CUT_B218 + CUT_B220D pair in 00_CURRENT_WORKING (unstaged; current trial). No terminal64. No trading change stands.
Housekeeping: keep CUT_B218 (kept baseline) + CUT_B220D pair (current trial); nothing to delete (no B-221 runs, no new cuts).
```
(End of slice)
