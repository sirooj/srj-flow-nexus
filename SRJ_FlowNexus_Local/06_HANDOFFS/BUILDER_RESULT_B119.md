# BUILDER RESULT B-119 - his three 4 June reasons on the machine's own rows, MEASURED

Trader summary: I measured each of your three 4 June reasons against what the machine itself printed, then checked each one across every audited trade. None of the three separates your valid takes from the 4 June short on its own. (1) Direction bias: at the 09:10 seed your read and the machine's 4H/1H/15m disagree candle-by-candle but agree on the majority — both say bullish, no short — yet the machine kept the seed on its 5-minute read and latched trend later when its 15m flipped bearish at 09:50. Worse, your valid 1 September long fired with the machine's majority bearish the whole way. (2) CQD: a bearish -2 was computed twice before the 09:55 fire and latched, but the eligibility check reads a different buffer that was empty at that bar, so it printed UNREAD and passed on price math alone — and it prints UNREAD on your valid takes too, including the 3 June and 11 June ones. (3) XOB in play: the zone was read not-in-play at 09:45 and in-play at 09:50 off a 01:50 swing high, before the zone's own 04:50 promotion. And your valid 28 August short plus the machine's 5 June 16:55 long both fired with the same not-in-play read. Nothing was edited, compiled or run. The next edit needs a different shape than another arming block.

## Relay order (B-119, read-only three-reason measurement)

- Part 0 fresh start on builder/B-118 at 6a057a1b2a800af982c59fdaa047d08a7d4076f9, both skills loaded whole first (relay skill 73 lines; strategy skill 69755 B identical-bytes, trading rules read by grep: B-70 veto lines 197-199, FRESH-SWEEP line 82, RETRACE-IS-IN-PLAY lines 202-203, 5M-FLIP-KILL line 116, B-61 line 174, RETEST-DIES-BY-BODY-CLOSE-ONLY line 187).
- Part B banking (no new rule words; banked 4 June words confirmed once in all three sources). Part R read-only measurement (R0 provenance; R1 bias; R2 CQD; R3 in-play; R4 whole-register grade; R5 buildability). Part X records (ledger 1264). Part F file + push builder/B-119 via backup.
- Verdict MEASURED. No source edit, no compile, no tester run, no new rule/tolerance/buffer/number, no B-104..B-115 reopen, no 5m-flip or retest-death re-decision, no question to him (every search below returned rows).

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first; strategy skill loaded whole second (trading rules read in this relay as ordered).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-118` = `6a057a1b2a800af982c59fdaa047d08a7d4076f9` (verified exact). Cut `builder/B-119` at it (log -1 = 6a057a1). Push via `backup`, never `origin`.
- 0.3 Read on builder/B-118 in order: pointer (20 lines, B-118 RESTORED state); RESULT_B118 whole (authored prior turn, committed bytes verified identical — the six-file diff below is EMPTY); SLICE_B118 whole (same; its "4 JUNE ROWS" section is this relay's base); PLANNER_CONTEXT whole (151 lines, B-118 lesson at line 121); PLANNER_HANDOFF whole (91 lines, B-118 line 85); spec v4.2 whole (396 lines, 35807 B identical-bytes; cited: 1.2 relevance = promoted to XOB; 3.2 regime majority/sweep; 3.3 LTF live; 3.4 2-of-3 pre-confirmation; 3.5 in-play no-recency + 80-bar precedent; 3.5.1 relevance-before-retracement + promotion-export honesty limit; 3.6 XOB touch optional; 3.8 divergence-at-least-once; 8 status table; 9.1 feed divergence; 9.9 age; 9.10 two-swing binding constraint + three copies; 9.11 no ruling on depth; 10 permission vocabulary); register whole (65 lines, hash 9E0C6295, disk = HEAD: A rows 1-7, B rows 1-3 + corrections, C rows incl. 4 June line 50 with the verbatim B-70 confirmation); journal grep-only (1066 lines; rows 13 + 314 for 4 June; per-trade rows 277/279/281/301/302/303/304/306/307/308/310/311/312/313 mapped below, UNKNOWN where absent); B117 result + slice LOCATED on disk (both present, kept-build June provenance); latest kept-build RECON62 record: no post-kept RECON62 run exists on the kept EX5 — the reference is the register A takes + the B-118 trial RECON62 block (deals identical to register; trial rows used below ONLY for gate-independent prints per R0, flagged).
- 0.4 Names per relay: B-119; tag B119-4JUN-THREE-REASONS; ledger 1264 (1263 beside); result/slice B119; kept EA 137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671 / EX5 FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5; indicator 956BF3E3ADB7 / EX5 27B5F272DCFA; B-118 trial src 097C7B84 / EX5 979DFE6F (on disk as .B1184JUN, never staged); day log Tester/logs/20261009.log (kept June block 04:53 + B118 June block 05:15 + RECON62 blocks, Core 04); kit PK-1.
- 0.5 Start gate: `git log -1` = `6a057a1 B-118 narrow 4 June suppression trial (relay B-118); verdict RESTORED`. `git status --short` = 454 lines (pre-existing transition-work modifications + untracked artifacts, preserved untouched, none staged). `git diff 6a057a1b2a800af982c59fdaa047d08a7d4076f9 --` the six B-118 staged files EMPTY. Disk SHA prefixes (LF-normalize before mismatch; all LF-clean, all PASS): EA 137076D9CF85, EX5 FA4C924978F6, indicator 956BF3E3ADB7, indicator EX5 27B5F272DCFA. Ledger result-against-commit (B-85 lesson): `^1263.` = 1 and `B118-4JUN-SHORT-FALSE-FIRE` = 1, both in the committed file. No STOP.
- 0.6 Scope: read-only. Allowed reads only (source by text, journal/day-log/payload greps, text records). Forbidden list observed in full.

## Part B - banking

- B1 The current operator message carries no new trading-rule words. Record `no new rule words`; appended nothing.
- B2 His banked 4 June words confirmed present once, verbatim, in all three sources (counts: strategy skill 1, register 1, journal 1; appended nothing): strategy skill `## Ruling 2026-10-07 (B-70)` line 197 with the verbatim line 198 `"at that candlestick there is not yet a valid bias for short, it is an invalid CQD divergence, and there is no retest of XOB in play."` + paraphrase line 199 (0604-LDN-NOT-HIS, reasons listed separately, same class as 0602-NY-NO-SETUP s185, row-13 'invalid XOB' = no setup s178, register C, ledger 1215); register section C 4 June line 50 (same verbatim + row-13 4H-bear/1H-bull/15m-bull note + machine-side UNREAD/no-XOB-check notes); journal row 314 (NOT HIS TAKE 09:55 SHORT 159.868 + verbatim + row-13 pointer). Journal row 13: 6/4 LDN, 4H Bear, 1H Bull, 15m Bull, D AVP, 'invalid XOB' note.

