# PACKET_P-DAY2355-1 v2 DRAFT - day-close exact 23:55-open fill on his precision word (nothing builds/runs/commits on this file)

Status: v2 DRAFT (v1 superseded, never transported; code block unchanged). His precision word: fill EXACTLY the 23:55 opening price - at/after the 23:50-close candle, no "about", no tolerance. His run scope: test window Friday 9/4 00:00 to Monday 9/8 00:00 ONLY. His relay scope: free low-tier seats only (Luna + GLM; frontier Opus + Astra excluded on his word, waiver-class precedent v270). Relay + battery owed before any transport. Whitespace below S1-asserted at build; relay carries the byte-verified region.)

Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E1 +4 additive provisional, old 0; label/price-pin forms are council questions at relay; S3 recount governs). No new indicator buffers. No new inputs. Nothing under 02_TASK_CHECKPOINTS. Commits are builder-called (AGENTS 6.5); no council commit token exists or is asked.

## Authority (his words + disk, no invention)

- His 2026-09-25 precision ruling (verbatim core): no "at about" - precisely at 23:55 opening price or after the 23:50 closing 5m candle. Run scope: test run for Friday 9/4 to Monday 9/7 only. Relay scope: free low-tier seats only, small fix. Base ruling kept (v1 L9: best-version approval, sole-critic day-close, swap+spread purpose, chart O 1.16093 spread 18).
- Disk defect (RECON60 segment, quoted): MTEXIT bar=2026.09.04 23:55 + MTCLOSE bar=2026.09.04 23:55 leg=DAY_CLOSE ref=1.16093 both printed 2026.09.07 00:00:07; deal #7 sell 0.57 at 1.16093 timestamped 2026.09.07 00:00:07. Verdict Friday, evaluated + filled Monday (the 23:55 bar only closes on the next trading bar). Friday 23:55:00 ticks PROVED (16 evaluation rows at sim 2026.09.04 23:55:00) - early execution feasible in-tester.
- Supersession (canon order): v225-era weekend semantic (first-trading-bar evaluation acts, price = weekend-gap nextOpenPx) retired for DAY_CLOSE by his later word; nearest-booking/BREAK/next-open + all RECON60 grades otherwise stand.

## Rule (one behavior, one build)

- DAY_CLOSE leg: when the day mark falls inside the NEXT bar at a closed-bar evaluation (Friday 23:55:00 for the 23:55 mark bar, i.e. at/after the 23:50-close candle), set vDAY then and execute synchronously on that tick - the first tick of the 23:55 bar, whose bid IS the bar open, so the market fill prints exactly the 23:55 open (no tolerance - his precisely). WITHDRAWN v1 phrase: "approx 23:55 open". Monday fallback preserved: if no Friday evaluation exists in-segment, the old line still catches the mark Monday (acceptance A1 then halts with cause no-Friday-ticks, never passes silently).
- Untouched: vBREAK/vHTF/vSL/vTP legs, priority order, HTF experiment, CANCEL_BIAS, MTCOLLISION path, buffers, inputs, session marks, booking, votes, R floor, live alerts-only (E5 tester gate untouched).

## Scope (day-close timing only)

- REQUIRED: zero DAY_CLOSE fills timestamped on/after the day boundary; MTCLOSE DAY_CLOSE printed on the verdict day; MTCLOSE ref == the 23:55 bar open of that day (byte join); deal fill == the same open exactly, no tolerance (his precisely; WITHDRAWN v1 phrase: "within bar-granularity spread tolerance"); BREAK-leg rows identical to RECON60; takes identical bars/entries (lots re-derived second); 9/4-invalid still refused; MTCOLLISION 0.
- Stated-unmeasurable: swap rows do not exist in-segment (record RECON59); swap-avoidance established by fill-timing (A1), never by swap rows.

## Edit set (exact verbatim old/new; STAGE-1 exact-diff gated)

- E1 day-mark lookahead (old EA 11424-11431 8 lines, new +4 insert after the mark-hit line, old 0):
  old:
