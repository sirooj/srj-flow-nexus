# BUILDER SLICE B-196 - raw rows per item (under 600 lines)

Base: builder/B-196 cut at 7fbdbaa (backup exact, = builder/B-195 head). Reads: job_r_b196.py (packs + cuts + source text, never the day log). Print run: B196BAR/SESS/DIV/SLOT (always-restored unless kept). Verdict KEPT.

## B banking (grep-first)
```
B1: no new rule words with this relay.
B2 planner correction: pre-counts at 7fbdbaa = 0 (skill + register), post = 1 each, no duplicates.
strategy pins cited on actual lines: RETEST-RENEWAL:48 CONFIRMATION-BAR:53 POST-ENTRY:54 TIMING:55 NO-OVERFIT:60
BOTH-TRUE:79 FRESH-SWEEP:82 TREND-SWEEP-IRRELEVANT:83 ONE-TAKE:84 ENGINE-REFINE:92 SAME-CANDLE:107
FLIP-KILLED:117 TAKEN-LINE:126 SWEEP-TEST:127 5M-BIAS-AT-ENTRY:139 Ruling-10-07:169 RETEST-DIES:187 B-195 section:294-299
journal L26 quoted whole (R3c). journal 9/2: L270 London note, no POI/target/take (SILENT).
```

## R1 displacement (kept CUT_B192; code EA read-only with real line numbers)
```
Rule in one line: at S1 an opposite retest with both sides unconfirmed (opConf=0 heldConf=0, EA:8431-8432) reseeds over the
unconfirmed holder (UJRESEED EA:8434-8444, Fix H1); opposite-confirmed (opConf=1, heldConf=0) preempts at S1 (EA:8463 2nd clause,
SIDE1C_PREEMPT); at S2 any opposite retest re-points anchor with no state write (EA:8463 1st clause, EA:8467-8490).
10 July death 2: j2898051 UJOPCONF bar=14:20 Daily LONG opConf=0 heldConf=0 (opTerm=B_BODY heldTerm=A_OPP) +
j2898052 UJRESEED bar=14:20 Daily LONG fromPoi=Yearly-POC fromDir=SHORT al=1 (14:25:01, S1 holder displaced).
Spec 6 (spec file lines 281-297): multiple candidates may live concurrently; dedup on same (window, direction, anchor) key only;
arrival order governs across time (first to complete executes); a rejected setup consumes nothing.
SETUP DEFINED (skill:51): only the confirmation-candle entry makes the setup. POTENTIAL vs SETUP (skill:52): sweep/retest =
potential only; unconfirmed held seeds carry no arrival protection.
ONE-TAKE design consequence (skill:84): same-session contention resolves to exactly one (tier wins, non-firing holder expires,
never a permanent veto); cross-session independent. FLIP-KILLED-NEVER-VETOES (skill:117): flip-killed holder never vetoes.
Census (CUT_B192 UJRESEED/PREEMPT/YIELD counts): GBP 21/1/3, RECON 19/8/1, JUNE 28/3/1 (every row with journal line in
job_r_b196_out.txt lines 2-169; fate table out2 lines 36-288: each transfer bar, holder key, new key, displaced later
confirms, new-holder fate - every new holder aborts except the takes below).
Take roads: A2 = 17:30 PREEMPT j956104 (Yearly-SHORT->Monthly-LONG, S2) then FIRE 17:35 (B182DEC pack 19686; B125 road).
B2 = retained (no UJRESEED/PREEMPT 15:20-16:15 on JUNE0525-B192.log). A5 = UJRESEED 16:20 j1007183 then FIRE 16:45 (pack 36666).
A7 = UJRESEED 16:55 j1022199 then FIRE 17:00 (pack 41613). B3 = UJRESEED 14:20 j1993649 then FIRE 14:40 (pack 59476).
A1/A3/A4/A6/F2 = retained through their windows (no transfer rows near their candles).
10 July holder fate: displaced Y-POC never polls again (kept day pack: later Y-POC confirms 15:15+ belong to new seeds);
new holder Daily LONG aborts LTF_MISALIGN 14:30 (pack 29530 + B182DEC 29532).
A2-SHORT-18:10 confirm=1 shadow (pack 20009): throttle-blocked (A2 LONG executed 17:35; one-take + LIVE-TRADE line 117).
```

