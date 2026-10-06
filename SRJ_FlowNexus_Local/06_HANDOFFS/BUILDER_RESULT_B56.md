# BUILDER RESULT B-56 - June starts 25 May, lines come from seed plus ticks, F11 unpinned, full map changes nothing, MEASURED

Trader summary: your June window now starts 25 May as standard - that part is done in the config. Your long lines live in two places: the month, quarter and year lines come from a seed file, and when that file is refused those lines simply do not exist. On the fuller map your 5 June candle touches all six lines, but the machine holds the Monthly setup while its 5-minute disagrees and lets it go dead at 18:30 - and no words of yours on record allow holding against the 5-minute; your words say the opposite. Your 11 June and every other June cell come out exactly the same on the full map. Nothing was edited or compiled; no terminal launched; no tester run.

## Part 0 - fresh-session start
- 0.1 relay skill loaded first, whole. Relay B-56 wins over older queue items for its scope.
- 0.2 ls-remote builder/B-55 returns `3d25980ecd009691ee88330ba0dcece3de0320c3` (verified). Checked out builder/B-55, cut builder/B-56 from 3d25980. Dirty tree kept (251 `git status --short` lines; count only). No git-config/remote change. Push through remote `backup`.
- 0.3 read in order: pointer; RESULT_B55; SLICE_B55 (D1-D2, E4-E7, G1, R1); strategy GATE-AUTH (skill:115), CONFIRMATION-CANONICAL (skill:112), §11 (5m-at-entry skill:139), Ruling 2026-10-06 (skill:165-167); register sections A + B (rows + B-51/B-52 corrections); PLANNER_CONTEXT.md (whole, 44 lines).
- 0.4 start gate: git diff 3d25980 -- ten files EMPTY; disk SHAs all MATCH (EA 63B18C1F/ex5 B0D4AA9E, FlowLogic 956BF3E3/ex5 27B5F272, includes, MARKER 79859EDC/f0890c0b, terminal.ini 450ACB4A, j24 AC07557F, j23 75B7321C). Ledger tail 1198 single hit; journal 1061 lines; no terminal64 running. No STOP-A.
- 0.5 names as relayed (planner SuperApp AI; j23 PRE 390828 + j24 PRE 470095 + j25 DAYLOG-line-1 on their logs; ARM/FIRE; NY0506 16:15/160.723; ANS0506; LINES12; MLINES 6/7, WLINES 8/9, DLINES 10/11; MCAND_J25 seeded 15:25 S3 15:50 F11-hold 16:05 ARM 17:30 dead 18:30; STD_JUNE FromDate 1779667200 graded 6/01-6/12).
- 0.6 authority: terminal.ini FromDate only + restore (Part C); PLANNER_CONTEXT.md (Part W); one register line (Part G); result/slice/ledger/pointer; one push. EA, includes, MARKER, presets, journals, logs, Bases/, Files/ read-only. No source edit, no compile, no launch, no run.

## Part C - standard June window (config only)
- C1 terminal.ini.preB56 copied (SHA 450ACB4A); [Tester] DateFrom 1780272000 -> 1779667200 only (line 419; 874 lines both; python diff proves single-line). Before/after pasted in slice. New terminal.ini SHA 88a0deb1 (= STD_JUNE ini, kept as the standard).
- C2 no launch. preB56 stays untracked. No STOP-C (diff exactly one line).

## Part T - where each line gets its history
- T1 marker spans (line numbers this report): seed files SRJ_SEED_<SYMBOL>.bin + ckpt via SEED_FileName (Marker:2045-2046; SEEDFILE/SEED_Read/PARSED prints :2048-2089; refusal panel :2067-2076); adoption per SEED_SLOT rows with pre-seam backfill (j23:113-117 pattern); refused/absent seed = Q/Y truncated (Marker:2161-2168). Validity = inWin + SlotHasCompleteHistory + floor/seam gates (Marker:1714-1739; AnchorStartFor TickCore:351-389). Reach = available history, no bar cap (g_L sized rates_total :1274-1288; no lookback input among marker inputs :80-112). Plain sentences in slice.
- T2 seed files: Common\Files EURUSD 216116 B 8/20 (+ckpt 10267420 B), GBPUSD 177932 B 9/07 (+8401180 B), USDJPY 194384 B 9/07 (+8401180 B); MQL5\Files GBPUSD/USDJPY pairs only (no EURUSD). SEED_FILES as listed (USDJPY seam 2026.06.09 built 9/07; EURUSD seam 2026.06.26 built 8/20; slots D/W/M/Q/Y per SEED_SLOT rows).
- T3 ticks: EURUSD first month 202309 (gap 202412-202603, then 202604-202610); USDJPY first 202309 continuous to 202610. TICKS_FIRST 202309 both.
- T4 LINE_HISTORY: D = TICKS; W = TICKS (start-gated) + SEED backfill when accepted; M = TICKS (same gating); Q = SEED; Y = SEED; FOMC = EVENT-anchor (7/29 future in June). YQF_USDJPY = Q/Y refused seed (j24 PARSED->REFUSED SEAM_UNREACHABLE seam 6/09, FINAL accepted=NO); FOMC anchor after window. RECON62_DEPENDS = EURUSD seed (Common, built 8/20, seam 6/26 reachable, depth to 6/01) + ticks from 2025. Plain words: without that seed file the August run would lose your Quarterly and Yearly lines while the rest build from ticks - so yes, RECON62 would lose lines if the seed file were missing.

