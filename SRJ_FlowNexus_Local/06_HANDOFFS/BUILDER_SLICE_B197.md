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
```
(End of interim slice; Part K and Part T follow after this commit pushes via backup.)
