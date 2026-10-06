# BUILDER RESULT B-51 - why the 11 June New York long never entered at 14:40, plus one register correction, MEASURED

Trader summary: your 11 June long confirmed on the 14:35 candle exactly as your words say, and the machine armed it at the 14:40 open with a heads-up on the Daily-POC. What stopped the entry is the machine then asking the 14:40 candle to confirm all over again - that candle touched nothing, so the armed setup just sat and never fired. Your banked words allow exactly one confirmation candle with entry at the next open, and nothing on record ever asked for a second one. One correction is filed in the register: the old high 160.723 is your target for the 5 June long, not the line it retested - which line price retested before your 16:15 entry is now with you as a chart call below. Nothing was edited in the EA, compiled, launched or run.

## Part 0 - fresh-session start
- 0.1 relay skill loaded first, whole. Relay B-51 wins over older queue items for its scope.
- 0.2 ls-remote builder/B-50 returns `22a6826b995a81e234468eef9675636d080f38e1` (verified). Checked out builder/B-50, cut builder/B-51 from 22a6826. Dirty tree kept (249 `git status --short` lines; count only). No git-config/remote change. Pushes through remote `backup`.
- 0.3 read in order: pointer; RESULT_B50 (no carried note); SLICE_B50 (pass rows, retest test EA:2076-2125); register section B (row 2: 16:15 LONG, old high 160.723 target on record; row 3: 14:40 LONG Daily-POC anchor, RECON78 holder-veto cell, HIS rule 14:35 retest+confirmation); findings head + Miss 2 (R63-era 16:10 NO_TP_TARGET, superseded) + Miss 3 (RECON63-era A2_CLOSE_BREAK/sub-1R, superseded) + A2 (target 160.723 verbatim) + Rulings-F (session rebuke) + Rulings-G (14:35 sequencing) + Rulings-J (own-source booking, 14:40 open 160.524); RESULT_B35 Part P (j18 14:35 HELD/hits=2/confirm=1, S2->S3->S4, HEADS-UP, 14:40 hits=0/confirm=0; CONFIRM_1435_USED_BY = ARM, second confirm needed EA 9279-9286, SECOND_CONFIRM_PIN = NONE); strategy 2 (CONFIRMATION-BAR, TIMING-N/N+1, POTENTIAL-vs-SETUP, BOOKING-INNOCENT), 5 (NEAREST-ONLY-TP, RETARGET), 8 (5M-FLIP-KILL, FLIP-KILLED-NEVER-VETOES), 11 (5M-BIAS-AT-ENTRY), 13 (JUN05NY-ENTRY-1615), 15 (TERMS-HIS, ASK-THE-CODE).
- 0.4 start gate (text LF-normalized, source+ex5 raw): pointer D5AA7DF6 MATCH; RESULT_B50 F2B34030 MATCH; SLICE_B50 640ED2BF MATCH; register C1E4AEDE MATCH (pre-A2); strategy 7762E905 MATCH; context E06BB7B4 MATCH (8837 B). Relay skill disk bb467c55 MATCH (accounted). EA 63B18C1F / ex5 B0D4AA9E MATCH; FlowLogic 956BF3E3 / ex5 27B5F272 MATCH; BiasEngine 3B1D9D3D / OrderblockMgr 5D14FCE2 / Draw FD2B3716 / HTFEngine D5FD5B06 MATCH; TickAudit 7AD6ABEF / 7C8946D8 MATCH. Ledger normalized 8340BC8F (1128403 B) MATCH; journal normalized 261ebd8f (1060 lines) MATCH. terminal.ini 450ACB4A report-only.
- 0.5 names as relayed (j32 = Tester/logs/20261006.log JUNE-B44-S5, lacks 11 June so j18-class full-June rows used: 08:37 run; j18 = B-35 run, same shape; RETESTBOOK/CONFIRMPOLL/ANCHOR_ELECT/S4_ARMED/holder/LTF_MISALIGN/UJPROBE per glossary; NY1106 14:35 confirm/14:40 entry Daily-POC; NY0605 16:15 entry; PASS = pass time judging the candle before; his terms used).
- 0.6 authority: read-only + A2 append + Part F push only. No source edit, no compile, no terminal launch, no tester run (NOT_REACHED nowhere).

