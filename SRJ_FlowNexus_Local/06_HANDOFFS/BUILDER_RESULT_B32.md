# BUILDER RESULT B-32 - memo refill lets both voided valids enter; all seven fire, five takes hold to the cent; KEPT (trial record)

Trader summary: your 1 Sep 17:35 long and your 8 Sep 10:10 short both entered this time. Your 1 Sep trade entered at 1.16022 and was stopped at 1.15975 on the same evening; your 8 Sep 10:10 short entered at 1.16205 and hit its target at 1.16102 forty minutes later. Your other five takes - 28 Aug, 4 Sep, both 7 Sep trades and the 8 Sep 17:00 short - all came out identical to the last run, to the cent, and both refusals held. Nothing appeared outside your seven trades. The run took under four minutes.

## Part 0 - fresh-session start
- 0.1 relay skill loaded first. Relay B-32 wins over older queue items for its scope.
- 0.2 ls-remote builder/B-31 returns `a37d47eed932c8bec3d0d6a058107827763dc089` (verified). Checked out builder/B-31, cut builder/B-32 from a37d47e. Dirty tree kept (123 lines; count only). No git-config/remote change. Pushes through remote `backup`.
- 0.3 read in order: AGENTS.md; srj-relay skill (whole, incl. speed + auto-detect bullets); srj-strategy skill sections 5, 9 (119-123), 11 (W2/W4/W6: 131/140/135/141), 12; pointer; BUILDER_RESULT_B31.md (carried note, Part B, C1, C2, C5); BUILDER_SLICE_B31.md C1 + C5.
- 0.4 `git log -1`: `a37d47eed932c8bec3d0d6a058107827763dc089 B-31 slot fix back, guard report-only, memo values captured, STOP-W div-only, RESTORED`. SHA gate all matched (no STOP-A): EA 964803F4FD452349D67FDC31A73A7B297D4BB93726FA69086DB0A60283AE74F8; ex5 7C46B16C035A9F19B936FD4899BEC0289AD82C8F4AF8B652B0FA6D7A3DC54994; `.B31XYM` 0A18DDB32F39BBDEE098BA4E3E2B836D26A23CEBD11079664F78A5971EDA7261; `.B29X` 70E68EE133A51705DA03A2E3F16C7D571C6A596BEF680741C0112D7565C4CA3D; FlowLogic 956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342 / ex5 27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90; HTFEngine D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755; strategy E238A9D69638ABE627D231DD74BB4E14BD65C30F46ADD2CCA0F368FD6B88DB48; relay 6E654E29399BDDDB73A9E572FEE90E96C97941D980CB2659070B0B1581EF32C5 (speed bullet on disk); ledger C5843F97C084C206ECC801EE027C4ACCC9166543EFCD8B6E64858CA9BAACC44B (item 1172); journal 23329BCB141E67AC3799406A038839F335DD8AAE4A8B2D4BB73CC8AF34298B6E64858CA9BAACC44B (1057 rows); j15 C051915B1AB13A5A49C5094C3F99AE0F31B5AEFE672A304A9C3A140FD18DE6F9.
- 0.5 names: j14/j15/j16 as relayed; RECON62 window; `.B31XYM` (X+Y+M); Hunk F (refill); `.B32XYMF`; launcher b32; seven valid bars; two refusals; reading fields vs `div=` label as relayed.

## Part A - records
- A1 no banking (no new words of his). Strategy skill and journal untouched (SHAs unchanged, Part D).
- A2 relay-skill speed bullet grep count 1: rides the F5 push (skill SHA at gate 6E654E29; auto-detect bullet added this turn per his order - new SHA below).

