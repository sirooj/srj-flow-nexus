# BUILDER FINDING — 0820-TP: the 08.20 TP-reference layer measured (the label corrected; the mechanism verified; the residue = R-Q12 + one operator datum)
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_0820-TP.md
Date: 2026-09-09. READ-ONLY — ZERO source changes. Basis: the operator's directive to
proceed through the queued works; the layer was recorded in GOAL_STATEMENT Amendment 1
("the TP reference (their S LQ vs the EA's nearest-POI 1.16837)") as a layer, not a
disagreement. Sources: the T161R journal (T161R_JOURNAL.log segment) + the EA source on
the T161R baseline A0701893...3FD57E.

## 1. THE LABEL CORRECTION (a builder error of record)
GOAL_STATEMENT Amendment 1 calls the EA's 08.20 TP figure "the EA's nearest-POI 1.16837".
MEASURED: 1.16837 is ASH — the ASIA SESSION HIGH — a SESSION-LIQUIDITY level from
FlowLogic's session group (buffer 10, EA FL_BUF_ASIA_HIGH), NOT a POI line. TPCENSUS
#121 (T161R journal, bar=2026.08.20 09:30, verbatim):
"TPCENSUS #121 bar=2026.08.20 09:30 dir=LONG close=1.16770 winner=ASH best=1.16837
distPts=67 empties=0 admitted= PDH:20 ASH:67 LOH:32 NYH:1 PMH:20"
The signal line's tp_target=1.16837 (T161R TABULATION L10) is therefore the EA's
SESSION-LIQUIDITY target — the operator's own "S LQ" FAMILY, not a POI. The operator's
row #233 records "TP LQ = S LQ". THE TP-REFERENCE LAYER AS LABELED DISSOLVES; what
remains is §4 below.

## 2. THE SELECTION MECHANISM (source-verified, T161R baseline)
- TpTargetUpdateBest (EA L1661-1682): the filters in order — EMPTY_VALUE/<=0 (L1664);
  DIRECTION (L1665: a LONG target must sit above currentPrice); ZONE CONTAINMENT
  (L1678: a target inside the live entry zone is not a target); then NEAREST wins
  (strict <, L1680).
- The session group additionally passes TpSessionLevelFiltered (EA L1692-1704, Task 39):
  EA-26 — a level whose swept bit is set is excluded ("swept once = not fresh");
  EA-51 — a LIVE session's own extreme is excluded ("a still-forming session's own
  extreme is never a target").
- The POI group is family-pair tier-filtered against the anchor (EA L1755) and is
  deliberately NOT mask-filtered (comment L1716-1717).
- The TPCENSUS print (Task 23, EA L1760-1817) is READ-ONLY advisory: its "admitted="
  list applies EMPTY + DIRECTION ONLY (L1786-1790) — NOT the mask filter, NOT the zone
  guard — so it overstates the true candidate set. The winner line names the actual
  `best` (exact-equality match, L1791).

## 3. THE 08.20 09:30 RECONSTRUCTION (mask 2369, verbatim in the journal)
raw=2369 = bits {0, 6, 8} swept + bit 11 live → per the sessIdx order (PDH=0, PDL=1,
ASH=2, ASL=3, LOH=4, LOL=5, NYH=6, NYL=7, PMH=8, PML=9):
- PDH (bit 0), NYH (bit 6), PMH (bit 8): SWEPT-EXCLUDED (EA-26) — despite appearing in
  the census's "admitted=" list at 20/1/20 pts.
- LOH/LOL (sessIdx 4/5, liveBit 11 = London, live at 09:30 server): LIVE-EXCLUDED
  (EA-51) — LOH at 32 pts was nearer than ASH but is a still-forming session's extreme.
- NYH additionally inside the adopted zone (1.16737-1.16778): zone-excluded besides.
- The only remaining valid session target ABOVE price = ASH 1.16837 (67 pts) → WINNER.
The selection is internally consistent; the census line merely shows more candidates
than the selection consumed.

