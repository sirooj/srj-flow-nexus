# BUILDER RESULT — LT-7

```
BUILDER RESULT
Task:               LT-7
Status:             COMPLETED
Files read:         MQL5\Experts\SRJ_FlowNexus_EA.mq5
                    MQL5\Indicators\SRJ_FlowLogic.mq5
                    MQL5\Include\SRJ\*.mqh (14 files, searched for both identifiers)
Files written:      NONE (Form D — read-only)
Commands failed:    NONE
Splits declared:    NO
Truncations:        NONE
```

---

## HASH GATE (Item 4) — executed first

### 4.1 SRJ_FlowNexus_EA.mq5

Raw output:
```
0F1F44CB3F7D9AA183A2ECE9D3029FD2CC006D46A49F33B35AFF41EA52331322
```
Supplied stasis: `0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322`
Result: **MATCH** (case-insensitive comparison)

### 4.2 SRJ_FlowLogic.mq5

Raw output:
```
D5525014A101318A83049DE7F3AC357056ECC5B6EDD3FEDDAF41E0FAFB5664D5
```
Supplied stasis: `d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5`
Result: **MATCH** (case-insensitive comparison)

### Provenance correction (2026-09-02) — exact commands and complete raw certutil output

The original run preserved only the digest line for each file, not the complete
raw certutil output or the exact commands. The two certutil hash commands were
rerun verbatim against the canonical files, from the canonical tree root
`C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06`.
The observed digests are identical (case-insensitive) to the digests originally
recorded in sections 4.1 and 4.2 above. No source was read, edited, compiled,
or run for this correction, and no other part of this report was changed.

1. Exact certutil command used for the EA hash (run from the canonical tree root):

```
certutil -hashfile "MQL5\Experts\SRJ_FlowNexus_EA.mq5" SHA256
```

2. Complete raw certutil output for the EA:

```
SHA256 hash of MQL5\Experts\SRJ_FlowNexus_EA.mq5:
0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322
CertUtil: -hashfile command completed successfully.
```

3. Exact certutil command used for the FlowLogic hash (run from the canonical tree root):

```
certutil -hashfile "MQL5\Indicators\SRJ_FlowLogic.mq5" SHA256
```

4. Complete raw certutil output for FlowLogic:

```
SHA256 hash of MQL5\Indicators\SRJ_FlowLogic.mq5:
d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5
CertUtil: -hashfile command completed successfully.
```

5. Supplied hash and observed hash:

```
EA:
  Supplied (task item 4.1): 0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322
  Observed (certutil):      0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322
  Result: MATCH

FlowLogic:
  Supplied (task item 4.2): d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5
  Observed (certutil):      d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5
  Result: MATCH
```

Hash gate: PASSED. Proceeding.

---

## ITEM 1 — ComputeSlReference

### 1.1–1.2 Candidate search across all allowed files

| File | Line | Classification |
|------|------|----------------|
| SRJ_FlowNexus_EA.mq5 | 801 | DEFINITION |
| SRJ_FlowNexus_EA.mq5 | 1949 | call site — not a candidate header |
| SRJ_FlowNexus_EA.mq5 | 2899 | call site — not a candidate header |
| SRJ_FlowLogic.mq5 | (none) | ABSENT |
| MQL5\Include\SRJ\*.mqh | (none) | ABSENT in all 14 files |

Only one definition-header candidate found: **EA line 801**.

### 1.3 Classification

Candidate at EA line 801:
- Parameter list opens at line 801 column 24, closes at line 803.
- No ";" ending found on lines 801–803.
- Opening brace found at line 804.
- Brace counting from line 804 col 3 resolves closing brace at line 1069.
- Classification: **DEFINITION**

### 1.4 Region measurements

```
File:                          MQL5\Experts\SRJ_FlowNexus_EA.mq5
Definition-header line:        801
Parameter-list closing line:   803
Opening brace line:            804
Brace-counted closing line:    1069
Line count (header..close):    269   (1069 - 801 + 1)
Line count (open..close):      266   (1069 - 804 + 1)
Brace counting used:           YES
```

### 1.5 Parameter table

