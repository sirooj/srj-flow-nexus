# CODE REVIEW REQUEST — v134 — 2026-09-17 (grade + land re-ask; same text to EVERY model)

Change (one plain sentence): the demo run printed the positive guard-pass row the land hold asked for, with nothing else moving.

Already decided (not re-asked; filed record, not claims): issuance Luna `LUNA-V132-DEMO-PASS-LAND-001` (one logging-only insert, rebuild, one run); gate Luna `LUNA-V133-EXEC-GATE-CONFIRM-001` (run on his word — word spent, run done); register (positive row + zero aborts + same fill + 0/0); review-seat technical yes with run-output-decides adopted. Prior texts labeled by file+marker+digest in the ledger; nothing here relies on memory.

File / function / lines: `Experts\SRJ_FlowNexus_EA.mq5` / `EvaluateClosedBar` / L9984-9990 (guard + insert, contiguous whole unit)
Source digest: SHA256 `E5B97B36` / 597425 B, measured after the write, before compile. Compile: 0 errors, 0 warnings (`06_HANDOFFS\T166_DEMOPASS_EACOMPILE.log`).

Complete code, verbatim, no elisions:
```
       // ------ Phase 2 Execution Logic ------
       //--- [S1-DEMO-GUARD-001] G1 demo gate FIRST (Luna V128 clearance; run on
       //--- token+word): execute-mode on non-demo or non-recorded login aborts before
       //--- magic/concurrency/sizing/send. Recorded demo login 1500183638 (measured).
       if(InpMode == MODE_EXECUTE && (AccountInfoInteger(ACCOUNT_TRADE_MODE) != ACCOUNT_TRADE_MODE_DEMO || AccountInfoInteger(ACCOUNT_LOGIN) != 1500183638))
         { GoAbort(ABORT_DEMO_GUARD, g_state); return; }
       if(InpMode == MODE_EXECUTE) PrintFormat("[SRJ-EA] DEMO_PASS mode=%d login=%d", (int)AccountInfoInteger(ACCOUNT_TRADE_MODE), (int)AccountInfoInteger(ACCOUNT_LOGIN));
       long magic = (g_sessionAtEntry == SESSION_LONDON) ? InpMagicBase + 1 : InpMagicBase + 2;
```

Run rows, raw (RECON45-DEMO-PASS DONE=PASSED 14:39:20; 3168 bars/563338 ticks; archive 39153 lines/`70CE840F`; same ini+range as prior proof):
```
[SRJ-EA] DEMO_PASS mode=0 login=1500183638
[SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.09.08 10:05 dir=SHORT tp=1.16102 r=1.94 sl=1.16258 mode=1SWING div=hidden
[SRJ-EA] PRE-SEND lots=0.01 entry=1.16205 slPts=53 tpPts=103 stopsLevel=0 freezeLevel=0 spreadPts=1
[SRJ-EA] EXECUTED fill=1.16205 slPts=53 tpPts=103 R_executed=1.94 R_logged_at_signal=1.94 delta=0.00
[SRJ-EA] MTEXIT bar=2026.09.08 10:40 reason=TP_TOUCH line=- lineVal=- entry=1.16205 exit=1.16102
```
Counts: DEMO_PASS 1; DEMO_GUARD 0 + DEMOGUARD 0; BELOW_STOPS 0 + BELOW STOPS 0; TP_RR_FAIL_LATCH 13 (unchanged); isolation 240 families, 2 deltas only (DEMO_PASS 0->1; OTHER 984->968, all tester chatter, zero strategy rows); extract set-diff vs prior proof 0; purity Core-04 EA rows only, out-of-range 0, SELHALT 0, MAXLEN-537, Test-passed 1.

Question (one, specific): does this register close the held positive-row gap with no other behavior change — any discrepancy, with line numbers?

Answer form: plain yes / no / discrepancy, with line numbers.
Nothing else is asked. Thank you.
