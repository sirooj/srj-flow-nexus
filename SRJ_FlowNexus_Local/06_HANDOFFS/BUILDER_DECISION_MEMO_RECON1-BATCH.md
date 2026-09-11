# QUESTIONS FOR YOU — the two-week test window (Aug 26 to Sep 9)
Memo: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_DECISION_MEMO_RECON1-BATCH.md
Date: 2026-09-10. All five questions are TRADING-RULE questions for YOU to answer.
The builder cannot decide trading rules, and the spec does not cover them.
Answering these lets the builder fix anything, re-test the SAME two weeks, and check again.
(Plain language by your directive 2026-09-10: no row numbers, dates/lines/directions only.)

## HOW THE EA THINKS (30 seconds)
- It watches 12 lines: FOMC / Yearly / Quarterly / Monthly / Weekly / Daily, each as POC and VWAP.
- It holds ONE trade idea at a time. While one is alive, other setups are IGNORED.
- Before firing it asks: is this trade worth at least 1R? It measures that using the NEXT
  candle open as the entry (your earlier ruling).
- When it kills an idea the log prints a reason: TP_RR_FAIL = "not worth 1R".


## QUESTION 1 — the 1R check vs your 8/28 trade
~~Your London SHORT from the DAILY VWAP on 8/28 (you took it, +0.10, you measured 1.21R):
the EA saw the SAME setup, ran its check, and killed it because with the next-candle-open
entry its R came out BELOW 1. It killed every SHORT idea that day the same way.
KEEP the 1R check as it is? Or change it?~~
ANSWERED 2026-09-10, first "KEEP" then REVISED same day, verbatim: "this is the same with
the first question, that was a valid trade but early exit." — THE TRADE WAS VALID (the +0.10
outcome was the operator's own early exit; holding = 1.21R). A valid trade killed by the
EA's check is NOT accepted. The ROOT PROBLEM to find: how the EA computed R for that trade
(entry leg, stop, and especially the TP target it picked vs the operator's TP=AVP standard).
This is a FIX directive, not a keep-ruling. The earlier "Q1: KEEP the 1R check" answer is
SUPERSEDED by this revision.

## QUESTION 2 — one-idea-at-a-time vs your 9/4 trade
~~KEEP "first come, stays alive"? Or let a BETTER line replace a weaker alive one?~~
ANSWERED 2026-09-10, verbatim: "Do not simplify this. i know there is a valid M POC, but
i only journaled or input it as Y POC or AVP because there is a valid Y POC superseed the
M POC. I have attached my screenshot of it. as you know the black solid line is Y POC and
as marked with deep blue circle. I do not wish to proseed as your options, FIX THE SRJ POI
MARKER or how the EA sees them. find the root problem and not banaid solution."
RULING: the operator's standard is SUPERSESSION — a valid YEARLY POC supersedes a valid
MONTHLY POC (the EA must see and hold the higher-tier line, not the lower one). The EA's
behavior (seeding/holding MONTHLY POC while YEARLY POC retests presented) is the defect.
DIRECTIVE: FIX THE SRJ POI MARKER / how the EA sees the lines — find the ROOT problem,
not a band-aid. The while-alive no-replacement ruling (ANCHORTIER-1 §10) is REVISED by
this directive where a higher-tier line supersedes.

## QUESTION 3 — four signals you did not journal
ANSWERED 2026-09-10, verbatim: "8/31, I do not see M VWAP short. 9/1, i do not see M POC
long. same with the remaings. matter of fact, i do not see a potential setup at all,
structure wise on the exact candle time that you mentioned. do you even understand my
confirmation candle next candle open entry that happened after retracement? i suspect this
is the biggest problem, cause diregarding the POI validity, your entry candle time if off."
RULING: ALL FOUR = FALSE ALARMS. AND the deeper finding: the EA's ENTRY CANDLE TIME is off —
the operator sees NO valid setup (structure-wise) at the EA's signal candles. The suspected
ROOT PROBLEM: the EA's confirmation-candle model diverges from the operator's "confirmation
candle -> retracement -> next candle open entry" sequence. This is an entry-timing defect,
possibly bigger than the POI-line defects.
## QUESTION 4 — setups you call valid but do not take
ANSWERED 2026-09-10, verbatim: "Bad, my rulings, my valid trades is what i want to replicate
and automate." — EA-only signals = BAD (false alarms), without exception. The deployment bar
is exactly: replicate the operator's valid trades; nothing else may fire.
## QUESTION 5 — your entry times (optional)
ANSWERED 2026-09-10, verbatim: "9/7 the confirmation candle of 9:15 and 16:40, exact entry
as per my ruling is the next candle open after the confirmation candle close."
MEASURED AGREEMENT on 9/7: the EA's MTSNAP bar=09:15 entry=1.16135 (= the 09:20 open) and
bar=16:35 entry=1.16249 (signal 16:40:15; the operator's confirmation candle = 16:40, entry
= the 16:45 open — the EA fired WITH the operator's confirmation candle; entry timing on the
two 9/7 trades AGREES). The defect is on the OTHER signals: the EA fires at candles where no
confirmation-candle/retracement structure exists.

## THE BUILDER'S STATE
Stopped here: no source change, no re-run. On your answers the builder applies any change,
re-runs ONLY this two-week window, and reconciles again. A clean window unlocks testing the
older weeks.