## Part P - pre-checks (read-only, before B0)
- P1 R1 proof: (a) `.B31XYM` lines 12300-12302 raw: `bool aligned = ((g_dir == DIR_LONG && (latestNZ == 1 || latestNZ == 2)) || (g_dir == DIR_SHORT && (latestNZ == -1 || latestNZ == -2)));` + `string cls = (... (aligned ? "ALIGNED" : "OPPOSING")))`, inside `SrjUjProbeTuple` (line 12278); the print (12303-12307) emits CQD readings (latestNZ/kind/readFail/empty/zero/complete) and the `div=` label from `cls`. So the label compares the CQD verdict against the book's held direction: label of book state, not the reading. (b) UJPROBE census j15 vs j14 minus wall clock AND `div=`: identical 3168 of 3168. (c) 28 label diffs, latestNZ+kind equal on all 28 (first index 774 bar 8/28 16:25, latestNZ -1 kind regular both); nearest preceding STATE dirs listed per diff (e.g. 8/28 16:25-16:55 J14 S4_ARMED/SHORT vs J15 ABORT/SHORT; 9/1 10:15-10:50 J14 ABORT/LONG vs J15 S1_REGIME/LONG; 9/8 16:45-18:20 J14 S4_ARMED/SHORT or S1_REGIME/LONG vs J15 ABORT/SIGNAL/SHORT) - the label follows the held setup. No reading-field difference: no STOP-P.
- P2 `.B31XYM` SHA 0A18DDB3; `diff .preB31 .B31XYM` equals the B-31 B5 hunks (verified B-31 filing).
- P3 exact-trimmed line `if(!uj_memo_valid || uj_memo_barTime != barTime)` count 1 in `.B31XYM` (line 10717), directly under the `[P-UJIMPL-IMPL-1 v8 IE9] fire-site fallback` comment (10712-10716), with the IDENTITY block below it (10742-10743). The NO_MEMO_AT_FIRE line (10741, longer condition) is not the edit point. No STOP-P.
- P4 rule-conflict: skill grep for memo (only "memory" prose hits, no memo rule); journal grep for memo (0 hits); findings carry no memo-refusal rule. IDENTITY check introduced by ledger 887, 2026-09-27 (`IMPL-1 v8 + V311 ... 873` series context: packet v4 789C313B; relay v317; the in-code comment states purpose "fire-edge memo guard (liveness + identity...)"; the v4 packet file itself is not on disk under that hash - searched). GUARD_PURPOSE=ledger-887 quote; MEMO_PIN=NONE. No STOP-P.
- P5 `g_anchorLine` + `g_dir` in scope at the P3 line: the same names appear in the store line inside that block (`.B31XYM` 10722) and throughout the guard (10742-10744).

## Part B - edits (one EA compile; no indicator edit or compile)
- B0 backups `.preB32`: EA mq5 964803F4FD452349D67FDC31A73A7B297D4BB93726FA69086DB0A60283AE74F8; EA ex5 7C46B16C035A9F19B936FD4899BEC0289AD82C8F4AF8B652B0FA6D7A3DC54994 (equal to gate).
- B1 `.B31XYM` over EA mq5; SHA 0A18DDB3 verified.
- B2 Hunk F at line 10717, indentation kept (6 spaces): comment `//--- [B-32 Hunk F] a memo written by another setup (other anchor line or direction) is absent for this pass: refill from the fire-local election.` inserted above; condition replaced with `if(!uj_memo_valid || uj_memo_barTime != barTime || uj_memo_anchor != g_anchorLine || uj_memo_dir != (int)g_dir)`. IDENTITY check below untouched.
- B3 full diff vs `.preB32`, raw: the B-31 B5 hunks (X -1/+1; Y two blocks -1/+2 each; M +2 stores, -1/+1 fail print) plus Hunk F (+1 comment, -1/+1 condition). Nothing else. Edited SHA EB9F74D68B645CDD923A0E1A3AFED3827B7321EBA8FF117597A1D870847F639C. Kept `Experts/SRJ_FlowNexus_EA.mq5.B32XYMF` same SHA, never committed.
- B4 EA compile only. Log `B32_EACOMPILE.log`: `Result: 0 errors, 0 warnings, 6997 ms elapsed`. New ex5 21E1F6F3546744FAF83C65280E143136146BB60B14681589382F6F5B0079B45D (454544 B). No STOP-B.

