# BUILDER RESULT B-31 - slot fix back on, guard report-only, memo values captured; 9/8 16:55 back, 28 div-only probe diffs; RESTORED on STOP-W (trial record)

Trader summary: your 8 Sep 17:00 short is back - the 15-minute check that blocked it now only reports instead of refusing. Your other three takes and both refusals came out identical, to the cent. Of your three missing trades, the 7 Sep 09:20 long traded again from 1.16135 to 1.16200, while the 1 Sep 17:35 long and the 8 Sep 10:10 short appeared but were stopped before entry - and this time the journal says exactly why: at 17:30 the book remembered a short setup while the live trade was long, and at 10:05 it remembered line 2 while the live trade read line 4. The run itself has a wrinkle: 28 of its 3,168 per-bar reads differ from last time in one downstream field only, so by the relay's written rule the fix stays off the live file and everything is put back exactly as it was. No take moved and no new take appeared outside your seven.

## Part 0 - fresh-session start
- 0.1 relay skill loaded first. Relay B-31 wins over older queue items for its scope.
- 0.2 ls-remote builder/B-30 returns `1b45e669f1efb4d21158b0eb99c8fb0d13a8d165 refs/heads/builder/B-30` (verified). Checked out builder/B-30, cut builder/B-31 from 1b45e66. Dirty tree kept (117 lines; count only). No git-config/remote change. Pushes through remote `backup`.
- 0.3 read in order: AGENTS.md; srj-relay skill (whole); srj-strategy skill sections 2 (43-61), 5 (60/91-93), 6 (99-101), 8, 11 (141), 12; pointer; BUILDER_RESULT_B30.md (carried note, D1/D2/D4/D5); BUILDER_RESULT_B29.md B3-B5 + C2.
- 0.4 `git log -1`: `1b45e669f1efb4d21158b0eb99c8fb0d13a8d165 B-30 9/8 NY dies at UJALIGN_NOMATCH on true 15m bull, MEASURED read-only`. SHA gate all matched (no STOP-A): EA 964803F4FD452349D67FDC31A73A7B297D4BB93726FA69086DB0A60283AE74F8; ex5 7C46B16C035A9F19B936FD4899BEC0289AD82C8F4AF8B652B0FA6D7A3DC54994; `.B29X` 70E68EE133A51705DA03A2E3F16C7D571C6A596BEF680741C0112D7565C4CA3D; FlowLogic 956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342 / ex5 27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90; HTFEngine D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755; strategy E238A9D69638ABE627D231DD74BB4E14BD65C30F46ADD2CCA0F368FD6B88DB48; relay 865E87500698166BB3E5EEC7B508E2381492C7C5E5B78BA9EDFC1965DDAFB646; ledger 1E18A6B810DD70E54672640399D3C80591DFD7FB684A977CF8B1A89F593B0882 (item 1171); journal 23329BCB141E67AC3799406A038839F335DD8AAE4A8B2D4BB73CC8AF34298B6D (1057 lines); j14 3019ABEB079EF203D5FB4F921577BB517B435257276CBF9D6E81AB11535B0C7B; j13 023BDA7075BA128F1CD3476F0990D7DBD277E551DFF9E370C4F905C29B8BF52A.
- 0.5 names: j13 (slots late), j14 (Hunk X only), j15 = RECON62-B31_JOURNAL.log (this relay). RECON62 window (1787702400/1788998400). Hunk X (`"", 1, ...`, kept `.B29X`); Hunk Y (report-only, two sites); Hunk M (memo prints). Six marks / three missing valids / 7-take build d0589ef as relayed.

## Part A - records
- A1 no banking (no new words of his). Journal and strategy skill untouched (SHAs unchanged, Part D).

