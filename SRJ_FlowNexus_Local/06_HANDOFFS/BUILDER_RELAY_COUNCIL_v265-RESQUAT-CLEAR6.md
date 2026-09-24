# BUILDER RELAY COUNCIL v265-RESQUAT-CLEAR6 (2026-09-24, clearance ask: clear PACKET_P-RESQUAT-1 v7 to build; session CONTINUE)

Project brief (standing - read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: packet P-RESQUAT-1 v1 through v7; relays v259 through v264 on disk; every version folds the prior round's verdicts (see each relay's delta paragraph). Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

## 0. What this relay asks (read first)

- ONE clearance packet, TWO halves, TWO verdicts: Q1 clears the re-squat half (E1-E4, +74; v7 REDESIGN vs the halted v6 text: singleton record replaced by per-session bitsets, no overwrite class), Q2 clears the ticket-executor half (E5-E8, +64; v7 REDESIGN: either-magic scan replaced by entry-latched ticket close + result-consume). Each half has its own verdict line; either half can halt without sinking the other.
- Session: CONTINUE (same tree, same window; v264 verdicts filed whole 1x, ledger 708: Q1 NOT-CLEAR Luna (tuple-loss is logic change) + Q2 NOT-CLEAR Luna + Opus (scan identity + ignored return), all verified same-turn on disk; Astra + GLM clear overruled by either-seat-halt; NO build, nothing spent; packet re-cut to v7 below).
- Frontier weight (his steer 2026-09-24): Astra + Opus weighted as frontier seats - consistent with either-seat-halt; no rule change.
- Run cost of THIS relay: zero. The run it prepares costs one build + one 90-minute tester run on the same terminal, spent only on clearance plus the Luna key plus his run word.
- Why this run has novel evidence no prior run did: (a) first eviction-paired suppression take (9/1 17:35) on a set that cannot lose tuples; (b) first executed BREAK and DAY_CLOSE fills with retcodes from winning verdicts only; (c) suppression census rows with takes intact; (d) executor-ticket == entry-ticket join on every MTCLOSE. Graded bars-first lots-second.
- Disk identity: packet P-RESQUAT-1 v7 = measured this turn (twin section 2, diff 0 section 3). EA pre-build tree = 15A41634/622631/11330 (no canonical edit since the RECON59 grade). Segments on record (59 = 7A7E74C0/6618090/34993; 58 = 424A5A0C/6624800/35016; 57 = 6F242EAC/4274727/24144). Relay digest recorded in the ledger post-splice, never inside this file.
- v6-to-v7 repair map (every v264 halt/addendum item; budget RECOUNTED +138/11468, mechanical this turn: 11+15+28+20+38+0+0+9+1+1+15): Q1 tuple-set (E1 bitsets + day keys; E2 FIRE clears session set; E3 bit-test + day-mismatch physical clear; E4 guarded ARM with day-reset; Luna overwrite class structurally gone; R-c residual stays named with halt-on-valid-take-loss); Q2 ticket-latch (E8a struct field; E8b reset init; E8c post-fill latch + ENTRY_TICKET print; E5 selects by ticket only; E7 label from MtExitName = identical strings EA 265/271 + result consumed into MTCLOSE_FAIL halt row); E4 index/record-validity guard (+2, Opus B); E6 anchors fenced with function + vDAY scope, no code change (Opus halt-2 needs rows only - anchors one-hit each inside EvaluateManagedTrade); EXPIRE language now describes a real clearing line (Astra A1 + Opus B); ok=1 reworded to action=1-plus-deal-join + ok=0 halt row (Astra A3 + GLM A2); nextOpenPx cite fixed to EA 11290/11292 (Astra A7, owned); fence domains stated per row (Astra A8); packet Q-labels unified to relay Q1/Q2 (Astra A9); new-span prefix normalization, 45 lines to backtick-col-0, +0 lines (Opus whitespace, owned broader than filed); S1 barTime-equivalence (caller EA 11315-11319) + record-validity + MarkSessionUsed-path pins (Opus Q1 conditions); magic prints %I64d (nit); G3 TP-while-BREAK pre-diagnosis + E3-skip attribution + FIRE-without-take cause (Opus notes); MTCOLLISION boundary cited as the reason scans cannot work (EA 10115-10119).
- Evidence discipline: v259/v263/v264 defect rows and code regions are presence-asserted here, never re-inserted. What rides whole HERE is the packet twin (section 2, the object under clearance) plus the machine fence table (section 3) plus the decision code regions (section 4: managed-trade struct + label map, S2ResolveLive, EvaluateClosedBar signature, MTCOLLISION boundary, E8c site, E6 function proof, E7 priority chain). Priors ride labeled (file + marker + digest).
- Same text ships to every seat (Opus + GLM + Astra). No seat-only sub-questions.

## 1. Binding rules (unchanged: R-a..R-e amended, F-a ruled, F-b/F-c his call)

- R-a one-take-per-session (marks SIGNAL-only); R-b no timing rules (verdict-keyed only); R-c R floor 1.0 + replicate-all valid set (S5-refused is not a valid setup; the R-c tuple residual stays named); R-d detection walk untouched (signature AND body/shared-walk hash); R-e alert-only demo bounds with tester-closes-only. A rule contradicted must be NAMED with a stop.

## 2. Packet twin (the object under clearance; byte-verified section 3)

--- PACKET P-RESQUAT-1 v7 TWIN BEGIN ---
# PACKET_P-RESQUAT-1 v7 DRAFT - eviction-paired suppression SET + ticket-latched tester exit legs, v264-verdict redesign (nothing builds/runs/commits on this file)

Status: v7 DRAFT (redesign folding the v264 verdicts, ledger 708: Q1 HALTED by Luna (single-slot tuple-loss is logic change); Q2 HALTED by Luna + Opus (either-magic scan identity + ignored return); Astra + GLM clear. Redesign: Q1 singleton record REPLACED by a bounded per-session/day tuple set (bitsets; Luna B direction - kills the overwrite + R-c-tuple classes structurally); Q2 scan REPLACED by entry-latched ticket close (Luna/Opus B direction) + E7 result-consume + MTCLOSE_FAIL halt row; E4 index/record-validity guard (+2); E6 anchors fenced with function + scope (no code change); all Astra A-list + GLM A1/A2 + Opus B-label/B-EXPIRE/B-nits text corrections folded; new-span prefix normalization (18 lines, +0). Budget RECOUNTED +138/11468 (Q1 +74: 11+15+28+20; Q2 +64: 38+0+0+9+1+1+15), mechanical from the literals below, S3 recount governs. v6 SUPERSEDED. Label map (Astra A9): relay Q1 = packet Q1 (E1-E4 re-squat); relay Q2 = packet Q2 (E5-E8 executor); Opus-Q2/Opus-Q3 and older packet-internal Q2/Q3 tags in history lines are provenance-only. Clearance via this relay plus Luna key plus his run word, all owed).
Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (Q1: E1 +11, E2 +15, E3 +28, E4 +20 = +74; Q2: E5 +38, E6a +0, E6b +0, E7 +9, E8a +1, E8b +1, E8c +15 = +64; combined +138, post 11468 NET: new-site-total minus old-site-total per edit, S3 recount governs).
No new indicator buffers (four plain globals; 48 unchanged). No new inputs. Nothing under 02_TASK_CHECKPOINTS. Commits are builder-called (AGENTS 6.5); no council commit token exists or is asked.
Successor context: RECON59 (built tree 15A41634, graded G2-FAIL on the 9/1 re-squat miss + G4 paper-exit verdicts); this packet converts the freed slot (Q1) and executes the verdicts (Q2).

