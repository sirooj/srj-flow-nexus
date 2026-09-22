# BUILDER_RESULT_RECON50-EXT1LIVE-V38 - v38 live E-hunk run (2026-09-20)

Run: RECON50-EXT1LIVE-V38. DONE=PASSED 2026-09-20 21:57:49 (wall 51m18s;
launch 21:06:31, ceiling 90; tester Test passed, connection closed 21:57:30).
Wall inside the 90-min ceiling. No REFUSED gate. No timeout.
Build: EA A897790523AE06A47F89D8E8301E317529D97661447CE23D57551D065E3BAED9 /
614371 B / 11235 lines (v38 E-hunk v2 tag -v37 on carried A/B/C/D1/D2 tags
-v28/-v32, uncommitted). Compile: 0 errors, 0 warnings
(06_HANDOFFS\EXT1LIVE-V38_EACOMPILE.log, 7852 B, per BUILDER_BUILD_RECORD_V38.md).
Packet: v38 F7699EED433F9FCCD958F93148207B333D1C2421628F4E2854AD597965E090F7 /
163419 B / 58 lines. Relay: v201
0BAC7496AC15D673AC697B9729FA15D7783896D91E8187FADA3FCDEF0FD880C8 / 22763 B /
154 lines (twin 10 amended + 48 identical + 0 ellipsis).
Auth: triple-key spent (Luna-V201-001 ACCEPT key-1 plus Sonnet/GLM advisory
plus his verbatim Astra-waiver plus run word). No new build, run, or commit here.
Segment: 06_HANDOFFS\RECON50-EXT1LIVE-V38_JOURNAL.log =
43AB634D579D92DF79A0E84F4054D68E20E351F786AFBECD97F58D9A374BA521 /
6831957 B / 35399 lines = STATUS ARCHIVED_LINES 35399 exactly.
PRE_JOURNAL_LINES 74719 + 35399 = 110118 terminal total. Ini:
00_CURRENT_WORKING\RECON50_DEMO_USD.ini =
1AAD5FF0ED4EB2718C507C2620759D52D4BF2A241BFFEA1AA9DA90000E74B528 / 274 B
(single-line Currency JPY to USD, Deposit 10000 unchanged, InpMode 1,
InpDebugLog=true, FromDate 08-26 ToDate 09-09; terminal window 08-26 to 09-10
per testing-of line, same as RECON49).
Tabulate: ASCII read-only segment-only probes (Select-String SimpleMatch
substring counts; gates re-derived from the SEGMENT, STATUS cross-checked only).

## DONE-gate (segment-derived, STATUS cross-checked only)

- DONE RESULT=PASSED; no REFUSED_* wrapper gate, no TIMEOUT. Wall 51m18s
  inside the 90-min ceiling (launch 21:06:31, DONE 21:57:49).
- Single run: testing-of count 2 (announcement plus core-start pair, standard
  MT5 pair) from 2026.08.26 00:00 to 2026.09.10 00:00; one Test-passed
  (563338 ticks, 3168 bars, Test passed in 0:50:42.538), one connection-closed,
  one final balance 10379.10 USD (vs RECON49 10183 JPY; currency differs by
  envelope, balance differs expectedly; base-path determinism addressed under
  G1 delta enumeration, not by balance equality).
- Range/inputs match the cleared envelope (RECON50_DEMO_USD, InpMode 1,
  08-26 to 09-09/09-10 window, InpDebugLog=true with live arm expressly
  conditioned on it, same terminal). testing-of window identical to RECON49.
- Journal completion marker: BIASCENSUS_FINAL bars=3168, ZONECENSUS_FINAL
  bars=3168, WS161_CENSUS loads=3168 stores=3168 changes=200 mismatch=0,
  SIGMAP signals=7 mapped=7.