## Part R - reading (every row names its run)

- R0 Provenance. Kept-build 4 June rows: Tester/logs/20261009.log, kept June block clock 04:52-04:54, Core 04, EA 137076D9CF85 / EX5 FA4C924978F6 (JUNE0525-B117 run). B118 trial June rows (clock 05:14-05:16, src 097C7B84): used ONLY for the B-118 gate-behavior rows already filed in SLICE_B118 (S3-waiting/PREBIND prints at/after the arming line); every other B118-block row cited here is a gate-independent print (UJPROBE, CQD verdict, CONFIRMPOLL, ELIGSTATE, S3INPLAY/INPLAYCOMMIT values — computed identically before the gate branch), flagged [TRIAL] where used. EU rows: RECON62 trial block clock 05:06-05:08, Core 04, same flag; S3-state transitions from trial rows are ACCOUNTED (excluded) — only printed verdict values are used. Older-build rows: none cited (all comparisons are kept-block or flagged trial prints). No row below is re-decided; unknowns are marked UNKNOWN/ABSENT, never filled.

- R1 Reason 1, "not yet a valid bias for short" (HTF majority + regime only; 5m rules untouched).
  - His side: journal row 13 = 4H bear, 1H bull, 15m bull, bias bullish. Majority bullish: no short bias. Spec 3.2: trend needs retest direction + HTF simple majority; mean-reversion needs a FRESH same-session sweep of the prior session's liquidity (strategy FRESH-SWEEP line 82).
  - Machine side, kept 4 June rows (UJPROBE h4/h1/m15/ltf): 09:10 seed bars: h4=+1.0, h1=-1.0, m15=+1.0, ltf=-1.0 → majority bullish (2/3) vs SHORT: trend-DISAGREE at seed. 09:40-bar eval: +1/-1/+1 → bullish → DISAGREE. 09:45-bar eval: +1/-1/-1 → bearish → AGREE. Fire bar 09:50: +1/-1/-1, ltf=-1.0 → bearish → AGREE. Per-read vs his row 13 at seed: 4H DIFFERENT (machine bull vs his bear), 1H DIFFERENT (machine bear vs his bull), 15m SAME (bull); majority SAME (bullish → no short bias on both sides at the seed). At the fire bars the majorities diverge (his row is session-level; machine flips bearish on the 15m). Spec §9.1 bounds the per-timeframe split (his TradingView/OANDA vs Dukascopy demo feed; no edit can close feed divergence).
  - Seed bias: `SIDE1T_SEEDBIAS bar=2026.06.04 09:10 dir=SHORT biasAligned=1 verdict=CONSIDER` — yet HTF majority at seed is bullish. Code (EA:8485-8490): seedBiasAl comes from `CheckLtfAlign` (EA:2572-2578: LTF-bias buffer vs direction), NOT the HTF majority. So the seed advanced on the LTF read (ltf=-1.0 agrees SHORT) while the HTF majority disagreed.
  - Regime: S1WAIT retained the candidate 09:10-09:25 (`S1WAIT ... regime unclassified, candidate RETAINED`; REGIMECENSUS 09:10 SHORT votes=1 trendOk=0 sweepTag=0 mrOk=0). Code (EA:8680-8685): REGIME_NONE retains; first classified bar latches g_regime. By 09:45: votes=2 trendOk=1 → REGIME_TREND latched (sweepTag=0 throughout → mean-reversion never involved; no swept level, no sweep candle, same-session question does not arise — regime is TREND-only). SIGNAL confirms `regime=TREND` at 09:55.
  - Plain words: at the seed candle both sides agree there is no short bias by majority, but the machine's seed check doesn't test the majority — it tests the 5-minute read — so the seed lived; by the fire bars the machine's 15m had flipped bearish and its majority agreed with the short while his session read stayed bullish.

