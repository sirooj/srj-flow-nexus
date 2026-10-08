# BUILDER SLICE B-119 - raw rows and raw code spots (three-reason measurement, MEASURED)

Scope: read-only. No edit, no compile, no run. Runs: kept June JUNE0525-B117 (20261009.log 04:52-04:54 Core 04, EA 137076D9); trial blocks flagged [TRIAL] (gate-independent prints only).

## PART B COUNTS (before/after)

- Operator message = B-119 relay order only: `no new rule words`; appended nothing.
- Strategy verbatim `at that candlestick...` 1->1 (line 198, header line 197 `## Ruling 2026-10-07 (B-70)`); register C same verbatim 1->1 (line 50); journal row 314 1->1. Appended nothing.
- Journal row 13: `13,6/4/26,LDN,TF,Bear,Bull,Bull,??,,D AVP,?,VWAP,...,invalid XOB ...` (4H bear/1H bull/15m bull, D AVP). Journal 1066 lines.

## R1 RAW ROWS (kept June block 04:53)

- `UJPROBE bar_key=2026.06.04 09:05 h4=1.0 h1=-1.0 m15=1.0 ... ltf=-1.0 ...` (seed bars read +1/-1/+1; same at 09:10/09:15/09:20 keys)
- `UJPROBE bar_key=2026.06.04 09:40 h4=1.0 h1=-1.0 m15=1.0 ... ltf=-1.0 ...` (09:45 eval)
- `UJPROBE bar_key=2026.06.04 09:45 h4=1.0 h1=-1.0 m15=-1.0 ... ltf=-1.0 ...` (09:50 eval)
- `UJPROBE bar_key=2026.06.04 09:50 h4=1.0 h1=-1.0 m15=-1.0 ... ltf=-1.0 div=ALIGNED kind=hidden ...` (fire bar)
- `SIDE1T_SEEDBIAS bar=2026.06.04 09:10 dir=SHORT biasAligned=1 verdict=CONSIDER`
- `ANCHOR_ELECT bar=2026.06.04 09:10 action=SEED poi=Daily-POC rank=10 tier=5 dir=SHORT`
- `S1WAIT bar=2026.06.04 09:10/09:15/09:20/09:25 dir=SHORT poi=Daily-POC sess=LONDON - regime unclassified, candidate RETAINED (Stage 3a)`
- `REGIMECENSUS #110 bar=2026.06.04 09:10 dir=SHORT votes=1 trendOk=0 sweepTag=0 mrOk=0 cumMR=0`
- `REGIMECENSUS #117 bar=2026.06.04 09:45 dir=SHORT votes=2 trendOk=1 sweepTag=0 mrOk=0 cumMR=0`
- `SIGNAL ... 2026.06.04 09:55:00 SIGNAL dir=SHORT poi=Daily-POC regime=TREND div=hidden ...` + `MTSNAP ... regime=1`
- `SIDE1R_RGATE evalBar=2026.06.04 09:50 seedBT=2026.06.04 09:10 dir=SHORT seedBiasAl=1 rLive=2.31 livePass=1 slRef=159.920`

## R1 RAW CODE

- EA:2541-2550 ClassifyRegime reads `FL_BUF_HTF_HIGH/MID/LOW`, `want=(dir==LONG)?1:-1`, majority `votes>=2 → trendOk` (EA:2550); sweep-tag mrOk EA:2551-2563; `trendOk&&mrOk→BOTH / trendOk→TREND / mrOk→MEANREV / else NONE` EA:2564-2567.
- EA:2572-2578 CheckLtfAlign reads `FL_BUF_LTF_BIAS` only.
- EA:8485-8490 seed recorder reuses CheckLtfAlign; `s1g_seedBiasAl = ((s1t_alOk=="UNREAD") ? -1 : (s1t_aligned ? 1 : 0))` (EA:8490).
- EA:8680-8685 S1 block: ClassifyRegime per bar; REGIME_NONE → S1WAIT retain; else latch `g_regime = regime` → S2.

## R2 RAW ROWS (kept June block 04:53)

