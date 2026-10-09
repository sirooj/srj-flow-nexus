# BUILDER RESULT B-136 - Own-body break trial RESTORED (R-a: entry volumes drift 0.01 by balance effect)

Trader summary: your two exits both worked on the trial build — the 28 August short left at the 11:35 open (1.16464, your price to the point) and the 1 September long left at the 17:50 open (1.15987, exactly your line). But the earlier 28 August exit leaves more money in the account, and the position sizer trims the next entries by a hundredth of a lot (2.05 to 2.04 and similar). Your rulebook says every other deal must stay exactly the same, so the change was undone and the kept build is back on disk. Nothing else moved: no new trades, no moved entries, no other exits touched.

## Relay order (B-136, kept-build trial, lane A2-EXIT 3 of 6)

- Part 0 fresh start on builder/B-135 at be0679449f32e8f77c8330641ecfc89575a064b1 (backup remote verified exact; builder/B-136 cut here; no remote B-136 before push). Relay skill loaded whole (83 lines); strategy skill verified byte-identical to the B-135 whole read (diff EMPTY) with pins re-grepped; .agents stub never opened.
- Part B banking: s23/s36(a)(b)/s49/s78/s87/s28-tail verified with line numbers, plus EXACT-PRICE-NO-LENIENCY L34, NO-OVERFIT L60, RETRACE-IS-IN-PLAY L203, NO-CASCADE L205. Append nothing.
- Part S: S0' re-ran unchanged (script found on disk): A1 first = 11:30 D-POC, A2 first = 17:45 Y-POC, rest NONE, C-06-04 NONE — exactly as expected. S1 table below. No STOP.
- Part K: K0 no conflict (quotes in slice). K1 spots pasted with real line numbers (loop EA:12416-12457; own o/c EA:12293/12296; behind EA:12425; through EA:12430; trigger EA:12011; rank EA:12451; census EA:12440; fill EA:12516; MTEXIT EA:12520; EPS EA:12303 raw `double EPS = 0.001 * _Point;` = 1e-8/1e-6, far below one point). K2 backups .preB136 (EA 90240F23-64char, EX5 6CFD3A46). K3 one hunk OR'd onto the kept test (kept lines logic-identical, whitespace restored). K4 diff raw in slice; edited SHA EE7F515A2305DCED86FC77D4FAF93199E22BC5387668D08618743B23F14E4F7C → 585093BF576B922A241E21779C72C62236B4F57746F778E25A772E493CC3D9C6 after whitespace restore; .B136BRK kept. K5 one compile: 0 errors, 0 warnings (two compile_and_deploy attempts failed on a transient WinError 32 file lock with no terminal running; plain compile then succeeded and the binary sits in Experts/ itself, so no separate deploy was needed); trial EX5 2F5199D1FB9D63412151E48777F36CCE77301645A085B4B993C1237FCBF9F9DF.
- Part T: T0 (no terminal64; content copies terminal.ini.preB136 + Charts.preB136; dates 1787702400/1788998400 read back; script launch; wrapper killed after window verify; watcher PID-verified; short DONE polls). T1 RECON62-B136 PASSED 19:35:57 (~3 min): both owed exits hit (deal 3 MTEXIT bar=11:30 D-POC 1.16451 exit=1.16464 src=OWNBODY; deal 5 MTEXIT bar=17:45 Y-POC 1.15987 exit=1.15987 src=OWNBODY), but R-a fired on entry-volume drift (deals 4/8/10: 2.04/2.49/3.9 vs 2.05/2.5/3.91). R-b passed, R-c passed. Restored EA+EX5 (SHAs verified), restored content copies (verified), terminal stopped, June skipped. Verdict RESTORED.
- Part X: CONTEXT X1 + X2, HANDOFF X3 (RESTORED), ledger 1281 (tag B136-BRK-OWNBODY, incl. the 25pt-correction note), pointer (RESTORED, lane 3 of 6). Register untouched (KEPT-only). No row packs (KEPT-only).
- Part F: this result + slice + ledger + pointer + CONTEXT + HANDOFF staged by explicit path; commit + push via backup + ls-remote check. Reply RESTORED.

## Part S - separator gate