## Authority (all on record, no invention)

- His rules R-a..R-e (relay v259 section 1) + R-c RULING (S5-refused is not a valid setup) + COMBINE word (tester-closes-only). Veto-able on report.
- v260 verdicts (all filed whole 1x): Opus halt (D1/D2/D3) + Astra halt (list) + Luna thin clear + Opus conditional clear + Sonnet refusal + Kimi broke (Astra routed). HALT stood: no build, nothing spent.
- v260 halt repairs verified: D1 (E4 capture-before pasted), D2 (adopted names), D3 (single helper name), missing literals (all seven new blocks pasted below), EXPIRE (E3 gate + FIRE/EXPIRE header), double gate (filed code), detector body hash (S1 assert 5), TWIN row (relays carry it).
- Double-battery recount (this turn, mechanical from filed Opus literals 3241-3327 + 3376-3422): E2 new 19 lines (print is 3, not 4 - the +14 insert-count double-counts nothing under NET: 19-6 = +13); E3 new 19 lines (if-structure is 3 + brace; 19-3 = +16); E4 new 20 lines (20-7 = +13); Q2 = +52 CONFIRMED. E5 new site 49 lines (1 blank + 47 N2 + 1 retained header) vs old 1 = +48 NET. Q3 = 48+0+5 = +53. Combined +105, post 11435. Opus's +52/+54/+64/+65 figures reconciled: +52 agrees; the rest mixed insert-vs-net conventions; NET governs here.
- Label convention (Opus label-collision repair): edit labels E1-E7 never denote rule epics; R-d's walk is always called the detection walk in this packet; acceptance cites full names (ANCHOR_ELECT, SUPPRESSED, POIREPLACE, SIDE1C_PREEMPT, SEEDVOID).
- ADOPTIONS: Q1 cause adopted; Q2 adopt Opus-Q2 (REJECT Luna line-only + detector-touch); Q3 adopt Opus-Q3 structure with FOLD-1 (MTCLOSE throughout) + FOLD-2 (double gate). E6a/E6b scribed-with-provenance (no filed literals exist; STAGE-1/S4 gate them); E7 OLD byte-pulled EA 11294-11301, spaces, char-code verified (v6).
- v262 verdicts (all filed whole 1x): Opus HALT both + Opus Q1-CLEAR + Q2-print-HALT + Luna silence (no text); Astra silent. HALT STOOD: no build, nothing spent. Verified same-turn: E5 8v7 on filed text; vBREAK/vDAY bool decl EA 11160; g_anchorLine=-1 writers exactly {976 decl, 6274 ResetSequence->IDLE, 7787 R2->IDLE}; N2 gate filed-double; GetCorrectFillingMode defined EA 1656 + used 10215.
- v263 verdicts (all filed whole 1x, ledger 706): Q1 CLEAR 4/4 (Luna + Astra + Opus-conditional + GLM); Q2 NOT-CLEAR Astra (E7 predicate-vs-winning-verdict exclusion unproved) + Opus (MODE_EXECUTE ordinal unpinned in S1/fence) vs Luna + GLM clear - HALT stood, verified same-turn (EA 11288-11292 SL/TP-first priority vs E7 bare predicate; ordinal value 1 on disk EA 19, pin assert absent). His steer 2026-09-24: Astra + Opus weighted as frontier seats (consistent with either-seat-halt; no rule change). This v6 folds every halt item plus the text-only addenda.
- v264 verdicts (all filed whole 1x, ledger 708): Q1 NOT-CLEAR Luna (single-slot tuple-loss is logic change; GLM/Astra/Opus-conditional clear overruled) + Q2 NOT-CLEAR Luna + Opus (either-magic scan identity + ignored return; E6 anchor/scope rows missing) vs Astra + GLM clear - HALT stood on both halves, verified same-turn (overwrite mechanism; scan text; return discarded; E6 anchors one-hit each inside EvaluateManagedTrade EA 11105 with vDAY decl 11160 same body; E4 scope = EvaluateClosedBar params EA 6629; S2ResolveLive pass-through EA 3949-3956 + write EA 7739; nextOpenPx uses EA 11290/11292 not 11294; 18 new-span lines wear old-form prefix). This v7 redesigns both halves (tuple-set + ticket-latch) and folds every text correction.

## Rename table (v1/v2-drift name -> v3 filed name)

