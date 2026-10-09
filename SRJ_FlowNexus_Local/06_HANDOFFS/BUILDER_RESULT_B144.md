# BUILDER RESULT B-144 - 9:20 XOB promoted and killed on the 09:40 candle; the stamp was one bar early

Trader summary: your 9:20 zone's whole life is now on the record. It was promoted on the 09:40 candle and killed on that same 09:40 candle, because that candle closed at 1.16248, past your zone's middle of 1.16243. The planner worried the candle was wrong since the machine's row is stamped 09:35 - it isn't: the machine stamps each row with the previous candle while grading the just-closed one, so the 09:35 row carries the 09:40 verdict. Checked your midline rule candle by candle: 09:40 is indeed the first candle that could kill it (the 09:25 close was also past the middle, but the zone only woke up on the 09:30 candle). Two honest limits: your own chart's candles for that morning are not on this machine, so your side can't be checked here; and the red line the Flow Logic drew for that zone is a short three-candle segment near 09:20 - it stays on screen but never reaches across to your 16:55 confirmation. Nothing was changed and nothing was run, and no question is carried.

## Relay order (B-144, XOB-0604 lane 3 of 6, read-only)

- Part 0 on builder/B-143 at 497eb2d6b427b916ddb0867b4d2096870ee1746b (backup ls-remote verified exact; builder/B-144 cut here). Skills loaded (relay; strategy). Reads: pointer; RESULT_B143 (R1/R2/R4); SLICE_B143 (3293 rows, candle ranges); XOBSUIT-1 section 6 (midline answer 1, SL-leg answer 3); spec v4.2 (1.2/3.5/9.1/9.7/9.9/9.10); register A7 + section C B-143 NOTE; CONTEXT section 3 (RAW fact) + section 4 B142/B143 lines.
- Start gate: log-1 = 497eb2d; status 581 lines (dirty tree preserved); committed-file diff vs 497eb2d measured 0 lines; EA 585093BF.../EX5 AB159DE7.../FlowLogic 956BF3E3/27B5F272 (Indicators/SRJ_FlowLogic.mq5/.ex5) match; result-against-commit: skill Ruling (B-143) + register B-143 NOTE + CONTEXT B143 lines + HANDOFF B-143 line + pointer Lane line committed (planner-verified); ledger 1288 = 1, journal 0908-NY-XOB-0920 = 1 (builder greps). No STOP.
- Scope MEASURED. Writer/lifecycle/draw code quoted by text with real line numbers. No edit/compile/run/export; no tolerance/count/distance in any reading.

## Part B - banking

- No new rule words. Grep only: 0908-NY-XOB-0920 count 1 in skill, count 1 in journal. Nothing appended.

## Part R - reading (kept 585093BF; run + file:line on every row)

### R1 stamp convention (FOUND)