## Part C - one run j16 (RECON62-B32_JOURNAL.log, 81821 lines, 16102204 B, SHA A64FF25600069B84CEB3138A5E0CBF869A6CF391490465020B6F2C1A3B7243B3, local unpushed)
- C0 hygiene as B-31 C0: no terminal before launch (verified); six-line ini block to RECON62 via Edit + readback (day log had rolled to 20261006 overnight; PRE_JOURNAL_LINES=0); launcher `launch_recon62b32_run.ps1` (only RunName RECON62-B32); WMI_PID 19340, terminal PID 7628; window proof day-log 17 `testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.08.26 00:00 to 2026.09.10 00:00` (+43 started-with-inputs); wrapper killed per RAM order; graded from day log (no DONE file); completed 00:40:50 `563338 ticks, 3168 bars ... Test passed in 0:03:45.994` (run time 3:46 - fast as ordered); leftover terminal + orphan agent stopped (both verified gone); ini June restored + read back.
- C1 UJPROBE census j16 vs j15, reading fields row for row: identical 3168 of 3168. Label diffs: 5 (all latestNZ+kind equal: 9/1 17:40-17:55 latestNZ 2 hidden; 9/2 09:15 latestNZ -2 hidden). First 8 with STATE dirs in the slice (only 5 exist).
- C2 filed-trade table j14 / j15 / j16, one row per deal, dates first:
  - (a) five takes, equal to j15 to the cent (entry, tp, sl, exit, reason all match):
    - 8/28 SHORT 10:00: entry 1.16466 tp 1.16364 sl 1.16508 exit POI_BODY_BREAK 1.16439 (ENTRY j16:17172 ticket 2; MTEXIT j16:17573; UJMEMO_PASS j16:17160).
    - 9/4 LONG 15:55: entry 1.16018 tp 1.16302 sl 1.15847 exit DAY_CLOSE 1.16093 (ENTRY j16:52115 ticket 6; MTEXIT j16:53822; PASS j16:52103).
    - 9/7 LONG 09:15: entry 1.16135 tp 1.16200 sl 1.16098 exit TP_TOUCH 1.16200 (ENTRY j16:54995 ticket 8; MTEXIT j16:55386; PASS j16:54983).
    - 9/7 LONG 16:40: entry 1.16261 tp 1.16315 sl 1.16238 exit TP_TOUCH 1.16315 (ENTRY j16:58063 ticket 10; MTEXIT j16:58187; PASS j16:58051).
    - 9/8 SHORT 16:55: entry 1.16220 tp 1.16114 sl 1.16274 exit SL 1.16274 (ENTRY j16:62185 ticket 14; MTEXIT j16:62357; PASS j16:62173).
  - (b) two refusals, no fire:
    - 8/27 NY 17:05: no ABORT/REFUSED/FIRED/SIGNAL row in 8/27 16:55-17:10 (verified zero hits; j14/j15 same shape).
    - 9/1 LDN 09:50: UJ5MENTRY_REFUSE bar 09:50 (j16:31339) + ABORT LTF_MISALIGN 09:55 (j16:31340) + A6REFUSED (j16:31341).
  - (c) two former voids, both ENTERED:
    - 9/1 NY 17:30 LONG: FIRED (j16:34489 tp 1.16077 r 1.17 sl 1.15975); STORE POLL anchor 8/SHORT (j16:34311) then STORE FIRELOCAL anchor 5/LONG (j16:34493, the refill); PASS src=FIRELOCAL (j16:34495 admit_key 17:30:2); ENTRY ticket 4 (j16:34507); MTEXIT SL 17:50 entry=1.16022 exit=1.15975 (j16:34600); no FAIL row. Memo src FIRELOCAL.
    - 9/8 LDN 10:05 SHORT: FIRED (j16:59816 tp 1.16102 r 1.94 sl 1.16258); STORE POLL anchor 2/SHORT (j16:59602) then STORE FIRELOCAL anchor 4/SHORT (j16:59820, the refill); PASS src=FIRELOCAL (j16:59822 admit_key 10:05:6); ENTRY ticket 12 (j16:59834); MTEXIT TP_TOUCH 10:40 entry=1.16205 exit=1.16102 (j16:59989); no FAIL row. Memo src FIRELOCAL.
  - (d) fires outside the seven valid bars: 0 (7 FIRED, all on valid bars).
  - (e) MTCOLLISION rows: 0 (full-journal grep, zero hits).
  - Totals: FIRED 7/7/6 (j16/j15/j14); ENTRY_TICKET 7/5/4; MTEXIT 7/5/4; SIGNAL 7/7/6; EXIT 7/5/4; UJALIGN j16 275/34/9; UJMEMO_STORE 312; MFAIL j16 0 (j15 2); balance j16 10450.13 (day-log 66095) vs j15 10354.80 vs j14 10460.96.
