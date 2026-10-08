# BUILDER SLICE B-120 - raw rows, raw code (regime at retest, MEASURED)

Scope: read-only. Runs: kept June 04:52-04:54 Core 04 EA 137076D9; RECON62 [TRIAL] 05:06-05:08 (S1/S2 prints only, pre-gate).

## PART B (counts + correction record)

- Operator message: relay order + process correction (HTF-engine assumption mistaken; prior research cited) + 1-Sep-++ assertion. `no new rule words`; appended nothing.
- Banked 4 June words: skill 1 (line 198, header 197), register 1 (line 50), journal row 314 1. Nothing appended.
- FIX-NOT-REPLACE (skill line 93, his order 2026-09-26, verbatim): "I said the HTF engine of the SRJ Flow Logic is sometimes not accurate that means i want you to fix it to be more accurate and robust, NOT replacing it."
- ENGINE-REFINE-KEEPS-VALID-TAKES (line 92, his words 2026-09-26, verbatim): "the reinforment of the HTF engine of the SRJ Flow Logic won't change the 7 valid trades on EU IF DONE RIGHT. the rule of the trend following setups is the same."
- 15M-READS (line 141): his 15m reads agree his valids (1 Sep NY 17:35 LONG bullish; 7 Sep LDN 09:20 LONG bullish; 8 Sep LDN 10:10 SHORT bearish); "the EA's against-trade 15m reads at those bars (B-16 D1) are read errors (FIX-NOT-REPLACE ...)". CQD-WORKED-BEFORE line 140; A-Q1 line 144 (7-take build reference).
- 1-Sep-++ record state: row 301 full line has NO "++" (verified by match); skill "++" only lines 27/79 (9/4). His message asserts 1 Sep ++. Measured both branches; banked nothing.
- Lesson: HTF engine refined from inside (indicator-side, council rules), never replaced/re-litigated; battery proves (moved take = wrong build); read splits are read errors, never strategy facts.

## R1 RAW CODE (kept EA, numbers re-verified)

- EA:8673 `if(g_state == ST_S1_REGIME)`; EA:8680-8682 `ENUM_SRJ_REGIME regime; if(!ClassifyRegime(barShift, g_dir, regime)) { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }`; EA:8683-8684 `if(regime == REGIME_NONE) { S1WAIT ... "regime unclassified, candidate RETAINED (Stage 3a)" ...; return; }`; EA:8685 `g_regime = regime;` then `g_state = ST_S2_LTF_ALIGN;` (EA:8686-8688).
- EA:2541-2550 ClassifyRegime HTF reads + `want` + `bool trendOk = (votes >= 2);` (EA:2550).
- EA:2551-2563 sweep part: `ReadFlow(FL_BUF_SWEEP_TAG, sweepTagD...)` (EA:2552); `bool mrOk = false;` (EA:2554); `if(tag != SWEEP_NONE)` (EA:2555); sweptHigh/sweptLow sets (EA:2557-2560); `if(dir == DIR_SHORT && sweptHigh) mrOk = true;` (EA:2561); `if(dir == DIR_LONG && sweptLow) mrOk = true;` (EA:2562).
- EA:2564-2567 mapping + census (`trendOk&&mrOk→BOTH / trendOk→TREND / mrOk→MEANREV / else NONE`; `REGIMECENSUS ... votes trendOk sweepTag mrOk` EA:2564).
- EA:8483-8490 seed recorder (s1f_seedThisBar idiom + IDLE-gated reseed comments; `s1g_seedBiasAl = ...` EA:8490).
- EA:8732-8741 YIELD reset (`g_anchorLine = uj_sbLine; g_dir = uj_sbDir; ... g_zoneHi = 0.0; ... g_anchorBarTime = barTime;` EA:8736).
- EA:6813 `g_regime = REGIME_NONE;` in ResetSequence (only reset; only assignment EA:8685; decl EA:1074).

## R1/R3 RAW ROWS (seed + retain + latch)