- `2026.06.04 09:30:00 CQD DIV verdict=-2 shift=2 bar=2026.06.04 09:20`
- `2026.06.04 09:45:00 CQD DIV verdict=+1 shift=2 bar=2026.06.04 09:35` + `CQDRECHECK shift=2 passA=1.0 passB=1.0 ... state=S1_REGIME ... divLatch=0 ...`
- `2026.06.04 09:55:00 CQD DIV verdict=-2 shift=2 bar=2026.06.04 09:45` + `CQDRECHECK shift=2 passA=-2.0 passB=-2.0 ... state=S4_ARMED dir=SHORT divLatch=1 ...`
- `SIDE1O_ELIGSTATE bar=2026.06.04 09:50 dir=SHORT sessUsed=0 divLatch=1 cqd=UNREAD confirm=S4_ARMED slRef=159.920 rLive=2.31 livePass=1`
- `SIDE1Q_CQDKILL bar=2026.06.04 09:50 dir=SHORT obValid=1.0 fvgValid=1.0 cqdDiv=UNREAD`
- Comparison UNREADs (kept): 3 Jun `ELIGSTATE bar=2026.06.03 09:05 ... divLatch=1 cqd=UNREAD ... livePass=1`; 11 Jun `ELIGSTATE bar=2026.06.11 14:35 ... divLatch=0 cqd=UNREAD ... livePass=1`; 5NY `ELIGSTATE bar=2026.06.05 16:50 ... divLatch=1 cqd=UNREAD confirm=S3_ZONE_WAIT ... livePass=1`; 27 May `... divLatch=0 cqd=UNREAD ... livePass=1`.
- Matched-verdict existence: 3 Jun `CQD DIV verdict=+2 shift=2 bar=2026.06.03 09:00` (printed 09:10); 2 Jun `CQD DIV verdict=+2 shift=2 bar=2026.06.02 14:20` (printed 14:30); 1 Sep [TRIAL] `CQD DIV verdict=+2 shift=2 bar=2026.09.01 17:30` (printed 17:40, post-fire; eval divLatch=0 UNREAD).

## R2 RAW CODE

- EA:10706-10709: `double s1o_cqd = EMPTY_VALUE; string s1o_cqdS = "UNREAD"; if(ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, s1o_cqd, barShift) && s1o_cqd != EMPTY_VALUE) s1o_cqdS = IntegerToString(...)` — UNREAD = no buffer value at the eval bar.
- EA:10710-10718 ELIGSTATE print (`livePass=(tpOk?1:0)`); EA:10752-10758 RGATE print (same livePass expr) — gate is price-math only.

## R3 RAW ROWS (kept June block 04:53 unless flagged)