- S0' (re-run, script grade_s0_b134.ps1 found on disk): A1 first = 28 Aug 11:30 Daily-POC 1.16451 (o 1.16440 c 1.16463, packs 351/355); A2 first = 1 Sep 17:45 Yearly-POC 1.15987 (o 1.16002 c 1.15985, packs 54/69); A3/A4/A5/A6/A7/B2/B3/C-05-27/C-06-03 NONE; C-06-04 NONE (reported, never counted). Matches expected exactly. No STOP.
- S1 (row | owed exit + proof key | kept exit, DEALS | S0' first | predicted trial exit | verdict):
- A1 | HIS 11:35 open 1.16464 (FINDING L7; 0828-FVG L8-13; register A1 NOTE B-135) | deal 3 buy 28Aug 11:45 1.16440 | 11:30 D-POC | 11:35 open 1.16464, MTEXIT bar=11:30 src=OWNBODY | MOVES-TO-HIS (hit: MTEXIT bar=11:30 exit=1.16464 src=OWNBODY, deal 11:35:00 at 1.16467, +3pt evaluation-lag class, never a STOP).
- A2 | HIS s78 17:45 close, out 17:50 open | deal 5 sell 1Sep 17:51 1.15975 | 17:45 Y-POC | 17:50 open 1.15987, MTEXIT bar=17:45 src=OWNBODY | MOVES-TO-HIS (hit: deal 17:50:00 at 1.15987 = MTEXIT exit exactly).
- A3 | HIS s28 day-close (deal matches 23:55 1.16129) | deal 7 | NONE | unchanged | UNCHANGED (hit identical).
- A4 | HIS TP 1.16201 (register row 4) | deal 9 10:53 1.16201 | NONE | unchanged | UNCHANGED price/time (volume 2.49 vs 2.5 follows deal 8 sizing; R-a).
- A5 | TP 1.16315 | deal 11 17:13 | NONE | unchanged | UNCHANGED price/time (volume 3.9 vs 3.91 follows deal 10; R-a).
- A6 | TP 1.16102 | deal 13 10:42 | NONE | unchanged | UNCHANGED (fully identical).
- A7 | SL 1.16275 | deal 15 17:26 | NONE | unchanged | UNCHANGED (fully identical).
- B1, C-06-02, C-06-10, C-08-27, C-09-01-1530, C-09-04-1040, C-08-28-1625, C-09-08-1645 | n/a | no kept trade | — | — | OTHER-GATE.

## Part K - kept-build edit (hunk BRK-OWNBODY, summary; full diff raw in slice)

- K0: no contradiction. s23 (body-close break exits) is what the hunk implements; s36(a) same-line exclusion and s87 POC-supremacy ride the untouched rank gate; s36(b)/s49/s78 are the two owed exits the hunk produces; s28 tail + spec §4 keep the fill at nextOpenPx (EA:12516 untouched); spec §2r3/§5.1-5.3 keep per-bar side/through shape; FINDING L7 is his 11:35. Quotes raw in slice.
- K1 spots (real line numbers, kept EA): own o/c EA:12293 `double o = iOpen(_Symbol, PERIOD_CURRENT, barShift);` / EA:12296 `double c = iClose(...)` (the UJBARMAP values, in scope at the loop — buildable); nextOpenPx EA:12299-12300; bodyLo/bodyHi EA:12301-12302; EPS EA:12303; loop EA:12416-12457; behind EA:12425-12426; through EA:12430-12431; trigger EA:12433 via MtIsBreakTrigger EA:12011-12017; census EA:12440-12449; rank gate EA:12451; priority EA:12509-12518 (header EA:12281-12282); fill EA:12516; MTEXIT EA:12520-12526.
- K3 shape: `ownBehind` (L vs own open), `ownThrough` (own close vs L-EPS/L+EPS, same strict form + same EPS), `ownRankPass`, `ownBrk` (all four ANDed); census verdict BREAK = kept OR own + appended `ownO/ownC/ownBrk`; kept gate kept + sets brkKeptSrc; own gate sets brkOwnSrc and takes vBREAK only if unset; MTEXIT appends `src=NEXTOPEN|OWNBODY|BOTH` on BREAK (`-` otherwise); priority chain untouched.

## Part T - runs

- T0 RECON62-B136: terminal64 0; content copies terminal.ini.preB136 + Profiles/Charts.preB136; [Tester] Symbol=EURUSD DateFrom=1787702400 DateTo=1788998400 written + read back; launch_recon62_b136.ps1 via WMI (PID 12640 RC=0); STATUS verified window (PRE_JOURNAL_LINES=993725, terminal PID 21568, server dates from 2026.08.26, journal growing); wrapper shell killed (terminal survived); watcher launched (PID 9516 verified); short DONE polls; DONE=PASSED 19:35:57 (~3 min, slot fix live).
- T1 filed-trade table, kept (DEALS_RECON62-B131) vs trial (day-log j993726-1065738; 14 deals #2-15):
- deal 2: sell 28Aug 10:05 1.16466 2.38 | identical | —.
- deal 3: buy 28Aug 11:45 1.16440 2.38, MTEXIT bar=11:40 BREAK D-POC exit=1.16439 | buy 28Aug 11:35 1.16467 2.38, MTEXIT bar=11:30 BREAK D-POC 1.16451 exit=1.16464 src=OWNBODY (J1009864) | MOVES-TO-HIS (deal +3pt vs MTEXIT exit: evaluation-lag class, reported raw).
- deal 4: buy 1Sep 17:35 1.16024 2.05 | buy 1Sep 17:35 1.16024 2.04 | VOLUME -0.01, R-a.
- deal 5: sell 1Sep 17:51 1.15975 2.05, MTEXIT SL | sell 1Sep 17:50 1.15987 2.04, MTEXIT bar=17:45 BREAK Y-POC 1.15987 exit=1.15987 src=OWNBODY (J1024023) | MOVES-TO-HIS (deal = exit exactly).
- deal 6: buy 4Sep 16:00 1.16019 0.57 | identical | —. deal 7: sell 23:55 1.16129 0.57 DAY_CLOSE | identical | —.
- deal 8: buy 7Sep 09:20 1.16138 2.5 | buy ... 2.49 | VOLUME -0.01, R-a. deal 9: sell 10:53 1.16201 2.5 TP | sell ... 2.49 | follows sizing.
- deal 10: buy 16:45 1.16264 3.91 | buy ... 3.9 | VOLUME -0.01, R-a. deal 11: sell 17:13 1.16315 3.91 | sell ... 3.9 | follows.
- deals 12/13/14/15: identical (10:10 1.16205 / 10:42 1.16102 TP / 17:00 1.16220 / 17:26 1.16275 SL) | —.
- STOP evaluation: R-a FIRED (deal count 14 ok; deals 4/8/10 volume -0.01 each; no other column differs on 2/6/7/12-15). R-b passed (deals 3/5 exactly as expected incl. MTEXIT exit). R-c passed (no new deal; all 7 ENTRY_TICKET/EXECUTED rows identical incl. tickets 2/4/6/8/10/12/14 and magics; exactly 2 ownBrk=1 census rows in the segment: A1 11:30 D-POC J1009851 and A2 17:45 Y-POC J1024018). No start_time_changed warning class in STATUS (no GATE/REFUSED lines; RESULT=PASSED).
- Restore: terminal stopped by PID; EA+EX5 restored from .preB136 (EA 90240F23-64char, EX5 6CFD3A46, both verified); terminal.ini + Charts restored from content copies (terminal.ini 4082A94F verified, Charts 20 files); June skipped. Verdict RESTORED.
- T2 not run (R-a path). T3 done inside restore (SHAs above).

## Part X - records (grep first, append once, verify count 1)

- X1 CONTEXT §4: appended the B136 lesson line (relay text verbatim). Verified count 1.
- X2 §5: appended the planner-stated B-136 line. Verified count 1.
- X3 HANDOFF §3: appended with verdict RESTORED (scope words corrected to what happened — RECON62 graded, June skipped on R-a — as in B-134). Verified count 1.
- X4 Ledger 1281, tag B136-BRK-OWNBODY (S0' + S1, K diff summary, T1 table, RESTORED; plus the correction: B-135 R3 called his 11:35 exit "a 25pt better price" — on a short, 1.16464 above the machine's 1.16439 is 25 points less gain; profit never grades per NO-OVERFIT s60, no verdict changes). Verified `1281.`-class 1, `1280.` = 1.
- X5 Pointer (35-line cap): RESTORED; EA+EX5 SHAs (restored, 64-char); `Lane: A2-EXIT (first B-133, 3 of 6)`; goal open. Register untouched (KEPT-only).

## Part F - file, push, reply

- F1 this result. F2 slice (S0' raw, K spots + diff, T tables; under 600 lines). F2b none (no KEPT). F3 ledger 1281. F4 pointer.
- F5 stages result, slice, ledger, pointer, CONTEXT, HANDOFF (never EA/ex5/indicator/includes/logs/journals/inis/profiles/backups/scripts).
- F6 commit + push via backup + ls-remote check. Reply RESTORED.

## Final disk state (RESTORED turn; B-131 kept build back on disk, verified)

- EA `90240F238A0668885E2D39BDAE5271CE3C08D81B7EA1836DB77F52A42E631AF3` (restored, verified) + EX5 `6CFD3A469E434CE0570F2CE04B1C19AD994570042A553EEF18D32569E58D380D` (restored, verified; EX5 matches the EA). Trial hunk preserved only in `Experts/SRJ_FlowNexus_EA.mq5.B136BRK` (585093BF..., uncommitted). Indicator src/ex5 + HTFEngine at gate SHAs, untouched. terminal.ini 4082A94F + Charts restored (no launches pending; no terminal64). Strategy skill, journal CSV, register, spec, FINDING, kit files untouched. Launch/watch scripts + grading script unstaged. No Ex5/source committed.

## Carried note

- None (R-a fired mechanically on the volume column; the mechanism — earlier A1 exit leaves a fuller balance, sizer trims 0.01 — is diagnosed from the rows, and the relay prescribes RESTORED without further questions).

(End of file)