- EVICTMARK -> EVICTSUPPRESS (E4 ARM row, Opus-Q2 filed)
- RESQUAT_SUPPRESS -> RESEED_BLOCKED (E3 SKIP row, Opus-Q2 filed)
- EVICTCLEAR -> EVICTSUPPRESS_FIRE (E2 CLEAR row, Opus-Q2 filed)
- MtCloseExecute -> MtCloseBrokerPosition (E5 helper + E7 call, Opus-Q3 filed helper)
- MTEXEC prints -> MTCLOSE prints (FOLD-1; Opus prose promises MTCLOSE joins)
- Rsq* fence rows -> dropped (nothing filed under those names)
- E5 prints MTEXEC -> MTCLOSE (v3 FOLD-1; Opus prose promises MTCLOSE joins)
- E5 success print fields -> action=%d retcode=%d ref=%s (v4 Opus fix; 7/7 types match; fill evidence joins via retcode + segment deals)
- E5 time base TimeCurrent() -> barTime param (v4 Opus #6; aligns MTCLOSE rows with paper MTEXIT bar terms; signature + 3 prints + E7 call, +0 lines)
- E7 bare predicate `vBREAK || vDAY` -> exitReason-tied gate (v6 Astra repair; SL/TP-first priority EA 11288-11292 preserved; label ternary unchanged; +0 lines vs v5 E7)
- E5 comment `(E4:` -> `(entry-magic convention, EA 10170:` (v6 GLM-residual disambiguation, +0 lines)
- Singleton suppression globals -> per-session bitsets + day keys (v7 Luna Q1 redesign: g_evictSuppressLine/Dir/Sess/Day REPLACED by g_evictBitsLon/NY + g_evictDayLon/NY; bit = line*2 + dirIdx LONG=0/SHORT=1; FIRE/CLEAR/ARM/bit-test follow)
- E5 either-magic scan -> ticket-latch close (v7 Luna/Opus Q2 redesign: g_mtrade.ticket latched at fill E8c; E5 selects by ticket only; ENTRY_TICKET print names the join; MTCLOSE_FAIL names the failure halt)
- E7 ternary label -> MtExitName(exitReason) (v7 Opus/Astra B: identical strings on disk EA 265/271; desync-proof; +0 lines)

## Rule (two behaviors, one build; F-a only)

- Q1 F-a: an evicted (line, dir, session, day) may not re-seed into the same session/day slot; the suppression SET retains every evicted tuple of the session+day (bitsets, no overwrite class); FIRE on either SIGNAL path clears the session set, EXPIRE (day-key mismatch) makes the set nonblocking and clears it. Suppress the SEED; ARM/next-best/same-bar-promote rejected on rows. The R-c tuple residual is structural to tuple-scoped F-a (a later independent valid setup on an evicted tuple stays suppressed) and stays named with halt-on-valid-take-loss.
- Q2: the WINNING BREAK/DAY_CLOSE verdict (exitReason-tied E7 gate; SL/TP-first priority preserved) closes the broker position by entry-latched ticket under the double gate (tester + EXECUTE mode); live stays alerts-only; SL/TP stay broker-owned; HTF stays off; CANCEL_BIAS untouched; priority order untouched.
- Untouched: the detection walk (signature AND body/shared-walk hash unchanged post-build), R2 scope, Q2 arrival order, Task-91 removal + C4 fall-through, B3 upgrade, booking, votes, R floor, session marks, buffers, inputs. Entry-path capture-only additions (E8: struct field + reset init + post-fill latch + 1 print) change no selection, sizing, booking, or vote - exit-identity plumbing for Q2 only.

## Scope (9/1 restoration + verdict execution, adopted names)

- REQUIRED: 9/1 take 17:35 entry 1.16024 (57 shape: SL 1.15975, TP 1.16077); other takes identical bars/entries (lots re-derive downstream of executed exits, graded second); 8/28 exit 11:40 near 1.16439 (stop fill gone); 9/4 flat 23:55 near 1.16093 (target fill gone).
- 9/4-invalid still refused; MTCOLLISION 0 expected (paper REPLACED path EA 10119-10129 unchanged; any collision row halts - the ticket re-latches per fill so the executor always targets the current record); EVICTSUPPRESS count == DIV_FALLBACK S4-origin count (delimiter-anchored: EVICTSUPPRESS bar= rows only, never the FIRE rows; a guard-skipped ARM prints no row so G2 audibly mismatches, never silently counts); RESEED_BLOCKED >= 1 on 9/1 16:55-bar; EVICTSUPPRESS_FIRE <= ARM count (FIRE prints only when the session set is non-empty; equality holds for takes in armed sessions; a FIRE row without a take in an armed session/day HALTS with cause signal-consumed - MarkSessionUsed runs on every signal path incl. alert-only 10160 and no-trade 10253); ANCHOR_ELECT Monthly-VWAP at next evaluation; SUPPRESSED Yearly-POC-held rows GONE from 17:00-17:35 span; E3-gate SKIP span 17:00-17:35 attributed to the gate by name (never absorbed silently).

## Edit set (exact verbatim old/new; STAGE-1 exact-diff gated)

- E1 suppression set above EA 1803 (old 1, new 12, +11):
  old:
  `bool SessionAlreadyUsed(ENUM_SRJ_SESSION sess, datetime barTimeServer)`
  new:
`//--- [P-RESQUAT-1 F-a] eviction-paired suppression SET (fire-or-expire):`
`//--- one 30-bit set per session (bit = line*2 + dirIdx LONG=0/SHORT=1;`
`//--- POI_NLINES=15, two sessions London/NYAM); each set carries its day.`
`//--- Plain ints, never indicator buffers (48 unchanged); deliberately NOT`
`//--- in ResetSequence's clear set - records must survive the reset they ride.`
`//--- Day mismatch makes a set nonblocking and clears it (EXPIRE); a SIGNAL`
`//--- consuming the session clears its set (FIRE); a new-day ARM resets-then-sets.`
`int      g_evictBitsLon = 0;`
`int      g_evictBitsNY  = 0;`
`datetime g_evictDayLon  = 0;`
`datetime g_evictDayNY   = 0;`
`bool SessionAlreadyUsed(ENUM_SRJ_SESSION sess, datetime barTimeServer)`
- E2 FIRE in MarkSessionUsed (old EA 1813-1818 6 lines, new 21, +15):
  old:
  `void MarkSessionUsed(ENUM_SRJ_SESSION sess, datetime barTimeServer)`
  `  {`
  `   datetime today = TC_DayStart(barTimeServer);`
  `   if(sess == SESSION_LONDON) { g_sessionUsed_London = true; g_sessionUsedDay_London = today; }`
  `   if(sess == SESSION_NYAM)   { g_sessionUsed_NYAM   = true; g_sessionUsedDay_NYAM   = today; }`
  `  }`
  new:
`void MarkSessionUsed(ENUM_SRJ_SESSION sess, datetime barTimeServer)`
`  {`
`   datetime today = TC_DayStart(barTimeServer);`
`   if(sess == SESSION_LONDON) { g_sessionUsed_London = true; g_sessionUsedDay_London = today; }`
`   if(sess == SESSION_NYAM)   { g_sessionUsed_NYAM   = true; g_sessionUsedDay_NYAM   = today; }`
`   //--- [P-RESQUAT-1 F-a] FIRE: a SIGNAL has consumed this session+day, so`
`   //--- the session set clears (any line/dir - the used flag now blocks all`
`   //--- re-seeds for the session+day; breadth note GLM-A3: harmless by the flag).`
`   if(sess == SESSION_LONDON && today == g_evictDayLon && g_evictBitsLon != 0)`
`     {`
`      PrintFormat("[SRJ-EA] EVICTSUPPRESS_FIRE sess=%s day=%s action=CLEAR",`
`                  SessionName(sess), TimeToString(today, TIME_DATE));`
`      g_evictBitsLon = 0;`
`     }`
`   if(sess == SESSION_NYAM && today == g_evictDayNY && g_evictBitsNY != 0)`
`     {`
`      PrintFormat("[SRJ-EA] EVICTSUPPRESS_FIRE sess=%s day=%s action=CLEAR",`
`                  SessionName(sess), TimeToString(today, TIME_DATE));`
`      g_evictBitsNY = 0;`
`     }`
`  }`
- E3 read gate in IDLE seed (old EA 7730-7732 3 lines, new 31, +28):
  old:
  `        PoiRetestResult pr;`
  `        if(!DetectPoiRetest(barShift, pr) || !pr.found) { if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=RETEST inWin=1 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), (pr.found ? 1 : 0)); return; }`
  `        s1g_legDir = pr.isLong ? 1 : -1;   //--- [SIDE1G] (0) independent legDir capture (new local only)`
  new:
`        PoiRetestResult pr;`
`        if(!DetectPoiRetest(barShift, pr) || !pr.found) { if(InpDebugLog && TimeToString(barTime, TIME_MINUTES) == "17:00") PrintFormat("[SRJ-EA] SEEDDIAG bar=%s branch=RETEST inWin=1 sess=%s retestFound=%d", TimeToString(barTime, TIME_DATE|TIME_MINUTES), SessionName(sess), (pr.found ? 1 : 0)); return; }`
`        //--- [P-RESQUAT-1 F-a] eviction-paired read gate: a candidate identical to`
`        //--- one its own abort just evicted (same line, same dir, same session,`
`        //--- same day) may not re-seed into the slot; the slot stays free so the`
`        //--- next evaluation consumes the next bar (the 57 convergence, W6b).`
`        //--- EXPIRE: a day-mismatched set is nonblocking and cleared here;`
`        //--- no timer, no bar count (R-b).`
`        ENUM_SRJ_DIR rsq_dir = pr.isLong ? DIR_LONG : DIR_SHORT;`
`        int rsq_bit = (pr.topLine >= 0 && pr.topLine < POI_NLINES) ? pr.topLine * 2 + (pr.isLong ? 0 : 1) : -1;`
`        bool rsq_blocked = false;`
`        datetime rsq_day = TC_DayStart(barTime);`
`        if(sess == SESSION_LONDON)`
`          {`
`           if(rsq_day != g_evictDayLon) g_evictBitsLon = 0;`
`           else if(rsq_bit >= 0 && (g_evictBitsLon & (1 << rsq_bit)) != 0) rsq_blocked = true;`
`          }`
`        else if(sess == SESSION_NYAM)`
`          {`
`           if(rsq_day != g_evictDayNY) g_evictBitsNY = 0;`
`           else if(rsq_bit >= 0 && (g_evictBitsNY & (1 << rsq_bit)) != 0) rsq_blocked = true;`
`          }`
`        if(rsq_blocked)`
`          {`
`           PrintFormat("[SRJ-EA] RESEED_BLOCKED bar=%s poi=%s dir=%s sess=%s evictedDay=%s action=SKIP",`
`                       TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),`
`                       g_lineCode[pr.topLine], DirName(rsq_dir), SessionName(sess),`
`                       TimeToString(rsq_day, TIME_DATE));`
`           return;`
`          }`
`        s1g_legDir = pr.isLong ? 1 : -1;   //--- [SIDE1G] (0) independent legDir capture (new local only)`
- E4 write arm at S4 evict (old C8 EA 8802-8808 7 lines, new 27, +20):
  old:
  `         //--- [P-EVICT-1] refused S4 holders abort (squatter GC, positive test).`
  `         ENUM_SRJ_STATE prevDiv = g_state;`
  `         if(g_confirmFromState == ST_S4_ARMED)`
  `           {`
  `            GoAbort(ABORT_DIV_FALLBACK, g_state);`
  `            return;`
  `           }`
  new:
`         //--- [P-EVICT-1] refused S4 holders abort (squatter GC, positive test).`
`         ENUM_SRJ_STATE prevDiv = g_state;`
`         if(g_confirmFromState == ST_S4_ARMED)`
`           {`
`            //--- [P-RESQUAT-1 F-a] capture BEFORE GoAbort: ResetSequence wipes`
`            //--- anchor/dir/session; the suppression record must outlive the reset.`
`            int              s4e_line = g_anchorLine;`
`            ENUM_SRJ_DIR     s4e_dir  = g_dir;`
`            ENUM_SRJ_SESSION s4e_sess = g_sessionAtEntry;`
`            datetime         s4e_day  = TC_DayStart(barTime);`
`            GoAbort(ABORT_DIV_FALLBACK, g_state);`
`            //--- record-validity + index guard (Opus B/Q1-4): ARM only a live tuple;`
`            //--- a dead record skips ARM (no row) so G2 audibly mismatches, never silently counts.`
`            if(s4e_line >= 0 && s4e_line < POI_NLINES && s4e_dir != DIR_NONE && (s4e_sess == SESSION_LONDON || s4e_sess == SESSION_NYAM))`
`              {`
`               int s4e_bit = s4e_line * 2 + (s4e_dir == DIR_LONG ? 0 : 1);`
`               if(s4e_sess == SESSION_LONDON)`
`                 { if(s4e_day != g_evictDayLon) { g_evictBitsLon = 0; g_evictDayLon = s4e_day; } g_evictBitsLon |= (1 << s4e_bit); }`
`               else`
`                 { if(s4e_day != g_evictDayNY) { g_evictBitsNY = 0; g_evictDayNY = s4e_day; } g_evictBitsNY |= (1 << s4e_bit); }`
`               PrintFormat("[SRJ-EA] EVICTSUPPRESS bar=%s poi=%s dir=%s sess=%s untilDay=%s action=ARM",`
`                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),`
`                           g_lineCode[s4e_line], DirName(s4e_dir), SessionName(s4e_sess),`
`                           TimeToString(s4e_day, TIME_DATE));`
`              }`
`            return;`
`           }`
- E5 ticket-close helper above EA 11095 (old 1 header line, new site 39, +38):
  old:
  `//====================== [P-EXITMODEL] EvaluateManagedTrade ===========================`
  new:
``
`//================= [P-EXITEXEC-1] broker close for the paper-only exit legs ========`
`//--- Q2 (his COMBINE word): BREAK and DAY_CLOSE verdicts flipped paper state only`
`//--- (ALERT-ONLY preserved, never an order), so the broker position lived on`
`//--- to a distant SL/TP fill (X1: verdict 1.16439 vs stop fill 1.16510 at 17:00;`
`//--- X2: verdict 1.16093 vs target fill 1.16302 on 9/7). This helper closes the`
`//--- broker side for exactly those two legs, at the verdict bar. Identity (v7`
`//--- Luna/Opus halt repair): the entry-latched broker ticket E8 - never a`
`//--- symbol/magic scan; a zero or unselected ticket closes nothing (NOTHING path).`
`bool MtCloseBrokerPosition(const string leg, const double refPx, const datetime barTime)`
`  {`
`   ulong ticket = g_mtrade.ticket;`
`   long  pmagic = 0;`
`   if(ticket == 0 || !PositionSelectByTicket(ticket))`
`     {`
`      PrintFormat("[SRJ-EA] MTCLOSE bar=%s leg=%s ticket=%I64u ref=%s action=NOTHING-TO-CLOSE",`
`                  TimeToString(barTime, TIME_DATE|TIME_MINUTES), leg, ticket,`
`                  DoubleToString(refPx, _Digits));`
`      return false;`
`     }`
`   pmagic = PositionGetInteger(POSITION_MAGIC);`
`   if(InpMode != MODE_EXECUTE || MQLInfoInteger(MQL_TESTER) == 0)`
`     {`
`      PrintFormat("[SRJ-EA] MTCLOSE bar=%s leg=%s ticket=%I64u ref=%s action=SKIP-NO-SEND " +`
`                  "mode=%d tester=%d (live stays alerts-only)",`
`                  TimeToString(barTime, TIME_DATE|TIME_MINUTES), leg, ticket,`
`                  DoubleToString(refPx, _Digits), (int)InpMode, (int)MQLInfoInteger(MQL_TESTER));`
`      return false;`
`     }`
`   g_trade.SetExpertMagicNumber((ulong)pmagic);`
`   g_trade.SetTypeFilling(GetCorrectFillingMode(_Symbol));`
`   bool ok = g_trade.PositionClose(ticket);`
`   PrintFormat("[SRJ-EA] MTCLOSE bar=%s leg=%s ticket=%I64u magic=%I64d action=%d retcode=%d ref=%s",`
`               TimeToString(barTime, TIME_DATE|TIME_MINUTES), leg, ticket, pmagic,`
`               (int)ok, (int)g_trade.ResultRetcode(),`
`               DoubleToString(refPx, _Digits));`
`   return ok;`
`  }`
`//====================== [P-EXITMODEL] EvaluateManagedTrade ===========================`
- E6a vDAY format fragment (old 1 line, new 1, +0):
  old:
  `                   "vTP=%d vBREAK=%s vHTF=%d scope=%d "`
  new:
`                   "vTP=%d vBREAK=%s vHTF=%d vDAY=%d scope=%d "`
  (scribed from Opus prose spec; no filed literal exists; STAGE-1/S4 gate it)
- E6b vDAY argument (old 1 line, new 1, +0):
  old:
  `                   (int)vHTF, (int)MT_EXIT_SCOPE,`
  new:
`                   (int)vHTF, (int)vDAY, (int)MT_EXIT_SCOPE,`
  (scribed from Opus prose spec; no filed literal exists; STAGE-1/S4 gate it)
- E7 executor call (old 8 anchor-block, new 17, +9): inserted between the MTEXIT PrintFormat statement and `if(InpDebugLog) MtLifeEmit();` (v7: verdict gate kept; label from MtExitName = identical strings on disk EA 265/271, desync-proof per Opus/Astra B; helper result consumed into MTCLOSE_FAIL halt row per Luna Q2.2):
  old (byte-pulled EA 11294-11301, spaces only, char-code verified this turn):
  `    PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",`
  `                TimeToString(barTime, TIME_DATE|TIME_MINUTES),`
  `                MtExitName(g_mtrade.exitReason),`
  `                (vBREAK ? breakLineName : "-"),`
  `                (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),`
  `                DoubleToString(g_mtrade.entryPrice, _Digits),`
  `                DoubleToString(g_mtrade.exitPrice, _Digits));`
  `    if(InpDebugLog) MtLifeEmit();`
  new (anchor-block retained byte-identical + 8-line verdict-gated insert with result consume):
`    PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",`
`                TimeToString(barTime, TIME_DATE|TIME_MINUTES),`
`                MtExitName(g_mtrade.exitReason),`
`                (vBREAK ? breakLineName : "-"),`
`                (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),`
`                DoubleToString(g_mtrade.entryPrice, _Digits),`
`                DoubleToString(g_mtrade.exitPrice, _Digits));`
`    //--- [P-EXITEXEC-1 E7] execution legs: SL/TP broker-owned, HTF stays off,`
`    //--- CANCEL_BIAS returned above - only the WINNING BREAK/DAY_CLOSE verdict closes.`
`    //--- Price printed = nextOpenPx; paper MTEXIT/MTLIFE/EXIT rows print regardless.`
`    if(g_mtrade.exitReason == MT_EXIT_POI_BODY_BREAK || g_mtrade.exitReason == MT_EXIT_DAY_CLOSE)`
`      {`
`       bool mtexecOk = MtCloseBrokerPosition(MtExitName(g_mtrade.exitReason), nextOpenPx, barTime);`
`       if(!mtexecOk)`
`          PrintFormat("[SRJ-EA] MTCLOSE_FAIL bar=%s reason=%s ticket=%I64u", TimeToString(barTime, TIME_DATE|TIME_MINUTES), MtExitName(g_mtrade.exitReason), g_mtrade.ticket);`
`      }`
`    if(InpDebugLog) MtLifeEmit();`
- E8a ticket field in SManagedTrade (old 1, new 2, +1): the managed record carries the broker ticket from v7 on; 0 = uncaptured.
  old:
  `   double       exitPrice;`
  new:
`   double       exitPrice;`
`   ulong        ticket;          // broker position ticket latched at fill (E8c; 0 = uncaptured)`
- E8b ticket reset in MtReset (old 3, new 4, +1): every record starts ticketless; the fill path (E8c) is the sole writer.
  old:
  `   g_mtrade.exitReason        = MT_EXIT_NONE;`
  `   g_mtrade.exitBarTime       = 0;`
  `   g_mtrade.exitPrice         = 0.0;`
  new:
`   g_mtrade.exitReason        = MT_EXIT_NONE;`
`   g_mtrade.exitBarTime       = 0;`
`   g_mtrade.exitPrice         = 0.0;`
`   g_mtrade.ticket            = 0;`
- E8c ticket latch at fill (old 5 EXECUTED print lines, new 20, +15): inside `if(fill > 0.0)`, after the EXECUTED print; selects the just-opened position (symbol + entry magic + latest POSITION_TIME) and latches its ticket; prints ENTRY_TICKET for the G3 ticket join. Entry-path capture-only: no selection, sizing, booking, or vote change.
  old:
  `                PrintFormat("[SRJ-EA] EXECUTED fill=%s slPts=%.0f tpPts=%.0f R_executed=%.2f "`
  `                            "R_logged_at_signal=%.2f delta=%.2f",`
  `                            DoubleToString(fill, _Digits),`
  `                            slDistFill / _Point, tpDistFill / _Point,`
  `                            rFill, tpR, rFill - tpR);`
  new:
`                PrintFormat("[SRJ-EA] EXECUTED fill=%s slPts=%.0f tpPts=%.0f R_executed=%.2f "`
`                            "R_logged_at_signal=%.2f delta=%.2f",`
`                            DoubleToString(fill, _Digits),`
`                            slDistFill / _Point, tpDistFill / _Point,`
`                            rFill, tpR, rFill - tpR);`
`               //--- [P-RESQUAT-1 E8] latch the managed entry's broker ticket:`
`               //--- the executor (E5) closes THIS ticket only; 0 = uncaptured.`
`               ulong entryTick = 0;`
`               datetime entryTickTime = 0;`
`               for(int pi = PositionsTotal() - 1; pi >= 0; pi--)`
`                 {`
`                  ulong pt = PositionGetTicket(pi);`
`                  if(pt == 0 || !PositionSelectByTicket(pt)) continue;`
`                  if(PositionGetString(POSITION_SYMBOL) != _Symbol) continue;`
`                  if(PositionGetInteger(POSITION_MAGIC) != magic) continue;`
`                  datetime ptime = (datetime)PositionGetInteger(POSITION_TIME);`
`                  if(ptime >= entryTickTime) { entryTickTime = ptime; entryTick = pt; }`
`                 }`
`               g_mtrade.ticket = entryTick;`
`               PrintFormat("[SRJ-EA] ENTRY_TICKET bar=%s ticket=%I64u magic=%I64d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), entryTick, magic);`
- Named residuals (not built, watched): C4 transfer admission (opposite-dir latched line via POIREPLACE/SIDE1C_PREEMPT); R-c tuple residual (later independent valid setup on an evicted tuple stays suppressed by tuple-scoped F-a - watched via take-join, halt on valid-take loss). The v6 single-slot-overwrite watch is DELETED (mechanism replaced by the set; no overwrite class remains).

## Stages (T161N discipline; RECON59 precedent)

S1 Pre-hash gate: re-hash EA (must equal 15A41634798A9307D2D38EB631946F1BCCDD07171544C053F986B9416A2E7739 / 622631 B / 11330 lines or DIAGNOSED successor, never assumed) plus (1) one hit per exact edit anchor (anchors, not identifier census) plus (2) identifier availability (g_lineCode, POI_NLINES, SessionName, TC_DayStart, DirName, InpMagicBase, g_trade Buy/Sell surface, g_mtrade dir/state/active/exitReason/ticket, vBREAK, vDAY, pr.topLine, DIR_LONG, DIR_SHORT, g_dir, g_sessionAtEntry, MT_EXIT_POI_BODY_BREAK, MT_EXIT_DAY_CLOSE, g_evictBitsLon, g_evictBitsNY, g_evictDayLon, g_evictDayNY, MtExitName, POSITION_TIME (platform enum), nextOpenPx, InpMode, MODE_EXECUTE, ResultRetcode, Trade.mqh include) plus (3) char-code assert every OLD anchor plus (4) buffers: declaration VALUE 48 + binding census identical pre/post plus (5) detector signature AND body/shared-walk hash unchanged post-build (S1 pre + S3 post compare) plus (6) scope E1-E8 only (E8 entry-capture is exit-identity plumbing: struct field + reset init + post-fill latch + 1 print; no selection, sizing, booking, or vote change) + recount +137 NET plus (7) MarkSessionUsed( call count == 2 @10160/@10253 (def excluded: 3 total hits; both are signal-consume paths - 10160 alert-only no-send branch, 10253 post-send incl. no-trade - so a FIRE row without a take halts with cause signal-consumed per G2) plus (8) enum decls (ENUM_SRJ_DIR, ENUM_SRJ_SESSION, DIR_NONE, SESSION_NONE) above EA 1803 plus (9) E4 capture lines precede the GoAbort line plus (10) g_trade declared CTrade exposing PositionClose + ResultRetcode plus (11) g_anchorLine=-1 writers exactly {976 decl, 6274 ResetSequence->IDLE, 7787 R2->IDLE} with none reachable holding S5 state (C8/E3 index invariant, no code change) plus (12) E7 8-line anchor-block (EA 11294-11301 MTEXIT PrintFormat + MtLifeEmit) one-hit + char-code assert + verdict-gated insert with result-consume literal + MTCLOSE prints barTime-aligned plus (13) MODE_EXECUTE ordinal pinned 1 (ENUM_SRJ_MODE decl EA 19: MODE_ALERT_ONLY=0, MODE_EXECUTE=1; single existing comparison EA 10169; S5 sets InpMode 1, RECON59-evidenced EXECUTE path) plus (14) GoAbort no-reentry (GoAbort EA 6296-6330: LogAbort/LogState/ResetSequence only, no evaluator call; ResetSequence EA 6267-6294 state-clear only - E4 ARM writes after GoAbort cannot interleave a re-entered seed evaluation) plus (15) magic per-entry (EA 10170 computed InpMagicBase+1 London / +2 NYAM; EA 10214 SetExpertMagicNumber(magic) immediately before Buy/Sell 10220/10222, never init-only - E5 scan convention proved) plus (16) enum positions above EA 1803 (ENUM_SRJ_DIR 226 with DIR_NONE=0/DIR_LONG=1/DIR_SHORT=-1; ENUM_SRJ_SESSION 228; g_dir decl 973; g_sessionAtEntry decl 975) plus (17) index bound asserted at E4 capture on the S4-origin eviction path (0 <= s4e_line < POI_NLINES plus record-validity s4e_dir != DIR_NONE and live session; the E4 guard enforces it so a dead record skips ARM loudly) plus (18) vDAY census row + barTime-in-scope at E7 (EA 11294 barTime use in the anchor-block) plus (19) E8 anchors one-hit (struct `   double       exitPrice;` line; MtReset 3-line block EA 291-293; EXECUTED print 5 lines EA 10236-10240) + ticket=0 init asserted plus (20) E6 anchors one-hit each (E6a format line EA 11272; E6b arg line EA 11280) + enclosing function EvaluateManagedTrade (def EA 11105; no header until OnTick EA 11311) + vDAY same-body scope (decl EA 11160) plus (21) EvaluateClosedBar params (barShift, barTime) EA 6629 in scope at E3 (7730), E4 (8802), and E8c capture (10236); caller passes (1, iTime(symbol,period,1)) EA 11315-11319 so barTime == iTime(barShift) at all three sites plus (22) S2ResolveLive pass-through (EA 3949-3956 returns legDir unchanged) + write EA 7739 (g_dir = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT)) so the E4-stored convention == the E3-compared convention plus (23) new-span prefix-form assert (every new-span code line backtick-col-0; audit 0 flags; old-spans 2sp+backtick; E8 spans included) plus (24) MtExitName strings (POI_BODY_BREAK EA 265; DAY_CLOSE EA 271) identical to the replaced E7 ternary labels; MTCOLLISION declare boundary (EA 10115-10119: one paper record structural; broker side may hold >1 position across sessions - the reason ticket-latch is required, not the scan). Miss = DIAGNOSE, never assume, never revert. S2 Apply E1-E8 exact-diff bottom-up (expected post-build EA 11468 lines, net +138: +74 Q1, +64 Q2). S3 Post-hash plus budget arithmetic from literal counts. S4 Compile both targets 0 errors 0 warnings. S5 Run under RECON50_DEMO_USD (same terminal, InpMode 1, 2026-08-26 to 2026-09-10, InpDebugLog=true; InpMode 1 sent real fills through RECON59, evidencing the EXECUTE path), ceiling 90 min - ONLY on clearance relay plus Luna key plus his run word.

## Acceptance (grade segment-vs-RECON59; bars-first lots-second)

G1 Build: 0 errors 0 warnings both targets; post-hashes recorded; budget EA 11468 lines, net +138 from literals.
G2 Takes: 9/1 take 17:35 entry 1.16024 (SIGNAL/alert/MTSNAP/PRE-SEND/fill chain + ENTRY_TICKET row with nonzero ticket); other takes identical bars/entries (lots re-derived, graded second); 9/4-invalid still refused at S5; MTCOLLISION 0; EVICTSUPPRESS-bar rows == DIV_FALLBACK S4-origin count (anchored `EVICTSUPPRESS bar=`, never FIRE rows); RESEED_BLOCKED >= 1 on 9/1 16:55-bar; EVICTSUPPRESS_FIRE <= ARM count (FIRE prints only when the session set is non-empty; equality holds for takes in armed sessions; a FIRE row without a take in an armed session/day HALTS with cause signal-consumed); R-a item: post-exit same-session candidate produces SESSION_LIMIT row and never a new PRE-SEND; ANCHOR_ELECT Monthly-VWAP at next evaluation; SUPPRESSED Yearly-POC-held rows GONE from 17:00-17:35 span. Any unpredicted election delta HALTS (incl POIREPLACE/SIDE1C_PREEMPT/ANCHOR_ELECT/SUPPRESSED/SEEDVOID set-diff outside 9/1 16:55-17:35).
G3 State-identical plus 9/1 and plus executed exits: all non-exit families count-identical vs RECON59 except downstream of the 9/1 take and the two executed exits; MTCLOSE print-family joins (BREAK action=1 8/28 11:40, DAY_CLOSE action=1 9/4 23:55, each with successful execution established by retcode and the joined close deal - action=1 alone is not execution proof; zero SL/TP/HTF/CANCEL legs); every MTCLOSE ticket == an ENTRY_TICKET ticket (executor-ticket join; Luna A9); MTCLOSE_FAIL expected 0, MTCLOSE action=0 / retcode!=done expected 0, SKIP-NO-SEND expected 0 (S5 pins tester + InpMode 1), NOTHING-TO-CLOSE expected 0 (E7 fires only on a winning BREAK/DAY_CLOSE with the latched ticket selected; known reachable path pre-diagnosed: broker-owned TP can fill on a bar where vTP is false and vBREAK true, leaving the broker flat while exitReason == BREAK); any FAIL/ok=0/SKIP/NOTHING row HALTS for diagnosis; vDAY field present; alert kinds SIGNAL/EXIT/HEADS-UP/STAND-DOWN (MTCLOSE lives in the print clause, never an alert kind).
G4 Exits: 8/28 close 11:40 near 1.16439 (stop fill gone); 9/4 flat 23:55 near 1.16093 (target fill gone); other exits identical bars/reasons; DAY_CLOSE counts re-derived; spread tolerance on fills per bar-granularity standard.
L-final Graded set authoritative: G1/G2/G3/G4 above.

## Run cost and novel evidence

One build (suppression record + gate + arms + executor, STAGE-1 gated) plus one tester run, ceiling 90 minutes, same envelope as RECON59. Novel evidence vs RECON59: (a) first 9/1 take on the suppressed tree; (b) first executed BREAK + DAY_CLOSE fills with retcodes; (c) suppression census rows with takes intact. Exit figures are target figures until fills print, never realized before.

(End of file)
--- PACKET P-RESQUAT-1 v7 TWIN END ---

## 3. Machine fence (buildability proofs; every count measured on disk this turn unless marked carried)

- `bool SessionAlreadyUsed` | 1 | E1 anchor (carried: tree unchanged since v263 battery)
- `void MarkSessionUsed` | 1 | E2 anchor (carried)
- `branch=RETEST inWin=1` | 1 | E3 anchor (carried)
- `s1g_legDir = pr.isLong` | 1 | E3 retained line (carried)
- `squatter GC` | 1 | E4 anchor (carried)
- `"vTP=%d vBREAK=%s vHTF=%d scope=%d "` | 1 | E6a anchor, EA 11272, inside EvaluateManagedTrade (def 11105; next def OnTick 11311)
- `(int)vHTF, (int)MT_EXIT_SCOPE,` | 1 | E6b anchor, EA 11280, same function; vDAY (decl 11160) in scope at both
- `EXECUTED fill=` | 1 | E8c anchor, EA 10236-10240 block first line
- `   double       exitPrice;` | 1 | E8a anchor (struct field site, tree domain)
- `   g_mtrade.exitPrice         = 0.0;` | 1 | E8b anchor (MtReset block line, tree domain)
- `    PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",` block | 1 as 8-line block | E7 anchor EA 11294-11301 (tree domain; second `MTEXIT bar=` hit is the CANCEL_BIAS print EA 11148, a different statement)
- `pr.topLine` | 14 | struct field EA 1919 + uses incl E3 gate (tree domain)
- `DIR_LONG` | 144 | enum EA 226 (=1) (tree domain)
- `DIR_SHORT` | 32 | enum EA 226 (=-1) (tree domain)
- `g_dir` | 197 | decl EA 973; direction writes via S2ResolveLive EA 7739 (tree domain)
- `g_sessionAtEntry` | 18 | decl EA 975 (tree domain)
- `ENUM_SRJ_DIR` decl | EA 226 | above EA 1803 (tree domain)
- `ENUM_SRJ_SESSION` decl | EA 228 | above EA 1803 (tree domain)
- `vDAY` | 4 | decl EA 11160 (bool) + set 11266 + guard 11283 + assign 11292 (tree domain)
- `vBREAK` | 12 | decl + single set EA 11232 + uses (tree domain; "sets" fixed to singular per Opus note)
- `MODE_EXECUTE` | 2 | decl EA 19 (=1, ordinal pinned) + existing comparison EA 10169 (tree domain)
- `InpMode` | 4 | decl EA 32 (default ALERT_ONLY) + comparisons 10156/10169 (+1 comment mention) (tree domain)
- `MT_EXIT_POI_BODY_BREAK` | 3 | enum + assign EA 11290 + name map EA 265 (tree domain)
- `MT_EXIT_DAY_CLOSE` | 3 | enum + assign EA 11292 + name map EA 271 (tree domain)
- `exitReason` | 13 | field + priority chain + MTEXIT print + E7 gate (new use in packet only) (tree domain for the 13)
- `SetExpertMagicNumber` | 1 | EA 10214 per-entry (tree domain)
- `InpMagicBase` | 2 | decl EA 29 + use EA 10170 (tree domain)
- `CTrade g_trade` | 1 | E5 surface decl (carried)
- `Trade.mqh` | 2 | include + guard (carried)
- `GetCorrectFillingMode` | 2 | def EA 1656 + use EA 10215 (carried v262 verification)
- `ResultRetcode` | 1 | E5 evidence join (carried)
- `g_trade.Buy` / `g_trade.Sell` | 1 / 1 | entry path EA 10220/10222 (tree domain)
- `PositionClose` | 0 | E5-only post-build; collision-free (tree domain)
- `MTCLOSE` | 0 | E5-only post-build; collision-free (tree domain)
- `MtCloseBrokerPosition` | 0 on tree | new symbol collision-free (packet domain: rename row + E5 sig + E7 call)
- `MTEXIT bar=` | 2 | anchor-block first line (tree domain; see E7 block row)
- `POI_NLINES` | 15 | bound for the index invariant (carried)
- `MarkSessionUsed(` | 3 | 2 calls @10160/@10253 + def; both are signal-consume paths (10160 alert-only no-send branch; 10253 post-send incl. no-trade) (tree domain)
- `DetectPoiRetest` | 14 | detector untouched (carried)
- `void GoAbort` | 1 | def EA 6296 (carried)
- `void ResetSequence` | 1 | def EA 6267 (carried)
- `ENUM_SRJ_MODE` | 2 | decl EA 19 + input EA 32 (carried)
- `g_lineCode` | 40 | indexed store (carried)
- `SessionName` | 10 | helper def EA 1706 + call sites (carried)
- `TC_DayStart` | 6 | day-key helper (carried)
- `DirName` | 111 | helper def EA 1692 + call sites (carried)
- `nextOpenPx` | 17 | uses at EA 11290/11292 inside the priority chain (tree domain; cite fixed per Astra A7)
- `g_anchorLine = -1` writers | {976 decl, 6274 ResetSequence->IDLE, 7787 R2->IDLE} | spaced-form 1 (@7787); set per v262 filed verification, tree digest unchanged (carried)
- `g_evictBitsLon` / `g_evictBitsNY` / `g_evictDayLon` / `g_evictDayNY` | 0 / 0 / 0 / 0 | v7 new globals, collision-free (tree domain)
- `s4e_day` / `s4e_bit` / `rsq_bit` / `rsq_blocked` / `rsq_day` | 0 each | v7 new locals, collision-free (tree domain)
- `s4e_line` / `rsq_dir` | 0 / 0 | v7 new locals, collision-free (tree domain)
- `entryTick` / `entryTickTime` / `mtexecOk` | 0 each | v7 new locals, collision-free (tree domain)
- `.ticket` | 0 | v7 struct field + uses, collision-free (tree domain)
- `ENTRY_TICKET` / `MTCLOSE_FAIL` | 0 / 0 | v7 print names, collision-free (tree domain)
- `S2ResolveLive` def | EA 3949 | pass-through body 3949-3956 returns legDir (tree domain; section 4)
- `EvaluateClosedBar` sig | EA 6629 | params (barShift, barTime); caller passes (1, iTime(symbol,period,1)) EA 11315-11319 (tree domain)
- `EvaluateManagedTrade` def | EA 11105 | next def OnTick EA 11311; E6a/E6b/vDAY all same body (tree domain)
- MTCOLLISION boundary | EA 10115-10129 | one paper record structural; broker side may hold >1 across sessions (tree domain; section 4)
- TWIN row | diff 0 | twin span bytes == packet file bytes, 0 mismatches (post-splice proof)
- Budget row | +138 / 11468 | E1 +11, E2 +15, E3 +28, E4 +20, E5 +38, E6a +0, E6b +0, E7 +9, E8a +1, E8b +1, E8c +15 (mechanical recount this turn)

## 4. Decision code (whole contiguous regions; byte-verified section 3)

### 4a. Managed-trade struct + label map EA 239-274 (ticket field site + MtExitName strings E7 labels come from)
struct SManagedTrade
  {
   bool         active;
   int          state;             // ENUM_MT_STATE
   ENUM_SRJ_DIR dir;
   int          anchorLine;        // POI_BUF_*
   double       anchorPrice0;      // provenance only (tests use current values, 5.2)
   datetime     anchorBarTime;
   int          sessionAtEntry;    // ENUM_SRJ_SESSION as int
   double       entryPrice;        // the S5 next-open reference = the fill level
   double       slRef;             // the latched two-branch stop
   double       tpRef;             // the admission TP figure (provenance)
   int          regimeAtAdmission; // ENUM_SRJ_REGIME as int (drives the 5.6 scope)
   datetime     fillBarTime;       // the fill candle's OPEN time (the next candle)
   datetime     signalBarTime;     // the confirming candle's open time
   int          exitReason;        // ENUM_MT_EXIT
   datetime     exitBarTime;
   double       exitPrice;
  };
SManagedTrade g_mtrade;

string MtExitName(const int r)
  {
   switch(r)
     {
      case MT_EXIT_TP_TOUCH:        return "TP_TOUCH";
      case MT_EXIT_POI_BODY_BREAK:  return "POI_BODY_BREAK";
      case MT_EXIT_SL:              return "SL";
      case MT_EXIT_HTF_FLIP:        return "HTF_FLIP";
      case MT_EXIT_FILL_INVALID:    return "FILL_INVALID";
      case MT_EXIT_CANCEL_BIAS:     return "CANCEL_BIAS";
      case MT_EXIT_REPLACED:        return "REPLACED";
case MT_EXIT_DAY_CLOSE:   return "DAY_CLOSE";
     }
   return "NONE";
  }

### 4b. S2ResolveLive EA 3949-3956 (pass-through: E4-stored direction == E3-compared direction)
ENUM_SRJ_DIR S2ResolveLive(const ENUM_SRJ_DIR legDir)
  {
   //--- [C0-PROBE] null-effect pass-through: live vote DELETED; counters kept
   //--- (agree==calls by construction; SEL61LIVE agree==calls expected, print-only)
   g_s2_nLiveCalls++;
   g_s2_nLiveAgree++;
   return legDir;
  }

### 4c. EvaluateClosedBar signature EA 6629 (barShift + barTime params: E3/E4/E8c scope, caller passes (1, iTime 1))
void EvaluateClosedBar(int barShift, datetime barTime)

### 4d. MTCOLLISION boundary EA 10115-10129 (one paper record structural; broker side may hold more - the reason scans cannot work)
      //--- DECLARED BOUNDARY: one managed record (the R-201 precedent). A second
      //--- signal while one trade is managing logs MTCOLLISION and REPLACES the
      //--- record (spec section 6's blessed London+NY exception would need a
      //--- registry - a separate packet item if it ever fires).
      if(g_mtrade.active && g_mtrade.state == MT_MANAGING)
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] MTCOLLISION old bar=%s reason=REPLACED by bar=%s",
                        TimeToString(g_mtrade.fillBarTime, TIME_DATE|TIME_MINUTES),
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                     TIME_DATE|TIME_MINUTES));
         g_mtrade.state      = MT_CLOSED;
         g_mtrade.exitReason = MT_EXIT_REPLACED;
         g_mtrade.exitBarTime = iTime(_Symbol, PERIOD_CURRENT, barShift);
        }

