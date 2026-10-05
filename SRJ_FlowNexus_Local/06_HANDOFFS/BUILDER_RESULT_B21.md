# BUILDER RESULT B-21 - 15m confirmed-wire tried once: behaviorally inert, all six pass marks hold, three still missing; MEASURED (trial record)

Trader summary: the 15-minute fix changed nothing you can see. I rewired the guard to read only the last closed 15m candle, recompiled, and re-ran the whole window: all 3,168 bars read exactly the same votes as before, your four takes fire identically, both refusals hold, and the three missing takes are still missing on the same bars. So the wrong read is not in the wire I changed - it is deeper, inside the engine's confirmed computation itself, and that is the next relay's subject. Verdict MEASURED. The disk is back to the B-20 build, verified; the tried wire is kept as a text copy so it is never lost.

## Part 0/A - start gate
- A1 ls-remote GitHub builder/B-20 returns 69c4dbe (verified, no fallback). Branch builder/B-21 cut from it. git status line count: 80 (dirty tree kept, nothing reset). Remotes: origin = forge (expired, unused); GitHub = `backup` remote; no git-config change.
- Reads in order: AGENTS.md, relay skill, strategy skill (sections 5/8/10/11 pins verified: FIX-NOT-REPLACE + ENGINE-REFINE-KEEPS-VALID-TAKES + REFINE-ONLY lines 91-100; 5M-FLIP-KILL line 116; TAKEN-LINE + SWEEP-TEST-STRICT lines 125-127; 5M-BIAS-AT-ENTRY line 139; 15M-READS line 141), pointer, RESULT_B20 (carried first, C/D, E), RESULT_B17 Part E whole, RESULT_B15 missing-valid rows.
- 0.4 SHAs all match, no STOP-A: EA 964803F4 (688599 B); EX5 7C46B16C; HTFEngine D5FD5B06; FlowLogic.ex5 27B5F272; FlowLogic.mq5 956BF3E3 (newly measured); relay skill C3F3AE85 (52); strategy 2B76301A with 15M-READS present.
- 0.5 backups, never committed: EA.mq5.preB21 964803F4; EA.ex5.preB21 7C46B16C; FlowLogic.mq5.preB21 956BF3E3; FlowLogic.ex5.preB21 27B5F272 (HTFEngine untouched, no backup needed).

## Part P - pre-checks (read-only)
- P1 sites, raw: FlowLogic `input bool inUseConfirmedHTFOnly = false;` (line 252); export block lines 1195-1200 (`h3_b = inUseConfirmedHTFOnly ? g_htfLo.outCBias : g_htfLo.outBias;` + `g_bufHtfLo[target] = (h3_b == "Bull") ? 1.0 : ...`); EA iCustom passes `1, InpFL_HtfLookbackBars, PERIOD_H4, PERIOD_H1, PERIOD_M15, true, 60` (EA 11208-11213) - the 6th positional slot IS inUseConfirmedHTFOnly, so the EA already requests confirmed (comment at EA 11210 says so explicitly). EA guard (EA ~9068-9083): reads `ReadFlow(FL_BUF_HTF_LOW, uj_m15, barShift)` with barShift=1 on the M5 new-bar pass (EvaluateClosedBar(1, ...) EA 12289); NOMATCH kills, PASS stands, BYPASS skips on confirmed bar. HTFEngine: live `e.outBias = retBias` (lines 507-510) vs confirmed `if(barClosed){ e.cBias = retBias; ...}` (lines 512-516); GetOutputs selects by flag (lines 598-605). Buffer mapping verified: EA FL_BUF_HTF_LOW=21 = indicator SetIndexBuffer(21, g_bufHtfLo) - no mapping bug.
- P2 killing rows from j7 (present on disk): 9/1 17:35 LONG - CONFIRMPOLL confirm=1 at 16:50 (j7:26697) killed same-bar by UJALIGN_NOMATCH bear (j7:26702), then NOMATCH bear 16:55 (j7:26836), holder SUPPRESSED (j7:26693/26827); 9/7 09:20 LONG - confirm=1 at 09:15 (j7:47646) killed same-bar by NOMATCH bear (j7:47651), plus NOMATCH 09:05/09:10 (j7:47319/47485), PASS bull 09:20 too late (j7:47817); 9/8 10:10 SHORT - confirm=1 at 10:05 (j7:53908) killed same-bar by NOMATCH bull (j7:53928), 10:10 NOMATCH bull (j7:54114). Pattern on all three: confirmation present, forming-read kills it same bar.
- P3 site chosen: "Hunk M site = FlowLogic HTF-low export line hard-wired to confirmed (outCBias), because the EA already passes true for the input yet the guard consumes forming-inclusive votes (B-17 E2, j7 D4) - flipping the indicator default cannot reach the EA run." HTFEngine untouched; no new buffers/handles (FIX-NOT-REPLACE); P4 skipped (needs new input/slot); taken-skip/UjPoiTargetValid/UJ5MENTRY untouched. Kept-valid context recorded: 8/28 + 9/4 fire via BYPASS (value-immune), 9/7 16:40 + 9/8 17:00 via PASS (value-sensitive) - j8 decides.
- P5 CLEAN: S' hunk = section 11 15M-READS + section 5 FIX-NOT-REPLACE (ordered repair inside export, no second copy, narrow). No STOP-C.

