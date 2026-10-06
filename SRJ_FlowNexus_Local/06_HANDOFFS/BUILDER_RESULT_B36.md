# BUILDER RESULT B-36 - 11 June confirmations disagree (poll says yes, edge says A2 break), so no carry edit; broker TP never moved on the 6/5 retarget; MEASURED (read-only)

Trader summary: your 11 June long confirmed at 14:35 on one check and failed it on another check in the same pass - the two readings disagree, so no change was made and your one-confirmation rule was not touched. Your 5 June long's story is confirmed as a broker-paper split: the broker kept your original target of 160.723 the whole time, the machine's 19:15 target only ever lived on paper, and the real exit was the stop on 11 June. Nothing was changed, built, or run this turn.

## Part 0 - fresh-session start
- 0.1 relay skill loaded first. Relay B-36 wins over older queue items for its scope.
- 0.2 ls-remote builder/B-35 returns `713369c72935ce9d0b0e5ad9a4ec7885caa46e86` (verified). Checked out builder/B-35, cut builder/B-36 from 713369c. Dirty tree kept (136 lines; count only). No git-config/remote change. Pushes through remote `backup`.
- 0.3 read in order: AGENTS.md; srj-relay skill (whole); pointer; BUILDER_RESULT_B35.md (carried note, P1-P5, C/D); slice B35; strategy skill lines 78/80/84 (incl. 1445-NEVER), 85, 88, 94, 95, 101, 107, 112-117, 121-122, 139, 141; register B row 3 + B-35 correction; B33-C; B34-C.
- 0.4 `git log -1`: `713369c72935ce9d0b0e5ad9a4ec7885caa46e86 B-35 16:15 word banked, June misses traced to his-rule rows, MEASURED`. SHA gate: EA F9F9C569 / ex5 CF14BED2; FlowLogic 956BF3E3 / 27B5F272; HTFEngine D5FD5B06; strategy 4C4A64E5 (section 13); relay skill disk 1976CA10 vs expected 20A31047 - accounted deviation (verified `git diff`: exactly my own B-34-turn operator-ordered watcher-bullet update, nothing else); ledger 87BD9AAC (item 1176); journal disk 3B6BE2C3 (1058 rows) vs expected 23329BCB - accounted deviation (B-35's own authorized row-306 banking; row present, count 1058, `git diff` vs parent empty); register 3B46EB5E; pointer disk 87834CA4 vs expected 878BBF3E (blob 4385a510; `git diff` vs parent empty - line endings only) - accounted; slice B34 3A21D2A4; j17 3A3CC7E3; j18 051914F9. No STOP-A.
- 0.5 names: j17 EU reference; j18 June run; j19/j20 not run (no B/C); carry site / S4 edge / concurrency check / `.preB36`+`.B36C`+`B36CARRY` unused (no edit); RECON62 + June windows as relayed.
- 0.6 authority: read-only Part P + Part Q + text appends + one push, all used. No edit/compile/run (none done).

## Part A - bank
- A1 no new words from him this turn; bank nothing. His 5 June 16:15-vs-16:50 question stays with him (B-35 P1 OPEN, asked once, unanswered on record).

## Part P - pre-check (read-only, before any edit)
- P1 carry site, raw with disk line numbers (EA 9060-9089 region): lines 9078-9089: `string uj_carryTerm = ""; double uj_carryM15 = 0.0; bool uj_carryR = ReadFlow(FL_BUF_HTF_LOW, uj_carryM15, barShift); double uj_carryWant = (g_dir == DIR_LONG ? 1.0 : -1.0); if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm) && uj_carryR && uj_m15 == uj_want)` + UJCONFIRMCARRY print (9084) + S5 promotion (9087). The carry already contains a 15m term. S4 edge, raw (EA 9270-9286): `[P-CONFIRM-GATE E2]` comment + `IsConfirmationCandle` re-test + `g_state = ST_S5_GATE_CHECK` (9284).
- P2 j18 14:40:22 pass (eval 14:35) + 14:45 pass, raw: UJPROBE 14:35 h4 +1/h1 +1/m15 -1.0/ltf +1.0 (j18:40767); UJPROBE 14:40 same m15 -1.0 (j18:40956); S2→S3 (40931), S3→S4 (40946), "S3 zone" (40947), UJALIGN_NOMATCH 14:35 LONG m15=-1.0 reportOnly (40952), CONFIRM_STRUCT_FAIL 14:35 term=A2_CLOSE_BREAK (40953); 14:40 UJALIGN_NOMATCH (41126) + CONFIRM_STRUCT_FAIL A_OPP (41127). NO UJCONFIRMCARRY row anywhere on the pass.
- P3 CARRY_BLOCKER = CONFIRM_TERM. The carry's confirmation test failed at bar 14:35 (exhibited by the S4 edge row 40953 term=A2_CLOSE_BREAK) while CONFIRMPOLL 14:35 printed confirm=1 (40930) - two readings of the same confirmation disagree, both raw in the slice. (The carry's 15m term would also fail, m15=-1.0 vs LONG, but the confirmation disagreement comes first and voids the M15_TERM premise that "the arming bar confirmed".)
- P4 HIS_M15_1435 = BULL (journal rows 33/34/35/36: 15m Bull on all four 6/11 rows; Rulings-G line 103). Machine m15 at 14:35 = -1.0 (bearish): differs from his Bull.
- P5 decision table: CONFIRM_TERM → STOP-P. Parts B and C skipped; Part Q done; verdict MEASURED.

