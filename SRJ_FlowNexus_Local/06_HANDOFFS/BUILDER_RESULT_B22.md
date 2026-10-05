# BUILDER RESULT B-22 - where the wrong 15m read comes from: slot chain mapped, his source found, runs not runnable without new code; MEASURED (record)

Trader summary: no code changed, nothing ran, and that is the finding. Two things are now proven on record. First, your 15m reads come from the panel on your 5-minute chart - two of your screenshots show that panel with its 15m row, and nothing on record shows a separate 15-minute chart. Second, the machine's vote at each 5-minute bar is fully mapped and reproduces the observed flips exactly: it reads a slot one bar older than the evaluated bar, written with engine state frozen since the last 15-minute boundary. The two indicator runs this relay wanted cannot run headlessly without writing a wrapper program, which is forbidden - so the engine-vs-native comparison is still open and is carried with everything the next attempt needs.

## Part 0 - fresh-session start
- 0.1 ls-remote GitHub builder/B-21 returns 383cb03 (verified, no fallback). Branch builder/B-22 cut from it. Dirty tree kept (88 lines), nothing reset, no git-config/remote change. Push only to GitHub builder/B-22, only Part F files.
- 0.2 read in order: AGENTS.md, relay skill, strategy skill (sections 5/7/11 pins), pointer, RESULT_B21 (carried first, P/C/D), RESULT_B17 Part E whole, RESULT_B15 missing-valid rows.
- 0.4 SHAs match, with one explained deviation (no STOP-A): EA 964803F4 (688599 B); EX5 7C46B16C; HTFEngine D5FD5B06; FlowLogic.mq5 956BF3E3 (newly measured); FlowLogic.ex5 27B5F272 (27B5F272 binary from 956BF3E3, NOT the B-21 FFD77DB7 build - confirmed); relay skill 3D27264E (diff vs C3F3AE85 is exactly his RAM-order launch-then-stop bullet of 2026-10-05, operator-ordered); strategy 2B76301A with 15M-READS at line 141.
- 0.5 no backups needed (no source edit); 0.4 SHAs re-taken at close, all unchanged (Part E).

## Part P - pre-checks (read-only)
- P1 slot/timing chain, raw blocks (located by text, real numbers):
  1. FlowLogic OnCalculate: `for(int i = start; i < rates_total; i++)` (993); `int target = i - 1;` (1072); `g_bufHtfLo[target] = (h3_b == "Bull") ? 1.0 : (h3_b == "Bear" ? -1.0 : 0.0);` (1200); `SRJ_HTF_RunAll(inHtfLookbackBars,inHtfMaxTrackedObjects,` (1446, after the loop).
  2. HTFEngine RunOne: `int copied = CopyRates(_Symbol, tf, 0, barsToFetch, rr);` (534); `if(newestHTFTime == e.lastProcessedHTFTime)` return (547); `if(g_ratesTotal > 0 && !g_newBar)` return (549); `SRJ_HTF_StateInit(e);` (559) + `for(int j=2; j<copied; j++)` replay (560).
  3. ProcessBar: `bool barClosed = (j < htfTotal - 1);` (114); live `e.outBias = retBias;` (507-510); `if(barClosed){ e.cBias = retBias; ... e.outCBias = e.cOpp...}` (512-516). GetOutputs selects by flag (598-605).
  4. EA: `return ReadBuf1(g_hFlow, bufIdx, outVal, evalShift + FLOW_SHIFT_OFFSET);` (2055-2058) with `#define FLOW_SHIFT_OFFSET 1` (2003); guard sites printing UJALIGN_PASS/NOMATCH/BYPASS reading `ReadFlow(FL_BUF_HTF_LOW, ..., barShift)` (9105-9111, 9264-9265) with barShift=1 on the M5 new-bar pass (EvaluateClosedBar(1,...)).
