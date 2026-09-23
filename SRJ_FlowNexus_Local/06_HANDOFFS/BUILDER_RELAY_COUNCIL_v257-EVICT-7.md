# CODE REVIEW REQUEST - v257 - 2026-09-24 (packet P-EVICT-1 v7, folds Luna V256 verdict; no build/run/clear on this page)

Council session: CONTINUE v256 Luna-only round (same packet line, D1 fix; prior relay 06_HANDOFFS\BUILDER_RELAY_COUNCIL_v256-EVICT-6.md EE50BE45/6577/87 superseded unbuilt; Luna V256 verdict (discrepancy on hardcoded from-state) folded below; disposition proofs stand by labeled reference: v254 fences GoAbort/Reset/session/Q3/stamp/LogAbort/call-sites + v253 before-state + v256 range).

Run cost: one build (define + disposition + comment, gated) + one tester run, ceiling 90 min (same envelope as RECON58, 52 min measured).

Project brief (standing - read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: this packet v1 through v9; relays v162 through v172 on disk; every version folds the prior round's verdicts (see each relay's delta paragraph). Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

V256 fold (one fix + wording, disposition + range + budget restated):
- Hoisted prevDiv (Luna D1/A5/B4): declaration moves to block top, used by S3 + default; S3-local duplicate gone; GoAbort recaptures its own (unchanged).
- Dynamic from-state logging (Luna D1): default branch logs LogState(prevDiv, ST_S4_ARMED) - prior state preserved, no hardcoded source.
- Only-behavioral-delta invariant stated (Luna A8): S4 aborts, S3/default reproduce old outcomes exactly.
- S4-definition equivalence stated (Luna A4): S4-origin is exactly confirmFrom == ST_S4_ARMED, the only value S4 promotions stamp (8629-guard + 8743-stamp census).
- One-liner kept as branch marker (prior fold alternative stands); 57/58 expanded to RECON57/RECON58 in E3 (Luna A6); pre/post count language kept explicit (Luna A7: 11317 pre measured, 11330 post expected).
- Switch dispatch REJECTED with reason (Luna B, Sonnet B): if-chain stands as ruled; B2 ungate/B3 switch/B5 pin all superseded by v7 shape (census already unconditional, prevDiv already hoisted, acceptance already disk-derived).
- Budget restated: E1 +1, E2 20 lines replacing 8 (net +12), E3 rewritten in place (+0); post 11330 stands.

Change (one plain sentence): prior-state logging restored on every branch with zero logic change since the Luna-reviewed shape - hoisted capture, dynamic from-state.

File / function / lines: Experts\SRJ_FlowNexus_EA.mq5 - E1 defines + E2 EvaluateClosedBar S5 block, proposed and disk below.
Source digest: EA b01cba646a337ee2e95f040782615d531c59423000746f50eafe653cabe2b14d / 622155 B / 11317 lines, measured after the last write. Packet 01_TASKS\PACKET_P-EVICT-1.md 2ef1a9e0c67f9b1d14637a65b5a87557e01baf8a79d3bef51f3e9a06a1becef7 / 12461 B / 107 lines. Prior relay 06_HANDOFFS\BUILDER_RELAY_COUNCIL_v256-EVICT-6.md EE50BE45/6577/87 (superseded unbuilt).

Proposed E1 after-block (add ONLY F1:2; F1:1 context already at EA 319):
```
#define ABORT_POI_REPLACED     "POI_REPLACED"
#define ABORT_DIV_FALLBACK     "DIV_FALLBACK"

```

Proposed E2 after-shape (packet v7 new lines; replaces EA 8801-8808, leaves 8792-8800 and 8809 untouched):
```
         //--- [P-EVICT-1] refused S4 holders abort (squatter GC, positive test).
         ENUM_SRJ_STATE prevDiv = g_state;
         if(g_confirmFromState == ST_S4_ARMED)
           {
            GoAbort(ABORT_DIV_FALLBACK, g_state);
            return;
           }
         if(g_confirmFromState == ST_S3_ZONE_WAIT)
           {
            g_state = ST_S3_ZONE_WAIT;
            LogState(prevDiv, g_state);
            return;
           }
         PrintFormat("[SRJ-EA] EVICT_UNEXPECTED_ORIGIN bar=%s origin=%s",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                  TIME_DATE|TIME_MINUTES),
                     StateName(g_confirmFromState));
         g_state = ST_S4_ARMED;
         LogState(prevDiv, ST_S4_ARMED);
         return;
```

Before-state old block, verbatim, no elisions (EA 8801-8808):
```
          ENUM_SRJ_STATE prevDiv = g_state;
         //--- [P-CONFIRM-ANYSTATE E3] the rollback returns to the promotion
         //--- origin: S3 for a pre-bind confirmation, S4 for the armed edge
         //--- (identical to the build-2 behavior for the armed path).
         g_state = (g_confirmFromState == ST_S3_ZONE_WAIT) ? ST_S3_ZONE_WAIT
                                                           : ST_S4_ARMED;
         LogState(prevDiv, g_state);
         return;
```

Q1 verdict: with hoisted prevDiv used by S3 and default, dynamic from-state logging, and the v6 range/disposition standing, is the v7 after-shape clear - ready to build on Luna key plus run word?
Q1 answer form: plain yes / no / discrepancy, with line numbers.

Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Review-seat packaging: the same relay text ships, but its verdict-slot line is excused for the review seat (standing seat-split: analysis out, review-only, never keys - nothing refused because nothing unanswerable is asked).

Verification split: rule on the page only - genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.

(End of file)
