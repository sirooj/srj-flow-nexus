# BUILDER RESULT B-9 - 11 June long with zero tolerance: 14:35 alone is his retest-plus-confirmation; the EA checks 14:30 and fails it; guard blocked the allowed path (measurement record)

Step 0 raw (measured 2026-10-04, terminal disk, branch builder/B-8 head):
- git log -1: 68fdfcb B-8 A2 1-point trial: 14:40 SIGNAL at filed price, filed #4 moved, RESTORED (relay B-8, planner side)
- git status --short line count: 35 (25 pre-existing modified/deleted + 10 untracked: compile logs, preB4/preB7/preB8, B-4/B-7/B-8 STATUS/DONE markers)
- EA SHA-256 Experts/SRJ_FlowNexus_EA.mq5: F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582 (starts F04AF9C3, the B-7 kept build; gate passed)
- Backups: .preB7 E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC (685026 B); .preB8 F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582 (685444 B, byte-identical to the EA)
- EX5 on disk: 0D78C1C876326FD76161B5CBF217487534114D2459F95A0DE426BEC0FBD0300A (452482 B; the B-8 trial build, does NOT match the source; this relay neither compiles nor runs, so it is left as it is)
- Branch builder/B-9 created from 68fdfcb this turn. Parts A and B are measurement only: no edit to the EA, the indicator or Include/SRJ; no compile and no tester run.

## Part A - the planner's answers to the B-8 carried note (filed, not re-derived)

Q1. What the 1-point allowance forgave (from B-8 Step 6; the bar shown is the confirmation bar, the forgiven retest close is the bar before it):

| date | conf. bar | dir | line | line value | retest close | through by |
|---|---|---|---|---|---|---|
| 2 June | 09:40 | SHORT | Daily-POC | 159.716 | 159.717 | 1 point |
| 4 June | 10:35 | LONG | Daily-POC | 159.884 | 159.884 | 0 (equal at 3 digits; see B3) |
| 5 June | 09:15 | SHORT | Daily-POC | 159.960 | 159.961 | 1 point -> moved the filed 5 June London short from 09:45 at 159.948 to 09:20 at 159.959 (the STOP) |
| 8 June | 17:50 | SHORT | Weekly-VWAP | 160.149 | 160.150 | 1 point (no follow-up) |
| 9 June | 15:15 | SHORT | Daily-POC | 160.161 | 160.162 | 1 point |
| 9 June | 15:40 | SHORT | Daily-VWAP | 160.177 | 160.178 | 1 point |
| 9 June | 16:25 | SHORT | Weekly-POC | 160.189 | 160.190 | 1 point |
| 10 June | 09:40 | LONG | Daily-POC | 160.355 | 160.354 | 1 point |
| 11 June | 14:20 | SHORT | Daily-POC | 160.523 | 160.524 | 1 point |
| 11 June | 14:25 | SHORT | Daily-POC | 160.525 | 160.526 | 1 point |
| 11 June | 14:35 | LONG | Daily-POC | 160.523 | 160.522 | 1 point -> SIGNAL 14:40 at 160.524, refused CONCURRENCY_LIMIT |
| 11 June | 15:15 | LONG | Daily-POC | 160.531 | 160.530 | 1 point -> SIGNAL 15:20 at 160.543 R 1.05, refused CONCURRENCY_LIMIT |

Q2. Does it contradict his rule? YES. His words, 2026-09-23, verbatim: "a hairline difference or a few points difference all gets accounted for. there is no wiggle or tolerancy rule in my trading rules." A close 1 point through the line is a close through the line. The planner withdraws the allowance permanently. Nothing is ever built on a tolerance.

Planner-side defect, filed per the ledger rules with class "planner proposed a rule-conflicting change; caught by builder carried note": relay B-8 proposed a tolerance without first searching his banked rules (the 2026-09-23 no-tolerance words stood in the strategy skill section 5 and in BUILDER_FINDING_2026-09-23_HIS-THREE-ORDERS.md line 88); the B-8 carried note caught it. No ledger append this turn (Part C names only the workflow files; the class is recorded here as the filing).

