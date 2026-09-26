# BUILDER_FINDING_USDJPY-MISSES (2026-09-25, read-only on SEG63 F50A9BFE; his 3 valid rows vs 1 EA take; no grade, his objection owed)

## His rows (his words, blind intact - journal never asked, never opened for this)

- 6/3 London TF: EA took it (census filed, result C71F3329).
- 6/5 London TF, 9:45 open entry, D POC: EA missed.
- 6/5 NY TF, 16:15: EA missed.
- 6/11 NY TF, 14:40: EA missed.

## Direct answers to his two questions

- CQD divergence veto? NO on all three. Morning 6/5 verdicts bearish to 09:35 then bullish, rechecks pass, latches 0. 6/5 16:xx flipped bearish-to-bullish with clean rechecks, latch 0. 6/11 verdict bullish aligned, recheck clean, latch 0. Zero CQD veto rows near any miss.
- Invalid XOB? NO kill attributed to XOB near any miss (0 rows). Orderblock alive (obDead=0) at every S4 freshness check; the dead flag is the FVG (fvgDead=1), never the block - except the 09:30 LONG kill (FRESH_OB_DEAD, block dead).

## Miss 1 - 6/5 09:45 London (two trails; his direction decides which binds)

- LONG trail (dead 09:30): 09:15 HEADS-UP LONG zone 159.878-159.916; SHORT challengers suppressed 09:15/09:20 (held LONG in S4); 09:30 ABORT FRESH_OB_DEAD + A6REFUSED + STAND-DOWN (Daily-POC block dead - wicked through or body-closed through, his FVG-validity rule).
- SHORT trail (tracked 09:35-11:00, never fired): ANCHOR_ELECT SEED 09:35 Daily-POC SHORT; REGIMECENSUS SHORT trendOk=1; FRESHSKIP PRE_BINDING at 09:40/09:45/09:50 (still pre-arm S2, freshness not yet binding - code EA 7251-7256); CONFIRMPOLL confirm=1 on the 09:40 bar (touch present) then confirm=0 on 09:45 (no touch) and later A2_CLOSE_BREAK/doji fails (code EA 2222-2233: opposite-candle / close-side / body / touch); RETESTBOOK 0 hits every bar; FRESHCOUNT HOLD at 09:55 (obDead=0 fvgDead=1 oppFvg=0 adverse=1 - sole FVG death does not kill, 2-of-3 unmet); HEADS-UP SHORT 09:55 zone 159.968-159.977; ended 11:00 STAND-DOWN LTF_MISALIGN. No ABORT (stall, not kill), no SIGNAL.
- Fit note: the 09:40 confirm=1 with entry-next-open matches his 9:45 timing exactly on the SHORT reading.

## Miss 2 - 6/5 16:15 NY (killed 16:10, before his entry)

- 16:00: RETESTBOOK hits=2 (Daily-POC + Daily-VWAP) + ANCHOR_ELECT SEED Daily-POC LONG + REGIMECENSUS LONG trendOk=1 + SIDE1G agree (seed-bias and F-vote reject on timing, biasAligned=0/t1reject=1).
- 16:10: TPCENSUS #86 LONG close=160.008 winner=NONE best=- distPts=- empties=10 admitted= PDH:66 NYH:254 PMH:24 YNYH:20 YPMH:24; ABORT NO_TP_TARGET (S2) + A6REFUSED + STATE->ABORT.
- Mechanism (code EA 2395-2451): admitted= lists in-direction levels only; winner= must equal the booked nearest-VALID target; validity = direction + in-zone + swept/live mask (session/PD) or tier-rank (POI). Five in-direction levels, zero valid, ten empties - so no TP, no trade. FRESHSKIP PRE_BINDING same bar (pre-arm).
- After: RETESTBOOK 0 at 16:10/16:15/16:20+; never re-seeded. His 16:15 entry had no live seed.
- Open for his objection: his TP level and why PDH+66 (nearest) fails validity on his chart (swept? live? zone?).

