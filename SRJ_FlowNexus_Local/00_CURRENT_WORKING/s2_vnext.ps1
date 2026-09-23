# S2 splice for PACKET_P-VNEXT-1 v3: 8 edit groups, exact-diff gated.
# Rule: anchors re-searched per hunk (index-shift immune). Single-hit asserts
# halt on miss. Endings preserved per line (file mixes CRLF with lone-LF lines;
# a CRLF join would silently add bytes). New lines use CRLF. Replacements keep
# the old line ending. Echoes in main flow only. ASCII only. No backticks.

$mql5 = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$eaF = $mql5 + '\Experts\SRJ_FlowNexus_EA.mq5'
$paF = $mql5 + '\Include\SRJ\SRJ_Panels.mqh'
$imF = $mql5 + '\Include\SRJ\SRJ_ImbalanceMgr.mqh'
$utf8 = New-Object System.Text.UTF8Encoding $false

function LineText($el) {
  if ($el.EndsWith("`r`n")) { return $el.Substring(0, $el.Length - 2) }
  if ($el.EndsWith("`n")) { return $el.Substring(0, $el.Length - 1) }
  return $el
}

function LineEnd($el) {
  if ($el.EndsWith("`r`n")) { return "`r`n" }
  if ($el.EndsWith("`n")) { return "`n" }
  return "`r`n"
}

function L($t) { return $t + "`r`n" }

function Load-Lines($f) {
  $t = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
  $parts = [regex]::Split($t, '(?<=\r\n|\n)')
  $out = @()
  foreach ($x in $parts) { if ($x -ne '') { $out += $x } }
  return $out
}

function Save-Lines($f, $lines) {
  [System.IO.File]::WriteAllText($f, ($lines -join ''), $utf8)
}

function Find-Idx($lines, $text) {
  $hits = @()
  for ($i = 0; $i -lt $lines.Count; $i++) { if ((LineText $lines[$i]) -ceq $text) { $hits += $i } }
  return $hits
}

function Find-Sub($lines, $sub) {
  $hits = @()
  for ($i = 0; $i -lt $lines.Count; $i++) { if ((LineText $lines[$i]).Contains($sub)) { $hits += $i } }
  return $hits
}

function Assert-Hash($f, $want) {
  $h = (Get-FileHash -LiteralPath $f -Algorithm SHA256).Hash
  if ($h -cne $want) { Write-Output ('STOP hash drift: ' + $f); exit 1 }
}

# --- EA ---
Assert-Hash $eaF '3BAC352EA89AB91572EE0C72EF9B94F5449FCC1950FC963C92DC4D63182C5750'
$ea = Load-Lines $eaF
$eaRaw0 = $ea.Count
$eaGc0 = (Get-Content -LiteralPath $eaF -Encoding UTF8).Count
if ($eaGc0 -ne 11312) { Write-Output 'STOP EA pre-count'; exit 1 }

# E1b replaces (indices stable, endings kept)
$r = @(
  @('          if(g_state == ST_S2_LTF_ALIGN && t78_opp)', '          if(t78_opp && (g_state == ST_S2_LTF_ALIGN || (g_state == ST_S1_REGIME && t78_opConf && !t78_heldConf)))'),
  @('          //--- turn). State-bounded: S2-held candidate yields to the observed', '          //--- turn). State-bounded: S2-held candidate yields to the observed; P-VNEXT-1 admits S1-held on opposite-confirm (unconfirmed held only).'),
  @('SUB:NO LogState', '          //--- NO LogState - state unchanged on either path (S2 stays S2, S1 stays S1), never ST_IDLE;')
)
foreach ($pair in $r) {
  if ($pair[0].StartsWith('SUB:')) {
    $h = Find-Sub $ea ($pair[0].Substring(4))
    if ($h.Count -ne 1) { Write-Output ('STOP E1b anchor: ' + $pair[0]); exit 1 }
    $ea[$h[0]] = $pair[1] + (LineEnd $ea[$h[0]])
    continue
  }
  $h = Find-Idx $ea $pair[0]
  if ($h.Count -ne 1) { Write-Output ('STOP E1b anchor: ' + $pair[0]); exit 1 }
  $ea[$h[0]] = $pair[1] + (LineEnd $ea[$h[0]])
}
Write-Output 'E1b 3 replaced'