## Part P - pre-checks (read-only; P1/P2 verified after B0 per relay order)
- P1 guard purpose: packet relay v315-UJIMPL-16 P018 (IE2: "direction-alignment block - read FL_BUF_HTF_LOW at barShift (buffer 21 = M15 ...); misalign prints UJALIGN_NOMATCH (bar/dir/m15/uj_readFail=0) + return ... pass branch prints UJALIGN_PASS (unconditional)") and P019 (IE3: "same block with uj_readFail field ... pass branch prints UJALIGN_PASS (unconditional)"). No his-word quote as reason for a 15m refusal; no USDJPY bars named. GUARD_PURPOSE=P018+P019 quotes; GUARD_UJ_BARS=none. No STOP-P.
- P2 Hunk X base: `.B29X` SHA 70E68EE1; `diff .preB31 .B29X` exactly the B-29 B4 hunk (-1/+1 on the `1, InpFL_HtfLookbackBars,` line).
- P3 UJALIGN sites in `.B29X`: NOMATCH-`return` line count 2 (lines 9105 IE2, 9264 IE3, pasted raw in B-29/B-31 file); PASS line right after each, count 2 (9106, 9265). Other UJALIGN-only `return`: 0 (BYPASS arm prints only). No STOP-P.
- P4 memo sites in `.B29X`: store line `uj_memo_anchor = g_anchorLine; uj_memo_dir = (int)g_dir; uj_memo_barTime = barTime;` count 2 (7664, 10722); `uj_memo_src = "POLL";` within 2 lines of 7664 (7666), `"FIRELOCAL";` within 2 of 10722 (10724). IDENTITY fail print count 1 (10743, full text in B4 context). Reset line count 1 (12329). Types verified for the B4 formats: uj_memo_anchor int (305), uj_memo_dir int (306), uj_memo_barTime datetime (307), uj_memo_src string (311), g_anchorLine int (1066), g_dir ENUM_SRJ_DIR; `barTime` in scope at both store sites (used in the store line and `UjDayDiff(barTime, ...)` below). No STOP-P.
- P5 rule-conflict: skill grep for a his-word universal 15m refusal returns only other rules (TREND-SWEEP-IRRELEVANT, ONE-TAKE, CHART-READS-6/5, BIAS-SOURCE-INSTANCES). STRUCTURAL-BIAS (section 6) names trend-following only ("the 15m flip enables the trend-following bias"). No universal refusal pin. Hunk Y/M conform to the planner's R1-R5. No STOP-P.

## Part B - edits (one EA compile; no indicator edit or compile)
- B0 backups, equal to gate: EA mq5 964803F4FD452349D67FDC31A73A7B297D4BB93726FA69086DB0A60283AE74F8; EA ex5 7C46B16C035A9F19B936FD4899BEC0289AD82C8F4AF8B652B0FA6D7A3DC54994.
- B1 `.B29X` over EA mq5, SHA 70E68EE1 verified. (Hunk X live; nothing else for X.)
- B3 Hunk Y at both sites, whitespace kept (one owned + repaired indent slip, B-19 class: two lines briefly carried +1 space, caught in the diff and repaired before compiling). NOMATCH line: `return;` deleted, `uj_readFail=%d"` to `uj_readFail=%d reportOnly=1"`, B-31 comment appended. `else` inserted (PASS-line indentation) before each PASS print. BYPASS untouched.
- B4 Hunk M (all `if(InpDebugLog)`, no variable changed): UJMEMO_STORE print after each store line (barTime in scope at both sites, stated); IDENTITY fail print extended with `memoAnchor/memoDir/liveAnchor/liveDir/memoBar`; abort unchanged.
- B5 full diff vs `.preB31`, raw: exactly the Hunk X hunk (-1/+1), two Hunk Y blocks (each -1/+2: NOMATCH line replaced, `else` inserted, PASS untouched), Hunk M (+1 store POLL, +1 store FIRELOCAL, -1/+1 fail print). Nothing else. Full text:
  - `@@ -7664,6 +7664,7 @@` + STORE POLL print.
  - `@@ -9102,7 +9103,8 @@` -NOMATCH+return / +NOMATCH reportOnly + `else` (PASS context).
  - `@@ -9261,7 +9263,8 @@` same at IE3.
  - `@@ -10722,6 +10725,7 @@` + STORE FIRELOCAL print.
  - `@@ -10740,7 +10744,7 @@` -/+ IDENTITY fail print with memo/live values.
  - `@@ -11206,7 +11210,7 @@` -/+ Hunk X line.
  - Edited SHA 0A18DDB32F39BBDEE098BA4E3E2B836D26A23CEBD11079664F78A5971EDA7261. Kept `Experts/SRJ_FlowNexus_EA.mq5.B31XYM` same SHA, never committed.
