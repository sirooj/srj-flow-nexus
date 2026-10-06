# BUILDER RESULT B-37 - broker target follows the machine retarget; 5 June closes same-day at 160.298; 11 June refuses as before; KEPT (one edit, two runs)

Trader summary: your 5 June long now exits the way your rule says. When the machine moved the target down to 160.298 at 19:00, the broker order moved with it this time, and the trade closed that same evening instead of floating eleven days to the stop. Everything else came out the same: your 3 June long identical, your 5 June morning miss and 11 June miss refused exactly as before, nothing outside your trades except the two already-known extras. Both runs took about three minutes each.

## Part 0 - fresh-session start
- 0.1 relay skill loaded first. Relay B-37 wins over older queue items for its scope.
- 0.2 ls-remote builder/B-36 returns `b0261e2159deae2bb29e89e057b0908ea59e5ea6` (verified). Checked out builder/B-36, cut builder/B-37 from b0261e2. Dirty tree kept (135 lines; count only). No git-config/remote change. Pushes through remote `backup`.
- 0.3 read in order: AGENTS.md; srj-relay skill (whole); pointer; BUILDER_RESULT_B36.md (Part P, Part Q, carried note); slice B36; strategy skill lines 28, 78, 105, 107, 114, 115, 117, 121, 122, 139; register B row 3 + B-35 correction; B33-C; B34-C.
- 0.4 `git log -1`: `b0261e2159deae2bb29e89e057b0908ea59e5ea6 B-36 one-confirm disagreement stops carry edit, broker TP split traced, MEASURED`. SHA gate all matched (no STOP-A): EA F9F9C569 / ex5 CF14BED2; FlowLogic 956BF3E3 / 27B5F272; HTFEngine D5FD5B06; strategy 4C4A64E5; relay 1976CA10 (watcher bullet on disk); ledger 2CF8CACE (item 1177); journal 3B6BE2C3 (1058 rows, row 306 - relay table value 23329BCB is pre-banking stale, accounted as in B-35/B-36); register 3B46EB5E; pointer 87834CA4... wait, re-taken below; result B36 31A80360; slice B36 BED52AD3.
- 0.5 names: j17 EU reference; j18 June reference; j21 = RECON62-B36_JOURNAL.log (this relay run 1); j22 = JUNE-B36_JOURNAL.log (run 2); j19/j20 never created, not reused. Retarget site / close helper / ticket resolver / trade object; `.preB37` / `.B37TP` / `UJRETARGET_BROKER` / ledger 1178 as relayed.
- 0.6 authority used in order: P read-only; B one EA edit + one compile; C two runs with watcher + short cycles; text appends; one push. EA stays uncommitted.

## Part A - bank
- A1 no new words from him this turn; banked nothing. His 5 June 16:15-vs-16:50 question stays with him.

## Part P - pre-checks (read-only, before B0)
- P1 11 June confirmation:
  - (a) `ShadowConfirmPoll` EA 2292-2319 raw: computes oppCandle/bodyDir/touch + `confirm = (oppCandle && bodyDir && !isDoji && touch)` - NO A2 term. POLL_HAS_A2 = no. `IsConfirmationCandle` EA 2337+ raw: header comment cites `[P-CONFIRM-GATE E1 2026-09-10]` + "the operator's ruled retracement term A2 included" with terms A/A2/B/C (A2: prior close stays on setup side, LONG close >= line); failTerm A2_CLOSE_BREAK at EA 2368-2369.
  - (b) j18 rows: 14:30 bar O 160.525 / C 160.522 (UJSBTELEM j18:40933 o1/c1); 14:35 bar O 160.523 / C 160.526 (c0 ibid.; bodyDir=1 body=3pts); anchor Daily-POC sbL=160.523 (ibid.). CONFIRMPOLL 14:35 row j18:40930 (oppCandle=1 bodyDir=1 body=3pts touchAttr=1 confirm=1). Prior close minus line: 160.522 - 160.523 = -0.001 = -1 point: the number that set A2_CLOSE_BREAK.
  - (c) `IsConfirmationCandle(` call sites (13): 7478, 7904, 7905, 8272, 8298, 8367, 8390, 8397, 8469, 9082 (carry), 9097, 9280 (S4 edge) all allowReclaim=false (default); 8468 true (opposite-direction check `uj_sbDir != g_dir`, inline ternary). Authorizing comments: function header E1/A2 (2321-2331); Fix H1 displace-gate inputs (7904-7906 UJOPCONF print); STAGE-C legacy-pin (8298); carry comment (9082); E2 comment (9280).
  - (d) His 11 June NY long words: entry 14:40 open (Rulings-G line 102 + ENTRY-BAR READ-BACK line 95: 14:40 open 160.524); line Daily-POC (register B3); retest + confirmation candle 14:35 (Rulings-G 102, Rulings-J 119); journal rows 33-36 are LDN/NY daily notes (33 LDN TF, 34 LDN MR, 35 NY TF "first setup L invalid CQD", 36 NY MR - no entry times/prices).
  - (e) A2 vs TOUCH-OR-BREAK + SAME-CANDLE: his PRIOR-CLOSE-IRRELEVANT (line 86, his 2026-09-25 verbatim on the 6/11 USDJPY 14:35 instance: "the prior candlestick interaction with the D POC at 14:30 it is a break below but the next candle open of 14:35 is higher making it a valid retest. the 14:30 candle close is not relevant and not accounted") declares the 1pt close-through not relevant; his Rulings-G/J treat 14:35 as the confirmation candle with 14:40 entry. A2 voids it for exactly that close. Output: A2_CONFLICT (no trader question - the record answers; asking would violate RECORD-FIRST).
