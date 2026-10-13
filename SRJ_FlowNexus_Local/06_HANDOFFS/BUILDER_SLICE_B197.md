# BUILDER SLICE B-197 - INTERIM (S-A separator table; committed before any edit per Addendum A)

Base: builder/B-197 cut at 074ebdf (backup exact, = builder/B-196 head). Reads: job_r_b197.py (packs + existing cuts +
source text, never the day log). No edit, no compile, no run at interim. Relay B-197 + Addendum A, same session.

## B2 banking (grep-first; before anything else)
```
His words 2026-10-13 (B-197A), verbatim: "this is definitely the same issue of the stale sessional liquidity that
has been swept but is still considered and targeted. this is not a new issue. please plan how to fix this, make an
addendum so the builder could resolve this issue faster."
grep-first "B-197A" = 0, verbatim quote = 0 -> appended strategy section "His words 2026-10-13 (B-197A) - stale
liquidity, every reader" + STALE-LIQUIDITY-EVERY-READER (paraphrase, marked so): NOT new; restates TAKEN-LINE (126),
FRESH-SWEEP (82), SWEEP-TEST-STRICT (127), B-190 words; binds every reader (target, retarget, renewal void,
cached-sweep map); running-session extreme (33) never voids/makes/targets. Instance: 10 July PD_NY_LOW 1.34278 void.
Ledger 1343 carries the banking. Journal: appended nothing (B-167).
```

## R1 MAP-PROVEN (B196SESS + B196BAR, kept B196 runs; full rows in job_r_b197_out.txt)
```
10 JULY London 09:00-11:55 BAR: 35 bars, max-high 1.34358 (09:10), min-low 1.34082 (11:50).
LD.H@13:55 (live tag, SESS pack 1229, sv=3, live London high then 1.34306): 13:55 has NO session (gap 12:00-14:00,
spec 3.0/SESSION-CLOCK-SOURCE) -> same-session sweep NOT PROVEN (FRESH-SWEEP 82).
pLD.H@14:00 (SESS pack 1259, sv=0): value 1.34358 = today's London high (OPEN-NY cache pack 1255; BAR recompute
max-high 1.34358) PROVEN; formation London session PROVEN (code caches at risingNY + value equality); liveness
12:00-14:00 NOT PROVEN (gap candles NOT PRINTED, named); sweeping candle 14:00 in NY (spec 3.0) with high 1.34372
(BAR pack 1291) strictly above 1.34358 PROVEN (14pts).
5 JUNE pLD.L@14:00 (SESS packs 1587/1590): value 159.908 = today's London low (OPEN-NY cache; BAR recompute min-low
159.908) PROVEN; formation London PROVEN; liveness gap NOT PROVEN (named); 14:00 bar low 159.895 strictly below
159.908 PROVEN (13pts, pack 1633, ltf=-1.0).
9 JUNE pAS.L@09:00 (SESS packs 32/36): value 160.133 (prevAsiaLow); formation Asia out-of-window NOT PRINTED;
prior-extreme recompute NOT PROVEN (Asia OOW); liveness NOT PROVEN (named); 09:00 bar low 160.085 strictly below
160.133 PROVEN (48pts, pack 74).
2 SEP pAS.L@09:35 (SESS packs 29/307): value 1.15760; formation NOT PRINTED; recompute NOT PROVEN; liveness NOT PROVEN;
09:35 bar low 1.15744 strictly below PROVEN (16pts, pack 345). pAS.H@16:25 (SESS packs 1502/2677): value 1.15917;
formation NOT PRINTED; 16:25 bar high 1.16091 strictly above PROVEN (pack 2721).
8 SEP pAS.L@09:35 (SESS packs 35/314): value 1.16228; formation NOT PRINTED; 09:35 bar low 1.16211 strictly below
PROVEN (17pts, pack 404; open equals the level, wick strictly through).
Verdicts: value/session/formation PROVEN where cached+recomputed (London/NY), NOT PROVEN where Asia-OOW;
sweep-candle in-session + strictly-beyond PROVEN on all six; cross-gap liveness NOT PROVEN on all (named gaps).
```