| Pos | Parameter text                        | Variable name | byref | byval |
|-----|---------------------------------------|---------------|-------|-------|
| 1   | `int barShift`                        | barShift      | N     | Y     |
| 2   | `ENUM_SRJ_DIR dir`                    | dir           | N     | Y     |
| 3   | `double &slRefOut`                    | slRefOut      | Y     | N     |
| 4   | `ENUM_SRJ_SLMODE &slModeOut`          | slModeOut     | Y     | N     |
| 5   | `const string site`                   | site          | N     | Y     |

### 1.6 Complete region paste — lines 801–1069

```
801: bool ComputeSlReference(int barShift, ENUM_SRJ_DIR dir,
802:                          double &slRefOut, ENUM_SRJ_SLMODE &slModeOut,
803:                          const string site)
804:   {
805:    static int s_swingDumps = 0;
806:    if(InpDebugLog && (s_swingDumps < 20 || site == "S5"))
807:      {
808:       s_swingDumps++;
809:       string sh = "", sl = "";
810:       for(int d = barShift; d <= barShift + 9; d++)
811:         {
812:          double vh, vl;
813:          sh += (ReadBuf1(g_hFlow, FL_BUF_SWING_HIGH, vh, d) && vh != EMPTY_VALUE && vh > 0.0)
814:                ? DoubleToString(vh, _Digits) + " " : "- ";
815:          sl += (ReadBuf1(g_hFlow, FL_BUF_SWING_LOW,  vl, d) && vl != EMPTY_VALUE && vl > 0.0)
816:                ? DoubleToString(vl, _Digits) + " " : "- ";
817:         }
818:       PrintFormat("[SRJ-EA] SWINGDUMP #%d site=%s dir=%s barShift=%d bar=%s "
819:                   "close=%s high=%s low=%s SH[%d..%d]= %s| SL[%d..%d]= %s",
820:                   s_swingDumps, site, DirName(dir), barShift,
821:                   TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
822:                   DoubleToString(iClose(_Symbol, PERIOD_CURRENT, barShift), _Digits),
823:                   DoubleToString(iHigh (_Symbol, PERIOD_CURRENT, barShift), _Digits),
824:                   DoubleToString(iLow  (_Symbol, PERIOD_CURRENT, barShift), _Digits),
825:                   barShift, barShift + 9, sh,
826:                   barShift, barShift + 9, sl);
827:      }
828: 
829:    double obValid;
830:    if(!ReadFlow(FL_BUF_LTF_OB_VALID, obValid, barShift)) return false;
831: 
832:    double swingHigh, swingLow;
833:    bool haveHigh = ReadFlow(FL_BUF_SWING_HIGH, swingHigh, barShift)
834:                    && swingHigh != EMPTY_VALUE && swingHigh > 0.0;
835:    bool haveLow  = ReadFlow(FL_BUF_SWING_LOW,  swingLow,  barShift)
836:                    && swingLow  != EMPTY_VALUE && swingLow  > 0.0;
837: 
838:    //--- TASK 21: the 1-swing branch previously required a confirmed fractal to
839:    //--- sit in the exact slot being read, which is true on roughly 18% of
840:    //--- bars. Admission therefore depended on slot occupancy rather than on
841:    //--- structure, and that is why the sole 2026.08.04 signal died as
842:    //--- S5_NO_SL_REF once Task 20 moved the read to the settled slot. The
843:    //--- point reads above are retained so the SWINGDUMP diagnostic and the
844:    //--- surrounding code are untouched; these two lines override their result
845:    //--- with the nearest confirmed swing at or before the evaluation bar.
846:    //--- This is a deliberate admission change. See Task 21's R8 exemption.
847:    int shHigh = -1, shLow = -1;
848:    haveHigh = FindNearestSwing(FL_BUF_SWING_HIGH, barShift, swingHigh, shHigh);
849:    haveLow  = FindNearestSwing(FL_BUF_SWING_LOW,  barShift, swingLow,  shLow);
850:    if(InpDebugLog)
851:       PrintFormat("[SRJ-EA] SWINGPICK site=%s dir=%s barShift=%d close=%s "
852:                   "haveHigh=%d SH=%s atShift=%d haveLow=%d SL=%s atShift=%d",
853:                   site, DirName(dir), barShift,
854:                   DoubleToString(iClose(_Symbol, PERIOD_CURRENT, barShift), _Digits),
855:                   (int)haveHigh, DoubleToString(swingHigh, _Digits), shHigh,
856:                   (int)haveLow,  DoubleToString(swingLow,  _Digits), shLow);
857: 
858:    // [Task 26a] EA-8b. Part A Step 6: "one swing away from that order block's
859:    // swing high/low" — buffer 27 is that swing bar's protective extreme, so the
860:    // stop reference now derives from the structure that defines the entry zone
861:    // instead of the nearest swing anywhere. Buffer 26 is read for comparison only.
862:    //
863:    // The side check below is a sanity guard, not a Part A rule: FlowLogic selects
864:    // the order block from g_s.currentBias, and the RR poll spans S2 through S5, so
865:    // bias can move under the candidate and hand back a swing high while dir is
866:    // LONG. It compares against iClose(barShift), which is EA-23b's known-wrong
867:    // reference — the least-bad option available until Ruling 7a lands, and it will
868:    // be revisited there. Failing the check falls back, it does not abort.
869:    double slCurPx     = iClose(_Symbol, PERIOD_CURRENT, barShift);
870:    double obStructRef = 0.0;
871:    double obSwingRef  = 0.0;
872:    bool haveObStruct = ReadFlow(FL_BUF_OB_STRUCT_EXTREME, obStructRef, barShift)
873:                        && obStructRef != EMPTY_VALUE && obStructRef > 0.0;
874:    bool haveObSwing  = ReadFlow(FL_BUF_OB_SWING_EXTREME, obSwingRef, barShift)
875:                        && obSwingRef != EMPTY_VALUE && obSwingRef > 0.0;
876:    bool obSwingSideOk = haveObSwing &&
877:                         ((dir == DIR_LONG) ? (obSwingRef < slCurPx)
878:                                            : (obSwingRef > slCurPx));
879:    if((int)MathRound(obValid) == 1)
880:      {
881:       if(dir == DIR_LONG)
882:         { if(obSwingSideOk) slRefOut = obSwingRef; else { if(!haveLow) return false; slRefOut = swingLow; } }
883:       else
884:         { if(obSwingSideOk) slRefOut = obSwingRef; else { if(!haveHigh) return false; slRefOut = swingHigh; } }
885:       slModeOut = SL_MODE_1SWING;
886:    // [Task 75 / EA-79 / Ruling 1 Option C] A fallback swing on the WRONG SIDE
887:    // of the entry reference is not a stop reference. Measured: 2026.08.13 16:40
888:    // emitted SIGNAL dir=LONG with slRef=1.15378 against close=1.15339 - the stop
889:    // sat 39 points ABOVE entry and the target 80 points above, both on the profit
890:    // side, and the RR gate passed at R=2.05 because slDist is a MathAbs. One of
891:    // six signals was not a tradeable setup.
892:    //
893:    // Mechanism: obSwingSideOk is the side test for buffer 27, and when it fails
894:    // the fallback takes the nearest confirmed swing with NO side test at all.
895:    // Price had closed below the last confirmed swing low without a new one
896:    // forming, so FindNearestSwing returned a low above the close. One instance
897:    // in 20 S5 evaluations; the other five fallbacks were side-correct.
898:    //
899:    // Threshold-free: the test is WHICH SIDE of slCurPx the reference lies on,
900:    // never how far. Part A section 7 is not engaged. The reference is slCurPx,
901:    // the same iClose(barShift) that obSwingSideOk already compares against - one
902:    // reference for both branches - and at S5 that close IS the entry (Ruling 7a).
903:    //
904:    // The walk requires BOTH the protective side AND, once a zone is adopted,
905:    // exclusion from it. Requiring both is what prevents interaction with the
906:    // Task 67 guard below: after this block slRefOut is outside the zone, so Task
907:    // 67's condition is false and it is inert. When this guard does not fire,
908:    // Task 67 behaves exactly as it does today.
909:    //
910:    // Scoped to the fallback path only (!obSwingSideOk), as Task 67 is. Aborts
911:    // only on exhaustion, per Ruling 1 Option C - a valid swing further back is
912:    // always preferred to abandoning the setup. The 500-slot bound and the
913:    // g_zoneHi/g_zoneLo inertness before arming both match Task 67 exactly.
914:    bool t75_sideOk = (dir == DIR_LONG) ? (slRefOut < slCurPx) : (slRefOut > slCurPx);
915:    if(!obSwingSideOk && !t75_sideOk)
916:      {
917:       int    t75_buf  = (dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
918:       int    t75_from = (dir == DIR_LONG) ? shLow : shHigh;
919:       double t75_was  = slRefOut;
920:       bool   t75_ok   = false;
921:       bool   t75_zone = (g_zoneHi > 0.0 && g_zoneLo > 0.0);
922:       for(int t75_s = t75_from + 1; t75_s <= t75_from + 500; t75_s++)
923:         {
924:          double t75_v;
925:          if(!ReadFlow(t75_buf, t75_v, t75_s))     break;
926:          if(t75_v == EMPTY_VALUE || t75_v <= 0.0) continue;
927:          if((dir == DIR_LONG) ? (t75_v >= slCurPx) : (t75_v <= slCurPx)) continue;
928:          if(t75_zone && t75_v >= g_zoneLo && t75_v <= g_zoneHi)          continue;
929:          slRefOut = t75_v;
930:          t75_ok   = true;
931:          if(InpDebugLog)
932:             PrintFormat("[SRJ-EA] SLSIDEGUARD site=%s dir=%s rejected=%s "
933:                         "chosen=%s atShift=%d fromShift=%d close=%s "
934:                         "zoneLo=%s zoneHi=%s",
935:                         site, DirName(dir),
936:                         DoubleToString(t75_was, _Digits),
937:                         DoubleToString(slRefOut, _Digits),
938:                         t75_s, t75_from,
939:                         DoubleToString(slCurPx, _Digits),
940:                         DoubleToString(g_zoneLo, _Digits),
941:                         DoubleToString(g_zoneHi, _Digits));
942:          break;
943:         }
944:       if(!t75_ok)
945:         {
946:          if(InpDebugLog)
947:             PrintFormat("[SRJ-EA] SLSIDEGUARD site=%s dir=%s rejected=%s "
948:                         "chosen=NONE fromShift=%d close=%s zoneLo=%s zoneHi=%s "
949:                         "result=noProtectiveSideSwing",
950:                         site, DirName(dir),
951:                         DoubleToString(t75_was, _Digits),
952:                         t75_from,
953:                         DoubleToString(slCurPx, _Digits),
954:                         DoubleToString(g_zoneLo, _Digits),
955:                         DoubleToString(g_zoneHi, _Digits));
956:          return false;
957:         }
958:      }
959: 
960:    // [Task 67 / Ruling 1 Option C / EA-71] A fallback swing lying INSIDE the
961:    // adopted entry zone is not a stop reference. Measured: bar 2026.08.20 17:35
962:    // gave slRef=1.16807 against zone 1.16804-1.16814 — a ONE POINT risk
963:    // denominator, R=110, which cleared the hard RR gate on geometry alone. Only
964:    // divLatch=0 prevented a signal on it.
965:    //
966:    // Threshold-free: the test is containment in the adopted zone, not a distance,
967:    // so Part A section 7 is not engaged. Scoped to the fallback path only
968:    // (!obSwingSideOk) — every OB_SWING reference measured to date sat well
969:    // outside its zone. The operator's ruling accepts a plain three-candle swing
970:    // as a valid stop even when it is not the structurally extreme one, so the
971:    // walk continues to the next swing OUTSIDE the zone rather than aborting.
972:    //
973:    // g_zoneHi/g_zoneLo read 0.0 until the S3 transition sets them, so this guard
974:    // is inert before arming — the same inertness Ruling 7c's in-zone target
975:    // exclusion relies on in TpTargetUpdateBest.
976:    if(!obSwingSideOk && g_zoneHi > 0.0 && g_zoneLo > 0.0 &&
977:       slRefOut >= g_zoneLo && slRefOut <= g_zoneHi)
978:      {
979:       int    t67_buf  = (dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
980:       int    t67_from = (dir == DIR_LONG) ? shLow : shHigh;
981:       double t67_was  = slRefOut;
982:       bool   t67_ok   = false;
983:       for(int t67_s = t67_from + 1; t67_s <= t67_from + 500; t67_s++)
984:         {
985:          double t67_v;
986:          if(!ReadFlow(t67_buf, t67_v, t67_s))       break;
987:          if(t67_v == EMPTY_VALUE || t67_v <= 0.0)   continue;
988:          if(t67_v >= g_zoneLo && t67_v <= g_zoneHi) continue;
989:          slRefOut = t67_v;
990:          t67_ok   = true;
991:          if(InpDebugLog)
992:             PrintFormat("[SRJ-EA] SLZONEGUARD site=%s dir=%s rejected=%s "
993:                         "chosen=%s atShift=%d fromShift=%d zoneLo=%s zoneHi=%s",
994:                         site, DirName(dir),
995:                         DoubleToString(t67_was, _Digits),
996:                         DoubleToString(slRefOut, _Digits),
997:                         t67_s, t67_from,
998:                         DoubleToString(g_zoneLo, _Digits),
999:                         DoubleToString(g_zoneHi, _Digits));
1000:          break;
1001:         }
1002:       if(!t67_ok)
1003:         {
1004:          if(InpDebugLog)
1005:             PrintFormat("[SRJ-EA] SLZONEGUARD site=%s dir=%s rejected=%s "
1006:                         "chosen=NONE fromShift=%d zoneLo=%s zoneHi=%s "
1007:                         "result=noSwingOutsideZone",
1008:                         site, DirName(dir),
1009:                         DoubleToString(t67_was, _Digits),
1010:                         t67_from,
1011:                         DoubleToString(g_zoneLo, _Digits),
1012:                         DoubleToString(g_zoneHi, _Digits));
1013:          return false;
1014:         }
1015:      }
1016:       if(InpDebugLog)
1017:          PrintFormat("[SRJ-EA] SLSRC site=%s dir=%s src=%s obStruct=%s obSwing=%s "
1018:                      "nearest=%s chosen=%s deltaPts=%s",
1019:                      site, DirName(dir),
1020:                      obSwingSideOk ? "OB_SWING"
1021:                                    : (haveObSwing ? "FALLBACK_SIDE" : "FALLBACK_EMPTY"),
1022:                      haveObStruct ? DoubleToString(obStructRef, _Digits) : "-",
1023:                      haveObSwing  ? DoubleToString(obSwingRef,  _Digits) : "-",
1024:                      (dir == DIR_LONG)
1025:                         ? (haveLow  ? DoubleToString(swingLow,  _Digits) : "-")
1026:                         : (haveHigh ? DoubleToString(swingHigh, _Digits) : "-"),
1027:                      DoubleToString(slRefOut, _Digits),
1028:                      (haveObSwing && haveObStruct)
1029:                         ? DoubleToString(MathAbs(obSwingRef - obStructRef) / _Point, 0)
1030:                         : "-");
1031:       if(InpDebugLog)
1032:          PrintFormat("[SRJ-EA] SL_REF branch=1-swing obValid=1 slRef=%s distPts=%.0f site=%s "
1033:                      "zoneLo=%s zoneHi=%s",
1034:                      DoubleToString(slRefOut, _Digits),
1035:                      MathAbs(iClose(_Symbol, PERIOD_CURRENT, barShift) - slRefOut) / _Point,
1036:                      site,
1037:                      DoubleToString(g_zoneLo, _Digits),
1038:                      DoubleToString(g_zoneHi, _Digits));
1039:       return true;
1040:      }
1041:    else
1042:      {
1043:       int bufIdx = (dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
1044:       double firstVal = 0.0;
1045:       bool   haveFirst = false;
1046:       for(int s = barShift; s <= barShift + 500; s++)
1047:         {
1048:          double v;
1049:          if(!ReadFlow(bufIdx, v, s)) break;
1050:          if(v == EMPTY_VALUE || v <= 0.0) continue;
1051:          if(!haveFirst) { firstVal = v; haveFirst = true; continue; }
1052:          if(MathAbs(v - firstVal) > _Point)
1053:            {
1054:             slRefOut = v; slModeOut = SL_MODE_2SWING;
1055:             if(InpDebugLog)
1056:                PrintFormat("[SRJ-EA] SL_REF branch=2-swing obValid=0 slRef=%s distPts=%.0f "
1057:                            "firstSwing=%s foundAtShift=%d site=%s "
1058:                            "zoneLo=%s zoneHi=%s",
1059:                            DoubleToString(slRefOut, _Digits),
1060:                            MathAbs(iClose(_Symbol, PERIOD_CURRENT, barShift) - slRefOut) / _Point,
1061:                            DoubleToString(firstVal, _Digits), s, site,
1062:                            DoubleToString(g_zoneLo, _Digits),
1063:                            DoubleToString(g_zoneHi, _Digits));
1064:             return true;
1065:            }
1066:         }
1067:       return false;
1068:      }
1069:   }
```