- R2 Reason 2, "invalid CQD divergence" (P-CQDRESTORE governs; per-anchor flag-gate never judged, PLANNER_CONTEXT B-74).
  - Kept 4 June rows: 09:30 pass `CQD DIV verdict=-2 shift=2 bar=2026.06.04 09:20`; 09:45 pass `verdict=+1 shift=2 bar=2026.06.04 09:35` (bullish); 09:55 pass `verdict=-2 shift=2 bar=2026.06.04 09:45` + `CQDRECHECK passA=-2.0 passB=-2.0 ... state=S4_ARMED dir=SHORT divLatch=1`; UJPROBE at fire `div=ALIGNED kind=hidden latestNZ=-2`. ELIGSTATE at fire: `bar=2026.06.04 09:50 dir=SHORT sessUsed=0 divLatch=1 cqd=UNREAD confirm=S4_ARMED slRef=159.920 rLive=2.31 livePass=1`. CQDKILL: `cqdDiv=UNREAD` (obValid=1.0 fvgValid=1.0).
  - Code that reads UNREAD (EA:10706-10709): `s1o_cqdS = "UNREAD"` default; only replaced when `ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, s1o_cqd, barShift)` succeeds AND != EMPTY_VALUE. Code that sets livePass=1 (EA:10718/10758): `(tpOk ? 1 : 0)` — pure price-math gate, CQD never consulted.
  - UNREAD in plain words (from code only): the divergence-verdict buffer had no value at the evaluation bar (read failed or EMPTY) — i.e. no divergence read at that bar, not "read but unmatched". The shift-2 walk found -2 one bar back and divLatch=1, but the gate never looks at either.
  - Direction-matched (bearish) divergence before 09:55: FOUND (-2 at the 09:20 bar, -2 at the 09:45 bar, ALIGNED-hidden at fire, divLatch=1) — computed and latched, unread at eligibility. Spec 3.8 needs a qualifying direction-matched divergence at least once with no partial credit; whether -2 qualifies as his divergence is his rule to judge, never inferred here.

