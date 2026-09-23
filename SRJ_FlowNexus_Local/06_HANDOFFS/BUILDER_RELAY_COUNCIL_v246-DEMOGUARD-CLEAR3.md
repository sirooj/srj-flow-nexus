# RELAY v246-DEMOGUARD-CLEAR3 (2026-09-23 — slim refutation round: closes Luna V248 defect #1/#3 with numbered disk proof + every-EXECUTE-take wording; E1+E2 unchanged, packet v2 operative; session CONTINUE, same round evidence)

```
Project brief (standing — read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer — declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: this packet v1 through v9; relays v162 through v172 on disk; every version folds the prior round's verdicts (see each relay's delta paragraph). Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

CODE REVIEW REQUEST — v246 — 2026-09-23

Change (one plain sentence): No code change since v245 (E1 delete 10156-10160 + E2 label rename 10161 stand as ruled); this round proves with numbered disk lines that E1 takes the whole guard comment with nothing stale remaining, and tightens "every-take" to every-EXECUTE-take.

File / function / lines: Experts\SRJ_FlowNexus_EA.mq5, take-path order block, E1 lines 10156-10160 deleted + E2 line 10161 modified (label token only), zero lines added (11322 to 11317). Operative packet unchanged: 01_TASKS\PACKET_P-DEMOGUARD-2.md v2.
Source digest: 5DD2595167F322B2011BB6482EE3A37E200BB13004F209693011A0DFCAD0CE0F / 622595 B / 11322 lines, measured after the last write (no edit since the RECON56 build; v1/v2 unbuilt).

Refutation proof, numbered disk lines (measured on disk this round, builder-verified):
disk 10155: `       // ------ Phase 2 Execution Logic ------` (section header, NOT a guard comment - stays, must stay)
disk 10156: `       //--- [S1-DEMO-GUARD-001] G1 demo gate FIRST (Luna V128 clearance; run on`
disk 10157: `       //--- token+word): execute-mode on non-demo or non-recorded login aborts before`
disk 10158: `       //--- magic/concurrency/sizing/send. Recorded demo login 1500183638 (measured).`
disk 10159: `       if(InpMode == MODE_EXECUTE && (AccountInfoInteger(ACCOUNT_TRADE_MODE) != ACCOUNT_TRADE_MODE_DEMO || AccountInfoInteger(ACCOUNT_LOGIN) != 1500183638))`
disk 10160: `         { GoAbort(ABORT_DEMO_GUARD, g_state); return; }`
disk 10161: `       if(InpMode == MODE_EXECUTE) PrintFormat("[SRJ-EA] DEMO_PASS mode=%d login=%d", (int)AccountInfoInteger(ACCOUNT_TRADE_MODE), (int)AccountInfoInteger(ACCOUNT_LOGIN));` (E2 renames the token only)
Therefore E1 (10156-10160) deletes all three comment lines plus gate plus abort; 10155 surviving is correct, not stale. Luna V248 defect #1/#3 rest on mapping the comment to 10155-10157 (off by one); defect #2 dissolves with the same proof (the page names it comment-plus-gate throughout).

Complete code, verbatim, no elisions (lines 10143-10161, governing branch plus E1 lines plus E2 line):
      if(InpMode == MODE_ALERT_ONLY)
        {
         PrintFormat("[SRJ-EA] ALERT_ONLY mode - no order sent. Session %s marked used.",
                     SessionName(g_sessionAtEntry));
         MarkSessionUsed(g_sessionAtEntry, g_anchorBarTime);
         ENUM_SRJ_STATE prevA = g_state;
         g_state = ST_SIGNAL;
         LogState(prevA, g_state);
         ResetSequence();
         return;
        }

       // ------ Phase 2 Execution Logic ------
       //--- [S1-DEMO-GUARD-001] G1 demo gate FIRST (Luna V128 clearance; run on
       //--- token+word): execute-mode on non-demo or non-recorded login aborts before
       //--- magic/concurrency/sizing/send. Recorded demo login 1500183638 (measured).
       if(InpMode == MODE_EXECUTE && (AccountInfoInteger(ACCOUNT_TRADE_MODE) != ACCOUNT_TRADE_MODE_DEMO || AccountInfoInteger(ACCOUNT_LOGIN) != 1500183638))
         { GoAbort(ABORT_DEMO_GUARD, g_state); return; }
       if(InpMode == MODE_EXECUTE) PrintFormat("[SRJ-EA] DEMO_PASS mode=%d login=%d", (int)AccountInfoInteger(ACCOUNT_TRADE_MODE), (int)AccountInfoInteger(ACCOUNT_LOGIN));

