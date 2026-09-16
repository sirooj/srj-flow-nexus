# FINDING - exit model audit (READ-ONLY; sole remaining blocker TP/outcome)

**Method:** code read (EA:10904-10919 selection, EA:11011-11016 assignment, EA:2204-2225 side filter, EA:10839-10847 header contract) + EXITVERDICT trajectory rows + 7-row exit table, RECON41. No canonical edit, no build, no run. Adversarial alternatives tested (H1-H4 below). No clearance spent or asked.

## 1. Mechanism (coded, not inferred)
- R-gate TP (entry): closest line at entry (liveTp field). MT TP (manage): `MtNearestTpTarget` per bar -> CURRENT nearest favorable-vs-CURRENT line (EA:10905, comment cites Q6); vTP = wick touch of it (EA:10917-10918).
- Exit assignment (EA:11011-11014): SL first (exit=slRef) > TP_TOUCH (exit=curTp) > POI_BODY_BREAK (exit=nextOpen) > HTF_FLIP (exit=nextOpen).
- Side filter (EA:2208-2209): favorable vs CURRENT price only — never vs entry. A retreating price pulls curTp toward/below entry; touching it exits, possibly at a loss. Adverse-vs-entry TP_TOUCH (KO/DH) is BY-CONSTRUCTION possible.
- Trajectories prove reselection: PR 1.16364->1.16451 / KO 1.16200->1.16133 / FL 1.16083->1.16114 across bars; JJ static 1.16315.

## 2. Alternatives (rule-20 demonstration)
- H1 trailing-nearest: CONFIRMED (code + trajectories).
- H2 spread/fill modeling: REJECTED for TP_TOUCH gaps (no spread term in EA:11011-11014); GQ/OD nextOpen exits BY CONSTRUCTION for non-TP reasons.
- H3 SL-masking (KO/DH really SL): REJECTED (vSL=0 on their EXITVERDICT rows; else-if construction).
- H4 line repaint vs reselection: OPEN — verdict rows do not name the TP line, so same-line-move vs nearest-change unresolved at row level. Stated limit.

## 3. Open for council (NOT ruled here)
- Adverse-curTp lawful per Q6/spec or defect? R stays GATE-ONLY or outcome-meaning restored in bounded form? Carried in v118 (relay ALONE, both seats, same prompt).

## 4. Files/locks
Relay `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v118-EXITMODEL.md` (75 lines, all evidence inline). RECON17 frozen; BFAE4F4B uncommitted. NO build/run/commit.