### 4e. E8c site EA 10236-10241 (EXECUTED print anchor the latch appends to)
               PrintFormat("[SRJ-EA] EXECUTED fill=%s slPts=%.0f tpPts=%.0f R_executed=%.2f "
                           "R_logged_at_signal=%.2f delta=%.2f",
                           DoubleToString(fill, _Digits),
                           slDistFill / _Point, tpDistFill / _Point,
                           rFill, tpR, rFill - tpR);
              }

### 4f. E6 function proof (EvaluateManagedTrade def + vDAY decl + E6a line + E6b line: same body, vDAY in scope)
void EvaluateManagedTrade(const int barShift)
bool   vSL = false, vTP = false, vBREAK = false, vHTF = false, vDAY = false;
                   "vTP=%d vBREAK=%s vHTF=%d scope=%d "
                   (int)vHTF, (int)MT_EXIT_SCOPE,

### 4g. E7 priority chain EA 11283-11301 (guard-return, SL-first chain, MTEXIT print, insert point; carried whole from v264, tree unchanged)
if(!(vSL || vTP || vBREAK || vHTF || vDAY)) return;

   //--- close the trade (the priority order stated in the header)
   g_mtrade.state       = MT_CLOSED;
   g_mtrade.exitBarTime = barTime;
   if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
    else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }
   else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
   else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }
   else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;  g_mtrade.exitPrice = nextOpenPx; }

    PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",
                TimeToString(barTime, TIME_DATE|TIME_MINUTES),
                MtExitName(g_mtrade.exitReason),
                (vBREAK ? breakLineName : "-"),
                (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),
                DoubleToString(g_mtrade.entryPrice, _Digits),
                DoubleToString(g_mtrade.exitPrice, _Digits));
    if(InpDebugLog) MtLifeEmit();