## Miss 3 - 6/11 14:40 NY (confirmed never, then pool outran)

- 14:10 SHORT seeded, 14:15 ABORT DIV_FALLBACK at S5 (short side died on divergence fallback).
- 14:20 LONG seeded; 14:45 HEADS-UP LONG zone 160.498-160.518 + REGIMECENSUS LONG trendOk=1 + RETESTBOOK hits=2 (Daily-POC + Daily-VWAP) + touch present BUT CONFIRMPOLL confirm=0, term=A2_CLOSE_BREAK (prior close on wrong side of line, code EA 2224-2225).
- 14:50: doji + touch but confirm=0 (A2_CLOSE_BREAK again); 14:55: no touch (A_OPP). FRESHCOUNT HOLD x3 (14:45/14:50/14:55, obDead=0 fvgDead=1 adverse=1) - held in S4, never fired.
- TP at 14:45 existed (TPCENSUS #147 winner=Daily-VWAP best=160.522 distPts=3) but 3pts vs ~22pt stop is sub-1R on its face; later censuses walk the winner out (YLOH 52) as price rose.
- 15:25/15:40/15:50: re-seeds die NO_TP_TARGET (S4/S4/S3) - pool outran by price. No SIGNAL.
- Open for his objection: the 14:45 close-break call + the FVG-dead call on his chart.

## Alternatives tested (adversarial)

- Session marks: HEADS-UPs print in the right sessions (LONDON/NYAM); no SESSION_CLOSED/LIMIT rows kill any of the three.
- R floor: never reached (died at confirm/TP stages first); 6/11 14:45 TP would have failed it independently.
- CQD/XOB: excluded above with rows. Suppression: only singleton opp-suppress rows, no election stolen (SUPPRESSED SHORTs held correctly).
- Monday/day-close: untouched legs, no mark involvement in-window slices.

## Next

- HIS objection with HIS data (direction on #1, TP levels on #2/#3, FVG/block reads). No packet drafted (strategy questions go to HIM in plain words; code questions to council). No build, no key, nothing spent.

## His UJ answers 2026-09-26 (verbatim whole, asked batched with the v286 transport memo; asked once)

- A1 (6/5 09:45 direction): "no, short."
- A2 (6/5 16:15 TP levels): "as i have said previouly, there is no such thing as no profit target, there is only target there is less than 1R. i can understand on the code technical side, because the valid nearest target is the april 30th previous day high for 160.723 and that is more than 10 days of the code max session detection. but eventually, the TP target is revised to the current new york session high once it's over. i want your solution."
- A3 (6/11 14:40 POI/FVG): "i have explained thoroughly regarding the validity of the valid POI line retest, please recall that and ask me again if you still don't understand.if you're talking about the FVG for the validity of the structure, the confirmation candle of 14:35 is when the bullish flip happen so the FVG invalidation does not matter."
- Builder note: A1 settles direction SHORT (miss-1 fix designable); A2 commissions a builder solution (old-high pool + retarget rule) for council clearance; A3 routes to record-first recall (FVG-validity corpus) + one permitted re-ask on the A2 line only.

## Correction 2026-09-26 (ledger 809; history above stands, live rule below)
- His correction: miss-1 = 9:35 retest AND 9:35 confirmation, entry 9:40 open. The 09:40-bar confirm=1 (DL row at the 09:45 pass) is post-owed-entry polling, never selection evidence. The line-6 "9:45 open entry" row label is amended by his later words (canon order); the line-19 fit note ("09:40 confirm=1 ... matches his 9:45 timing") is withdrawn as builder inference.
- Decision rows (RECON63, all 1x): ANCHOR_ELECT SEED 09:35 + RETESTBOOK hits=1 + CONFIRMPOLL confirm=0 (bodyDir=0, B_BODY) at the 09:40:00 pass. The miss = B_BODY refusal at decision, not downstream gates.

(End of file)