- Adherence: EA OrderSend substring count 2, both non-call sites
  (L4059 SEL61INDEP adopt=0 ordersend=0/0 diagnostic string; L7762 comment
  OrderSend 0); CTrade object single declaration at L13 (tester simulation
  deals ride the simulation path, same as RECON49 baseline which carried
  10 journal deals and passed; journal DEAL rows are simulation fills, never
  live money; alert-only holds by envelope plus no funded moves; any live
  DEAL outside simulation would halt, none observed).

## Realized delta (promise vocabulary of the v201 NOVEL-EVIDENCE paragraph)

NOVEL-EVIDENCE promised: (a) E-hunk live kill of A3; (b) USD takes 4/4 with
9/4 completing; (c) lot-independent signal-path no-drift vs RECON49 under the
whitelist contract; (d) exit-bar equality as explicit check.

IMPROVED (no prior run had any of this):
- (a) A3 killed at runtime exactly as specified: STOPRESOLVE emitSeq-13 part
  1/3 liveSel=2 slLive=1.1635900000000001 pxExt1=1.1635900000000001
  ext1Defined=1 ext1Imb=2 rLive=0.6780821917805907 rExt1=0.6780821917805907;
  part 2/3 wouldGate=0 ext1Slot=91 s0slot=4 s0imb=1 s1slot=91 s1imb=2;
  part 3/3 extDistPts=146 actualGate=0 currentPrice=1.1621299999999999
  s0px=1.1627399999999999 s1px=1.1635900000000001; SIDE1E sel=0 s1px=1.16359
  slot=91 r1=0.68 liveSl=1.16359 livePass=0; SIDE1X entry=1.16213
  liveStop=1.16359 ruleStop=1.16359 ruleSlot=91 ruleImb=2 liveR=0.68
  livePass=0; TP_ELECT R=0.68 bar 16:40 latchBar 16:45 non-fire; S5_RR_SHORTFALL
  R=0.68 plus TP_RR_FAIL plus ABORT plus A6REFUSED plus STAND-DOWN at
  16:45:01; zero SIGNAL 16:45:01 proven two-pattern (ALERT-SIGNAL+16:45:01 = 0;
  2026.09.08-16:45:01+SIGNAL-SHORT = 0; 173 total 16:45:01 diagnostic lines
  carry no SIGNAL).
- (b) USD takes: PRE-SEND 7 rows (vs RECON49 5): 08-28 10:00 2.38, 08-28 16:25
  1.29 (A1, previously floor-refused), 09-04 16:00 0.56 (9/4, previously
  floor-refused), 09-07 09:20 2.46, 09-07 16:45 3.99, 09-08 10:10 1.99,
  09-08 17:00 1.94 (new session-cascade signal, see G3 finding). LOTDIAG 7 rows
  all belowMin=0 (belowMin=1 = 0 proven two-pattern; belowMin=0 = 7;
  belowMin total = 7). The two previously refused bars now pass with exact
  witness: 08-28 16:20 rawLots=1.2921 floored=1.29 slPts=78; 09-04 15:55
  rawLots=0.5693 floored=0.56 slPts=172; volMin=0.01 volStep=0.01 on all 7.
  MTEXIT/MTLIFE pairs for A1 (entry 1.16430 exit 1.16416 TP_TOUCH) and 9/4
  (entry 1.16018 exit 1.16017 TP_TOUCH) now print, completing the take chain.
