# BUILDER RESULT — 161-M (P-XOBMID: the XOB midline body-close invalidation, Direction A)
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_161-M.md
Session: 2026-09-09. Authorization: the operator's in-session rulings, verbatim —
(1) "Shape 1 — FlowLogic adopts the midline body-close rule, activation-independent
(recommended)"; (2) "A — Break-direction kill: bearish OB dies on body close BELOW the
pure midline, bullish ABOVE; same-bar guards relaxed (recommended — fixes XOB 2159 as
measured)"; (3) issuance: "P-XOBMID issued — execute now (Stages 1-7)". Basis:
BUILDER_DECISION_MEMO_XOB-VALIDITY.md §§1-9; packet 01_TASKS\PACKET_P-XOBMID.md.
Canonical file modified: exactly ONE — Include\SRJ\SRJ_OrderblockMgr.mqh (compiled into
Indicators\SRJ_FlowLogic.mq5). EA, CQD, FlowLogic.mq5, the other thirteen includes
UNTOUCHED (post-run re-hashes below). Nothing under 02_TASK_CHECKPOINTS. No git token.

## STAGES (all measured)
1. Pre-edit hash gate PASS: SRJ_OrderblockMgr.mqh
   524D5D40AC1F0C2F6909F01742DFE13FC9A4954118A55B3008FE1CD80D18E60F (48,009 B, CRLF=1138
   LONELF=0) = the Task-160 reference.
2. E1-E5 applied (first attempt each, no whitespace misses; diffs in the tool record):
   E1 the level := pure midline; E2 the replay guard -> if(ob.isValid); E3/E4 the kill
   directions flipped in both test sites (byte-neutral); E5 wouldBeSameBarValInv removed,
   the creation-bar guard kept.
3. Post-edit (measured after the write): SHA256
   16AA5A0AC7DF00AB99C9EAFD66F0CB398CB537977AC6544639007A3537FF31BE, 47,934 B, CRLF=1139
   LONELF=0 (delta -75 B, +1 CRLF — E1 is the +1 line; E2/E5 shrink; E3/E4 byte-neutral).
4. Compile T161M (target SRJ_FlowLogic.mq5): "Result: 0 errors, 0 warnings, 4841 ms
   elapsed, cpu='X64 Regular'" (T161M_FLOWCOMPILE.log, gitignored per R-220).
5. Run T161M: harness v2, T161M_P1.ini (the T161K shape: EURUSD M5, Model 4, JPY 10,000,
   InpDebugLog=true, 2026.08.14-08.22). No terminal was open at launch (TERMINAL_BUSY=False);
   launched 08:45:06; "Test passed in 0:28:55.776", 321,404 ticks, 1,728 bars; final
   balance 10,000 JPY; RESULT=PASSED, DONE=09:14:36. Archive T161M_JOURNAL.log
   (825,835 B, the run segment) captured lock-tolerantly while the leftover terminal
   lived; the leftover (PID 28968, this run's own instance) then closed gracefully
   (documented hygiene).

## GATES — ALL FIVE PASS
G1 compile 0/0. G2 WS161: WS161_LOAD NOSTORE present (loads=1 = the derived
WS161_LOAD_COUNT=1), census "fields=15 loads=1728 stores=1728 changes=73 mismatch=0",
zero WS161_FIELD rows, zero mismatch rows. G3 CQD verdict stream IDENTICAL to T161K:
254 reads; +1=43 +2=84 -1=88 -2=39 (the CQD untouched). G4 THE XOB-2159 LIFECYCLE CHECK —
the T161K state did NOT reproduce, proven at the source line: "2026.08.18 05:05:00
[SRJ][T155][OBPROV] code=4 id=2159 bar=121382 flag=true" — id=2159 invalidated AT the
05:05 bar (the first body close below mid 1.158035; close 1.15777, exactly the MIDLINE-1
measurement), therefore never promoted (mode=all requires isValid): objId=2159 appears
ZERO times beyond that line and no PROMOCENSUS line exists at 08.18 05:05. G5 hygiene
re-hashes byte-identical: OrderblockMgr 16AA5A0A...FF31BE; EA E5B0E2E4...AFEECA;
CQD 92F3A62B...2969F; FlowLogic.mq5 1EA7858F...73B08.

## TABULATED OBSERVABLES (designed deltas — the ruled rule's consequences, operator-judged)
- XOB-PROMOCENSUS: 372 (H/I/J/K) -> 41. Zones now die at/near their activation traversal,
  so few OBs survive to promotion (mode=all needs isValid + >=2 opposing invalidations).
- SIGNALS: 2 -> 0. BOTH T161K signals are gone (08.17 16:35:02 LONG R=1.42 Weekly-VWAP;
  08.20 09:35:04 LONG R=1.60 Daily-VWAP = AGREEMENT SAMPLE 4). The Tier-1 agreement
  picture under the ruled rule is now EMPTY-BY-RULE, not by defect: at 08.18 14:10-15:00
  the SHORT candidate evaluates "inPlay=0 via=none" — the operator's own "NO VALID XOB"
  verdict at 14:10 is now literally reproduced by the EA.
- FRESHCOUNT 22 -> 1; S5_WAIT 0 (no candidate ever reached S5); FRESHSKIP 197;
  SUPPRESSED 47; ABORT 18.
- ZONECENSUS_FINAL: bars=1728 both=0 xobOnly=927 fvgOnly=0 neither=801 | inWindow=576
  xobInWin=350 (was xobOnly=1616 / neither=112 / xobInWin=548).
- WS161 changes 79 -> 73.

## DECLARED FINDING (the packet's pre-registered investigation) — THE BIAS PANEL SHIFTS
BIASCENSUS_FINAL moved: T161M "bars=1728 | sh1 neg=891 pos=837 fail=0 | sh2 neg=892
pos=836 fail=0" vs the T161H/I/J/K identity 699/1029 + 700/1028. fail=0 (the instrument
is healthy); the DISTRIBUTION moved. Mechanism (measured from source): the bias engine
consumes the M5 OB-invalidation counters directly — SRJ_BiasEngine.mqh L158-164 reads
g_s.bullishOBInvalidationCount / bearishOBInvalidationCount (and maintains
g_s.obInvalidationBoundary at L132/223/283, resets at L242-249/L296-299) — and Direction A
multiplied invalidations, so the per-bar bias panel values changed. The CQD verdict stream
did NOT move (G3), isolating the shift to this path. CONSEQUENCE CHAIN measured on 08.20:
the Daily-VWAP LONG seeds 09:15 but REGIMECENSUS reads votes=1 trendOk=0 at 09:15 (the
changed panel), vs T161K's votes=3 path to SIGNAL. This is the operator's rule propagating
through the bias engine — a STRATEGY BEHAVIOR fact for the operator to judge, not a
plumbing defect. OPTIONS (operator-reserved, none taken): accept the shift as the rule's
true consequence; or rule on whether the bias engine's consumption of M5 OB invalidation
counters should stand (a further packet if they want it scoped differently).

