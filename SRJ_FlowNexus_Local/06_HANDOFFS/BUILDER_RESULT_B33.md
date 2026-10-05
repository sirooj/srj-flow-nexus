# BUILDER RESULT B-33 - 9/4 day-close exit back on the Friday 23:55 open at 1.16129; everything else identical; KEPT (trial record)

Trader summary: your 4 Sep long now exits where your rule says - at the Friday 23:55 opening price of 1.16129, instead of the Monday open at 1.16093. All six of your other takes came out identical to last run, both refusals held, and nothing appeared outside your seven trades. The run took just over three minutes.

## Part 0 - fresh-session start
- 0.1 relay skill loaded first. Relay B-33 wins over older queue items for its scope.
- 0.2 ls-remote builder/B-32 returns `3567d81e1ea0af1ce4796f3efffdf4fcbde242c0` (verified). Checked out builder/B-32, cut builder/B-33 from 3567d81. Dirty tree kept (127 lines; count only). No git-config/remote change. Pushes through remote `backup`.
- 0.3 read in order: AGENTS.md; srj-relay skill (whole); srj-strategy skill sections 1 (21-36, incl. UNIVERSAL + EXECUTION PINNED line 28) and 12; pointer; BUILDER_RESULT_B32.md (carried note, Part B, C1, C2, C5); BUILDER_SLICE_B32.md C1 + C5.
- 0.4 `git log -1`: `3567d81e1ea0af1ce4796f3efffdf4fcbde242c0 B-32 memo refill lets both voids enter, all seven fire, KEPT`. SHA gate all matched (no STOP-A): EA EB9F74D68B645CDD923A0E1A3AFED3827B7321EBA8FF117597A1D870847F639C (= `.B32XYMF` on disk); ex5 21E1F6F3546744FAF83C65280E143136146BB60B14681589382F6F5B0079B45D; `.preB32` mq5 964803F4FD452349D67FDC31A73A7B297D4BB93726FA69086DB0A60283AE74F8 / ex5 7C46B16C035A9F19B936FD4899BEC0289AD82C8F4AF8B652B0FA6D7A3DC54994; FlowLogic 956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342 / ex5 27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90; HTFEngine D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755; strategy E238A9D69638ABE627D231DD74BB4E14BD65C30F46ADD2CCA0F368FD6B88DB48; relay 20A310470BCD0EB83A3622700FF57F6617830B500AC6D498F94F97CCCC378C21 (speed + auto-detect bullets); ledger C8E31D7F53152B117CBC1A2DE4243A86AA059E346A24EC16CBFC4ED5B63F04E9 (item 1173); journal 23329BCB141E67AC3799406A038839F335DD8AAE4A8B2D4BB73CC8AF34298B6E64858CA9BAACC44B (1057 rows); j16 A64FF25600069B84CEB3138A5E0CBF869A6CF391490465020B6F2C1A3B7243B3.
- 0.5 names: j16/j17 as relayed; RECON62 window; Hunk D (one-bar-early day-mark test); `.preB33`; `.B33XYMFD`; reference RECON62-DAY2355-FULL (A82F15E7, 9/4 Friday 1.16129, balance 10474.64).

## Part A - records
- A1 no new words to bank. Strategy skill grep `EXECUTION PINNED 2026-09-25`: 1 hit. Whole line quoted: `- UNIVERSAL day-close rule (his clarification 2026-09-21, verbatim: "the experiment is about the trend following setup when the HTF flip to the other direction, close or hold. the decisive exit rule is always exit upon near the day close. the rule is 5 minutes before candle close, which has been recorded on the previous session"). Amended point: the experiment tests flip-response (close-or-hold) on trend-following setups when HTF flips the other direction; the DECISIVE exit rule is ALWAYS exit near the day close, 5 minutes before the candle close, every managed trade regardless of regime. Later word amends earlier scope: the F3 day-close leg is universal session discipline, not mean-reversion-scoped; no trade holds overnight by design. EXECUTION PINNED 2026-09-25 (his chart ruling): the DAY_CLOSE leg executes at the 23:55 opening price on the verdict day (Friday included), never at the next-day open; purpose avoid swap fee + new-day widened spread (his chart: 7 Sep 00:00 spread 18); the v225-era weekend-gap-nextOpen semantic is retired for DAY_CLOSE by this later word; BREAK-leg next-open untouched.`
- A2 AGENTS.md untouched this relay (his 2026-10-06 auto-detect order, banked in the relay skill last turn, governs fast runs). No skill edit in B-33.

