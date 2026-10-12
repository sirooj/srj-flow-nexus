# BUILDER SLICE B-181 - R1 print lines raw, R2 diff summary, R4 rows

Base: builder/B-181 cut at e89b507. No source/include/ex5 edit, no compile, no run. No terminal64 at gate (restore allowed, done R5). Python 3.13.16 canonical path.

## R1 print lines raw (kept EA EB18717E on disk, located by text, no edit)
- EA:221-229 sweep-tag code: `#define SWEEP_NONE 0`, `SWEEP_ASIA_HIGH 1`, `SWEEP_ASIA_LOW 2`, `SWEEP_LONDON_HIGH 3`, `SWEEP_LONDON_LOW 4`, `SWEEP_NY_HIGH 5`, `SWEEP_NY_LOW 6`, `SWEEP_PM_HIGH 7`, `SWEEP_PM_LOW 8`.
- EA:237 regime enum: `enum ENUM_SRJ_REGIME { REGIME_NONE=0, REGIME_TREND=1, REGIME_MEANREV=2, REGIME_BOTH=3 };`
- EA:1812-1818 RegimeName: `case REGIME_TREND: return "TREND"; case REGIME_MEANREV: return "MEANREV"; case REGIME_BOTH: return "BOTH"; return "NONE";`
- EA:2739 REGIMECENSUS (inside `if(InpDebugLog)`, ClassifyRegime): `if(InpDebugLog) { static int s_rc91 = 0; static int s_rcMR91 = 0; s_rc91++; if(mrOk) s_rcMR91++; PrintFormat("[SRJ-EA] REGIMECENSUS #%d bar=%s dir=%s votes=%d trendOk=%d sweepTag=%d mrOk=%d cumMR=%d", s_rc91, TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(dir), votes, (int)trendOk, tag, (int)mrOk, s_rcMR91); }` then `if(trendOk && mrOk) regimeOut = REGIME_BOTH; else if(trendOk) regimeOut = REGIME_TREND; else if(mrOk) regimeOut = REGIME_MEANREV; else regimeOut = REGIME_NONE;` (EA:2739-2742). trendOk = HTF majority (EA:2720-2725); mrOk = fresh same-session sweepTag in trade direction (EA:2726-2738).
- EA:2872 SWEPTMASK (inside `if(InpDebugLog)`): `PrintFormat("[SRJ-EA] SWEPTMASK bar=%s raw=%.1f m=%d swept=%d%d%d%d%d%d%d%d%d%d live=%d%d%d%d", ...)` (EA:2872-2890). Print-only (EA:2867-2868: "Print only; nothing reads this").
- EA:1857 LogSignal SIGNAL: `PrintFormat("[SRJ-EA] %s SIGNAL dir=%s poi=%s regime=%s div=%s sess=%s tp_target=%s tp_R=%.2f sl_ref=%s sl_mode=%s spreadPts=%d bid=%s ask=%s", ...)` (EA:1857-1868).
- Indicator :1261-1273 sweep-tag writer: `if(!g_s.freshSweepExpired && !SrjIsNa(g_s.freshSweepTag))` then AS.H->1, AS.L->2, LD.H->3, LD.L->4, NY.H->5, NY.L->6, PM.H->7, PM.L->8 into buffer 18 (FL_BUF_SWEEP_TAG).
- EA sweep-print grep (`PrintFormat` with sweep, case-insensitive): only EA:2739. No print carries the sweeping candle.
- R1 cut (r1_b181.py, one pass over Tester/logs/20261012.log): RECON62 span lines 2957888-4007334: 221 REGIMECENSUS + 243 SWEPTMASK + 7 SIGNAL; JUNE span 4007335-4977289: 338 + 197 + 4; GBPR span 5915287-6853283: 211 + 163 + 1. 35 supplement files ROWPACK/<run>/<date>_B181SUP.csv (same 9 columns, pack_line restarts at 1). Verified INSIDE by r1_verify_b181.py (min/max journal lines inside spans; only testing-of lines after GBPR PRE are B179R's own header at 5915300/5915328; total log lines 6853283).

## R2 diff summary (r2_b181.py; 38 rows: 34 HIT / 2 MISS / 2 NOPRINT)
- Outputs SETUPS_RECON62-B179-B181.csv (19), SETUPS_JUNE0525-B179-B181.csv (12), SETUPS_GBP0629-B179R-B181.csv (7). Join: same date + dir, bar in [retest_bar, confirm_bar], exact confirm-bar else latest below.
- Notable HITs: A2 9/01 17:30 LONG = NONE (trendOk=0 mrOk=0, preempt-transfer path, B-125 class); 9/01 09:10 SHORT = TREND tag=2 (AS.L, trend row only); 7/02 18:10 LONG = TREND tag=0; 7/07 14:40 SHORT = TREND tag=0.
- MISS (NOT PRINTED, no REGIMECENSUS row in window): RECON62 9/01 LONG 09:50 (LONG prints resume 10:10); GBP 7/08 SHORT 15:30 (SHORT prints at 11:20-11:55 then 16:10, none in [14:55,15:30]).
- NOPRINT (no confirm bar): RECON62 C-09-04-1040; JUNE 1 row (manual).
- div_type_his UNMAPPED on all 38 rows: his only mapped number (type 1, W2 1 Sep 09:45) has no B-179 candidate row; type 2/3/4 two-pattern search 0 across skill/findings/ledger (one builder-shorthand type-2, not his mapping).
- Discipline: row counts equal (19/12/7); zero non-source cell diffs on all three files; every source_pack_lines a superset (supplement ref appended).
- Stale carry reported (cells unchanged): SETUPS_GBP0629-B179 7/08 reject A6REFUSED/LTF_MISALIGN/ROWPACK_GBP0629-B179_W2:6845 vs B-179 row W2:6845 `A6REFUSED class=ABSENT_DECLINED bar=2026.07.08 15:35 state=S5_GATE_CHECK dir=SHORT predicate=HISZONE_NONE`.

## R4 rows (FILLBASIS_B181.csv; r4_b181.py pulls)
- B3 11 June LONG entry: his 160.524 (ENTRY-BAR READ-BACK 2026-09-27; register B3 CORRECTION B-52) | signal TP_ELECT entry=160.524 (JUNE 6/11 pack 2044) | fill DEAL #8 buy 160.530 at 14:40:22 (pack 2048) | class SPREAD (signal == his; +0.006 intra-bar fill; B-139 settled, B-163 reused).
- A7 8 Sep SHORT exit: register 1.16275 [R60 G4] quarantined, no his-words stop (B-140 R6; L194 paraphrase traces to machine output) | signal TP_ELECT sl=1.16274 (pack 2838) + MTEXIT exit=1.16274 SL (pack 3169) | fill 1.16274 | class NOT-HIS (X5 register NOTE added).
- A4 7 Sep London LONG exit: his 1.16200 (his 9/7 legs, ledger 331 RECON1 L50-57; ledger 1309) | signal TP_ELECT tp=1.16200 (pack 214) + MTEXIT exit=1.16200 TP_TOUCH (pack 1146) | fill DEAL #9 sell 1.16201 at 10:53:07 (pack 1096, inside the 10:50 signal bar) | class SPREAD (signal == his; +1pt intra-bar; R60 1.16201 quarantined, not used).

## R5 rows (r5_b181.py; no terminal64)
- terminal.ini: live pre 7026805e (his-close rewrite) -> post CF80083C (backup verified).
- GBP0629-B162.ini: live pre = post = 9C88E21D (was already correct).
- Profiles/Charts: 23/23 restored and SHA-verified; differed before restore (names only): Default chart01.chr, chart02.chr, chart05.chr, chart07.chr, order.wnd; live-only extras untouched: Default chart08.chr, chart09.chr, chart10.chr, chart11.chr.
(End of slice)