- R3 Reason 3, "no retest of XOB in play" (spec 1.2 relevance=promoted; 3.5 leg-wide penetration, no recency/bar-count limit, 80-bar precedent; 3.5.1 relevance→retracement→confirmation; RETRACE-IS-IN-PLAY one condition).
  - Kept 09:45-eval: `S3INPLAY bar=2026.06.04 09:45 dir=SHORT inPlay=0 via=none zoneLo=160.001 zoneHi=160.012 barLo=159.850 barHi=159.895 close=159.884 sw1=159.920@5 sw2=159.898@10`; `INPLAYCOMMIT ... zoneSrc=XOB promoT=2026.06.04 04:50 applied=1 bounded=1 scanned=97 swings=20 hits=2 firstShift=95 firstVal=160.011 commitVia=SWING legacy=0 legacyVia=none committed=1 changed=1 haveStop=1`. B118 09:50-eval: `S3INPLAY inPlay=1 via=SWINGLEG` (bar 159.860-159.886) + `INPLAYCOMMIT legacy=1 legacyVia=SWINGLEG committed=1 changed=0 scanned=98 swings=21 hits=2 firstShift=96 firstVal=160.011`.
  - (a) Shift-96 swing candle: 96 M5 steps = 480 min before the 09:50 eval bar = 01:50; verified on the machine's own bar map: `UJBARMAP bar=2026.06.04 01:50 o=160.009 h=160.011 l=159.993 c=159.995` — high 160.011 = firstVal, penetrating zone 160.001-160.012.
  - (b) XOB 160.001-160.012 = payload object id 3052 dir=S (XOBDIAG_JUNE_TARGETS.csv, INC runPass 2): startT=1780537200 (01:40), createT=1780537500 (01:45), promoT=1780548600 (04:50), valid=1/active=1/promoted=1; machine INPLAYCOMMIT promoT=2026.06.04 04:50 agrees. (Spec 8 honesty limit notes no export records promotion; buffer 33 does carry it — measured, both cited.)
  - (c) The 01:50 witness comes AFTER formation (01:40/01:45) and BEFORE promotion (04:50).
  - (d) Structural leg used for SWINGLEG (code): the SL LEG — walk every confirmed protective-side swing from the eval bar back to the stop-reference swing, which is tested and ends the walk (EA:9208-9213 bound comment; EA:9241-9242 buffer/limit; EA:9244-9277 walk incl. EA:9248 `if(!s3_haveStop && t133_bt < t133_bound) break;` — the promotion-time bound applies ONLY without a stop reference; here haveStop=1 so no time bound ran; EA:9276 stop-swing terminator; EA:9279 hits→inPlay). Start candle = eval bar 09:50; end candle = stop-swing bar. Raw text in the slice.
  - (e) Bar/session penetration on machine rows: 09:45 bar range (159.850-159.895) and 09:50 bar range (159.860-159.886) never overlap 160.001-160.012; morning bars sit lower still (09:10 bar 159.866-159.888 per B105). No bar-range penetration anywhere on 4 June before 09:50; the sole witness is the 01:50 swing high (pre-London Asian session). The S3 ladder evaluated this zone exactly once pre-fire (09:45: inPlay=0).
  - No new rule drawn; B-118's lesson stands (blocking the inPlay=0 arming rerouted to the next bar's inPlay=1).

- R4 Whole-register grade (machine read at confirmation; his verdict; journal row; run). Trial-block rows flagged [TRIAL] (gate-independent prints only).
  - R1 table (HTF-majority agreement with trade direction at confirmation):