- B6 EA compile only. Log `B31_EACOMPILE.log`: `Result: 0 errors, 0 warnings, 6624 ms elapsed`. New ex5 B4F9D2AE5CF18D9D3678FC3CF8063D3EAF7D65DD805267C80416C47BE162B1C7 (454994 B). No STOP-B.

## Part C - one run j15 (RECON62-B31_JOURNAL.log, 84187 lines, 16561559 B, SHA C051915B1AB13A5A49C5094C3F99AE0F31B5AEFE672A304A9C3A140FD18DE6F9, local unpushed)
- C0 hygiene as B-29 C0: no terminal before launch (verified); six-line ini block to RECON62 via Edit + readback; script `launch_recon62b31_run.ps1` (copied from b29x, only RunName RECON62-B31); WMI_PID 8116, terminal PID 19960, PRE_JOURNAL_LINES=847598; window proof day-log 847611 `testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.08.26 00:00 to 2026.09.10 00:00` (+847637 started-with-inputs); wrapper killed per RAM order; graded from day log (no DONE file); completed 23:34:12 `563338 ticks, 3168 bars ... Test passed in 0:03:59.624` (fast as ordered: slot fix live); leftover terminal + one orphan agent stopped (both verified gone); ini June restored + read back. Build proof: FlowLogic untouched this relay (no W re-applied by design); EA proven live by the new STORE/FAIL/reportOnly rows.
- C1 slot-fix proof without the indicator print: UJPROBE census j15 vs j14, wall-clock stripped: identical 3140 of 3168. The 28 differences are div-field only (all h4/h1/m15/confirmedFeed/ltf/empty identical; first at index 774 bar 8/28 16:25; field analysis: {div}: 28). STOP-W fires by the letter (j15 != j14). UJPROBE j15 vs j13 diff 2528 (≈2535 as expected).
- C2 filed-trade table, j13 vs j14 vs j15 (segment lines; full rows in the slice):
  - (a) six marks (figures must equal j13 to the cent):
    - 8/28 SHORT 10:00: HOLD. tp 1.16364 sl 1.16508 r 2.43 entry 1.16466 exit POI_BODY_BREAK 1.16439 (ENTRY j15:17168; MTEXIT j15:17569; EXIT j15:17577).
    - 9/4 LONG 15:55: HOLD. tp 1.16302 sl 1.15847 r 1.66 entry 1.16018 exit DAY_CLOSE 1.16093 (ENTRY j15:54154; MTEXIT j15:55861; EXIT j15:55869).
    - 9/7 LONG 16:40: HOLD. tp 1.16315 sl 1.16238 r 2.34 entry 1.16261 exit TP_TOUCH 1.16315 (ENTRY j15:60102; MTEXIT j15:60226; EXIT j15:60228).
    - 9/8 SHORT 16:55: HOLD (back vs j14). tp 1.16114 sl 1.16274 r 1.96 entry 1.16220 exit SL 1.16274 (ENTRY j15:64113 ticket 10; MTEXIT j15:64285; EXIT j15:64287).
    - 8/27 NY 17:05 refusal: HELD, no fire; j15 has no ABORT/REFUSED/FIRED/SIGNAL row at all in 8/27 16:55-17:10 (verified zero hits; j14 same shape).
    - 9/1 LDN 09:50 refusal: HELD, no fire; j15 rows UJ5MENTRY_REFUSE bar 09:50 (j15:31335) + ABORT LTF_MISALIGN 09:55 (j15:31336) + A6REFUSED (j15:31337).
  - (b) three missing valids (reported, never a condition):
    - 9/1 NY 17:35 LONG: FIRED bar 17:30 (j15:34485 tp 1.16077 r 1.17 sl 1.15975) then VOIDED (ABORT MEMO_IDENTITY 17:35:01 j15:34490; no ENTRY). Memo values below.
    - 9/7 LDN 09:20 LONG: FIRED bar 09:15 and TRADED (ENTRY j15:57034 ticket 6; MTEXIT j15:57425 entry=1.16135 exit=1.16200 TP_TOUCH; UJMEMO_PASS j15:57022).
    - 9/8 LDN 10:10 SHORT: FIRED bar 10:05 (j15:61855 tp 1.16102 r 1.94 sl 1.16258) then VOIDED (ABORT MEMO_IDENTITY 10:10:00 j15:61860; no ENTRY). Memo values below.
  - (c) j15 fires outside the seven valid bars (8/28 10:00, 9/1 17:30, 9/4 15:55, 9/7 09:15, 9/7 16:40, 9/8 10:05, 9/8 16:55): 0. All 7 FIRED rows sit on valid bars.
  - Totals: FIRED j15 7 (j14 6, j13 4); ENTRY_TICKET 5/4/4; MTEXIT 5/4/4; SIGNAL 7/6/4; EXIT 5/4/4; balance j15 10354.80 (day-log 915621) vs j14 10460.96 vs j13 10194.64.