## R2 VOID-LINE (B193D voids; buf map EA r2_bufs: 10 PD_ASIA_H, 12 PD_LONDON_H, 14 PD_NY_H, 15 PD_NY_LOW)
```
10 JULY j3841907 bar=14:15 SHORT buf=15 line=1.34278: B196 SESS prevNYLow = 1.33805 (pack 22) != line -> NOT a closed
prior-session level on rows; line EQUALS B196BAR 14:10 low 1.34278 EXACT (pack 1356) = NY running low at 14:15
(min 14:00-14:10 lows); London already 1.34082 (11:50, pack 1191) sits under it. Reading VOID-LIVE-LINE (B-197A words):
never the running session's own extreme (33), never a taken/stale line (82/126/B-190). Grade: VOID FAILS
<running-session-own-low> + <stale-line>.
5 JUNE j5841545 bar=15:30 LONG buf=10 line=160.006: B196 SESS prevAsiaHigh = 160.006 (packs 35/1587) == line PROVEN;
running NY high pre-15:30 << line (15:25 bar h=159.899, pack 2351) -> not running-own PROVEN; no strict-beyond before
the void bar on 55 printed candles (only 15:30 h=160.031, the void bar itself) -> live PROVEN. Grade: VOID STANDS
(Asia two sessions back noted; reading as written needs closed-prior, not immediately-prior - ambiguity disclosed).
9 JUNE j5864852 bar=10:05 LONG buf=12 line=160.178: B196 SESS prevLondonHigh = 160.342 (pack 32) != line; running
London high = 160.190 (10:05 bar); NO closed prior-session level at 160.178 on any B196 row. Grade: VOID FAILS
<unproven-line>.
9 JUNE j5872683 bar=17:45 LONG buf=14 line=160.224: B196 SESS prevNYHigh = 160.202 != line; running NY high = 160.228
(17:45 bar); NO closed prior-session level at 160.224 on rows. Grade: VOID FAILS <unproven-line>.
```

## S-A separator for the addendum (MAP-LIVE + VOID-LIVE, alone and together)
```
Readings: MAP-LIVE (cached p-level counts only if live under the B190TK taken-on-candles test at the sweeping candle
+ strictly-beyond in-session); VOID-LIVE (renewal void touches only B190TK-live closed prior-session levels, never
the running extreme). B190TK object located: B190TakenBad(idx,v,dir,shift) (EA .B190TK:2844-2875; live in current EA
EA:2846 + callers EA:2979/12486 booking). Indicator swept flags use liquiditySweepBuffer (SRJ_Sessions.mqh:354+) =
forbidden tolerance (127) -> unusable; K2 walks rate arrays with SRJ_InSession bound, no new store/number (B-84 clear).
Per-row (A1-A7, B1-B3, every C reaching the step, F2, F3, 9JUN, 2SEP):
MAP-LIVE: A SAME (BOTH-TRUE; deaths preserved) | B1 SAME-silent | B2 MOVES-16:55 (B193D precedent) | B3 SAME |
C SAME-silent except 9JUN ADDS-11:20 + 2SEP ADDS-10:30 | F2 SAME | F3 SAME-silent (slot death preserved; regime
depends on trial liveness, silent either way).
VOID-LIVE alone: every row SAME (kept void never fires without MEANREV; no-op on kept rows).
Together: MAP-LIVE outcomes (B2 void line proven live -> STANDS -> MOVED; F3 void FAILS but slot stands -> silent;
9JUN ADDED; 2SEP ADDED-UNDECIDED).
Mode: ALWAYS-RESTORED DIAGNOSTIC (B2 must-keep move + 9JUN his-declined add predicted; B193 class) - run anyway for
the 10 July rows (T6). KEPT TRIAL blocked: cannot affirmatively predict clean (liveness gaps unread offline).
Mode: ALWAYS-RESTORED DIAGNOSTIC (B2 must-keep move + 9JUN his-declined add predicted; B193 class) - run anyway for
the 10 July rows (T6). KEPT TRIAL blocked: cannot affirmatively predict clean (liveness gaps unread offline).
```

