# FINDING ADOPT-READINESS-V27 - pre-build adherence audit for the v27 tree (read-only; no build, no run)

**Tree audited:** `Experts\SRJ_FlowNexus_EA.mq5` 21501194/681197/12259 (STAGE-1 re-hash same turn as the v13 key; MATCH). Prior audit (`BUILDER_FINDING_ADOPT-READINESS.md`) covers long-superseded tree 703C3B0A only - nothing below reuses it. Method: mechanical probes on v27 bytes (counts + line cites beside every claim); semantic grades ride filed behavior (RECON75 result 0C842834/53 + V353 grade), never re-argued here.

## Rule-by-rule (fundamental rules statement, 101 lines, re-read same turn)

- **R gate (>= 1.0, unrounded):** ADHERES. Input default `InpMinRewardRisk = 1.0` (EA-57); refuse leg `<` raw doubles (EA-7682); pass leg `>=` raw doubles (EA-10244). No rounding, no epsilon (16 hits tree-wide, all raw).
- **Alert-only:** HOLDS. `OrderSend(` 0x tree-wide. No execution path exists; alert-only stands regardless of this build.
- **Setup independence / divergence / side owner / stop branch + wick / adoption state / filed-authoritative / POI+sweep / journal target:** legacy semantic findings from the EU lane; for THIS run scope (UJ June blind window, register section-B misses) the binding record is RECON75 (2 takes + 3 diagnosed misses) + V353 CLEAR (2-0 tallied). No filed defect outside the v13 scope blocks this window. Full-journal EU reconciliation stays OPEN (deployment bar UNMET - stated openly, never a build gate for a UJ diagnostic run).
- **A+ strict:** carried by the B2 kill + floor blocks + declines-silence observed on RECON75 (5 floor blocks + declines silent-correct per result 0C842834); re-graded on the new run, never assumed.

## v27 mechanism inventory (what the tree carries into the build)

- FIX-2v11 present as designed: S2SEEDBIAS_KILL print (EA-8385), UJRETARGET print (EA-11882), UJSBTELEM 10-field print (EA-8405), B4 setter un-gated (EA-8166) with print gated (EA-8194).
- t78 transfer displaces on confirmed-opposite (EA-7874 `t78_opConf && !t78_heldConf`) - the H1 guard's EA-7866 basis, already live at the sibling edge.
- v13 absent as designed: UJRESEED / UJOPCONF / UJHOLDEXPIRE / ABORT_HOLDER_EXPIRED / allowReclaim all 0x; H1 overwrite line 0x. STAGE-1 dispositions: H-block + SIG/CALL/S3TELEM-mod expect old-1x/new-0x (OPEN); R/RHELP/B2/B3/B4 expect old-0x/new-1x (already-applied skip) or STAGE-1 halts the site, never force-applies.

## Waste-guard conclusion

No filed mismatch outside the v13 scope blocks a UJ diagnostic run on this tree. The run returns novel evidence per the relay budget (H1a first-reseed row + H3 arm-attributable rows + H1-expiry two-pattern zero), which no prior run produced. Cost: one build + ~50m UJ June window (measured RECON75 55:38) + grade battery. EU sibling needs its own word + key scope, never this key.
