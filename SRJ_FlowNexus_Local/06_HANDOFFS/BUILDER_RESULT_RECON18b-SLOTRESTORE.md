# BUILDER RESULT RECON18b-SLOTRESTORE (verdict #8 standing order) — PASS, commit dormant

Restoration build EA `4FCAF2154473A689C5BBB922AF876C798688326DB55875A88D90493CE0482834`
(426922 B, UNCOMMITTED until §5); FlowLogic `3606BFB4…25911` unchanged;
both compile 0 errors / 0 warnings (`06_HANDOFFS\T162_SLOTRESTORE_*COMPILE.log`).
RECON18b-SLOTRESTORE DONE=PASSED 20:42:15 (Test passed in 0:59:20.496;
563338 ticks, 3168 bars). Archive
`06_HANDOFFS\RECON18b-SLOTRESTORE_JOURNAL.log`: SHA256
`9671013CAD85CDE20C50CBEE18E02866561F242F29536EB2BE9625A37AE27A19`,
18596 lines, bounds [135340..153935] contiguous from RECON18, purity
1/4/481. Tabulation `06_HANDOFFS\RECON18b-SLOTRESTORE_TABULATION.txt`;
joins `06_HANDOFFS\RECON18b_GATE_JOIN.txt`. Only delta vs the run-A build:
SLEXT45 classifier (occupancy retired, slot-reach adopted, slot/age
binding restored); E46–E48/E50 byte-untouched.

## 1. Slot gate: PASS exactly

In-run SLEXT45 slots read 168/408/21/817 with barTimes
2026.09.03 20:35 / 2026.09.03 05:55 / 2026.09.07 14:55 / 2026.09.03 20:35
and ages 167/407/20/816 — byte-matching RECON17's rows. The regression
is closed; E49 does not return unruled.

## 2. Split prediction: PASS as declared

`todayStatus ON_LADDER=6 OFF_LADDER=2 EXT_NONE=2`, `extStatus
EXT_DEFINED=10`, OCCUPIED_NOMATCH token count 0 (retired with the
predicate). Label assignment matches the verdict table: OFF_LADDER =
09.04 10:35 (168) + 09.08 16:40 (817, VACUOUS_COVER); EXT_NONE =
09.04 15:55 (408) + 09.07 16:40 (21). `refSlotAgeBars` on all 10 rows,
old token 0; seventh FRAME_NOTE convention retained.

## 3. Inert join re-verified: PASS

Vs RECON11b: SLIMB/WALKOB/WALKFR 481/481 ×3 + SLIMBR 10/10, zero
mismatch, zero misses either direction. Vs RECON17: slToday 10/10
byte-identical — dormancy maintained (`InpAdoptExt1=false`; not one new
read on any live path). E46 still halts (rows=2 halts=2, resids −7/+85
unchanged — untouched by this build, P-ADOPT-1 stays closed).

## 4. Identities verbatim (all RECON18 values reproduce)

Four-signal set R 2.43/2.56/1.76/1.25, SIGMAP 4/4; WS161 3168/3168/205/0;
SLIMB/WALK 481s, sideV 0/0, SLIMBR 10 STALE 0; MATCH 2/NOMATCH 3;
ORDER 6/6/4; SLEXT1 6/1/2/1, HALT 0; FINAL 1/0 + 10:35; DECISION 10/4
@1.00; MTEXIT 4, MTLIFE 4, MTFLIP 1; N1EQUALS 28/26/0/3; TABLE_NOTE +
21:00 anchor; width trunc 0; spot 157; SLEXT481 481=432/39/10, HALT 0;
E43 10/10/10; E47 118/118; E48 n=481 dis=8 all S2POLL; proxy 4/0/3/3;
SLMEMO 471/118/589; SUPPRESSED 152.

## 5. Commit

Standing order executed: regression fixed (§1), join re-verified (§3) —
committed DORMANT as Rev075 (canonical 4FCAF215 + records + tag
Task162-T162SLOTRESTORE, local only, NO push). RECON17 stays the frozen
baseline of record; this build rides the tree dormant through the origin
investigation. Run-B delta table stays suspended (not re-derived).
P-ORIGIN-1 entry condition 1 now MET on disk (Sep-8 Dukascopy feed-tag +
swing-rule yes with 9:40/16:20 second swings, `BUILDER_FINDING_SLDEF5_
FIVEEXAMPLES.md` Addendum 4, pre-documented in Addendum 2); packet text
still owed from council — no origin build moves until it issues.