# E3: comment takes old line slot, new condition after; decl pair after breakLineName
$h = Find-Idx $ea '      if(isTrigger && behind && through && !vBREAK)'
if ($h.Count -ne 1) { Write-Output 'STOP E3 gate'; exit 1 }
$e = LineEnd $ea[$h[0]]
$ea[$h[0]] = '      //--- [P-VNEXT-1 E3] B-fork gate: DAY_CLOSE-minus-5 outranks body-break on mean-reversion; break suppressed here so vDAY decides (SL/TP above untouched).' + $e
$ea = @($ea[0..$h[0]]) + @(L '      if(isTrigger && behind && through && !vBREAK && !isMeanRev)') + @($ea[($h[0]+1)..($ea.Count-1)])
$h = Find-Idx $ea '   string breakLineName = "";'
if ($h.Count -ne 1) { Write-Output 'STOP E3 decl site'; exit 1 }
$ea = @($ea[0..$h[0]]) + @((L '   //--- [P-VNEXT-1 E3] B-fork decl (his ruling 2026-09-22): mean-reversion flag for the break gate below.'), (L '   bool isMeanRev = (g_mtrade.regimeAtAdmission == REGIME_MEANREV);')) + @($ea[($h[0]+1)..($ea.Count-1)])
Write-Output 'E3 gate replaced, decl inserted'

# E4c: comment + if + cond before old block, skip old 3 lines
$h = Find-Idx $ea '      if(g_freshVetoBar != 0'
$h = @($h | Where-Object { (LineText $ea[$_ + 1]) -ceq '         && g_freshVetoDir == (int)g_dir' -and (LineText $ea[$_ + 2]) -ceq '         && g_freshVetoAnchor == g_anchorLine)' })
if ($h.Count -ne 1) { Write-Output 'STOP E4c anchor'; exit 1 }
$i = $h[0]
$ea = @($ea[0..($i-1)]) + @((L '       //--- [P-VNEXT-1 E4] fire re-key (same dir-key rule as the clears above): anchor-identity no longer gates the refusal.'), (L '      if(g_freshVetoBar != 0'), (L '         && g_freshVetoDir == (int)g_dir)')) + @($ea[($i+3)..($ea.Count-1)])
Write-Output 'E4c applied'

# E4a: comment before old L9942; replace cond/print/stale
$h = Find-Idx $ea '      if(g_freshVetoBar != 0'
$h = @($h | Where-Object { (LineText $ea[$_ + 1]) -ceq '         && (g_freshVetoDir != (int)g_dir || g_freshVetoAnchor != g_anchorLine))' })
if ($h.Count -ne 1) { Write-Output 'STOP E4a anchor'; exit 1 }
$i = $h[0]
$ea = @($ea[0..($i-1)]) + @(L '       //--- [P-VNEXT-1 E4] veto is dir-keyed, not anchor-keyed: same-direction re-seed on a new anchor is the same setup re-dressed; only direction change clears here (DAY clear and consume-on-fire kept).') + @($ea[$i..($ea.Count-1)])
$h = Find-Idx $ea '         && (g_freshVetoDir != (int)g_dir || g_freshVetoAnchor != g_anchorLine))'
if ($h.Count -ne 1) { Write-Output 'STOP E4a cond'; exit 1 }
$ea[$h[0]] = '         && (g_freshVetoDir != (int)g_dir))' + (LineEnd $ea[$h[0]])
$h = Find-Idx $ea '            PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=BOUND",'
if ($h.Count -ne 1) { Write-Output 'STOP E4a print'; exit 1 }
$ea[$h[0]] = '            PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=DIR",' + (LineEnd $ea[$h[0]])
$h = Find-Idx $ea '      //--- for this anchor+direction refuses ONE latch (his ruled decline'
if ($h.Count -ne 1) { Write-Output 'STOP E4a stale'; exit 1 }
$ea[$h[0]] = '      //--- for this direction refuses ONE latch (his ruled decline' + (LineEnd $ea[$h[0]])
Write-Output 'E4a applied'