## R2 SLOT-KEEP grades (reading: different-key retest never removes live holder; both potentials, own candles, spec 6)
```
A1 SAME (retained; conf under aligned 5m). A2 SAME (first-to-complete LONG 17:35; SHORT co-holder confirms only 18:10,
throttle-blocked). A3 SAME (15:35 confirm died other-gate, kills preserved). A4 SAME (retained). A5 SAME (LONG completes
16:45 first; SHORT co-holder dies 15:25 S4 pack 35979; 16:30 confirm dies pre-fire, gates preserved). A6 SAME (single
Weekly->Monthly lineage via preserved B3 upgrade; Monthly LONG co-potential dies 09:40 LTF_MISALIGN pack 38608).
A7 SAME (SHORT completes 17:00 first; LONG co-potential dies pre-decision, no B182DEC). B1 SAME-silent (no post-lineup
confirmation). B2 SAME (retained). B3 SAME (14:20 LONG completes first 14:40; SHORT never confirms post-displacement).
C rows SAME-silent (each dies a preserved gate or never confirms; 9 June 16:35 confirms die pre-decision, no B182DEC).
F2 SAME (retained; fires 14:45). F3 SAME-silent (holder persists S1/regime-NONE under reading too; co-holders complete
nothing). Must-keep moved: NONE. Must-never added: NONE.
Buildability (B-84): holder identity (g_anchorLine/g_dir/g_state, S2 block EA:8972) YES; per-key potentials need a
second slot store (today single-slot) NO - reading unbuildable as stated; judged as input only.
```

## R3 class step
```
R3a B193D 5 June Monthly LONG: 15:25 pass seed 15:20 (pack 6905) + REGIMECENSUS #124 1/0/4/1 (pack 6906, trendOk=0);
15:30 pass FRESHSKIP S2 (pack 6947) + CONFIRM bar=15:25 confirm=0 (pack 6954), NO REGIMECENSUS (already S2);
void at 15:30 (CUT j5841545 SEEDVOID bar=15:30 LONG buf=10 line=160.006). SEEDVOID writer EA:8722-8754 raw (comment:
P-VALIDITY-1 R2 renewal; scope ST_S1..ST_S4 only EA:8723; r2_touch needs bar range over unswept session line EA:8738-8744;
void only if g_regime==REGIME_MEANREV EA:8746; IDLE write EA:8749; LogState EA:8752; print EA:8753).
R3b RENEW-TREND (TREND-SWEEP-IRRELEVANT skill:83 + BOTH-TRUE skill:79: renewal void never removes a seed whose trend
branch holds at the void candle): void-vs-last-census trendOk on packed B193D rows: F3-map 14:15 trendOk=0 spares=False
(pack 4482); B2-map 15:30 trendOk=0 spares=False (pack 6906); B2-reseed 16:00 trendOk=0 spares=False; 9JUN 10:05 trendOk=0
spares=False (pack 4637); 9JUN 17:45 trendOk=1 spares=True (pack 8408) but spared seed confirms 0 (packs 8637/8691) -> silent.
Other 29 B193D voids: packs NOT FOUND (no committed day files) -> UNGRADED, named. B2 does NOT return under RENEW-TREND.
Kept rows inert (SEEDVOID count 0 on all three B192 cuts).
R3c 9 June B193D gates: seed 11:10 (pack 5264); regime 1/0/2/1 MEANREV (pack 5265); 5m +1.0 (packs 5215/5311); zone
xobInPlay=1 160.159-160.194 (pack 5267; road packs 5255/5309/5374); conf 11:15=1 (pack 5319); CQD hidden verdict=2
dbar=11:10 (pack 5321); stop ONE_OR_NEITHER 160.153 (pack 5328); TP R=1.78 (pack 5329); FIRE MEANREV (pack 5330).
His L26 verbatim: "L long invalid bias yet and invalid XOB" (Comment cell; POI "W AVP, D VWAP"; Bias bear; 4H Bear 1H Bull
15m Bear). Banked refusing rule: same-class journal-'invalid XOB' = no setup (0602-NY-NO-SETUP skill:185;
0604-LDN-NOT-HIS skill:199 citing s178) - QUOTED. Bias: his Bias bear vs machine LONG + POI identity UNDECIDED (B-194) -
no separate banked pin beyond the journal cell (NONE).
R3d 2 Sep B193D gates: seed 10:20 FOMC (pack 3964); regime 0/0/2/1 (pack 3965); 5m -1.0 then +1.0 (packs 3923/3959/3999);
conf 10:25=1 (pack 4007); zone applied 1.15530-1.15548 (packs 4009/4010); CQD verdict=1 regular dbar=10:05 (pack 4013);
stop KEPT_PATH 1.15614 R=1.57 (pack 4020); TP 1.15917 (pack 4021); FIRE MEANREV (pack 4022). Record status: journal
SILENT (L270 London note, no POI/target/take, W=0 L=0).
```