---

## ITEM 2 — ReadFlow

### 2.1–2.2 Candidate search across all allowed files

| File | Line | Classification |
|------|------|----------------|
| SRJ_FlowNexus_EA.mq5 | 500 | DEFINITION |
| SRJ_FlowNexus_EA.mq5 | 562–1355 etc. | call sites — not candidate headers |
| SRJ_FlowLogic.mq5 | 1088 | comment reference only — not a candidate header |
| MQL5\Include\SRJ\*.mqh | (none) | ABSENT in all 14 files |

Only one definition-header candidate found: **EA line 500**.

### 2.3 Classification

Candidate at EA line 500:
- Parameter list on line 500, closes at line 500 (single-line header).
- No ";" ending on line 500.
- Opening brace found at line 501.
- Brace counting from line 501 resolves closing brace at line 503.
- Classification: **DEFINITION**

### 2.4 Region measurements

```
File:                          MQL5\Experts\SRJ_FlowNexus_EA.mq5
Definition-header line:        500
Parameter-list closing line:   500
Opening brace line:            501
Brace-counted closing line:    503
Line count (header..close):    4   (503 - 500 + 1)
Line count (open..close):      3   (503 - 501 + 1)
Brace counting used:           YES
```

### 2.5 Parameter table

| Pos | Parameter text       | Variable name | byref | byval |
|-----|----------------------|---------------|-------|-------|
| 1   | `int bufIdx`         | bufIdx        | N     | Y     |
| 2   | `double &outVal`     | outVal        | Y     | N     |
| 3   | `int evalShift`      | evalShift     | N     | Y     |