# E4b: comment before L7240; delete L7242; replace L7245 + L7250 term
$h = Find-Idx $ea '      if(g_state == ST_S4_ARMED && g_freshVetoBar != 0)'
if ($h.Count -ne 1) { Write-Output 'STOP E4b anchor'; exit 1 }
$i = $h[0]
$ea = @($ea[0..($i-1)]) + @(L '      //--- [P-VNEXT-1 E4] S4 site mirrors the latch site: DAY-only clear (BOUND removed, same veto-persistence rule; supersedes the L7237 BOUND/DAY note).') + @($ea[$i..($ea.Count-1)])
$h = Find-Idx $ea '         bool sameSetup = (g_freshVetoDir == (int)g_dir && g_freshVetoAnchor == g_anchorLine);'
if ($h.Count -ne 1) { Write-Output 'STOP E4b decl'; exit 1 }
$ea = @($ea[0..($h[0]-1)]) + @($ea[($h[0]+1)..($ea.Count-1)])
$h = Find-Idx $ea '         if(!sameSetup || vday != cday)'
if ($h.Count -ne 1) { Write-Output 'STOP E4b cond'; exit 1 }
$ea[$h[0]] = '         if(vday != cday)' + (LineEnd $ea[$h[0]])
$h = Find-Idx $ea '                           DirName(g_dir), (!sameSetup ? "BOUND" : "DAY"));'
if ($h.Count -ne 1) { Write-Output 'STOP E4b print'; exit 1 }
$ea[$h[0]] = '                           DirName(g_dir), "DAY"));' + (LineEnd $ea[$h[0]])
Write-Output 'E4b applied'

# E1a: 8-line block before widened L7533 (re-search post-edit text)
$h = Find-Idx $ea '          if(t78_opp && (g_state == ST_S2_LTF_ALIGN || (g_state == ST_S1_REGIME && t78_opConf && !t78_heldConf)))'
if ($h.Count -ne 1) { Write-Output 'STOP E1a site'; exit 1 }
$i = $h[0]
$blk = @(
(L '          //--- [P-VNEXT-1 E1] confirmed-opposite displaces unconfirmed-held (his setup-definition 2026-09-22): opposite booked retest with confirm=1 takes the anchor when the held candidate confirms 0. S1-gated: the N1-instrumented predicate runs only where consumed. Declarations hoisted one level so the widened transfer condition below can read them (block scope).'),
(L '          bool t78_opConf = false, t78_heldConf = false;'),
(L '          if(g_state == ST_S1_REGIME && t78_opp)'),
(L '            {'),
(L '             string t78_failOp = "", t78_failHeld = "";'),
(L '             t78_opConf = IsConfirmationCandle(barShift, t78_pr.topLine, t78_dir, t78_failOp);'),
(L '             t78_heldConf = IsConfirmationCandle(barShift, g_anchorLine, g_dir, t78_failHeld);'),
(L '            }')
)
$ea = @($ea[0..($i-1)]) + $blk + @($ea[$i..($ea.Count-1)])
Write-Output 'E1a applied'
if ($ea.Count -ne ($eaRaw0 + 12)) { Write-Output 'STOP EA raw delta'; exit 1 }
Save-Lines $eaF $ea
$eaGc = (Get-Content -LiteralPath $eaF -Encoding UTF8).Count
if ($eaGc -ne 11324) { Write-Output 'STOP EA post-count'; exit 1 }
Write-Output ('EA raw=' + $ea.Count + ' gc=' + $eaGc)

