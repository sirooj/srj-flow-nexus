# BUILDER_RESULT_RECON22-LIMBSEAT1 — P-LIMBSEAT-1 STAGE-1 print run (graded)

**Status: DELIVERED (prints only). NO fix ships. Stage 2 HELD for dual-key grading relay.**

## 1. Run identity (measured, verbatim from STATUS/DONE/journal)

- Run `RECON22-LIMBSEAT1`, launched 2026-09-14 14:50:53, PID 22308, PRE_JOURNAL_LINES=149918 (contiguous from 21b).
- DONE=PASSED 15:46:24. `Test passed in 0:54:56.778`. 3168 bars / 563338 ticks (same as 20b/21b).
- Archive `06_HANDOFFS\RECON22-LIMBSEAT1_JOURNAL.log`: 55389 lines (= wrapper ARCHIVED_LINES exact), SHA256 `0B256BA72FA683697BF7228CCDAEC4BAE395A107FAD1756EC1`,
  bounds [149918..205307]. First lines: farm off / cloud off. Tail: agent-3003 log written + `connection closed` + final balance.
- Purity: farm-off / cloud-off / Core-04-only / Test-passed-1 (journal-measured).
- Build: EA `D23505D472560177E14AB48EEB245CFAE2AA2FCBE2B80BE3C0C620C4D923E792` (488941 B, both compile 0/0 first attempt);
  FlowLogic `3606BFB4…25911` unchanged. Pre-hash 150A6159 verified before any write. Leftover 22308 closed graceful post-run.
- Tabulation: `00_CURRENT_WORKING\tabulate_recon22_limbseat1.ps1` (one streaming pass) → `06_HANDOFFS\RECON22_SEL60.txt` (924 lines) + `06_HANDOFFS\RECON22_FINALS.txt` (1260 lines).
- Width: MAXLEN=537 = LW_CAP exactly, zero exceedance (no truncation pressure).

## 2. Family counts (segment-measured)

SLIMB 481 / SLIMBWALK 481 / SLIMBWALKF 481 / SLIMBR 10 / SEL52CTX 599 / SEL52 14376 / SEL57ROW 8596 / SEL58T 11817 /
SEL60LIMB 892 / SEL60DISC 1 / SUPPRESSED 152 / SEL54BAR 2 / SEL55 5 / SLEXT1 10 / SLEXT45 10 / SLSEP846 2 /
SLEXT47 118 / SLADDER 336 / ORIGINREG 5 / signals 4 / OrderSend 0. SEL60FINAL: stored=892 dropped=0 m5scan=967 m5drop=0 h1scan=75 h1drop=0.

## 3. D-grade (stage-1 print gates)

- **D1 (lists): 14/14 PASS** — SEL60END present for all 7 bars × M5/H1.
- **D2 (attribution totality): PASS** — unattributed=0 on all 14 summaries; store dropped=0; every stored limb carries a non-empty admitted_by.
- **D3 (isolation): PASS** — 481×3+10/10 + 599 + 14376 + 11817 + 118 + 152 + 4 signals + SEL54/S1 hook + SEL55 5 + SEL56 599,
  all equal to RECON21b's recorded values; SEL53_FINAL matrix identical in shape (G1 FAIL 0/12, best 2/4 V005/V013/V021 MONO/M5, G2x3=0);
  R-values identical (R1 2.429 / R3 1.661 / R4-walk 1.383 / R5-ret 2.478 / S1 0.669); 4 signal lines **byte-identical** vs 21b archive
  (R=2.43/2.56/1.76/1.25, same SL/TP/spreads); OrderSend 0; InpAdoptExt1=false untouched. R3: stage-1 outcomes byte-identical to legacy
  (static parity: no legacy line changed except 3 additive recorder calls + identical-body fixture move; verified by single-definition counts,
  HAND-grep gate, and legacy-line presence checks).

## 4. Seven-bar grading vs the frozen predictions

