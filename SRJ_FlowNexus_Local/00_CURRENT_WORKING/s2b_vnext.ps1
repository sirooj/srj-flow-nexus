# S2b: Panels E2a + ImbalanceMgr E2b only (EA section already saved post-hunks).
# Same rules: single-hit asserts halt, endings preserved, echoes in main flow.
# ASCII only. Single-quoted strings. No backticks.

$mql5 = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$paF = $mql5 + '\Include\SRJ\SRJ_Panels.mqh'
$imF = $mql5 + '\Include\SRJ\SRJ_ImbalanceMgr.mqh'
$utf8 = New-Object System.Text.UTF8Encoding $false

function LineText($el) {
  if ($el.EndsWith("`r`n")) { return $el.Substring(0, $el.Length - 2) }
  if ($el.EndsWith("`n")) { return $el.Substring(0, $el.Length - 1) }
  return $el
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

function Assert-Hash($f, $want) {
  $h = (Get-FileHash -LiteralPath $f -Algorithm SHA256).Hash
  if ($h -cne $want) { Write-Output ('STOP hash drift: ' + $f); exit 1 }
}

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
if ($blk.Count -ne 17) { Write-Output 'STOP E2a block count'; exit 1 }
$pa = @($pa[0..($idx+2)]) + $blk + @($pa[($idx+3)..($pa.Count-1)])
Save-Lines $paF $pa
$paGc = (Get-Content -LiteralPath $paF -Encoding UTF8).Count
if ($paGc -ne 456) { Write-Output 'STOP Panels post-count'; exit 1 }
Write-Output ('Panels gc=' + $paGc)

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
if ($blk.Count -ne 16) { Write-Output 'STOP E2b block count'; exit 1 }
$im = @($im[0..($i-1)]) + $blk + @($im[$i..($im.Count-1)])
Save-Lines $imF $im
$imGc = (Get-Content -LiteralPath $imF -Encoding UTF8).Count
if ($imGc -ne 612) { Write-Output 'STOP Imb post-count'; exit 1 }
Write-Output ('Imb gc=' + $imGc)