- Mapping line (required): The EA vote read at M5 pass P (evaluating M5 bar B=P-5min) comes from slot index CopyBuffer position evalShift+FLOW_SHIFT_OFFSET = 2, i.e. M5 bar B-5min, which was written with HTF state from the RunAll call at chart time of the previous calculate (engine frozen since the last 15m boundary), which last processed 15m bar = the forming 15m bar as of that boundary (about one tick) plus all closed bars. Worked example 1 Sep, pass 17:00, B=16:55: slot 16:50, written at the 16:55 pass with engine state recomputed at the 16:45 boundary (forming 16:45 first tick + closed history); last closed 15m at that moment = 16:30 candle. He at 17:00 reads the last closed 15m = 16:45 candle. So the EA vote reflects 15m information one full candle older than his read at decision time. This model reproduces the observed intra-candle flips exactly (pass 16:50 reads pre-boundary slot=true-bull; pass 16:55 reads post-boundary slot=bear).
- P2 prints: `bool SRJ_InDebugWindow(const int bar)` (653-667): false unless g_htfDebugLog; both debug bounds zero means whole history; else bar time within [from,to]. inDebugFromTime/inDebugToTime are strings parsed by StringToTime (MQL5 "YYYY.MM.DD HH:MM"), empty means unbounded (FlowLogic 831). `SRJ BIASEND` (1440-1443): prints t=bar time, bar=i, bias=g_s.currentBias (M5 structure bias after bar i). g_htfDebugLog-gated prints: SWINGIMB pair (1145/1156), STRUCTLEG/SWEPTMASK (1415/1422/1424), EXPORT block incl. htf=hi/mid/lo (1427-1436), BIASEND via debug window (1440-1443); HTFEngine UJDBG latch + RunAll-tail `SRJ-HTF-UJDBG` with h4/h1/m15 stamps, prevcur, ready and outBias/outCBias pairs (563-595). Frequencies: BIASEND/EXPORT per bar in window when enabled; UJDBG per RunAll call.
- P3 his 15m source. Quotes: B-17 W2 screenshot (planner description): "Top-left panel: ORDERFLOW BEAR; AS.L to NA BULL; 4H Bear; 1H Bear; 15m Bear" on his EURUSD M5, 1 Sep, cursor 09:45; SEP8 finding: "Sep-4 panel: NY.H-to-NA BEAR; 4H Bear; 1H Bull; 15m Bear"; HTFSTACK memo: "the photographed 1H/15m/5m panel was the manual instance's remembered inputs"; CHART-READS-6/5 (skill 106): "The 1H is bearish [Image 1] and the 15m is also bearish [Image 2]". Presets: no .tpl under MQL5, no M15 FlowLogic preset in Profiles/Tester (only .set files for other EAs); ENUM_CHARTTF offers only CTF_1MIN/CTF_5MIN (FlowLogic 232), so R1 would have used CTF_5MIN with H4/H1/M15 HTF inputs.
- Output: SOURCE=5m-MTF-panel. Two independent screenshots show the MTF panel with its 15m row on his M5 chart at decision times; the 6/5 "M15 panel" image is panel-kind-unresolved on record (and its decision-time read is governed by his words, B-16). No native-15m-chart bias pane appears anywhere on record.
- P4 feasibility: R1/R2 NOT_RUNNABLE. The Strategy Tester runs Expert Advisors only; an indicator cannot run headlessly without a host program. The only existing host on disk, Experts/headless_test.mq5, hardcodes a CQD handle (no inputs, no FlowLogic) - adapting it is writing new code, forbidden. No wrapper EA/script written. A run would need: a minimal host EA that loads FlowLogic via iCustom with named inputs and drives the tester window (new code, operator + planner call).
- P5: no edit this relay; conflicts not applicable (nothing built). Pins that would govern a build: 15M-READS + FIX-NOT-REPLACE.