- C3 9/8 NY chain in j15, bars 16:45-17:10 (186 rows in slice): 16:40 candidate ABORTs TP_RR_FAIL (j15:63655, S5 poll); 16:50 CONFIRMPOLL confirm=0 (j15:63693) + UJALIGN_NOMATCH reportOnly=1 (j15:63723, no return); 17:00 CONFIRMPOLL confirm=1 (j15:63896) + UJALIGN_NOMATCH reportOnly=1 (j15:63901, no return) + SLEXT agree (j15:64058 memoSlot 7) + A6FIRED (j15:64097 tp 1.16114 r 1.96 sl 1.16274) + SIGNAL (j15:64099) + UJMEMO_PASS (j15:64101 admit_key 16:55:5, poll SL 1.16379 R 0.67) + ENTRY_TICKET (j15:64113). Side by side with j13: identical through CONFIRMPOLL confirm=1; rows differing from j13: the two reportOnly NOMATCH rows (no j13 counterpart - j13 never consulted the guard here), UJMEMO_STORE rows (new), UJMEMO_PASS (j13:60190 src=FIRELOCAL vs j15:64101 src=POLL), admit_key seq :5 vs :4, ENTRY ticket 10 vs 8 (eat-man counts), plus wall-clock stamps.
- C4 UJALIGN census j15 totals: PASS 279 / NOMATCH 47 (reportOnly) / BYPASS 9 (350 rows) vs j14 280/73/9 (362). On-bar rows for the nine filed bars: 8/27 17:05 NOMATCH SHORT +1.0 (j15:13766); 8/28 10:00 BYPASS SHORT -1.0 (j15:17010); 9/1 09:50 NOMATCH LONG -1.0 (j15:31192); 9/4 15:55 PASS LONG +1.0 (j15:53879); 9/7 09:15 PASS LONG +1.0 (j15:56783); 9/7 16:40 PASS LONG +1.0 (j15:59870); 9/8 16:55 NOMATCH SHORT +1.0 (j15:63901); none on 9/1 17:30 or 9/8 10:05 (same as j14).
- C5 memo values (Hunk M rows, raw):
  - 9/1 17:25-17:35: STORE bar 17:30 src=POLL anchor=8 dir=SHORT (j15:34311); FAIL bar 17:30 reason=IDENTITY src=POLL memoAnchor=8 memoDir=SHORT liveAnchor=5 liveDir=LONG memoBar=2026.09.01 17:30 (j15:34489); ABORT MEMO_IDENTITY 17:35:01 (j15:34490). Void side: BOTH anchor (8 vs 5) and direction (SHORT vs LONG); memo written by the 17:30 POLL (a SHORT poll on the same bar overwrote it - planner R5 suspect proven).
  - 9/8 10:00-10:10: STORE bar 10:05 src=POLL anchor=2 dir=SHORT (j15:61641); FAIL bar 10:05 reason=IDENTITY src=POLL memoAnchor=2 memoDir=SHORT liveAnchor=4 liveDir=SHORT memoBar=2026.09.08 10:05 (j15:61859); ABORT MEMO_IDENTITY 10:10:00 (j15:61860). Void side: anchor line ONLY (2 vs 4); direction same SHORT; written by the 10:05 POLL.
  - 9/7 09:10-09:15 (traded): STORE bar 09:15 src=POLL anchor=2 dir=LONG (j15:56769); PASS admit_key 09:15:3 entry=1.16135 tp=1.16200 sl=1.16098 R=1.76 src=POLL wsrc=ASH (j15:57022). Nothing missing.