## Part B - why the 11 June long still has no fill, with zero tolerance (record + existing journals only)

### B1. Candles (RECON78-B7 journal, 36794 lines; B-8 journal cross-check, same feed: both runs 542258 ticks, 2880 bars)

Your case: 11 June New York USDJPY long, your entry 160.524 at the 14:40 open. Daily-POC 160.523, zone 160.489-160.504.

| bar (11 June NY USDJPY) | open | high | low | close | Daily-POC on the bar | source |
|---|---|---|---|---|---|---|
| 14:25 (prior bar) | 160.525 | unprinted | unprinted | 160.524 | 160.525 | B7 UJSBTELEM 22616 (o1=160.525 c1=160.526 = 14:20 O/C; c0=160.524 = 14:25 C; sbL=160.525) |
| 14:30 (retest candle the EA checks) | 160.525 | unprinted | unprinted | 160.522 | 160.523 | B7 UJSBTELEM 22652 (o1=160.525 c1=160.524 = 14:25 O/C; c0=160.522 = 14:30 C; sbL=160.523) |
| 14:35 (your retest bar) | unprinted | 160.528 | 160.513 | 160.526 | 160.523 | B7 UJSBTELEM 22694 (c0=160.526 = 14:35 C; sbL=160.523); H/L from B8 SWINGDUMP 22598 (same feed, same bar: close=160.526 high=160.528 low=160.513) |
| 14:40 (your entry bar) | 160.524 | unprinted | unprinted | unprinted | unprinted (no contender; RETESTBOOK hits=0, B7 22705) | B8 SIGNAL bid=160.524 = 14:40 open (same feed; matches your filed entry) |

Honesty notes (nothing inferred): the B-7 journal prints no SWINGDUMP row at all (0 hits, two patterns) so 14:25/14:30 high/low are unprinted there; o0 (the 14:35 open) is never printed (UJSBTELEM prints o1/c1/c0 only); the 14:40 high/low/close are unprinted (the 14:45 pass has no contender rows). Touch does not need high/low here: it is proven three ways on the 14:35 bar (Alert RETEST LONG at 160.523 [D-POC +1], B7 22656; UJDTTERMS LHIT, B7 22690; CONFIRMPOLL touchAttr=1, B7 22692).

With no tolerance at all, plainly:
- YES: the 11 June New York USDJPY 14:35 bar itself touched Daily-POC 160.523 (range 160.513-160.528 brackets it) and closed above it at 160.526.
- YES: the 14:30 bar closed below it (160.522 under 160.523, 1 point through - a break under your no-tolerance rule).

### B2. His SAME-CANDLE rule and what the EA checked

His words, from the record: the 2026-09-23 finding banks "SAME-CANDLE - retest and confirmation may coincide on one candle (entry still next open)" (BUILDER_FINDING_2026-09-23_HIS-THREE-ORDERS.md line 90). Banked in the strategy skill section 5 ("Rulings 2026-09-23"), SAME-CANDLE bullet: his verbatim words "the retest and the confirmation candle can be the same candle", amended point "retest plus confirmation may coincide on one candle; entry stays next-bar open". Same point restated in skill section 7 (SAME-CANDLE-PERMITTED, his 2026-09-30 words) and applied to this exact bar in section 5 (PRIOR-CLOSE-IRRELEVANT: "the 14:30 candle close is not relevant"; VENUE-CORRECTION: the proving venue is the 14:35 open+close plus the 14:40 open).

EA text search (Expert file on disk, B-7 kept build): IsConfirmationCandle is defined at EA 2337 and called at 13 call sites (7449, 7874, 7875, 8242, 8268, 8337, 8360, 8367, 8438, 8439, 9052, 9067, 9248). A second differently-formed pattern for same-candle code (SAMECANDLE / same-candle / sameCandle / SameCandle) hits 4x, all in one comment at EA 8859 ("the same candle you would enter on is NOT tradeable" - entry-timing note, entry still next open). There is NO same-candle retest-plus-confirmation path in the code: every call takes the retest from barShift+1 (o1/c1/h1/l1) and the confirmation body from barShift (o0/c0) - see EA 2342-2347.

