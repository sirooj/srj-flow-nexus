# BUILDER_RESULT_RECON56-EXITRANK-V1 (2026-09-23, G1-G4 graded)

## Authority (all present before the first gate pull)

- Council content-clear: V246 round on packet v6 / relay v243 (Luna
  wording-DISC + Sonnet YES + GLM YES + Kimi YES, zero unfoldable items,
  all filed whole 1x under V246 markers). Luna grant CLEARED-one-build-
  one-run, binding P-EXITRANK-6 by his eliciting carry (ledger 633/634).
- His words banked: build + run word (SPENT on S5 launch 13:18:02) +
  completion word (this session, "the run has completed, please proceed").
  Token NOT granted: nothing canonical committed, nothing reverted.
- Packet: 01_TASKS\PACKET_P-EXITRANK-6.md v6 7088F4B1/14263/61. EA built
  tree 5DD25951/622595/11322 (pre-build 3F4D617B/622604/11324 per S1).
  Relay: 06_HANDOFFS\BUILDER_RELAY_COUNCIL_v243-EXITRANK-CLEAR6.md
  C669A216/19086. Stop-and-report mismatch condition checked green
  before any grade (all three re-measured this session).

## Execution record (S6 on DONE)

- DONE=PASSED 2026-09-23 14:08:37 on his completion word. Runtime 0:50:35
  wall (13:18:02 launch to 14:08:37 DONE; 90 ceiling respected).
- Segment: 06_HANDOFFS\RECON56-EXITRANK-V1_JOURNAL.log
  04B9C64B47C4EFEA6A606C1AB36958002DDE4E1A2067FEC66F618A3B378BF210 /
  4588424 B / 25639 lines (wrapper-archived; STATUS terminal state PASSED,
  ARCHIVED_LINES=25639). Baseline RECON55 EA5BCC5C/4027323/22871.
- Feed identical to RECON55 (563338 ticks, 3168 bars both runs;
  BIASCENSUS_FINAL bars=3168 neg=1554 zero=0 pos=1614 both;
  ZONECENSUS_FINAL identical; XOB-PROMOCENSUS rows 469=469;
  N1EQUALS 28/30/0/2 both). Final balance 10000.00 vs 10309.68 -
  behavior delta below, profit never graded.
- Tabulation: machine pulls on the segment (Select-String literal
  patterns; every zero re-proved with a second differently-formed
  pattern; full matrix in 06_HANDOFFS\RECON56-EXITRANK-V1_TABULATION.txt).

## HEADLINE: takes 0/5 - environment guard, not the build

- CTrade::OrderSend 0 in RECON56 vs 5 in RECON55 (case-insensitive
  "OrderSend" 1 vs 6; the 1 in both runs is the SEL61INDEP census row,
  ordersend=0/0 both runs - second-pattern proof).
- Cause, proved on disk: ABORT reason=DEMO_GUARD state=S5_GATE_CHECK on
  all 5 take bars (9/1 17:35 LONG, 9/4 16:00 LONG, 9/7 09:20 LONG,
  9/8 10:10 SHORT, 9/8 17:00 SHORT) + 5 matching A6REFUSED
  predicate=DEMO_GUARD rows. DEMO_PASS 5 in RECON55, 0 here; "login="
  prints 5 there (login=1500183638), 0 here.
- Code (EA L10159-10160): the S1-DEMO-GUARD-001 gate aborts EXECUTE-mode
  orders unless demo AND login 1500183638. The terminal account changed
  between the 05:10 run (guard passed 5/5) and the 13:18 run (guard
  failed 5/5). Nothing in the E1/E2 edit touches this path (exit-only
  gate in EvaluateManagedTrade; selection/order code byte-identical).
- Consequence for grading: fills and P&L are VOID (no position ever
  opened, balance untouched). Exit LOGIC is gradeable: the snapshot arms
  g_mtrade (EA L10117-10119, active=true MT_MANAGING) BEFORE the guard
  (L10159), and GoAbort->ResetSequence never clears g_mtrade (L6266-6293
  read whole - candidate state only). All 5 phantom lifecycles ran the
  REAL EvaluateManagedTrade on real market data, entries identical to
  RECON55. MTEXIT 5 + MTLIFE 5 closes + 5 EXIT alerts prove it.

## Realized delta (packet L59 NOVEL-EVIDENCE vocabulary)