## Part B - skipped (STOP-P)
- B1/B2/B3/B4 not executed. No `.preB36`, no `.B36C`, no compile. Hunk text: none proposed (the relay's shape is quoted in the relay, not re-filed here).

## Part C - skipped (STOP-P)
- C0/C1/C2 + run 2 not executed. No j19, no j20. 5 June 16:15-vs-16:50 question stays with him (untouched).

## Part Q - read-only trace: the machine's 5 June long that floated until 11 June
- Q1 deal #6 rows, raw: PRE-SEND lots=0.40 entry=160.120 slPts=394 tpPts=603 (j18:21724); TP_ELECT entry=160.115 sl=159.726 tp=160.723 R=1.56 bar 16:50 (j18:21712); deal #6 buy 0.4 at 160.120 (j18:21726); EXITVERDICTs 16:55-19:00 curTp=none→160.298, all vDAY=0 (j18:21742-21975 sample); MTEXIT TP_TOUCH 19:15 entry=160.115 exit=160.298 (j18:21992); MTLIFE verdict=TP_TOUCH closePx=160.298 (j18:21993, model marked done); broker stop deal #7 sell 0.4 at 159.725 on 6/11 22:30:51 (j18:47855). No MTCLOSE row for ticket 6.
- Q2 code spots, raw: MTEXIT print EA 12099-12105; `g_trade.PositionClose(ticket)` EA 11865 (inside a closer that only the gated legs reach); paper comment EA 12106-12108 ("only the WINNING BREAK/DAY_CLOSE verdict closes... paper MTEXIT/MTLIFE/EXIT rows print regardless"); F3 day-close comment EA 12061 (his universal rule 2026-09-21).
- Q3 EXIT_SPLIT_CAUSE = TP_TOUCH leg paper-only, relying on a broker TP set elsewhere (the 19:15 model exit printed while the broker order kept TP 160.723; no broker-TP modification row; close call unreachable for TP legs). BROKER_TP_AT_ENTRY = 160.723 (TP_ELECT tp + PRE-SEND tpPts=603 over the 160.120 fill; A6FIRED tp matches).
- Q4 his exit rules, record only: RETARGET restated line 121 (his 2026-10-04 verbatim: floating trade retargets the nearest closed-session high; day close is the fallback); EXACT-PRICE-NO-LENIENCY line 78 (entry at open, exact target exits, no wiggle); day-close fallback = UNIVERSAL day-close rule line 28 (decisive exit near day close, 5 min before candle close, every trade) + RETARGET fallback. No edit.

## Part D - final disk state
- Re-taken SHAs, all equal: EA F9F9C569 / ex5 CF14BED2; FlowLogic 956BF3E3 / 27B5F272; HTFEngine D5FD5B06; strategy 4C4A64E5; journal 3B6BE2C3; ledger 2CF8CACE (item 1177); register 3B46EB5E; pointer (new value below).
- Untracked backups kept as they are; B-36 adds none (no edit/compile/run).
- Glossary (every journal code cited, few words each): UJCONFIRMCARRY: carry print. CONFIRMPOLL (confirm): confirmation terms. CONFIRM_STRUCT_FAIL: structural confirmation failure. UJALIGN_NOMATCH/PASS/BYPASS: 15m guard, report-only. UJPROBE (h4/h1/m15/ltf): per-bar bias probe. STATE: state transition. RETESTBOOK: retest-hit book. FRESHCOUNT: freshness census. SUPPRESSED/HELD: holder records. SIDE1H_WOULDPREEMPT: preemption check. HEADS-UP: arm alert. ZONEID/XOBPROMO/ZONEPICK/S3-zone: zone arming records. MTEXIT/MTLIFE: model exit/life records. PRE-SEND/TP_ELECT: order request records. deal: tester fill line. EXITVERDICT: exit-leg verdict. final balance: tester end balance (not re-graded this relay).

## Part F - files and push
- F1 this file. F2 slice `BUILDER_SLICE_B36.md` (51 lines; cap 1500 - P2 + Q1 rows whole).
- F3 pointer (B-36 MEASURED; EA unchanged F9F9C569; Next = relay B-37; 16:15-vs-16:50 still with him).
- F4 ledger item 1177 tag `B36-ONE-CONFIRM-1106` (grep was 0; appended; new SHA 2CF8CACE90E8CB7429B141073CA53166C64C91169544E27740F9F38D8D94F3C9).
- F5 commit + push to builder/B-36 ONLY: result, slice, pointer, ledger, relay skill (disk 1976CA10 with the watcher bullet, so GitHub matches disk). No EA, indicator, Include, journal logs, ini, launcher or backup.
- F6 ls-remote check under the reply line.

## Carried note - must contain
- Gate result: 0.4 matched with three accounted deviations (relay-skill watcher bullet: diff-verified mine; journal row-306 banking: content-verified; pointer/blob hash trio: `git diff` empty, endings only). No STOP-A.
- CARRY_BLOCKER = CONFIRM_TERM (40930 confirm=1 vs 40953 A2_CLOSE_BREAK, both raw); HIS_M15_1435 = BULL (journal rows 33-36); P5 decision STOP-P (no B/C, Q done, MEASURED).
- No edit: no `.B36C`, no ex5, no compile (B1-B4 skipped).
- EXIT_SPLIT_CAUSE = TP_TOUCH leg paper-only, broker TP set elsewhere and never moved. BROKER_TP_AT_ENTRY = 160.723.
- NOT_FOUND list: second-confirm pin (NONE); v4 packet file (standing); r78 tree source (E80FF0C2 unknown revision); 9/7-NY + 9/8-NY journal rows (standing); memo-refusal pin (standing); MTCLOSE row for ticket 6 (no close row printed).
- "Do NOT propose the next change. The planner rules B-37."