`//--- [P-EXITMODEL-2 F3] day-close-minus-5 exit (his universal rule 2026-09-21: the first bar at/after the first 16:55-ET mark at/after the fill exits every managed trade regardless of regime). Priority below SL, TP, BREAK (and HTF when re-enabled); price nextOpenPx; F3 mark is 16:55 ET (g_news_dayMarks), distinct from the 17:00 weekFlat census (g_news_friMarks); MTEXIT/MTLIFE carry DAY_CLOSE, graded by mark join.`
`if(!vSL && !vTP && !vBREAK && !vHTF && g_news_init)`
`  {`
`   for(int dc = 0; dc < g_news_dayN; dc++)`
`     {`
`      if(g_mtrade.fillBarTime <= g_news_dayMarks[dc] && g_news_dayMarks[dc] <= barTime) { vDAY = true; break; }`
`     }`
`  }`
  new (insert after the mark-hit line, 4 lines, indentation matched to sibling, S1 char-code asserts):
`      //--- [P-DAY2355-1] his 23:55-open rule 2026-09-25: the mark bar (23:55) only`
`      //--- closes after the boundary (weekend: Monday), so qualify one bar early -`
`      //--- at this evaluation (Friday 23:55:00) the mark sits inside the next bar.`
`      if(g_mtrade.fillBarTime <= g_news_dayMarks[dc] && g_news_dayMarks[dc] <= barTime + PeriodSeconds()) { vDAY = true; break; }`
- E2/E3 folded into Q1: price exactness graded by the A2 join (no separate price leg - nextOpenPx at the early firing IS the next-bar open); print-bar label follows the evaluated bar while fill-time joins Friday (stated, no separate label leg). No EA lines beyond E1 in this draft.

## Stages (T161N discipline; RECON60 precedent)

- S1 pre-hash gate: re-hash EA (must equal D74FE972/633552/11502 or DIAGNOSED successor, never assumed) plus one hit per anchor (F3 comment + mark loop) plus buffers 48/48 + names (PeriodSeconds builtin, g_news_dayMarks, g_mtrade.fillBarTime) collision-free plus char-code assert every OLD anchor.

## Acceptance (grade segment-vs-RECON60; time-first price-second)

- A1 timing: zero DAY_CLOSE fills on/after day boundary (fill-date == verdict-date on every DAY_CLOSE deal; a Monday DAY_CLOSE fill halts with cause unless no-Friday-ticks proved).
- A2 price: every MTCLOSE DAY_CLOSE ref == iOpen(verdict-day 23:55 bar); deal fill == ref == that open, all exact, no tolerance (WITHDRAWN v1 phrase: "within spread tolerance").
- A3 identical: BREAK-leg rows 0-delta vs RECON60; takes identical bars/entries; 9/4-invalid refused; MTCOLLISION 0; no other election delta.
- L-final: A1/A2/A3 above.

## Run cost and novel evidence

One build (4-line additive trigger, STAGE-1 gated) plus one SCOPED tester run, ceiling 90 minutes (4-day window runs in minutes): Friday 9/4 00:00 to Monday 9/8 00:00 ONLY, his word (terminal.ini [Tester] DateFrom/DateTo change at run word, BOM-guarded, backup + digest pair; Monday included for the absence proof + fallback audit). Scoped acceptance vs RECON60 same-span: 3 in-window takes (9/4 16:00 + 9/7 09:20 + 9/7 16:45) identical bars/entries, lots recorded-not-graded (window starts 9/4, balance path differs by construction); 9/4-invalid (in-window) still refused; 9/4 suppression rows (EVICTSUPPRESS ARM + DIV triplet) identical; 9/7 exits identical prices; zero Monday fills. In-period alternative is live trading paying daily swap + roll spread - his stated purpose; uncosted multi-hour plans stay out of order. Novel evidence vs RECON60: (a) first Friday-timed DAY_CLOSE fill (fill-date == verdict-date); (b) ref==23:55-open join; (c) takes intact with earlier closes (lots re-derived second). Swap-avoidance by timing proxy (no swap rows exist).

(End of file)
