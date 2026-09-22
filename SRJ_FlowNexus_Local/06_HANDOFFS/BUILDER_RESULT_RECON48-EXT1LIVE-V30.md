# BUILDER_RESULT_RECON48-EXT1LIVE-V30 — v30 3-part probe run (2026-09-20)

Run: RECON48-EXT1LIVE-V30. DONE=PASSED 2026-09-20 13:45:32 (52m29s wall;
launch 12:53:03, ceiling 90; tester Test passed in 0:51:45.843).
Build: EA 9C79FC1E39CD6B9A7B49443A8F50EEE7394FB09B163208943E0415F037B918B /
613044 B (v30 3-part per P032, uncommitted). Compile: 0 errors, 0 warnings
(06_HANDOFFS\EXT1LIVE-V1_EACOMPILE.log, per BUILDER_BUILD_RECORD_V30.md).
Packet: v30 (5CD5FAD374FB410BF54C1609C3C324EF04DAF7C0F3DD9D53BDBCFE09F1D549E8 /
148086 B / 46 lines). Relay: v193
(436AA70A3035162DD3F06B98917D4C422DD8CAA94103BF35AED0DEB901A5C2C7 / 243728 B /
489 lines, twin 46/46, snippet 285/285).
Auth: triple-key spent (Luna-V193-001 ACCEPT + his verbatim Astra-waiver for
this print-only probe only + run word). No new build, run, or commit here.
Segment: 06_HANDOFFS\RECON48-EXT1LIVE-V30_JOURNAL.log =
4EF17FF53B39844CCB595796B7CA492DB81C4AB6C86C7F1ABFEE0A80258B5178 /
7242874 B / 37350 lines = STATUS ARCHIVED_LINES 37350 exactly.
Tabulate: 00_CURRENT_WORKING\tabulate_ext1live_v30.ps1 (pattern from
tabulate_ext1live2.ps1, adapted to the 3-part shape) + probe_rec48_seg.ps1 +
probe2_rec48_seg.ps1 + probe3_rec48_seg.ps1 (all ASCII, read-only,
segment-only; gates re-derived from the SEGMENT, never the day log).

## DONE-gate (segment-derived, STATUS cross-checked only)

- DONE RESULT=PASSED; no REFUSED_* gate, no TIMEOUT_60MIN. Wall 52m29s
  inside the 90-min ceiling.
- Single run: one tester 'testing of' announcement (ER 12:53:24) plus one
  core-start line (FE 12:53:37, same run, standard MT5 pair) from 2026.08.26
  00:00 to 2026.09.10 00:00; one 'Test passed in', one 'connection closed',
  one 'final balance 10183 JPY'.
- Range/inputs match the cleared envelope (RECON44_DEMO_P1, InpMode 1,
  08-26 to 09-09, InpDebugLog=true): 563338 ticks, 3168 bars generated.

## Realized delta (promise vocabulary of the v193 NOVEL-EVIDENCE paragraph)

The authorized run was asked to return first per-part transport proof (each
part inside the measured sink), emitSeq survival on every part, stamp
transport, and full-row acceptance. All four are on disk:

IMPROVED (no prior run had any of this):
- First 3-part output ever: 1 SCHEMA + 39 NORMAL parts = 13 records x 3,
  emitSeq 1..13 contiguous, exactly 3 parts each, zero duplicate
  seq|part combos, zero incomplete records.
- Per-part transport proof: full-message maxima part1=346 / part2=302 /
  part3=390 chars, vs the filed per-part ledger 439/372/448 (margins
  93/70/58) and vs MESSAGE_CAP 489 (margins 143/187/99). Every part whole
  on the wire; zero STOPRESOLVE lines touch the 537 journal-line cutoff
  (max STOPRESOLVE line 525; all 40 share the constant 48-char prefix).
- emitSeq survival on every part: 39/39 parts carry emitSeq; envelope copy
  equals payload copy on all 13 part-3/3s.
- Stamp transport: ladOriginStamp present on all 13 part-3/3s and equals
  barTime 13/13.
- Full-row acceptance: 13/13 rows join to 38/38 keys in SCHEMA order with
  zero order/key-count misses; leg-(a) exact recompute 13/13 on BOTH legs
  (rLive from rawNumLive/rawDenLive AND rExt1 from rawNumExt1/rawDenExt1,
  bit-exact IEEE division of round-tripped %.17g operands); self-interval
  containment 13/13 in BOTH double and BigInteger exact cross-product
  forms; archive leg-(b) 7/7 table bars inside the P042 +-1pt
  exact-rational intervals (double AND bigint, per-bar bounds below).
