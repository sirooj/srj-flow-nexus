# BUILDER SLICE B-74 - R1 raw pastes, R2 per-row table, R3 table (records only; kept EA 6CFE8F8B; diag 4C6D560E; no edit/compile/run)

## R1 INPLAY_CODE raws (kept EA 6CFE8F8B; all sites inline in EvaluateClosedBar except ZoneInPlay; line numbers real)
- COUNT: 5 test sites behind the 4 print tags (S3INPLAY, XOBINPLAY, XOBINPLAY2, INPLAYCOMMIT) + ZoneInPlay() function. Spec §9.10 says "three copies"; 5 found (any count legal).
- DIFF vs .B69DIAG: SAME at all five sites. Hunk C hunks (D4: globals 1109, IsConfirmationCandle 2420/2470, ResetSequence 6741, seed 8327, UJDEFERAPPLY 8661, call sites 9269/9290/9479) do not intersect the test bodies (8772-9191, 7008-7059); the 9269/9290/9479 call-site edits sit outside the tests. Spot-verified identical in .B69DIAG: `s31_inPlay = t133_inPlay;` (:9214), arming `if((haveFvg || haveXob) && s31_inPlay)` (:9240), `S3 waiting: no qualifying zone` print (:9290).
- COPY 1 - S3 inline legacy ladder (EA:8772-8841; print S3INPLAY EA:8847-8859):
```
8772:       bool   s31_inPlay   = false;
8773:       string s31_via      = "none";
8774:       double s31_sw1      = 0.0,  s31_sw2      = 0.0;
8775:       int    s31_sw1Shift = -1,   s31_sw2Shift = -1;
8776:       double s31_barHi    = iHigh(_Symbol, PERIOD_CURRENT, barShift);
8777:       double s31_barLo    = iLow (_Symbol, PERIOD_CURRENT, barShift);
8779:       if(s31_zHi > 0.0 && s31_zLo > 0.0)
8780:         {
8781:          if(s31_barHi >= s31_zLo && s31_barLo <= s31_zHi)
8782:            { s31_inPlay = true; s31_via = "BAR"; }
8784:          int s31_buf = (g_dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
8786:          if(FindNearestSwing(s31_buf, barShift, s31_sw1, s31_sw1Shift))
8788:            if(s31_sw1 >= s31_zLo && s31_sw1 <= s31_zHi)
8790:                { s31_inPlay = true; if(s31_via == "none") s31_via = "SWING1"; }
8794:          //--- [STEP 1 / charter ruling 3] In-play depth is the SL LEG ...
8795:          //--- (full comment EA:8794-8800: SL-LEG walk to stop ref; no-stop fallback below)
8804:          if(!s1_haveStop)
8806:             for(int s = s31_sw1Shift + 1; s <= s31_sw1Shift + 500; s++)   // two-swing bound
8816:                if(s31_sw2 > 0.0 && s31_sw2 >= s31_zLo && s31_sw2 <= s31_zHi)
8818:                   { s31_inPlay = true; if(s31_via == "none") s31_via = "SWING2"; }
8822:          else
8825:             for(int s = s31_sw1Shift + 1; s <= s31_legLimit; s++)          // SL-LEG walk to stop ref
8832:                if(s31_v2 >= s31_zLo && s31_v2 <= s31_zHi)
8834:                   { s31_inPlay = true; if(s31_via == "none") s31_via = "SWINGLEG"; }
8837:                if((g_dir == DIR_LONG) ? (s31_v2 <= s1_stopRef) : (s31_v2 >= s1_stopRef)) break;
8847:       if(InpDebugLog)
8848:          PrintFormat("[SRJ-EA] S3INPLAY bar=%s dir=%s inPlay=%d via=%s zoneLo=%s zoneHi=%s barLo=%s barHi=%s close=%s sw1=%s@%d sw2=%s@%d", ...);
```
(one line R1.2: reads eval-bar range (:8781) + nearest swing SWING1 (:8786-8792) + second swing (500-slot, :8804-8821) or SL-LEG walk to stop ref (:8825-8838). Spec beside: §3.5 "penetrated by a bar's range or by a confirmed protective-side swing at any point within the current structural leg" + "no recency requirement and no bar-count limit" (spec:131-133).)
- COPY 2 - XOBINPLAY shadow walk (EA:8889-8924; print EA:8926-8940; DIAGNOSTIC ONLY per comment EA:8861-8870, assigns nothing the cascade reads):
```
8891:          bool     t124_bounded = (t123_promoT > 0.0 && t123_promoT != EMPTY_VALUE);
8893:          int      t124_buf     = (g_dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
8903:          if(s31_zHi > 0.0 && s31_zLo > 0.0)
8905:             for(t124_s = barShift; t124_s <= barShift + 500; t124_s++)
8907:                datetime t124_bt = iTime(_Symbol, PERIOD_CURRENT, t124_s);
8909:                if(t124_bounded && t124_bt < t124_bound)            break;   // promotion-time bound
8915:                if(t124_v >= s31_zLo && t124_v <= s31_zHi) { t124_hits++; ... firstShift/firstVal ... }
8922:          t124_wide = (t124_hits > 0) || (s31_barHi >= s31_zLo && s31_barLo <= s31_zHi);
8926:          PrintFormat("[SRJ-EA] XOBINPLAY bar=%s ... promoT=%s bounded=%d scanned=%d swings=%d hits=%d firstShift=%d firstVal=%s capHit=%d ... widened=%d flip=%d", ...);
```
(one line R1.2: promoT-bounded (buffer 33) swing walk + BAR penetration; bound = promotion time, 500-slot safety. Spec beside: §3.5 + §9.9 age-no-disqualifier.)
- COPY 3 - XOBINPLAY2 uncapped oracle (EA:8977-8998; print EA:9005-9022; DIAGNOSTIC ONLY per EA:8942-8967, independent oracle for committed):
```
8975:          int      t127_limit2   = barShift + Bars(_Symbol, PERIOD_CURRENT);
8977:          if(s31_zHi > 0.0 && s31_zLo > 0.0)
8979:             for(int t127_s = barShift; t127_s <= t127_limit2; t127_s++)
8983:                if(t124_bounded && t127_bt < t124_bound) { t127_reached2 = true; break; }
8990:                if(t127_v >= s31_zLo && t127_v <= s31_zHi) { t127_hits2++; ... first ... }
8996:             t127_wide2 = (t127_hits2 > 0) || (s31_barHi >= s31_zLo && s31_barLo <= s31_zHi);
9005:          PrintFormat("[SRJ-EA] XOBINPLAY2 bar=%s ... unc_scanned=%d unc_swings=%d unc_hits=%d unc_first=%d unc_firstVal=%s unc_wide=%d reached2=%d cls1=%s cls2=%s", ...);
```
(one line R1.2: uncapped variant (Bars() limit, promoT terminator only); PRINT-ONLY. Spec beside: §9.11 (depth question open; no bar-count).)
- COPY 4 - T133 LIVE promotion-bounded test (EA:9071-9166; ADMISSION-CHANGING per EA:9025-9027; print INPLAYCOMMIT EA:9168-9189):
```
9086:       if(haveXob && !haveFvg && s31_zHi > 0.0 && s31_zLo > 0.0)
9088:          t133_applied = true;
9089:          t133_bounded = (t123_promoT > 0.0 && t123_promoT != EMPTY_VALUE);
9104:          double s3_slRef = 0.0; ... bool s3_haveStop = SlRefMemo(...);
9116:          if(s3_haveStop)
9119:             if(t133_bounded) t133_bound = (datetime)t123_promoT;
9121:             if(s31_barHi >= s31_zLo && s31_barLo <= s31_zHi) { t133_inPlay = true; t133_via = "BAR"; }
9127:             for(int t133_s = barShift; t133_s <= t133_limit; t133_s++)   // SL-LEG walk
9131:                if(!s3_haveStop && t133_bt < t133_bound)    break;        // promo bound only without stop
9153:                if(t133_v >= s31_zLo && t133_v <= s31_zHi) { t133_hits++; ...; if(t133_via == "none") t133_via = "SWING"; }
9159:                if(s3_haveStop && ((g_dir == DIR_LONG) ? (t133_v <= s3_slRef) : (t133_v >= s3_slRef))) break;
9162:             if(t133_hits > 0) t133_inPlay = true;
9165:          s31_inPlay = t133_inPlay;    // OVERWRITES legacy verdict when applied
9168:       if(InpDebugLog)
9169:          PrintFormat("[SRJ-EA] INPLAYCOMMIT bar=%s ... promoT=%s applied=%d bounded=%d scanned=%d swings=%d hits=%d firstShift=%d firstVal=%s commitVia=%s legacy=%d legacyVia=%s committed=%d changed=%d haveStop=%d", ...);
9191:       if((haveFvg || haveXob) && s31_inPlay)   // ARMING GATE: S4_ARMED + HEADS-UP + same-pass CARRY check
```
(one line R1.2: eval-bar range (:9121) + SL-leg swing walk to stop ref (:9127-9159; promoT fail-safe without stop); overwrites s31_inPlay (:9165) → GATES arming (:9191). Spec beside: XOBSUIT-1 answer 3, the SL-leg walk (finding:91-94) + §3.5.)
- COPY 5 - ZoneInPlay() function (EA:7008-7059): eval-bar range (:7015: `if(bHi >= zLo && bLo <= zHi) return true;`) + nearest swing (:7020-7021) + SL-LEG walk to stop ref (:7048-7056) or two-swing (:7037-7045); bound = stop ref / 500-slot. Feeds RQZPICK downgrade (EA:6815-6816 `xobInPlay = ZoneInPlay(...)`; downgrade EA:6822-6823) + S5 pick (EA:8752). GATES-selection (pick/downgrade path), never the S3 arming verdict. Spec beside: §3.5 (same wording as S3 ladder).
- R1.3 tags: S3-ladder GATES (arming EA:9191 as overwritten by T133); XOBINPLAY PRINT-ONLY (EA:8861-8870); XOBINPLAY2 PRINT-ONLY (EA:8942-8967 oracle); T133/INPLAYCOMMIT GATES (overwrite EA:9165 → arming EA:9191); ZoneInPlay GATES-selection (RQZPICK/S5 pick, never arming).
- R1.3 A1/F1 one-liners: A1 fired via CONFIRM_PREBIND at 10:00 (j37:15649) — the pre-bind path (:9237-9291) confirms without a qualifying zone — with inPlay=0/committed=0 at 10:00 (S3INPLAY j37:15637, INPLAYCOMMIT j37:15645). F1 fired via hunk-C CONFIRM_PREBIND at 15:30 (j40:23825; B60C RETEST cSrc j40:23822; CONFIRMPOLL confirm=0 j40:23807) with committed=0 (INPLAYCOMMIT j40:23820; hunk C touches confirmation only, in-play walks identical per DIFF SAME above).
- R1.4 "S3 waiting: no qualifying zone" condition (EA:9237-9241, else-branch of EA:9191). One-liner: a zone is "qualifying" in code iff (haveFvg||haveXob) && s31_inPlay with s31_inPlay post-T133-overwrite; otherwise the bar prints S3-waiting (no bar= field on that print) and the pre-bind confirmation path is evaluated instead.

