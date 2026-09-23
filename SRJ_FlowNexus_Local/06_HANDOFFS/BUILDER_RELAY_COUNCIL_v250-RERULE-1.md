# RELAY v250-RERULE-1 (2026-09-23 — slim re-rule: closes Luna V250-Q1 gaps with the seed-regime rows + writer enumeration; E1 unchanged, packet v2 operative; session CONTINUE)

```
Project brief (standing — read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer — declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: this packet v1 through v9; relays v162 through v172 on disk; every version folds the prior round's verdicts (see each relay's delta paragraph). Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

CODE REVIEW REQUEST — v250 — 2026-09-23

Change (one plain sentence): No code change since v249 (E1 line 7782 stands as ruled); this round proves with rows plus writer enumeration that both cited seeds read regime NONE at the void, closing the two evidence gaps.

File / function / lines: Experts\SRJ_FlowNexus_EA.mq5, S1 classify block, lines 7990-8001 (the sole non-NONE writer of g_regime). Operative packet unchanged: 01_TASKS\PACKET_P-RETEST-2.md v2.
Source digest: 98F6BBACEE96A182D1C46D7605886E45886316FB636C3031C2CD7FD6083B736C / 622124 B / 11317 lines, measured after the last write (RECON57 build, no edit since).

Complete code, verbatim, no elisions (lines 7990-8001, the only g_regime assignment besides init-NONE line 973 and ResetSequence-NONE line 6271):
     if(g_state == ST_S1_REGIME)
     {
      ENUM_SRJ_REGIME regime;
      if(!ClassifyRegime(barShift, g_dir, regime))
        { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
      if(regime == REGIME_NONE)
        { if(InpDebugLog) PrintFormat("[SRJ-EA] S1WAIT bar=%s dir=%s poi=%s sess=%s - regime unclassified, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
      g_regime = regime;
      ENUM_SRJ_STATE prev = g_state;
      g_state = ST_S2_LTF_ALIGN;
      LogState(prev, g_state);
     }

Run rows, raw (RECON55 segment EA5BCC5C; both seeds die in S1 with no S2 transition and no classification rows):
[SRJ-EA] 2026.08.28 10:00:00 STATE S1_REGIME->IDLE dir=SHORT poi=-
[SRJ-EA] SEEDVOID bar=2026.08.28 09:55 dir=SHORT buf=12 line=1.16482 evals=66 hi=1.16491 lo=1.16473
REGIMECENSUS SHORT rows in window 2026.08.28 09:00-10:05: zero (machine count 0, re-proved by second pattern dir=SHORT window pull).
[SRJ-EA] 2026.09.07 15:00:00 STATE S1_REGIME->IDLE dir=LONG poi=-
[SRJ-EA] SEEDVOID bar=2026.09.07 14:55 dir=LONG buf=15 line=1.16218 evals=277 hi=1.16236 lo=1.16218
REGIMECENSUS rows in window 2026.09.07 14:00-15:05: exactly one - [SRJ-EA] REGIMECENSUS #134 bar=2026.09.07 15:05 dir=SHORT votes=2 trendOk=1 sweepTag=0 mrOk=0 cumMR=0 (post-void SHORT re-seed at 15:10 wall, not the 14:55 LONG).
Writer enumeration (machine grep, whole EA file): g_regime written at exactly three sites - init NONE (line 973), ResetSequence NONE (line 6271), S1-classify (line 7997 above). Reads elsewhere never assign.
Therefore: each seed is born (ResetSequence NONE), never reaches S2 (no S2 transition in rows), so g_regime reads NONE at the R2 check (line 7782, pre-body) for both seeds - provably non-meanrev, touch-time equals seed-time here. Post-build rows will still settle fills empirically.

Prior, labeled (file + marker + digest, never anyone's words): PACKET_P-RETEST-2 v2 (01_TASKS\PACKET_P-RETEST-2.md 053D85FD/7062, packet marker; E1 one-line condition, budget +0/-0/+1 modified, lines stay 11317); relay v249 combined (B359E7B8/14144/173; Q1 cleared 3/4 effective, Q2 audit delivered); V250 round (Luna Q1-DISC on seed-regime evidence + lifecycle provenance + Sonnet/GLM/Kimi YES; all filed whole 1x under V250-COMBINED markers); KEY LUNA RETEST (NOT CLEARED for exactly one build plus one tester run - filed whole under KEY LUNA RETEST markers; graded valid reply, negative verdict; respected, never built on); Stakes on the page (test-bed build only; token + run word still owed after any clear; live activation needs a separate relay plus his explicit word).

Question (one, specific): Do the rows plus the writer enumeration on this page establish that both cited seeds read regime NONE at the R2 check - closing the seed-regime and lifecycle gaps - so E1 restores exactly the two cited seed paths to confirmation with nothing else changing?

Answer form: plain yes / no / discrepancy, with line numbers.

Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers — freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Review-seat packaging: the same relay text ships, but its verdict-slot line is excused for the review seat (standing seat-split: analysis out, review-only, never keys — nothing refused because nothing unanswerable is asked).

Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
```

(End of file)