- C6 STOP rules (evaluated after C2): STOP-W YES (3140 != 3168); STOP-D no (four takes equal j13 figures; neither refusal fired); STOP-S no (0 outside fires). Verdict RESTORED. EA mq5+ex5 restored from `.preB31` and verified (964803F4/7C46B16C, empty diff). Hunk X+Y+M text survives in `.B31XYM` and the B5 diff.
- C7 trader lines: "Your 8 Sep 17:00 short is back - entry 1.16220, stopped at 1.16274 - and the 15-minute check that blocked it now only reports." "Your other three takes and both refusals came out identical, to the cent." "Your 7 Sep 09:20 long traded from 1.16135 to 1.16200; your 1 Sep 17:35 long and 8 Sep 10:10 short appeared but were stopped before entry, and the journal now names the remembered setup each time."

## Part D - final disk state
- KEPT-case SHAs not applicable (RESTORED): EA mq5 964803F4FD452349D67FDC31A73A7B297D4BB93726FA69086DB0A60283AE74F8; ex5 7C46B16C035A9F19B936FD4899BEC0289AD82C8F4AF8B652B0FA6D7A3DC54994 (match; empty diff vs `.preB31`).
- FlowLogic 956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342 / 27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90; HTFEngine D5FD5B06 (all re-taken, unchanged).
- Strategy skill E238A9D6, relay skill (A-speed bullet below), journal 23329BCB: all untouched except noted. terminal.ini June USDJPY, read back. No terminal and no agent running (verified).
- Kept on disk, untracked: `.preB31` (both), `.B31XYM` (0A18DDB3), `.B29X` (70E68EE1), `.B28W` (430FB4D3).
- Operator-ordered speed note (his words 2026-10-05: runs under 5 minutes): added "Keep regression runs fast" to the relay skill Trial discipline (j14 0:04:06 + j15 0:04:00 with the slot fix live vs j12 0:51:57 + j13 0:58:34 shifted; a ~50-minute RECON62 run means the shift is back). New skill SHA filed below; NOT pushed (outside the relay F5 set) - rides the next push slot. RESTORED verdict returns the slow window with the restore; speed is permanent only with the fix live, per his order recorded here.

### Glossary (every journal code cited, few words each)
- A6FIRED: fire record. A6REFUSED: refusal record. ALERT SRJ SIGNAL/EXIT: entry/exit alert. ENTRY_TICKET/MTEXIT: fill/exit records. ABORT (TP_RR_FAIL/LTF_MISALIGN/MEMO_IDENTITY): abort + reason. UJ5MENTRY_REFUSE: entry-bias refusal. UJMEMO_STORE (anchor/dir/src): memo write print. UJMEMO_PASS/FAIL (IDENTITY + values): memo admission check. UJPROBE (h4/h1/m15/div): per-bar bias/div probe. UJM15ROW: 15m vote at 15m ticks. UJALIGN_PASS/NOMATCH(reportOnly)/BYPASS: 15m direction guard, now report-only. CONFIRMPOLL (confirm): confirmation terms. UJ1R (R verdict): R check. SIDE1*/SUPPRESSED/SLEXT/STOPRESOLVE/TP_ELECT: selection and stop machinery. STATE: state transition. SRJ BUILD: indicator build stamp. final balance: tester end balance. Test passed: tester completion marker.