## Part A - banking and register
- A1 no new words from him. Banked nothing.
- A2 register correction: grep `CORRECTION 2026-10-07 (B-51` count 0 -> appended the relay line verbatim at end of section B after the B-46 correction. Row 2 untouched. New SHA raw D248DEEC (7850 B, LF-only).

## Part P - read-only answers
- P1 PASS_MAP_1106, 11 June (pass / judges bar / RETESTBOOK hits LONG-or-SHORT / CONFIRMPOLL confirm / state / ltf / session holder; SUPPRESSED heldPoi/heldDir/heldState name the holder, opp=0 = self-census no opposite holder; HEADS-UP = arm alert; FRESHCOUNT HOLD = held never killed; IDCHANGE = zone id roll):
  - 14:15 pass (bar 14:10): SHORT potential fading (bar-14:10 hits=0; no abort/kill rows). No holder.
  - 14:20 pass (bar 14:15): SHORT confirm=0; LONG seeds on 14:20 bar (hits=2 LONG). ltf -1.0.
  - 14:25:21 pass (bar 14:20): LONG S1->S2; hits=2 LONG; confirm=0; self-HELD opp=0. ltf -1.0.
  - 14:30 pass (bar 14:25): LONG S2 self-HELD; hits=2; confirm=0. ltf -1.0.
  - 14:35:10 pass (bar 14:30): LONG S2 self-HELD; hits=2; confirm=0. ltf -1.0.
  - 14:40:22 pass (bar 14:35): LONG hits=2 + CONFIRMPOLL confirm=1 -> S2->S3->S4_ARMED + HEADS-UP LONG zone 160.489-160.504 awaiting confirm; TPCENSUS #161 ref=160.524 (= his entry) winner YLOH 160.587. ltf +1.0 (agrees). No SHORT holder (all SUPPRESSED opp=0).
  - 14:45:05 pass (bar 14:40): hits=0 + confirm=0; S4 HELD (FRESHCOUNT #59 HOLD, no abort); TPCENSUS #162 winner Daily-VWAP 2pts (census print only, booking never runs - S5 unreached). ltf +1.0.
  - Plain words: the 14:35 candle WAS judged as retest + confirmation for the long (hits=2, confirm=1) and the machine armed it at the 14:40 pass with a heads-up. At the 14:40 pass it did not enter - it armed (S4 awaiting confirm).
- P2 FIRST_BLOCKER_1106: the S4->S5 second-confirm gate (EA:9284-9305: one-bar validity, failed term consumes the confirmation, no carry-forward). The 14:35 arming confirm was consumed by S3->S4; S4->S5 re-tested the current 14:40 bar (hits=0, confirm=0) so no promotion to S5, and with S5 unreached no booking and no entry ever ran. Code pasted raw in slice. Register comparison: RECON78 same-session non-firing-holder veto is NOT shown on current rows - no SHORT S4_ARMED holder exists at any 14:15-14:45 pass (14:10 SHORT died silently by 14:15; every SUPPRESSED is own-seed opp=0; the lone SHORT candidate at 14:50 never arms, wouldPreempt=0) and the LONG armed cleanly at 14:40:22 with no LTF_MISALIGN abort (ltf +1.0). DIFFERENT blocker from register RECON78; SAME as B-35 (CONFIRM_1435_USED_BY = ARM, second confirm needed, EA 9279-9286). Not bias (ltf agreed), not target (censuses #161/#162 printed, booking never executed per BOOKING-INNOCENT), not freshness kill (HOLDs only, zero ABORTs).
- P3 RULE_CHECK_1106 (all FOUND with file:line, raws in slice): Rulings-F session rebuke (findings:96 - an 8:30/London holder must have been invalidated and must never prevent a NY setup); Rulings-G sequencing (findings:102 - 14:35 flip+retest+confirmation same candle, 14:40 entry, 14:45 never evidence); Rulings-J entry bar (findings:119 - 14:40 open 160.524, 14:45 post-entry) + own-source booking rule (findings:118); register B3 HIS rule (:27 - 14:35 retest+confirmation); CONFIRM-ONCE (skill:85 - ONE confirmation bar suffices, later bars never re-litigate); CONFIRMATION-BAR (skill:53 - bar N, entry N+1); TIMING-N/N+1 (skill:55 - 14:35/14:40 named); POTENTIAL-vs-SETUP (skill:52 - unconfirmed held seed carries no arrival protection: covers the RECON78 holder theory even where a holder exists); FLIP-KILLED-NEVER-VETOES (skill:117 - flip case; narrow); BOOKING-INNOCENT (skill:56 - booking never causes selection miss; S5 unreached); 5M-BIAS-AT-ENTRY (skill:139 - ltf +1.0 agreed, not a blocker). Armed-never-filled holder veto: NO banked word allows it (Rulings-F + :52 + :117 rule the adjacent cases against holding; nothing permits it) - and moot on current rows (no such holder).
- P4 plain-words summary: on the 14:35 candle the machine saw two line touches and a valid confirmation for your long, and armed it at the 14:40 open. What stopped your entry is the machine demanding the 14:40 candle confirm a second time - it touched nothing, so the armed setup sat and never fired. Your banked words allow one confirmation candle with entry at the next open and nothing on record ever asked for a second (B-35 SECOND_CONFIRM_PIN = NONE; your CONFIRM-ONCE words). Verdict: RULE_BREACH (the second-confirm stop goes against CONFIRM-ONCE + CONFIRMATION-BAR + TIMING-N/N+1 + Rulings-G 14:35/14:40, quoted in slice). No proposal, no edit, no validity ruling on his trade.
- P5: P3 fully FOUND from rows + code + banked words, so no chart call from P5.
- P6 NY0605_RETEST_LINE: NO_RULING_FOUND for his own words on the retest line (journal 304/305/307/308 neighbours: 1-Sep/8-27/0605LDN topics, none names it; register B2 Line cell = target per A2; strategy 13 entry-only, 15 London-only; findings Miss 2 = machine seed Daily-POC not his; ledger 812/1016/1176/1190/1192 = entry/target/kill rows, never his retest line; terms searched: Daily-POC, Daily-VWAP, old high, "retest" near 16:15). Carried-note chart call (exact relay wording) filed below. Old 16:15-vs-16:50 question NOT re-asked.

## STOP rules
- STOP-A: none (all gate SHAs match; skill accounted).
- STOP-H: none (writes = A2 register line + Part F list only).
- STOP-B: none (builder/B-50 + 22a6826 verified before cutting B-51).
- No STOP-T / STOP-R (no launches; NOT_REACHED nowhere).

## Part F - file, push, reply
- F1 result B51 + slice B51 (pass rows, code spot, P3/P6 raws, gate SHAs).
- F2 ledger item 1193 (grep `^1193.` was 0; appended; tag B51-NY1106-BLOCKER).
- F3 pointer (B-51 latest, next B-52; P6 outcome noted: with him as chart call; 35-line cap).
- F4 push to builder/B-51 only: RESULT_B51, SLICE_B51, ledger, pointer, register (A2). Never the EA, indicators, includes, scripts, presets, inis or relay skill.
- F5 final disk state: EA 63B18C1F (680981 B) / ex5 B0D4AA9E MATCH; FlowLogic 956BF3E3 / ex5 27B5F272 MATCH; includes at gate SHAs; TickAudit untouched; terminal.ini 450ACB4A untouched (no launch; no terminal64 running).
- F6 ls-remote under the reply line.

## Carried note
- 5 June New York long, entry at the 16:15 open, target the 30 April high 160.723: which line did price retest before your entry, and on which candle?

(End of file)
