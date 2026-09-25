# PACKET_P-DAY2355-1 v3 DRAFT - verdict fold, E1 code unchanged (nothing builds/runs/commits on this file)

Status: v3 DRAFT (v2 superseded - transported once to Luna+GLM, ruled Luna DISCREPANCY / GLM YES-contingent / Kimi YES-advisory-no-open-ask; E1 code UNCHANGED in v3). Folds Luna-A1..A9 + GLM-A1..A11 + Kimi-D1..D6/caveats/B, text-only, no new EA lines (E1 kept per GLM-B keep + Kimi-B cost + Luna-B scope; alternatives-considered record in Run-cost). Relay + battery owed before any transport.

Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E1 +4 additive provisional, old 0, code UNCHANGED in v3; S3 recount governs). No new indicator buffers. No new inputs. Nothing under 02_TASK_CHECKPOINTS. Commits are builder-called (AGENTS 6.5); no council commit token exists or is asked.

## Authority (his words + disk, no invention)

- His 2026-09-25 precision ruling (verbatim core): no "at about" - precisely at 23:55 opening price or after the 23:50 closing 5m candle. Run scope: test run for Friday 9/4 to Monday 9/7 only. Relay scope: free low-tier seats only, small fix. Base ruling kept (v1 L9: best-version approval, sole-critic day-close, swap+spread purpose, chart O 1.16093 spread 18).
- Verdict receipt (V271, all filed whole 1x): Luna DISCREPANCY (A1-A9 + B) + GLM YES-contingent (A1-A11 + B) + Kimi YES-advisory, 2 caveats (D1-D6 + B; no open v271 ask to that seat - filed per inbound rule); Opus + Astra silent-excluded on his word. Calendar verified mechanically (9/4 Friday, 9/7 Monday, 9/8 Tuesday - GLM-A1 window-label flag SUSTAINED REAL, fixed in v3). No operator words in the carry - pure relay.
- Disk defect (RECON60 segment, quoted): MTEXIT bar=2026.09.04 23:55 + MTCLOSE bar=2026.09.04 23:55 leg=DAY_CLOSE ref=1.16093 both printed 2026.09.07 00:00:07; deal #7 sell 0.57 at 1.16093 timestamped 2026.09.07 00:00:07. Verdict Friday, evaluated + filled Monday (the 23:55 bar only closes on the next trading bar). Friday 23:55:00 ticks PROVED (16 evaluation rows at sim 2026.09.04 23:55:00) - early execution feasible in-tester.
- Supersession (canon order): v225-era weekend semantic (first-trading-bar evaluation acts, price = weekend-gap nextOpenPx) retired for DAY_CLOSE by his later word; nearest-booking/BREAK/next-open + all RECON60 grades otherwise stand.

## Rule (one behavior, one build)

- DAY_CLOSE leg: when the day mark falls at the NEXT bar's opening boundary at a closed-bar evaluation (Friday 23:55:00 for the 23:55 mark bar, i.e. at/after the 23:50-close candle), set vDAY then and execute synchronously on that tick - the first tick of the 23:55 bar, whose bid IS the bar open, so the market fill prints exactly the 23:55 open (no tolerance - his precisely). UNIVERSAL (v3 F2): E1 applies to every mark every day (all DAY_CLOSE exits move to mark-bar open); Friday/Monday was the defect instance, never the scope limit - his universal rule governs (resolves Luna-A4/Kimi-D1; comment narrowness left in code bytes by minimal-diff, recorded openly). LOAD-BEARING NAMED (v3 F-j): exactness reduces to evaluation-on-first-tick (A2 carries it; halt causes distinguished: no-Friday-ticks vs mid-bar-execution). LONG-SIDE SCOPE (v3 F-h): exactness graded on the in-window LONG (sell-bid) instance; short-side DAY_CLOSE exactness OPEN (no short DAY_CLOSE exists in-window - MTEXIT DAY_CLOSE == 1 whole-window, disk-proven). WITHDRAWN v1 phrase: "approx 23:55 open". Monday fallback preserved: if no Friday evaluation exists in-segment, the old line still catches the mark Monday (acceptance A1 then halts with cause no-Friday-ticks, never passes silently).
- Untouched: vBREAK/vHTF/vSL/vTP legs, priority order, HTF experiment, CANCEL_BIAS, MTCOLLISION path, buffers, inputs, session marks, booking, votes, R floor, live alerts-only (E5 tester gate untouched). FILL-GUARD NAMED (v3 F-k): fillBarTime-left-clause unchanged by design - a fill inside the pre-mark bar still qualifies (harmless; not a defect).