## Part B - one edit (Hunk M only)
- B1 site pasted raw before editing (FlowLogic 1195-1200, real numbers, located by text).
- Hunk M: `string h3_b = g_htfLo.outCBias;` + one-line comment citing §11 15M-READS (W6) + B-17 E1. H1/H2 lines untouched (only the guard's buffer).
- B2 diff .preB21-vs-edited: exactly one hunk, nothing else (comment + hard-wire, +2/-1). Edited source BFF5C51C8B651CC88465654CDCF37C3D2C4EC8B97FEE5B0DCAC892165FD77070, 70425 B, 1473 lines. Kept copy .B21M same SHA (never committed). Full diff: the two changed lines at 1197 only (comment added, h3_b hard-wired).
- B3 compiles (log waited, B-19/B-20 race lesson): FlowLogic 0 errors, 0 warnings, 5790 ms (log B21M_FLOWCOMPILE.log, uncommitted), EX5 FFD77DB7382AE9B60309C2C2EDD7D2945D5AA86AB5CEA96EB4C390680FEF5CF4; EA 0 errors, 0 warnings, 8406 ms (log B21M_EACOMPILE.log, uncommitted), EX5 2FF969117CCAF4B1EB9380328C5AE3B4D1F17F244CD631ADFF34C2F8BFBF75DF (restamp of unchanged source). No STOP-B. No Compile All.
- B4 surface: diff touches only the export line region. Clean.

## Part C - re-proof run j8 (one)
- C0 hygiene: no terminal before launch; RECON62 window via RECON50_DEMO_USD.ini pattern (relative /config not applied - terminal.ini window set directly, as B-18 lesson); restored June USDJPY after, verified.
- j8 = RECON62-B21R0_JOURNAL.log (77275 lines, local unpushed): DONE PASSED, 1:12:14, 563338 ticks, 3168 bars (bench digit-identical), balance 10194.64 (== j7). New indicator binary confirmed in-tester (SRJ BUILD 2026.10.05 10:30:24 in j8 vs 2026.10.04 20:52:13 in j7).
- C1 pass marks: (1) 8/28 identical entry 1.16466 exit 1.16439 ✓; (2) 9/4 entry 1.16018 tp 1.16302 DAY_CLOSE 1.16093 ✓; (3) 9/7 entry 1.16261 TP_TOUCH 1.16315 ✓; (4) 9/8 entry 1.16220 tp 1.16114 SL 1.16274 ✓; (5) 8/27 no fire (ABORT TP_RR_FAIL j8:12080) ✓; (6) 9/1 refused, UJ5MENTRY_REFUSE present (j8:23802, same row as j7) ✓; no must-never-take fired (A6FIRED count is exactly the 4 valids) ✓. All six PASS.
- Three missing valids: still missing, killing rows byte-identical to j7 (9/1 NOMATCH 16:50/16:55 j8:26702/26836; 9/7 NOMATCH 09:05/09:10/09:15 j8:47319/47485/47651; 9/8 NOMATCH 10:05/10:10 j8:53928/54114). Neither improved nor restored.
- C3 filed-trade table (dates first, j7 vs j8): 8/27 no-fire/no-fire; 8/28 identical/identical; 9/1 refused/refused (same REFUSE row); 9/4 identical/identical; 9/7 identical/identical; 9/8 identical/identical. Totals: 4 signals / 8 deals both.
- C4 STOP evaluation: no STOP-A/B/C/S/D (compiles 0/0, run PASSED, kept valids unmoved, refusals hold, no new takes). C2 KEPT path needs improvement - none. Verdict MEASURED (trial measured a negative; not a STOP, not KEPT).
- Key measurement: all 3168 per-bar m15 votes IDENTICAL j7-vs-j8 (machine-compared, 0 differing, same keys) - the hard-wire changed nothing observable. Since the recompiled indicator demonstrably ran, outCBias carries the same votes as outBias on this window (or the EA's positional true already selected confirmed and the flips live inside the confirmed computation). Either way the forming-vs-closed distinction is NOT at the export selection - the read-error mechanism sits deeper (HTFEngine confirmed path), B-22's subject. Disk restored to .preB21 state (EA 964803F4 / EX5 7C46B16C / FlowLogic.mq5 956BF3E3 / FlowLogic.ex5 27B5F272, all verified) to keep the disk at the last proven build; .B21M preserves the tried text.

## Part D - grade detail
- D1 UJALIGN at the three windows, j8 vs j7: identical rows shown above (forming-against on the decision bars, PASS before/after). No forming-vs-confirmed split appeared - both journals read the same votes.
- D2 UJ5MENTRY_REFUSE still present for 9/1 09:55 (j8:23802); zero UNREAD run-wide.
- D3 no j8 take outside the j3/j7 set - no search owed.
- D4 balance 10194.64 (== j7; vs j3/j6 10101.97 - the two removed losers, informational only).

## Part E - final disk state
- EA 964803F4 on disk (688599 B; == .B20SRV, uncommitted); EX5 7C46B16C matches its source (restored restamp of the same source, verified).
- FlowLogic.mq5 956BF3E3 / FlowLogic.ex5 27B5F272 (restored, verified).
- Kept copies, all uncommitted: .preB21 EA 964803F4 / EX5 7C46B16C / FlowLogic.mq5 956BF3E3 / FlowLogic.ex5 27B5F272; .B21M BFF5C51C (tried hunk text).
- terminal.ini [Tester] June USDJPY (Symbol=USDJPY, 1780272000/1781308800), read after the terminal exited (idle leftover stopped; otherwise the next pre-flight refuses).
- No terminal running.

### Glossary (every journal code cited, few words each)
- UJALIGN_PASS/NOMATCH/BYPASS (m15/rf): 15m guard. UJPROBE (ltf/m15/div): per-bar bias/div probe. A6FIRED: fire record. ALERT SRJ SIGNAL/EXIT: entry/exit alert. CONFIRMPOLL (confirm): confirmation terms. SUPPRESSED (HELD): holder kept. CONFIRM_STRUCT_FAIL (A_OPP/C_TOUCH): structure fail. UJ5MENTRY_REFUSE/UNREAD: entry-bias refusal. TPCENSUS (winner/best/distPts/admitted): target census. UJ1R (POLL/FIRELOCAL/FIRE/PASS/FAIL): R check. SIDE1O_ELIGSTATE (slRef/rLive/livePass): eligibility. SLNONFIRE (RR_FAIL): no-fire. ABORT (TP_RR_FAIL/LTF_MISALIGN): abort + reason. A6REFUSED (predicate): refusal. SIDE1D_BOTHDIRS/SIDE1H_WOULDPREEMPT: contention. MTSNAP/ENTRY_TICKET/MTEXIT/MTCLOSE/MTLIFE: election, fill, exit, close, life records. SIDE1Y_PDSESS: previous-day session extremes. SWINGPICK (SH/SL/atShift): swing extremes. SEL52 (px/bt/slot): stop-ladder rungs. S3INPLAY (barLo/barHi/close): zone bar print. EXITCENSUS: per-line exit census. UJDTTERMS/CQDRECHECK: retest/CQD diagnostics. IDCHANGE: candidate identity. UJPOOLCOV: pool coverage. BIASCENSUS_FINAL/ZONECENSUS_FINAL/WS161_CENSUS: end censuses. XOB-PROMOCENSUS: indicator OB print. SRJ BUILD: indicator build stamp.

## Part F - files, push
- F1 this file. F2 pointer updated (B-21 MEASURED; disk SHAs + kept copies; Next = relay B-22).
- F3 commit + push to builder/B-21 on GitHub ONLY: BUILDER_RESULT_B21.md, BUILDER_SESSION_POINTER.md. Unpushed: EA, EX5, FlowLogic.mq5/ex5, .preB21 set, .B21M, compile logs, j8, STATUS/DONE files. (No skill banking this relay - no new operator words.)
- F4 ls-remote check, pasted in the reply.

## Carried note (for the planner; B-22 per its plan)
- P3 site chosen and why: Hunk M site = FlowLogic HTF-low export hard-wired to confirmed (one line + comment), because the EA already passes true for the input yet the guard consumes forming-inclusive votes - flipping the default cannot reach the EA run. File: Indicators/SRJ_FlowLogic.mq5.
- j8 fate of the three missing valids: all still missing on byte-identical killing rows (listed in D1) - neither fired nor moved.
- Confirmed-vs-live print: none exists (P4 skipped - needs new input/slot; SRJ-HTF-UJDBG rows are zero in all journals). The comparison was done machine-side instead: 3168/3168 m15 votes identical j7-vs-j8.
- No "no ruling found" questions (no D3 takes; P4 gap search was B-20's, unchanged).
- Gap half of W1 still UNBUILT (unchanged).
- If RESTORED were needed it is not: no STOP fired, disk already at B-20 state (verified SHAs), .B21M preserves the tried wire for B-22.
- Owed to B-22: the read-error mechanism is NOT the export selection (proven inert this trial). Live candidates with record support: HTFEngine confirmed path follows forming data (cBias/outCBias computation, lines 494-516), or the EA-consumed confirmed vote is computed from the forming bar somewhere upstream of the export. j8 (77275 lines) carries the full inert-wire record; j7 is its identical twin on votes.

(End of file)