- C3 memo rows raw: 9/1 17:20-17:40 and 9/8 10:00-10:15, every UJMEMO_* (both STOREs per void above), A6FIRED, ABORT (none - no voids), ENTRY_TICKET (34507, 59834) and STATE rows (in slice).
- C4 STOP rules (after C2): STOP-W no (3168/3168 readings); STOP-D no (five takes equal j15; neither refusal fired); STOP-S no (0 outside). Verdict KEPT. EA on disk = `.B32XYMF` (EB9F74D6, uncommitted), ex5 21E1F6F3 matches it.
- C5 trader lines: "28 Aug short 1.16466 to 1.16439; 4 Sep long 1.16018 to 1.16093; 7 Sep long 1.16135 to 1.16200; 7 Sep long 1.16261 to 1.16315; 8 Sep short 1.16220 to 1.16274 - all five identical to last run." "27 Aug 17:05 stayed out; 1 Sep 09:50 stayed out." "1 Sep 17:35 long entered at 1.16022, stopped 1.15975 at 17:50; 8 Sep 10:10 short entered at 1.16205, target 1.16102 at 10:40."

## Part D - final disk state
- EA mq5 on disk EB9F74D68B645CDD923A0E1A3AFED3827B7321EBA8FF117597A1D870847F639C (= `.B32XYMF`, uncommitted, KEPT); ex5 21E1F6F3546744FAF83C65280E143136146BB60B14681589382F6F5B0079B45D (matches source).
- FlowLogic 956BF3E3 / 27B5F272; HTFEngine D5FD5B06 (re-taken, unchanged).
- Strategy skill E238A9D6 (untouched); relay skill (auto-detect bullet below); journal 23329BCB (untouched, 1057 rows).
- terminal.ini June USDJPY, read back. No terminal and no agent running (verified).
- Kept on disk, untracked: `.preB32` (both), `.B32XYMF`, `.B31XYM`, `.B29X`, `.B28W`.
- Operator's auto-detect order (2026-10-06: automatic completion detection on fast runs): banked as "Auto-detect completion on fast runs" in the relay skill Trial discipline (single light checks, never tight loops or full re-reads; wrapper-kill discipline kept). New skill SHA 20A310470BCD0EB83A3622700FF57F6617830B500AC6D498F94F97CCCC378C21; rides the F5 push via A2. AGENTS.md line 31 (end-the-turn waiting) left untouched - his call whether to amend the contract file.

### Glossary (every journal code cited, few words each)
- A6FIRED: fire record. ALERT SRJ SIGNAL/EXIT: entry/exit alert. ENTRY_TICKET/MTEXIT: fill/exit records. ABORT (LTF_MISALIGN): abort + reason. A6REFUSED: refusal record. UJ5MENTRY_REFUSE: entry-bias refusal. UJMEMO_STORE (anchor/dir/src): memo write print. UJMEMO_PASS/FAIL: memo admission check. UJPROBE (h4/h1/m15/div): per-bar bias/div probe. UJALIGN_PASS/NOMATCH/BYPASS: 15m guard, report-only. STATE: state transition. MTCOLLISION: trade-collision record (absent). final balance: tester end balance. Test passed: tester completion marker.

