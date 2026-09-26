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

## Correction 2026-09-26-B (ledger 818; supersedes the Correction above for miss-1 timing)
- His latest words govern: 5 June London USDJPY = 9:35 retest, 9:40 confirmation, 9:45 open entry. The "9:35 = confirmation" framing (message B) and everything built on it (v7 re-point, v8 carve-out, separator question, DL-exclusion, LS-as-refusal) are WITHDRAWN as superseded - the DL row (CONFIRMPOLL bar=09:40 confirm=1 at the 09:45 pass) is decision evidence again; the 09:35 poll row correctly shows no confirmation (nothing to confirm yet at the retest bar).
- History above (including the first Correction) stands as audit of what was believed when, never as live rule.

## Plain-words annex 2026-09-26 (ledger 822; his words verbatim incl typos, Image 1 = his 5 June USDJPY M5 chart showing the 09:45 short entry working off the line)
- His Q1: "[Image 1] only for refference, the wrong build that has been reverted correctly took the 5 jun 9:45 trade but this alter the entire valid auditted trades, cascading mistake effect. explain logically (non code) why this one needs a diffirent entry path. the logic behind it is consistent with others." Builder ruling carried: his logic IS the same everywhere (retest, confirmation candle, next-open entry); the 5 June London 09:35 retest / 09:40 confirmation / 09:45 open entry needs its own road because the proof arrives where the EA cannot act, while his other valids confirm where it can act. Cascade mechanism: one shared confirmation check serves all setups on both pairs, so a widening that admits 09:45 admits his ruled-out shapes too (9/4 10:40 SHORT INVALID + 8/28 NY silent) and the whole register moves.
- His Q2: "wdymn swing store? do not use code technical term and do not involve me to judge the best code mechanism to execute the logic of the trade." Builder plain definition: swing highs already drawn on his chart (past highs on his screen). Mechanism choice WITHDRAWN from him (builder/council route); his trade call kept: which old highs may be targets + how far back (30 Apr oldest, or older allowed).
- His Q3: "wdymn retarget? to what?" Builder plain definition: booked 30-Apr high 160.723 moves to today's New York high (highest point of today's NY session at that moment) once price trades above it. His trade call kept: wick past the high counts, or close past it only.

## Rulings-C 2026-09-26 (ledger 823; his words verbatim incl typos)
- His A4 (target age): "i would take that high because that is the NEAREST point upon when taking the trade. as i have stated, any previous day or session high or low no matter how old it is, is considered. this is the friction point of traders eye vs your code technical limitation cause i know tracking the previous day high or low all the way back like that is expensive, computing power wise and not efficient. if the code is randomly taking the trade cause it can't find the TP target technically due to how far back it is, there is the risk of that old previous day or session high or low can cause the target to be less than 1R." Builder rule carried: NEAREST-ANY-AGE - nearest previous day/session high/low at entry, any age; 1R floor still gates admission (nearest must give 1R at entry, else no trade); far-back lookup cost is builder/council mechanism work, never his.
- His A5 (retarget): "once again, i do not know what you mean by passing IT, IT what? the current ny session high? if so then this is like the normal entry. once the session has closed, the H/L of it is valid to be targetted or retargetted to revise the TP target with price or wick touch. the only time for the candle close confirmation close is the POC or VWAP gap break to validate if the POC is breaking the candlestick with a candle body close." Builder rules carried: TOUCH-RETARGET - session H/L valid once closed, revise on price/wick touch, object = today's NY high/low; CLOSE-ONLY-GAP-BREAK - closes validate POC/VWAP gap breaks only.
- His correction (divergence): "i do not say that trade is invalid due to the divergence, that is only an example" + "i never had a problem on the divergence detection". Builder record: divergence was his example, never his claim; his detection stands; no fold proposes against it.

## Rulings-D 2026-09-26 (ledger 824; his words verbatim incl typos; journal row 17 corroborates)
- His terminology ruling: "we have a lot of different terminology that is being used. i suspect by the bias does not aggree is the structural bias flip. the 5m structure bias has flipped bearish at 9:25 and i suspect this is because the 15m bias is only confirmed flipped to be bearish at the 9:45, which the same opening candle to enter. i guess this is the timing issue. i rechecked my journal and there is this note regarding the 15m bias that simultaniously turned bearish and then enabling the trend following bias for short setup."
- Journal corroboration (read-only, row 17, 6/5/26 LDN TF: 4H Bear, 1H Bear, 15m Bull, Bias bear): the 15m column stands bullish against a bear bias on his sheet - the waiting-for-15m shape, matching his account that the 15m only confirmed bearish at the entry candle.
- Builder rule carried: STRUCTURAL-BIAS-FLIP TIMING - 5m flips first, 15m confirms at the entry-candle open, entry enabled by the 15m flip (trend-following bias); a road demanding lineup before the entry candle can never fire it - the road takes the 15m confirmation ON the entry candle.

