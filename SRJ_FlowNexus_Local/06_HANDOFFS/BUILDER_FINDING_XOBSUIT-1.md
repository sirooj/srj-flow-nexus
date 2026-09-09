# BUILDER FINDING — XOBSUIT-1: the XOB-suitability facts for 08.18 04:50-14:10 (measured; the operator's standard is reserved)
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_XOBSUIT-1.md
Date: 2026-09-09 (new session). ZERO source changes. Journal facts from T161N_JOURNAL.log
(run-verified baseline T161N); OrderblockMgr facts from the current baseline
D286621C...20B7B. NOTHING is invented: section 4 holds the batched questions.

## 1. XOB 2159's ORIGIN AND LIFECYCLE (journal, verbatim fields)
- Origin candle: obStart=121380 = 2026.08.18 04:50 (the OB's own bar; created at the
  fractal confirmation). Bearish OB (mode=all promotion census line 05:10:03:
  "objId=2159 ... mode=all bias=bearish ... obStart=121380 obStartT=2026.08.18 04:50
  obVal=121381 obInval=-2147483648 promoBar=121383 promoT=2026.08.18 05:05").
- ACTIVATED at 04:55 (obVal=121381 — the bearish traversal; isActivated=1 at promotion).
- Promoted to XOB 2026.08.18 05:05 (bar 121383), mode=all. Zone 1.15794-1.15813;
  midline 1.158035 (obOpen at the zone low, so the pure-mid level == the old level).
- Validity through 14:10: isValid=1; the ONE kill of id=2159 came at 16:40 (code=4,
  bar=121521) — identical to T161K. Per the T161N midline rule and the operator's
  clarified doctrine, its survival through 14:10 was CORRECT.

## 2. THE SESSION-ROLL FACTS (the EA's zone re-pick, IDCHANGE/ZONEID lines)
- 04:45: IDCHANGE xobId 2103->2085 (bar 121377, state IDLE) — inWin=0 throughout.
- 05:05: IDCHANGE 2085->2159 (zone 1.15794-1.15813) — the EA adopted the fresh XOB.
- 05:45: IDCHANGE 2159->2103 (zone 1.15716-1.15732).
- 05:55: XOB 2162 (BULLISH, mode=nearest, obStart 05:30) promoted; IDCHANGE
  2103->2162 (zone 1.15752-1.15772).
- Later the EA re-picks 2159 again at every S3PICK: 09:20, 14:10, 14:45, 15:25
  (XOBPROMO site=S3PICK xobId=2159 promoT=2026.08.18 05:05 each time).
- MEANING: the EA's zone pick is a per-bar re-selection by recency/proximity rules; an
  XOB created in one session-part remains pickable in a later session. This is the
  concrete mechanism behind the operator's charter §9 phrase "The XOB rolls within the
  same session" — the code has NO session constraint on XOB selection.

## 3. THE 14:10 SETUP FACTS (the operator's rejected setup)
- 14:10:01 EA seeded IDLE->S1->S2->S3 dir=SHORT poi=Daily-POC (the marker retest of
  D-POC); ZONEID site=S3PICK picked xobId=2159 (zone 1.15794-1.15813, promoT 05:05).
- S3INPLAY bar=14:05: inPlay=0 via=none (the bar itself: lo 1.15744 hi 1.15756 —
  BELOW the zone; no touch that bar).
- The SL-leg in-play walk (XOBINPLAY/INPLAYCOMMIT): bounded=1, scanned=109,
  swings=16, hits=2, firstShift=14, firstVal=1.15798, cls=WIDEONLY — IN-PLAY via the
  swing walk; INPLAYCOMMIT committed=1 via=SWING. So the zone WAS in play per the
  Step-1 reconciled depth.
- Armed S4 the same bar (SLSRC src=OB_SWING slRef=1.15813 = the zone high, distPts=59).
- 14:15: FRESHCOUNT adverse=1 (fvgDead=1) verdict=HOLD; S4->S5; S5 waiting
  divLatch=0 tpOk=1 (the confirmed CQD verdicts then were +1@15:15-era mismatched —
  per the record the 14:20/14:40 phantom code-4s died in T161J's strict-swing fix;
  in T161J/K/N the setup never signals).
- The operator's OWN setup at 14:10 was W-POC NYAM short with INVALID CQD — the EA's
  candidate anchored Daily-POC (a different, lower-tier line) on the same bar.
- THE SUITABILITY FACT: under the T161N state the EA had a VALID (midline rule),
  ACTIVATED, IN-PLAY bearish XOB backing the short. The operator's "NO VALID XOB"
  verdict at 14:10 therefore cannot rest on validity (their clarified rule), activation,
  or in-play. It must rest on a DIFFERENT standard — candidates measured:
  (i) the zone WAS wickedly entered before 14:10 — the 09:15 walk's first touch is at
      shift 40 ≈ 05:55 (firstVal 1.15804, inside the 1.15794-1.15813 band) and the
      14:05 walk's first touch at shift 14 ≈ 12:55 (firstVal 1.15798) — see §4 Q1;
  (ii) a same-session (same-session-origin) requirement: 2159 originated at 04:50
      broker = pre-London, not in the NY AM session of the trade;
  (iii) a fresh-formation requirement: the operator may require the XOB to come from
      the CURRENT retracement/expansion leg, not a stale morning OB;
  (iv) the recency/promotion staleness: 09h05m between promotion and use.

## 4. THE BATCHED QUESTIONS FOR THE OPERATOR (the reserved standard)
Q1. TOUCH STANDARD: XOB 2159's zone was wickedly touched (first touch at shift 40 ≈
    05:55, val 1.15804 inside the band; a second swing-touch at shift 14 ≈ 12:55,
    val 1.15798; hits=2 by 14:10). Is a wick-touch/zone-entry enough to make an XOB
    "used"/consumed for you, after which it is NO LONGER a valid zone for a later
    trade — or is the standard something else (e.g., a body CLOSE INSIDE the zone,
    or a break of the zone edge)?
