# PACKET_P-DEMOGUARD-1 v1 DRAFT - remove EXECUTE-mode demo+login order gate (nothing else moves)

Status: v1 DRAFT. Nothing builds, runs, or commits on this file. Clearance via a clearance relay plus token plus his run word, all owed. Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (delete the S1-DEMO-GUARD-001 comment-plus-gate block, 5 lines, no replacement). No new indicator buffers. Nothing under 02_TASK_CHECKPOINTS. No commit without token. Selection/booking/gate/R-floor/regime/confirmation/alert/SL/TP/HTF/session/exit code: all UNCHANGED. Exit-model, seed-carry and classifier threads: parked, never drafted here.
Successor context: PACKET_P-EXITRANK-6 v6 (built tree 5DD25951, RECON56 graded takes 0/5 - all 5 orders refused by this gate on a changed terminal account while 5 phantom lifecycles proved the exit path); this packet changes order-send behavior only, graded per fix below.

## Authority (all on record, no invention)

- His direction 2026-09-23, verbatim (money authority, his carrier): "re run not granted, infact i want you to remove the lock because i still use the demo account. the lock is too restrictive, i know what i am doing."
- His standing money facts: demo account in use (his word this turn); ALERT-ONLY mode stands; the deployment bar (GOAL_STATEMENT.md Amendment 4: EVERY valid journal take reproduced + zero false positives before deployment is even considered) is UNCHANGED by this packet - removal gates tester orders only, never live activation.
- Proved instances on disk (RECON56 segment 04B9C64B): 5/5 take bars ABORT reason=DEMO_GUARD at S5_GATE_CHECK (9/1 17:35, 9/4 16:00, 9/7 09:20, 9/8 10:10, 9/8 17:00); DEMO_PASS 5 in RECON55 vs 0 here; guard operands print on pass only (instrumentation gap, carried openly).
- Origin of the gate (filed record, labeled prior): EA L10156-10160 comment cites Luna V128 clearance with the operative clause "execute-mode on non-demo or non-recorded login aborts before magic/concurrency/sizing/send" and the measured login 1500183638. Council cleared it in; only council clears it out - hence this packet, never a unilateral edit.
- Safety shape on record (his explanation verified on disk, EA L32): `input ENUM_SRJ_MODE InpMode = MODE_ALERT_ONLY` with the comment "ALERT_ONLY sends no orders" - the DEFAULT mode sends no orders ever; EXECUTE is chosen deliberately per run ini. The mode switch is the primary safety; the login check is a redundant second bolt. Removal changes nothing in default behavior.
- Run scope on record (his words 2026-09-23, verbatim: "for this tester run, execute is okay cause it is demo account and on the simulation not a forward test"): the S5 run is tester simulation on demo, never a forward test.
- Stated risk (no softening): after removal the EA sends real orders on WHATEVER account the terminal is connected to, including a live account. His "i know what i am doing" is recorded as the accepting authority; the builder states the risk, never waives it.

## Rule (one deletion)

- The EXECUTE-mode gate (EA L10156-10160, comment-plus-gate) is deleted in full: no trade-mode check, no login check, no DEMO_GUARD abort. The unconditional DEMO_PASS print (EA L10161, inside `if(InpMode == MODE_EXECUTE)`) is KEPT as-is and becomes the every-take audit trail (mode+login printed on every order path entry, any account).
- Alternatives declined or parked: relax-to-any-demo (keep the trade-mode check, drop the login check) DECLINED per his explicit "remove the lock" (recorded above; council may fold it back as an amend-with-delta, builder drafts nothing further unprompted); fail-closed snapshot reorder (arm g_mtrade only after the order path) PARKED v-next - moot once the gate is gone, revived only if council keeps any gate.

## Scope (order-send behavior only)

- Takes return where elections fire (predicted 5/5 RECON55 bars); elections, seeds, vetoes, freshness, booking, R floor, regime votes, confirmation, alert kinds, SL/TP legs, HTF leg, day-close leg, rank gate, session handling: all UNCHANGED.
- Predicted deltas vs RECON56 (same feed, recorded demo): CTrade::OrderSend 5 (9/1, 9/4, 9/7, 9/8 x2, RECON55 lots/prices modulo balance sizing); DEMO_GUARD 0 rows; DEMO_PASS 5 with login printed; PRE-SEND 5; MarkSessionUsed 5 sessions marked (L10245 reached); re-seed cascade gone (extra 10 seed bars, +6 FRESHCOUNT, +2 VETOCLEAR, +2 LTFFLIP, +6/+6 HU/SD all return to RECON55 shape); exits reproduce the RECON56 phantom lifecycles bar-for-bar (9/4 DAY_CLOSE 23:55, 17:00 SL 17:30, 9/1 SL 17:50, TPs identical) - falsifiable, graded in G4.
- Designed boundaries (no code change): ALERT_ONLY mode untouched (L10143-10153 branch independent); lot-size floor (L10182-10183), stops-level gate (L10200-10204), sizing/diagnostics prints untouched; nothing in this packet authorizes live trading (deployment bar above governs).

