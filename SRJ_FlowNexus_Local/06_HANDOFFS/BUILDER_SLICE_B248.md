# BUILDER SLICE B-248 - raw rows (in-bias D + per-kind C + 248A + 248B, RESTORED)
Base: builder/B-248 cut at 5213732 (= B-247 head). Verdict RESTORED (D not-kept, C no-gain).
Trial keeps: .B248DK (EA 0a6affaf/6086e07c, Flow 387f2822/5311d4a2, Imb 89a1e7d4) + .B248CK (Flow e938e7d8/0130c56b, EA 76478e6a).
## Start gate
```
log-1 5213732 (backup exact; on B-248). gated diff EMPTY (0.3 + skills + LESSONS + ledger + grader + truth).
kept SHAs all match (EA/Flow/Types/OB/Imb/Bias/State/POI); .B247BK 9 verified (EA 0a6affaf/f075fcdc, Flow 387f2822/e7883c59, rest B246K).
tini 2862b31f ACCOUNTED (touch-class: 8 diff bytes vs preB247, [Tester] RECON dates + Symbol intact, [TickLoad] intact).
tick 18678468 STATIC. no terminal64. ledger ^1394=1 ^1395=0. Python 3.13.16. D: free reported pre-runs.
Part B: nothing banked.
```
## Part S separator (B-247 rows)
```
N25JUN: silent on B via 5747 bearish KS-held (short side = in-bias) - D keeps this.
K8OCT: lost on B only via 18451 bullish cascade (11:30 S3 ob1/fvg1/adv2 ABORT for SHORT; kept: code-8 flip revival; B: no flip); all other B-vs-kept rows identical (A1-A7/P3/V29JUN/K28MAY/K8JUL/K2SEP/K5AUG exact; NEVERS same; M8 same; M12 new machine).
D SEPARATES (in-bias scope preserves the 25 Jun hold; K8OCT damage is out-of-bias cascade). No STOP.
```
## Part A-B/A-G (before Part K)
```
rules/54 created verbatim (relay text) + index line; counts 0 pre.
register NOTE (under EU review rows) + READ/REGISTER A/C/D/E regen sha 47cab1c3 (B/F kept, sections moved out pre-relay, noted).
ledger 1395 B248A-EU-BANK-19JUN.
truth K19JUN (15:45/1.14644 from B196BAR jl 22285746; CRLF kept).
grader patch (2 hunks, counts 1): xp_ok blank-exit skip + entry blank skip.
kept baselines on new truth: EU-B241D 13/14-12/14-4 (K19JUN MISSING expected); RECON-B242K 7/7-6/7-0.
```
## Part K hunks (raw)
```
.preB248 x9 (kept SHAs) + 9 .B247BK copies verified.
[B248D] (ImbalanceMgr, CRLF kept): code-5 branch b248samB=isBullish + dead=(sam && !isValid), print +sam; code-6 twin with !isBullish. Braces +0; markers once per branch (B244RV pattern); compiles Flow 0+3 pre-existing, EA 0/0.
[B248C] (Flow): opposing latches g_b248LastDn/Up + Prev (decl + reset); per-bar ingest i-1 + o strictly before target; FVG opposing-touch + fill-after-o; XOB logic kept; B248C prints per side (cfvg/cxob/first-earliest-reach); buffers 55/56 totals kept; ZG gate untouched. Braces 154/154 (+4 ingest); dead newB/leg lines removed (owned); compiles Flow 0+3 pre-existing (1598/1820/2003), EA 0/0.
Own defects: C-script CRLF/indent mismatches (owned, byte-verified); B-base exp-dict typo (owned); RECON-B busy-refusal (owned).
```
## Part T launches (ex5 pre/post identical every run; WMI script only; launcher killed post-verify; watcher PID-verified)
```
RECON62-B248D: terminal 10644; PRE=24427481; PASSED 19:10:33 (~5m).
EU0525TD-B248D: terminal 11404; PRE=25721945; EU dates read back; PASSED 19:50:49 (~29m).
RECON62-B248C: terminal 10356; PRE=29121856; PASSED 20:22:14 (~4m).
EU0525TD-B248C: terminal 10792; PRE=30416320; PASSED 21:09:00 (~30m). No rollovers.
Cuts once per run (job_cut_b247.py + B248C regex).
```
## Part T grades raw
```
RECON-D 7/7-6/7-0 trades 7; EU-D 12/14-11/14-3 + M8/M12 trades 17 (K8OCT + K19JUN MISSING; kept 13/14) -> D RESTORED.
RECON-C 7/7-6/7-0 trades 7 (A1/A7 must-holds pass); EU-C 12/14-11/14-3 + M8/M12 trades 17 (NEVERs still fire).
T2 verdict: D not KEPT (K8OCT worse than kept). T3 carriers in REPORT/CARRIER_B248.csv (114 rows).
T4 restore verified (kept SHAs, 27 charts, tini, no terminal64). .B248DK/.B248CK unstaged.
```
## Part T5/C carriers (first = earliest reach)
```
26May SHORT: 15 bearish XOBs; first 05-12 1.17799-1.17835 reached 05-12 (FVG side 0).
4Jun LONG: 4 bullish XOBs; first 05-21 1.15829-1.15868 reached 05-21 (FVG 0).
15Jul LONG: 2 bullish XOBs; first 07-14 1.13793-1.13846 reached 07-14 (FVG 0).
25Jun (C/D): SILENT via KS (10:10-10:30 skips, no 10:15 RV row); ZG sideS count61 but refused upstream.
K8OCT (D/C): 11:30 S3 ob1 (18453 code-3 11:25) + no code-8 revival; no dead1 RV row on 10-08.
```
## Part A-R readings (EU-B248D cut; TOOLS/job_r_b248a.py; 90 rows)
```
R1: 15:05 B215F1 KILL_S3 ob1/fvg1 (early candidate dead); hidden-bull latch=1 first at 15:45 (dbar 15:35); entry one candle after owed (A6FIRED bar=15:45 -> 15:50 open vs owed 15:45 open 1.14644).
R2: EA reads CQD verdict buffer (iCustom SRJ_CQD_TickBased_MT5 EA:12465, g_hCqd); latch walk UpdateDivergenceLatch EA:7024-7049 latches first nonzero verdict at/before bar (D130 EA:10394). No next-close wait in EA: NOT FOUND (wait, if any, is CQD-indicator-side).
R3: HTF10JUN_B248A.csv (ht=1/1/-1; 5m BULL; London H 1.15585 swept 15:40 / L 1.15465 swept 14:00; machine sweepTag=0; TREND votes=2).
```
## Part B-248B (banking + truth + reading)
```
rules/55 verbatim + rules/54 correction line + index (counts 0 pre).
register NOTE (B-248B) + READ regen sha 25d7d082.
truth K10JUN (18:55/1.15490 + machine exit 01:01/1.15331 marked); kept EU re-grade 13/15-12/15-4 (K19JUN + K10JUN MISSING).
R1: B196BAR table 15:15-15:55 (15:25 l=15:30 l=1.14638 equal; 15:35 l=1.14620); EA stores 15:35 low from 15:40 bar (SWINGPICK SL atShift=1) but latches div at 15:45 (one bar after confirm-at-close). SWING19JUN_B248B.csv.
R2: swing-validity decided in CQD indicator (EA has no swing check; UpdateDivergenceLatch reads published verdicts). Plain answers in carried note.
R3: HTF10JUN carried into batch as VALID class OPEN.
EU_FIX_PLAN F4a/F4b + B amends. Batch B248 (10 Jun VALID/OPEN; 19 Jun closed).
Ledger 1397 B248B-EU-BANK-SWINGCONFIRM (next). LESSONS B248B line (fold first if over cap).
```
## Timing + size gate
```
Wall: gate+reads+S ~40m; A-B/A-G ~25m; K hunks + 4 compiles ~30m; RECON-D start 8m + run 5m; EU-D start 9m + run 29m; RECON-C start 13m + run 4m; EU-C start 12m + run 30m; cuts + grades + carriers + R + B parts + records follow.
Size: pointer 4665/35 PASS; result 4689/26 PASS; slice 6139/79 PASS (this file); TRUTH +2 rows (K19JUN/K10JUN); FIXPLAN 19207 (F2/F3/F4a/F4b); LESSONS check cap; READ_MAP rewritten; BATCH248 2 items; CARRIER 114; R csvs 3.
```
(End of slice)