- DELIVERED (a) first DAY_CLOSE fire on a held same-line trade: 9/4 LONG
  held 16:10, DAY_CLOSE exit bar 2026.09.04 23:55 server at 1.16093
  (mark = 16:55 ET through TC_ZoneToServer, EA L10405; 23:55 server is
  that mark in server clock; fill 16:00 <= mark <= bar 23:55 holds).
- DELIVERED (b) first same-line holds on live trades: 9/4 past 16:10
  (Y-POC cross, held) and 17:00 SHORT past 17:05 (M-POC cross, held to
  SL 17:30 at the stop 1.16274).
- DELIVERED (c) 9/1 touch-kept proof: 17:40/17:45 verdicts vSL=0 vTP=0,
  SL exit 17:50 at 1.15975 (equality strictness unchanged per scope).
- CHANGED vs promise (stated plainly): orders 0 not 5 (environment
  guard above - G2 by the letter HALTS on take delta, cause diagnosed
  100% environment, zero build contribution); exits realized on phantom
  state (logic-valid per the arming order above, fill-void).

## Acceptance grades

- G1 PASS: compile logs 06_HANDOFFS\EXITRANK-V1_EACOMPILE.log +
  EXITRANK-V1_FLOWCOMPILE.log: Result 0 errors 0 warnings both targets
  (EA 6733ms, FlowLogic 6097ms). Post-hashes: EA 5DD25951/622595/11322
  exact (budget 11324 - 2 deleted - 2 replaced-old + 2 new = 11322,
  +0 net new +2 modified); Panels 4335F703/17047/456, ImbalanceMgr
  568F4CE9/26422/612, State 80A466AC/18231, Sessions E12076C4/27178,
  FlowLogic 956BF3E3/70308 - all equal RECON55. isMeanRev hits in EA = 0
  (E1 delete complete); [P-EXITRANK-6] live at the gate.
- G2 HALT-BY-LETTER, ENVIRONMENT-DIAGNOSED (election-identical, hard
  gate triggered on orders only): SIGNAL 5/5 same bars (9/1 17:35 R1.17,
  9/4 16:00 R1.66, 9/7 09:20 R1.76, 9/8 10:10 R1.94, 9/8 17:00 R1.96);
  MTSNAP 5/5 same bars/entries/anchors/regime=1; TP_ELECT 10/10 rows
  byte-identical incl 5 floor blocks (R0.53/R0.18/R0.85/R0.63/R0.68);
  SIDE1C_PREEMPT 10/10 identical bars; MTCOLLISION 0/0. CTrade
  OrderSend 0 vs 5 - the ONLY election-path delta, caused by the guard
  (above), never by the build. Selection-side state deltas (extra seeds
  10 bars, FRESHCOUNT +6 bars, VETOCLEAR +2, LTFFLIP +2, HU/SD +6/+6,
  STATE/WS161 volume) ALL attribute to one mechanism: guard abort skips
  MarkSessionUsed (EA L10245 sits after the order block), taken sessions
  stay open, the seed block (EA L7861, IDLE-armed) re-seeds on later
  bars; every extra candidate dies pre-signal (2 extra S4 FRESH_OPP
  aborts 9/1 17:50 + 9/4 17:25 with veto stores cleared 9/2 + 9/7;
  9/8 17:20 S4 LTF flip-kill). Zero SIGNAL/MTSNAP/TP_ELECT change.
- G3 PASS-WITH-ATTRIBUTION: non-exit families identical (N1EQUALS,
  ZONECENSUS, PROMOCENSUS 469=469, BIASCENSUS, RENEW 0/0, shared
  FRESHCOUNT 38 bars + shared adverse-9 + shared LTFFLIP 9, alert kinds
  SIGNAL/EXIT/HEADS-UP/STAND-DOWN only). EXITCENSUS prints UNCHANGED
  2=2 (observation-of-crossing: 9/4 16:10 Y-POC + 9/8 17:05 M-POC both
  still print verdict=BREAK while the trades HOLD - the designed
  census/gate split). Trade-verdict flips exactly class (i) x2, no
  class (ii) instance in-window (both old BREAKs were same-line), class
  (iii) vacuous (0 MEANREV takes, regime=1 all 5), class (iv) HTF dead
  by MT_HTF_EXIT=false + DAY per marks. No higher-break row flips to
  hold, no hold flips to BREAK. EXITVERDICT +98 closed arithmetically:
  9/4 hold 96 verdicts over the exact 96-bar window 16:00->23:55
  inclusive + 17:00 hold 7 over the exact 7-bar window 17:00->17:30
  (55 had 3 + 2 there); other three trades verdict-identical (4=4,
  19=19, 7=7); 9/8-10:10 lifecycle -1 = the PRE-SEND row only.