## R2 INPLAY_ROWS per row of T (confirm/correct T; NO ROW/NOT FOUND as legal cells)
- Conventions (declared once): (c) first REACH = first bar with range overlap (SHORT: high ≥ zoneLo AND low ≤ zoneHi; LONG: low ≤ zoneHi AND high ≥ zoneLo); tag describes the extreme (ENTERS strictly inside / EQUAL-EDGE exactly on edge / OUTSIDE beyond far edge). R3.2 "entry" = ENTERS or EQUAL-EDGE overlap (matches S3's own BAR test EA:8781); OUTSIDE-throughs reported, never graded as entries. (d) = printed swing witness with in-window bar (INPLAYCOMMIT firstShift/firstVal, S3 sw1@shift); firstVal-only rows (witness bar unprinted) reported, never graded (scope 0.6 no-reconstruction). (e) window = [first (c)/(d) entry, confirm]; NO ROW without one. (f) window = promoT→confirm (obStart window reported separately). Gaps = market-closed (weekend) or unevaluated bars, never filled.
- T-vs-rows: NO differences (every id/zone/promoT/retest/confirm cell confirmed on rows cited; obStart times added from promotion-census rows).
- A1 28 Aug LDN SHORT (j37 77F454AB EA 6CFE8F8B): (a) XOB 2149 bearish (census j37:15270: obStartT 06:25 promoT 06:40), zone 1.16492-1.16507 (ZONEPICK j37:15510), retest 09:55 confirm 10:00 (A6FIRED bar=10:00 j37:15790). (b) retest 09:55: ZONEID (j37:15508) + ZONEPICK xobInPlay=0 (j37:15510) + S3 inPlay=0 (j37:15511) + commit=0 hits=0 (j37:15525); confirm 10:00: S3 inPlay=0 (j37:15637) + commit=0 hits=0 (j37:15645). (c) promoT window [06:40,10:00]: 41/41 UJBARMAP rows, FIRST=NONE; obStart window [06:25,06:40]: 06:25 EQUAL-EDGE (formation bar itself), 06:30 overshoot, 06:35 inside — all pre-promotion, excluded from grading per §3.5.1. (d) NO ROW (hits=0 everywhere checked). (e) NO ROW (no first entry). (f) met (no close beyond midline 1.164995 on 41 rows).
- A2 1 Sep NY LONG (j37): (a) XOB 2549 bullish (census obStartT 16:45 promoT 17:25), zone 1.15975-1.16013 (ZONEPICK j37:29726), retest=confirm 17:30 (register; A6FIRED bar=17:30 j37:29885). (b) 17:30: ZONEID (j37:29724) + ZONEPICK xobInPlay=1 (j37:29726) + S3 inPlay=1 via=BAR (j37:29727). (c) promoT window: FIRST 17:25 ENTERS (o=1.16064 h=1.16066 l=1.16009 c=1.16011; 2 rows); obStart window: first = 16:45 formation bar EQUAL-EDGE (9 rows). (d) NO ROW (no commit pull with hits; S3 sw1=1.16030@3 informational: above zone, no reach). (e) none (IDCHANGE/LTFFLIP empty in [17:25,17:30]). (f) met (mid 1.15994).
- A3 4 Sep NY LONG (j37): (a) XOB 2793 bullish (bounds 1.15907-1.15933 via IDCHANGE j37:37720; promoT 06:10 9/3; obStartT 05:55 9/3), retest 15:40 (SLICE_B68) confirm 15:55 (A6FIRED j37:44607). (b) retest 15:40: ZONEPICK xobInPlay=1 (j37:43827); confirm 15:55: ZONEID S4RQZ (j37:44346). (c) promoT window [9/3 06:10 → 9/4 15:55]: 406 rows, FIRST 9/4 15:30 overlap (o=1.1626 h=1.1626 l=1.15847 c=1.15945; extreme OUTSIDE-under, penetration = entry); obStart window: formation bar EQUAL-EDGE. (d) NO ROW. (e) IDCHANGE 15:35 re-pick 2973->2793 same zone (j37:43398); no LTFFLIP. (f) met (mid 1.15920).
- A4 7 Sep LDN LONG (j37): (a) XOB 3130 bullish (bounds 1.16098-1.16109 ZONEPICK j37:46927; promoT 08:55 + obStartT 08:40 census j37:46892), retest standalone NO ROW (touch at 09:15 confirm per B68 table), confirm 09:15 (A6FIRED j37:47685). (b) retest-bar NO ROW; confirm 09:15: ZONEID S4RQZ (j37:47448). (c) promoT window [08:55,09:15]: 5/5 rows, FIRST 09:00 ENTERS (o=1.16143 h=1.16143 l=1.16103 c=1.16116); obStart window: formation bar EQUAL-EDGE. (d) NO ROW. (e) none. (f) met (mid 1.161035).
- A5 7 Sep NY LONG (j37): (a) XOB 3178 bullish (bounds 1.16229-1.16253 IDCHANGE j37:49336; promoT 15:30 + obStartT 14:50 census j37:49332), retest 16:15 (SLICE_B68) confirm 16:40 (A6FIRED j37:50514). (b) retest 16:15: ZONEPICK xobInPlay=1 (j37:49440); confirm 16:40: ZONEID S4RQZ (j37:50296) + FRESHCOUNT #105 obDead=0. (c) promoT window [15:30,16:40]: 15/15 rows, FIRST 15:50 ENTERS; obStart window: formation EQUAL-EDGE. (d) NO ROW. (e) none. (f) met (mid 1.16241).
- A6 8 Sep LDN SHORT (j37): (a) XOB 2898 bearish (bounds 1.16362-1.16377 ZONEPICK j37:52091; promoT 09-03 21:35 XOBPROMO j37:52090; obStartT 20:30 census j37:39972), retest standalone NO ROW (touch at 10:05 confirm), confirm 10:05 (A6FIRED j37:52492). (b) confirm 10:05: ZONEPICK xobInPlay=1 (j37:52294) + S3 inPlay=1 via=SWINGLEG (j37:52295, sw1=1.16251@3) + commit=1 hits=1 firstVal=1.16364 firstShift=728 (j37:52303). (c) promoT window [9/3 21:35 → 9/8 10:05]: 727 printed rows (Sat-Sun 9/5-9/6 market-closed gap, NO ROW), FIRST=NONE; obStart window: formation EQUAL-EDGE. (d) firstVal 1.16364 ENTERS-by-value BUT firstShift=728 places the witness before promoT on shift arithmetic (reported, never graded per scope: position unprinted). (e) NO ROW (no in-window first entry). (f) met (mid 1.163695, 727 rows).
- A7 8 Sep NY SHORT (j37): (a) same XOB 2898 (ZONEID j37:54529, XOBPROMO same promoT j37:54530), confirm 16:55 (A6FIRED j37:54928). (b) confirm 16:55: ZONEID S4RQZ only (S3/commit rows at 16:55 NO ROW pulled); 10:05 rows as A6. (c) promoT window: 809 printed rows (same weekend gap), FIRST=NONE; obStart window: formation EQUAL-EDGE. (d) firstVal 1.16364 (j37:54546, firstShift=809, pre-promotion by same arithmetic, ungraded). (e) NO ROW. (f) met.
- B2 5 June NY LONG 16:15 (j40 1D968931 EA 4C6D560E): (a) XOB 3308 bullish (zone 159.881-159.916 ZONEPICK j40:32698-32699; promoT 15:40; obStartT 14:35 j38:38596), retest 16:00 confirm 16:10 (B60C/A6FIRED SLICE_B69 j40). (b) retest 16:00: OHLC only (UJBARMAP o=160.216 h=160.262 l=159.726 c=160.034; in-play rows NO ROW pulled); confirm 16:10: ZONEID (j40:33106) + ZONEPICK xobInPlay=0 (j40:33108) + S3 inPlay=0 (j40:33109) + commit=0 hits=0 (j40:33117). (c) promoT window [15:40,16:10]: 7/7 rows, FIRST 16:00 overlap (extreme OUTSIDE-under, penetration = entry); obStart window: formation EQUAL-EDGE. (d) NO ROW. (e) IDCHANGE 16:05 pick-up 0->3308 (j40:32909); no LTFFLIP. (f) met (mid 159.8985).
- B3 11 June NY LONG (j38 6019A461 EA 6CFE8F8B): (a) XOB 3913 bullish (zone 160.489-160.504 ZONEPICK j38:59134; promoT 08:30; obStartT 05:20 j38:56451), retest+confirm 14:35 (s86; A2RECLAIM B-68 R1). (b) 14:35: ZONEID S3PICK+S4RQZ (j38:59132/59148) + ZONEPICK xobInPlay=1 (j38:59134) + S3 inPlay=1 via=SWINGLEG (j38:59135). (c) promoT window [08:30,14:35]: 74/74 rows, FIRST 10:05 ENTERS; obStart window: formation EQUAL-EDGE. (d) NO ROW (S3 sw1=160.507@1 informational: above zone 160.489-160.504, no reach). (e) IDCHANGE 10:10 pick-up 0->3934 other zone (j38:56593), 10:45 re-pick 3934->3913 same zone (j38:56872), 12:20/13:10 re-picks (j38:58372/58419); no LTFFLIP. (f) met (mid 160.4965).
- C3 3 June LDN LONG (j38): (a) XOB 2930 bullish (zone 159.906-159.913 ZONEPICK j38:29407; promoT 09:00; obStartT 08:45 j38:29379), retest standalone NO ROW (touch at 09:05 confirm per B68 table), confirm 09:05 (A6FIRED j38 bar=09:05). (b) confirm 09:05: ZONEID S4RQZ (j38:29587) (+ZONEPICK 09:00 xobInPlay=1 pre-confirm). (c) promoT window [09:00,09:05]: 2/2 rows, FIRST 09:00 overlap (o=159.927 h=159.927 l=159.905 c=159.91; extreme 1pt OUTSIDE-under, close inside; penetration = entry); obStart window: formation EQUAL-EDGE. (d) NO ROW. (e) none. (f) met (mid 159.9095).
- K 27 May NY LONG (j38; register silent, pre-graded-window; report only): (a) XOB 2094 bullish (IDCHANGE j38:6448; ZONEID j38:6471/6493; XOBPROMO promoT 06:40 j38:6472; obStartT 06:20 j38:5760), zone 159.190-159.208, confirm 15:30 (A6FIRED j38 bar=15:30). (b) confirm 15:30: ZONEID S4RQZ only (S3 rows at 15:30 NO ROW pulled); 15:25: S3 narrow 0 + commit=1 hits=2 firstVal=159.197 (j38:6474/6489). (c) promoT window [06:40,15:30]: 107 rows, FIRST 06:40 ENTERS (o=159.221 h=159.226 l=159.204 c=159.212); obStart window: formation EQUAL-EDGE. (d) firstVal 159.197 ENTERS-by-value (bar NO ROW printed; reported ungraded). (e) IDCHANGE 07:25 pick-up, 09:45/10:25/10:35 re-picks (j38:5804/5954/6014/6032); no LTFFLIP. (f) met (mid 159.199).
- F1 2 June NY LONG 15:35 (fire j40; zone rows j38; register C): (a) XOB 2789 bullish (ZONEID j38:24559, XOBPROMO promoT 11:30 j38:24560, ZONEPICK j38:24561; obStartT 11:15 j38:21358), zone 159.679-159.694, retest 14:20 confirm 15:30 (B60C j40:23822). (b) retest 14:20: NO in-play rows (B-70); confirm 15:30 j38: S3 rows NO ROW pulled, INPLAYCOMMIT committed=0 hits=0 (j38:24570); confirm 15:30 j40: ZONEID (j40:23809) + ZONEPICK xobInPlay=0 (j40:23811) + S3 inPlay=0 (j40:23812) + commit=0 (j40:23820). (c) promoT window [11:30,15:30]: 49 rows, FIRST=NONE; obStart window [11:15,11:30]: formation EQUAL-EDGE 11:15, OUTSIDE-under 11:20, ENTERS 11:25 — all pre-promotion, excluded. (d) NO ROW. (e) NO ROW. (f) met (mid 159.6865).
- F2 27 Aug NY SHORT 17:05 (j39 408E5073 EA 4C6D560E; register C): (a) XOB 1891 bearish (obStartT 15:45 + promoT 16:00 8/26 j39:5381), zone 1.16612-1.16640 (ZONEPICK j39:11686), retest 16:25 confirm 17:00 (B60C SLICE_B69 j39). (b) retest 16:25: SLIMB refs only (in-play rows NONE); confirm 17:00: ZONEPICK xobInPlay=0 (j39:11686) + S3 inPlay=0 (j39:11687) + commit=0 hits=0 (j39:11695; j39:9992 different zone 1.16544-1.16560, not 1891). (c) promoT window [8/26 16:00 → 8/27 17:00]: 301 printed rows, FIRST=NONE; obStart window [15:45,16:00]: formation EQUAL-EDGE 15:45. (d) NO ROW. (e) NO ROW. (f) met (mid 1.16626).
- F3 4 June LDN SHORT 09:55 (j38; register C; report only): (a) XOB 3052 bearish (ZONEPICK dir=SHORT j38:35063, zone 160.001-160.012, XOBPROMO promoT 04:50 j38:35062; obStartT 01:40 j38:34691), retest 09:45 confirm 09:50. (b) retest 09:45: ZONEID S3PICK+S4RQZ (j38:35061/35082) + S3 narrow 0 (j38:35064) + commit=1 hits=2 firstVal=160.011 (j38:35078); confirm 09:50: ZONEID S4RQZ (j38:35252). (c) promoT window [04:50,09:50]: 61 rows, FIRST=NONE; obStart window [01:40,04:50]: formation EQUAL-EDGE 01:40 (39 rows). (d) firstVal 160.011 ENTERS-by-value (witness bar unprinted: firstShift=95; position unestablished on rows → ungraded). (e) NO ROW. (f) met (mid 160.0065; 61 rows, no close beyond).

## R3 PARTING (rows × R2(b)(c)(d)(f), then one-liners)
- R3.1 machine reading: DOES NOT SEPARATE. Must-keep 0-reads at confirm (A1 S3-0/commit-0 j37:15637/15645; B2 S3-0/commit-0 j40:33108/33117) match F1/F2 0-reads (F1 ZONEPICK-0/commit-0 j38:24561/24570 + j40:23811/23820; F2 ZONEPICK-0/S3-0/commit-0 j39:11686/11687/11695). 1-reads elsewhere (A2 S3-1 j37:29727; A6 S3-1/commit-1 j37:52295/52303; C3 ZONEPICK-1 j38:29407; B3 S3-1 j38:59135). Named rows above.
- R3.2 spec §3.5 as written (MET = ENTERS/EQUAL-EDGE first entry by (c), or in-window (d) witness by value+bar, since promoT, plus no (f) kill; OUTSIDE-throughs + pre-promotion witnesses reported, never graded): MET = A2, A3, A4, A5, K, C3, B3, B2. NOT MET = A1 ((c) NONE 41/41, (d) NO ROW), A6 ((c) NONE 727 rows, (d) firstVal-only pre-promotion), A7 ((c) NONE 809 rows, (d) same), F1 ((c) NONE 49 rows, (d) NO ROW), F2 ((c) NONE 301 rows, (d) NO ROW), F3 ((c) NONE 61 rows, (d) firstVal-only). Verdict: DOES NOT SEPARATE — must-keeps A1, A6, A7 NOT MET (named); B2 MET; F1/F2 NOT MET as expected for must-never-takes.
- obStart windows (reported separately; pre-promotion entries excluded from grading per §3.5.1 + T133 comment EA:9029-9034): every row opens with its formation bar EQUAL-EDGE; A1 adds 06:30 overshoot + 06:35 inside; F1 adds 11:20 under + 11:25 inside; F3's (d) witness (firstShift=95) sits pre-promotion by walk arithmetic (scanned=97 over a ~60-bar promoT window).
- R3.3 STOP-class record ("spec §3.5 vs his valid take"): A1 (41/41 intraday window, fully covered), A6 (727 printed rows; Sat-Sun 9/5-9/6 market-closed gap, NO ROW), A7 (809 rows; same gap note) are NOT MET under R3.2 although his register calls them valid takes (A1 28 Aug 10:05, A6 8 Sep 10:10, A7 8 Sep 17:00). Spec §3.5 raw: "One of: an XOB that is *relevant and in play*" (spec:126-129) + "Its zone ... has been penetrated by a bar's range or by a confirmed protective-side swing *at any point within the current structural leg*, and the XOB has not been invalidated" (spec:131) + "There is no recency requirement and no bar-count limit" (spec:133). §10 raw: "Required / must: test the condition, reject on failure - the condition is absent" (spec:368); "Permitted / not required: accept either way ... never" (spec:369); in-play is not §10-tabled (table spec:376-382 covers XOB touch, entry-inside, in-zone stop, FVG touch, relevance-before-retracement). No proposal, no chart call (scope 0.6; next relay decides).
- R3.4 F3 reported only: (a)-(d)(f) above; B-71 R4 named §3.8 as its failing step (his pane invalid + machine UNREAD); Step-4 NOT MET is extra record. Nothing decided.

(End of slice)