# --- Panels E2a: 17 lines between L236 and L237 (staircase located) ---
Assert-Hash $paF '199AD6B104CCE28A30AA610A632C1FFFA42F1D529280E24C33519B81C700C736'
$pa = Load-Lines $paF
$hits = @()
for ($i = 0; $i -lt $pa.Count - 3; $i++) {
  if ((LineText $pa[$i]) -ceq '              }' -and (LineText $pa[$i+1]) -ceq '           }' -and (LineText $pa[$i+2]) -ceq '        }' -and (LineText $pa[$i+3]) -ceq '     }') { $hits += $i }
}
if ($hits.Count -ne 1) { Write-Output 'STOP E2a staircase unique'; exit 1 }
$idx = $hits[0]
$blk = @(
(L '      //--- [P-VNEXT-1 E2] structure fallback (his blank-FVG ruling 2026-09-22): boundary-gated search empty is not evidence; search the live structure before printing blank.'),
(L '      if(g_s.isDoubleOB && !fvgExistsForDisplay && !fvgExistsNow && !g_s.isInitialFlipBar && !SrjIsNa(g_s.currentStructureStartBar) && g_imbalances.Total() > 0)'),
(L '        {'),
(L '         int n2 = g_imbalances.Total();'),
(L '         for(int k2=0; k2<n2; k2++)'),
(L '           {'),
(L '            CImbalance *fvg2 = GetFVG(g_imbalances,k2);'),
(L '            if(fvg2==NULL) continue;'),
(L '            bool m2 = (g_s.currentBias=="bullish" && fvg2.isBullish) || (g_s.currentBias=="bearish" && !fvg2.isBullish);'),
(L '            if(m2 && fvg2.detectionBar >= g_s.currentStructureStartBar && fvg2.detectionBar >= g_s.strictLimitBar)'),
(L '              {'),
(L '               fvgExistsForDisplay = true;'),
(L '               if(!fvg2.isFilled) fvgExistsNow = true;'),
(L '               if(fvgExistsNow) break;'),
(L '              }'),
(L '           }'),
(L '        }')
)
$pa = @($pa[0..($idx+2)]) + $blk + @($pa[($idx+3)..($pa.Count-1)])
Save-Lines $paF $pa
$paGc = (Get-Content -LiteralPath $paF -Encoding UTF8).Count
if ($paGc -ne 456) { Write-Output 'STOP Panels post-count'; exit 1 }
Write-Output ('Panels gc=' + $paGc)

# --- ImbalanceMgr E2b: 16 lines before verdict if ---
Assert-Hash $imF 'F830AE5AA8E7B9FBBD0DD9FAB3A4D9CE26BF8B7E14A5B85F2A6004F692101196'
$im = Load-Lines $imF
$h = Find-Idx $im '      if(!SrjIsNa(latestBiasFVGBar))'
if ($h.Count -ne 1) { Write-Output 'STOP E2b site'; exit 1 }
$i = $h[0]
$blk = @(
(L '      //--- [P-VNEXT-1 E2] structure fallback (his blank-FVG ruling 2026-09-22): anchor-gated search empty is not evidence; search the live structure before defaulting valid.'),
(L '      if(SrjIsNa(latestBiasFVGBar) && !SrjIsNa(g_s.currentStructureStartBar) && g_imbalances.Total() > 0)'),
(L '        {'),
(L '         int m2 = g_imbalances.Total();'),
(L '         for(int j2=0; j2<m2; j2++)'),
(L '           {'),
(L '            CImbalance *fvg3 = GetFVG(g_imbalances,j2);'),
(L '            if(fvg3==NULL) continue;'),
(L '            bool b2 = (g_s.currentBias=="bullish" && fvg3.isBullish) || (g_s.currentBias=="bearish" && !fvg3.isBullish);'),
(L '            if((b2 && fvg3.startBar >= g_s.currentStructureStartBar && fvg3.startBar >= g_s.strictLimitBar) && (SrjIsNa(latestBiasFVGBar) || fvg3.startBar > latestBiasFVGBar))'),
(L '              {'),
(L '               latestBiasFVGBar = fvg3.startBar;'),
(L '               latestBiasFVGIsFilled = fvg3.isFilled;'),
(L '              }'),
(L '           }'),
(L '        }')
)
$im = @($im[0..($i-1)]) + $blk + @($im[$i..($im.Count-1)])
Save-Lines $imF $im
$imGc = (Get-Content -LiteralPath $imF -Encoding UTF8).Count
if ($imGc -ne 612) { Write-Output 'STOP Imb post-count'; exit 1 }
Write-Output ('Imb gc=' + $imGc)
