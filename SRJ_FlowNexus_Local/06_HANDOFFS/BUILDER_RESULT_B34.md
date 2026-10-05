# BUILDER RESULT B-34 - first June USDJPY measure on the KEPT tree: 3 June hit, three misses diagnosed, two new fires, 8 June silent; MEASURED (no edit, one run)

Trader summary: your June window ran clean on the same build as your EU week. Your 3 June long tradedalho exactly like the reference run. Your 5 June morning short and your 5 June afternoon long did not come - the morning one was refused on the 5-minute read, the afternoon one died on the seed check, both exactly like the reference run. Your 11 June long got further than ever before - it confirmed and armed - but no second confirmation came so it never fired. Two trades appeared that are not yours (4 June short and 9 June long, one traded one stopped early), and your 8 June invalid stayed silent. The run took under three minutes.

## Part 0 - fresh-session start
- 0.1 relay skill loaded first. Relay B-34 wins over older queue items for its scope.
- 0.2 ls-remote builder/B-33 returns `e6e4934d49529d684a64626f305b70a0b99d6e0a` (verified). Checked out builder/B-33, cut builder/B-34 from e6e4934. Dirty tree kept (133 lines; count only). No git-config/remote change. Pushes through remote `backup`.
- 0.3 read in order: AGENTS.md; srj-relay skill (whole); srj-strategy skill sections 1 (21-36), 5, 7 (103-108), 8, 9 (119-123), 11 (W2/W4/W6), 12; pointer; BUILDER_RESULT_B33.md (carried note, C0, C2, D); register, whole (51 lines); RECON78 result PASS A/B + 11 June (lines 1-35); USDJPY-MISSES head + three miss sections (lines 1-37).
- 0.4 `git log -1`: `e6e4934d49529d684a64626f305b70a0b99d6e0a B-33 9/4 exit back on Friday 23:55 at 1.16129, KEPT`. SHA gate all matched (no STOP-A): EA F9F9C569DCAC5B87660D1E82B77857966FEA1CD0617B732BFCB28205E04F7631; ex5 CF14BED2CCF14BC5B140F8BD57BF91141484144300288D1E150511D939445696; FlowLogic 956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342 / ex5 27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90; HTFEngine D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755; strategy E238A9D69638ABE627D231DD74BB4E14BD65C30F46ADD2CCA0F368FD6B88DB48; relay 20A310470BCD0EB83A3622700FF57F6617830B500AC6D498F94F97CCCC378C21; ledger 1597B24523E3AC7EB6E40EDA4D687C37F1464BCEA4063E18EA1FCE3FD02984DF (item 1174); journal 23329BCB141E67AC3799406A038839F335DD8AAE4A8B2D4BB73CC8AF34298B6E64858CA9BAACC44B (1057 rows); register 18B0F39BE9E6299FFAB4A668B7D26F039DA803231447EF71830495813CE4F430 (reported).
- 0.5 names: j17 (EU reference), r78 (June reference: E80FF0C2/DDA32570, 1:03:31, 542258 ticks, 2880 bars), j18 = JUNE-B34_JOURNAL.log (this relay). June window 1780272000/1781308800 USDJPY. Run ini USDJPY_DEMO_JUNE.ini. Launcher `launch_june_b34_run.ps1` (mirrors b33; only RunName + ini differ; recon77 launcher used as reference).

## Part A - records
- A1 no new words; bank nothing beyond F4.
- A2 stale register cell (grep-first): `B-33 j17` count 0 → appended `- CORRECTION 2026-10-06 (B-33 j17:53800/53804): row 3 exit is DAY_CLOSE Friday 9/4 23:55 at 1.16129 (EXECUTION PINNED 2026-09-25); the 1.16093 cell is the retired next-day-open fill.` at the end of section A; row 3 itself untouched. Post-edit count 1.