## Rulings-E 2026-09-26 (ledger 832; his words verbatim incl typos)
- His source questions + redirect: "so where does the EA get's the HTF bias direction currently? how does the EA correctly detecting the valid trend following setups if it can't see the HTF structural bias? i thought currently is getting it from the SRJ Flow Logic auto MTF HTF bias detection? i am aware that the detection is historically not realiable that might explain it is not getting the most accurate and up to date HTF bias. if so, then logically it is better to refine the SRJ Flow Logic indicator MTF bias detection rather than the EA having it's own MTF HTF detection. this is coming from tarder and non coding people perspective."
- His scope word: "yes" (to opening the indicator file as evidence for the 15m read).
- Builder answers filed: EA reads bias OUT of his indicator (LTF bias buffer EA 2273 + EA 11300; no EA-side HTF variable; all bias feeds indicator-fed; indicator HEAD digest 956BF3E3 via committed companion 66da45c (§9 line stale, diagnosed never assumed); mirror path dropped on his redirect; indicator edits stay canonical-gated.

## UJ3-MECHANISM CORRECTION 2026-09-26 (ledger 833; refutes the FVG-yield premise with segment rows)
- Refutation (RECON63 segment, count-asserted): the 14:40:22 decision pass for the 11 June 14:35 setup = 13 rows showing S1 SUPPRESSED (singleton held, heldState=S1_REGIME) + S1WAIT regime-unclassified retention + REGIMECENSUS votes=1 trendOk=0; zero freshness involvement. bar=14:35 with ABORT/HOLD/FRESH/STATE = 3 rows across ALL passes, all S1-stage. FRESHCOUNT on June-11 14:40-14:50 = 2 rows for OTHER bars (14:45/14:50, HOLD scope=pre adverse=1). ABORT_FRESH on June-11 = 0.
- Withdrawn: "refused post-confirm by FRESHCOUNT HOLD on fvgDead" (all instances v291-v298 + V298 CLEAR UJ3 leg + v299/v300 Q3). Actual evidenced refusal: S1 suppression (slot held, xobId 3070 per IDCHANGE row) + S1WAIT regime-unclassified retention. Polls QF/FN/CE prove predicates only, never promotion or death.
- Next: S1-suppression diagnosis (slot-holder + votes=1 cause), then UJ3 re-scope; v300 HELD until then.

### S1 diagnosis 2026-09-26 (ledger 834; segment + code, count-asserted)
- Slot-holder: object 3070 (promoT 08:30, obStart 05:20, bullish, valid+activated; re-identified 10:45 inWin=1, then 14:35 as xobId 3091->3070 on the identical 160.489/160.504 zone) - the 14:35 Daily-POC LONG was read as the SAME morning zone; the singleton (SUPPRESSED/HELD, heldState=S1_REGIME) refuses the second claim. MECHANISM WITHDRAWN ledger 835 (contradicts his ONE-TAKE-PER-SESSION rule) - kept as audit of what was believed, never as live mechanism.
- Regime rule (ClassifyRegime EA 2238-2267): HTF HIGH/MID/LOW buffers 19/20/21 vote, trendOk = 2+, sweepTag yields mrOk; BOTH/TREND/MEANREV/NONE. 14:35 scored votes=1 trendOk=0 sweepTag=0 mrOk=0 = NONE -> S1WAIT retained (print EA 8060, consumer 8059). SURVIVES as the evidenced refusal.
- Record-first: no HTF-vote-count rule in his words (findings 2-of-3 = freshness kill, not regime) -> his two calls were owed in chat (superseded: he ruled instead - see Rulings-F).

## Rulings-F 2026-09-26 (ledger 835; his words verbatim incl typos)
- His 15m/1H short-bias rule: "this is why i mentioned the 15m HTF bias! i know that the trend following short bias only enabled and confirmed at 14:45 because that is when the 15m structure bias flip, combining with the bearish 1H that makes it valid for the trend following setup bias for short."
- His session-rules rebuke: "you still conflicting this rule that shows either you didn't read the skill strategy or the strategy specification. this confusion and problem is not new and has been explained by me before. what is the 8:30 potential non executed setup doing here that is preventing the 14:40 entry? why has not been invalidated by the line POI break bias or the flip of the 5m structure bias. besides that, the london setup is irrelevant to prevent setup on the NY, the one position at a time does not apply multi session. meaning i can execute a setup on NY session while the london setup is still floating, even if it's conflicting bias direction wise. also why is the 8:30 setup even considered? the london session begins at 9:00 or at most 8:55 that could be executed at the 9:00 open candle?"
- Builder record: ONE-TAKE-PER-SESSION pin (skill line 73 + spec L283/L291) answered the session question on record - record-first failure owned; London-9:00-start pinned NEW (not found on record); 08:30-survival (no POI-break/5m-flip invalidation, no session-boundary expiry) recorded as open diagnostic for council route.
- Read-back (veto-able, no new ask): 14:40 long stands owed on the 14:35 flip; 14:45 15m-bearish + 1H-bearish enables the short trend bias after it.

(End of file)