## HARNESS V2.3 (operator-directed reliability hardening, applied after the T161M run)
The operator's third reliability warning ("your command to run the strategy is still not
reliable, improve it") — diagnosis: the WRAPPER was sound; the BUILDER'S POLL COMMANDS
carried 55-second sleep loops that the IDE shell aborts (one poll died "Command execution
aborted"; R-180 declared). V2.3 changes to run_tester_v2.ps1: a dedicated
<RunName>_DONE.txt marker written at EVERY terminal state (poll = ONE Test-Path per tool
call, ZERO sleeps); stale-DONE cleanup at launch; the GATE block now scans ONLY the new
journal segment (the day-log's earlier runs had polluted T161M's STATUS GATE list —
declared; the T161M gates were re-derived from the segment in T161M_TABULATION.txt).
POLL LAW recorded in the wrapper header: sleep loops inside poll commands are FORBIDDEN.
A validation run of v2.3 itself is pending on its next use.

## ARTIFACTS
06_HANDOFFS: BUILDER_RESULT_161-M.md (this file), T161M_TABULATION.txt, T161M_JOURNAL.log
(gitignored per R-220), T161M_FLOWCOMPILE.log (gitignored). 00_CURRENT_WORKING:
T161M_P1.ini, tabulate_161m.ps1, T161M_STATUS.txt (the run's record; contains the
pre-v2.3 whole-log GATE block — superseded by the tabulation for gate reading).
01_TASKS: PACKET_P-XOBMID.md (ISSUED — EXECUTED). 06_HANDOFFS:
BUILDER_DECISION_MEMO_XOB-VALIDITY.md (the rulings of record).

## VERDICT (mechanical)
P-XOBMID EXECUTED AND VERIFIED per its packet gates — ALL FIVE PASS. NEW BASELINE:
Include\SRJ\SRJ_OrderblockMgr.mqh =
16AA5A0AC7DF00AB99C9EAFD66F0CB398CB537977AC6544639007A3537FF31BE (47,934 B, 1,139 CRLFs),
T161M-verified; EA E5B0E2E4...AFEECA, CQD 92F3A62B...2969F, FlowLogic.mq5 1EA7858F...73B08
unchanged. The EA's divergence consumption, the CQD detection and all buffer contracts are
unchanged (G2/G3). The STRATEGY OUTCOME under the ruled rule: zero Tier-1 signals, the
promotion population 372->41, and the bias-panel distribution shift (declared finding,
mechanism measured). The operator judges the agreement picture; recertification or any
follow-up packet (bias-engine consumption scope; the STEP-4 exit model; the memo's §6
secondary questions) awaits their directive. NO git token used this session.