| date/sess/dir | his verdict (journal) | machine majority at confirm | read | run |
|---|---|---|---|---|
| 28 Aug LDN SHORT | VALID-taken (report) | 10:00: -1/-1/-1 bearish | AGREE | RECON62 [TRIAL] 05:06 |
| 1 Sep NY LONG | VALID-taken (301) | 17:30: -1/-1/+1 bearish | DISAGREE | RECON62 [TRIAL] |
| 4 Sep NY LONG | VALID (312; his mean-rev) | 15:55: +1/-1/+1 bullish | AGREE | RECON62 [TRIAL] |
| 7 Sep LDN LONG | VALID-taken (report) | 09:15: +1/+1/+1 bullish | AGREE | RECON62 [TRIAL] |
| 7 Sep NY LONG | VALID (report) | 16:40: +1/+1/+1 bullish | AGREE | RECON62 [TRIAL] |
| 8 Sep LDN SHORT | VALID (report) | 10:05: +1/-1/-1 bearish | AGREE | RECON62 [TRIAL] |
| 8 Sep NY SHORT | VALID (313) | 16:55: -1/-1/+1 bearish | AGREE | RECON62 [TRIAL] |
| 5 Jun LDN SHORT | NOT VALID (307/308) | 09:35/09:40: +1/-1/-1 bearish | AGREE | June kept 04:53 |
| 5 Jun NY LONG | VALID 16:15 (306) | his 16:10: +1/+1/+1; mach 16:50: +1/+1/+1 | AGREE/AGREE | June kept |
| 11 Jun NY LONG | owed/VALID (register B3) | 14:20: +1/+1/-1 bullish (14:35 row absent) | AGREE | June kept |
| 4 Sep 10:40 SHORT | INVALID tester fire | 10:35/10:40: +1/-1/+1 bullish | DISAGREE | RECON62 [TRIAL] |
| 1 Sep 15:30 | tester-only, NOT his (no journal row: UNKNOWN) | 15:25/15:30: -1/-1/-1 bearish | AGREE (dir SHORT per ELIGSTATE) | RECON62 [TRIAL] |
| 27 Aug | INVALID entry (302) | no confirmation identified | UNKNOWN | — |
| 28 Aug 16:25 | E6-only, declined (no journal row: UNKNOWN) | 16:20/16:25: -1/-1/+1 bearish | AGREE (dir SHORT per ELIGSTATE) | RECON62 [TRIAL] |
| 8 Sep 16:45 | declined (no journal row: UNKNOWN) | 16:40/16:45: -1/-1/+1 bearish | AGREE (dir SHORT per ELIGSTATE) | RECON62 [TRIAL] |
| 3 Jun LDN LONG | VALID-taken | 09:05: +1/-1/+1 bullish | AGREE | June kept |
| 5 Jun LDN | (same row as B, above) | — | — | — |
| 2 Jun NY LONG | ruled out (310) | 14:20: +1/+1/-1 bullish | AGREE | June kept |
| 10 Jun NY LONG | INVALID (311) | 15:30: +1/+1/-1 bullish | AGREE | June kept |
| 4 Jun LDN SHORT | ruled out (13/314) | seed: bullish DISAGREE; fire bars: bearish AGREE | MIXED | June kept |

  - R1 line: DOES NOT SEPARATE. Breakers: (i) valid 1 Sep LONG reads DISAGREE at confirmation (machine majority bearish 16:00→17:30 persistent, yet regime=TREND fired); (ii) 4 June reads AGREE at the fire bars; (iii) 5LDN/2JUN/10JUN read AGREE yet stayed correctly silent by other gates.
  - R2 table (direction-matched divergence before/at confirmation; machine CQD rows):

