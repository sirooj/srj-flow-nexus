# CODE REVIEW REQUEST - v255 - 2026-09-23 (packet P-EVICT-1 v5, folds V254 round 1-YES/3-discrepancy on range only; no build/run/clear on this page)

Council session: CONTINUE v254 (same packet line, range fixed; prior relay 06_HANDOFFS\BUILDER_RELAY_COUNCIL_v254-EVICT-4.md 0c432685934f158048909cf8a34584ebb04a5b5edf60d92de722a11466a6217f/15784/224 superseded unbuilt; V254 verdicts Opus/GLM/Kimi/Sonnet below; disposition proofs stand by labeled reference: v254 fences GoAbort/Reset/session/Q3/stamp/LogAbort/call-sites + v252 contract).

Run cost: one build (define + disposition + comment, gated) + one tester run, ceiling 90 min (same envelope as RECON58, 52 min measured).

Project brief (standing - read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: this packet v1 through v9; relays v162 through v172 on disk; every version folds the prior round's verdicts (see each relay's delta paragraph). Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

V254 fold (narrow round - one fix + standing proofs by reference):
- Range fix (Opus D-1, GLM D1, Kimi binding item, Sonnet dead-var): packet v5 states replace EA 8801-8808 (absorbs old 8801 decl AND old 8808 return; after-shape terminal return is THE return; old ternary gone whole, no unreachable remnant, no duplicate decl). S1 asserts single terminal return with the 8809 close surviving.
- Disposition stands (no re-review asked): Kimi-YES on v254 page; GLM flips to yes contingent on exactly this range fix; Opus/Sonnet rule the disposition sound with the range as the sole blocker. All other V254 nits (one-liner marker, KL/pair wording, A6 class, shadow/counter, warmup, enum, B1-widening) ride as filed record, unchanged by this amend.
- One-liner kept as branch marker per GLM's stated alternative (reword accepted over merge); fold text matches code.

Change (one plain sentence): the replace range reads 8801-8808 so the old declaration and the old return both go with the old ternary and the after-shape compiles with one terminal return.

File / function / lines: Experts\SRJ_FlowNexus_EA.mq5 - E1 defines + E2 EvaluateClosedBar S5 block, proposed and disk below.
Source digest: EA b01cba646a337ee2e95f040782615d531c59423000746f50eafe653cabe2b14d / 622155 B / 11317 lines, measured after the last write. Packet 01_TASKS\PACKET_P-EVICT-1.md 427aaa0fcac9c3f7948fc24781627518e14fcdcb7a504cad58b2bad3a81a133f / 12138 B / 107 lines. Prior relay 06_HANDOFFS\BUILDER_RELAY_COUNCIL_v254-EVICT-4.md 0c432685934f158048909cf8a34584ebb04a5b5edf60d92de722a11466a6217f / 15784 B / 224 lines.

Proposed E1 after-block (add ONLY F1:2; F1:1 context already at EA 319):
```
#define ABORT_POI_REPLACED     "POI_REPLACED"
#define ABORT_DIV_FALLBACK     "DIV_FALLBACK"

```

Proposed E2 after-shape (packet v5 new lines; replaces EA 8801-8808, leaves 8792-8800 and 8809 untouched):
```
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

Proposed E3 after-shape (packet v4 E3 new lines, unchanged v4→v5, twin-checked):
```
       //--- [P-EVICT-1] divergence-miss disposition: refused S4-origin holders
       //--- ABORT (DIV_FALLBACK); S3 pre-bind rollback kept; other origins keep
       //--- today's behavior with unconditional census. LogAbort unconditional;
       //--- A6REFUSED and STAND-DOWN gated (debug/armed); DIV_WAIT emit above
       //--- stays the marker. Retry converted 0 of 4 distinct refusals (57/58).
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

Q1 verdict: with replace range 8801-8808 (old declaration and old return both absorbed, after-shape terminal return the only return, 8809 close surviving per S1 assert), is the v5 disposition clear to build?
Q1 answer form: plain yes / no / discrepancy, with line numbers.

Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Review-seat packaging: the same relay text ships, but its verdict-slot line is excused for the review seat (standing seat-split: analysis out, review-only, never keys - nothing refused because nothing unanswerable is asked).

Verification split: rule on the page only - genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.

(End of file)