### 2.6 Direction of parameter at position 2

Parameter position 2: `double &outVal`

Source: definition header line 500.
The `&` qualifier is present in the parameter declaration text.
**Direction: by-reference (output parameter).**

This is determined from the definition header, not from any call site.

### 2.7 Complete region paste — lines 500–503

```
500: bool ReadFlow(int bufIdx, double &outVal, int evalShift)
501:   {
502:    return ReadBuf1(g_hFlow, bufIdx, outVal, evalShift + FLOW_SHIFT_OFFSET);
503:   }
```

---

## ITEM 3 — Zone-reader line enclosure (921–1063 span)

### 3.1–3.2 All lines containing g_zoneHi or g_zoneLo in range 921–1063

Enclosing function for all lines in range: **ComputeSlReference**
Enclosing function brace-counted range: header line **801** — closing line **1069**

| Line | Type    | g_zoneHi | g_zoneLo | Brace depth at stmt | Enclosing function           |
|------|---------|----------|----------|---------------------|------------------------------|
| 921  | CODE    | YES      | YES      | 3                   | ComputeSlReference (801–1069) |
| 928  | CODE    | YES      | YES      | 4                   | ComputeSlReference (801–1069) |
| 940  | CODE    | NO       | YES      | 4                   | ComputeSlReference (801–1069) |
| 941  | CODE    | YES      | NO       | 4                   | ComputeSlReference (801–1069) |
| 954  | CODE    | NO       | YES      | 4                   | ComputeSlReference (801–1069) |
| 955  | CODE    | YES      | NO       | 4                   | ComputeSlReference (801–1069) |
| 973  | COMMENT | YES      | YES      | —                   | ComputeSlReference (801–1069) |
| 976  | CODE    | YES      | YES      | 2                   | ComputeSlReference (801–1069) |
| 977  | CODE    | NO       | YES      | 2                   | ComputeSlReference (801–1069) |
| 988  | CODE    | NO       | YES      | 4                   | ComputeSlReference (801–1069) |
| 998  | CODE    | NO       | YES      | 4                   | ComputeSlReference (801–1069) |
| 999  | CODE    | YES      | NO       | 4                   | ComputeSlReference (801–1069) |
| 1011 | CODE    | NO       | YES      | 4                   | ComputeSlReference (801–1069) |
| 1012 | CODE    | YES      | NO       | 4                   | ComputeSlReference (801–1069) |
| 1037 | CODE    | NO       | YES      | 2                   | ComputeSlReference (801–1069) |
| 1038 | CODE    | YES      | NO       | 2                   | ComputeSlReference (801–1069) |
| 1062 | CODE    | NO       | YES      | 4                   | ComputeSlReference (801–1069) |
| 1063 | CODE    | YES      | NO       | 4                   | ComputeSlReference (801–1069) |