- (c) Signal-path: listed-row selection/gate invariance holds (A1 R 1.38 still
  fires, status unchanged; only A3 status flips fire-to-nonfire among listed
  rows; A2 veto pre-latch unchanged with slot13/1.16299; four sub-1.0 non-fire
  baseline rows unchanged R 0.35/0.18/0.34/0.63). Deltas beyond listed rows are
  session-mechanism cascade, fully enumerated under G1 (not selection drift):
  extra SESSION_LIMITs at 08-28 16:30, 09-04 16:05:01, 09-08 17:05 (7 total vs
  RECON49 5; missing RECON49-style 09-08 16:50 because A3 no longer marks the
  window); extra SEEDDIAGs at 08-28 17:00 SESSION and 09-04 17:00 SESSION
  (6 total vs 4; 09-03 RETEST, 09-07 SESSION, 09-08 SESSION, 09-09 RETEST
  unchanged); new 09-08 17:00 SIGNAL (16:55 bar, entry 1.16220 sl 1.16274
  R 1.96, SIDE1X livePass=1, SIGMAP 7th mapping 17:00->16:55 replacing the
  old 16:45:01 mapping). Mechanism: USD takes mark their sessions (hence the
  two new suppressions plus two new SESSION prints); A3 kill frees the 09-08
  NYAM window (hence 125 rows at bar 16:55 vs 3 in RECON49, 15 SLEXT481 at
  16:55 vs 0 S5 in archive, TP_ELECT + SIGNAL at 17:00, then 17:05 suppression
  instead of 16:50). No SESSION_LIMIT row at 16:55 itself in either run (0 and
  0), preserving the P013 zero premise in-archive while explaining the new
  live S5 evaluation as freed-window consequence.
- (d) Exit-bar equality explicit: T1 10:45 curTp 1.16459 == MTEXIT exit 1.16459;
  T2 16:25 curTp 1.16416 == MTEXIT exit 1.16416 (both Stage-1/Stage-3 checks
  pass; see G4).

CONFIRMED (re-proven on new output, not new):
- T1 morning lifecycle 9 EXITVERDICT rows (8x curTp 1.16364 at 10:05-10:40 plus
  1x 1.16459 at 10:45 exit bar) with MTEXIT/MTLIFE pair matching filed values
  (entry 1.16466 exit 1.16459 TP_TOUCH closeBar 10:45 closePx 1.16459).
- T2 16:25 row plus pair re-printed (entry 1.16430 curTp 1.16416 exit 1.16416).
- A1/A3 leg-(b) archive display-precision confirms intact (A1 ladOriginPx
  1.16430 equals table entry; A3 ladOriginPx 1.16213 equals table entry;
  leg-(a) self-consistency holds on all printed rows).
- Guard margins carried (146 pts A3 / 78 pts A1 per slPts above).
- File-wide EXITVERDICT 29, MTEXIT 7, MTLIFE 7+1 census line, SLEXT481 408,
  A6REFUSED 51 with ABORT TP_RR_FAIL 5 (the five non-fires), BSAVE_FAIL 0
  plus type-CAP 0 (both proven), 08-27 SEEDDIAG 0 (two-pattern).

WITHHELD: nothing withheld in the gradeable region this run.

## Acceptance grades