| Bar | Prediction | Measured | Grade |
|---|---|---|---|
| R1 | NO CHANGE 1.16508@06:30 | walk 1.16508@06:30 slot=43 g1m=1 R=2.429; shadow 06:30-U + 09:55-U both legacy+L1+L2 | PASS (control holds; ordinal path unchanged — walk code untouched, all recorded fields equal 21b) |
| R2 | DECLINES for filed reason | matrix identical to 21b (G2x3=0, decl instrument intact, shadow END limbs=168) | PASS (legacy identity) |
| R3 | NO CHANGE 1.15847@15:30 | walk 1.15847@15:30 slot=6 g1m=1 R=1.661; shadow 15:30-L legacy+L1+L2 | PASS (control holds) |
| R4 | 08:40 enters via L2/L3, else blank (b) | **08:40 ABSENT both sides both TFs** (absence probed over full 892-row store); M5 neighbours 08:20-L/08:35-U/08:55-U/09:10-L all legacy+L1+L2; H1 window 3 limbs; walk still 08:20 (1.16088, g1m=0) | **ROUTE TO BLANK (b)** per the packet's specified fail-route (F1 not extended). NOT a halt. |
| R5 | L1 recovers 16:15 (rawL populates, chain, 1.16239@16:15) | **NO 16:15-lower limb on any switch, either TF** (absence probed); M5 has 16:05-L (legacy+L1+L2), 16:15-U-only (legacy+L1+L2), 16:30-L (legacy+L1+L2); H1 window 4 limbs all legacy; walk retains 16:05 (retm=1, R=2.478); 16:30 anchor unshifted | **MECHANISM MISS (L1 refuted for 16:15)**: 16:15-low is not a 5-bar extreme vs its M5 neighbours (strict and non-strict both silent), and conf==1 excludes L3 by the packet's own definition. Fail-condition branch operative ("still side-dropped" in legacy + stronger shadow silence). NO force-fit (packet forbids). Council routes. |
| S1 | discriminator; HALT iff >1 forming limb | M5: exactly 1 limb in [09:40,10:10] = 09:40-U (legacy+L1+L2, l3via=0); H1: 0 limbs; **token=S-A-LIVE both TFs** | S-B NOT held; S-A live rule for stage 2; NO HALT (needs >1). No reseat at stage 1 by design. Walk still 09:05 (R=0.669 take=0). |
| S2 | side flips SHORT (stage 2); provenance now | PROVENANCE DELIVERED (see §5); side stays LONG (no resolver at stage 1, correct) | print PASS; change pending stage 2 |

L3via=0 on all 14 summaries (zero L3 admissions run-wide). R1-regression flag: level survives AND ordinal path unchanged → no partial regression.

## 5. F3 provenance (delivered) + F3(5) statement

- SEL60PROV at both Sep-8 bars: cqd=EMPTY, bias1=-1.0, bias2=-1.0, carried=LONG (matches the filed S1 side-rule contradiction).
- Write-chain (98/106 entries, dropped=0, 3 producers only: INIT / DetectPoiRetest / ResetSequence): last-before-bar = **DetectPoiRetest=LONG at both bars**.
  Reading: the LONG carried at 10:10 and 17:00 was set by the POI-retest detector object (pr.isLong), upstream of the meters; no meter writes to the side field exist (only 3 write sites in the tree, all instrumented). Meters oppose (-1.0/-1.0) while LONG is carried.
- **F3(5) statement: no his-read override exists in this build.** The F3 replacement (resolver + veto/promoter + POLARITY_MISMATCH + INDEPENDENCE assert) ships only at stage 2; promotion is vacuous at stage 1. The flagged interaction (promotion must not silently overturn a POLARITY_MISMATCH decline) is owed at stage-2 clearance.

## 6. REPORT+HALT triggers (stage-1): NONE fired

No 90-min timeout (55 min wall); l3via=0 everywhere (no >1-forming-limb); unattributed=0 everywhere (no unattributed admission).

## 7. Standing state

P-LIMBSEAT-1 STAGE-1 DELIVERED; stage 2 (F1 switches / F2 S-A origin-limb / F3 resolver / F4 wick + SCOPED_EXCEPTIONS) HELD for dual-key grading relay v22.
RECON17 frozen. Build D23505D4 uncommitted (no token). stop_source + one-writer invariant deferred to stage 2 per R4 ("may").