- No same-candle path evaluated 14:35 in the RECON78-B7 14:40 pass, because the only LONG confirmation call there (the contender at EA 8438) used barShift=1, taking 14:30 as the retest candle, and it failed on 14:30's close - raw row B7 22694: `[SRJ-EA] UJSBTELEM bar=2026.06.11 14:35 dir=SHORT have=1 sbDir=LONG sbLine=0 confC=0 confH=0 sbL=160.523 o1=160.525 c1=160.522 c0=160.526 arm=1 termC=A2_CLOSE_BREAK termH=A_OPP - contender evaluation (Fix S3)`.
- The S4 LONG gate (EA 9248) never ran for 14:35 in that pass, because the held SHORT's deferred LTF abort applied first and ended the pass - raw rows B7 22695 `[SRJ-EA] UJDEFERAPPLY bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC - deferred LTF abort applies, holder unchanged (Fix S-a)`, 22696 `ABORT reason=LTF_MISALIGN state=S4_ARMED`, 22697 `A6REFUSED class=ABSENT_DECLINED bar=2026.06.11 14:40 state=S4_ARMED dir=SHORT predicate=LTF_MISALIGN`, 22699 `STATE S4_ARMED->ABORT`; the only confirmation poll on the bar judged the SHORT (B7 22692: `CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=SHORT oppCandle=0 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true`).

His rule lets 14:35 alone be the retest and the confirmation: it touched Daily-POC 160.523 and closed above at 160.526, entry next open 14:40 at 160.524. Nothing further. No design and no edit.

### B3. The equal-close row (4 June 10:35 LONG, L=159.884, c1=159.884)

YES, this can be shown from existing files as a binary float compare, with no new run. The code tests exact binary equality, not 3-digit text: EA 2361 `if(c1 == L)` (equality counters), EA 2368 `bool closeSideOk = (dir == DIR_LONG) ? (c1 >= L || ...) : ...` (the A2 gate), under the comment at EA 2355-2357 ("A2 needs c1 >= L (LONG) / c1 <= L (SHORT) ... exact equality passes"). The B-8 trial printed UJA2NEAR only when `closeSideOk && !a2_old` (added-line condition, B-8 Step 2), so the B-8 row k=2 (`UJA2NEAR bar=2026.06.04 10:35 dir=LONG line=Daily-POC L=159.884 c1=159.884 thruPts=0`, B8 10272; followed by SIDE1C_YIELD then UJALIGN_NOMATCH, B8 10274/10279) proves the old test failed on binary values that print equal at 3 digits: rounded through-distance 0, yet `c1 >= L` false at the bit level. Not fixed (measurement only).

### B4. The second blocker (5 June New York long still open at the 11 June signal)

Record-first search, in order (spec Part A v4.2 sections 5-6 + L283/L291; strategy skill sections 1-2, 5, 7; findings 2026-09-23; operator journal; register; RECON78-B7 journal):

(a) Is the 5 June New York long in his journal? How and when did he exit it?
- His journal has 5 June New York USDJPY rows: NY trend-following marked "less than 1R and invalid XOB" and NY mean-reversion on LD.L with no take comment (OPERATOR_TRADE_JOURNAL.csv, 5-June block). Neither names a 160.120 fill nor any exit time/price - his journal records setup validity, never fills.
- The register lists 5 June New York USDJPY LONG owed 16:15 (old high 160.723) as valid-missed (BUILDER_REGISTER_VALID_TRADES.md section B row 2). It names the owed entry, never his fill or his exit.
- The tester filled it late: deal #6 buy 0.41 at 160.120 on 5 June 16:55 (B7 14075-14076), stopped 11 June 22:30:51 at 159.725 (B7 24057-24059).
- No spec section, restatement, finding, or journal row states his fill or his exit of this long. SILENT - one plain question for him (below, Q-A).