| row | his | machine divergence rows | run |
|---|---|---|---|
| 28 Aug SHORT | VALID | divLatch=0, cqd=UNREAD at 10:00 eval; nearest verdict rows not extracted: UNKNOWN | [TRIAL] |
| 1 Sep LONG | VALID | verdict +2 at 17:30 bar (printed post-fire 17:40); divLatch=0, cqd=UNREAD at 17:30 eval | [TRIAL] |
| 4 Sep LONG | VALID | not extracted: UNKNOWN | — |
| 7 Sep LDN/NY LONGs | VALID | not extracted: UNKNOWN | — |
| 8 Sep SHORTs | VALID | not extracted: UNKNOWN | — |
| 5 Jun LDN SHORT | NOT VALID | not extracted: UNKNOWN | — |
| 5 Jun NY LONG | VALID 16:15 | 16:50 eval div=ALIGNED regular, divLatch=1, cqd=UNREAD | kept |
| 11 Jun LONG | VALID | 14:35 eval divLatch=0, cqd=UNREAD | kept |
| 4 Sep 10:40 / 1 Sep 15:30 / 27 Aug / 28 Aug 16:25 / 8 Sep 16:45 | ruled-out/tester | not extracted: UNKNOWN (no S5 evals except 1S15:25 divLatch=0 UNREAD, 28A16:20 divLatch=0 UNREAD, 8S16:40 divLatch=0 UNREAD) | [TRIAL] |
| 3 Jun LONG | VALID | verdict +2 at 09:00 bar; divLatch=1; cqd=UNREAD at 09:05 eval | kept |
| 2 Jun LONG | ruled out | verdict +2 at 14:20 bar (direction-matched, silent) | kept |
| 10 Jun LONG | INVALID | not extracted: UNKNOWN | — |
| 4 Jun SHORT | ruled out | verdict -2 (09:20 bar) + -2 (09:45 bar), ALIGNED-hidden, divLatch=1; cqd=UNREAD at eligibility | kept |

  - R2 line: DOES NOT SEPARATE. cqd-at-eligibility is UNREAD on valid takes (3 Jun, 11 Jun, 1 Sep, every EU eval incl. 09-01 09:50/15:25 livePass=1-no-fire rows) and on the 4 June fire alike; divLatch=1 on 3 Jun-valid AND 4 Jun-fire; direction-matched verdict rows exist on both sides (3 Jun +2, 2 Jun +2-silent, 4 Jun -2, 1 Sep +2-post-fire).
  - R3 table (in-play term at confirmation/arming; machine S3INPLAY/INPLAYCOMMIT):

| row | his | machine in-play | run |
|---|---|---|---|
| 28 Aug SHORT | VALID | arming-bar 10:00 eval inPlay=0; fired via CONFIRM_PREBIND S3→S5 (kept would commit-arm) | [TRIAL] |
| 1 Sep LONG | VALID | 17:30 inPlay=1 BAR | [TRIAL] |
| 4 Sep LONG | VALID | 15:30/15:40/15:45 inPlay=1 BAR (15:55 row absent) | [TRIAL] |
| 7 Sep LDN LONG | VALID | 09:00 inPlay=1 BAR | [TRIAL] |
| 7 Sep NY LONG | VALID | 16:15 inPlay=1 BAR | [TRIAL] |
| 8 Sep LDN SHORT | VALID | 10:05 inPlay=1 SWINGLEG (distant zone 1.16362-1.16377) | [TRIAL] |
| 8 Sep NY SHORT | VALID | 16:55 inPlay=1 SWINGLEG (same distant zone) | [TRIAL] |
| 5 Jun LDN SHORT | NOT VALID | 09:15-eval inPlay=0 (zone 159.878-159.916 vs bar 159.954-159.964) | kept |
| 5 Jun NY LONG | VALID 16:15 | machine path 16:45-eval inPlay=0 AND 16:50-eval inPlay=0; 16:55 fire via PREBIND S3→S5 (ELIGSTATE 16:50 divLatch=1 cqd=UNREAD livePass=1) | kept |
| 11 Jun LONG | VALID | 14:35 inPlay=1 SWINGLEG (zone 160.489-160.504) | kept |
| C rows (4S10:40/1S15:30/27A/28A16:25/8S16:45) | ruled-out/tester | no S3 evaluations extracted (livePass=0/1 S5 evals only): UNKNOWN for the term | — |
| 3 Jun LONG | VALID | 09:00 inPlay=1 BAR (zone 159.906-159.913 = bar overlap) | kept |
| 2 Jun LONG | ruled out | 14:30-14:55 inPlay=0 throughout (zone 159.679-159.694) | kept |
| 10 Jun LONG | INVALID | no S3 evaluation (seed refused at birth): term never evaluated | kept |
| 4 Jun SHORT | ruled out | 09:45-eval inPlay=0; 09:50-eval inPlay=1 SWINGLEG (01:50 witness, pre-promotion) | kept |

  - R3 line: DOES NOT SEPARATE. Breakers: (i) valid 28 Aug SHORT arms/fires with arming-bar inPlay=0 (prebind path on both builds — the B-118 gate demonstrably reroutes it, RECON62-B118 entry unchanged); (ii) the valid 5 Jun path's machine fire reads inPlay=0 at both evals and prebinds; (iii) 4 June itself flips 0→1 across one bar on one zone.
  - B-79 refusal census (kept builds, terms reading differently where the machine refused): June kept — 2 Jun S3 aborts (FRESHSKIP PRE_BINDING + UJDEFERAPPLY/LTF_MISALIGN 10:00/10:40, FRESH_OB_DEAD 17:40 per B-117); 5LDN S2 kills (SEEDBIAS 09:25/09:35 refused, KILL+ABORT 09:30/09:40); 10 Jun birth-refusal (LTF vs LONG at 15:30); 5NY 16:00 S2SEEDBIAS_KILL + ABORT SEEDBIAS_REFUSED 16:05 (seedBiasAl=0, rule-correct per strategy line 116); 06-05 09:15 SHORT ELIGSTATE livePass=1 confirm=S3_ZONE_WAIT no-fire. EU (flagged trial prints) — livePass=1 no-fire evals (09-01 09:50 LONG rLive=1.81; 09-01 15:25 SHORT rLive=1.19) and livePass=0 evals (08-28 16:20, 09-01 09:10, 09-02/09-04 rows). Never picked as his rule.