## R3 displacement in the map world + TIER-HOLDS-UNCONFIRMED (kept CUT_B192 census + EA text)
```
EA:8463-8490 raw (S2-CROSS-DIR-PREEMPT + P-VNEXT-1 E1): S2 holder + any opposite retest (t78_opp) re-points anchor/dir,
clears latches/zone/touch (EA:8467-8490), prints SIDE1C_PREEMPT, NO state write (stays S2). S1: needs opConf=1 +
!heldConf (EA:8463 2nd clause); S1 double-zero reseeds instead (UJRESEED EA:8434-8444, Fix H1). B193D 10 July 14:25
Daily LONG arrived opConf=0 (shadow confirm=0 packs 4549/4597) - S2 clause needs no confirm.
Tier order by text: spec 3.7 "VWAP and POC on one anchor are the same tier" (spec L185); family ranks + AVP-POC over
VWAP (skill section 3, lines 63-68); EA authority ranks (EA:95 Y_POC=2; ANCHOR rows: FOMC rank=1 tier=0, Yearly rank=2
tier=1, Quarterly rank=4 tier=2, Monthly rank=6 tier=3, Weekly rank=8 tier=4, Daily rank=10/11 tier=5; tier=rank/2 EA:8378).
Reading TIER-HOLDS-UNCONFIRMED (SETUP DEFINED 51 "confirmed-new displaces unconfirmed-held"; ONE-TAKE 84 "tier wins"):
an opposite retest that does not confirm on its own candle never displaces/re-points a higher-tier holder; a confirmed
retest, or same/higher-tier one, displaces as kept.
Must-keep roads: A2 j956104 PREEMPT S2 (holder Yearly t1 -> Monthly t3 + shadow-confirmed 17:30 pack 19669; live fire
17:35 proves live confirmation) -> displaces, SAME. A5 j1007183 UJRESEED (t4->t4 same-tier) -> SAME. A7 j1022199
UJRESEED (t4->t3 higher) -> SAME. B3 j1993649 UJRESEED (t5->t5 same) -> SAME. B2 retained (zero transfers 15:20-16:15).
Divergent 16 (unconfirmed + lower-tier new): 7/01-09:40 dies pre-fire; 7/10 F3 regime-NONE + NO POLL; 6/09-10:05 Weekly
LONG silent (regime NONE on kept); 6/12-15:30 dies pre-fire; other 12 never confirm. -> every row SAME (F3 silent).
```

## R4 10 July chain under all three readings (spec 9.4 order; BAR values B196 packs 1356/1390/1594/1624/1656)
```
Regime at 14:15: under MAP-PROVEN liveness NOT PROVEN offline (gap) -> unproven -> S1WAIT. (Trial T6: live=0 ->
NONE.) First failing gate.
Void at 14:20: VOID FAILS (R2: PD_NY_LOW 1.34278 = running NY low, SESS pNL=1.33805) -> seed survives void.
(Trial: regime NONE -> void cannot fire; no SEEDVOID 14:20 on trial rows.)
Slot at 14:25: TIER-HOLDS -> Daily LONG (t5, lower, opConf=0) does NOT displace Yearly SHORT (t1) -> holder persists.
5m from 14:30 open: aligned (ltf=-1.0 packs 1473/1594/1620).
14:50 confirmation on machine test (IsConfirmationCandle EA:2621-2716 raw cited; touch: line EA:2673, prior EA:2682,
retest-carried cSrc EA:2699-2700 + XT EA:2683-2698 zone-reach + pre-retest promotion; XOB touch role):
Y-POC 1.34296 SHORT, 14:50 bar (o1.34239 h1.34276 l1.34233 c1.34235), prior 14:45 (o1.34218 c1.34238):
opp (c1>o1) MET | A2 (c0=1.34235<=L) MET | body (4pts down nonzero) MET | touch NOT MET (prior h1.34246<L;
retest 14:15 touches but XT needs picked-XOB reach + pre-14:15 promotion: his 1.34353-1.34374 NOT reached by
[1.34260,1.34300], machine pick absent). Beside TOUCH-OR-BREAK (skill section 7: touch OR body-close break; 14:50
neither touches (h<L) nor breaks (o/c both below)) and SAME-CANDLE-PERMITTED (107, N/A).
Zone at 14:50: B179HZB S win=1 first=07:10/07:25/1.34353-1.34374 (packs 1562/1590/1619, standing, no kill rows);
B177HZ verdict rows ABSENT 14:35-14:55 (rule EA:10088-10115 needs S5 reads; no evaluation) -> verdict NOT PRINTED.
CQD: encode verdict +-1 regular / +-2 hidden (EA:9904), +bull/-bear (EA:9905-9906); latest by 14:50: NO bearish latched
(CQDRECHECK divLatch=0; UJPROBE regular/opposing; D130LATCH absent kept; B193D 15:05 verdict=1 verdictBar=14:15 pack
4820 other-seed regular-bullish; B192 14:30 div=1 regular dbar=14:15 pack 29532 LONG seed); his type-2 UNMAPPED;
DIVERGENCE-RENEWED-ONLY (207-211): latest valid never stale -> machine latest (regular/opposing) != bearish -> NOT MET.
Stop 1.34372: B157 outward two-swing 2xOB; machine SHORT walk NOT PRINTED (no election).
Target: nearest valid below 14:55 open 1.34234 from B196 values (Y-POC 1.34296 / Daily-POC 1.34267 / Daily-VWAP 1.34245
above; LD.L 1.34082 below, valid: unswept-on-rows, not closed-over) = 1.34082; R = 152/138 = 1.10 >= 1.0 MET
(his geometry, unbooked by machine).
```