## Edit set (exact verbatim; STAGE-1 exact-diff gated; byte-verified anchors)

- E1 delete DEMO_GUARD comment-plus-gate (EA L10156-10160, -5 deleted, +0 new; the comment describes only this gate, so it goes with it - no dangling comment):
  old L10156: `       //--- [S1-DEMO-GUARD-001] G1 demo gate FIRST (Luna V128 clearance; run on`
  old L10157: `       //--- token+word): execute-mode on non-demo or non-recorded login aborts before`
  old L10158: `       //--- magic/concurrency/sizing/send. Recorded demo login 1500183638 (measured).`
  old L10159: `       if(InpMode == MODE_EXECUTE && (AccountInfoInteger(ACCOUNT_TRADE_MODE) != ACCOUNT_TRADE_MODE_DEMO || AccountInfoInteger(ACCOUNT_LOGIN) != 1500183638))`
  old L10160: `         { GoAbort(ABORT_DEMO_GUARD, g_state); return; }`
  (ABORT_DEMO_GUARD define L310 stays - dead reason string, zero behavior; DEMO_PASS print L10161 stays as the audit trail; the L10200 [S1-DEMO-GUARD-001] G2 stops-gate comment is a different gate and stays)

## Stages (T161N discipline; RECON56 precedent)

S1 Pre-hash gate: re-hash EA (must equal 5DD2595167F322B2011BB6482EE3A37E200BB13004F209693011A0DFCAD0CE0F / 622595 B / 11322 lines) plus Panels 4335F703/17047/456 plus ImbalanceMgr 568F4CE9/26422/612 plus State 80A466AC/18231 plus Sessions E12076C4/27178 plus FlowLogic 956BF3E3/70308 plus single-hit plus char-code assert every OLD anchor above (anchors content-addressed, never number-addressed); assert no new buffers. Miss = DIAGNOSE, never assume, never revert. S2 Apply E1 exact-diff (expected post-build EA 11322 - 5 deleted = 11317 (+0/-5/+0); rest +0). S3 Post-hash plus budget arithmetic from literal counts. S4 Compile both targets 0 errors 0 warnings. S5 Run under RECON50_DEMO_USD (same terminal, InpMode 1, 2026-08-26 to 2026-09-10, InpDebugLog=true), ceiling 90 min - ONLY on token plus his run word.

## Acceptance (grade segment-vs-RECON56-phantom and vs-RECON55-fills)

G1 Build: 0 errors 0 warnings both targets; post-hashes recorded; budget EA 11322 - 5 deleted = 11317 (+0/-5/+0) from literals, rest +0; ABORT_DEMO_GUARD define retained (dead, cited); commit text prepared, commit only on token.
G2 Takes-returned (hard gate): CTrade OrderSend 5, same 5 bars/entries as RECON55 MTSNAP rows (lots balance-sized); SIGNAL 5 / MTSNAP 5 / TP_ELECT 10 same bars; DEMO_GUARD 0 rows (zero proved by ABORT-reason list + A6REFUSED-predicate list, two patterns); DEMO_PASS 5 with login printed; PRE-SEND 5; MTCOLLISION 0; re-seed cascade absent (seed bars == RECON55 66-bar set exactly; FRESHCOUNT 38 bars; VETOCLEAR 4; LTFFLIP 9; HU/SD RECON55 shape). Any election delta HALTS.
G3 State-identical plus order rows: all non-exit families count-identical vs RECON55; EXITCENSUS verdict=BREAK 2 (same-line crosses observed); EXITVERDICT totals return to RECON55 shape minus hold-window deltas per the rank gate (9/4 hold + DAY, 17:00 hold + SL - predicted from RECON56 phantom); alert kinds SIGNAL/EXIT/HEADS-UP/STAND-DOWN only.
G4 Fills-match-phantom: 5 MTEXIT reasons/bars equal the RECON56 phantom lifecycles bar-for-bar (9/1 SL 17:50, 9/4 DAY_CLOSE 23:55 server, 9/7 TP 10:50, 9/8 TP 10:40, 17:00 SL 17:30) with real fills at snapshot entries; any exit divergence vs phantom is a NAMED finding with mechanism, never averaged away; balance moves (P&L still never graded).
L-final Graded set authoritative: G1/G2/G3/G4 above.

## Run cost and novel evidence

One build (EA five-line comment-plus-gate deletion, STAGE-1 exact-diff gated) plus one tester run, ceiling 90 minutes, explicit values authoritative (same settings as RECON56). Novel evidence vs RECON56: (a) first real fills on the rank-gate tree (5 orders on the recorded demo); (b) phantom-vs-real exit match, bar-for-bar, proving the RECON56 logic evidence converts to fills; (c) re-seed cascade gone by session-mark restoration. Exit figures are target figures until fills print, never realized before.

(End of file)