## Part P - pre-checks (read-only, before B0)
- P1 `g_news_dayMarks[dc] <= barTime + PeriodSeconds()` count 0 (absent - not present, proceed). Anchor `if(g_mtrade.fillBarTime <= g_news_dayMarks[dc] && g_news_dayMarks[dc] <= barTime) { vDAY = true; break; }` exactly 1 hit, line 12066 (6-space indent; in the `for(int dc ...)` loop under the F3 day-close comment). Reported for the record.
- P2 `git show d0589ef -- Experts/SRJ_FlowNexus_EA.mq5`: the four added lines equal the Hunk D body byte for byte apart from indentation (d0589ef uses its own indent; relay pins 6-space): three `//---` comment lines (P-DAY2355-1 23:55-open rule text) + the `barTime + PeriodSeconds()` if line. Equal yes.
- P3 record-first search for a withdrawal of the 23:55 pin (`DAY2355|23:55|Monday flatten|next-day open` over skill, ledger items after 746, findings): skill has only line 28 (the pin itself); ledger hits after item 746 are the 23:55 rule banking (736), the DAY2355 relay/packet/run rows (737/742/743/744/746), his-takes/revert rows (788/794 - the revert is a tree change on his 7-trade evidence, never a pin withdrawal), and council reply filings (1117/1122 - attachments, no withdrawal language); findings carry no withdrawal (only an unrelated LONG-invalidity line). No withdrawal by him: no STOP-P. `git log -S 'barTime + PeriodSeconds()) { vDAY'`: added in d0589ef (RECON61 build), dropped in afe220a (2026-09-26 revert to D74FE972).
- P4 j16 9/4 rows 9/4 23:40-9/7 00:10 (EXITVERDICT/MTEXIT/MTCLOSE/deal): vDAY=0 through the Friday 23:55 evaluation (53821 bar 23:55); MTEXIT bar 23:55 DAY_CLOSE entry=1.16018 exit=1.16093 (j16:53822); deal #7 sell at 1.16093 stamped Monday 9/7 00:00:07 (j16:53824/53825); MTCLOSE ref=1.16093 (j16:53828). Fill time Monday open at 1.16093 (not Friday 23:55): cause confirmed, proceed.

## Part B - edits (one EA compile; no indicator edit or compile)
- B0 backups `.preB33`: EA mq5 EB9F74D68B645CDD923A0E1A3AFED3827B7321EBA8FF117597A1D870847F639C; EA ex5 21E1F6F3546744FAF83C65280E143136146BB60B14681589382F6F5B0079B45D (equal to gate).
- B1 Hunk D after anchor line 12066, anchor indentation (6 spaces), exactly the relayed five lines (two owned indent slips caught in the diff and repaired before compiling, B-19 class: anchor briefly +1 space, insert block briefly 7-space; final bytes match the spec). Nothing else changes. Note: the repair scripts normalized the file's CRLF line endings to LF (677904 B, 12351 lines, CRLF 0); the Hunk D bytes are exact, it compiles 0/0, and the ex5 matches this source.
- B2 full raw diff vs `.preB33`: +5/-0 (hunk `@@ -12064,6 +12064,11 @@`; the five spec lines; byte-verified against the relay text). Edited SHA F9F9C569DCAC5B87660D1E82B77857966FEA1CD0617B732BFCB28205E04F7631. Kept `Experts/SRJ_FlowNexus_EA.mq5.B33XYMFD` same SHA, never committed.
- B3 EA compile only. Log `B33_EACOMPILE.log`: `Result: 0 errors, 0 warnings, 7837 ms elapsed`. New ex5 CF14BED2CCF14BC5B140F8BD57BF91141484144300288D1E150511D939445696 (454270 B). No STOP-B.