- entry==currentPrice byte-identical 13/13 (the P034 proxy rule is now
  verified on the wire; currentPrice rides at position 35).
- actualGate transported and checkable: equals SIDE1X livePass on all 3
  rows where live and shadow can differ (A1/A3/A2 = 1/1/1); equals
  wouldGate on all 10 triple-identical rows.
- Previously cut fields now ride: extSideOk, extDistPts, rawNum/rawDen
  both legs, wouldAdopt_monotone, actualGate, emitSeq, currentPrice, s0px,
  s1px, ladOriginStamp. Nothing is withheld on any NORMAL row.

CONFIRMED (re-proven on new output, not new):
- SCHEMA single, fields=38, all 38 P034 names in order; envelope uniform
  on all 40 lines (format=2, pkt tag -v28, base 6C2E4028, zero misses).
- Per-part key ranges in order, zero misses: 1/3 = positions 0-12, 2/3 =
  13-25, 3/3 = 26-37.
- dir in {1,-1} on all 13 rows (6 LONG / 7 SHORT); gateConst=1 all rows;
  ext1Defined=1 all rows; wouldGate sign agreement 13/13.
- C-reach closure 13/13/13/13: 13 NORMAL records + 13 SIDE1E_STOPSHADOW +
  13 SIDE1X_STOPREF + 13 site-S5 SLEXT481 in one segment.
- Slot ladder and ruleStops match archive: A1 slot 118 px 1.16508, A3 slot
  91 px 1.16359, A2 slot 13 px 1.16299; ext1BarTime 06:30 / 09:05 / 09:30;
  ext1Imb 0 / 2 / 2; ladOriginBarTime 16:25 / 16:45 / 10:40.
- A1 record-at-C: rExt1=1.3836223893420441 (1.38), wouldGate=1.
- A3 record-at-C: rExt1=0.6780821917805907 (0.68), wouldGate=0.
- A2 record-at-C: rExt1=7.3029949705442476 (archive 7.30), wouldGate=1,
  veto pre-latch, zero TP_ELECT rows at its bar.
- 7 TP_ELECT fire rows of 11 (fire R 3.43/1.48/1.74/4.86/2.34/2.52/1.62 on
  the seven table bars; non-fire R 0.35/0.18/0.34/0.63); 7 SIGNAL alerts
  with EA timestamps at table-bar +5min latch (10:05, 16:25, 16:00, 09:20,
  16:40-bar 16:45, 10:10, 16:45:01).
- 6-of-11 post-activation fire count discharged: wouldGate=1 on exactly
  the six TP_ELECT bars (08-28 10:00, A1, 09-04 15:55, 09-07 09:15, 09-07
  16:40, 09-08 10:05) plus A2, which carries no TP_ELECT row.
- Three-source-changed rule 10/10 measured (all ten sel=1 rows
  byte-identical slLive==pxExt1 and rLive==rExt1; only A1/A2/A3 differ).
- Ext1-tuple corroboration 3/3: SLEXT481 slExt1/slot == NORMAL pxExt1/
  ext1Slot on A1/A2/A3 (this segment, quoted below).
- Veto/session strikes print '-' throughout (vetoStateAtSite=-,
  sessionUseAtSite=- on every NORMAL row); zero '?' file-wide (two
  patterns: Contains + case-sensitive regex, 0/0); zero INVALID in the
  STOPRESOLVE region (two patterns, 0/0); zero type=CAP STOPRESOLVE lines
  (two patterns, 0/0); zero BSAVE_FAIL lines (two patterns, 0/0).
- Census finals: BIASCENSUS_FINAL bars=3168; ZONECENSUS_FINAL bars=3168
  xobOnly; WS161_CENSUS loads=stores=3168 mismatch=0;
  XOB_PROMOCENSUS_COUNT 469 re-derived on the segment.
- Chrono span of NORMAL bars 2026.08.26-14:40 through 2026.09.08-16:40.

WITHHELD (nothing withheld in the gradeable region this run):
- No WITHHELD class engages: every mandatory P042 check has its operands
  on the wire. The RECON47 sink-cap bound is retired for the 3-part shape
  (observed shortfall was single-line-structure-only).

## Archive leg-(b) intervals (machine-checked, probe3; archive operands ex
v193 P017-P026; n/d in points at 1e-5; endpoints inclusive)

- 2026.08.28-10:00 n=144 d=42 rE=3.4298869083622101 in
  [3.32558139534884, 3.53658536585366] dbl=True bigint=True
