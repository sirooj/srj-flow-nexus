# BUILDER SLICE B-227W - raw rows (workflow PK-4 install + grader proof; MEASURED)
Base: builder/B-227W cut at 0edc712 (= B-226 head; builder/B-227 absent on backup, planner B-227 not run). Verdict MEASURED.
## Start gate
```
log-1 0edc712958958b91109728c0bd2edeb4dada1480 (backup exact; B-227W cut here; rev-parse HEAD at cut + before commit).
status 835 (dirty tree as B-226 = ACCOUNTED). Experts src b4db21c5 / ex5 61829f05 (LF-normalize text first).
No terminal64. Python 3.13.16 at the 01b path. Kit PK-4.
```
## Part W grep counts (FIND -> REPLACE; count 1 = APPLIED)
```
W1 PLANNER_SKILL "Kit version: PK-3 (relay B-209)" count 1 APPLIED.
W2 PLANNER_SKILL "Read 99_WORKFLOW/READ_MAP.md first" count 1 APPLIED.
W3 PLANNER_SKILL "Record before reading, reading before trial, trial before kept" count 1 APPLIED.
W4 PLANNER_SKILL "Questions to him are a last resort" count 1 APPLIED.
W5 PLANNER_SKILL "Row packs first (PK-2, relay B-131)" count 1 APPLIED.
W6 PLANNER_SKILL "Separator gate (PK-2)" count 1 APPLIED.
W7 PLANNER_SKILL "Lane limit (PK-2)" count 1 APPLIED.
W8 PLANNER_RELAY_TEMPLATE 6 FINDs count 1 each APPLIED (skeleton PK-4; Part T grader runs; Part X trimmed records; F1 scoreboard lines; KEPT-vs-diagnostic; Lane 3rd-relay).
W9 PLANNER_CONTEXT "never ask him directly (his DEFECT word 2026-10-04)" count 1 APPLIED.
W10 PLANNER_BOOTSTRAP "Planner kit PK-2 (relay B-131)" count 1 + PLANNER_MEMORY "Planner kit installed: PK-2 (relay B-131)" count 1 APPLIED.
W11 EU_FIX_PLAN 3 FINDs count 1 each APPLIED (grader grading; kept rule; F5-first queue).
W12 01b_relay-b.md "EURUSD only until he opens pound and yen" count 1 APPLIED (FIND kept, block appended) + B1 verbatim banking.
Part N files verbatim from relay: TOOLS/grade_register.py, REGISTER_TRUTH.csv (18 rows: 8 KEEP incl P3, 9 NEVER, 1 WATCH), REPORT/REVIEW_BATCH_B227W.md (12 takes + 1 rule question).
```
## Part R full grader output
```
RECON62-B222K (exit 0):
GRADE RECON62-B222K: KEEP entries exact 7/7; KEEP exits exact 5/7; NEVER fires 0; MACHINE-ONLY ungraded 1; trades 8
A1 ENTRY EXACT / EXIT DIFF +3pt (fill 1.16467 vs 1.16464); A2 EXACT/EXACT; A3 EXACT/EXACT; A4 EXACT/EXACT (TP 1.16201); A5 EXACT/EXIT DIFF +4pt (1.16319 vs 1.16315); A6 EXACT/EXACT; A7 EXACT/EXACT (1.16275). NEVER in window (6) all SILENT. MACHINE-ONLY: 2 Sep short.
EU0525TD-B222K (exit 1, as designed: kept build scores nonzero):
GRADE EU0525TD-B222K: KEEP entries exact 7/8; KEEP exits exact 4/8; NEVER fires 3; MACHINE-ONLY ungraded 12; trades 22
A1 EXACT/DIFF +3pt; A2 EXACT/DIFF -12pt (SL 17:51 1.15975 vs 17:50 1.15987); A3 MISSING (no 16:00 deal); A4 EXACT/EXACT; A5 EXACT/DIFF -76pt (SL 21:25 1.16239 vs TP 1.16315); A6 EXACT/EXACT; A7 EXACT/EXACT; P3 EXACT/EXACT. NEVER fires 3 (10Jun, 25Jun, 22Jul); rest SILENT incl W28JUL WATCH. MACHINE-ONLY 12 (26May, 28May, 4Jun, 29Jun, 8Jul, 15Jul, 5Aug, 17Aug, 2Sep, 4Sep London, 22Sep, 8Oct; exits equal REVIEW_BATCH_B227W items 1-12).
```
## Part X records
```
Pointer State B-227W + Lane F5-YEARLY-DEPTH 0/3 + Next scoreboard block (35 lines). Ledger 1374 B227W-WORKFLOW-PK4.
LESSONS fold L3 ("Cite only what the planner has seen (B-73)...") to ARCHIVE/LESSONS_ARCHIVE_B220.md + B227W-SCOREBOARD (118 chars).
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4683/35 PASS; result 3183/11 PASS; slice 4038/49 PASS (this file); CONTEXT 8743 PASS; SKILL 6487 PASS; TEMPLATE 3832 PASS; BOOTSTRAP 2755 PASS; MEMORY 558 PASS; FIXPLAN 13858 PASS; 01b 16571 PASS; TRUTH 1600 PASS; GRADER-TOOL 3687 PASS; BATCH 1806 PASS; LESSONS 20066 disk / 19936 LF PASS; ARCHIVE 1555 PASS; LEDGER 1457042 grep-only PASS; READ_MAP rewritten. Register untouched. Strategy skill untouched (workflow only).
```
## Timing + final disk + housekeeping
```
Wall: gate + reads ~10m; W edits ~15m; N files ~5m; R proof ~5m; records ~10m; commit/push follow.
Final disk: no EA/include/indicator edit, no compile, no runs (kept b4db21c5/61829f05). No terminal64.
Housekeeping: none (no new cuts; delete nothing).
```
(End of slice)