## Part P - record-first pre-checks (read-only, before the run)
- P1 his June owed set (records only; UNKNOWN never inferred):
  - 3 June London LONG: retest UNKNOWN (register/journal silent) | confirmation UNKNOWN | entry bar 09:10 open (register C; r78 deal #2 09:10 159.932) | entry price 159.929 [register C] (deal 159.932 same as r78) | anchor UNKNOWN | exit TP 159.983 (register C; r78 deal #3 09:59:40) | VALID (register C; his 4-valid word 2026-09-27).
  - 5 June London SHORT: retest 09:35 (register B1, message-C) | confirmation 09:40 (register B1) | entry bar 09:45 open (register B1; 159.948 R2.00 on v26) | entry price 159.948 (register B1; r78 deal #4) | anchor Daily-POC (register B1) | exit TP 159.900 (r78 deal #5 12:19:21) | VALID (register B).
  - 5 June New York LONG: retest UNKNOWN | confirmation UNKNOWN | entry owed 16:15 (register B2; P2 question below) | entry price UNKNOWN (no journaled price; r78's 16:55 fill 160.120 is machine, never his) | anchor Old high 160.723 April-30 day high [HIS per register B2] | exit UNKNOWN (never taken) | VALID (register B: his missed).
  - 11 June New York LONG: retest 14:35 Daily-POC LONG (register B3; RECON78:23) | confirmation 14:35 (register B3) | entry bar 14:40 open (register B3; 160.524 per RECON78:23) | entry price 160.524 (RECON78 result; no journal row) | anchor Daily-POC (register B3) | exit UNKNOWN | VALID (register B).
  - 8 June SHORT: INVALID (strategy section 8: 5m bullish flip during setup; 8-June invalid winner; journal row 21 is a daily note only). All trade columns UNKNOWN except status.
  - Other June rows: journal LDN daily rows 1/5/9/13/17/21/25/29/33/37 (6/1-6/11) are daily notes, no trades; no NY rows, no entry prices.
- P2 5 June NY entry bar: register B row 2 says owed 16:15; strategy 6/5-TIMING (section 8) rules the 16:05 refusal correct (16:50 flip) but names no entry bar; record-first search ("5 June New York entry", "16:15", "16:55", "JUN05NY" over skill, June journal rows, ledger items after 1092, findings) returns only the standing 16:15 (register B2; MISSES line 7 "6/5 NY TF, 16:15: EA missed" - builder text recording his row, never a new word). No later word of his names another bar.
  - `JUN05NY_ENTRY = NO_RULING_FOUND` (search terms above). Standing register value 16:15 noted but not his verbatim.
  - Question for him (trader words, asked only if the record stays silent - it does): "5 June New York long off the old high: is your entry the 16:15 open or the 16:55 open?"
- P3 window read-back: no terminal and no agent running (both verified). terminal.ini [Tester] already USDJPY / 1780272000 / 1781308800 (read 413-420; B-33 left it on June): values equal, no edit.
- P4 r78 reference rows (ENTRY_TICKET/MTEXIT/MTCLOSE/deal, payloads, all 12 in slice): 6/3 deal #2 buy 159.932 + ENTRY bar 09:05 + deal #3 sell 159.983 + MTEXIT TP_TOUCH 09:55 entry=159.929 exit=159.983; 6/5 deal #4 sell 159.948 + ENTRY bar 09:40 + MTEXIT TP_TOUCH 12:10 entry=159.948 exit=159.908 + deal #5 buy 159.900; 6/5 deal #6 buy 160.120 + ENTRY bar 16:50 + MTEXIT TP_TOUCH 19:15 entry=160.115 exit=160.298; 6/11 deal #7 sell 159.725.

## Part C - one run j18 (JUNE-B34_JOURNAL.log, 63754 lines, 12110752 B, SHA 051914F9696164B4B627254B41C5BCA479A9E7A9993C989EFA5F0D56EBB3A2CE, local unpushed; no edit, no compile)
- C0 hygiene as B-33 C0: no terminal before launch (verified); ini already June (no edit); launcher `launch_june_b34_run.ps1`; attempt 1 voided by infrastructure (history-download timeout 05:26-05:28, "no history data", no testing-of line - void, retried once after stopping leftovers, relaunched 05:35:40, PRE_JOURNAL_LINES=81830); attempt 2 window proof day-log 81845 `testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.06.01 00:00 to 2026.06.13 00:00` (+81871 started-with-inputs) - no STOP-J; wrapper exited clean on PASSED by itself (RESULT=PASSED, DONE written, no kill needed); graded from day log; completed 05:41:06 `542258 ticks, 2880 bars ... Test passed in 0:03:03.654` (run time 3:04 - fast, no "shift back"); leftover terminal + orphan agent stopped (both verified gone); ini left on June + read back.
- C1 filed-trade table j18 vs r78, one row per deal, dates first (segment lines; full rows in slice):
  - 3 June London LONG bar 09:05: entry 159.929 (deal #2 09:10 159.932), broker TP/SL at entry UNKNOWN on record (no TP/SL line printed; r78 same shape), managed MTEXIT TP_TOUCH bar 09:55 entry=159.929 exit=159.983 (j18:12986), deal #3 sell 09:59:40 at 159.983 (j18:12974). r78: same bars/prices/deals.
  - 5 June London SHORT bar 09:40: NO fire in j18 (refused 09:40, rows below). r78: ENTRY bar 09:40, deal #4 09:45 159.948, MTEXIT TP_TOUCH 12:10 exit=159.908, deal #5 12:19:21 159.900.
  - 5 June NY 16:50 LONG: ENTRY bar 16:50 (j18:21731 ticket 6), deal #6 buy 16:55 at 160.120 (j18:21726); managed MTEXIT TP_TOUCH 19:15 entry=160.115 exit=160.298 (j18:21992); broker stop deal #7 sell 6/11 22:30:51 at 159.725 (j18:47855). r78: identical bars/prices/deals.
  - 9 June 16:50 LONG: FIRED bar 16:50 (j18:29710 tp=160.278 r=1.31 sl=160.144) then FRESHCOUNT ABORT FRESH_OPP_FVG 17:10 (j18:29791-29793); no ENTRY. Not owed.
  - 4 June 09:50 SHORT: FIRED bar 09:50 (j18:17823 tp=159.368 r=9.62 sl=159.920); ENTRY bar 09:50 (j18:17839 ticket 4); deal #4 sell 09:55 at 159.868 (j18:17834); MTEXIT SL 10:40 entry=159.868 exit=159.920 (j18:17965); deal #5 buy 10:40:20 at 159.920 (j18:17951). Not owed.
  - Totals: SIGNAL 4/3, FIRED 4/3, ENTRY_TICKET 3/3, MTEXIT 4/4, deals 7/7, MTCLOSE 2/0 (j18/r78; r78 counts from its result file). Final balance j18 9928.25 (day-log 217611) vs r78 (reported, not graded).
- C2 owed vs got (equal = equal, no points allowance):
  - 3 June London: HIT (fire bar 09:05, deal 09:10 159.932 = r78; elected 159.929 = register).
  - 5 June London 09:45: MISS (UJ5MENTRY_REFUSE bar 09:40 ltf=+1.0 j18:20688 → ABORT LTF_MISALIGN j18:20689; r78 took it).
  - 5 June New York: P2 NO_RULING_FOUND → 16:15 column: MISS (SEEDBIAS_REFUSED 16:05, rows below; never re-seeded 16:10/16:15/16:20); 16:55 column: present as in r78 (deal #6 160.120, same split). Neither column graded.
  - 11 June NY 14:40: MISS (confirm=1 at 14:35 j18:40930 → S4 armed → confirm=0 run 14:40-15:05 → held, never fired; r78 never confirmed).
  - 8 June SHORT: silent yes (no FIRED on 6/8 in j18).
  - HITS=1, MISSES=3 (5/6 LDN, 5/6 NY-16:15, 11/6 NY).
- C3 first blockers (retest→entry+1 rows in slice):
  - 5/6 LDN: UJ5MENTRY_REFUSE bar 09:40 dir=SHORT anchor=Daily-POC ltf=+1.0 (j18:20688; 5m entry-bias refusal) → ABORT LTF_MISALIGN (20689). FIRST_BLOCKER=UJ5MENTRY_REFUSE-09:40. vs r78: new (r78 took the trade, no refusal row).
  - 5/6 NY: S2SEEDBIAS_KILL bar 16:00 (j18:21152) → ABORT SEEDBIAS_REFUSED 16:05 (21153); RETESTBOOK 0 at 16:10/16:15/16:20, never re-seeded. FIRST_BLOCKER=S2SEEDBIAS_KILL-16:05. vs r78: same (register + RECON78:18 record the 16:05 SEEDBIAS refusal).
  - 11/6 NY: confirm=1 at 14:35 (j18:40930, S4 armed, HEADS-UP) then confirm=0 at 14:40 (41120), 14:45-15:05 confirm=0 run, FRESHCOUNT HOLDs, never fired. FIRST_BLOCKER=post-confirm CONFIRMPOLL-confirm=0 run (first 41120). vs r78: different (r78: suppression behind the SHORT holder, LONG never confirmed).
- C4 exits per position:
  - (a) managed vs actual: 6/3 TP 09:55 159.983 vs deal 09:59:40 159.983 (same price; deal stamped after the bar); 6/4 SL 10:40 159.920 vs deal 10:40:20 159.920 (same); 6/5 model TP_TOUCH 19:15 160.298 vs broker stop 6/11 22:30:51 159.725 (not same - the r78 split); 6/9 no position (model POI_BODY_BREAK exit on nothing: MTEXIT 29814 + MTCLOSE NOTHING-TO-CLOSE 29815 + MTCLOSE_FAIL 29816).
  - (b) open at 23:55: the 6/5 LONG lived through 23:55 bars 6/5-6/10 with no DAY_CLOSE fill (no DAY_CLOSE rows in j18); filled only by the 6/11 broker stop. 23:55 fill: no.
  - (c) alive across sessions/days: 6/5 16:50 LONG alive 6/5 16:55 → 6/11 22:30:51 (broker stop 159.725).
- C5 outside fires (NEW_FIRES_OUTSIDE=2): 6/4 09:50 SHORT (decision rows 17457-17502: RETESTBOOK 0 at 09:40, confirm=0; 09:45 hits=1, confirm=0; REGIMECENSUS votes=2 trendOk=1; UJALIGN_PASS 17502; fired, traded, SL exit); 6/9 16:50 LONG (rows 29304-29343: seed 16:45, UJALIGN_PASS 29343; fired, FRESH_OPP_FVG abort 17:10, no entry). 8 June stayed silent: yes.
- C6 STOP rules: STOP-A no (gates matched); STOP-J no (window proof exact). No revert STOP applies (nothing edited). Verdict MEASURED.

## Part D - final disk state
- EA mq5 F9F9C569 / ex5 CF14BED2 (re-taken, unchanged; Hunks X+Y+M+F+D on disk uncommitted). FlowLogic 956BF3E3 / 27B5F272; HTFEngine D5FD5B06; strategy E238A9D6; relay 20A31047; journal 23329BCB (all re-taken, unchanged).
- terminal.ini June USDJPY (1780272000/1781308800), read back ([Tester] block; other sections untouched).
- No terminal and no agent running (verified).
- Untracked kept: `.preB33` (both), `.B33XYMFD`, `.B32XYMF`, `.B31XYM`, `.B29X`, `.B28W` (+ B-34 adds nothing: no edit, no backup).
- Glossary (every journal code cited, few words each): A6FIRED: fire record. A6REFUSED: refusal record. ALERT SRJ SIGNAL/EXIT/HEADS-UP: entry/exit/arm alerts. ENTRY_TICKET/MTEXIT/MTCLOSE/MTCLOSE_FAIL: fill/exit/close records. deal: tester fill line. ABORT (LTF_MISALIGN/SEEDBIAS_REFUSED/FRESH_OPP_FVG): abort + reason. A6REFUSED predicate: refusal cause. UJ5MENTRY_REFUSE: entry-bias refusal. RETESTBOOK: retest-hit book. ANCHOR_ELECT (SEED): seed election. CONFIRMPOLL (confirm): confirmation terms. REGIMECENSUS: regime vote census. FRESHCOUNT/FRESHSKIP: freshness census. UJALIGN_PASS/NOMATCH/BYPASS: 15m guard, report-only. UJMEMO_STORE: memo write print. SUPPRESSED/HELD: holder records. SIDE1H_WOULDPREEMPT: preemption check. UJPROBE: per-bar bias/div probe. RETESTDIAG: retest diagnostics. STATE: state transition. final balance: tester end balance. Test passed: tester completion marker.

## Part F - files and push
- F1 this file. F2 slice `BUILDER_SLICE_B34.md` (253 lines; cap 1500 - P4/C1/C3/C4 rows whole).
- F3 pointer (B-34 MEASURED; EA unchanged F9F9C569; Next = relay B-35).
- F4 ledger item 1175 tag `B34-JUNE-MEASURE` (grep was 0; appended; new SHA A354C7FB360305063D3BB701D012C38ECA195DDFFC5AABF00FFE8B36939A149D).
- F5 register (A2 appended) rides the push with F1-F4. F6 commit + push to builder/B-34 ONLY: result, slice, pointer, ledger, register. No EA, indicator, Include, journal log, ini, launcher or backup.
- F7 ls-remote check under the reply line.

## Carried note - must contain
- Gate/STOP per part: 0.4 matched (no STOP-A); A2 appended (count was 0, now 1); P1 table + P2 NO_RULING_FOUND + P3 June untouched + P4 12 rows; C0 verified incl. voided attempt-1 retry (no STOP-J); C6 MEASURED (STOP-A/J clean, no revert STOPs).
- JUNE_OWED table: 3/6 LDN LONG 09:10 159.929 TP-159.983 VALID (register C + r78); 5/6 LDN SHORT 09:45 159.948 TP-159.900 VALID (register B1); 5/6 NY LONG 16:15 UNKNOWN-price VALID (register B2; entry question open); 11/6 NY LONG 14:40 160.524 VALID (register B3 + RECON78:23); 8/6 SHORT INVALID (strategy section 8); other June journal rows are daily LDN notes, no trades.
- JUN05NY_ENTRY = NO_RULING_FOUND (terms: "5 June New York entry", "16:15", "16:55", "JUN05NY" over skill, June journal rows, ledger items after 1092, findings; standing register value 16:15 noted). Question for him: "5 June New York long off the old high: is your entry the 16:15 open or the 16:55 open?"
- HITS=1 (3/6 LDN), MISSES=3 (5/6 LDN new refusal; 5/6 NY-16:15 same SEEDBIAS kill; 11/6 NY different confirm-then-starve), FALSES=0 valid-row fires (two outside fires, neither on a valid row). NEW_FIRES_OUTSIDE=2 (6/4 SHORT traded SL; 6/9 LONG voided FRESH_OPP_FVG). 8 June silent: yes.
- FIRST_BLOCKER per miss: 5/6 LDN UJ5MENTRY_REFUSE-09:40 (new vs r78 take); 5/6 NY S2SEEDBIAS_KILL-16:05 (same as r78); 11/6 NY post-confirm confirm=0 run from 41120 (different vs r78 suppression).
- EXIT_SYNC: 6/3 yes (price; deal stamped after bar); 6/4 yes; 6/5 no (model 19:15 160.298 vs broker 6/11 159.725 - the r78 split); 6/9 n/a (no position). Day-close 23:55 fill: no (no DAY_CLOSE rows; 6/5 alive to 6/11 broker stop).
- j18 run time 0:02:39.401, 542258 ticks, 2880 bars (= r78 counts), balance 9928.25. r78 reported, not graded.
- NOT_FOUND: 5/6 NY entry-bar ruling (P2); 9/7-NY + 9/8-NY journal rows (standing); any his-word memo-refusal pin (standing); v4 packet file on disk (standing).
- "Do NOT propose the next change. The planner rules B-35 from C2-C4."