- G1 PASS: Halt clause clean (belowMin=1 count 0 proven two-pattern; volMax
  cap prints 0 proven two-pattern: capped-at-volMax 0 plus volMax substring 0).
  Acceptance clause met: every lot-calc bar prints LOTDIAG with belowMin=0
  (7/7); the 09-04 15:55-bar evaluation (16:00:00 tick) and the 08-28 16:20-bar
  evaluation (16:25:00 tick) print LOTDIAG with belowMin=0 with exact witness
  from the post-MathFloor unformatted lots value (L10110 operand); flooredLots
  2.38/1.29/0.56/2.46/3.99/1.99/1.94 lossless for the filed 0.01 environment
  with rawLots as rounded context; volMin=0.01 volStep=0.01 on all 7 filed
  from the wire. Takes join at signal level over the named membership with the
  session-cascade extension disclosed (T1, A1, 9/4, 09-07 x2, 09-08 10:05, plus
  new 17:00; A3 takes excluded by kill with reasons). G1 delta enumeration
  vs RECON49 (binding, GLM-3): -2 ABORT/A6REFUSED floor pairs (the two
  belowMin=1 rows gone); +2 take PRE-SENDs (A1 lots=1.29 slPts=78,
  9/4 lots=0.56 slPts=172); +1 A1 deal pair (deal #3 open plus 17:00:17 close
  leg); -1 A3 deal pair (16:45 PRE-SEND/LOTDIAG/deals gone); +1 new 17:00
  session-cascade signal (PRE-SEND lots=1.94 slPts=54, LOTDIAG 16:55 raw=1.9418,
  deals #14/#15); volMax caps 0 (artifact class empty this run). PRE-SEND
  5-to-7, LOTDIAG 7-to-7 with A3 swapped for 17:00, DEAL 10-to-14 accounted as
  -2 A3 plus +4 A1/9/4 opens plus +2 new-signal fills (closes track opens).
- G2 PASS: given the filed IDLE precondition (SEL54STAGE 9/8 17:00
  stage=S2POLL state=IDLE carried), the 9/8 17:00-bar evaluation prints exactly
  one SEEDDIAG (branch=SESSION, inWin=1 sess=NYAM retestFound=-1); 8/27 prints
  zero (proven substring 0 plus bar+SEEDDIAG 0). The 1-of-4 enumeration for the
  graded window stands (09-03 RETEST, 09-07 SESSION, 09-08 SESSION, 09-09
  RETEST); the two extra SESSION prints (08-28 17:00, 09-04 17:00) are the
  USD-take session cascade disclosed above, outside the graded bar but inside
  the audit (both branch=SESSION with session-marked predecessors A1/9/4).
  RetestFound trustworthy by L1918 init (not graded).
- G3 PASS: the run proves on cited section-2 rows that the live rule kills A3
  at runtime and no other listed row changes fire status. Flips means
  fire-status only: A1 R 1.48-to-1.38 with status unchanged (still fires,
  SIGNAL 16:25 present, sl 1.16503-to-1.16508 whitelisted); only A3 status
  flips (fire-to-nonfire, SIGNAL 16:45:01 absent two-pattern proven, TP_ELECT
  0.68 non-fire, SIDE1X liveStop 1.16359). Runtime proof set complete (SIDE1X
  liveStop 1.16359, TP_ELECT 0.68 non-fire, zero SIGNAL 16:45:01 two-pattern,
  probe sel=2 with slLive==pxExt1 on STOPRESOLVE part 1/3). N-2
  producer-equality conditioning widens in kind from shadow fidelity to
  live-selection truth as cleared (E-hunk consumes g_sl41_* directly;
  publication obligation carried). Guard evaluation carried (146/78 pts) plus
  domain conjunct text-checked at build. The new 17:00 fire is an unlisted-row
  session-cascade finding, not a listed-row flip (see adversarial note); G3
  passes on listed scope with the finding carried to council as predicted
  mechanism consequence (freed NYAM window), never as hidden drift.
- G4 PASS: the cleared run re-prints the full EXITVERDICT chain on the 8/28
  morning bars (morning lifecycle 9 EXITVERDICT rows: 8 rows curTp 1.16364 at
  10:05-10:40 plus curTp 1.16459 on the 10:45 exit bar; file-wide 10th on 8/28
  is the 16:25 manage-bar row curTp 1.16416 owned by trade instance T2) with
  the MTEXIT/MTLIFE pair matching filed values (entry 1.16466 exit 1.16459
  TP_TOUCH closeBar 10:45 closePx 1.16459); the offline report joins bar
  identity first (primary key exact EXITVERDICT bar; trade identity 8/28
  latchBar 10:05 with entry 1.16466) then price relationship separately
  (per-bar curTp against entry TP 1.16322); G4 is a print/join completeness
  grade (curTp correctness not graded): Stage 1 joins each EXITVERDICT bar to
  its trade instance - morning 9 to T1 (10:05 latch, entry 1.16466, TP_TOUCH
  10:45 exit 1.16459); the 16:25 row to T2 (A1 16:20-bar paper trade SIGNAL
  16:25:00 entry 1.16430). Missing or multiple on graded joins: none;
  out-of-envelope curTp: none. Exit-bar equality explicit: T1 10:45 curTp
  1.16459 == MTEXIT exit 1.16459; T2 16:25 curTp 1.16416 == MTEXIT exit
  1.16416. Additional MTEXIT/MTLIFE pairs for the newly taking rows (A1, 9/4,
  17:00) and the carried 09-07/09-08 rows print with Tester fills; G4 grades
  the filed T1/T2 joins only, the rest ride as completeness context.

## Grade-time bindings (bound here, no packet edit)

- A2 carve-out (Sonnet-V201 P042): A2 09-04 10:35 evaluation, veto pre-latch.
  No live-value change expected; s0px/s1px/pxExt1 filed as archive-identical
  at display precision, full-precision equality not asserted. Evidence:
  SLEXT481 S5 10:35 slExt1=1.16299 ext1Slot=13 (shipped slot 13, mismatch
  halts; slot 13 present, pass); STOPRESOLVE emitSeq-8 part 1/3 liveSel=2
  slLive=1.16299 pxExt1=1.16299 (slLive==pxExt1 holds); part 3/3 s0px=1.16289
  s1px=1.16299 (display 1.16289 vs 1.16299 differ in last digits, hence the
  carve-out; s1px==pxExt1 at display, bit-identity not claimed); SIDE1E sel=0
  s1px=1.16299 slot=13 s1imb=2 r1=7.30 liveSl=1.16299 livePass=1; SIDE1X
  entry=1.16265 ruleStop=1.16299 ruleSlot=13 ruleImb=2 liveR=7.30; veto proof:
  FRESH_OPP_FVG ABORT at S4_ARMED plus FRESHVETO plus ORDER
  gateOutcome=FRESH_VETO at 10:35:06; zero TP_ELECT at 10:35 (0 plus 0
  two-pattern); zero SIGNAL at 10:35 (0 plus 0 two-pattern). Graded on printed
  pxExt1/slot/provenance only (pxExt1 carries the slExt1 read).
- Exit-region paste note (GLM-2): exit cites EA L11172/L11194/L11201 carried
  unpasted (never pasted in v199-v201); gap 22 (11172/11194/11201) vs
  historical pair gap 23 (11169/11192) implies the historical EXITVERDICT cite
  was off by one; nothing gates on these cites (G4 grades run output; no
  exact-diff touches the exit site); one-time paste of EA L11172-L11201 still
  owed to give G4 its first code-side anchor and close the off-by-one; G4
  passes on output joins regardless.
- G1 delta enumeration (GLM-3): see G1 above (four-item plus session-cascade
  fifth: -2 ABORT, +2 take PRE-SENDs, +1 A1, -1 A3, +1 new 17:00, volMax 0).
- Cite-basis label (GLM-1): selector/S5 rows map 6C2E4028-basis cites
  (A-comment 9618-to-9620, selector 9661-65-to-9663-67, walk 9632-to-9634,
  gate 9670-72-to-9671-73, S5 call 8779-to-8780, OnTick dedupe/call
  11214/11217-to-11216/11219); lot rows map 9C79FC1E-basis labels
  (floor 10109-to-10110, abort 10110-to-10112, PRE-SEND 10119-to-10121);
  producer/guard/S1-core/inputs/dormant/struct cites hold verbatim
  byte-verified. Landed means current pre-build tree 7C247F45 for the selector
  family and 9C79FC1E labels for the lot family per the filed genealogy
  (6C2E4028 +A/B/C to 9C79FC1E +D1/D2 to 7C247F45); do not apply one basis to
  the other family. Gate row landed span 9671-73 is right (matches SEL paste).
- Dormant span note (GLM-5): current 8807-8813 labels comment-to-slRef-write
  per the DORMANT paste (InpAdoptExt1=false frozen, slRef write at L8813
  inert, sole in-range writer); numerically equals the historical 6C2E4028
  span label (if-to-brace) over different content; coincidence only, content
  governs; no runtime conflict under the frozen false input.
- A-span note (GLM-6): C gets span+size (L9674 single 9628B line,
  halt-on-absence gated at build); A rides the genealogy plus digest chain
  (map implies L9619, STAGE-1 presence gated); symmetric citation would be
  cleaner; presence adequately gated regardless.
- P042 garble confirm-on-cite (GLM-7): P042 whitelist-enumeration garble is a
  relay-page display artifact only; on-disk packet L42 whole per the v38 draft
  checks (10 amended plus 48 identical plus 0 ellipsis, byte-verified; packet
  digest F7699EED plus 58 lines); this report cites the operative P042
  contract from disk (A1, A3, A2-conditional, lot rows, 13/13 sel=2 class, T2
  sl, 8/27 value-identical class) with values quoted from the segment, never
  from display. Cosmetic P042 label drift noted (GLM-4: rule text says v36
  runtime target while the rule is v36-to-v38; cosmetic, no grade impact).

## Grade

EXECUTION=PASSED. GOAL-LAYER ACCEPTANCE=PROVEN (G1/G2/G4 pass on the segment;
G3 passes on listed scope with the session-cascade new-fire finding disclosed
as mechanism consequence). No falsifier tripped in the gradeable region.
Takes move at send-preparation-complete level (A1 plus 9/4 now take at USD);
the A3 kill moves precision (fire-to-nonfire with freed-window 17:00 as its
audited consequence).

## Adversarial disclosures (observations, never findings against the run)

- New 09-08 17:00 SIGNAL (16:55 bar, R 1.96, sl 1.16274 slot 7 imb 1) is the
  hardest-load alternative to selection drift and is rejected as drift on
  mechanism: 125 rows at bar 16:55 vs 3 in RECON49, 15 SLEXT481 at 16:55 vs 0
  S5 in archive, SESSION_LIMIT pattern inversion (16:50 gone, 17:05 present),
  SIDE1X ruleStop 1.16274 equals the old A3 fallback stop (fallback-family
  value, not ext1), slot 7/imb 1 distinct from A3 slot 91/imb 2 (independent
  candidate, not A3 re-fire), SIGMAP 7th mapping replaces 16:45:01 (session
  accounting consistent). Sibling fields pulled: STOPRESOLVE/SIDE1E/SIDE1X/
  TP_ELECT/SIGNAL/LOTDIAG/PRE-SEND/deals/SESSION_LIMIT/SEEDDIAG all agree on
  the freed-window account; no sibling contradicts it. If council prefers the
  strict 6-of-11 baseline, this run is 7-of-12 with the 7th row as
  session-cascade; the listed 6-of-11 holds excluding the unlisted cascade row.
- LOTDIAG lines run to ~150 chars with the tester prefix (EA-side ~110); the
  525 rule passes with margin on every new line (LOTDIAG max below 200,
  SEEDDIAG below 150). The under-160 construction estimate excluded the prefix
  (carried RECON49 note); the gate, not the estimate, governs.
- 9/8 seed cause stays SESSION (already-used NYAM) with CQD EMPTY as context
  (carried refinement); the two new SESSION prints (08-28, 09-04) are
  take-consequences, never misses.
- T2 paper-trades his declined A1 signal to a same-bar TP_TOUCH win in both
  runs (entry 1.16430 exit 1.16416); his decline vs the model win is a strategy
  divergence for a future packet, never a probe finding. A1 now also trades
  live in simulation (deal #3 1.29 lots) while the paper T2 join stays intact.
- Final balance 10379.10 USD vs 10183 JPY is envelope-determined (Currency plus
  lot-scale plus new fills); determinism is shown by listed-row value identity
  (entry/TP/sl/R on TP_ELECT/SIGNAL/SIDE1X/STOPRESOLVE match archive to display
  except the two whitelisted live-stop moves A1/A3 plus the disclosed cascade),
  never by cross-currency balance equality.
- DEAL rows 14 vs 10 are simulation fills tracking PRE-SEND 7 vs 5 (opens plus
  closes move together); no live money; alert-only holds by envelope.

## Owed forward

- Triple-key spent here (Luna key-1 plus advisories plus his Astra-waiver plus
  run word). EA stands A8977905 uncommitted. No build, no second run, no
  commit on this turn.
- This result is the terminal artifact of the RECON50 block. Next moves need
  his word (transport of this result is not a council matter) or a fresh
  council packet (goal road steps: 17:00 session-cascade disposition, 16:45
  live-activation relay closure, 8/28 exit model, full-journal recall).
