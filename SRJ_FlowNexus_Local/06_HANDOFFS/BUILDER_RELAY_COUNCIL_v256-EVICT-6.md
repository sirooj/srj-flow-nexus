# CODE REVIEW REQUEST - v256 - 2026-09-24 (packet P-EVICT-1 v6, folds key-refusal round; no build/run/clear on this page)

Council session: CONTINUE v255 (same packet line, packaging fixed; prior relay 06_HANDOFFS\BUILDER_RELAY_COUNCIL_v255-EVICT-5.md 4d9e3bdc5550d94e368b30bfd62fbbb37c6e0553daf9cc64a54fe828ca31045b/6449/87 superseded unbuilt; V255 verdicts Opus-YES-on-range/GLM-YES/Kimi-YES/Sonnet-YES folded below; disposition proofs stand by labeled reference: v254 fences GoAbort/Reset/session/Q3/stamp/LogAbort/call-sites + v253 before-state).

Run cost: one build (define + disposition + comment, gated) + one tester run, ceiling 90 min (same envelope as RECON58, 52 min measured).

Project brief (standing - read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: this packet v1 through v9; relays v162 through v172 on disk; every version folds the prior round's verdicts (see each relay's delta paragraph). Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

V255 fold (packaging round - code frozen since v5 proven range, all items textual):
- E3 anchor explicit (Opus blocking): E3 rewrites 8787-8791 IN PLACE, same lines; E2's replace starts at 8801, no overlap, no move, nothing homeless.
- One-liner kept as branch marker (GLM alternative adopted over merge): fold text matches code - one disposition block (E3) + one branch marker (E2 one-liner).
- Gating split (Opus-A3): E3 names LogAbort unconditional vs A6REFUSED debug-gated vs STAND-DOWN armed-unsignaled; per-eviction alerts WANTED by default (alert-only).
- Honest tally: v255 ruled 3 plain YES (GLM/Kimi/Sonnet) + 1 YES-on-range with packaging discrepancy (Opus); key-ask overstatement withdrawn on record.
- Line-count fork settled by S1 rule: E3 rewrites in place (net +0); post 11330 stands; variants noted as hypotheses disk decides.
- F1 blank: separator, S1 verifies post-count; E1 adds ONLY the DIV_FALLBACK line (exists-once assert).
- 8809 close carried in before-state fence; GoAbort/Reset/session/Q3/stamp/LogAbort/call-sites stand by v254 reference; S1 asserts single terminal return.

Change (one plain sentence): packaging fixed with zero code change since v5 proven range - comment anchored in place, gates split honestly, tally honest.

File / function / lines: Experts\SRJ_FlowNexus_EA.mq5 - E1 defines + E2/E3 EvaluateClosedBar S5 block, proposed and disk below.
Source digest: EA b01cba646a337ee2e95f040782615d531c59423000746f50eafe653cabe2b14d / 622155 B / 11317 lines, measured after the last write. Packet 01_TASKS\PACKET_P-EVICT-1.md adda5b1d8a21d4ac7feb5303b2090380a82308f5d34b27bbfaf1c8166e9105be / 12111 B / 107 lines. Prior relay 06_HANDOFFS\BUILDER_RELAY_COUNCIL_v255-EVICT-5.md 4d9e3bdc5550d94e368b30bfd62fbbb37c6e0553daf9cc64a54fe828ca31045b / 6449 B / 87 lines.

Proposed E1 after-block (add ONLY F1:2; F1:1 context already at EA 319):
```
#define ABORT_POI_REPLACED     "POI_REPLACED"
#define ABORT_DIV_FALLBACK     "DIV_FALLBACK"

```

Proposed E2+E3 after-shape (packet v6 new lines; E2 replaces EA 8801-8808, E3 rewrites 8787-8791 in place):
```
       //--- [P-EVICT-1] divergence-miss disposition: refused S4-origin holders
       //--- ABORT (DIV_FALLBACK); S3 pre-bind rollback kept; other origins keep
       //--- today's behavior with unconditional census. LogAbort unconditional;
       //--- A6REFUSED debug-gated; STAND-DOWN fires when armed (wanted, alert-only).
       //--- Retry converted 0 of 4 distinct refusals (57/58); DIV_WAIT stays marker.
         //--- [P-EVICT-1] refused S4 holders abort (squatter GC, positive test).
         if(g_confirmFromState == ST_S4_ARMED)
           {
            GoAbort(ABORT_DIV_FALLBACK, g_state);
            return;
           }
         if(g_confirmFromState == ST_S3_ZONE_WAIT)
           {
            ENUM_SRJ_STATE prevDiv = g_state;
            g_state = ST_S3_ZONE_WAIT;
            LogState(prevDiv, g_state);
            return;
           }
         PrintFormat("[SRJ-EA] EVICT_UNEXPECTED_ORIGIN bar=%s origin=%s",
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                  TIME_DATE|TIME_MINUTES),
                     StateName(g_confirmFromState));
         g_state = ST_S4_ARMED;
         LogState(ST_S5_GATE_CHECK, ST_S4_ARMED);
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

Q1 verdict: with E3 anchored in place, gates split honestly, tally honest, and the v5 range/disposition standing by reference, is the v6 packaging clear - ready to build on Luna key plus run word?
Q1 answer form: plain yes / no / discrepancy, with line numbers.

Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Review-seat packaging: the same relay text ships, but its verdict-slot line is excused for the review seat (standing seat-split: analysis out, review-only, never keys - nothing refused because nothing unanswerable is asked).

Verification split: rule on the page only - genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.

(End of file)