Q2. SESSION/ROLL: must the XOB backing a setup originate in the SAME session (your
    phrase "the XOB rolls within the same session")? XOB 2159 was born 04:50 broker
    (pre-London) and used in NY AM — is a cross-session XOB automatically unsuitable?
Q3. FRESHNESS: is there a freshness condition (e.g., the zone must be re-engaged by
    the CURRENT leg, or the promotion must be same-session, or a bar-count/structure
    condition) that disqualified 2159 at 14:10 for you — stated structurally (the §0
    law: no numbers for numbers' sake)?
Q4. ANCHOR-TIER OVERLAP: at 14:10 the EA seeded on the D-POC retest while your setup
    was W POC. Is your "NO VALID XOB" verdict partly an anchor-tier statement (the
    W-POC setup would have had no in-play W-tier XOB), independent of 2159's state?
Builder recommendation: answer Q1 first — it is the one that turns into a mechanical
test; Q2/Q3 likely express the same idea from different angles.

## 6. RULING RECEIVED 2026-09-09 (the operator's answers, verbatim) — THE ITEM CLOSES
Preface (operator): "i do not like to repeat to answer the same questions over and over
again, although i have explained it on another session and have been journaled in the
specification file."
1. TOUCH/CONSUMPTION: "no, only invalidation just like ordinary OB that got invalidated
   with a candle body closure beyond the midline." — a touch/zone-entry does NOT consume
   an XOB; the ONLY lifecycle exit is invalidation (body close beyond the midline), the
   T161N rule exactly as implemented.
2. SESSION/ROLL: "no, the XOB creation does not matter" — no same-session requirement.
   Matches spec §9.9 (age is not a disqualifier).
3. FRESHNESS: "no, as long as the SL swing leg is touched or in play from the XOB
   projection price level that is still valid" — the in-play test = the SL-leg walk
   from the XOB projection, exactly the STEP-1-reconciled walk the EA runs
   (XOBINPLAY/INPLAYCOMMIT). Matches spec §3.5 (no recency, no bar-count limit).
4. ANCHOR-TIER Q4: the operator does not understand the question's terminology —
   WITHDRAWN (it was the builder's framing, not a rule probe).
CONSEQUENCE (mechanical): the EA's T161N XOB-suitability behavior at 08.18 14:10
(valid-by-midline-rule, touched-not-consumed, cross-session-pickable, in-play via the
SL-leg walk) IS THE OPERATOR'S STANDARD — all four candidate hypotheses in §3 are VOID
as standards; the earlier "NO VALID XOB" framing dissolves (the 14:10 setup's
disqualifier was the invalid CQD divergence, per the standing record — the EA agreed by
not signaling). NO source change required or authorized. THE OPEN ITEM
"the XOB-suitability standard" IS CLOSED. This is also a builder correction: the
specification (§1.2 relevance, §3.5, §3.6, §9.9) already carried these answers — they
should have been read there first, per the operator's standing instruction.

