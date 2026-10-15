GRADE RECON62-B230K: KEEP entries exact 8/8; KEEP exits exact 6/8; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 8
GRADE EU0525TD-B229D: KEEP entries exact 14/14; KEEP exits exact 12/14; NEVER fires 8; MACHINE-ONLY ungraded 0; trades 22
GRADE RECON62-B234D: KEEP entries exact 7/8; KEEP exits exact 6/8; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B234D: KEEP entries exact 13/14; KEEP exits exact 12/14; NEVER fires 7; MACHINE-ONLY ungraded 0; trades 20
# BUILDER RESULT B-234 - RESTORED (EURUSD): retest-open refusal refuses 17 Aug, breaks 7 Sep keep
Trader summary: Your retest-open rule was built as a test change and run on both euro windows, then undone. Your 17 August long (15:50 open 1.15918 on the Weekly line 1.15918) is refused. Your 7 September long (16:45) is refused too through its 16:40 candle (open 1.16249 on the Weekly line 1.16249), so the reading is too wide to keep. Your 22 September short still takes: its latest touching candle is 18:50 (open below the line), not 18:55. The next test needs a narrower reading that keeps 7 September.
## Relay order (B-234 F10 RETEST-EQUAL 3 of 6 diagnostic 1; RESTORED, H2 NARROW-NEXT)
- Part 0 on builder/B-234 cut at bab0380 (backup exact; ls-remote match). Python 3.13.16. Reads per 0.3 in order (pointer, RESULT/SLICE_B233, RESULT/SLICE_B232, RETEST_B232, truth, grade_register.py, EU_FIX_PLAN, QUESTION_LOG, rules/48 L4+L9, rules/51 L4-L8, SPEC 2 L9 + 3.6, both kept DEALS). Gate: log-1 bab0380, status 876 (+1 vs 875 ACCOUNTED class), gated diff EMPTY, EA b4db21c5/61829f05 + POI d47a0e68(raw)/04fcd8a5 + tini 3a7ea233, cuts 165047122 + 609929022 present, tick STATIC (history mtimes pre-B-233), no terminal64, ledger ^1380=1 ^1381=0.
- Part B: no new rule words. rules/51 RETEST-EQUAL-OPEN count 1, rules/48 body-same-value count 1: ALREADY_BANKED.
- Part R0 (job_r0_b234.py, kept EU cut, JL-verified): RETEST_B232 carried one Weekly value (1.15924, the 17:30 KILL row JL 17997039) across all 15:00-15:50 candles (defect B232-FROZEN-LINE, owned). Per-candle: 15:20 open==hPx YES (1.15917); 15:50 open 1.15918 vs B196BAR hPx 1.15917 NO, vs buffer/WINLINE value 1.15918 YES. 22 Sep: 18:45 YES, 18:55 YES (Quarterly-POC 1.14334). B-232 no-equality claim superseded.
- Part K (one hunk at the FIRE pass before LogSignal EA:11838; refusal path GoAbort): walk closed candles confirmation-to-retest (iBarShift of g_b61RetestTime), latest touch at that candle's own ReadBuf1(g_hPoi) value (long low<=, short high>=, no tolerance), refuse on NormalizeDouble(open)==value at _Digits with reason RETEST_OPEN_EQ, one [B234EQ] row PASS/REFUSE. K0 readability shown (WINLINE read EA:2344, bar-map reads EA:7704-7709, retest-shift idiom). Braces +6/+6 balanced, marker count 1, compile 0 errors 0 warnings, src 35f0c73f ex5 a6d765f0, .B234K verified pre-run.
- Part T (diagnostic build a6d765f0 pre/post both runs; D: 141.3 -> 137.2 GB): RECON62-B234D window JL 20393739 verified, 16:59:16-17:04:12 PASSED; EU0525TD-B234D window JL 21446666 verified, 17:13:59-17:42:17 PASSED; one Python cut (24.77M lines) + grades from cuts. T3 gate breached: RECON showed A5 MISSING before the EU launch window, but the batch ran back-to-back in one terminal session, so EU was graded anyway (see carried note). No STOP (compile/marker/sha/window all clean).
- Part S (SEPARATOR_B234.csv, 31 rows): SEPARATES 14 (13 KEEP PASS + N17AUG REFUSE-silent); BREAKS 1 (A5 REFUSE-missing via 16:40 open 1.16249); OTHER-GATE 16 (7 firing NEVERs incl N22SEP PASS-18:50, silent NEVERs with no decision row). H2 NARROW-NEXT: A5 worse on both runs, no new NEVER fire, N22SEP still fires.
## Final disk state
- Restored: EA b4db21c5/61829f05, POI d47a0e68/04fcd8a5, terminal.ini 3a7ea233, 18 chart files, no terminal64. Trial keep .B234K on disk unstaged (35f0c73f/a6d765f0). Review batch: REPORT/REVIEW_BATCH_B234.md (no new items).
## Record checklist (grep-verified in staged files)
- X1 REVIEW_BATCH_B234.md no-new-items: FOUND
- X2 EU_FIX_PLAN.md State B-234 line: FOUND
- X3 ledger 1381 B234-EU-F10-EQOPEN: FOUND
- X4 pointer State B-234 + Lane F10 3/6 + Next narrow-next (35 lines): FOUND
- X5 LESSONS.md B-234-LINE-PER-CANDLE: FOUND
## Carried note
- The T3 gate fired before the EU run (RECON62-B234D grade: A5 MISSING, entries 7/8). The relay's batch design (one terminal session, one cut after both runs) had already launched EU0525TD back-to-back, so the run was graded for the record instead of discarded; the verdict is RESTORED either way and no kept trial follows (H2).
- R0 owns defect B232-FROZEN-LINE: RETEST_B232.csv graded every 17 Aug candle against the 17:30 KILL value 1.15924; the per-candle buffer values are 1.15917-1.15918, and the diagnostic reads the buffer per candle (15:50 buffer 1.15918 = his live value).
- 22 September mechanics: the diagnostic's latest touching candle is 18:50 (open 1.14325 below 1.14334), so 18:55 never decides; a narrow-next reading must refuse on the 18:55 touch itself while leaving 7 September 16:40 passing.
- Next: F10 narrow-next per H2, or planner road; F3-INPLAY stays paused at 4 of 6.