## R4 silent clear (B193D j3841906 STATE S2->IDLE 14:20:06 poi=-)
```
IDLE writes in EA+includes: EA:1087 init (g_state = ST_IDLE); EA:7061 ResetSequence; EA:8749 SEEDVOID void path.
Includes: NONE. LogState def EA:1834, ResetSequence EA:7059, GoAbort EA:7112 (GoAbort always prints ABORT + A6REFUSED +
B182DEC - absent at 14:20:06). Ran: EA:8746-8753 renewal void (g_regime MEANREV + r2_touch) - PROVEN by same-pass
SEEDVOID j3841907 bar=14:15 SHORT buf=15 line=1.34278 (PD_NY_LOW; bar range 1.34260-1.34300 contains it) + LogState
order EA:8752->8753 matching j3841906->j3841907. Verdict: FOUND.
```

## R5 input table (SLOT-KEEP | RENEW-TREND | MAP+RENEW-TREND)
```
A1-A7: SAME | SAME | SAME. B1: SAME-silent x3. B2: SAME | SAME | MOVED 16:55 (B-194 BREAKS). B3: SAME x3.
C rows: SAME-silent x3 (map adds per B-194 R5 only 2 Sep UNDECIDED + 6/09 declined + 10 July regime; renewal spares no
C-row seed). F2: SAME x3 (B-194 R5: pLD.H/NY leaves F2 identical). F3: SAME-silent | SAME-silent (void stands) |
SAME-silent (regime MEANREV but void stands trendOk=0; displacement stands). 9 June row: silent | silent | ADDED 11:20
(his-declined fire returns on map). 2 Sep row: silent | silent | ADDED 10:30 (UNDECIDED, journal silent, WITHHELD).
```