- G4 PASS-LOGIC, FILL-VOID: 9/4 16:10 MTEXIT absent (zero proved by
  MTEXIT-bar list + reason=POI_BODY_BREAK 0, second pattern) with
  EXITVERDICT pin vBREAK=none vSL=0 vTP=0 vHTF=0 htfH/M/L=0/0/0 want=0
  anti=-1, DAY_CLOSE at the first bar at/after the mark; 17:00 17:05
  MTEXIT absent with identical pin shape, later SL 17:30 at stop;
  9/1 SL 17:50 intact; 9/7 + 9/8-10:10 TP_TOUCH identical bars/prices
  (10:50 1.16200, 10:40 1.16102); MTEXIT POI_BODY_BREAK rows == higher-
  break rows only (0 == 0, no higher-break instance in-window);
  DAY_CLOSE events 1 == eligible survivors (only 9/4 alive at day end).
- L-final: G1/G2/G3/G4 above cover E1-E2 as stated.

## Evidence rows (all machine-pulled from the segment)

- Five lifecycles (phantom fills, real OHLC; entries == RECON55):
  09-01 17:35 LONG Monthly-VWAP entry 1.16022 SL 17:50 at 1.15975;
  09-04 16:00 LONG Yearly-POC entry 1.16018 DAY_CLOSE 23:55 at 1.16093;
  09-07 09:20 LONG Weekly-POC entry 1.16135 TP_TOUCH 10:50 at 1.16200;
  09-08 10:10 SHORT Monthly-POC entry 1.16205 TP_TOUCH 10:40 at 1.16102;
  09-08 17:00 SHORT Monthly-POC entry 1.16220 SL 17:30 at 1.16274.
  Balance 10000.00 (no position; P&L void by construction).
- RECON55 exit comparison: 9/1 SL same bar/price; 9/4 BREAK 16:10 exit
  1.16004 becomes HOLD-by-rank + DAY_CLOSE 23:55; 9/7 + 9/8-10:10 TP
  identical; 17:00 BREAK 17:05 exit 1.16214 becomes HOLD-by-rank + SL
  17:30. Both flipped rows are class (i) same-line holds under his
  2026-09-23 anchor-rank rule.

## Goal join (window 08-26 to 09-09; scoreboard re-joined)

- HIT-LOGIC - 9/4 NY 15:55 LONG R1.66 (signal/entry identical; tester
  now HOLDS 16:10 per his same-line rule to the day-close exit - his
  settled day-close discipline realized in-engine; fills unproven, no
  position this run).
- HIT-LOGIC - 9/7 London 09:15 LONG R1.76 TP_TOUCH (identical).
- HIT-LOGIC - 9/8 London 10:10 SHORT R1.94 TP_TOUCH (identical).
- HIT-LOGIC - 9/8 17:00 NY SHORT R1.96 (signal/entry identical; held
  past 17:05 per rule, stopped 17:30; 16:40 correctly blocked R0.68,
  16:45 correctly rejected - both preserved).
- VALID-SIGNALED - 9/1 17:35 NY LONG (his 2026-09-23 ruling: VALID-
  taken-not-taken-by-him; tester signals, SL 17:50; his 17:45 early
  close vs tester touch-keep: touch ruling open with him, no question
  shipped per packet scope).
- MISS - 8/28 London + 9/7 NY (sweep-then-retest gap stands, unmoved by
  this packet - selection unchanged by design).
- REFUSED - 9/4 10:40 SHORT (his ruled INVALID; refused again via the
  identical 10:35 veto store + 10:40 fire - rule-fidelity preserved).
- Rejects silent (same 5 floor blocks). Deployment bar SHUT (no live
  fills this run; exit logic proved on phantom only; full-journal open).

## Cost and next

- Cost: one build (one-gate re-key, STAGE-1 exact-diff gated) + one run
  0:50:35 wall (90 ceiling respected). All three novel-evidence items
  delivered as logic (DAY fire, same-line holds x2, touch-kept); fills
  voided by the terminal account, stated never hidden.
- Owed: nothing from council (validity arc closes here unless a seat
  asks more). From him: (1) terminal back on the recorded demo
  (login 1500183638) + one run word - the SAME built binary re-runs
  unchanged for fills (no new packet, no new build); (2) touch ruling
  on 9/1 17:45 only if he wishes (no question shipped). No commit
  (token-gated). Guard-hardening (fail-closed snapshot + operand print
  on guard trip) named as v-next packet material via council route,
  never drafted unprompted.

(End of file)
