# s2build_exitmodel2.ps1 - S1 gate + S2 exact-diff build for PACKET_P-EXITMODEL-2 v12 (asserted, console proof only)
$ErrorActionPreference = 'Stop'
$eaPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$fail = 0
$enc = [Text.Encoding]::UTF8
$raw = [IO.File]::ReadAllBytes($eaPath)
$preHash = (Get-FileHash -LiteralPath $eaPath -Algorithm SHA256).Hash
Write-Output ("PRE hash=" + $preHash + " bytes=" + $raw.Length)
if ($preHash -cne 'E6E908312DAE49086032F0AFBE6F2A6755A7404DC17803A7E8E7ECA4B7688B64') { Write-Output 'S1-HASH FAIL'; exit 1 }
$txt = $enc.GetString($raw)
$rt = $enc.GetBytes($txt)
if ($rt.Length -ne $raw.Length) { Write-Output 'UTF8-ROUNDTRIP FAIL'; exit 1 }
$parts = [regex]::Split($txt, '(\r\n|\n)')
$lines = @(); $ends = @()
for ($k = 0; $k -lt $parts.Count; $k += 2) {
  $ln = $parts[$k]
  if ($k + 1 -lt $parts.Count) { $dl = $parts[$k+1] } else { $dl = '' }
  if ($k + 2 -ge $parts.Count -and $ln -eq '' -and $dl -eq '') { break }
  $lines += $ln; $ends += $dl
}
Write-Output ("LINES=" + $lines.Count)
if ($lines.Count -ne 11248) { Write-Output 'S1-COUNT FAIL'; $fail++ }
function Ceq([string]$a, [string]$b) { return $a -ceq $b }
function Hits([string]$pat) { $c = 0; foreach ($l in $lines) { if ($l -ceq $pat) { $c++ } }; return $c }
function Grep([string]$re) { $c = 0; foreach ($l in $lines) { if ($l -match $re) { $c++ } }; return $c }
function GrepC([string]$re) { $c = 0; foreach ($l in $lines) { if ($l -cmatch $re) { $c++ } }; return $c }
Write-Output ("SIG-L2275=" + $lines[2274])
if (-not $lines[2274].StartsWith('bool ComputeNearestTpTarget', [StringComparison]::Ordinal)) { Write-Output 'S1-SIG FAIL'; $fail++ }
Write-Output ("MT_HTF_EXIT-sites=" + (Grep 'MT_HTF_EXIT'))
if ((Grep 'MT_HTF_EXIT') -ne 2) { Write-Output 'S1-HTFSITES FAIL'; $fail++ }
Write-Output ("exitReason-assign-lines=" + (Grep 'exitReason\s*='))
if ((Grep 'exitReason\s*=') -ne 8) { Write-Output 'S1-CONSUMER FAIL'; $fail++ }
$vdI = @(); foreach ($l in $lines) { if ($l -match 'vDAY') { $vdI += $l } }
Write-Output ("vDAY-insensitive-lines=" + $vdI.Count)
foreach ($dl in $vdI) { Write-Output ("VDAYCTX: " + $dl.Substring(0, [Math]::Min(120, $dl.Length))) }
Write-Output ("vDAY-pre=" + (GrepC 'vDAY') + " DAY_CLOSE-pre=" + (GrepC 'MT_EXIT_DAY_CLOSE') + " dc-standalone=" + (GrepC '(?<![A-Za-z_])dc(?![A-Za-z_])'))
if ((GrepC 'vDAY') -ne 0) { Write-Output 'S1-VDAY FAIL'; $fail++ }
if ((GrepC 'MT_EXIT_DAY_CLOSE') -ne 0) { Write-Output 'S1-DAYENUM FAIL'; $fail++ }
if ((GrepC '(?<![A-Za-z_])dc(?![A-Za-z_])') -ne 0) { Write-Output 'S1-DC FAIL'; $fail++ }
Write-Output ("L2246=" + $lines[2245])
if ($lines[2245] -cne '   if(!haveBest || dist < MathAbs(best - currentPrice))') { Write-Output 'S1-L2246 FAIL'; $fail++ }
Write-Output ("L2413=" + $lines[2412])
if (-not ($lines[2412] -cmatch 'haveBest && pv == best')) { Write-Output 'S1-L2413 FAIL'; $fail++ }
Write-Output ("L11168=" + $lines[11167])
if ($lines[11167] -cne '   if(MT_HTF_EXIT && !vSL && !vTP && !vBREAK)') { Write-Output 'S1-L11168 FAIL'; $fail++ }
Write-Output ("L11184=" + $lines[11183])
if (-not ($lines[11183] -match 'MtFlipEmit')) { Write-Output 'S1-L11184 FAIL'; $fail++ }
Write-Output ("L7257=" + $lines[7256])
Write-Output ("L8758=" + $lines[8757])
if (-not ($lines[7256] -match 'ComputeNearestTpTarget')) { Write-Output 'S1-CALL1 FAIL'; $fail++ }
if (-not ($lines[8757] -match 'ComputeNearestTpTarget')) { Write-Output 'S1-CALL2 FAIL'; $fail++ }
$decl = @('double best = 0.0;', 'haveBest', 'sessbufs\[18\]', 's39_mask')
$seg = ($lines[2275..2320] -join "`n")
foreach ($d in $decl) { if (-not ($seg -match $d)) { Write-Output ('S1-DECL-' + $d + ' FAIL'); $fail++ } }
$F1old = @(
'   //--- [P-TP-FAMILYPASS V3 2026-09-17] block above RESTORED byte-identical per Astra v148 (dropped in v2 draft; print-only, log-shape unchanged).',
'   //--- [P-TP-FAMILYPASS E1 2026-09-17, V2 2026-09-17] POI-FIRST (fork-2,',
'   //--- operator ruling 2026-09-17: entry TP is the family line; realized',
'   //--- outcome is management, STEP 4; V2 restatement per v145 Luna: this is',
'   //--- the NEAREST ELIGIBLE POI incl anchor, not a family-specific mapping).',
'   //--- POI lines only, anchor ADMITTED, same tier-rank filter as the legacy',
'   //--- walk. The nearest direction-valid POI line wins outright; the',
'   //--- session/PD walk runs ONLY when NO eligible POI qualifies (fallback).',
'   //--- TpTargetUpdateBest reuse keeps the in-zone guard (Task 31) and the',
'   //--- nearest-wins reduction identical in each pass.',
'   int anchorRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX;',
'   double famBest = 0.0;',
'   bool   haveFam = false;',
'   for(int kf = 0; kf < POI_NLINES; kf++)',
'     {',
'      if((g_authorityRank[kf] / 2) > (anchorRank / 2)) continue;',
'      double vf;',
'      if(!ReadBuf1(g_hPoi, kf, vf, barShift)) continue;',
'      TpTargetUpdateBest(vf, dir, currentPrice, famBest, haveFam);',
'     }',
'   if(haveFam)',
'     {',
'      best = famBest;',
'      haveBest = true;',
'     }',
'   else',
'     {',
'      for(int i = 0; i < ArraySize(sessbufs); i++)',
'        {',
'         double v;',
'         if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask))',
'            TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);',
'        }',
'      //--- Fallback POI scan OMITTED by construction: the family pass admits a',
'      //--- strict SUPERSET (identical filter minus the anchor skip, identical',
'      //--- reduction, same bar and price) -- any line it could admit already set',
'      //--- haveFam above. Deviation from the v144 "full walk fallback" phrasing',
'      //--- declared here for council rule; behaviorally identical, proven above.',
'     }'
)
$mm = 0; for ($k = 0; $k -lt 39; $k++) { if (-not (Ceq $lines[2320+$k] $F1old[$k])) { $mm++; Write-Output ('F1OLD-MISM line=' + (2321+$k)) } }
Write-Output ("F1OLD mism=" + $mm)
if ($mm -ne 0) { Write-Output 'S1-F1OLD FAIL'; $fail++ }
$F2old = @(
'//--- section 5.6 toggle (compile-time, NOT a user input): the HTF aggregate flip',
'//--- exits trend-following trades at the flipping HTF candle''s confirmation close.',
'//--- Default ON per spec ("default, scoped to trend-following").',
'#define MT_HTF_EXIT          true'
)
$mm = 0; for ($k = 0; $k -lt 4; $k++) { if (-not (Ceq $lines[128+$k] $F2old[$k])) { $mm++ } }
Write-Output ("F2OLD mism=" + $mm)
if ($mm -ne 0) { Write-Output 'S1-F2OLD FAIL'; $fail++ }
if ((Hits '   MT_EXIT_REPLACED      = 7') -ne 1) { Write-Output 'S1-ENUMA FAIL'; $fail++ }
if ((Hits '   MT_EXIT_REPLACED      = 7,') -ne 0) { Write-Output 'S1-ENUMCOMMA FAIL'; $fail++ }
if ((Hits '      case MT_EXIT_REPLACED:        return "REPLACED";') -ne 1) { Write-Output 'S1-NAMEB FAIL'; $fail++ }
if ((Hits '   bool   vSL = false, vTP = false, vBREAK = false, vHTF = false;') -ne 1) { Write-Output 'S1-VDECL FAIL'; $fail++ }
if ((Hits '   if(!(vSL || vTP || vBREAK || vHTF)) return;') -ne 1) { Write-Output 'S1-RET FAIL'; $fail++ }
$Fret = @(
'   if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }',
'    else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }',
'   else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }',
'   else            { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }'
)
$mm = 0; for ($k = 0; $k -lt 4; $k++) { if (-not (Ceq $lines[11206+$k] $Fret[$k])) { $mm++ } }
Write-Output ("FRETMISM=" + $mm)
if ($mm -ne 0) { Write-Output 'S1-FRET FAIL'; $fail++ }
$Hdr = @(
'// when several tests fire together: SL, then TP_TOUCH, then POI_BODY_BREAK, then',
'// HTF_FLIP (the conservative stop-first standard; the census logs ALL verdicts so',
'// the operator can re-judge any instance).'
)
$mm = 0; for ($k = 0; $k -lt 3; $k++) { if (-not (Ceq $lines[11029+$k] $Hdr[$k])) { $mm++ } }
Write-Output ("HDRMISM=" + $mm)
if ($mm -ne 0) { Write-Output 'S1-HDR FAIL'; $fail++ }
Write-Output ("CTX L11187=[" + $lines[11186] + "] L11188=[" + $lines[11187] + "] L11189=[" + $lines[11188] + "]")
if (-not (Ceq $lines[11186] '     }')) { Write-Output 'S1-DCTX1 FAIL'; $fail++ }
if (-not (Ceq $lines[11187] '')) { Write-Output 'S1-DCTX2 FAIL'; $fail++ }
if (-not $lines[11188].StartsWith('    if(InpDebugLog)', [StringComparison]::Ordinal)) { Write-Output 'S1-DCTX3 FAIL'; $fail++ }
foreach ($u in @('      case MT_EXIT_REPLACED:        return "REPLACED";', '   bool   vSL = false, vTP = false, vBREAK = false, vHTF = false;', '   if(!(vSL || vTP || vBREAK || vHTF)) return;', '    else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }', '// HTF_FLIP (the conservative stop-first standard; the census logs ALL verdicts so')) { $uc = Hits $u; Write-Output ("UNIQ=" + $uc + " [" + $u.Substring(0, [Math]::Min(45, $u.Length)) + "]"); if ($uc -ne 1) { Write-Output 'S1-UNIQ FAIL'; $fail++ } }
if ($fail -ne 0) { Write-Output 'S1-GATE FAIL - WRITE NOTHING'; exit 1 }
Write-Output 'S1-GATE PASS'
$F1new = @(
'//--- [P-EXITMODEL-2 F1 2026-09-21, his nearest-booking word: the booked TP is the nearest valid target; family/category disregarded (amends the 2026-09-17 POI-FIRST fork). Single unified race: the 18 session/PD levels and the eligible POI lines compete by nearest distance through TpTargetUpdateBest. Validity kept per P15: direction and in-zone guard (Task 31) both pools; tier-rank filter POI lines only; swept/live mask (EA-26/EA-51) session/PD lines only; anchor admitted. Session fallback-only deleted; TPCENSUS names the winner unchanged. Tie-break: session pool evaluates first; exact price ties resolve to the session line (TpTargetUpdateBest strict-less-than keeps first-arrived, EA L2246); booked value unaffected, census tie-naming does NOT follow the booking order (disk-proved: census walks session-then-POI per L2391/L2402 but names LAST-equal via POI overwrite at L2413, while booking keeps FIRST-equal per L2246; exact cross-pool ties name POI in census vs session in booking - G2 grades winner==booked by VALUE, tie-name divergence recorded-not-failed). Swept/live (EA-26/EA-51) applies to session/PD candidates only (mask call sits in the session loop, never in any POI loop - unchanged from the old fork); POI candidates carry direction/in-zone/tier-rank. winner==booked proof covers non-anchor bookings via TPCENSUS; anchor-wins, if any, are proved by admission-time rows (MTSNAP/TP_ELECT), since the recompute skips anchor. BOOKCENSUS parked.]',
'int anchorRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX;',
'for(int i = 0; i < ArraySize(sessbufs); i++)',
'  {',
'   double v;',
'   if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask))',
'      TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);',
'  }',
'for(int kf = 0; kf < POI_NLINES; kf++)',
'  {',
'   if((g_authorityRank[kf] / 2) > (anchorRank / 2)) continue;',
'   double vf;',
'   if(!ReadBuf1(g_hPoi, kf, vf, barShift)) continue;',
'   TpTargetUpdateBest(vf, dir, currentPrice, best, haveBest);',
'  }'
)
if ($F1new.Count -ne 15) { Write-Output 'F1NEW-COUNT FAIL'; exit 1 }
$F2new = @(
'//--- section 5.6 toggle (compile-time, NOT a user input): the HTF aggregate flip',
'//--- exits trend-following trades at the flipping HTF candle''s confirmation close.',
'//--- EXPERIMENT 2026-09-21 (his word): no HTF-flip exit while the experiment runs; one-line re-enable (true) restores the HTF flip leg only, never the whole pre-packet behavior (F1 unified nearest booking and F3 stay installed; full-rollback gating parked). REGIME_MEANREV never reaches the leg (by the inner regime gate, spec 5.6 scope - not by the toggle itself).',
'#define MT_HTF_EXIT          false'
)
$Dblk = @(
'//--- [P-EXITMODEL-2 F3] day-close-minus-5 exit (his universal rule 2026-09-21: the first bar at/after the first 16:55-ET mark at/after the fill exits every managed trade regardless of regime). Priority below SL, TP, BREAK (and HTF when re-enabled); price nextOpenPx; F3 mark is 16:55 ET (g_news_dayMarks), distinct from the 17:00 weekFlat census (g_news_friMarks); MTEXIT/MTLIFE carry DAY_CLOSE, graded by mark join.',
'if(!vSL && !vTP && !vBREAK && !vHTF && g_news_init)',
'  {',
'   for(int dc = 0; dc < g_news_dayN; dc++)',
'     {',
'      if(g_mtrade.fillBarTime <= g_news_dayMarks[dc] && g_news_dayMarks[dc] <= barTime) { vDAY = true; break; }',
'     }',
'  }'
)
if ($Dblk.Count -ne 8) { Write-Output 'DBLK-COUNT FAIL'; exit 1 }
$Fnew = @(
'   if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }',
'    else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }',
'   else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }',
'   else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }',
'   else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;  g_mtrade.exitPrice = nextOpenPx; }'
)
$Gnew = @(
'// when several tests fire together: SL, then TP_TOUCH, then POI_BODY_BREAK, then',
'// HTF_FLIP (when re-enabled; beats DAY_CLOSE on shared bars), then DAY_CLOSE',
'// (universal scope: every managed trade) (the conservative stop-first standard; MTEXIT/MTLIFE record terminal',
'// exit reasons so the operator can re-judge any instance).'
)
$pktTxt = $enc.GetString([IO.File]::ReadAllBytes('C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-EXITMODEL-2.md'))
$fmiss = 0
foreach ($arr in @($F1new, $F2new, $Dblk, $Fnew, $Gnew)) { foreach ($sp in $arr) { $h = 0; $pp = 0; while (($pp = $pktTxt.IndexOf($sp, $pp, [StringComparison]::Ordinal)) -ge 0) { $h++; $pp += $sp.Length }; if ($h -lt 1) { Write-Output ('PKTFID-MISS len=' + $sp.Length + ' head=[' + $sp.Substring(0, [Math]::Min(60, $sp.Length)) + ']'); $fmiss++ } } }
foreach ($sp in @('MT_EXIT_DAY_CLOSE   = 8', 'case MT_EXIT_DAY_CLOSE:   return "DAY_CLOSE";', 'bool   vSL = false, vTP = false, vBREAK = false, vHTF = false, vDAY = false;', 'if(!(vSL || vTP || vBREAK || vHTF || vDAY)) return;')) { $h = 0; $pp = 0; while (($pp = $pktTxt.IndexOf($sp, $pp, [StringComparison]::Ordinal)) -ge 0) { $h++; $pp += $sp.Length }; Write-Output ("PKTFID [" + $sp.Substring(0, [Math]::Min(40, $sp.Length)) + "]=" + $h); if ($h -lt 1) { $fmiss++ } }
Write-Output ("PKTFID-MISS=" + $fmiss)
if ($fmiss -ne 0) { Write-Output 'S1-PKTFID FAIL'; $fail++ }
$nl = @(); $ne = @()
for ($k = 0; $k -lt $lines.Count; $k++) { $nl += $lines[$k]; $ne += $ends[$k] }
function RepLines($arr, $ed, [int]$from, [int]$to, $new, $dflt) {
  $o1 = @(); $o2 = @()
  for ($k = 0; $k -lt $from; $k++) { $o1 += $arr[$k]; $o2 += $ed[$k] }
  for ($k = 0; $k -lt $new.Count; $k++) { $o1 += $new[$k]; if ($k -lt ($to - $from + 1)) { $o2 += $ed[$from + $k] } else { $o2 += $dflt } }
  for ($k = $to + 1; $k -lt $arr.Count; $k++) { $o1 += $arr[$k]; $o2 += $ed[$k] }
  return @{L=$o1;E=$o2}
}
$r = RepLines $nl $ne 128 131 $F2new $ne[128]
$nl = $r.L; $ne = $r.E
$r = RepLines $nl $ne 2320 2358 $F1new $ne[2320]
$nl = $r.L; $ne = $r.E
Write-Output ("AFTER-F1F2 lines=" + $nl.Count)
$ai = -1; $ac = 0
for ($k = 0; $k -lt $nl.Count; $k++) { if ($nl[$k] -ceq '   MT_EXIT_REPLACED      = 7') { $ac++; $ai = $k } }
if ($ac -ne 1) { Write-Output 'S2-ENUMA-ANCHOR FAIL'; exit 1 }
$out2 = @(); $oe2 = @()
for ($k = 0; $k -lt $nl.Count; $k++) {
  if ($k -eq $ai) { $out2 += ($nl[$k] + ','); $oe2 += $ne[$k]; $out2 += 'MT_EXIT_DAY_CLOSE   = 8'; $oe2 += $ne[$k]; continue }
  $out2 += $nl[$k]; $oe2 += $ne[$k]
}
$nl = $out2; $ne = $oe2
function InsAfter($arr, $ed, [int]$idx, $new, $dflt) {
  $o1 = @(); $o2 = @()
  for ($k = 0; $k -le $idx; $k++) { $o1 += $arr[$k]; $o2 += $ed[$k] }
  foreach ($n in $new) { $o1 += $n; $o2 += $dflt }
  for ($k = $idx + 1; $k -lt $arr.Count; $k++) { $o1 += $arr[$k]; $o2 += $ed[$k] }
  return @{L=$o1;E=$o2}
}
$bi = -1
for ($k = 0; $k -lt $nl.Count; $k++) { if ($nl[$k] -ceq '      case MT_EXIT_REPLACED:        return "REPLACED";') { $bi = $k; break } }
if ($bi -lt 0) { Write-Output 'S2-NAME-ANCHOR FAIL'; exit 1 }
$r = InsAfter $nl $ne $bi @('case MT_EXIT_DAY_CLOSE:   return "DAY_CLOSE";') $ne[$bi]
$nl = $r.L; $ne = $r.E
$ci = -1
for ($k = 0; $k -lt $nl.Count; $k++) { if ($nl[$k] -ceq '   bool   vSL = false, vTP = false, vBREAK = false, vHTF = false;') { $ci = $k; break } }
if ($ci -lt 0) { Write-Output 'S2-VDECL-ANCHOR FAIL'; exit 1 }
$nl[$ci] = 'bool   vSL = false, vTP = false, vBREAK = false, vHTF = false, vDAY = false;'
$ei = -1
for ($k = 0; $k -lt $nl.Count; $k++) { if ($nl[$k] -ceq '   if(!(vSL || vTP || vBREAK || vHTF)) return;') { $ei = $k; break } }
if ($ei -lt 0) { Write-Output 'S2-RET-ANCHOR FAIL'; exit 1 }
$nl[$ei] = 'if(!(vSL || vTP || vBREAK || vHTF || vDAY)) return;'
$fi = -1
for ($k = 0; $k -lt $nl.Count - 3; $k++) {
  if (($nl[$k] -ceq $Fret[0]) -and ($nl[$k+1] -ceq $Fret[1]) -and ($nl[$k+2] -ceq $Fret[2]) -and ($nl[$k+3] -ceq $Fret[3])) { $fi = $k; break }
}
if ($fi -lt 0) { Write-Output 'S2-FRET-ANCHOR FAIL'; exit 1 }
$r = RepLines $nl $ne $fi ($fi+3) $Fnew $ne[$fi]
$nl = $r.L; $ne = $r.E
$gi = -1
for ($k = 0; $k -lt $nl.Count - 2; $k++) {
  if (($nl[$k] -ceq $Hdr[0]) -and ($nl[$k+1] -ceq $Hdr[1]) -and ($nl[$k+2] -ceq $Hdr[2])) { $gi = $k; break }
}
if ($gi -lt 0) { Write-Output 'S2-HDR-ANCHOR FAIL'; exit 1 }
$r = RepLines $nl $ne $gi ($gi+2) $Gnew $ne[$gi]
$nl = $r.L; $ne = $r.E
$di = -1; $dc = 0
for ($k = 0; $k -lt $nl.Count - 1; $k++) {
  if (($nl[$k] -ceq '     }') -and ($nl[$k+1] -ceq '') -and $nl[$k+2].StartsWith('    if(InpDebugLog)', [StringComparison]::Ordinal)) { $dc++; $di = $k }
}
if ($dc -ne 1) { Write-Output ('S2-DCTX-ANCHOR HITS=' + $dc + ' FAIL'); exit 1 }
$r = InsAfter $nl $ne $di $Dblk $ne[$di]
$nl = $r.L; $ne = $r.E
Write-Output ("POST lines=" + $nl.Count)
if ($nl.Count -ne 11236) { Write-Output 'S2-COUNT FAIL'; exit 1 }
if ($nl.Count -ne $ne.Count) { Write-Output 'PARITY FAIL'; exit 1 }
$sb = New-Object Text.StringBuilder
for ($k = 0; $k -lt $nl.Count; $k++) { [void]$sb.Append($nl[$k]); [void]$sb.Append($ne[$k]) }
$final = $sb.ToString()
[IO.File]::WriteAllBytes($eaPath, $enc.GetBytes($final))
$postHash = (Get-FileHash -LiteralPath $eaPath -Algorithm SHA256).Hash
$postLen = (Get-Item -LiteralPath $eaPath).Length
Write-Output ("POST hash=" + $postHash + " bytes=" + $postLen)
if ($postHash -ceq $preHash) { Write-Output 'HASH-UNCHANGED FAIL'; exit 1 }
$chk = 0
foreach ($s in @('double famBest', 'bool   haveFam', 'MT_HTF_EXIT          true', 'the census logs ALL')) { $c = 0; foreach ($l in $nl) { if ($l.Contains($s)) { $c++ } }; Write-Output ("OLD-" + $s + "=" + $c); if ($s -ceq 'the census logs ALL') { if ($c -ne 0) { $chk++ } } else { if ($c -ne 0) { $chk++ } } }
foreach ($s in @('MT_EXIT_DAY_CLOSE   = 8', 'case MT_EXIT_DAY_CLOSE:', 'vDAY = true; break;', 'beats DAY_CLOSE', 'MT_HTF_EXIT          false')) { $c = 0; foreach ($l in $nl) { if ($l.Contains($s)) { $c++ } }; Write-Output ("NEW-" + $s + "=" + $c); if ($c -lt 1) { $chk++ } }
if ($chk -ne 0) { Write-Output 'POST-STRING FAIL'; exit 1 }
Write-Output 'S2-BUILD-OK'