- `S3INPLAY bar=2026.06.04 09:45 dir=SHORT inPlay=0 via=none zoneLo=160.001 zoneHi=160.012 barLo=159.850 barHi=159.895 close=159.884 sw1=159.920@5 sw2=159.898@10`
- `INPLAYCOMMIT bar=2026.06.04 09:45 ... zoneSrc=XOB ... promoT=2026.06.04 04:50 applied=1 bounded=1 scanned=97 swings=20 hits=2 firstShift=95 firstVal=160.011 commitVia=SWING legacy=0 legacyVia=none committed=1 changed=1 haveStop=1`
- [TRIAL-use, values gate-independent] 09:50-eval: `S3INPLAY ... 09:50 ... inPlay=1 via=SWINGLEG zoneLo=160.001 zoneHi=160.012 barLo=159.860 barHi=159.886 close=159.868 sw1=159.895@1 sw2=-@-1`; `INPLAYCOMMIT ... promoT=2026.06.04 04:50 ... scanned=98 swings=21 hits=2 firstShift=96 firstVal=160.011 commitVia=SWING legacy=1 legacyVia=SWINGLEG committed=1 changed=0 haveStop=1`
- `UJBARMAP bar=2026.06.04 01:50 o=160.009 h=160.011 l=159.993 c=159.995 ...` (high = firstVal; penetrates 160.001-160.012)
- Payload XOBDIAG_JUNE_TARGETS.csv: `...;1780564200;3052;S;160.01200000;160.00100000;1780537200;1780537500;1780548600;1;1;1;1780537800;NA;160.00650000;...` (header `srcFile;barT;objId;dir;hi;lo;startT;createT;promoT;valid;active;promoted;validationT;invalidationT;...`): obj 3052 S hi 160.012 lo 160.001, startT 01:40, createT 01:45, promoT 04:50, valid/active/promoted=1. Same object at 09:55 bar row (barT 1780566900).
- In-play comparison rows: 3 Jun `S3INPLAY bar=2026.06.03 09:00 ... inPlay=1 via=BAR zoneLo=159.906 zoneHi=159.913 barLo=159.905 barHi=159.927 ...`; 11 Jun `S3INPLAY bar=2026.06.11 14:35 ... inPlay=1 via=SWINGLEG zoneLo=160.489 zoneHi=160.504 barLo=160.513 barHi=160.528 ... sw1=160.507@1 ...`; 2 Jun `S3INPLAY bar=2026.06.02 14:30..14:55 ... inPlay=0 via=none zoneLo=159.679 zoneHi=159.694 ...` (all six prints); 5LDN `S3INPLAY bar=2026.06.05 09:15 ... inPlay=0 via=none zoneLo=159.878 zoneHi=159.916 ...`; 5NY `S3INPLAY bar=2026.06.05 16:45 ... inPlay=0 ...` + `bar=2026.06.05 16:50 ... inPlay=0 via=none zoneLo=159.881 zoneHi=159.916 barLo=160.084 barHi=160.141 ...` + 16:55 pass `S3 waiting: no qualifying zone` + `STATE S3_ZONE_WAIT->S5_GATE_CHECK` (PREBIND fire); A1 [TRIAL] `S3INPLAY bar=2026.08.28 10:00 ... inPlay=0 via=none zoneLo=1.16492 zoneHi=1.16507 ...` + 10:05 pass `S3 waiting: no qualifying zone` + `STATE S3_ZONE_WAIT->S5_GATE_CHECK` + `CONFIRM_PREBIND bar=2026.08.28 10:00 ...` (prebind fire); A2 [TRIAL] `S3INPLAY bar=2026.09.01 17:30 ... inPlay=1 via=BAR zoneLo=1.15975 zoneHi=1.16013 ...`; A6 [TRIAL] `bar=2026.09.08 10:05 ... inPlay=1 via=SWINGLEG zoneLo=1.16362 zoneHi=1.16377 ...`; A7 [TRIAL] `bar=2026.09.08 16:55 ... inPlay=1 via=SWINGLEG ...` (same zone); A4 [TRIAL] `bar=2026.09.07 09:00 ... inPlay=1 via=BAR zoneLo=1.16098 zoneHi=1.16109 ...`; A5 [TRIAL] `bar=2026.09.07 16:15 ... inPlay=1 via=BAR zoneLo=1.16229 zoneHi=1.16253 ...`; A3 [TRIAL] `bar=2026.09.04 15:30/15:40/15:45 ... inPlay=1 via=BAR ...` (15:55 row absent).

## R3 RAW CODE (structural leg bound)

- EA:9208-9213: SL-LEG bound comment (every confirmed protective-side swing back to the stop-reference swing chosen by ComputeSlReference/SlRefMemo; stop swing tested, ends walk; promotion-time bound = fail-safe per council Part 1.1).
- EA:9221-9223 `SlRefMemo(barShift, barTime, g_dir, s3_slRef, s3_slMode, "S3ARM")`; EA:9233 `if(s3_haveStop)` gates the walk.
- EA:9241-9242 buffer/limit; EA:9244-9277 walk (`for(t133_s=barShift; ...<=t133_limit...)`: EA:9248 `if(!s3_haveStop && t133_bt < t133_bound) break;` — time bound ONLY without stop; EA:9270-9275 containment test; EA:9276 `if(s3_haveStop && (... (t133_v <= s3_slRef) : (t133_v >= s3_slRef))) break;` — stop terminator); EA:9279 `if(t133_hits > 0) t133_inPlay = true;`; EA:9282 `s31_inPlay = t133_inPlay;`.