(b) His near-day-close rule (2026-09-23: "applicable on all setups").
- Found: skill section 1 UNIVERSAL day-close rule (his 2026-09-21 words: "the decisive exit rule is always exit upon near the day close. the rule is 5 minutes before candle close"), pinned to execute at the 23:55 opening price on the verdict day (his 2026-09-25 chart ruling, Friday included); section 5 BOTH-TRUE (setup type is IRRELEVANT to the near-day-close exit - universal, all setups); finding correction 2026-09-23 banks the same universality.
- YES: under it deal #6 would have closed on 5 June at the 23:55 open mark (no trade holds overnight by design). The EA never implements it: RECON78-B7 journal has zero DAY_CLOSE/day-close/flatten rows (0 hits, two differently-formed patterns: case-sensitive DAY_CLOSE/flatten and case-insensitive day-close/day close/flatten), and no 5-June-evening EXITVERDICT/MTLIFE close for the position (only MTLIFE 19:15 TP_TOUCH lifecycle print, B7 14371).
- Time from his pin: 5 June 23:55 open. Price: NOT printed in the RECON78-B7 journal (the only 160.x on 5 June 23:5x rows is a zone bound xobLo=160.178/xobHi=160.203, B7 14567; UJPROBE rows carry no price) - not measurable without a new run; no price is stated here.

(c) Does the record state his rule on opening a new trade while one is already open?
- Found: spec L283 (a London setup still running plus a valid NY setup are both taken, even if they contradict) + L291 (one valid setup per pair per session) + L285/L293 (arrival/completion + rejections consume nothing); skill ONE-TAKE-PER-SESSION (session-scoped slots; cross-session independent). All of it governs same-day sessions.
- The EA's CONCURRENCY_LIMIT guard is unbanked mechanism: zero such rows in RECON78-B7 (0 hits, two patterns: CONCURRENCY and CONCURRENCY_LIMIT), and no spec/skill/finding/jfinding line blesses a cross-day floating-position veto.
- Nothing on record rules a new-day entry while a prior-day position still floats (his day-close rule would normally make the case moot). SILENT - one plain question for him (below, Q-C).

Questions for him (record-first done, sources above; trader words, dates and prices):
- Q-A: "On 5 June New York USDJPY you had a long owed at 16:15 toward the old high 160.723 - did you take it that day, and if so, when and at what price did you close it? The tester held its late 16:55 entry at 160.120 all the way to 11 June."
- Q-C: "On 11 June New York USDJPY the long at the 14:40 open 160.524 was ready while the 5 June long from 160.120 was still open - do you open the new trade while the old one is still floating, or does the open trade block it?"

### B5. What stands between the 11 June long and a fill (trader words, in order)

1. Your 11 June New York long retests Daily-POC 160.523 on the 14:35 bar and closes above at 160.526 - under your same-candle rule that bar alone is retest plus confirmation.
2. The EA never judges 14:35 alone: it checks 14:30's close (160.522, one point under the line) and fails it with zero tolerance.
3. With the withdrawn 1-point allowance the long did reach a full signal at the 14:40 open 160.524, then died on the guard because the 5 June long (entry 160.120) was still open.
4. Under your day-close rule the 5 June long would have closed on 5 June at 23:55, so the guard would never have blocked the 11 June long.
5. Two things only you can settle: did you take the 5 June New York long and when did you close it, and may a new trade open while an old one floats.

## Part C - workflow files

### C1. New skill (full source)
- Written: `.opencode/skills/srj-relay/SKILL.md` (3187 B, 48 lines, SHA-256 1d22f06dc6ac636ad3652bdffc3c1083b5e28605720dbe84c2eb021d41783823). Read back whole (48/48 lines above); content is the relay text verbatim.

### C1b. Thin pointer
- Written: `.agents/skills/srj-relay/SKILL.md` (275 B, 8 lines, SHA-256 76f7b3308e92207db6270096ef9dfcf03a8d6d1a226407ea68a10dde774814f3). Read back whole (8/8 lines above); content is the relay text verbatim.