- R5 Buildability. No reason SEPARATES, so no gate candidate exists; nothing is drafted. Readability notes for the record (code only): R1 — ClassifyRegime reads FL_BUF_HTF_HIGH/MID/LOW at runtime (EA:2542-2544) but ONLY in S1 (EA:8680-8685); the S5/R-gate decision bar never re-reads the majority (RGATE links seedBiasAl + rLive only, EA:10752) — a confirmation-bar majority gate has no runtime read today. R2 — the CQD verdict buffer IS runtime-readable on the decision bar (EA:10708/10736) and divLatch is live, but the live gate ignores both (EA:10718/10758 tpOk-only). R3 — the s31 ladder IS runtime-read on the eval bar (zone/swing ReadFlow, EA:8885-8957) and the prebind path (EA:9391) bypasses every in-play read by construction.

## Part X - records (grep-first, each appended once)

- X1 PLANNER_CONTEXT.md section 4, grep `B119-4JUN-THREE-REASONS` = 0 → append `- B119-4JUN-THREE-REASONS (planner lesson 2026-10-09): when a narrow block holds its bar but the same candidate fires a bar later, measure each of his separate reasons on the machine's own rows across the whole register before drafting another edit; B-118 blocked one in-play read and the fire re-armed on the next.` (verify 1).
- X2 PLANNER_CONTEXT.md section 5, grep `relay B-119` = 0 → append `- 2026-10-09: planner session ran as ClickUp Brain for relay B-119; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).` (verify 1).
- X3 PLANNER_HANDOFF.md section 3, grep `B-119` = 0 → append `- B-119: measured his three 4 June reasons (bias, CQD, XOB in play) on the machine's rows across the full register; no source edit or run.` (verify 1).
- X4 Ledger, grep `B119-4JUN-THREE-REASONS` = 0 and `^1264.` = 0 → append item 1264 (R0-R5 outcomes, provenance per row, no rule invention; verify both 1, `^1263.` = 1 beside).
- X5 Pointer (35-line cap): latest result B-119 MEASURED; R1/R2/R3 all DO NOT SEPARATE (breakers named); no buildable gate candidate; kept EA/EX5 unchanged on disk; 5 June 16:15-versus-16:55 still open; project goal open.

## Part F - file, push, reply

- F1 this result. F2 slice BUILDER_SLICE_B119.md (raw rows + raw code spots; under 600 lines). F3 ledger 1264. F4 pointer. F5 stages only result, slice, ledger, pointer, PLANNER_CONTEXT.md, PLANNER_HANDOFF.md (never EA/includes/indicator/ex5/journals/logs/inis/backups). F6 commit + push via backup + ls-remote check. Reply MEASURED.

## Final disk state (MEASURED turn; kept RKD build on disk, verified)

- EA 137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671 (695359 B, LF-only) + `.preB118`/`.B1184JUN` copies kept uncommitted. EX5 FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5. Indicator src/ex5 at gate SHAs, untouched. No compile, no launch, no tester run, no terminal/config/chart modification. Strategy skill, journal CSV (1066 lines), register, spec untouched (read-only; greps only). Launch scripts, STATUS/DONE, watcher artifacts unstaged. No edit stands beyond the relay's text records.

(No carried note: every record-first search returned rows; nothing needs his eyes.)