## 4. WHAT REMAINS OF THE LAYER (both items already open — nothing new is invented)
(a) WHICH session level is the operator's "S LQ"? If their row #233's S LQ was the Asia
    High, the layer dissolves ENTIRELY (the EA picked the same object). If it was the
    LONDON High (1.16802 at 09:30 — nearer, excluded by EA-51), the difference is
    EXACTLY the already-open council question R-Q12: REVISION_60 item 16 ruled EA-51's
    session-live filter "NOT IN §3.7, requires R-Q12" (spec §3.7 excludes only
    "already swept as session liquidity" and "closed over" — a LIVE session's extreme
    is not excluded by the spec's words). R-Q12 is recorded open; it belongs in the
    flagship/council relay.
(b) The trade outcome is consistent on both sides: the operator exited on "the S LQ
    target" (HTFAUDIT-1 §1); the EA exited 14:05 HTF_FLIP at 1.16955 (T161R) — both
    beyond ASH 1.16837; no contradiction is measured between the two exit styles.
NO source change is made or proposed by this finding. R-Q12 is already on the record;
the only NEW datum for the operator is which session level "S LQ" denoted on 08.20
(a one-line answer, non-blocking, foldable into any future relay).

## 5. THE OPERATOR'S S-LQ ANSWER (2026-09-09, verbatim) — THE LAYER DISSOLVES
The operator, verbatim: "yes S LQ is just my simplification on my TP target which ever
session liquidity is the nearest, same with VWAP and AVP (POC) cause i don't state the
origin such as W VWAP."
RULING OF RECORD: the operator's journal labels (S LQ / VWAP / AVP-POC) are FAMILY
simplifications — the nearest member of the family, with the origin session unstated.
Under that standard, the EA's 08.20 pick (ASH 1.16837 = the nearest valid session
liquidity above price) IS the operator's own rule. The 08.20 TP-reference layer
DISSOLVES ENTIRELY — no disagreement remains on the TP object.
WHAT SURVIVES: only the EA-51 question (does "nearest" include a STILL-FORMING
session's extreme — on 08.20 the live London High at 32 pts was excluded and ASH at
67 pts won) — this is exactly the already-open R-Q12, forwarded to the flagship
council relay at the operator's order. The builder records no new open item.

## 6. CORRECTION (2026-09-09, builder error of record): §5's "WHAT SURVIVES" is VOID
R-Q12 was ALREADY ANSWERED AND CLOSED before this finding was written. MEASURED ON DISK:
REVISION_63_CONSOLIDATED_HANDOFF.md §6.3 R-100, verbatim: "R-Q12 ANSWERED. EA 655's
session-live target exclusion RULED CORRECT AS INTENT. Item 16's residual is the POI
anchor-tier filter alone. SCENARIO G IS SCORABLE. ADMISSION-TARGET ADMISSIBILITY: a
session extreme is admissible at admission when it is CLOSED, UNSWEPT and NOT CLOSED
OVER. Three exclusions, all attributed." Corroborated by R-107 ("R-Q12's original text
CORROBORATES R-100/101/102 without amendment... 17 August's seven bars choosing
London's closed high over New York's forming high") and §11.1 ("R-Q11 and R-Q12 are
both ANSWERED and CLOSED"). CONSEQUENCE: no relay exists, none is needed; EA-51 (the
live-session exclusion) is RULED-CORRECT behavior; the 08.20 ASH pick is the ruled
rule's own output; the TP-reference layer is fully closed by §5 plus the standing
ruling. The operator ALSO corrected the roles (2026-09-09, verbatim in GOAL_STATEMENT
Amendment 5): strategy-rule questions go to THE OPERATOR (spec first — ask nothing the
spec already answers); the flagship council (Opus 5) takes CODE questions; GPT 6 Astra
takes the non-code external review.