## Part F - Fix F11 vs his rules
- F1 F11 span (EA:7430-7499): scope S3..S5 (:7430); per-bar LTF invariant (:7438-7440); LTFFLIP print (:7441-7448, diagnostic per :7449-7457 strong/weak kind); hold iff 15m agrees or bar confirms (:7488-7494 UJLTFHOLD print, mode M15/CARVE + term), else deferred abort (:7495-7499 Fix S-a). F11_RULE plain: at S3-S5 an LTF-opposed candidate is held, not aborted, while the 15m agrees or the bar confirms it; otherwise the abort waits past evaluation. Re-checked every bar, latches nothing. LTF = 5-minute buffer (CheckLtfAlign EA:2427-2434); m15 = 15m vote + read flag; term = M15 or CARVE-with-confirm-term.
- F2 trail: ledger hits are packet/process refs only (earliest :6317 V243; "F11 acceptance" only in v24 packet line :6647); "LTF opposed" 0 hits ledger/journal/skill; findings 0; packets 229 code-paste hits, earliest P-RECON78-UJ-EXEC-1v10:140, none quoting him. Strategy 5m/LTF words: preamble :8/:12 (judged-against), §1:29 flip-against-hold experiment (trend only), §1:32 POI-rank-exits (rest cited B-53/54/55). F11_PIN = NONE (no verbatim authorizes holding while the LTF opposes; nearest: §8:116 kill-on-flip, §11:139 refuse-entry-against, §8-Q4 hold-after-entry-only).
- F3 counts: j24 44 holds (6/02,03,09,10,12 - none 6/05); j23 84 holds (8/26-9/09); j25 63 holds (5/29, 6/01,02,03,05,08,09,10,12). F11_ON_REGISTER: A1-A7 all N (holds hit other-session setups or none: A1 post-fire holds, A2/A4/A5 no LONG holds, A3/A6/A7 dateless); B2 Y on j25 only (16:05 Monthly hold j25:39462 = the setup; N on j24 S2-death); B3 N (fired clean, no 6/11 holds).
- F4 j25 16:00-16:20: S3INPLAY H/L/C 16:05 159.992/160.086/160.008, 16:10 159.981/160.062/160.058, 16:15 160.022/160.082/160.073 (opens NOT_LOGGED); CONFIRMPOLL 16:10 anchor Monthly-POC oppCandle=1 bodyDir=1 body=49pts touchAttr=0 confirm=0 (j25:39990). CONFIRM_1610_M = FAILS C_TOUCH (16:10 never touched Monthly-POC; Daily same per B-54).
- F5 plain words: Fix F11 holds an armed-track setup while the 5-minute runs against it, as long as the 15-minute agrees or the candle confirms. No banked words pin that hold - your words kill the seed on a 5-minute flip, refuse entry against it, and hold only after entry. Without the 16:05 hold the Monthly setup would have gone to the deferred abort then, and with no retest at 16:10 or 16:15 your entry still never forms either way.

## Part G - June register cells on the full map
- G1 FULLMAP_CELLS: B1 SAME (j25 no fire 09:40-09:50, stays out correctly); B2 SAME (j25 NO_FIRE: F11 hold 16:05, ABORT FRESH_OB_DEAD 18:30, no 16:15 entry - still owed); B3 SAME (j25 fire deal #10/#11, MTEXIT 15:20 160.524->160.587); C-3June SAME (j25 deal #4 buy 09:10 159.932).
- G2 MAP NOTE appended (count 0, verbatim, brackets SAME x4).

## STOP rules
- STOP-A: none. STOP-B: none. STOP-C: none (diff one line). STOP-H: none (writes = result/slice/ledger/pointer + C1 copy + register note; launcher n/a - no launch).

## Part F9 - file, push, reply
- F9.1 result B56 + slice B56 (gate, C1 before-after, T1 spans + T2/T3 listings, F1 span + F2 hits + F3 counts + F4 raws, G1 raws, W before-after).
- F9.2 ledger ^1199. count 0 -> append (see below).
- F9.3 pointer (latest B-56; June 5/25 standard + SILENT6 parked; Next B-57 per relay; 35-line cap).
- F9.4 stage explicit paths only + push builder/B-56 (list below).
- F9.5 final disk state: EA 63B18C1F / ex5 B0D4AA9E MATCH; includes at gate SHAs; MARKER untouched; terminal.ini = 88a0deb1 STD_JUNE (preB56 450ACB4A kept); no terminal64 running.
- F9.6 ls-remote under the reply line.

## Carried note
- None (F11_PIN = NONE but the 5-minute-against-direction search FINDS his kill/refuse/hold-after-entry rules, so F6's chart-call condition fails; C3 found rules).

(End of file)