## Part F - files and push
- F1 this file. F2 slice `BUILDER_SLICE_B32.md` (135 lines; cap 1500 - C1/C2/C3 rows whole).
- F3 pointer (B-32 KEPT; EA EB9F74D6 on disk; Next = relay B-33).
- F4 ledger item 1173 tag `B32-MEMO-REFILL` (grep was 0; appended; new SHA C8E31D7F53152B117CBC1A2DE4243A86AA059E346A24EC16CBFC4ED5B63F04E9).
- F5 commit + push to builder/B-32 ONLY: BUILDER_RESULT_B32.md, BUILDER_SLICE_B32.md, BUILDER_SESSION_POINTER.md, SRJ_FLOW_NEXUS_LEDGER.md, `.opencode/skills/srj-relay/SKILL.md` (A2 count 1). No EA, indicator, Include, journal, backup, log or ini.
- F6 ls-remote check under the reply line.

## Carried note - must contain
- Gate / STOP status per part: 0.4 matched (no STOP-A); A1 untouched + A2 count 1; P1 readings 3168/3168 + 28 label diffs with STATE dirs (no STOP-P); P2/P3/P4 counts exact; P5 no memo pin (GUARD_PURPOSE=ledger-887, MEMO_PIN=NONE); B 0/0 (no STOP-B); C0 verified; C1 3168/3168 + 5 label diffs (no STOP-W); C2/C3/C5 measured; E equal; F4 appended. Verdict KEPT, hunks on disk uncommitted.
- P1: READING_J15_VS_J14=3168/3168; LABEL_DIFFS_J15_VS_J14=28 with latestNZ/kind equal yes (all 28) and STATE dirs listed (e.g. J14 S4_ARMED/SHORT vs J15 ABORT/SHORT 8/28; J14 ABORT/LONG vs J15 S1_REGIME/LONG 9/1; full list in file).
- GUARD_PURPOSE=ledger-887 quote (packet v4 789C313B fold; fire-edge memo guard per code comment; v4 packet file not on disk); MEMO_PIN=NONE (skill/journal/findings searched).
- READING_J16_VS_J15=3168/3168; LABEL_DIFFS_J16_VS_J15=5 (9/1 17:40-17:55 latestNZ 2 hidden; 9/2 09:15 latestNZ -2 hidden; kind+latestNZ equal, STATE dirs in slice).
- FIVE_TAKES=hold (8/28, 9/4, 9/7-09:15, 9/7-16:40, 9/8-16:55 all equal j15 to the cent).
- REFUSALS=held (8/27: zero rows, no fire; 9/1: REFUSE 09:50 j16:31339 + ABORT LTF_MISALIGN 09:55 j16:31340, no fire).
- VOID_0901NY=entered: entry 1.16022 tp 1.16077 sl 1.15975 exit SL 1.15975 17:50; memo src FIRELOCAL (refill 5/LONG over POLL 8/SHORT).
- VOID_0908LDN=entered: entry 1.16205 tp 1.16102 sl 1.16258 exit TP_TOUCH 1.16102 10:40; memo src FIRELOCAL (refill 4 over POLL 2, SHORT both).
- NEW_FIRES_OUTSIDE=0. MTCOLLISION=0 (zero rows).
- Balance j16 10450.13 vs j15 10354.80 vs j14 10460.96. Run time 0:03:45.994.
- RELAY_SKILL_SPEED_BULLET=pushed (A2 count 1; skill carries speed + auto-detect bullets, new SHA below).
- NOT_FOUND: v4 packet file on disk; 9/7-NY + 9/8-NY journal rows (B-29 standing); MTCOLLISION rows (zero); 8/27 17:05 reason row in j16 (refusal by absence, as j14/j15).
- Do NOT propose the next change. The planner rules B-33 from C2 and C3.