Reading (the v7 change in one paragraph): the set replaces the singleton (4: no E1 old names survive; day-keyed bitsets accumulate instead of overwriting); the ticket replaces the scan (4a/4d/4e: struct field, reset init, post-fill latch; E5 selects by ticket; the MTCOLLISION boundary 4d proves a scan can meet two same-magic positions while paper holds one); the label comes from the winner enum (4a MtExitName strings identical to the old ternary); the result is consumed (E7 twin). Scope proofs ride the signatures (4c params; 4f same-body).

## 5. Questions (template v2; a NO on one never sinks the other)

Q1: Is the re-squat half (E1-E4, +74) clear to build?
Q1 answer form: Q1 CLEAR / Q1 NOT-CLEAR, with line numbers and any gate delta (text-only deltas named, no silent drift).

Q2: Is the ticket-executor half (E5-E8, +64) clear to build?
Q2 answer form: Q2 CLEAR / Q2 NOT-CLEAR, with line numbers and any gate delta.

Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Review-seat packaging: the same relay text ships, but its verdict-slot line is excused for the review seat (standing seat-split: analysis out, review-only, never keys - nothing refused because nothing unanswerable is asked).

Verification split: rule on the page only - genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.

## 6. Run cost and close

One build (E1-E8, STAGE-1 gated) plus one tester run, ceiling 90 minutes, same envelope as RECON59 (tester, InpMode 1, 2026-08-26 to 2026-09-10, debug on) - ONLY on clearance plus Luna key plus his run word. Acceptance G1-G4 in the twin; grading bars-first lots-second. Nothing builds, runs, or commits on this relay.
