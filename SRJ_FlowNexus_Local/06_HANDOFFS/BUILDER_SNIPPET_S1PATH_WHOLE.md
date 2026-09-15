# SNIPPET #2 — S1 DOWNSTREAM PATH (one paste; answers the named-lines request)

**Paste whole to EACH reviewer TOGETHER with the v67 relay (one trip, two pastes). Answers ride with the v67 verdicts: close the flag (wiring-point confirm-or-move) + touch-flag acknowledged. Nothing builds/runs/commits on this file.**

**Bind:** `Experts\SRJ_FlowNexus_EA.mq5` — SHA256 `E68E0AE38CB0C968132368C6BDD45E155C55B956A7FE4A06260AE43E55700057` (559189 B, 10550 lines). Code lines verbatim with EA numbers, zero condensation. Journal lines verbatim from `06_HANDOFFS\RECON30-STAGEC_JOURNAL.log` (38027 lines / `41404E0F…`).

**Question (reviewer's own flag):** the S1 candidate never reached downstream stages, so some path between seed completion (7536–7547) and the 10:10 site must have produced the record — show whatever reads ST_S1_REGIME and produces the fire/SITE record, or prove no later decision bar exists.

**Builder reading (labeled; council rules):** no later decision bar exists. Regions 1–2 advance-or-retain without writing direction; Region 3 is the sole direction-clearer and never fired for S1 (Region 5: LONG held through 10:15, zero ABORT/REFUSED 09:15–10:10); Region 4 is the single fire site and never ran for S1 (no S5 rows, no signal). The 10:10 LONG is the 09:15 seed LONG unchanged in direction — determination happened at inception, which the Track-1 shadow gate tests exactly. Honest nuance carried: the anchor re-bound Daily-POC→Monthly-POC at 09:20 (anchor-only poll, direction untouched); S2-retention reason = LTF-unaligned (datum for grading, not design).

## Region 1 — state chain, EA:7549–7572, whole (the ONLY forward path from ST_S1_REGIME)

7549:    if(g_state == ST_S1_REGIME)
7550:      {
7551:       ENUM_SRJ_REGIME regime;
7552:       if(!ClassifyRegime(barShift, g_dir, regime))
7553:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
7554:       if(regime == REGIME_NONE)
7555:         { if(InpDebugLog) PrintFormat("[SRJ-EA] S1WAIT bar=%s dir=%s poi=%s sess=%s - regime unclassified, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
7556:       g_regime = regime;
7557:       ENUM_SRJ_STATE prev = g_state;
7558:       g_state = ST_S2_LTF_ALIGN;
7559:       LogState(prev, g_state);
7560:      }
7561: 
7562:    if(g_state == ST_S2_LTF_ALIGN)
7563:      {
7564:       bool aligned;
7565:       if(!CheckLtfAlign(barShift, g_dir, aligned))
7566:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
7567:       if(!aligned)
7568:         { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
7569:       ENUM_SRJ_STATE prev = g_state;
7570:       g_state = ST_S3_ZONE_WAIT;
7571:       LogState(prev, g_state);
7572:      }

## Region 2 — per-bar held-state reader, EA:7225–7229, whole (reads direction, writes none)

7225:    if(g_state >= ST_S1_REGIME && g_dir != DIR_NONE)
7226:      {
7227:       string kind;
7228:       g_divLatch = UpdateDivergenceLatch(barShift, g_dir, kind);
7229:      }

## Region 3 — abort-to-reset, EA:6186–6220, whole (the SOLE direction-clearer: abort ⇒ DIR_NONE at 6160 via 6219)

6186: void GoAbort(const string reason, ENUM_SRJ_STATE atState)
6187:   {
6188:    LogAbort(reason, atState);
6189:    if(InpDebugLog && g_dir != DIR_NONE)
6190:      {
6191:       string a6rBT = TimeToString(TimeCurrent(), TIME_DATE|TIME_MINUTES);
6192:       string a6rLn = StringFormat("[SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=%s state=%s dir=%s predicate=%s",
6193:                                   a6rBT, StateName(atState), DirName(g_dir), reason);
6194:       A6Emit("REF" + a6rBT + reason + StateName(atState), a6rLn);
6195:      }   //--- [A6-HOOK] (ii) refused decision row (candidate alive => born+rejected)
6196:    //--- TASK 19c: count NO_REGIME aborts so the census can be read against
6197:    //--- them directly. Measurement only.
6198:    if(InpDebugLog && reason == ABORT_NO_REGIME) g_ea19_noRegimeAborts++;
6199:    if(InpAlertStandDown && g_alertedArmed && !g_alertedSignal)
6200:       EmitAlert("STAND-DOWN", "reason=" + reason, false);
6201: 
6202:    //--- TASK 15: shadow record. Must fire BEFORE ResetSequence()
6203:    //--- clears g_dir and g_anchorLine. Read-only measurement.
6204:    if(InpDebugLog &&
6205:       (reason == ABORT_NO_REGIME || reason == ABORT_LTF_MISALIGN))
6206:      {
6207:       g_shadowActive = true;
6208:       g_shadowDir    = g_dir;
6209:       g_shadowLine   = g_anchorLine;
6210:       g_shadowOpened = g_anchorBarTime;
6211:       g_shadowSess   = g_sessionAtEntry;
6212:       g_shadowFail   = reason;
6213:       g_shadowBars   = 0;
6214:      }
6215: 
6216:    ENUM_SRJ_STATE prev = g_state;
6217:    g_state = ST_ABORT;
6218:    LogState(prev, g_state);
6219:    ResetSequence();
6220:   }

## Region 4 — single fire site, EA:9348–9349 (the only emission; never ran for S1)

9348:        LogSignal(tpTarget, tpR, slRef, slMode, divKind);
9349:        if(InpDebugLog) A6Fired(barShift, tpTarget, tpR, slRef, slMode, divKind);   //--- [A6-HOOK] (ii)

**Singularity (whole-file counts, case-sensitive):** `LogSignal(` 2 = def 1700 + call 9348. `A6Fired(` 2 = def 4198 + call 9349. `GoAbort(` 17 = def 6186 + 16 call sites (7553, 7566 among them — none fired for S1 per Region 5). `g_dir` writes 3 = 956 + 6160 + 7529 (carried proof). B3 supersession poll reads held state pre-fire and re-binds the ANCHOR only (zero `g_dir` writes per the same proof) — excluded from this snippet with reason stated, not hidden.

## Region 5 — S1 morning live journal, verbatim (retained LONG 09:15→10:15, no abort, no S5, no fire)

GL	0	16:32:16.191	Core 04	2026.09.08 09:20:00   [SRJ-EA] ANCHOR_ELECT bar=2026.09.08 09:15 action=SEED poi=Daily-POC rank=10 tier=5 dir=LONG
LF	0	16:32:16.191	Core 04	2026.09.08 09:20:00   [SRJ-EA] S2WAIT bar=2026.09.08 09:15 dir=LONG poi=Daily-POC sess=LONDON - LTF bias unaligned, candidate RETAINED (Stage 3a)
DE	0	16:32:28.398	Core 04	2026.09.08 10:10:00   [SRJ-EA] S2WAIT bar=2026.09.08 10:05 dir=LONG poi=Monthly-POC sess=LONDON - LTF bias unaligned, candidate RETAINED (Stage 3a)
OG	0	16:32:28.398	Core 04	2026.09.08 10:15:00   [SRJ-EA] S2WAIT bar=2026.09.08 10:10 dir=LONG poi=Monthly-POC sess=LONDON - LTF bias unaligned, candidate RETAINED (Stage 3a)

**Zero-statement (honest method):** first probe pattern (trailing-tab timestamp) returned 0 — VOID, owned (trailing tab assumed; live stamps carry seconds). Corrected pattern (no trailing tab) over 09:15–10:10 with filter ANCHOR_ELECT|S1WAIT|S2WAIT|ABORT|REFUSED|CONFIRM|SESSION_LIMIT|RETAINED: ABORT 0, REFUSED 0, CONFIRM_* 0 (only CONFIRMPOLL shadow reads), S1WAIT 0, S2WAIT every bar 09:15→10:15. Persistence proven two ways (held-LONG at site + zero clearer).

## Touch-flag answer (reviewer's minor flag, builder-confirmed from code+record)

EA:2112's ±1-point band is wick-contact granularity (minimum price step — without it only exact-tick touches count). The no-tolerance rule governs filed-vs-code level identity (v13 terms), a different surface. Both stand; intentional, not a defect.

(End — snippet #2 under the §Bind digest; close-out ask per v67 §2)