## Scope (day-close timing only)

- REQUIRED: fill-date == verdict-date on every DAY_CLOSE deal (zero fills dated Monday for the Friday mark; a verdict-date-9/7 Monday-23:55 DAY_CLOSE, if one forms, passes in-scope under A1/A2 - pre-declared, GLM-A5); MTCLOSE DAY_CLOSE printed on the verdict day; MTCLOSE ref == the 23:55 bar open of that day (byte join); deal fill == the same open exactly, no tolerance (his precisely; WITHDRAWN v1 phrase: "within bar-granularity spread tolerance"); BREAK-leg 0-delta scoped to bars/prices/elections (lots/tickets/balance-derived fields excluded explicitly - GLM-A6); takes identical bars/entries (lots re-derived second); 9/7 TP exits identical prices (both exit pre-23:55 via untouched TP leg - MTEXIT 10:50 + 17:10 TP_TOUCH, disk-proven); 9/4-invalid still refused; MTCOLLISION 0. Prints unchanged by design (MTEXIT/MTCLOSE carry the evaluated bar 23:50 with fill-time 23:55:00 - joins key on fill-time + ref, never the printed bar).
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

- S1 pre-hash gate: re-hash EA (must equal D74FE972/633552/11502 or DIAGNOSED successor, never assumed) plus one hit per anchor (F3 comment + mark loop) plus buffers 48/48 + names (PeriodSeconds builtin, g_news_dayMarks, g_mtrade.fillBarTime) collision-free plus char-code assert every OLD anchor AND the 4 insert bytes (GLM-A3 aligned). M5 PINNED (v3 F-g): graded run fixed M5; PeriodSeconds() is chart-period-relative (Luna-A3/GLM-A9/Kimi-D2 noted for reuse; no code guard, minimal-diff).

## Acceptance (grade segment-vs-RECON60; time-first price-second)

- A1 timing: fill-date == verdict-date on every DAY_CLOSE deal (a Monday DAY_CLOSE fill for the Friday mark halts with cause; the falsifiable probe - Friday 23:55:00 eval rows, 16-row RECON60 pattern - must reproduce in the new run before any no-Friday-ticks halt-cause is accepted, GLM-A8).
- A2 price: every MTCLOSE DAY_CLOSE ref == iOpen(verdict-day 23:55 bar); deal fill == ref == that open, all exact, no tolerance (WITHDRAWN v1 phrase: "within spread tolerance"). CONTINGENCY STATED (v3 F16): price clause contingent on nextOpenPx identity (EA 11290/11292, out-of-window; corroborated by defect rows); A2 gates it on disk, never self-proven.
- A3 identical: BREAK-leg rows 0-delta vs RECON60; takes identical bars/entries; 9/4-invalid refused; MTCOLLISION 0; no other election delta.
- L-final: A1/A2/A3 above.

## Run cost and novel evidence

One build (4-line additive trigger, STAGE-1 gated) plus one SCOPED tester run, ceiling 90 minutes (4-day window runs in minutes): Friday 9/4 00:00 through Monday 9/7 (DateTo Tue 9/8 00:00) ONLY, his word (terminal.ini [Tester] DateFrom/DateTo change at run word, BOM-guarded, backup + digest pair; Monday included for the absence proof + fallback audit; window labels fixed - GLM-A1 sustained REAL: 9/8 is Tuesday). Scoped acceptance vs RECON60 same-span: 3 in-window takes (9/4 16:00 + 9/7 09:20 + 9/7 16:45) identical bars/entries, lots recorded-not-graded (window starts 9/4, balance path differs by construction); 9/4-invalid (in-window) still refused; 9/4 suppression rows (EVICTSUPPRESS ARM + DIV triplet) identical; 9/7 TP exits identical prices; zero Monday fills for the Friday mark. In-period alternative is live trading paying daily swap + roll spread - his stated purpose; uncosted multi-hour plans stay out of order. E1 KEPT (v3 F-o): Luna-B tighter predicate + Kimi-B boundary variant considered (adversarial audit); kept per GLM-B keep-recommendation (A2 enforces exactness; inequality maximizes fill success) + Kimi-B cost (another relay word) + Luna-B scope (widens to executor, beyond this small fix). Novel evidence vs RECON60: (a) first Friday-timed DAY_CLOSE fill (fill-date == verdict-date); (b) ref==23:55-open join; (c) takes intact with earlier closes (lots re-derived second). Swap-avoidance by timing proxy (no swap rows exist).

(End of file)