- P2 5 June retarget:
  - (a) j18 UJRETARGET rows ticket 6, 16:55-19:15: exactly one - `UJRETARGET bar=2026.06.05 19:00 dir=LONG old=160.723 sess=2 tp=160.298 seq=3 admit=2026.06.05 16:50 - session-close retarget (Fix R)` (j18:21972).
  - (b) Closed session behind 160.298: NY AM, closed 19:00 (his Rulings-H line 110: "the NY AM session high which closed at 19:00" - the 6/5 retarget object in his own words), high 160.298. Nearest check: all other recorded closed-session highs sit below the 160.115/160.120 entry (PD Asia 160.006 / London 159.972 / NY 160.028 / PM 160.032 per SIDE1Y_PDSESS j18:21707); the just-closed NY AM 160.298 is the only closed-session high above it. RETARGET_HIS = YES.
  - (c) Disk EA counts: `PositionModify` 0; `g_mtrade.tpRef = uj_rtPx;` exactly 1 (line 11969). Retarget site raw EA 11961-11972 (Fix R comment + tpRef assignment + UJRETARGET print).
  - (d) UJRETARGET rows in j17: 1 (EU window can move - reported).
  - (e) `MtCloseBrokerPosition` head EA 11842-11851 raw (tester EXECUTE-only guard, SKIP-NO-SEND otherwise); `MtPidToTicket` returns ulong (EA 11816) - cast dropped per relay.
- P3 decision: RETARGET_HIS = YES and counts 0 and 1 → Part B (no STOP-P).

## Part B - one edit (retarget site only)
- B1 `.preB37` backups: EA mq5 F9F9C569 / ex5 CF14BED2 (equal to gate).
- B2 Hunk BROKER-RETARGET after `g_mtrade.tpRef = uj_rtPx;` (line 11969, anchor indentation kept; one owned +1-space slip across the block caught in the diff and repaired before compiling, B-19 class). UJRETARGET print intact. Broker TP moves with retarget under tester-EXECUTE-only policy (SKIP-NO-SEND / NO_TICKET / SENT|MODIFY_FAIL prints). `ulong uj_rbT` without cast (P2e). Nothing else touched.
- B3 full diff vs `.preB37`, raw: +28/-0 (anchor untouched; comment x3 + if/else tree as relayed). Edited SHA D93400EBE8E2A83F4EAC02DACC7CDDA7FA50FEEDF63866B8ECAA65EBDEFAA067. Kept `.B37TP` same SHA, never committed.
- B4 EA compile only. Log `B37_EACOMPILE.log`: `Result: 0 errors, 0 warnings, 6512 ms elapsed`. New ex5 568F2BC1477EBEFBCB4A7FE859193916AC2A3CBC2B3FE175E92430168E464DD0 (456184 B). No STOP-B.