- 4JUN: `REGIMECENSUS #110 bar=2026.06.04 09:10 dir=SHORT votes=1 trendOk=0 sweepTag=0 mrOk=0 cumMR=0`; `S1WAIT bar=2026.06.04 09:10/09:15/09:20/09:25 dir=SHORT ... RETAINED (Stage 3a)`; `REGIMECENSUS #117 bar=2026.06.04 09:45 dir=SHORT votes=2 trendOk=1 sweepTag=0 mrOk=0`; `RGATE evalBar=2026.06.04 09:50 seedBT=2026.06.04 09:10 ...` (seed stayed).
- A2 [TRIAL]: `S1WAIT bar=2026.09.01 16:55/17:00/17:05/17:10 dir=LONG poi=Yearly-POC ... RETAINED (Stage 3a)`; `REGIMECENSUS #114/#115/#116 bar=2026.09.01 17:00/17:05/17:10 dir=LONG votes=1 trendOk=0 sweepTag=0 mrOk=0`; NO LONG census after 17:10; NO S1→S2 LONG (only `...17:20:05 STATE S1_REGIME->S2 ... dir=SHORT poi=Yearly-POC`); `SIDE1C_PREEMPT bar=2026.09.01 17:30 from=Yearly-POC fromDir=SHORT to=Monthly-VWAP toDir=LONG state=S2_LTF_ALIGN`; `RGATE evalBar=2026.09.01 17:30 seedBT=2026.09.01 17:30 dir=LONG ...` (preempt skips S1; regime inherited).
- A1 [TRIAL]: `RGATE evalBar=2026.08.28 10:00 seedBT=2026.08.28 09:55 dir=SHORT ...`; census `#44 bar=2026.08.28 09:55 dir=SHORT votes=3 trendOk=1 sweepTag=0`; 10:00 pass IDLE→S1→S2→S3 same pass.
- A3 [TRIAL]: `ANCHOR_ELECT bar=2026.09.04 15:40 action=SEED poi=Monthly-POC rank=6 tier=3 dir=LONG`; census `#172 bar=2026.09.04 15:40 dir=LONG votes=2 trendOk=1 sweepTag=0`; 15:45 pass IDLE→S1→S2→S3→S4 same pass; `RGATE evalBar=2026.09.04 15:55 seedBT=2026.09.04 15:45 ...`.
- A4 [TRIAL]: seedBT 09:00; census `#173 bar=2026.09.07 09:00 dir=LONG votes=3 trendOk=1 sweepTag=0`. A5 [TRIAL]: seedBT 16:15; census `#177 bar=2026.09.07 16:15 dir=LONG votes=3 trendOk=1 sweepTag=0`.
- A6 [TRIAL]: `S1WAIT bar=2026.09.08 09:55 dir=SHORT ... RETAINED`; `STATE S1_REGIME->S2 ... 10:05:00 ... dir=SHORT`; census `#186 bar=2026.09.08 10:00 dir=SHORT votes=2 trendOk=1 sweepTag=0`; `RGATE evalBar=2026.09.08 10:05 seedBT=2026.09.08 10:05 ...`.
- A7 [TRIAL]: seedBT 16:50; census `bar=2026.09.08 16:50 dir=SHORT votes=2 trendOk=1 sweepTag=0`.
- 09-01 09:50 LONG [TRIAL]: `SIDE1C_YIELD bar=2026.09.01 09:50 from=Yearly-POC fromDir=SHORT to=Weekly-VWAP toDir=LONG state=S4_ARMED ...`; `RGATE evalBar=2026.09.01 09:50 seedBT=2026.09.01 09:50 ... livePass=1` (yield path, no S1; no fire).
- 1S15:30 [TRIAL]: seedBT 15:25 SHORT; census `#106 bar=2026.09.01 15:25 dir=SHORT votes=3 trendOk=1 sweepTag=0` (livePass=1, no fire).
- June kept seeds: 27May `#3 ... 15:25 ... votes=3 trendOk=1 sweepTag=0`; 2JUN `#96 bar=2026.06.02 14:20 ... votes=2 trendOk=1 sweepTag=3 mrOk=0`; 3JUN `#97 bar=2026.06.03 09:00 ... votes=2 trendOk=1 sweepTag=0`; 5LDN `#130/#132/#133 bar=2026.06.05 09:15/09:25/09:35 dir=SHORT votes=2 trendOk=1 sweepTag=0`; 5NY `#140 bar=2026.06.05 16:45 dir=LONG votes=3 trendOk=1 sweepTag=0`; 10JUN `#240 bar=2026.06.10 15:30 ... votes=2 trendOk=1 sweepTag=0`; 11JUN `#261 bar=2026.06.11 11:05 ... votes=2 trendOk=1`; `#268 bar=2026.06.11 14:05 dir=SHORT votes=1 trendOk=0` (died); `#271 bar=2026.06.11 14:20 dir=LONG votes=2 trendOk=1`.
- mrOk=1: EMPTY in both whole runs (full-census grep). Non-zero sweepTag only 05-29 tag=1 (LONG, mrOk=0) + 2JUN tag=3 (mrOk=0).

