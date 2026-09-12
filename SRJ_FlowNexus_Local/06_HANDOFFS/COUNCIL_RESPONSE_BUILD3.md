# COUNCIL_RESPONSE_BUILD3.md - Opus 5 reply, verbatim as relayed by operator 2026-09-11
## PART 1 (first relay, broke off mid-sentence at "plaus")
## Blocker first
The relay is complete as a briefing, but **no source arrived with it**. The `<file_context>` block is empty and I have no access to the literal paths in section 7. I cannot read `Experts\SRJ_FlowNexus_EA.mq5`, cannot re-hash the four digests, cannot see `RECON3-BUILD3_TABULATION.txt`, and cannot run a compile or a timed backtest.
So the parts of the ask that require the instrument - line numbers, per-call cost x call count, a digest pair, same-window timing - I can't produce yet. What follows is shaping only, which is what C1/C2 explicitly permit. No edit packet is issued.
To answer C1 with numbers I need, in order of importance:
1. `Experts\SRJ_FlowNexus_EA.mq5` at digest `7BB1E9B6…CB3C` (pasted or attached).
2. The **digest of "original"** - section 5 concedes it is unpinned. Without it the perf delta has no defined endpoints, and any number I report is comparing against a guess.
3. `RECON3-BUILD3_TABULATION.txt` plus the G5 census block, so I can state what an identity-preserving change must reproduce verbatim.

## C1 - Performance: shaping the profile-then-trim
### The timing series does not yet support the operator's claim
Taking section 5 at face value: SHADOW 0:58:22.9; GATE 0:57:33.5 (-0:49);
ANYSTATE 0:47:12.2 (-10:21); SLREF 0:51:07.9 (+3:56); SLREF2 0:59:54.7 (+8:47);
BUILD3 1:03:47.5 (+3:53).
The series is NOT monotonic in feature count. GATE is faster than SHADOW despite
adding the confirmation gate; ANYSTATE is a 10-minute outlier low; SLREF2 costs
+8:47 over SLREF while CQD censuses are identical between them. Either large costs
are being added and removed in ways the feature narrative doesn't capture, or these
are single runs contaminated by machine state (other load, disk cache, journal file
growth, terminal build differences).
Total spread SHADOW -> BUILD3 is 5:25, about 9%. The operator's felt slowdown is
plausibly larger than the 9% spread the table shows, because felt slowdown tracks the
*last* comparison made, not the lineage endpoints. But it is also possible the felt
comparison is against a build that is not in this table at all. Either way, the table
as given cannot carry the C1 conclusion, for three reasons:
- The endpoints are undefined. Section 5 concedes "original" is unpinned. A trim
  target derived from an unpinned baseline is unfalsifiable.
- Single runs, no repeats. GATE < SHADOW and the ANYSTATE outlier both point at
  run-to-run variance of a size comparable to the effect being measured. Without at
  least three runs per build, the 3:53 BUILD3 delta is not separable from noise.
- Journal growth is a confound. Each build in the series added prints. The journal
  file grows across the series, and journal writes are on the critical path in the
  tester. Part of the trend may be I/O, not compute.
### The cheap experiment that splits the problem in one run pair
Before any trim, run the same window twice on the unchanged 7BB1E9B6 EA: once
InpDebugLog=true, once false.
- Large delta -> the cost is print/journal I/O, and the trim is gating and string
  construction.
- Small delta -> the cost is compute in the per-bar and per-tick paths, and the trim
  is hoisting and call-count reduction.
This costs two runs, changes no code, and cannot threaten the RECON3-BUILD3 identity.
It should precede everything else in C1.
### Where the cost most likely lives (ranked, all pending source)
1. Gating site, not gating existence. Section 5 states all prints are InpDebugLog-gated.
   The distinction that matters is WHERE. If the pattern is a helper that checks the flag
   internally - DbgPrint(StringFormat(...)) - then StringFormat and every argument are
   evaluated on every call regardless of the flag. The gate saves the write and nothing
   else. Only a call-site if(InpDebugLog){...} around the whole construction avoids the
   formatting cost. With twelve EXITVERDICT lines per bar plus CONFIRMPOLL plus EXITCENSUS,
   this is the single largest candidate and it is verifiable by inspection.
2. Per-tick work that should be per-bar. 563338 ticks over 3168 bars is ~178 ticks per bar.
   Any poll, census, or buffer read sitting on the tick path instead of behind a new-bar
   guard costs 178x its intended budget. Prime suspect for the SLREF2 +8:47 given CQD
   censuses identical to SLREF - same outputs, much more time = redundant re-evaluation.
