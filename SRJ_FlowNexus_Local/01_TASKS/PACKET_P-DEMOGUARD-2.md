# PACKET_P-DEMOGUARD-2 v2 DRAFT - amend-fold over v1 (V247 unanimous label defect; E1 delete + E2 audit-label rename)

Status: v2 DRAFT. Nothing builds, runs, or commits on this file. Clearance via a clearance relay plus token plus his run word, all owed. Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E1: delete the S1-DEMO-GUARD-001 comment-plus-gate block, 5 lines; E2: rename the retained audit label, 1 line modified, same args same position). No new indicator buffers. Nothing under 02_TASK_CHECKPOINTS. No commit without token. Selection/booking/gate/R-floor/regime/confirmation/alert/SL/TP/HTF/session/exit code: all UNCHANGED. Exit-model, seed-carry and classifier threads: parked, never drafted here.
Successor context: PACKET_P-DEMOGUARD-1 v1 (filed, never built - V247: unanimous mechanism-clear, unanimous DEMO_PASS-label defect, Luna non-clear); this v2 folds exactly that defect, graded per fix below.

## Authority (all on record, no invention)

- His direction 2026-09-23, verbatim (money authority, his carrier): "re run not granted, infact i want you to remove the lock because i still use the demo account. the lock is too restrictive, i know what i am doing."
- His standing money facts: demo account in use (his word); ALERT-ONLY mode stands; the deployment bar (GOAL_STATEMENT.md Amendment 4) is UNCHANGED by this packet - removal gates tester orders only, never live activation.
- Safety shape on record (his explanation verified on disk, EA L32): `input ENUM_SRJ_MODE InpMode = MODE_ALERT_ONLY` with the comment "ALERT_ONLY sends no orders" - the DEFAULT mode sends no orders ever; EXECUTE is chosen deliberately per run ini.
- Run scope on record (his words 2026-09-23, verbatim: "for this tester run, execute is okay cause it is demo account and on the simulation not a forward test"): the S5 run is tester simulation on demo, never a forward test.
- V247 round dispositions (all four seats filed whole 1x under V247-DEMOGUARD markers; mechanism confirmed by all, zero halts on the deletion): Luna DISCREPANCY on the retained DEMO_PASS label (false on live) + 5 further notes (pre-send wording, int cast harmless, change-sentence scope, -5 line shift, gate fully removed not live-excepted); Sonnet YES on mechanism + any-demo alternative (trade-mode-only check) + self-confirm question; GLM YES + label-rename/print-args/OnInit candidates; Kimi YES (not-a-blocker) + EXECUTE_ACCT rename + login-parameterization. Folded: E2 label rename (unanimous defect, Kimi's same-args form); change-sentence widened (Luna A-4/A-6); G2 audit wording tightened to EXECUTE-mode takes (Luna A-2, Kimi A-2); int cast kept (Luna A-3 harmless, no change); line-shift carried as disclosed (Luna A-5, GLM A-3). Parked per his explicit words (no re-ask): any-demo gate, login parameterization, OnInit print, print-args change.
- Stated risk (no softening): after removal the EA sends real orders on WHATEVER account the terminal is connected to, including a live account. His "i know what i am doing" is recorded as the accepting authority; the builder states the risk, never waives it. Sonnet's to-self question answered from record (no re-ask): the RECON56 trigger was login rotation AND his direction is full removal twice stated - the middle paths stay parked on his words, never on assumption.

## Rule (one deletion, one label rename)

- E1: the EXECUTE-mode gate (EA L10156-10160, comment-plus-gate) is deleted in full: no trade-mode check, no login check, no DEMO_GUARD abort.
- E2: the retained audit print (EA L10161) keeps position and args, label renamed DEMO_PASS to EXECUTE_ACCT - truthful on any connected account (demo, live, other).
- Alternatives parked (his words govern): relax-to-any-demo, login parameterization, OnInit account print, print-args change. Council may fold any back as amend-with-delta; builder drafts nothing further unprompted.

## Scope (order-send behavior only)

- Takes return where elections fire (predicted 5/5 RECON55 bars); elections, seeds, vetoes, freshness, booking, R floor, regime votes, confirmation, alert kinds, SL/TP legs, HTF leg, day-close leg, rank gate, session handling: all UNCHANGED.
- Predicted deltas vs RECON56 (same feed, recorded demo): CTrade::OrderSend 5 (RECON55 lots/prices modulo balance sizing); DEMO_GUARD 0 rows (zero proved two-pattern); EXECUTE_ACCT 5 with mode+login printed (audit trail, EXECUTE-mode takes only - the ALERT_ONLY branch returns before it); PRE-SEND 5; MarkSessionUsed 5 sessions marked (L10245 reached); re-seed cascade gone (seed bars == RECON55 66-bar set; FRESHCOUNT 38; VETOCLEAR 4; LTFFLIP 9; HU/SD RECON55 shape); exits reproduce the RECON56 phantom lifecycles bar-for-bar (9/4 DAY_CLOSE 23:55, 17:00 SL 17:30, 9/1 SL 17:50, TPs identical) - falsifiable, graded in G4.
- Designed boundaries (no code change): ALERT_ONLY mode untouched (L10143-10153 independent); lot-size floor (L10182-10183), stops-level gate (L10200-10204), sizing/diagnostics prints untouched; dead residue disclosed (ABORT_DEMO_GUARD define L309-310 retained, never fires, compiles clean; marker [S1-DEMO-GUARD-001] survives only at the L10200 stops gate, a different gate); nothing in this packet authorizes live trading (deployment bar above governs).

## Edit set (exact verbatim; STAGE-1 exact-diff gated; byte-verified anchors)

- E1 delete DEMO_GUARD comment-plus-gate (EA L10156-10160, -5 deleted, +0 new; the comment describes only this gate, so it goes with it - no dangling comment):
  old L10156: `       //--- [S1-DEMO-GUARD-001] G1 demo gate FIRST (Luna V128 clearance; run on`
  old L10157: `       //--- token+word): execute-mode on non-demo or non-recorded login aborts before`
  old L10158: `       //--- magic/concurrency/sizing/send. Recorded demo login 1500183638 (measured).`
  old L10159: `       if(InpMode == MODE_EXECUTE && (AccountInfoInteger(ACCOUNT_TRADE_MODE) != ACCOUNT_TRADE_MODE_DEMO || AccountInfoInteger(ACCOUNT_LOGIN) != 1500183638))`
  old L10160: `         { GoAbort(ABORT_DEMO_GUARD, g_state); return; }`
- E2 rename audit label (EA L10161, 7-space indent, +1 modified, same args same position):
  old L10161: `       if(InpMode == MODE_EXECUTE) PrintFormat("[SRJ-EA] DEMO_PASS mode=%d login=%d", (int)AccountInfoInteger(ACCOUNT_TRADE_MODE), (int)AccountInfoInteger(ACCOUNT_LOGIN));`
  new L10161: `       if(InpMode == MODE_EXECUTE) PrintFormat("[SRJ-EA] EXECUTE_ACCT mode=%d login=%d", (int)AccountInfoInteger(ACCOUNT_TRADE_MODE), (int)AccountInfoInteger(ACCOUNT_LOGIN));`
  (single string-token swap DEMO_PASS to EXECUTE_ACCT; %d/%d + both args unchanged - Luna A-3 kept as-is)

## Stages (T161N discipline; RECON56 precedent)

S1 Pre-hash gate: re-hash EA (must equal 5DD2595167F322B2011BB6482EE3A37E200BB13004F209693011A0DFCAD0CE0F / 622595 B / 11322 lines) plus Panels 4335F703/17047/456 plus ImbalanceMgr 568F4CE9/26422/612 plus State 80A466AC/18231 plus Sessions E12076C4/27178 plus FlowLogic 956BF3E3/70308 plus single-hit plus char-code assert every OLD anchor above (anchors content-addressed, never number-addressed: E1 deletes apply first, then the E2 anchor is re-asserted by content post-delete before replacement); assert no new buffers. Miss = DIAGNOSE, never assume, never revert. S2 Apply E1 plus E2 exact-diff (expected post-build EA 11322 - 5 deleted = 11317 (+0/-5/+0, +1 modified); rest +0). S3 Post-hash plus budget arithmetic from literal counts. S4 Compile both targets 0 errors 0 warnings. S5 Run under RECON50_DEMO_USD (same terminal, InpMode 1, 2026-08-26 to 2026-09-10, InpDebugLog=true), ceiling 90 min - ONLY on token plus his run word.

## Acceptance (grade segment-vs-RECON56-phantom and vs-RECON55-fills)

G1 Build: 0 errors 0 warnings both targets; post-hashes recorded; budget EA 11322 - 5 deleted = 11317 (+0/-5/+0, +1 modified) from literals, rest +0; dead define + origin comment retained (disclosed); commit text prepared, commit only on token.
G2 Takes-returned (hard gate): CTrade OrderSend 5, same 5 bars/entries as RECON55 MTSNAP rows (lots balance-sized); SIGNAL 5 / MTSNAP 5 / TP_ELECT 10 same bars; DEMO_GUARD 0 rows (zero proved by ABORT-reason list + A6REFUSED-predicate list, two patterns); EXECUTE_ACCT 5 with mode+login printed (audit covers EXECUTE-mode takes; ALERT_ONLY takes none by construction); PRE-SEND 5; MTCOLLISION 0; re-seed cascade absent (seed bars == RECON55 66-bar set exactly; FRESHCOUNT 38 bars; VETOCLEAR 4; LTFFLIP 9; HU/SD RECON55 shape). Any election delta HALTS.
G3 State-identical plus order rows: all non-exit families count-identical vs RECON55; EXITCENSUS verdict=BREAK 2 (same-line crosses observed); EXITVERDICT totals return to RECON55 shape minus hold-window deltas per the rank gate; alert kinds SIGNAL/EXIT/HEADS-UP/STAND-DOWN only.
G4 Fills-match-phantom: 5 MTEXIT reasons/bars equal the RECON56 phantom lifecycles bar-for-bar (9/1 SL 17:50, 9/4 DAY_CLOSE 23:55 server, 9/7 TP 10:50, 9/8 TP 10:40, 17:00 SL 17:30) with real fills at snapshot entries; any exit divergence vs phantom is a NAMED finding with mechanism, never averaged away; balance moves (P&L still never graded).
L-final Graded set authoritative: G1/G2/G3/G4 above.

## Run cost and novel evidence

One build (EA five-line deletion plus one-line label rename, STAGE-1 exact-diff gated) plus one tester run, ceiling 90 minutes, explicit values authoritative (same settings as RECON56). Novel evidence vs RECON56: (a) first real fills on the rank-gate tree (5 orders on the recorded demo); (b) phantom-vs-real exit match, bar-for-bar; (c) re-seed cascade gone by session-mark restoration; (d) truthful every-take audit label on any account. Exit figures are target figures until fills print, never realized before.

(End of file)