- 2026.08.28-16:20 n=108 d=78 rE=1.3836223893420441 in
  [1.35443037974684, 1.41558441558442] dbl=True bigint=True
- 2026.09.04-15:55 n=297 d=171 rE=1.7390735183614887 in
  [1.72093023255814, 1.75294117647059] dbl=True bigint=True
- 2026.09.07-09:15 n=180 d=37 rE=4.8622120530283883 in
  [4.71052631578947, 5.02777777777778] dbl=True bigint=True
- 2026.09.07-16:40 n=54 d=23 rE=2.3388531183067136 in
  [2.20833333333333, 2.5] dbl=True bigint=True
- 2026.09.08-10:05 n=133 d=53 rE=2.5170818178905749 in
  [2.44444444444444, 2.57692307692308] dbl=True bigint=True
- 2026.09.08-16:40 n=99 d=146 rE=0.6780821917805907 in
  [0.666666666666667, 0.689655172413793] dbl=True bigint=True

## Per-row register (bar seq dir sel wg ag rExt1 slot pxExt1)

- 2026.08.26-14:40 seq=1 dir=1 sel=1 wg=0 ag=0 rE=0.53129514248194309
  slot=61 px=1.16597
- 2026.08.27-17:00 seq=2 dir=-1 sel=1 wg=0 ag=0 rE=0.34578599704773882
  slot=7 px=1.16598
- 2026.08.27-18:50 seq=3 dir=1 sel=1 wg=0 ag=0 rE=0.18072289156640367
  slot=10 px=1.1644300000000001
- 2026.08.28-10:00 seq=4 dir=-1 sel=1 wg=1 ag=1 rE=3.4298869083622101
  slot=42 px=1.1650800000000001
- 2026.08.28-16:20 seq=5 dir=-1 sel=0 wg=1 ag=1 rE=1.3836223893420441
  slot=118 px=1.1650800000000001
- 2026.08.31-15:05 seq=6 dir=-1 sel=1 wg=0 ag=0 rE=0.34420379850419536
  slot=49 px=1.1605799999999999
- 2026.09.04-09:25 seq=7 dir=1 sel=1 wg=0 ag=0 rE=0.62752316717072654
  slot=7 px=1.16249
- 2026.09.04-10:35 seq=8 dir=-1 sel=0 wg=1 ag=1 rE=7.3029949705442476
  slot=13 px=1.16299
- 2026.09.04-15:55 seq=9 dir=1 sel=1 wg=1 ag=1 rE=1.7390735183614887
  slot=5 px=1.1584699999999999
- 2026.09.07-09:15 seq=10 dir=1 sel=1 wg=1 ag=1 rE=4.8622120530283883
  slot=7 px=1.1609799999999999
- 2026.09.07-16:40 seq=11 dir=1 sel=1 wg=1 ag=1 rE=2.3388531183067136
  slot=7 px=1.16238
- 2026.09.08-10:05 seq=12 dir=-1 sel=1 wg=1 ag=1 rE=2.5170818178905749
  slot=5 px=1.1625799999999999
- 2026.09.08-16:40 seq=13 dir=-1 sel=0 wg=0 ag=1 rE=0.6780821917805907
  slot=91 px=1.1635900000000001

## A-row wire evidence (this segment, whole part-lines)