E2 replacement line (10161 modified, old-to-new):
       if(InpMode == MODE_EXECUTE) PrintFormat("[SRJ-EA] EXECUTE_ACCT mode=%d login=%d", (int)AccountInfoInteger(ACCOUNT_TRADE_MODE), (int)AccountInfoInteger(ACCOUNT_LOGIN));

Run rows, raw (carried from v245, same round evidence, no new run; RECON56 segment 04B9C64B, RECON55 segment EA5BCC5C):
[SRJ-EA] 2026.09.01 17:35:01 ABORT reason=DEMO_GUARD state=S5_GATE_CHECK poi=Monthly-POC dir=LONG
[SRJ-EA] 2026.09.04 16:00:00 ABORT reason=DEMO_GUARD state=S5_GATE_CHECK poi=Yearly-POC dir=LONG
[SRJ-EA] 2026.09.07 09:20:00 ABORT reason=DEMO_GUARD state=S5_GATE_CHECK poi=Weekly-POC dir=LONG
[SRJ-EA] 2026.09.08 10:10:00 ABORT reason=DEMO_GUARD state=S5_GATE_CHECK poi=Monthly-POC dir=SHORT
[SRJ-EA] 2026.09.08 17:00:00 ABORT reason=DEMO_GUARD state=S5_GATE_CHECK poi=Monthly-POC dir=SHORT
RECON55 pass shape (same 5 bars): CTrade::OrderSend: market buy 2.04 EURUSD sl: 1.15975 tp: 1.16077 [done at 1.16024] (9/1); market buy 0.57 sl: 1.15847 tp: 1.16302 [done at 1.16019] (9/4); market buy 2.49 sl: 1.16098 tp: 1.16200 [done at 1.16138] (9/7); market sell 1.92 sl: 1.16258 tp: 1.16102 [done at 1.16205] (9/8 10:10); market sell 1.92 sl: 1.16274 tp: 1.16114 [done at 1.16220] (9/8 17:00).

Prior, labeled (file + marker + digest, never anyone's words): PACKET_P-DEMOGUARD-2 v2 (01_TASKS\PACKET_P-DEMOGUARD-2.md 302023B3/9710, packet marker; E1 five-line delete + E2 one-line label rename, budget 11322-5=11317 +1 modified; parked per his words: any-demo gate, login parameterization, OnInit print, print-args change); V248 round on relay v245 (Luna DISCREPANCY-premise refuted above + 5 notes answered: A-2 already precise in packet G2, A-3 int kept, A-4/A-6 widened here, A-5 downstream by disk carry; Sonnet PRINCIPLED REFUSAL without technical defect, answered from record: his full-removal direction twice stated + tester-demo-simulation scope + default-alert-only safety + bars standing; GLM YES; Kimi YES with mode=0-for-live slip flagged; mechanism unanimous; all filed whole 1x under V248-DEMOGUARD markers); his direction verbatim 2026-09-23 ("re run not granted, infact i want you to remove the lock because i still use the demo account. the lock is too restrictive, i know what i am doing."); his tester-scope verbatim 2026-09-23 ("for this tester run, execute is okay cause it is demo account and on the simulation not a forward test."); Stakes on the page (his acceptance verbatim 2026-09-23, money authority): after removal the EA sends real orders on whatever account is connected, including a live account - "i know what i am doing"; BUILDER_RESULT_RECON56-EXITRANK-V1.md (0733DE5C/10410/177; guard-failure proof, phantom-lifecycle mechanism, re-seed cascade ledger 637).

Question (one, specific): Does the numbered disk proof on this page establish that E1 (delete 10156-10160) removes the entire guard comment with nothing stale remaining - closing Luna's V248 defect #1/#3 - with E1+E2 otherwise exactly as ruled and the audit line now reading every-EXECUTE-take truthfully?

Answer form: plain yes / no / discrepancy, with line numbers.

Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers — freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Review-seat packaging: the same relay text ships, but its verdict-slot line is excused for the review seat (standing seat-split: analysis out, review-only, never keys — nothing refused because nothing unanswerable is asked).

Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
```

(End of file)