### C2. AGENTS.md inserts - BLOCKED on anchor miss, file left unchanged
- Attempted the two inserts against same-turn reads. The live concise contract `AGENTS.md` is 34 lines / 4424 B (SHA-256 de8711b37e837194ea363bc2573aafac670932d93ce91d17b180e97a2210bcc2): two probes agree the anchors are absent - Select-String for `## 2. ` / `## 3. Communication rule` / `## 10. Session open checklist` / `B-SERIES PLANNER LANE` returns zero lines, and a second differently-formed python substring count returns COUNT 0/0/0/0 (headings present: `## Authority and safety` = 1, `## Resume and task control` = 1).
- Deeper conflict (listed, nothing deleted): the relay anchors fit the OLD 872-line OpenCode contract - HEAD's `AGENTS.md` is that long contract (`## 2. Who is who` at line 42, `## 3. Communication rule` at line 110, `## 10. Session open checklist` at line 660 of SRJ_FlowNexus_Local/99_WORKFLOW/AGENTS_OPENCODE_ARCHIVE_2026-10-01.md) - while the disk file is the new 34-line Codex contract (`M AGENTS.md` pre-existing in git status; the Codex transition). Inserting OpenCode-era section bullets into the Codex contract would corrupt it, so no edit was made and nothing else in the file was changed.
- Planner owes corrected anchors: either two insert points against the live concise headings, or naming the archive file if the lane should live there. Carried note below.

### C3. Resume skill
- Inserted 1a after step 1 (anchor from same-turn read): `.agents/skills/srj-resume/SKILL.md` now 15 lines / 1598 B (was 14 lines), SHA-256 67eb70da25cea4ac115f63ef9e44524bc848fdf0ebcb20b86c56c30cfab66837. Raw diff: exactly +1 line (`+1a. If the inbound message is a planner relay B-<n>, load ...`), zero other changes. Read back whole (15/15 above).

### C4. Pointer State/Next
- Updated `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_SESSION_POINTER.md` (now 16 lines / 1817 B, cap 35 met; was 25 lines): State = B-series lane active, latest result B-9; Next = relay B-10 from the planner. SHA-256 1b9379ddc63ef407691b9c810559a8f1c009c0a5743257b87231ca8ed2a3894a.
- Digest census over the written pointer: 4 tokens / 3 unique, all 3 resolve to live files (F04AF9C3 -> EA + .preB8; E80FF0C2 -> .preB7; 0D78C1C8 -> EX5), zero unmatched. Resume-order lines untouched (out of the relay scope; they still name the V415 handoff - noted, not edited).

### C5. Checks
- Read-back: each new/edited file read whole above (C1 48/48, C1b 8/8, resume 15/15, pointer 16/16).
- Raw git diff of the workflow files (scoped status + diff, unfiltered):
  - status: `M .agents/skills/srj-resume/SKILL.md`, `M AGENTS.md` (pre-existing Codex-transition modification, NOT this turn - verified untouched: still 34 lines / 4424 B), `M SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_SESSION_POINTER.md`, `?? .agents/skills/srj-relay/SKILL.md`, `?? .opencode/skills/srj-relay/SKILL.md`
  - diff: resume skill +1 line exactly (hunk @@ -6,6 +6,7 @@); pointer State/Next rewrite (25 -> 16 lines); AGENTS.md has no hunk from this turn.