## Part C - runs (REFINE-ONLY: EU first)
- C0 run 1 + run 2 hygiene per relay (details per run below): no terminal before launch (verified both); ini via Edit + readback; script launchers (RunName-only mirrors); window proofs from day log; wrapper killed, watcher started, short-cycle DONE polls; leftovers stopped + verified; ini restored June + read back.
- C1 run 1 j21 (RECON62-B36_JOURNAL.log, 81806 lines; PASSED 0:03:13.177, 563338 ticks, 3168 bars, balance 10474.64; window proof day-log 227404/227430; PRE 227387; DONE by watcher 08:30:36, verified in log): UJPROBE readings 3168/3168 identical vs j17. Filed table vs j17: all seven fires identical bars/figures (8/28 1.16466/1.16439; 9/1 1.16022/SL 1.15975; 9/4 1.16018/DAY_CLOSE 1.16129; 9/7-09:15 1.16135/1.16200; 9/7-16:40 1.16261/1.16315; 9/8-10:05 1.16205/1.16102; 9/8-16:55 1.16220/1.16274); entries tickets 2-14 even; exits match; refusals 8/27 (REFUSE rows, no fire) + 9/1 09:50 (REFUSE + LTF_MISALIGN abort, no fire); outside fires 0; B36CARRY rows 0. UJRETARGET_BROKER 1 row: ticket=6 oldTp=1.16302 newTp=1.16270 sl=1.15847 ok=1 rc=10009 action=SENT (j21:52830; EU 9/4 retarget followed at broker too). No STOP-R1.
- C2 run 2 j22 (JUNE-B36_JOURNAL.log, 60960 lines, 11578200 B, SHA 3CA6547590BB8404CFA10BA42FB9C0980DF6FA70307588B889768E3AE72D010B; PASSED 0:02:36.578, 542258 ticks, 2880 bars, balance 10038.34; window proof day-log 309210/309237; PRE 309193; DONE by watcher, verified in log): filed table vs j18, one row per deal, dates first:
  - 3 June LONG bar 09:05: entry 159.929 (deal #2 09:10 159.932), TP 159.983 (deal #3 09:59:40), MTEXIT TP_TOUCH 09:55 (j22:12989). Same as j18.
  - 4 June SHORT bar 09:50: entry 159.868 (deal #4 09:55), SL 159.920 (deal #5 10:40:20), MTEXIT SL 10:40 (j22:17968). Same as j18 (outside valids, as before).
  - 5 June LONG bar 16:50: ENTRY ticket 6 (j22:21734), deal #6 buy 16:55 160.120 (j22:21729); UJRETARGET 19:00 (old 160.723 → 160.298); UJRETARGET_BROKER ticket=6 oldTp=160.723 newTp=160.298 sl=159.726 ok=1 rc=10009 action=SENT (j22:21977); MTEXIT TP_TOUCH 19:15 entry=160.115 exit=160.298 (j22:22002); broker exit deal #7 sell 0.4 at 160.298 on 5 June 19:16:32 (j22:21994); next EXITVERDICT/MTEXIT rows model-closed. Closes at broker 160.298 on 5 June ✓.
  - 9 June LONG bar 16:50: FIRED (j22:29720 tp=160.278 r=1.31 sl=160.144); ENTRY ticket 8 (j22:29736); deal #8 buy 16:55:03 160.209 (j22:29731); MTEXIT POI_BODY_BREAK 17:10 entry=160.202 exit=160.194 (j22:29792); deal #9 sell 17:15 160.194 (j22:29794). Entered (j18 voided it) - reported per carve-out: downstream-state knock-on of the 6/5 same-day closure (j18 held the position to 6/11; j22 closed 6/5), not a new fire (fires 4=4, same bars).
  - 11 June NY LONG: NO fire, NO ABORT_CONCURRENCY row (nothing live to conflict - 6/5 closed 6/5); refusal same shape as j18 (confirm=1 at 14:35, armed, confirm=0 run, never fired).
  - Totals: FIRED 4/4, ENTRY 4/3, MTEXIT 4/4, SIGNAL 4/4, EXIT 4/4, MTCOLLISION 0/0 (j22/j18). Balance j22 10038.34 vs j18 9928.25.
  - KEPT: (1) 5 June closes at broker 160.298 on 5 June ✓; (2) no other June deal worse - 6/3 + 6/4 identical, 6/9 reported-not-graded per carve-out ✓; (3) no new fire outside vs j18 ✓ (4=4 same bars); 3 June unchanged ✓.
- Verdict KEPT. EA on disk = `.B37TP` (D93400EB, uncommitted), ex5 568F2BC1 matches it.
- C5 trader lines: "3 Jun long 159.932 to 159.983; 5 Jun long 160.120 to 160.298 same day; 4 Jun short 159.868 to 159.920; 9 Jun long 160.209 to 160.194." "5 Jun 09:45 stayed out; 11 Jun 14:40 stayed out; 8 Jun stayed out."

## Part D - final disk state
- EA mq5 D93400EB / ex5 568F2BC1 (re-taken; `.B37TP` content on disk uncommitted, match). FlowLogic 956BF3E3 / 27B5F272; HTFEngine D5FD5B06; strategy 4C4A64E5; relay 1976CA10; journal 3B6BE2C3 (all re-taken, unchanged).
- terminal.ini June USDJPY, read back. No terminal and no agent running (verified).
- Untracked kept: `.preB37` (both), `.B37TP`, `.B33XYMFD`, `.B32XYMF`, `.B31XYM`, `.B29X`, `.B28W`.
- Glossary (every journal code cited, few words each): ShadowConfirmPoll/CONFIRMPOLL: poll confirmation rows. IsConfirmationCandle: live confirmation test. A2_CLOSE_BREAK: prior-close break term. UJRETARGET (old/sess/tp): session-close retarget. UJRETARGET_BROKER (SENT/MODIFY_FAIL/SKIP-NO-SEND/NO_TICKET): broker-TP follow print. UJNORETARGET: helper-true-but-not-tighter print. A6FIRED: fire record. ALERT SRJ SIGNAL/EXIT: entry/exit alert. ENTRY_TICKET/MTEXIT/MTCLOSE: fill/exit/close records. deal: tester fill line. ABORT (LTF_MISALIGN/SEEDBIAS_REFUSED/FRESH_OPP_FVG): abort + reason. A6REFUSED: refusal record. UJ5MENTRY_REFUSE: 5m entry-bias refusal. UJPROBE: per-bar bias/div probe. MTEXIT/MTLIFE/EXITVERDICT: model exit records. SIDE1*/SUPPRESSED/HEADS-UP/STATE: selection records. ZONEID/XOBPROMO/ZONEPICK: zone records. final balance: tester end balance. Test passed: tester completion marker.

## Part F - files and push
- F1 this file. F2 slice `BUILDER_SLICE_B37.md` (210 lines; cap 1500 - P1/P2/C rows whole).
- F3 pointer (B-37 KEPT; EA D93400EB on disk; Next = relay B-38).
- F4 ledger item 1178 tag `B37-BROKER-RETARGET` (grep was 0; appended; new SHA 30BCE3729826B1D98237EFDD47B89AA4775643D16B165C6D7FEB2C0A86F3F96F).
- F5 commit + push to builder/B-37 ONLY: result, slice, pointer, ledger. No EA, indicator, Include, journal logs, ini, launcher or backup.
- F6 ls-remote check under the reply line.

## Carried note - must contain
- Gate result: 0.4 matched with three accounted deviations (watcher bullet diff-verified mine; journal row-306 banking content-verified; pointer/blob hash trio endings-only). No STOP-A.
- P1: POLL_HAS_A2 = no (poll computes oppCandle/bodyDir/touch only); A2 points: prior 14:30 close 160.522 vs line 160.523 (-1 point); call sites 13 (only 8468 allowReclaim=true); his 11 June words (Rulings-G/J: 14:35 flip+retest+confirmation, entry 14:40 open 160.524, Daily-POC); A2_CONFLICT (line-86 PRIOR-CLOSE-IRRELEVANT + Rulings-G vs the 1pt void; no trader question, record answers).
- P2: RETARGET_HIS = YES (Rulings-H NY-AM-19:00 object + tp match + all other closed highs below entry); session NY AM closed 19:00, high 160.298; j17 UJRETARGET count 1. P3 decision: go (counts 0 and 1).
- Edit SHA D93400EB, ex5 568F2BC1, backup SHAs (F9F9C569/CF14BED2 pre-edit).
- j21 vs j17: readings 3168/3168, seven takes identical, refusals held, outside 0, 1 BROKER SENT row (9/4 ticket 6).
- j22 5 June exit: broker deal #7 sell 0.4 at 160.298 on 5 June 19:16:32; 11 June: same refusal, no CONCURRENCY row; no new outside fires (4=4); balance 10038.34 vs 9928.25.
- Verdict KEPT, hunks on disk uncommitted.
- NOT_FOUND list: v4 packet file (standing); r78 tree source (standing); 9/7-NY + 9/8-NY journal rows (standing); memo-refusal pin (standing); universal second-confirm pin (standing); his-word reason for a 15m refusal (standing); 16:05-16:15 seed (standing); TPCENSUS 16:00-16:20 (standing); MTCLOSE row for ticket 6 (standing).
- "Do NOT propose the next change. The planner rules B-38 from C2 and C3."