## Part F - files and push
- F1 this file. F2 slice `BUILDER_SLICE_B31.md` (835 lines, 98116 B; cap 1500 - C2/C3/C4/C5 rows whole).
- F3 pointer (B-31 RESTORED; EA restored 964803F4; Hunk text in `.B31XYM`; Next = relay B-32).
- F4 ledger item 1172 (grep `B31-UJALIGN-REPORTONLY` was 0; appended; new SHA C5843F97C084C206ECC801EE027C4ACCC9166543EFCD8B6E64858CA9BAACC44B).
- F5 commit + push to builder/B-31 ONLY: BUILDER_RESULT_B31.md, BUILDER_SLICE_B31.md, BUILDER_SESSION_POINTER.md, SRJ_FLOW_NEXUS_LEDGER.md. No EA/indicator/Include/journal/backup/log/ini. (Relay skill speed bullet + ledger 1172's SHA travel here in prose; the skill file itself is not in the F5 set.)
- F6 ls-remote check under the reply line.

## Carried note - must contain
- Gate / STOP status per part: 0.4 matched (no STOP-A); A untouched; P1-P5 clean (P1 purpose quoted, no STOP-P; P2/P3/P4 counts exact; P5 no universal pin); B 0/0 (no STOP-B; one owned+repaired indent slip); C0 verified; C1 3140/3168 div-only (STOP-W); C2/C3/C4/C5 measured; E equal; F4 appended. Verdict RESTORED, EA restored + verified.
- GUARD_PURPOSE=v315-UJIMPL-16 P018+P019 quotes (IE2/IE3 direction-alignment blocks; misalign print+return; pass prints unconditional), GUARD_UJ_BARS=none (no his-word refusal reason, no bars named).
- UJPROBE_J15_VS_J14=identical 3140 of 3168 (28 div-only: h4/h1/m15/ltf/empty all equal; first index 774 bar 8/28 16:25).
- SIX_MARKS=hold (8/28, 9/4, 9/7-16:40 identical; 9/8-16:55 BACK with j13 figures: tp 1.16114 sl 1.16274 r 1.96 entry 1.16220 exit SL 1.16274).
- REFUSALS=held (8/27: no row in 16:55-17:10 window, no fire; 9/1: REFUSE 09:50 j15:31335 + ABORT LTF_MISALIGN 09:55 j15:31336, no fire).
- MISSING_VALIDS=0901NY fired/voided (tp 1.16077 sl 1.15975 R 1.17, no fill) + 0907LDN fired/traded (entry 1.16135 TP 1.16200 SL 1.16098 R 1.76, TP_TOUCH 10:50) + 0908LDN fired/voided (tp 1.16102 sl 1.16258 R 1.94, no fill).
- NEW_FIRES_OUTSIDE=0 (7 fires, all on valid bars).
- MEMO_0901NY=both: memo 8/SHORT vs live 5/LONG, written by 17:30/POLL (j15:34311 vs 34489).
- MEMO_0908LDN=anchor: memo 2 vs live 4 (dir SHORT both), written by 10:05/POLL (j15:61641 vs 61859).
- UJALIGN_J15=279/47/9 (PASS/NOMATCH-reportOnly/BYPASS; j14 280/73/9).
- Balance j15 10354.80 vs j14 10460.96 vs j13 10194.64.
- NOT_FOUND: none this turn (memo values printed; 9/7-NY + 9/8-NY journal rows already NOT_FOUND in B-29).
- Speed: j15 0:03:59 with the fix live (his under-5-minutes order banked in the relay skill Trial discipline as "Keep regression runs fast"; skill SHA 6E654E29, unpushed - outside F5). RESTORED returns the ~50-minute window until the fix rides again.
- Do NOT propose the next change. The planner rules B-32 from C2 and C5.