## P print run (P0-P6)
```
P0 backups: EA.preB196 3B5EE8D1, IND.preB196 F0924613, Sessions.preB196 0461a6dd (from git HEAD), terminal.ini.preB196
72b6708b, Profiles.preB196 (19 chart files). Counts before/after in result.
P1 spots (raw in result file): EA B196BAR (after shadow block), EA B196SLOT x5 (RESEED/PREEMPT/YIELD/GoAbort/SEEDVOID),
EA B196DIV (after D130LATCH), IND B196SESS (sweep site), SRJ_Sessions.mqh B196SESS x4 (rising sites). lastConf live:
NOT-TRACKED (no new state per print-only rule; joined offline from CONFIRMPOLL shadows - disclosed).
P2: braces delta 0 all files; markers EA 7 / IND 1 / Sessions 4, each block once. Compiles: IND 0 errors + 3 pre-existing
warnings (1576/1798/1872); EA 0 errors + 0 warnings. ex5 post-compile EA F0F5C274 / IND 934DF27A.
P3 runs (one terminal session, back-to-back; dates written + read back each): GBP0629-B196 WMI 06:01:27 PID 14844
PRE 5934206 pass 0:05:28 DONE PASSED 06:13:38; RECON62-B196 WMI 06:13:55 PID 18444 PRE 6879670 pass 0:04:04 DONE PASSED
~06:24:11; JUNE0525-B196 WMI 08:50:44 PID 19388 PRE 7931309 pass 0:06:50 DONE PASSED 09:18:04. Leftover stops by PID
(B-43, recorded). ex5 SHAs pre-each-launch and post-all-runs IDENTICAL (F0F5C274 / 934DF27A) - no STOP.
One cut (job_cut_b196.py, single pass, binary seek, PRE+1 numbering; rerun once after adding next-run truncation -
first cut overran segments, owned + disclosed): CUT_B196 x3 + window packs + day files + DEALS + INDEX_B196.
P4 filed-trade tables: GBP 2/2 IDENTICAL, RECON 14/14 IDENTICAL, JUNE 8/8 IDENTICAL (side/date/time/price; volumes
IDENTICAL). Tags present all runs: BAR 1426/1048/1426, SESS 92/66/82, SLOT 114/92/115, DIV 19/28/18. No STOP.
P5 proof: B196BAR vs B176HZ/B178ZL 53/53 candles MATCH, 0 mismatch (10 July); B196SESS sessions == B182SWEEP tags
(LD.H@13:55 sv=3 live London 1.34306; pLD.H@14:00 cached 1.34358; pAS.L@16:55); OPEN-LONDON/OPEN-NY prints present.
Disagreement: NONE (B158/B183 clean).
P6 KEPT (print-only, B-182 class): deals identical all runs + P5 clean. Prints stay live on disk uncommitted
(.B196P copies 986a7dba/a8201128/16573a5b). ROWPACK staged: 9 window files + 41 day files + 3 DEALS + INDEX_B196.
terminal.ini + Profiles restored from .preB196 and verified (72b6708b + 19 files).
```

## R6 10 July at his candles (B196 rows, corrected frame: 14:45 opposing / 14:50 confirmation / 14:55 entry)
```
BAR candles (pack server_time + bar o/h/l/c ltf ypoc holder): 11:50 o1.34128 h1.34130 l1.34082 c1.34105 (pack 1191);
14:10 o1.34285 h1.34308 l1.34278 c1.34292 (1356, fills NOT-PRINTED); 14:15 o1.34293 h1.34300 l1.34260 c1.34286 (1390,
SHORT Y-POC held); 14:20 o1.34287 h1.34295 l1.34266 c1.34269 (1426, LONG Daily post-reseed); 14:25 o1.34269 h1.34272
l1.34215 c1.34241 ltf=-1.0 (1473); 14:30 o1.34242 h1.34246 l1.34206 c1.34225 (1509, fills gap, nH=0); 14:35 o1.34224
h1.34228 l1.34174 c1.34179 (1539); 14:40 o1.34178 h1.34235 l1.34176 c1.34218 (1566, fills gap, closes UP); 14:45
o1.34218 h1.34246 l1.34212 c1.34238 (1594, opposing, closes UP +20pts); 14:50 o1.34239 h1.34276 l1.34233 c1.34235
(1624, confirmation, closes DOWN 4pts nonzero); 14:55 o1.34234 h1.34269 l1.34229 c1.34258 (1656, entry open 1.34234,
SHORT Daily alive). ypoc=1.34296 every bar. Body-through vs 1.34296 14:10-15:00: NONE (14:10 high 1.34308 wicks 12pts,
bodies hold below).
14:50 as Y-POC confirmation on machine test: ABSENT (no Y-POC poll on 14:50 bar; holder displaced 14:25, SLOT pack 1422).
Existing 14:50-bar poll is Daily SHORT (pack 1623: opp1 body1 4pts touchAttr=0 confirm=0) - other anchor, context only.
Retest-carried touch (hunk C/XT): no Y-POC cSrc row on 14:50 bar (no seed) - NOT APPLICABLE.
Divergence at 14:50: machine NONE latched (D130LATCH absent; UJPROBE 14:55 regular/opposing pack 1620; B196DIV absent
14:40-15:00, no S5 read) vs his type-2-bearish UNMAPPED (DIVERGENCE-RENEWED-ONLY skill:207-211: latest valid, never stale;
machine latest = regular). NOT MET.
7:10 XOB at 14:50: S win=1 first=07:10/07:25/1.34353-1.34374 (packs 1562/1590/1619); no B178ZL kill 14:45-14:55 -> standing YES.
Stop 1.34372 vs machine SHORT walk: NOT PRINTED (no SHORT holder 14:30-14:50, BAR nH=0 corroborates).
LD.L 11:50: value 1.34082 (SESS OPEN-NY pLL pack 1255 + BAR 11:50 low EXACT pack 1191). Swept before 14:55: NO on all
readable rows (in-window lows 11:50-12:00 + 14:00-14:55 never strictly below; no LD.L sweep tag all day); 12:00-13:55 gap
candles NOT PRINTED (out-of-window; day-log rescan forbidden post-cut) -> gap UNREAD, disclosed. Nearest valid target
below 14:55 open = 1.34082 (spec 3.7 L187). R at 14:55 open = (1.34234-1.34082)/(1.34372-1.34234) = 152/138 = 1.10 >= 1.0
-> his-geometry 1R PASSES (unbooked by machine).
One line (deaths cleared, spec 9.4 order): REGIME (kept sweepTag 0, S1WAIT) -> ZONE (7:10 formation NOT PRINTED) ->
CQD (none latched) -> 1R PASSES; proximate first = REGIME.
```