## R2 AUTHORITY (search results + quotes)

- 0.3.10: S1WAIT/S2WAIT RETAINED text carried in 01_TASKS/PACKET_P-RECON78-UJ-EXEC-1v10/v11/v12 (both print lines verbatim); PACKET_160-R2's "STAGE 3a block" is a separate mechanical type-insertion (STAGE 4 insertion order, ASCII/paren/token gates), not this behavior. Ledger grep "Stage 3a" (case-insensitive, whole 1.2 MB file): ZERO. Findings SEEDFIX-1 cites S1WAIT rows as mechanism (lines 45/51), never as his words. Operator pin for retain-until-later-classified: NOT FOUND. Closest: SEED-CARRY EXPECTATION (skill line 81: seeds persist across unconfirmed bars to confirmation; 51 instances 09:55→10:00, 14:55→16:40) + line-83 default-keep derivation (explicitly builder-owned).
- Spec 3.2 (lines 96-99): trend = retest dir + HTF aggregate simple majority; mean-rev = FRESH sweep of immediately prior session's liquidity; "Both may hold; no precedence, no differential treatment. Neither → the candidate does not advance."
- GATE-AUTHORIZATION (skill line 115): "no gate, predicate, exemption, or filter ships whose authorizing pin in THIS file cannot be quoted section-plus-verbatim. Silence in this file is never consent".
- Verdict: MIXED (park-without-advance honors the letter; latch-on-later-bar unscoped by 3.2's text and pinned by nothing → silence ≠ consent). No fix decided.

## R4 OUTCOMES (per relay)

- RA (seed-candle regime): 4JUN NONE; A1/A3/A4/A5/A6(10:00 reads)/A7 TREND; A2 NONE-then-preempt; 5LDN TREND; 5NY-16:45 TREND (16:00 UNKNOWN); 11J TREND; 1S15:30 TREND; 3J/2J/10J/27May TREND; rest UNKNOWN. DOES NOT SEPARATE (TRUE on 2JUN/10JUN/5LDN silent rows; A2 unclassified).
- RB (latest-retest regime): 4JUN NONE (retest = seed). All later retest candles lack census by construction (S1-only). DOES NOT SEPARATE (A2 no-read; 2JUN TREND on ruled-out).
- RC (machine type vs his class, ungraded): 4JUN TF vs NONE→TREND (DIFFERENT at seed); A3 ++ vs TREND (MIXED); A2 asserted-++ (record unmarked) vs inherited-TREND (record MISMATCH on assertion); rest his-UNKNOWN (no comparison).
- Census: only retained-unclassified-at-seed fire on record = 4 June (A2 = no-classification preempt cousin). Never a rule.

## R5 (no candidate)

- RA/RB/RC all DO NOT SEPARATE → nothing drafted. Notes: regime inputs runtime-read (EA:2542-2552) only on S1/S2-evaluated candles; retest-after-S1 + preempt/yield seeds never evaluate them; latch bar unnamed by construction.

## RECORD LINES (exact)

- X1 context §4: `- B120-REGIME-AT-RETEST (planner lesson 2026-10-09): grade a bias reason at the retest candle his words name, with both regime branches (trend majority and fresh same-session sweep) beside his journal setup class; B-119 graded the HTF majority at confirmation only and read 1 Sep, a '++' row, as a trend-only breaker.`
- X2 context §5: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-120; this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).`
- X3 handoff §3: `- B-120: measured the regime at the retest candle and the unclassified-retain path against spec 3.2 on the full register; no source edit or run.`
- X4 ledger `1265.` (tag `B120-REGIME-AT-RETEST`; R0-R5 + correction record; no rule invention).
- X5 pointer (cap 35): latest B-120 MEASURED; RA/RB/RC; authority NOT FOUND; kept EA/EX5; 5JUN-1615 open; goal open.
- Pre-commit: X1/X2/X3/X4 counts 1; `^1264.` = 1; staged = 6 relay files only; no source/EX5/journal/log/settings diff.

(End of slice)