A1 seq=5 part=1/3 emitSeq=5 barTime=2026.08.28-16:20 dir=-1
entryPx=1.1642999999999999 tpPx=1.1632207745363128
incomingSlRef=1.1650800000000001 liveSel=0 slLive=1.16503
pxExt1=1.1650800000000001 ext1Defined=1 ext1Imb=0
rLive=1.4783910461464782 rExt1=1.3836223893420441 gateConst=1
A1 seq=5 part=2/3 emitSeq=5 wouldGate=1 vetoStateAtSite=-
sessionUseAtSite=- ext1Slot=118 ext1BarTime=2026.08.28-06:30 s0slot=5
s0imb=1 s1slot=118 s1imb=0 ladOriginPx=1.1642999999999999
ladOriginBarTime=2026.08.28-16:25 ladOriginSite=S5 extSideOk=1
A1 seq=5 part=3/3 emitSeq=5 extDistPts=78
rawNumLive=0.0010792254636871057 rawDenLive=0.00073000000000011944
rawNumExt1=0.0010792254636871057 rawDenExt1=0.00078000000000022496
wouldAdopt_monotone=1 actualGate=1 emitSeq=5
currentPrice=1.1642999999999999 s0px=1.16503 s1px=1.1650800000000001
ladOriginStamp=2026.08.28-16:20
A1 corroboration (this segment): SIDE1E_STOPSHADOW bar=2026.08.28 16:20
dir=SHORT s0px=1.16503 s0slot=5 s0imb=1 s1px=1.16508 s1slot=118 s1imb=0
sel=0 r0=1.48 r1=1.38 liveSl=1.16503 livePass=1; SIDE1X_STOPREF
bar=2026.08.28 16:20 dir=SHORT entry=1.16430 liveStop=1.16503
ruleStop=1.16508 ruleSlot=118 ruleImb=0 liveTp=1.16322 liveR=1.48
livePass=1; SLEXT481 fields=17 bar=2026.08.28 16:20 site=S5 dir=SHORT
ladOriginPx=1.16430 ladOriginBarTime=2026.08.28 16:25 ladOriginSite=S5
ext1Defined=1 slExt1=1.16508 ext1Slot=118 ext1BarTime=2026.08.28 06:30
ext1Imb=0 deepestExt=27 (seps -/-999/-999/-/0).
A3 seq=13 part=1/3 emitSeq=13 barTime=2026.09.08-16:40 dir=-1
entryPx=1.1621299999999999 tpPx=1.1611400000000001
incomingSlRef=1.1637900000000001 liveSel=0 slLive=1.1627399999999999
pxExt1=1.1635900000000001 ext1Defined=1 ext1Imb=2
rLive=1.6229508196718447 rExt1=0.6780821917805907 gateConst=1
A3 seq=13 part=2/3 emitSeq=13 wouldGate=0 vetoStateAtSite=-
sessionUseAtSite=- ext1Slot=91 ext1BarTime=2026.09.08-09:05 s0slot=4
s0imb=1 s1slot=91 s1imb=2 ladOriginPx=1.1621299999999999
ladOriginBarTime=2026.09.08-16:45 ladOriginSite=S5 extSideOk=1
A3 seq=13 part=3/3 emitSeq=13 extDistPts=146
rawNumLive=0.00098999999999982435 rawDenLive=0.00060999999999999943
rawNumExt1=0.00098999999999982435 rawDenExt1=0.0014600000000002389
wouldAdopt_monotone=1 actualGate=1 emitSeq=13
currentPrice=1.1621299999999999 s0px=1.1627399999999999 s1px=1.1635900000000001
ladOriginStamp=2026.09.08-16:40
A3 corroboration (this segment): SIDE1E_STOPSHADOW bar=2026.09.08 16:40
dir=SHORT s0px=1.16274 s0slot=4 s0imb=1 s1px=1.16359 s1slot=91 s1imb=2
sel=0 r0=1.62 r1=0.68 liveSl=1.16274 livePass=1; SIDE1X_STOPREF
bar=2026.09.08 16:40 dir=SHORT entry=1.16213 liveStop=1.16274
ruleStop=1.16359 ruleSlot=91 ruleImb=2 liveTp=1.16114 liveR=1.62
livePass=1; SLEXT481 fields=17 bar=2026.09.08 16:40 site=S5 dir=SHORT
ladOriginPx=1.16213 ladOriginBarTime=2026.09.08 16:45 ladOriginSite=S5
ext1Defined=1 slExt1=1.16359 ext1Slot=91 ext1BarTime=2026.09.08 09:05
ext1Imb=2 deepestExt=29 (seps -/-999/-999/-/0).
A2 seq=8 part=1/3 emitSeq=8 barTime=2026.09.04-10:35 dir=-1
entryPx=1.16265 tpPx=1.1601669817100149
incomingSlRef=1.1637900000000001 liveSel=0 slLive=1.16289 pxExt1=1.16299
ext1Defined=1 ext1Imb=2 rLive=10.345909541603788
rExt1=7.3029949705442476 gateConst=1
A2 seq=8 part=2/3 emitSeq=8 wouldGate=1 vetoStateAtSite=-
sessionUseAtSite=- ext1Slot=13 ext1BarTime=2026.09.04-09:30 s0slot=1
s0imb=2 s1slot=13 s1imb=2 ladOriginPx=1.16265
ladOriginBarTime=2026.09.04-10:40 ladOriginSite=S5 extSideOk=1
A2 seq=8 part=3/3 emitSeq=8 extDistPts=34
rawNumLive=0.002483018289985095 rawDenLive=0.00024000000000001798
rawNumExt1=0.002483018289985095 rawDenExt1=0.00034000000000000696
wouldAdopt_monotone=1 actualGate=1 emitSeq=8 currentPrice=1.16265
s0px=1.16289 s1px=1.16299 ladOriginStamp=2026.09.04-10:35
A2 corroboration (this segment): SIDE1E_STOPSHADOW bar=2026.09.04 10:35
dir=SHORT s0px=1.16289 s0slot=1 s0imb=2 s1px=1.16299 s1slot=13 s1imb=2
sel=0 r0=10.35 r1=7.30 liveSl=1.16289 livePass=1; SIDE1X_STOPREF
bar=2026.09.04 10:35 dir=SHORT entry=1.16265 liveStop=1.16289
ruleStop=1.16299 ruleSlot=13 ruleImb=2 liveTp=1.16017 liveR=10.35
livePass=1; SLEXT481 fields=17 bar=2026.09.04 10:35 site=S5 dir=SHORT
ladOriginPx=1.16265 ladOriginBarTime=2026.09.04 10:40 ladOriginSite=S5
ext1Defined=1 slExt1=1.16299 ext1Slot=13 ext1BarTime=2026.09.04 09:30
ext1Imb=2 deepestExt=32 (seps -/-999/-999/-/0).

