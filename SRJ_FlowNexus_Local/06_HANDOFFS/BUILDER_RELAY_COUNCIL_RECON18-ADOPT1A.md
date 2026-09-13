# BUILDER RELAY TO COUNCIL v9-fresh (P-ADOPT-1 run A — BLOCKED on E46)

Fresh-session relay: paste whole to council. It answers verdict #7
(RECON17-ACCEPT + P-ADOPT-1 issuance) and carries everything a new session
needs — no prior turns assumed. Same measurements as v9; no new run.
Full record (read alongside, not instead):
`06_HANDOFFS\BUILDER_RESULT_RECON18-ADOPT1A.md`.

## 1. Project and where we are

EURUSD M5 strategy as MQL5 (EA + FlowLogic indicator), alert-only, pilot
window 8/26–9/10 (3168 bars / 563338 ticks). Seven-session arc converging
the stop-loss definition: the operator's "exactly two swings away" is now
mechanized as `rungExt == 1` — the second outward extremity swing from the
entry bar, anchor-free, no imbalance term, no carve-out. Evidence: five
HAND examples (four fired signals reproduce at resid 0 over rungExt, plus
Sep-4 10:35 SHORT recovered: R 1.21, would-have-taken on correct Dukascopy
data), plus a Sep-8 SHORT pair (10:10 @1.16205 SL 1.16258; 17:00 @1.16220
SL 1.16274 — both HAND, both unmapped: no S5 rows at those bars, EA side
LONG at both). Standing rules: Dukascopy feed always; every HAND figure
carries a feed tag; take iff R >= 1.0; rung index derived, never key
(identity is slot+barTime+px+imbCode).

Verdict #7 accepted RECON17 (14/15 + gate-8 report) and issued P-ADOPT-1:
one packet, two runs. Run A = print-only probes (E46–E49) + the adoption
code present and dormant behind firmware `ADOPT_EXT1=false` (E50).
Run B = the first selection change (`ADOPT_EXT1=true`), prediction-graded
against a declared delta table (four firings move R 2.43→2.43 / 2.56→1.66
/ 1.76→1.76 / 1.25→2.34, plus NEW Sep-4 10:40 SHORT R 1.21; CQD 906,
WS161, SLMEMO 471/118/589, SUPPRESSED 152 and the four-signal set frozen).
E46 carries the packet halt: either Sep-8 forced-side residual beyond
1 point kills the packet and run B never launches.

## 2. Baselines and the run-A build

Frozen: RECON17, EA `6ACDF3B8EB03026CB96C45FE1F0D31C9F426615F739DC7DA07867F9E87961DBE`
(413224 B, local commit + tag, no push); FlowLogic
`3606BFB480A34B5ED4357588DDAFDFE8F7DF2224DA34C6A220EA49F506725911`
unchanged since RECON9. Run-A build (UNCOMMITTED): EA
`3FDBC228438E8EE01E417DD1C8670C467F5AC13B59F7362A64FC9CAED9AD0D4E`
(426291 B), both compile 0 errors / 0 warnings. Run-A deltas, all
print-only except E50-dormant: E46 forced SHORT-side ext-1 at the two
hardcoded Sep-8 bars with the site origin, graded vs HAND/Dukascopy, HALT
row past 1pt; E47 fresh-vs-memoised comparison row on every SlRefMemo HIT
(118 expected, all agree); E48 alternate-origin ext-1 at every
ComputeSlReference invocation (S5↔eval-close, S2POLL/S3ARM↔strict
next-open), disagreers print, FINAL counts; E49 OFF_LADDER/EXT_NONE by
occupancy + `noneAgeBars`→`refSlotAgeBars` on both classes + seventh
FRAME_NOTE convention (origin per site); E50 `InpAdoptExt1=false` wiring
at the S5 site and both memo return paths (mode untouched).

## 3. Run-A results (RECON18-ADOPT1A DONE=PASSED 19:21:07, Test 0:54:03.105)

Archive `06_HANDOFFS\RECON18-ADOPT1A_JOURNAL.log` (SHA `5BDCA919…`, 18597
lines = 135339−116742 exactly, bounds [116743..135339] contiguous from
RECON17, purity 1/4/481). Tabulation
`06_HANDOFFS\RECON18-ADOPT1A_TABULATION.txt`; joins
`06_HANDOFFS\RECON18_GATE_JOIN.txt`.

