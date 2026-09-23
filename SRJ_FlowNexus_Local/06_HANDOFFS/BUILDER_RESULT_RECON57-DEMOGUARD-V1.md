# BUILDER_RESULT_RECON57-DEMOGUARD-V1 (2026-09-23, G1-G4 graded)

## Authority (all present before the first gate pull)

- Council content-clear: V249 round on packet v2 / relay v246 (Luna YES
  + GLM YES + Kimi YES, Sonnet principled refusal without defect; all
  filed whole 1x under V249 markers). No key volunteered in V249.
- Luna key for P-DEMOGUARD-2 v2 (two-line ruling, PASS 5/5, filed under
  KEY LUNA DEMOGUARD markers; spends one build + one run, SPENT HERE).
- His words banked: build + run ("proceed to build, run, grade, report",
  this session) + completion word ("the run has completed, please
  proceed", this session). Token NOT given: nothing committed, nothing
  reverted.
- Packet: 01_TASKS\PACKET_P-DEMOGUARD-2.md v2 302023B3/9710. EA built
  tree 98F6BBAC/622124/11317 (pre-build 5DD25951/622595/11322 per S1).
  Stop-and-report mismatch condition checked green before any grade.

## Execution record (S6 on DONE)

- DONE=PASSED 2026-09-23 16:44:38 on his completion word. Runtime 0:49:28
  wall (15:55:10 launch to 16:44:38 DONE; 90 ceiling respected; first
  15:54 launch REFUSED_TERMINAL_BUSY on my RECON56 leftover terminal,
  closed graceful same turn per automation rule, relaunched).
- Segment: 06_HANDOFFS\RECON57-DEMOGUARD-V1_JOURNAL.log
  6F242EACFF546F6AE583022EB974EDFA462FA8F3C2894C89C67126EBF97ED969 /
  4274727 B / 24144 lines (wrapper-archived; STATUS terminal state PASSED).
  Baselines: RECON56 04B9C64B/4588424/25639 (phantom), RECON55
  EA5BCC5C/4027323/22871 (fills).
- Feed identical to both (563338 ticks, 3168 bars; BIASCENSUS_FINAL,
  ZONECENSUS_FINAL, PROMOCENSUS 469, N1EQUALS 28/30/0/2 all identical;
  WS161 changes 218 mismatch 0 - back to RECON55 shape).
- Final balance 10309.68, exact to RECON55 (same fills + same exits).
- Tabulation: machine pulls on the segment (literal patterns; zeros
  re-proved); full matrix in 06_HANDOFFS\RECON57-DEMOGUARD-V1_TABULATION.txt.

## Realized delta (packet L-novel-evidence vocabulary)

- DELIVERED (a) first real fills on the rank-gate tree: CTrade 5/5
  (9/1 buy 2.04, 9/4 buy 0.57, 9/7 buy 2.49, 9/8 sell 1.92, 17:00 sell
  1.92 - bars/prices/lots byte-identical to RECON55).
- DELIVERED (b) phantom-vs-real exit match, bar-for-bar with real fills
  at snapshot entries: 9/1 SL 17:50 at 1.15975; 9/4 DAY_CLOSE 23:55 at
  1.16093; 9/7 TP_TOUCH 10:50 at 1.16200; 9/8 TP_TOUCH 10:40 at 1.16102;
  17:00 SL 17:30 at 1.16274. Zero divergence vs RECON56 phantom rows.
- DELIVERED (c) re-seed cascade gone: seed bars == RECON55 66-bar set
  exactly (diff 0); FRESHCOUNT 38; VETOCLEAR 4; LTFFLIP 9; HU/SD 30/25.
- DELIVERED (d) truthful audit label, empirically: EXECUTE_ACCT 5/5
  with mode=0 login=1359506594 printed (first run emitting the renamed
  token; mode=0 decodes demo per ACCOUNT_TRADE_MODE - his demo word
  proven true; login 1359506594 differs from recorded 1500183638 -
  the old guard would have blocked this run too, removal proven
  necessary, never assumed).
- CHANGED vs promise: nothing. Every G-line prediction held as written.

## Acceptance grades

- G1 PASS: compile logs 06_HANDOFFS\DEMOGUARD-V1_EACOMPILE.log +
  DEMOGUARD-V1_FLOWCOMPILE.log: Result 0 errors 0 warnings both targets
  (EA 6174ms, FlowLogic 5694ms; empty-exit quirk, logs re-read). Post:
  EA 98F6BBAC/622124/11317 exact (budget 11322 - 5 = 11317, +0/-5/+0
  +1 modified); rest unchanged; EXECUTE_ACCT 1x, dead ABORT_DEMO_GUARD
  define retained, DEMO_PASS 0, login literal 0.
- G2 PASS: CTrade OrderSend 5, RECON55 bars/entries (lots identical -
  same balance path); SIGNAL 5 / MTSNAP 5 / TP_ELECT 10 same bars;
  DEMO_GUARD 0 rows (full-substring absence + ABORT/A6REFUSED lists
  clean, two patterns); EXECUTE_ACCT 5 with mode+login printed (audit
  covers EXECUTE-mode takes); PRE-SEND 5; MTCOLLISION 0; re-seed
  cascade absent (CHAIN diff 0, adverse-9 diff 0, VETO 4, HU/SD shape).
  No election delta (any would have HALTED - none did).
- G3 PASS: all non-exit families count-identical vs RECON55 (WS161 218,
  PROMOCENSUS 469, BIASCENSUS, ZONECENSUS, N1EQUALS, RENEW 0/0, shared
  adverse-9, shared LTFFLIP 9); EXITCENSUS verdict=BREAK 2 (same-line
  crosses observed, trades hold); EXITVERDICT 133 (35 + 93 on 9/4 hold
  + 5 on 17:00 hold - rank-gate shape preserved with fills); alert
  kinds SIGNAL/EXIT/HEADS-UP/STAND-DOWN only.
- G4 PASS-WITH-FILLS: 5 MTEXIT reasons/bars equal the RECON56 phantom
  lifecycles exactly (named above); 9/4 16:10 + 17:00-bar 17:05 MTEXIT
  absent (held per his same-line rule); DAY_CLOSE 1 event (first live
  fire with a real position behind it); MTEXIT POI_BODY_BREAK 0 (no
  higher-break instance); balance 10309.68 == RECON55.
- L-final: G1/G2/G3/G4 above cover E1-E2 as stated.

## Evidence rows (all machine-pulled from the segment)

- Orders: 9/1 17:35 buy 2.04 done 1.16024; 9/4 16:00 buy 0.57 done
  1.16019; 9/7 09:20 buy 2.49 done 1.16138; 9/8 10:10 sell 1.92 done
  1.16205; 9/8 17:00 sell 1.92 done 1.16220.
- Audit: EXECUTE_ACCT mode=0 login=1359506594 on all 5 take bars
  (demo confirmed, non-recorded login confirmed).
- Exits: as listed in Realized delta (b), fills at snapshot entries.

## Goal join (window 08-26 to 09-09; scoreboard re-joined)

- HIT - 9/4 NY 15:55 LONG R1.66 (signal/entry/fill identical; tester
  holds 16:10 per his same-line rule to DAY_CLOSE 23:55 - his settled
  day-close discipline now realized WITH a position; exit-shape match).
- HIT - 9/7 London 09:15 LONG R1.76 TP_TOUCH (identical).
- HIT - 9/8 London 10:10 SHORT R1.94 TP_TOUCH (identical).
- HIT - 9/8 17:00 NY SHORT R1.96 (signal/entry/fill identical; held
  past 17:05, stopped 17:30; 16:40 blocked R0.68 + 16:45 rejected,
  both preserved).
- VALID-SIGNALED - 9/1 17:35 NY LONG (his VALID-not-taken; tester buys
  2.04, SL 17:50; his 17:45 early close vs tester touch-keep: touch
  ruling open with him, no question shipped).
- MISS - 8/28 London + 9/7 NY (sweep-then-retest gap stands, unmoved -
  selection untouched by design; needs his scope word).
- REFUSED - 9/4 10:40 SHORT (his ruled INVALID; refused again -
  rule-fidelity preserved).
- Rejects silent (same 5 floor blocks). Deployment bar SHUT (no live
  money ever; full-journal open; booking flaw + classifier parked).

## Cost and next

- Cost: one build (five-line delete + one-token rename, STAGE-1 gated)
  + one run 0:49:28 wall (90 ceiling respected) + one REFUSED pre-flight
  (my leftover terminal, closed graceful). All four novel-evidence items
  delivered; zero promise-changes.
- Owed: nothing from him (touch ruling only if he wishes; booking +
  classifier + retest threads parked for his scope word). No transport
  owed (guard arc closes here unless council asks more). No commit
  (token never given).

(End of file)