## R5 table (MAP-PROVEN | VOID-LIVE-LINE | TIER-HOLDS | ALL THREE)
```
A1-A7: SAME x4 (TREND takes; BOTH-TRUE 79; deaths preserved). B1: SAME-silent x4 (5m untouched, no post-lineup poll).
B2: SAME (MAP-PROVEN: liveness gap -> no MEANREV) | SAME (kept never voids) | SAME (retained) | SAME.
B3: SAME x4. C rows: SAME-silent x4 (9JUN/2SEP adds need the ungated map; renewal spares no C-row seed; 4JUN/2JUN/10JUN/
4SEP/1SEP/8SEP/27AUG/28AUG die preserved gates). F2: SAME x4 (pLD.H leaves F2 identical, B-194 R5). F3: SAME-silent x4
(regime gap; void fails; slot holds-or-displaces silently; 14:50 unreached). 9JUN: silent x3 (kept/diag rows) + MAP
column n/a here (MAP-PROVEN strict: liveness gap -> silent). 2SEP: silent x4 (same reason).
Must-keep moved: NONE. Must-never added: NONE. (Ungated-map B2-move/9JUN-add live in S-A/MAP+ columns, not here.)
```

## T4/T5/T6/T7 (trial rows; diagnostic mode)
```
T4 filed-trade tables vs B196: GBP 2/2, RECON 14/14, JUNE 8/8 byte-IDENTICAL DEALS files (side/date/time/price/volume/
register_row). B2 16:15 160.065 present; no 9 June fire; no C fires; F2 present; no F3. Fills: identical deals ->
identical fills (B-192 FILL-EXACT sheet reproduces exactly); spot B2 entry 160.065 vs 16:15 open 160.059, F2 1.33863
vs 14:45 open - both as B-192. ex5 pre/post batch IDENTICAL (35ABEF2B/60090452). B197TAG x1 per segment (CUT_B197).
T5 STOP evaluation: no A/B2/B3/F2 differs; no 9JUN/C fires; no ex5 change; no missing build tag -> NO STOP, NO breach.
Mode DIAGNOSTIC -> verdict RESTORED. Restored + verified: EA 986a7dba, IND a8201128, SESS 16573a5b (= .preB197);
ex5s rebuilt from restored sources (93E9A54A/B813EC99; __DATETIME__-stamped, differ from B-196 prints by build time
only - disclosed); terminal.ini a5834591 + Profiles 19 files restored + verified; no terminal64 running.
T6 10 July on trial rows: REGIMECENSUS #195/#196 1/0/0/0 (packs 1359/1392; pLD.H live=0 SESS pack 1259) -> first stop
REGIME; then UJRESEED displacement 14:25 (CUT j9254438 + SLOT j9254439, opC=0 heldC=0) -> LONG aborts 14:30 (SLOT
j9254692); 14:50 no Y-POC poll; 14:55 no entry. Trader words: no mean-reversion class (the 1.34358 cached high was
already taken), the 14:25 Daily-line long takes the slot and dies at 14:30, the 14:50 candle is never polled for your
line. S-A prediction miss recorded: B2-move + 9JUN-add did NOT materialize (liveness refused pLD.L + pAS.L on trial:
SESS live=0 packs 1590 (6/05), 36 (6/09), 307 (9/02)).
T7 new/moved fires: NONE on any run (deals byte-identical) -> nothing to list or grade.
```

## Base Part S (ALL THREE; R5 + R4)
```
A/B2/B3/F2 SAME + no C/9JUN added: MET. R4 reaches 14:50 confirmation with no NOT MET: NOT MET (REGIME first,
map-liveness gap; C_TOUCH second; zone-verdict + CQD after). -> DOES NOT SEPARATE, breaking row F3 (regime).
Next relay parks the lane at 6 of 6 under PK-2 (no B-198 trial). T6 trial rows ride B-198's record.
```
(End of slice; R3/R4/R5/T-verdicts final. Part K/T/X/records/push in result.)