## Part C - one run j17 (RECON62-B33_JOURNAL.log, 81801 lines, 16099195 B, SHA 3A3CC7E316966EECE6F5E68C63272A0EBDD1253FA940ACCCADF555CAAF481220, local unpushed)
- C0 hygiene as B-32 C0: no terminal before launch (verified); six-line ini block to RECON62 via Edit + readback; launcher `launch_recon62b33_run.ps1` (only RunName RECON62-B33); attempt 1 voided by infrastructure (history-download timeout 05:26-05:28, "no history data", no testing-of line - void, retried once: leftover terminal/agents stopped, relaunched 05:35:40, PRE_JOURNAL_LINES=81830); attempt 2 window proof day-log 81845 `testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.08.26 00:00 to 2026.09.10 00:00` (+81871 started-with-inputs); wrapper exited clean on PASSED (RESULT=PASSED, DONE written, no kill needed); graded from day log; completed 05:41:06 `563338 ticks, 3168 bars ... Test passed in 0:03:03.654` (run time 3:04 - fast as ordered); leftover terminal + orphan agent stopped (both verified gone); ini June restored + read back.
- C1 UJPROBE census j17 vs j16, reading fields row for row: identical 3168 of 3168. Label diffs: 0.
- C2 filed-trade table j16 / j17 (+ reference column for 9/4), one row per deal, dates first:
  - (a) six takes, equal to j16 to the cent (entry, tp, sl, exit, reason):
    - 8/28 SHORT 10:00: entry 1.16466 tp 1.16364 sl 1.16508 exit POI_BODY_BREAK 1.16439 (ENTRY j17:17170 ticket 2; MTEXIT j17:17571).
    - 9/1 LONG 17:30: entry 1.16022 tp 1.16077 sl 1.15975 exit SL 1.15975 (ENTRY j17:34505 ticket 4; MTEXIT j17:34598).
    - 9/7 LONG 09:15: entry 1.16135 tp 1.16200 sl 1.16098 exit TP_TOUCH 1.16200 (ENTRY j17:54980 ticket 8; MTEXIT j17:55371).
    - 9/7 LONG 16:40: entry 1.16261 tp 1.16315 sl 1.16238 exit TP_TOUCH 1.16315 (ENTRY j17:58048 ticket 10; MTEXIT j17:58172).
    - 9/8 SHORT 10:05: entry 1.16205 tp 1.16102 sl 1.16258 exit TP_TOUCH 1.16102 (ENTRY j17:59819 ticket 12; MTEXIT j17:59974).
    - 9/8 SHORT 16:55: entry 1.16220 tp 1.16114 sl 1.16274 exit SL 1.16274 (ENTRY j17:62170 ticket 14; MTEXIT j17:62342).
  - (b) two refusals, no fire:
    - 8/27 NY 17:05: no ABORT/REFUSED/FIRED/SIGNAL row in 8/27 16:55-17:10 (verified zero hits).
    - 9/1 LDN 09:50: UJ5MENTRY_REFUSE bar 09:50 (j17:31337) + ABORT LTF_MISALIGN 09:55 (j17:31338) + A6REFUSED (j17:31339).
  - (c) 9/4 LONG 15:55: entry 1.16018, tp 1.16302, sl 1.15847 unchanged (FIRED j17:52097; ENTRY j17:52113 ticket 6). Exit reason DAY_CLOSE, exit price **1.16129**, fill stamped **Friday 9/4 23:55** (MTEXIT bar 23:50 j17:53798; deal #7 sell at 1.16129 Friday 9/4 23:55:00 j17:53800; MTCLOSE ref=1.16129 j17:53804; EXITVERDICT vDAY=1 at bar 23:50 j17:53797, vDAY=0 at 23:45 and earlier). Reference column: RECON62-DAY2355-FULL Friday-exact 1.16129 (ledger 746) - match.
  - (d) fires outside the seven valid bars: 0 (7 FIRED, all on valid bars).
  - (e) MTCOLLISION rows: 0 (full-journal grep).
  - Totals: FIRED 7/7; ENTRY_TICKET 7/7; MTEXIT 7/7; SIGNAL 7/7; EXIT 7/7 (j17/j16). Balance j17 10474.64 (day-log 147910) vs j16 10450.13 vs reference 10474.64 (equal - reported, not graded).
- C3 STOP rules (after C2): STOP-W no (3168/3168); STOP-D no (six takes equal j16; refusals held; 9/4 entry/tp/sl unmoved); STOP-X no (DAY_CLOSE 1.16129 Friday 23:55 fill); STOP-S no (0 outside). Verdict KEPT. EA on disk = `.B33XYMFD` (F9F9C569, uncommitted), ex5 CF14BED2 matches it.
- C4 trader lines: "28 Aug short 1.16466 to 1.16439; 1 Sep long 1.16022 stopped 1.15975; 7 Sep long 1.16135 to 1.16200; 7 Sep long 1.16261 to 1.16315; 8 Sep short 1.16205 to 1.16102; 8 Sep short 1.16220 stopped 1.16274." "27 Aug 17:05 stayed out; 1 Sep 09:50 stayed out." "4 Sep long 1.16018 now exits Friday 23:55 at 1.16129."

## Part D - final disk state
- EA mq5 on disk F9F9C569DCAC5B87660D1E82B77857966FEA1CD0617B732BFCB28205E04F7631 (= `.B33XYMFD`, uncommitted, KEPT); ex5 CF14BED2CCF14BC5B140F8BD57BF91141484144300288D1E150511D939445696 (matches source).
- FlowLogic 956BF3E3 / 27B5F272; HTFEngine D5FD5B06; strategy E238A9D6; relay 20A31047; journal 23329BCB (all re-taken, unchanged).
- terminal.ini June USDJPY, read back. No terminal and no agent running (verified).
- Untracked backups kept: `.preB33` (both), `.B33XYMFD`, `.B32XYMF`, `.B31XYM`, `.B29X`, `.B28W`.
- Glossary (every journal code cited, few words each): A6FIRED: fire record. A6REFUSED: refusal record. ALERT SRJ SIGNAL/EXIT: entry/exit alert. ENTRY_TICKET/MTEXIT/MTCLOSE: fill/exit/close records. deal: tester fill line. EXITVERDICT (vDAY): exit-leg verdict. ABORT (LTF_MISALIGN): abort + reason. UJ5MENTRY_REFUSE: entry-bias refusal. UJPROBE: per-bar bias/div probe. STATE: state transition. final balance: tester end balance. Test passed: tester completion marker.

## Part F - files and push
- F1 this file. F2 slice `BUILDER_SLICE_B33.md` (68 lines; cap 1500 - P4/C1/C2/C3 rows whole).
- F3 pointer (B-33 KEPT; EA F9F9C569 on disk; Next = relay B-34).
- F4 ledger item 1174 tag `B33-DAY2355-RESTORE` (grep was 0; appended; new SHA 1597B24523E3AC7EB6E40EDA4D687C37F1464BCEA4063E18EA1FCE3FD02984DF).
- F5 commit + push to builder/B-33 ONLY: result, slice, pointer, ledger. No EA, indicator, Include, journal, backup, log or ini.
- F6 ls-remote check under the reply line.

## Carried note - must contain
- Gate / STOP status per part: 0.4 matched (no STOP-A); A1 1 hit quoted, A2 untouched; P1 0 + anchor 12066, P2 equal yes, P3 no withdrawal (794 is a tree change; 1117/1122 attachments), add/drop d0589ef/afe220a, P4 Monday 1.16093 fill (no STOP-P); B 0/0 (no STOP-B; two repaired indent slips); C0 verified incl. voided attempt-1 retry; C1 3168/3168 + 0 labels (no STOP-W); C2/C3 measured; E equal; F4 appended. Verdict KEPT, hunks on disk uncommitted.
- P1 hit counts 0 + anchor line 12066; P2 equal yes; P3 withdrawal found no; add/drop commits d0589ef/afe220a; P4 j16 9/4 fill Monday 9/7 00:00:07 at 1.16093.
- READING_J17_VS_J16 = 3168/3168, label diff count 0.
- SIX_TAKES = hold (all six equal j16 to the cent).
- REFUSALS = held (8/27 zero rows; 9/1 REFUSE + abort, neither fired).
- SEP04_EXIT: DAY_CLOSE at 1.16129, fill Friday 9/4 23:55:00 (MTEXIT bar 23:50 j17:53798).
- NEW_FIRES_OUTSIDE = 0, MTCOLLISION = 0.
- Balance j17 10474.64 vs j16 10450.13 vs reference 10474.64 (equal). Run time 0:03:03.654.
- NOT_FOUND: v4 packet file on disk; 9/7-NY + 9/8-NY journal rows (standing); MTCOLLISION rows (zero).
- "Do NOT propose the next change. The planner rules B-34 from C2."