## R4 ROW INVENTORY (machine rows on disk)

- June kept block: UJPROBE every bar (2J 14:20 +1/+1/-1; 3J 09:00/09:05 +1/-1/+1 ltf +1, 09:05 div ALIGNED-hidden; 5LDN 09:25/09:35/09:40 +1/-1/-1; 5NY 16:00/16:10/16:50 +1/+1/+1; 10J 15:30 +1/+1/-1 ltf -1; 11J 14:20 +1/+1/-1); SIGNAL all TREND (5-27 LONG, 3J LONG, 4J SHORT, 5NY LONG, 11J LONG regime=TREND div=regular); refusals (2J LTF-aborts + FRESHSKIPs; 5LDN S2 kills 09:30/09:40; 10J birth-refusal; 5NY 16:05 S2SEEDBIAS_KILL + ABORT SEEDBIAS_REFUSED; 06-05 09:15 SHORT ELIGSTATE livePass=1 S3-wait no-fire).
- EU trial block [TRIAL]: UJPROBE per bar (A-confirm majorities in R1 table; C cases: 1S15:25/15:30 -1/-1/-1; 4S10:35/10:40 +1/-1/+1; 8S16:40/16:45 -1/-1/+1; 28A16:20/16:25 -1/-1/+1); ELIGSTATE all cqd=UNREAD (A1 10:00 latch=0 pass=1; A2 17:30 latch=0 pass=1; 1S15:25 latch=0 pass=1 no-fire; 28A16:20 latch=0 pass=0; 8S16:40 latch=0 pass=0; 09-01 09:50 LONG latch=0 pass=1 no-fire); SIGNAL all TREND (A1-A7); no deals beyond the 7 takes.
- ABSENT/UNKNOWN: 27 Aug confirmation (no candle identified); 4S10:40/1S15:30/28A16:25/8S16:45 confirmation-candle CQD/S3 rows (not extracted; S5 evals cited where present); A3 15:55 + 11J 14:35 S3 rows (absent; nearest measured cited); A2 latch bar (no LONG census 17:15-17:35; seed bars trendOk=0).
- Journal map: 301=9/1NY VALID 17:35; 302=8/27NY INVALID 17:05; 303=9/1LDN INVALID 09:45; 304=9/1LDN EA-ONLY 09:55 INVALID; 306=6/5NY VALID 16:15; 307/308=6/5LDN chart calls; 310=6/2 INVALID; 311=6/10 INVALID; 312=9/4NY target; 313=9/8NY target; 314=6/4 NOT-HIS-TAKE; 13=6/4 LDN session read. No journal rows found for 1S15:30 / 28A16:25 / 8S16:45 / 3JUN: UNKNOWN.

## RECORD LINES (exact)

- X1 context §4 append: `- B119-4JUN-THREE-REASONS (planner lesson 2026-10-09): when a narrow block holds its bar but the same candidate fires a bar later, measure each of his separate reasons on the machine's own rows across the whole register before drafting another edit; B-118 blocked one in-play read and the fire re-armed on the next.`
- X2 context §5 append: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-119; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).`
- X3 handoff §3 append: `- B-119: measured his three 4 June reasons (bias, CQD, XOB in play) on the machine's rows across the full register; no source edit or run.`
- X4 ledger `1264.` (tag `B119-4JUN-THREE-REASONS`; R0-R5; provenance per row; no rule invention).
- X5 pointer (cap 35): latest B-119 MEASURED; R1/R2/R3 DO NOT SEPARATE; no buildable candidate; kept EA/EX5 on disk; 5JUN-1615 open; goal open.
- Pre-commit re-check: X1/X2/X3/X4 counts 1; `^1263.` = 1; staged set = 6 relay files only; no source/EX5/journal/log/settings diff.

(End of slice)
