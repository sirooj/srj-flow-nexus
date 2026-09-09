# PACKET P-CQD-FLAGGATE — CQD divergence qualification: no same-side 2-of-4 satisfaction
STATUS: ISSUED 2026-09-09 ("P-CQD-FLAGGATE issued" + the UNIFY ruling) and EXECUTED AND VERIFIED
the same session — see 06_HANDOFFS\BUILDER_RESULT_161-J.md. New CQD baseline
92F3A62BE11E7343D2E9E05AD5B6FE7FCF565B69737E53A48628E6990792969F. (Pre-edit: 4B2D688C...96C2.)

The operator's answer chose "UNIFY: one strict swing predicate for the triangles AND the
divergence flag gate (detection changes — verdicts the EA consumes would change; supersedes/
absorbs P-CQD-FLAGGATE): P-CQD-FLAGGATE issued". EXECUTED under that combined authority.
The amendment below EXPANDS the edit set; the per-anchor gate rule (the packet's core) is unchanged.

## AMENDMENT 1 — THE UNIFY RULING (operator, same session, ruling recorded 2026-09-09)
The strict swing predicate is UNIFIED across all three uses:
  - IsPriceSwingHigh/Low (price flags): strict both sides.
  - IsCqdSwingHigh/Low (CQD flags): strict both sides — becomes IDENTICAL to IsCqdFractalHigh/Low.
  - IsCqdFractalHigh/Low (the TRIANGLES): strict both sides — fixes the tie marking
    (BUILDER_FINDING_CQD-FRAC-1 FRAC-1: the left-neighbor >= tie rule + carry-plateau ties).
Window stays 3-BAR (the 5-bar widening was offered as a separate option and NOT chosen).
Full edit set (8 sites, all in Indicators\SRJ_CQD_TickBased_MT5.mq5; the EA is NOT edited —
baseline AB102C0A...3A24EAC stands; T161I is the control run):
  E1 IsPriceSwingHigh  L510 return -> strict:  (h[i] > h[i-1] && h[i] > h[i+1])
  E2 IsPriceSwingLow   L517 return -> strict:  (l[i] < l[i-1] && l[i] < l[i+1])
  E3 IsCqdSwingHigh    L526-527 return -> strict: (CQD_High[i] > CQD_High[i-1] && CQD_High[i] > CQD_High[i+1])
  E4 IsCqdSwingLow     L536-537 return -> strict: (CQD_Low[i] < CQD_Low[i-1] && CQD_Low[i] < CQD_Low[i+1])
  E5 IsCqdFractalHigh  L547 return -> strict: (CQD_High[i] > CQD_High[i-1] && CQD_High[i] > CQD_High[i+1])
  E6 IsCqdFractalLow   L556 return -> strict: (CQD_Low[i] < CQD_Low[i-1] && CQD_Low[i] < CQD_Low[i+1])
  E7 TryDivergence gate (L732-735): insert the per-anchor minimum AFTER the flagSum<2 test
  E8 ScanUnconfirmedDivergence gate (L984-987): same insertion
Guards (CqdReady/SameEpoch) UNCHANGED everywhere. flagSum>=2 kept (now implied by the per-anchor
rule — retained as the documented 2-of-4). The original per-anchor edit text below stands as E7/E8.

BASIS — OPERATOR RULING 2026-09-09 (verbatim): "I have another rule and this is the fault or
defect in the current version of the CQD indicator. when there is the dottet lines that indicate
the potential divergence which is still not confirmed swing candle wise, there is this defect of
when the two swings have present but both on the left which already satisfied my two out of four
requirement. so i want you to change this behaviour on the indicator."
EFFECT ON PRIOR RULINGS: the 2026-09-08/09 "CQD is correct by design" ruling is REVOKED for this
one behavior (the CQD-DA-1 mechanism, which the operator now rules a defect). All other CQD-DA
findings remain measurements of deliberate behavior unless separately ruled.

## THE DEFECT (measured, both scans share the gate)
- Confirmed scan TryDivergence: x2 flags L671-672, x1 flags L729-730, gate L732-735:
  `if(flagSum < 2) continue;`. When x1 carries BOTH flags (x1PriceFlag + x1CqdFlag) and x2 carries
  NONE, flagSum = 2 -> qualifies. A divergence is born whose right anchor is not a swing at all.
- Preview scan ScanUnconfirmedDivergence: x2 = rates_total-2, the LAST CLOSED bar (record
  correction: CQD-DA-4 said the live bar was the anchor; the code anchors the preview at the last
  closed bar and uses the live bar only as x2's right-hand swing-test neighbor, L904, L919-926);
  x1 flags L982-983, gate L984-987 — the SAME same-side satisfaction.
- The operator's 2-of-4 requirement is being satisfied by two flags that sit on ONE anchor.

## THE RULE (the operator's, as implemented)
The 2-of-4 swing-flag requirement must NOT be satisfiable by same-side flags: at least one swing
flag is required from EACH anchor (x1 >= 1 of its two, x2 >= 1 of its two), and the total stays
2-of-4. This also matches the operator's recorded manual standard (CQD-DA-1: "the operator's
manual read requires both anchors to be real swing points"). The alternative (right-anchor-only
minimum) was considered and rejected: it would still allow a non-swing x1. Scope: BOTH scans —
the gate is one requirement, and the EA consumes the CONFIRMED stream, so a preview-only fix
would leave the EA-side defect intact.

## THE EDIT (two sites, same shape, additive — no line removed)
File: Indicators\SRJ_CQD_TickBased_MT5.mq5 (canonical; Stage-1 digest MUST equal
4B2D688C6A29B1A8CA0E2F894526A63C82DAACE6846B5A339A473D03140D96C2, 50,557 bytes).
SITE 1 (confirmed, after L734-735 `if(flagSum < 2)` + `   continue;`), insert:
   //--- [P-CQD-FLAGGATE / operator ruling 2026-09-09] The 2-of-4 gate must not be
   //--- satisfiable by same-side flags: both swing flags sitting on ONE anchor
   //--- (e.g. x1 price + x1 CQD with a non-swing x2) no longer qualifies. At
   //--- least one swing flag is required from EACH anchor.
   if((!x1PriceFlag && !x1CqdFlag) || (!x2PriceFlag && !x2CqdFlag))
      continue;
SITE 2 (preview, after L986-987 `if(flagSum < 2)` + `            continue;`), insert the same
six lines (identical variable names apply at that site).

## EXECUTION SEQUENCE (per .clinerules §5)
STAGE 1 — re-hash the CQD before any write; MUST equal the digest above. A mismatch is DIAGNOSED
  (R-236 metadata-touch possibility), never assumed, never reverted.
STAGE 2 — apply both insertions (editor tool, literal absolute path).
STAGE 3 — re-hash; record the NEW digest AFTER the write (invariant 4); CRLF census (expect
  all-CRLF preserved, LONELF=0).
STAGE 4 — compile the INDICATOR with the R-52 compiler (metaeditor64.exe /compile on
  SRJ_CQD_TickBased_MT5.mq5); EXPECT 0 errors 0 warnings; archive as
  06_HANDOFFS\T161J_CQDCOMPILE.log (gitignored per R-220). Re-hash after compile (source untouched).
STAGE 5 — verification run, headless /config (T161J_P1.ini = the T161H harness shape, full
  Tier-1 superset 2026.08.14-2026.08.22, InpDebugLog=true as tester input). The tester consumes
  the freshly compiled indicator through the EA's iCustom binding, so the run measures the change
  end-to-end. CONTROL: the T161I run (P-DIVCON-B, pre-flaggate) isolates the flaggate effect.
  GATES (all measured, reported verbatim):
    a. WS161_CENSUS fields=15 loads=1728 stores=1728 mismatch=0 (CQD-independent instrument).
    b. Signals printed verbatim and compared against BOTH T161H and the T161I control. A signal
       delta is a RESULT: verdicts born from same-side flags disappear (CQD-DA-1 predicted the
       08.18 14:20/14:40 code-4s are exactly this shape — the 14:50 FALSE POSITIVE is expected to
       change; the change is measured, never assumed).
    c. The journal's CQD DIV census lines counted and tabulated (verdict stream before/after).
    d. Post-run CQD + EA re-hashes byte-identical to the Stage 3 digests.
STAGE 6 — write 06_HANDOFFS\BUILDER_RESULT_161-J.md (digests, gate table, raw signal lines,
  the verdict-stream delta table). NOTHING under 02_TASK_CHECKPOINTS. No git add/commit/push.

## STOP CONDITIONS
- Stage 1 digest mismatch: STOP, diagnose, report; revert nothing.
- Any gate failure or compile error: report BLOCKED with the gate and its measured value; write
  nothing further; REVERT NOTHING (invariant 8).
- Transport truncation: say so, stop, re-issue (invariant 7).