- Writer: SRJ Flow Logic diagnostic variant ONLY (Indicators/SRJ_FlowLogic.mq5.B97PROV, B96/B97 lineage). The kept 956BF3E3 source carries no XOBDIAG writer (grep 0). Writer block B97PROV:851-930: one line per COrderblock present at the export point, keyed by target bar time; closed bars only (889); never read by any gate (854).
- barT = open time of target, where target = i - 1 (1153): the export block writes state computed while processing bar i into the PREVIOUS bar's slot, then DiagExport stamps barT = bt[target] (890). So a row stamped 09:35 holds the collection AFTER the 09:40 candle's passes (creation/activation/invalidation/promotion/draw, 1104-1137, export call 1317). Neither the evaluated candle's open nor pass time: evaluated-minus-one by construction.
- promoT = SRJ_BarTime(promotionBar) (912-918); invalT = SRJ_BarTime(invalidationBar) (925). Both keyed to the bar index that set them.
- 3293: promotion candle FOUND = 09:40; invalidation candle FOUND = 09:40. Both appear first on the barT-09:35 row (states after 09:40's passes). B-143's 09:40 candle stands; only its row citation read as a stamp. Planner suspicion resolved as STAMP-vs-CANDLE, substance unchanged.

### R2 field meaning (Include/SRJ/SRJ_Types.mqh + SRJ_OrderblockMgr.mqh, kept includes)

- Fields (Types.mqh:47-59): valid = isValid; active = isActivated (NOT alive); promoted = isPromoted; invalT = invalidationBar; promotionBar = bar index SRJ_ApplyPromotion ran (comment: Task 110).
- Kill event (OrderblockMgr.mqh:498-515): gated on isActivated && isValid; bearish dies when liveClose > invalidationLevel (= midline; drawn at 474-488); skips creation bar (510) and validation-same bar (509); sets isValid=false, invalidationBar=i. Same test in replay (95-133, with prior-bar activation rule 120-122).
- Activation (95-117): bearish activates when barLow < ob.low; sets isActivated/isValid/validationBar. 3293: low 1.16230 first undercut at 09:30 (l=1.16225) -> validationT 09:30 on every row; level 1.16243 on every row.
- Promotion (814-822): SRJ_ApplyPromotion sets isPromoted and thickens both lines to g_lineThickness + g_extremeOBExtraThickness. No other writer touches promotionBar (894/949 same reconcile path).

### R3 his midline rule on the machine's candles (Tester/logs/20261009.log UJBARMAP; zone 3293 midline 1.16243)

- 09:15 o=1.16300 h=1.16303 l=1.16252 c=1.16252: close beyond midline but pre-formation (startBar 09:20) - no object, no grade.
- 09:20 o=1.16255 h=1.16256 l=1.16230 c=1.16256: formation candle; beyond but not yet activated (activation needs low < 1.16230; low equals it) - no kill.
- 09:25 o=1.16257 h=1.16266 l=1.16242 c=1.16245: close beyond by 2, but activation only lands 09:30 (validationT) - kill gated off (isActivated false at 09:25).
- 09:30 o=1.16244 h=1.16250 l=1.16225 c=1.16229: activation candle (low undercuts); close below midline - safe (creation + validation same-bar guards would also skip).
- 09:35 o=1.16228 h=1.16233 l=1.16211 c=1.16230: close below midline - safe.
- 09:40 o=1.16230 h=1.16258 l=1.16230 c=1.16248: close 1.16248 beyond midline, activated, not creation/validation bar - KILL. First kill candle FOUND = 09:40 = artifact invalT. Exact prices, zero tolerance.
- 09:45 o=1.16247 h=1.16250 l=1.16232 c=1.16240: already dead; close below midline.

### R4 feed (machine vs his candles)

- RECON62 run: Symbol EURUSD (B-137 T0: [Tester] dates+symbol written and read back, EURUSD 1787702400/1788998400). Data source: Dukascopy demo feed (spec 9.1: operator reads TradingView/OANDA; system runs Dukascopy demo). terminal.ini (C:\...\3CA1B4AB7DFED5C81B1C7F1007926D06\config\terminal.ini) carries no account/server binding (LastScanServer empty, line 149).
- His live 8 Sep 09:15-09:45 candles: NOT FOUND on disk. No live-chart history file exists (only ROWPACK day packs match 09-08 names); Files/SRJ_TickAudit_* has no EURUSD 8 Sep candles file; SRJ_TickAudit_B48_SEP_days.csv:2-5 verdicts EURUSD_RAW 7/8/9/10 September EMPTY (0 ticks). CONTEXT section 3 (L29) + spec 9.1 feed bound cited. Midline kill on his candles: UNKNOWN (missing candles named: 8 Sep 09:15, 09:20, 09:25, 09:30, 09:35, 09:40, 09:45). No EXACT/DIFFERENT pair exists to grade.

### R5 the thicker red line (kept indicator defaults + draw code)

- Promotion thickens: SRJ_ApplyPromotion (814-822) sets both lines to width g_lineThickness + g_extremeOBExtraThickness. Defaults (FlowLogic.mq5:285-287): lineThickness 1, extra 2 -> promoted width 3. That is the thicker red (bearish) marking he describes.
- Kill recolors, never deletes (591-602): invalidated lines take invalidated colors + extend flag; width untouched (stays thick).
- Prune spares activated lines (649-667: `if(ob.isActivated) continue`).
- Geometry stops early: valid lines span [startBar, startBar + g_lineExtension] (278-279; invalidated redraw 283-290 same shape); defaults inExtendValid=false, inExtendInvalidated=false, inLineExtension=3 (FlowLogic.mq5:282-285). No ray.
- 3293 at 16:55: FOUND STOPPED. The object persists (activated, recolored, unpruned, width 3) but its segment ends circa the 09:35 bar and does not extend right to 16:55.

### R6 neighbors (report only)

- 3296 at 16:50 barT (TARGETS): S, 1.16258-1.16230, startT 09:40, createT 09:45, promoT NA, valid=0, active=1, promoted=0, validationT 09:50, invalT 16:40. Unpromoted, dead since 16:40.
- 3334 at 16:50 barT: S, 1.16250-1.16219, startT 16:25, createT 16:30, promoT NA, valid=1, active=1, promoted=0, validationT 16:35, invalT NA. Unpromoted, live; touched by the 16:55 range but relevance fails (spec 1.2), never mapped to his words.

### R7 verdict table (3293 at A7 16:55; A6 10:05 beside)

| check | 16:55 | 10:05 beside |
|---|---|---|
| promoted candle (R1) | 09:40 FOUND | 09:40 FOUND |
| invalidated candle, machine record (R1/R2) | 09:40 FOUND | 09:40 FOUND |
| midline kill, machine candles (R3) | 09:40 (close 1.16248) | 09:40 |
| midline kill, his live candles (R4) | UNKNOWN (candles absent) | UNKNOWN |
| drawn at candle (R5) | FOUND STOPPED (segment ends ~09:35) | FOUND STOPPED |
| in play, spec 3.5 | touch YES (16:55 high 1.16230 = zone lo) but invalidated since 09:40 -> NOT IN PLAY | touch YES (10:05 range overlaps) but invalidated -> NOT IN PLAY |

- Class: NONE. STAMP resolves the only machine-side anomaly (09:35 row carries 09:40 state; candle stands). RECORD-vs-RULE agrees (invalT 09:40 = first activated kill candle). FEED can neither confirm nor exclude (his candles absent). DRAW-vs-RECORD is consistent (stopped geometry, dead record; persisting recolored object). Both sides reported; neither his rule nor the record picked over the other. His zone is dead-by-his-rule on machine candles at 16:55; on his own chart UNKNOWN.

### R8 record-first gate

- R7 does NOT show his zone dead on his own chart's candles (UNKNOWN - candles absent). Gate closed: no skill/XOBSUIT/journal/ledger search for promoted-and-killed words, no carried chart call. No carried note.

## Part X - records (grep-first, append once, verify count 1)

- X1 CONTEXT section 4: B144-STAMP-BEFORE-CANDLE appended after B143-HIS-ZONE-NOT-PICK (relay text verbatim; pre-grep 0). Count 1.
- X2 CONTEXT section 5: B-144 session line appended. Count 1.
- X3 HANDOFF section 3: B-144 line appended. Count 1.
- X4 ledger 1289, tag B144-3293-LIFECYCLE (Part B counts, R1-R8). "^1289." = 1.
- X5 pointer (25 lines): latest B-144 MEASURED; SHAs unchanged; "Lane: XOB-0604 (3 of 6)"; R7 class NONE line; goal open.

## Part F - file, push, reply

- F1 this result. F2 slice (raw writer code, lifecycle code, candle rows, draw code, 3296/3334 rows; under 600 lines). F3 ledger 1289. F4 pointer (35-line cap).
- F5 stages result, slice, ledger, pointer, PLANNER_CONTEXT.md, PLANNER_HANDOFF.md. Never EA/indicator/includes/ex5/logs/journals/inis/profiles/backups/artifacts.
- F6 commit + push via backup + ls-remote check. Reply MEASURED, no carried note.

## Final disk state (MEASURED turn; B-137 kept build on disk, verified)

- EA 585093BF.../EX5 AB159DE7... (matching kept pair); FlowLogic 956BF3E3/27B5F272; diagnostic variants (.B97PROV etc.) untouched and uncommitted; includes untouched; no launches. CONTEXT +2 lines; HANDOFF +1 line; ledger +1 item (1289); pointer rewritten (25 lines). Skill/register/journal untouched (banking counts verified). No source/ex5 committed.

(End of file - no carried note)