3. CopyBuffer call count. Each call is a cross-module copy. The twelve-line RetestBook poll
   and the SL_STRUCT walk are where the same buffer is most likely read repeatedly inside a
   loop. One copy per bar into a cached array, hoisted above the loop, is the standard fix
   and is behaviour-preserving as long as the cached window covers every touched index.
4. Repeated accessor calls - iTime, iClose, SymbolInfoDouble, handle lookups - inside the
   per-bar loops. Cache once per bar.
5. ArrayResize growth in loops without reserve. Cheap to fix, usually small win, check
   only after 1-3.
### The profiling instrument proposed (not built, no packet)
GetMicrosecondCount() accumulators around named regions - SEED, SUPERSEDE, CONFIRMPOLL,
TP_ELECT, SL_STRUCT, EXITVERDICT, RETESTBOOK_POLL - with counters, emitted once in OnDeinit
as a PERFCENSUS block giving per-region total, call count, and mean per call. That produces
exactly the per-call cost x call count C1 asks for. Additive, touches no signal path, so
section 3 identity holds by construction. Still needs an operator token to build.
### Identity proof standard for any trim
Any accepted trim must show: G5 censuses byte-identical (WS161 21/3168/3168/208 mismatch=0;
BIASCENSUS 1554/1614 x2 fail=0; ZONECENSUS 3168/1056; XOB-PROMO 469; CQD 906 =
170/308/263/165), the section 3 signal and exit set unchanged, and - the strongest check -
the debug-on journal diffing clean against RECON3-BUILD3_JOURNAL.log except timing lines.
Report the new EA digest and the same-window wall time alongside.
## C2 - Day-close flat: shaping only
Finding that outranks placement: WS161 is pinned at fields=21. If the flat check emits
a new WS161 field, the identity 21/3168/3168/208 breaks by construction, and RECON3-BUILD3
stops being reproducible as written. Either the census rides an existing field, or the
operator accepts a new WS161 baseline and a fresh recon. Strategy-adjacent - back thru relay.
Placement. The ruled exits - TP_TOUCH, SL trade-through, body-close BREAK, HTF_FLIP - are
price and structure predicates. The day-close flat is a TIME predicate. Putting the time
check first would let it preempt ruled exits on the last bars, changing ruled behaviour.
Conservative shape: evaluate the four ruled exits in existing order, and only if none fires,
apply the flat. That confines the change to trades that would otherwise carry overnight,
which is what the spread-plus-swap rationale targets.
Recommended build order: ship as SHADOW census first, mirroring POIREPLACE counterfactual.
A DAYCLOSE_SHADOW print recording every bar where the predicate is true, whether a trade
was open, and what the flat price would have been - no exit taken. Measures in-window blast
radius before anything changes; identity-safe.
Close reference - three options, operator decides:
Daily bar rollover (D1 bar time): most reproducible in tester, may not match broker close.
SymbolInfoSessionTrade: available, but tester session data can differ from live.
Fixed hour:minute input: fully deterministic, silently wrong under DST/server-time shifts.
Council reading: daily bar rollover as reference with the 5-minute offset as separate input,
but that is a build decision awaiting a token.
Strategy questions back to operator (council will not assume):
1. Every day, or Friday only? Swap points at daily rollover; spread at Friday/session edges.
2. Priority when TP touch and flat are both true on the final bar - which books the R?
3. Wednesday triple-swap: special handling, or uniform?
4. Flat applies to floating setups only, or also unfilled pending prep (S1-S4)?
5. ALERT-ONLY confirmed for the flat notice, same as everything else?
## C3 - Nothing to report
No findings with line numbers, because no lines. Section 2/4 ruled behaviour recorded as
ruled; not proposing to touch it.
## What council needs to convert this into a numbered C1 answer
1. Experts\SRJ_FlowNexus_EA.mq5 at 7BB1E9B6 (257968 B).
2. A digest for "original" - without it, C1 has no defined baseline; the perf delta stays
   unfalsifiable. The one blocking item only the operator can supply.
3. RECON3-BUILD3_TABULATION.txt and the G5 census block.
4. Optionally Include\SRJ\SRJ_OrderblockMgr.mqh - the SL_STRUCT walk and buffer-27 branch
   live across the EA/manager boundary; hoisting depends on which side reads sit on.
No edit packet issued. No git action. Awaiting council packet or operator token.