## Mandatory-findings ledger (P042, gradeable subset)

- 7 TP_ELECT fire rows of 11: 7 fire (listed above) + 4 non-fire
  (08-27 17:00 R0.35; 08-27 18:50 R0.18; 08-31 15:05 R0.34; 09-04 09:25
  R0.63); wrapper SIGNAL block carries all seven table-bar alerts. PASS.
- A1 record-at-C + self-consistency: rExt1=1.38362 present, wouldGate=1
  sign-consistent, leg-(a) bit-exact, leg-(b) inside [1.35443, 1.41558].
  PASS both legs.
- A2 record-at-C (slot 13, archive-precision price): pxExt1=1.16299,
  slot=13, rExt1=7.30299, leg-(a) bit-exact, zero TP_ELECT at its bar.
  PASS (NON-R-graded by contract, provenance only).
- A3 record-at-C + shadow self-consistency: rExt1=0.67808, wouldGate=0
  sign-consistent, leg-(a) bit-exact, leg-(b) inside [0.66667, 0.68966].
  PASS both legs.
- gateConst=1 on all rows: PASS. actualGate: PASS (transported; 1 on the
  three livePass=1 differing rows, equal to wouldGate on all ten
  triple-identical rows).
- Cap non-occurrence + terminal exactly-once: PASS (zero type-CAP, zero
  BSAVE_FAIL, one Test-passed, one connection-closed).

## Grade

EXECUTION=PASSED. FULL-ROW ACCEPTANCE=PROVEN (13/13 records, 38/38 keys,
emitSeq 1..13 contiguous with 3/3 parts each, stamp 13/13, leg-(a) 13/13
bit-exact both legs, archive leg-(b) 7/7 in both double and exact
BigInteger forms). The v30 contract's FAILED-transport grade does not
engage: transport is whole on every part. No falsifier tripped in the
gradeable region.

## Adversarial disclosures (observations, never findings against the run)

- Wire rExt1 at display precision vs archive table R: seq11 prints 2.34
  against archive 2.35, seq12 prints 2.52 against archive 2.51. Both sit
  inside their +-1pt exact-rational intervals (bounds above); the class is
  the packet-absorbed archive-entry-vs-wire-currentPrice difference
  (P028), never a recompute miss (leg-(a) bit-exact on both rows).
- 176 SLIMBWALKF lines sit exactly at the 537 journal-line cutoff
  (sink-truncated legacy diagnostic family). No graded family touches the
  cutoff (STOPRESOLVE max 525, SIDE1E/X ~200, TP_ELECT/SIGNAL short,
  TPCENSUS below cutoff). No finding depends on a cut line.
- File-wide 'CAP' hits = 2, both the substring inside 'CAPTURED' in
  O1DISC NO_LOOP_CAPTURED reason text (unrelated family); type=CAP
  STOPRESOLVE count is 0 by both patterns.
- The 2 'testing of' lines are the standard tester-announcement plus
  core-start pair of one run (ER 12:53:24 + FE 12:53:37), not a restart.

## Owed forward

- Triple-key spent here (Luna key + his Astra-waiver + run word). EA
  stands 9C79FC1E uncommitted. No build, no second run, no commit on this
  turn (session-prompt constraint).
- The v193 round is ruled (Luna ACCEPT-class with advisories); this result
  is the terminal artifact of the RECON48 block. Next moves need his word
  (transport) or a fresh council packet (any new direction).