### 3.3 Counts

```
Total occurrences in range 921–1063:  18
  Code lines (non-comment):           17
  Comment lines:                        1  (line 973)
```

### 3.4 Instrument limitation note

All 17 code lines are assignment-adjacent or conditional occurrences within a
well-bounded function. The enclosing function is computable for all 17 lines
by direct brace counting from `ComputeSlReference`'s opening brace.

The brace depth at statement entry was computed by counting braces from line
804 (opening brace of `ComputeSlReference`) to each target line. Depths range
from 2 (flat conditional guards at lines 976–977, 1037–1038) to 4 (nested
for-loop bodies).

No instrument limitation applies to any of the 17 code lines for enclosing-
function identification. The enclosing function is `ComputeSlReference` for
all 17.

---

## REQUESTED OUTPUTS SUMMARY

```
Requested outputs:
  1. ComputeSlReference — DEFINITION found in SRJ_FlowNexus_EA.mq5
     Header: line 801 | Param close: line 803 | Open brace: line 804
     Close brace: line 1069 | hdr-to-close: 269 | open-to-close: 266
     Parameters: 5 (barShift/val, dir/val, slRefOut/ref, slModeOut/ref, site/val)
     Region pasted: lines 801–1069, no ellipsis.

  2. ReadFlow — DEFINITION found in SRJ_FlowNexus_EA.mq5
     Header: line 500 | Param close: line 500 | Open brace: line 501
     Close brace: line 503 | hdr-to-close: 4 | open-to-close: 3
     Parameters: 3 (bufIdx/val, outVal/ref, evalShift/val)
     Position-2 direction: BY-REFERENCE (double &outVal)
     Region pasted: lines 500–503, no ellipsis.

  3. Zone-reader lines (921–1063):
     Total occurrences: 18 (17 code + 1 comment)
     Enclosing function for all 17 code lines: ComputeSlReference (801–1069)
     No instrument limitation applies to enclosing-function identification.
     Brace depths at statement: range 2–4 within ComputeSlReference.

  4. Hash gate:
     EA hash:       0F1F44CB...52331322 — MATCH
     FlowLogic hash: D5525014...664D5 — MATCH

Hash or compile gate:   BOTH MATCH — gate PASSED
Open questions:         NONE for the builder.
                        The following remain council/operator matters (not builder):
                        - target-zone dependency
                        - stop-zone dependency
                        - ComputeSlReference failure-cause design
                        - terminator attachment
                        - confluence constituent set
                        - session-domain agreement
                        - promotion-queue repair
                        - whether any source behavior is a defect
Next action:            PLANNER CHECK → then COUNCIL REVIEW
```

---

## PLANNER COMPLETENESS CHECK

```
PLANNER COMPLETENESS CHECK
Task:                    LT-7
Builder status received: COMPLETED
Items complete:          10 of 10 (items 1.1–1.6, 2.1–2.7, 3.1–3.4, 4.1–4.2)
Items missing:           0
Checklist failures:      NONE
  [x] Correct task ID.
  [x] Correct form (D).
  [x] Correct source path (canonical tree only).
  [x] No forbidden edit, compile, or run.
  [x] Every requested item has an answer.
  [x] Every requested region has a measured range before its paste.
  [x] Brace counting confirmed.
  [x] No old anchor used.
  [x] No ellipses in source pastes.
  [x] No source line retyped (direct extraction).
  [x] Zero results reported explicitly (ABSENT where applicable).
  [x] ABSENT and UNKNOWN not conflated.
  [x] Instrument limitations distinguished from missing source.
  [x] Parameter direction from definition, not call site.
  [x] Raw hash output present.
  [x] Both hashes compared with supplied values.
  [x] No failed commands.
  [x] No split declared.
  [x] Final status COMPLETED is justified — all items present.
Normalized result:       PASS
Correction task needed:  NO
```