E46 HALTS THE PACKET (`SLSEP846_FINAL rows=2 halts=2`): 10:10 forced
1.16251 vs 1.16258 → resid −7, barDiff −4; 17:00 forced 1.16359 (slot 95,
09:05 bar, imb 2) vs 1.16274 → resid +85, barDiff −95. EA side LONG both
bars (opposed-side debt, disclosed). Mechanism (finding): the probe uses
the site origin (eval-close 1.16190 / 1.16241, above his entries 1.16205 /
1.16220); the extremity filter is origin-dependent — swings protective vs
his entry drop out vs the higher close, shifting the count (at 17:00 his
stop reads as the count the code's origin excludes). Same family as E48.
Run B does NOT launch. Nothing committed, nothing reverted; RECON17 frozen.

E47 PASSES with a finding: `SLEXT47_FINAL rows=118 agree=118`
(bit-identical def/px/slot/bt/imb on every HIT); `SLMEMO_CENSUS
computes=471 hits=118 demands=589` verbatim; E43 probe separately
`probed=10 hits=10 agree=10`. Finding: S5-membership join is ATS5=2 /
NONS5=116, not the predicted 10/108 (only 2 HIT events share a barTime
with SLIMBR rows). Agreement (the gate) is 118/118 either way.

E48 REPORTED, no halt ordered: `SLORIG48_FINAL n=481 disagree=8 nS5=10
disS5=0 nS2POLL=432 disS2POLL=8 nS3ARM=39 disS3ARM=0 altNA=0`. All 8 at
S2POLL (px+slot+bt, 3 with imb, 2–27 pts); S5 10/10 and S3ARM 39/39 agree
across origins. Rows verbatim in the tabulation.

E49 NOT REPRODUCED (builder miss, owned): the swing-buffer witness reads
all four xT-NONE rows (09.04 10:35, 09.04 15:55, 09.07 16:40, 09.08 16:40 —
same four bars as RECON17) as occupied → `OCCUPIED_NOMATCH=4`,
`OFF_LADDER=0`, `EXT_NONE=0`, age −1 throughout; the slot evidence
regressed to −1/− (RECON17 carried 168/408/21/817). Off-run constructions,
no build moved: ladder-shift membership 0/4 (status quo ante, not 2/2);
slot-reach 2/2 — {10:35: 168>150, 09.08: 817>351} beyond ladder reach vs
{15:55: 408<571, 16:40: 21<89} within reach but skipped (a swing value
sits at all four slots, yet no rung — the within pair is ladder-skipped,
frame-defect family); the beyond pair is the known persisting Sep-3 20:35
OB extreme. Rename half LANDED: `refSlotAgeBars` on all SLEXT1 (10/10)
and SLEXT45 (10/10) rows, old token count 0; seventh FRAME_NOTE
convention printed.

E50 dormant PROVEN: SLIMBR slToday 10/10 byte-identical vs RECON17;
eleventh inert join vs RECON11b (SLIMB/WALKOB/WALKFR 481/481 ×3 + SLIMBR
10/10, zero mismatch, zero misses). With `false`, not one new read
executes on any path.

Identities verbatim: four-signal set (R 2.43/2.56/1.76/1.25, SIGMAP 4/4);
WS161 3168/3168/205/0; SLIMB/WALK 481s, sideV 0/0, SLIMBR 10 STALE 0;
SLEXT1 verdicts 6/1/2/1, SLEXT6HALT 0; ORDER 6/6/4; DECISION 10 rows fired
4 @1.00 compiled_default; MTEXIT 4, MTLIFE 4, MTFLIP 1; N1EQUALS 28/26/0/3;
news table digest + 21:00 anchor, in-window NFP 1, memberBars 3/3,
overlaps 0, flats 0; width trunc 0 all classes; proxy 4/0/3/3;
SUPPRESSED 152; spot 157; SLEXT481 481=432/39/10, Sep-8 REDUNDANT resids
−146/−87 unchanged.

## 4. Four asks

1. E46 halt stands on measured values (−7/+85): is run B dead, or do you
   re-scope the probe (his-entry origin? sub-pip absorption for 10:10)?
2. E48: are the 8 S2POLL origin disagreements material for run B's
   memo-path adoption (which resolves at the site origin)?
3. E49: rule the 2/2 predicate mechanically (slot-reach 2/2 with the
   OB-extreme pair identity? or another construction?) plus which pair
   takes which label — no rebuild until ruled.
4. E47 split corrected 10/108 → 2/116: noted, no action unless a future
   adoption packet re-uses the prediction.
