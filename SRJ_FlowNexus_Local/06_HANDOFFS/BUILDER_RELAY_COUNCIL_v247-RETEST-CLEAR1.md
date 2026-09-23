# RELAY v247-RETEST-CLEAR1 (2026-09-23 — first ask on PACKET_P-RETEST-2 v2; session CONTINUE, same round evidence as RECON57)

```
Project brief (standing — read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer — declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: this packet v1 through v9; relays v162 through v172 on disk; every version folds the prior round's verdicts (see each relay's delta paragraph). Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

CODE REVIEW REQUEST — v247 — 2026-09-23

Change (one plain sentence): Scope the pre-confirmation renewal void to mean-reversion-classified seeds so trend and unclassified seeds survive liquidity touches, restoring the two sweep-then-retest takes.

File / function / lines: Experts\SRJ_FlowNexus_EA.mq5, R2 renewal block, E1 line 7782 modified (condition only, same indent), zero lines added, zero deleted (11317 to 11317).
Source digest: 98F6BBACEE96A182D1C46D7605886E45886316FB636C3031C2CD7FD6083B736C / 622124 B / 11317 lines, measured after the last write (no edit since the RECON57 build).

Complete code, verbatim, no elisions (lines 7774-7790, scan loop tail plus void branch):
      for(int r2_k = 0; r2_k < 18 && !r2_touch && r2_mValid; r2_k++)
        {
         double r2_v;
         int r2_sweptBit = (r2_k <= 9 ? r2_k : r2_k + 4);
         if((r2_m & (1 << r2_sweptBit)) != 0) continue;
         if(ReadFlow(r2_bufs[r2_k], r2_v, barShift + 1) && r2_lo <= r2_v && r2_v <= r2_hi)
           { r2_touch = true; r2_val = r2_v; r2_buf = r2_bufs[r2_k]; }
        }
      if(r2_touch)
        {
         ENUM_SRJ_STATE r2_prev = g_state;
         g_state = ST_IDLE;
         g_anchorLine = -1;
         g_anchorBarTime = 0;
         LogState(r2_prev, g_state);
         if(InpDebugLog) PrintFormat("[SRJ-EA] SEEDVOID bar=%s dir=%s buf=%d line=%s evals=%d hi=%s lo=%s", TimeToString(barTime, TIME_DATE|TIME_MINUTES), DirName(g_dir), r2_buf, DoubleToString(r2_val, _Digits), r2_evals, DoubleToString(r2_hi, _Digits), DoubleToString(r2_lo, _Digits));
        }

E1 replacement line (7782 modified, old-to-new):
      if(r2_touch && g_regime == REGIME_MEANREV)

Run rows, raw (disk mechanism; RECON55 segment EA5BCC5C vs RECON51 fills, ledger 618):
[SRJ-EA] 2026.08.28 10:00:00 STATE S1_REGIME->IDLE dir=SHORT poi=-
[SRJ-EA] 2026.08.28 10:00:00 SEEDVOID bar=2026.08.28 09:55 dir=SHORT buf=12 line=1.16482 evals=66 hi=1.16491 lo=1.16473
[SRJ-EA] 2026.09.07 15:00:00 STATE S1_REGIME->IDLE dir=LONG poi=-
[SRJ-EA] 2026.09.07 15:00:00 SEEDVOID bar=2026.09.07 14:55 dir=LONG buf=15 line=1.16218 evals=277 hi=1.16236 lo=1.16218
51 fills (targets): 8/28 10:05 SHORT entry 1.16466 R3.43 (carried 09:55, confirm=1 on 10:00 bar); 9/7 16:45 LONG entry 1.16261 R2.34 (carried 14:55, confirm=1 on 16:40 bar). 51 predates R2 (built RECON53): no void branch existed, both seeds carried.

Prior, labeled (file + marker + digest, never anyone's words): PACKET_P-RETEST-2 v2 (01_TASKS\PACKET_P-RETEST-2.md 053D85FD/7062, packet marker; E1 one-line condition, budget +0/-0/+1 modified, lines stay 11317; his FRESH-SWEEP rule + TREND-SWEEP-IRRELEVANT ruling + TAKE demand banked strategy skill section 5; 9/4-invalid defense via S5 veto preserved); his direction verbatim 2026-09-23 (all-three order: retest, booking-closed-by-proof, classifier-sequenced; road: this window perfect, then new windows, forward demo, live); Stakes on the page (test-bed only: this edit changes which seeds survive to confirmation on tester; live activation needs a separate relay plus his explicit word); BUILDER_RESULT_RECON57-DEMOGUARD-V1.md (1E251DDA/6734; 5-of-7 scoreboard, both misses row-evidenced).

Question (one, specific): Does adding `&& g_regime == REGIME_MEANREV` to line 7782 confine the renewal void to mean-reversion-classified seeds while leaving fresh S1 seeds (regime NONE), trend/both-classified seeds, the veto path, and every other line behavior-identical, restoring exactly the two cited seed paths to confirmation?

Answer form: plain yes / no / discrepancy, with line numbers.

Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers — freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Review-seat packaging: the same relay text ships, but its verdict-slot line is excused for the review seat (standing seat-split: analysis out, review-only, never keys — nothing refused because nothing unanswerable is asked).

Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
```

(End of file)