## Part C - runs (none; NOT_RUNNABLE per P4)
- C0: no terminal ran; terminal.ini untouched (June USDJPY throughout, verified Part E). No bench.
- C1/C2: not run (k1/k2 absent, no sizes). C3: no table (no data). C4: no verdicts (no data - neither N/T/C/MIX assignable without the native and engine series).
- C5: no STOP-A (gate explained, no mismatch); STOP-E clean (Part E SHAs unchanged); no STOP-B/S/D (no edit, no EA run).

## Part D - not triggered (requires P3 = NO_RULING; P3 = 5m-MTF-panel). No question goes to him.

## Part E - final disk state
- Re-taken SHAs, all unchanged: EA 964803F4; EX5 7C46B16C (matches source); HTFEngine D5FD5B06; FlowLogic.mq5 956BF3E3; FlowLogic.ex5 27B5F272. EX5 matches its source.
- terminal.ini [Tester] June USDJPY (Symbol=USDJPY, 1780272000/1781308800), independently read; no terminal running.
- k1/k2 absent (no runs, no sizes). j7/j8 on disk as before.

### Glossary (every code cited, few words each)
- UJALIGN_PASS/NOMATCH/BYPASS (m15/rf): 15m guard. UJPROBE (ltf/m15/div): per-bar bias/div probe. UJM15ROW (m15time/m15vote): 15m vote at 15m ticks. CONFIRMPOLL (confirm): confirmation terms. SUPPRESSED (HELD): holder kept. A6FIRED: fire record. ALERT SRJ SIGNAL/EXIT: entry/exit alert. SRJ BIASEND (t/bar/bias): native M5 bias print. SRJ-HTF-UJDBG (chart/stamp/prevcur/ready/out): HTF recompute record. SRJ_InDebugWindow: debug time gate. FLOW_SHIFT_OFFSET: CopyBuffer +1 settled slot. TPCENSUS: target census. MTSNAP/ENTRY_TICKET/MTEXIT/MTCLOSE/MTLIFE: election, fill, exit, close, life records.

## Part F - files, push
- F1 this file. F2 pointer updated (B-22 MEASURED; SHAs unchanged; P1 mapping + P3 source + NOT_RUNNABLE in one line each; Next = relay B-23).
- F3 commit + push to builder/B-22 on GitHub ONLY: BUILDER_RESULT_B22.md, BUILDER_SESSION_POINTER.md. Nothing else (no source/skill/journal edits exist to push).
- F4 ls-remote check, pasted in the reply.

## Carried note (for the planner; B-23 per its plan)
- P1 mapping line: the EA vote at M5 pass P reflects engine state frozen since the previous 15m boundary (read from a slot one M5 bar older than the evaluated bar) - about one 15m candle older than his last-closed read at decision time. It reproduces the observed flips exactly.
- P3 SOURCE line with quotes: SOURCE=5m-MTF-panel - "Top-left panel: ORDERFLOW BEAR; AS.L to NA BULL; 4H Bear; 1H Bear; 15m Bear" (his 1-Sep M5 screenshot); "Sep-4 panel: NY.H-to-NA BEAR; 4H Bear; 1H Bull; 15m Bear"; "the photographed 1H/15m/5m panel was the manual instance's remembered inputs". No native-15m-chart evidence on record.
- C4 verdicts: none assignable (no R1/R2 data) - not N/T/C/MIX, but unmeasured.
- Run-wide counts: none (no runs). Lag-vs-path split: not measurable without the native and engine series.
- Part D: not triggered (P3 resolved). No question for him.
- W1 gap half still UNBUILT (unchanged; still no ruling on a VWAP jump).
- R1/R2 NOT_RUNNABLE: the tester runs EAs only; the sole existing host (headless_test) is CQD-hardcoded; a FlowLogic host would be new code. A run needs a minimal host EA (new code, operator + planner call) driving the RECON62 window with the P2 inputs, or his word to run the EA itself as the host (not given).

(End of file)
