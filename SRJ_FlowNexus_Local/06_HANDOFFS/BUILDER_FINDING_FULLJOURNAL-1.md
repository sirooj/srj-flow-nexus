# BUILDER FINDING — FULLJOURNAL-1: the whole-journal census + the reconciliation plan
Report: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_FULLJOURNAL-1.md
Date: 2026-09-09. Basis: the operator's deployment bar (GOAL_STATEMENT Amendment 4, verbatim:
"what about the other trades that are on my journal? ... i absolutely do not tolerate if the
EA has not execute and think my strategy as is. until then, i would never deploy this EA").
READ-ONLY — zero source changes.

## 1. THE CENSUS (parsed with a quote-aware parser; Import-Csv fails on the file's
duplicate header names — declared)
- OPERATOR_TRADE_JOURNAL.csv: 300 journal rows (#1-#300), 75 distinct trading days,
  span 2026-06-01 .. 2026-09-09.
- 92 rows carry a CVD divergence code; 17 rows carry a Gain % (the operator's executed,
  outcome-recorded trades); 37 more rows carry an R-figure in the Comment — most marked
  invalid by the operator's own standard ("less than 1R", "invalid CQD", "invalid XOB").

## 2. THE VALID TAKEN TRADES (Gain % filled — the operator's executed set; 17 trades on 15 days)
#16 6/4 NY MR F-AVP 2 +2.30 | #53 6/18 LDN TF F-AVP 4 +1.51 | #59 6/19 NY TF F-AVP 3 +1.48
| #75 6/25 NY TF D-AVP 3 +1.02 | #89 7/1 LDN TF Q-AVP 4 +1.56 | #92 7/1 NY MR F-AVP/W-VWAP 4
+2.12 | #114 7/9 LDN MR F-AVP 2 +0.97 | #132 7/15 NY MR W-AVP 1 +3.15 | #146 7/21 LDN MR
F-VWAP 4 -1.00 | #210 8/12 LDN MR M-VWAP 3 +1.29 | #223 8/17 NY TF W-VWAP 3 +0.10 | #233
8/20 LDN TF D-VWAP 3 +1.61 | #247 8/25 NY TF W-VWAP 3 +0.66 | #257 8/28 LDN TF D-VWAP 2
+0.10 | #280 9/4 NY MR Y-AVP 3 +0.84 | #281 9/7 LDN TF W-AVP 3 +2.03 | #283 9/7 NY TF W-AVP
3 +1.06
NOTE: the Tier-1 window (08.14-08.22) covers only #223 and #233 of these 17. The other 15
trades (all of June, July, and 8/25-9/7) have NEVER been measured against the EA.
OPEN DATUMS for the operator (needed during reconciliation): the POI labels Y AVP and
Q AVP (presumed yesterday's / prior-quarter-or-session AVP) and the "only valid on raw
tick" notes (the CQD is tick-based; TradingView CQD is not — expected to agree).

## 3. THE MEASUREMENT GAP (the honest answer to "does the EA match my journal")
The EA has been run ONLY on 08.14-08.22 (9 days). Evidence so far = 2 of 17 valid taken
trades (one complete match, one candidate agreement). The deployment bar requires the
other 15 + zero false positives on the ~37 documented-invalid setups + the untouched
rows. THE TIER-1 RESULT IS A SAMPLE, NOT THE GOAL.

## 4. THE RECONCILIATION PLAN (mechanical; runs need the operator's machine + completion signal)
1. Segment runs over the full span, ~monthly: 6/1-6/30, 7/1-7/31, 8/1-8/31, 9/1-9/9
   (Tier-1 pace: ~30 min per 9 calendar days -> each segment ~1-1.5 h; total ~5-6 h).
   Harness v2.3, alert-only, no canonical change; each launch = stage + launch + STOP
   (the polling rule; the operator signals completion).
2. Row-by-row reconciliation table: each of the 17 taken trades vs the EA's signals in
   its day (session/dir/POI-family/CVD/entry-time); each documented-invalid setup vs
   the EA's silence; untouched rows reviewed for EA-only signals.
3. Every MISS root-caused: mechanical gap = packet fix (operator issues); semantic gap
   = operator ruling. Iterate until zero missed valid trades + zero false positives
   across ALL 75 days. THAT is the deployment bar; ALERT-ONLY stands throughout.
Census tool note: the parser output above is the instrument; the raw rows are in the CSV.

## 5. CORRECTION (2026-09-09): §2's "OPEN DATUMS" are RESOLVED — the operator's gloss
"Y is for yearly and Q is for Quarterly." The EA machinery ALREADY exists: the twelve
POI families are FOMC/Yearly/Quarterly/Monthly/Weekly/Daily × POC/VWAP (EA L82-93:
POI_BUF_Y_POC = "Yearly-POC" rank 2, POI_BUF_Q_POC = "Quarterly-POC" rank 4). The
journal POI labels therefore map COMPLETELY: F/Y/Q/M/W/D AVP = the *-POC buffers,
"<letter> VWAP" = the *-VWAP buffers. NO new machinery and NO operator question remain
for the reconciliation. The one remaining journal nuance is the "only valid on raw
tick" notes (the EA's CQD is tick-based; TradingView's is not — expected to agree).
ALSO CORRECTED: this finding's §4 plan and the 2026-09-09 relay draft presumed R-Q12
was open — it was NOT (R-100/R-107, REVISION_63 §6.3; §11.1 CLOSED). The reconciliation
proceeds with ZERO open strategy questions.