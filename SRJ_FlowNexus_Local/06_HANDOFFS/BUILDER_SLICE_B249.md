# BUILDER SLICE B-249 - raw rows (flip-renewal E + CQD-maxX2 F, RESTORED)
Base: builder/B-249 cut at bce89a0 (= B-248B head). Verdict RESTORED (E not-kept, F gate-fail).
Trial keeps: .B249EK (EA 0a6affaf/8aa3869a, Flow 387f2822/cbcd25c7, OB 7b6f2a05) + .B249FK (+ CQD copy 80f9ba95/4d46112a).
## Start gate
```
log-1 bce89a0 (backup exact; builder/B-249 absent pre-cut; on B-249).
gated diff EMPTY (0.3 + skills + cutter + ledger).
kept SHAs all match; .B248DK 9 verified (EA 0a6affaf/6086e07c, Flow 387f2822/5311d4a2, Types f2e74e66, OB 3c669e6d, Imb 89a1e7d4, Bias 1c210d7b, State 4bdc8e41).
tini 2862b31f == .preB248 ACCOUNTED (touch-class; [Tester] RECON + Symbol, [TickLoad] intact); blessedB208 present.
tick 18678468 STATIC. no terminal64. ledger ^1395=1 ^1396=1 ^1397=1 ^1398=0. C 16.5GB D 160GB. Python 3.13.16.
CUTs: B241D/B242K/B248D/B248C FOUND. Part B ALREADY_BANKED a5f79dc.
```
## Part G raw (today's truth: +K19JUN +K10JUN)
```
EU-B241D 13/15-12/15-4 M0 trades 17 (MISSING K19JUN+K10JUN).
RECON-B242K 7/7-6/7-0 trades 7.
EU-B248D = EU-B248C 13/15-12/15-3 M1(M12) trades 17 (MISSING K8OCT+K19JUN; K10JUN EXACT) -> G2 MATCH (K10JUN favorable unlisted).
EU-B247B 13/15-12/15-3 M1 trades 17 (same shape). RECON-B248D 7/7-6/7-0 trades 7.
G3 fix: kept has no 19 Jun deal; 15:50 deal on kill-mark builds only (carried note, batch history untouched).
New kept baselines for T5: RECON 7/7-6/7-0, EU 13/15-12/15-4.
```
## Part K0 raw (TOOLS/job_k0_b249.py)
```
K0a 8 Oct: kept vs B248D identical through 11:20 (code-8 flips at 00:15-10:20 both; H1B 10:45 both; KS skips B-only from 10:50). First diff 11:25 (kept code-8 flip revival; B248D none) -> 11:30 S3 ob1/fvg1/adv2 ABORT (B) vs take (kept); B248D code-8 at 11:40 (after entry).
K0b 25 Jun: ABSENT (no flip/code-8 10:00-10:50 either cut) -> E keeps N25JUN hold; recorded, not a STOP.
K0c: Types.B248DK:58 field + :86 init; OB:112-114 replay skip, :236 KM set, :494-496 live skip; Imb:202/341 leg writes, :210-214/:352-356 RV guards (typed FRESHNESS/REVIVAL/FLIP per writer in slice output).
K0d: CQD maxX2=rates_total-3 (:856) writes verdict at anchor x2 (:755); swing needs i+1 (:515); EA latch s=barShift down, first nonzero wins (:7024-7049), no next-close wait. INDICATOR-SIDE (15:35 verdict needs 15:45 bar to exist; owed 15:40-close confirm needs maxX2-2).
```
## Part S separator (committed rows)
```
A1-A7/P3/V29JUN/K28MAY/K8JUL/K2SEP/K5AUG exact kept+B248D; K10JUN: missing kept, EXACT B248D; K19JUN missing both; N25JUN fires kept, silent B248D (5747-bearish-KS-held, in-bias); N26MAY/N4JUN/N15JUL fire both; M8 kept-absent/B248D-fired (now K10JUN); M12 B248D-only.
E prediction: EU 14/15-13/15, NEVER 3, M1, K8OCT back, K10JUN kept, N25JUN silent. SEPARATES (K8OCT loss on missing flip reader; N25JUN hold on revival readers, K0b ABSENT). No STOP.
Rule check quoted (46 L7, 17 L5, 3.3, 3.4, B-246-LEG-NOT-RENEWAL, 55 L4+L7, 54 L10, 3.7, 3.8, 22 L4): no conflict.
```
## Part K hunks (raw)
```
.preB249 x9 (kept SHAs) + 9 .B248DK copies verified.
[B249E] (OB, CRLF kept): replay site split (validationBar=replayBar + didActivate, isValid/isActivated skipped; print replaced B246KS) + live twin (validationBar=i). Braces +2/+2 (135/135); markers once per site (2 prints); compiles Flow 0+3 pre-existing (1598/1820/2003), EA 0/0.
[B249F] (renamed CQD copy ONLY; his file untouched): maxX2 rates_total-3 -> -2 + verdict print; diff = 2 hunks, inputs order byte-identical; compiles 0/0.
.B249EK 9 verified (EA 8aa3869a, Flow cbcd25c7, OB 7b6f2a05); .B249FK 11 verified (CQD 80f9ba95/4d46112a).
Own defects: B-base exp typo (owned); RECON-B busy-refusal (owned); C-script CRLF/indent (owned); cutter legStart-space (owned).
```
## Part T launches (ex5 pre/post identical every run; WMI script only; launcher killed post-verify; watcher PID-verified)
```
RECON62-B249E: terminal 10496; PRE=33816231; PASSED 22:33:39 (~6m).
EU0525TD-B249E: terminal 3300; PRE=35110695; EU dates read back; Test passed 23:40:17 0:41:28 (~41m).
RECON62-B249F: terminal 1556; PRE=38510609; midnight rollover (completion in 20261017.log 00:05:11, B-240 precedent; DONE written by hand); PASSED 0:04:39 (~5m). CQD copy loaded (InpCqdName row).
EU0525TD-B249F: NOT RUN (T3 gate 2/7).
Cuts once per run (b247 + B249/KS + B248C regexes); day-log switch handled by temp DAYLOG patch (reverted).
```
## Part T grades raw
```
RECON-E 7/7-6/7-0 trades 7 (K19JUN out of window).
EU-E 13/15-12/15-3 + M12 trades 17 (N25JUN SILENT; K8OCT + K19JUN MISSING; K10JUN EXACT). E RESTORED (K8OCT worse than kept; validation flow changed no flip/renewal: no 11:25 code-8; first E-vs-kept diff = 10:50 KS skip as in B).
RECON-F 2/7-1/7-0 trades 2 (A1/A2 only): 9-03 17:40 array OOR in FlowLogic:1800 (g_b176T1 slot write, kept code, all builds same src; other runs clean) killed the indicator -> no seeds after. EU-F NOT RUN. 19 Jun entry unmeasured. F RESTORED.
```
## Part T7 fills (deal fill vs bar open; exits per grader; spread class, no tolerance)
```
RECON-E: fills == opens (A1/A6/A7/K2SEP) or -1..-3pts (A2/A3/A4 buys, ask/bid); exits per grade (A1 +3pt FILL-EXACT).
EU-E: same pattern (fills at open +/- spread; M12 15:50 1.14654 vs open 1.14649 +5pt ask).
RECON-F: A1/A2 fills at open.
```
## Timing + final disk + housekeeping
```
Wall: gate+reads+G ~45m; K0+S+K hunks + 5 compiles ~60m; RECON-E start 25m + run 6m; EU-E start 21m + run 41m; RECON-F start 13m + run 5m; cuts + grades + carriers + R + records follow.
Final disk RESTORED: all kept SHAs verified, tini from .preB249, 31 charts, no terminal64. .B249EK/.B249FK unstaged (9+11 files). CQD copy src+ex5 unstaged (indicators, never staged).
Housekeeping: B249 cuts stay (current trial); kept baselines stay; today's logs stay.
X7 carried: A1 +3pt = FILL-EXACT class, no edit.
```
## Size gate (caps 20000/600; pointer 6000/35; result 12000)
```
pointer 4781/35 PASS; result 4682/28 PASS; slice 6071/74 PASS (this file); TRUTH +0 (K19JUN/K10JUN in B-248); FIXPLAN 19988 (F2/F4a); LESSONS no line (E unproven); READ_MAP rewritten; BATCH249 1 item; DEALS x3.
```
(End of slice)