## Part S
```
SLOT-KEEP: all SAME + no C/his-declined added, 14:50 unreached -> DOES NOT SEPARATE, breaking row F3.
RENEW-TREND: same -> DOES NOT SEPARATE, breaking row F3.
MAP+RENEW-TREND: B2 MOVED + 9JUN ADDED + 14:50 unreached -> DOES NOT SEPARATE, breaking rows B2 (first), 9JUN.
B-197 trial: NONE separates. Next work: death-1 needs a sweep map scoped to miss pLD.L-in-NY (B2) while reading the
13:55 LD.H sweep (value-proven 1.34306 live / 1.34358 cached); death-2 needs both-keys-live with first-to-complete;
either must still reach a 14:50 Y-POC poll that survives regime/zone/CQD/1R. No Part K this relay.
```

## Start gate + timing
```
Gate: log-1 7fbdbaa (backup exact); branch builder/B-196 cut there (rev-parse both ends); status 972 (dirty tree as
B-195 + work files ACCOUNTED); diff 7fbdbaa EMPTY on pointer/RESULT_B195/SLICE_B195/register/skills/CONTEXT/HANDOFF/ledger;
SHAs EA 3B5EE8D1/ex5 75B12D19/ind F0924613/ex5 717099E9/.B193D 8CF44FA6/.B189PMAP a31259b5; terminal.ini 72b6708b +
Charts MISMATCH-ACCOUNTED (B-193 class; .preB196 content copies before launch, restored + verified after);
ledger ^1341.=1 ^1342.=0 pre; D: 144.6 GB free; terminal64 count 0 at gate (operator terminal absent; tester launches
used the lane terminal per run_tester_v2.ps1, leftovers stopped by PID per B-43).
Timing: gate + Part-0 reads ~40m; Part R scripts + grades ~90m; P0 backups + P1 edits + P2 checks ~40m; compiles ~5m;
P3 runs GBP 0:05 + RECON 0:04 + JUNE 0:07 + waits/archives ~90m; cut + packs + INDEX ~20m; R6 + S + records + push follow.
Disk: print sources + ex5s live on disk uncommitted (KEPT print-only); everything else untouched.
```
(End of slice)