- ASCII-only check (repo audit_skill_ascii.ps1 is hardcoded to the srj-goal path, so the equivalent byte audit ran here instead): C1 0 non-ASCII bytes, C1b 0, resume 0, pointer 0 (all LF-only). AGENTS.md untouched at 3 non-ASCII bytes (the em-dash, pre-existing).
- Conflicts: exactly one - the C2 anchor miss above. No existing AGENTS.md rule contradicts the inserted lane text (relay-as-word, uncommitted trials, lane-scoped push are compatible with the concise contract's authority/safety lines); nothing was deleted.

### Journal-code glossary (every code cited above, few words each)
- UJSBTELEM: contender check (opposite-direction candidate judged with IsConfirmationCandle, prints o1/c1/c0 + terms). A2_CLOSE_BREAK: retest close through the line (the A2 fail). A_OPP: wrong-direction candle (oppCandle fail). B_BODY: confirmation-body fail (doji or wrong direction). CONFIRMPOLL: held-candidate confirmation poll (oppCandle/bodyDir/body/touchAttr/confirm). UJDTTERMS: per-line hit terms (LHIT = line hit). RETESTBOOK: retest-hit book (hits per line). RETESTDIAG: retest diagnostic (inside/near lines). Alert RETEST: indicator retest print (line + price). SIDE1C_YIELD: holder yields to the contender (holder changed). UJDEFERABORT/APPLY/DROP: deferred LTF-abort set/applies/dropped. LTF_MISALIGN: abort reason, 15m bias against. A6REFUSED: gate refusal record (predicate). STATE: state-machine transition. UJA2NEAR: B-8 trial print (allowance used, prints thruPts). UJALIGN_PASS/NOMATCH: 15m alignment pass/fail. SWINGDUMP: swing bar dump (close/high/low). SWINGPICK: swing pick (close + swing high/low). SLSRC/SL_REF/SLIMB/SLIMBWALK/SLIMBWALKF/SLIMBR: stop-loss source/reference/walk records. SIDE1O_ELIGSTATE: eligibility state (session/divergence/confirm/stop/R). SLNONFIRE/TP_RR_FAIL: no-fire record, reward below 1R (not worth 1R). SIGNAL/ALERT SIGNAL: full entry signal + alert line. A6FIRED: selection fired. UJ1R: R check (entry/sl/tp/R/verdict). UJMEMO_PASS: admission memo pass. MTSNAP/UJADMIT: snapshot/admission books. EXECUTE_ACCT: account/mode line. ABORT CONCURRENCY_LIMIT: refused because a position already open (the guard). SIDE1E_STOPSHADOW/SIDE1X_STOPREF: stop-ladder shadow/reference. SIDE1Q_CQDKILL/SIDE1R_RGATE/SIDE1W_CQDWINDOW: CQD-kill / seed gate / CQD window. TP_ELECT: target election. ORDER/PRE-SEND/deal: broker order/deal lines. ZONESHADOW: zone-shadow R print. LEGTOUCH/UJNOTOUCHCONFIRM: leg-touch / no-touch confirm path (B-7 trial). UJTOUCHSEEN: touch-seen marker. UJPROBE/IDCHANGE/LTFFLIP/LTFDIAG: probe / candidate-identity / LTF-flip / LTF-diagnostic. UJPOISKIP: POI skip (same anchor). TPCENSUS/SLEXT481: target census / extension record. UJPOOLCOV/OBPROV/SWEPTMASK: pool coverage / order-block provision / swept mask. SIDE1D_BOTHDIRS/SIDE1H_WOULDPREEMPT/SUPPRESSED: both-directions / preempt check / held (suppressed) record. EXITVERDICT/MTLIFE/ENTRY_TICKET: exit verdict / position lifecycle / entry ticket. ZONEID/ZONEADOPT: zone identity/adoption. SLADDER/SLADMARK/SLADWIN/SLADCORR/SLEXT1/SLEXT45/STOPRESOLVE/SIDE1Y_PDSESS: stop-ladder family records. XOB-PROMOCENSUS/CQD rows: XOB promotion census / CVD-divergence rows.

## Final disk state
- EA on disk: the B-7 kept build, SHA-256 F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582 (685444 B). Uncommitted by relay order (still `M` in git status).
- EX5 on disk: the B-8 trial build 0D78C1C876326FD76161B5CBF217487534114D2459F95A0DE426BEC0FBD0300A (452482 B). Does NOT match the EA source; any later run must compile first.
- No compile and no tester run this turn (measurement only). No indicator or Include/SRJ touch.

## Carried note (for the planner; operator questions ride in B4 above)
- C2 anchor-block: the two AGENTS.md inserts could not land - the live concise contract (34 lines, Codex headings) has no section 2 and no section 10, proven by two probes (Select-String zero lines + python counts 0/0/0/0). AGENTS.md is untouched (34 lines / 4424 B). The relay anchors fit the retired 872-line OpenCode contract (sections 2/10 at archive lines 42/110/660). Please re-issue C2 with insert points against the live concise headings (or name the archive file if the lane should live there). No other workflow file is affected.

(End of file)
