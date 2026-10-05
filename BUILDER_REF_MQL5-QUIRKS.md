# Builder reference: MQL5 / MetaTrader 5 quirks (niche environment)

Ordered 2026-09-27 (operator: little training data exists for this niche, so keep a called-upon quirks file). Purpose: stop generic-language assumptions from reaching packets, relays, and grades. Read whole before drafting any MQL5 code, packet edit, or relay row claim.

Rule: every entry carries disk evidence (EA line, journal proof, or his filed words with source). No evidence = not a quirk - never cited, never built on. Unverified lore lives ONLY in section 5, never in operative prose.

## 1. Language quirks (verified in Experts\SRJ_FlowNexus_EA.mq5, built tree 14C7476C/660687/11975)

- 64-bit integers print with %I64d (10 uses; uj_tradeSeqNext is long, EA-318; uj_tradeSeq latched EA-10425). %d on a long misprints - sequence keys always %I64d.
- Prices format with DoubleToString(v, _Digits) (310 uses). Symbol-agnostic across 3-digit JPY and 5-digit EURUSD - never hardcode digits.
- Distances in points via MathAbs(a-b)/_Point (51 uses). _Point and _Digits resolve per-symbol at runtime.
- Bar times via iTime(symbol, PERIOD_CURRENT, shift) (154 uses); display via TimeToString(dt, TIME_DATE|TIME_MINUTES) (258 uses). Shift 0 = forming bar, 1 = last closed bar.
- New-bar detection is manual: static s_lastBarTime compared against iTime(...,1) at OnTick entry (EA-11951-11956). Evaluation runs on closed bar 1; fill/entry reads shift 0. Never assume event-driven bar callbacks.
- Strictly sequential execution: zero synchronization primitives on disk (CriticalSection/Mutex 0 hits, double-pattern confirmed). Globals are mutated freely across the pass - write sequential code; import no locking/threading assumptions from other languages.
- Strings concatenate with + ; parse with StringFind/StringSubstr (2/15 uses; B0 helper pattern). ReadFlow-style bool reads convert via ? 1 : 0 for print fields (Fix-C pattern).
- Indicator reads: CopyBuffer used directly (11 uses) beside ReadFlow/ReadBuf1 wrappers. EMPTY_VALUE (179 hits) means warmup/no-data - every buffer read fails open on it; a freshly attached indicator reads empty until fed (UpstreamReady gates).
- Buffer discipline: SetIndexBuffer count MUST equal #property indicator_buffers in the same edit (FlowLogic: 48/48, SetIndexBuffer region EA-705 + property line). A shortfall compiles 0/0 and dies at bar one - see BUFFER-COUNT RULE.
- Enums print via (int) cast (DirName + (int)g_dir pattern); enum-typed inputs (e.g. InpMode, EA-32) compare directly.
- ICUSTOM-INPUT-GROUP-SHIFT (2026-10-05, relay B-28 j13 evidence): an `input group` line consumes one positional iCustom argument slot, shifting every later value one place. The EA passes (1, 3000, PERIOD_H4, PERIOD_H1, PERIOD_M15, true, 60) after the indicator name, but FlowLogic OnInit receives ctf=3000, lookback=16388 (=PERIOD_H4, not the requested 3000), htf1=16385 (=PERIOD_H1), htf2=15 (=PERIOD_M15), htf3=1 (the `true` read as 1, numerically == PERIOD_M1), conf=1 (the 60 read as true), maxobj=60 (default, no argument left). Evidence: j13 start-up print `SRJ-FL-B28IN ctf=3000 lookback=16388 htf1=16385 htf2=15 htf3=1 conf=1 maxobj=60 H4=16388 H1=16385 M15=15 M1=1` (RECON62-B28I_JOURNAL.log:92; day-log 20261005.log:683636). Consequence on record: the engine replays a 16388-bar window (B-25 copied=16388) and the all-7 build's `false` never reached the confirmed-selection bool (its 60 did, read as true).

## 2. Tester quirks (verified in harness runs + journal segments)

- Window source: terminal.ini [Tester] DateFrom/DateTo in UNIX seconds. FromDate/ToDate keys are IGNORED by this build - editing them tests nothing.
- Window proof: the journal "testing of ... from ... to ..." line after launch is the ONLY range proof, never the edit script's echo. Wrong-range runs void within minutes under a NEW RunName.
- Inputs ride the run ini (Expert/Symbol/Period/Inputs only); a separate run ini never carries the window. Input changes need no rebuild.
- MQLInfoInteger(MQL_TESTER) is nonzero under tester, zero on a live terminal. Code paths diverge on it: the execute leg requires MODE_EXECUTE plus tester (EA-11485).
- Alert-only is structural: InpMode defaults ALERT_ONLY (EA-32). Trade calls exist in-tree (OrderSend 3x, CTrade 1x) but the admission gate prints ALERT_ONLY and sends nothing (EA-10432). Alert-only stands regardless of packet content.
- Print volume: InpDebugLog gates 179 print sites. Ungated prints flood the ~25MB day log; journal reads stay tail-only, rows ride by segment splice.
- Tick feed: runs generate tick series (RECON65: 655546 ticks, 2880 bars). Probe rows carry ticktime plus lag=chartTime-1bar - timing claims read those fields, never wall clock.
- Terminal hygiene: metatester64 orphans kill the next run on port conflict. Graceful-close first, enumerate agents pre-launch, never force through a lock.
- Binary proof: the .ex5 sits beside the .mq5. Every grade re-verifies EA digest plus ex5 timestamp before attributing takes (RUN-BINARY-PROOF).

## 3. Trading-domain quirks (HIS words via strategy skill - never code-derived; SRJ-derived unless a dated entry says otherwise)

- Sessions: London from 9:00 (8:55 earliest, 9:00 open executable). One valid take per pair per session; floating London never blocks NY.
- Spread/swap: 7 Sep 00:00 spread printed 18 on his chart. Day-close exit at 23:55 opening price avoids swap plus new-day widened spread.
- 1R admission floor inclusive: flat 1.0 valid, 0.99 below. R measured at entry open price.

## 4. Deliberately NOT in this file (unverified - record-first before using)

- MetaEditor exact compile command line and flag set.
- Tester modelling options (every-tick vs 1-minute OHLC) and mismatch-chart mechanics.
- Spread/slippage tester configuration and deal-to-tick join semantics.
- Order/history API semantics beyond the cited gated lines.
- Any MQL5 standard-library claim not evidenced in sections 1-2.

## 5. Maintenance (his standing order: always upgrade from past mistakes)

- Every defect caused by an MQL5/MT5 quirk appends a dated entry with evidence the same turn. Quirk pins own the mechanism wording; skill pins (§23-class) own the process - one never substitutes for the other.
- PORTFOLIO (2026-09-29): sections 1-2 are strategy-neutral and bind every build. Section 3 entries carry their strategy (SRJ unless dated otherwise); HORC and future strategies append their own domain quirks as dated subsections with evidence, never by editing SRJ entries.
- Re-verify EA line numbers after any rebuild (all EA-NNN cites drift per build); counts re-derived, never carried.

(End of file)
