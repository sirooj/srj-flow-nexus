# PACKET_P-DAY2355-1 v1 DRAFT - day-close 23:55-open execution on his 2026-09-25 word (nothing builds/runs/commits on this file)

Status: v1 DRAFT (his 23:55-open rule: DAY_CLOSE executes at the 23:55 opening price on the verdict day, never the next-day open; purpose avoid swap + new-day spread. Retires the E7 next-open timing + the v225 weekend-gap-nextOpen semantic FOR THE DAY_CLOSE LEG ONLY on canon order (later words amend); BREAK-leg next-open kept on his silence. Relay + battery owed before any transport. Whitespace below S1-asserted at build; relay carries the byte-verified region.)

Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E1 +4 additive provisional, old 0; label/price-pin forms are council questions at relay; S3 recount governs). No new indicator buffers. No new inputs. Nothing under 02_TASK_CHECKPOINTS. Commits are builder-called (AGENTS 6.5); no council commit token exists or is asked.

## Authority (his words + disk, no invention)

- His 2026-09-25 ruling (verbatim core): best version so far; sole critic the end-of-day close fills on the day open not 5 min before close; purpose avoid the swap fee + the new-day widening spread; 5-min-before-close = the 23:55 opening price. His chart: 7 Sep 00:00 bar O 1.16093 spread 18 (our RECON60 fill price).
- Disk defect (RECON60 segment, quoted): MTEXIT bar=2026.09.04 23:55 + MTCLOSE bar=2026.09.04 23:55 leg=DAY_CLOSE ref=1.16093 both printed 2026.09.07 00:00:07; deal #7 sell 0.57 at 1.16093 timestamped 2026.09.07 00:00:07. Verdict Friday, evaluated + filled Monday (the 23:55 bar only closes on the next trading bar). Friday 23:55:00 ticks PROVED (16 evaluation rows at sim 2026.09.04 23:55:00) - early execution feasible in-tester.
- Supersession (canon order): v225-era weekend semantic (first-trading-bar evaluation acts, price = weekend-gap nextOpenPx) retired for DAY_CLOSE by his later word; nearest-booking/BREAK/next-open + all RECON60 grades otherwise stand.

## Rule (one behavior, one build)

- DAY_CLOSE leg: when the day mark falls inside the NEXT bar at a closed-bar evaluation (Friday 23:55:00 for the 23:55 mark bar), set vDAY then and execute synchronously at current market (approx 23:55 open) via the existing E7 path. Monday fallback preserved: if no Friday evaluation exists in-segment, the old line still catches the mark Monday (acceptance A1 then halts with cause no-Friday-ticks, never passes silently).
- Untouched: vBREAK/vHTF/vSL/vTP legs, priority order, HTF experiment, CANCEL_BIAS, MTCOLLISION path, buffers, inputs, session marks, booking, votes, R floor, live alerts-only (E5 tester gate untouched).

## Scope (day-close timing only)

- REQUIRED: zero DAY_CLOSE fills timestamped on/after the day boundary; MTCLOSE DAY_CLOSE printed on the verdict day; MTCLOSE ref == the 23:55 bar open of that day (byte join; fill within bar-granularity spread tolerance of ref); BREAK-leg rows identical to RECON60; takes identical bars/entries (lots re-derived second); 9/4-invalid still refused; MTCOLLISION 0.
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
- E2/E3 (print-bar label + price-pin forms): council questions at relay with whole code; no EA lines in this draft.

## Stages (T161N discipline; RECON60 precedent)

- S1 pre-hash gate: re-hash EA (must equal D74FE972/633552/11502 or DIAGNOSED successor, never assumed) plus one hit per anchor (F3 comment + mark loop) plus buffers 48/48 + names (PeriodSeconds builtin, g_news_dayMarks, g_mtrade.fillBarTime) collision-free plus char-code assert every OLD anchor.

## Acceptance (grade segment-vs-RECON60; time-first price-second)

- A1 timing: zero DAY_CLOSE fills on/after day boundary (fill-date == verdict-date on every DAY_CLOSE deal; a Monday DAY_CLOSE fill halts with cause unless no-Friday-ticks proved).
- A2 price: every MTCLOSE DAY_CLOSE ref == iOpen(verdict-day 23:55 bar); fill within spread tolerance of ref.
- A3 identical: BREAK-leg rows 0-delta vs RECON60; takes identical bars/entries; 9/4-invalid refused; MTCOLLISION 0; no other election delta.
- L-final: A1/A2/A3 above.

## Run cost and novel evidence

One build (4-line additive trigger, STAGE-1 gated) plus one tester run, ceiling 90 minutes, same envelope as RECON60 (in-period alternative is live trading paying daily swap + roll spread - his stated purpose; uncosted multi-hour plans stay out of order). Novel evidence vs RECON60: (a) first Friday-timed DAY_CLOSE fill (fill-date == verdict-date); (b) ref==23:55-open join; (c) takes intact with earlier closes (lots re-derived second). Swap-avoidance by timing proxy (no swap rows exist).

(End of file)
