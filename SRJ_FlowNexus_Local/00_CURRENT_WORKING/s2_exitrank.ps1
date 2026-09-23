$ea = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$t = [System.IO.File]::ReadAllText($ea)
$parts = [regex]::Split($t, '(\r\n|\n)')
$contents = New-Object Collections.ArrayList
$terms = New-Object Collections.ArrayList
for ($i = 0; $i -lt $parts.Count; $i += 2) { [void]$contents.Add($parts[$i]) }
for ($i = 1; $i -lt $parts.Count; $i += 2) { [void]$terms.Add($parts[$i]) }
Write-Output ('CONTENTS: ' + $contents.Count + ' TERMS: ' + $terms.Count)
$a1 = '   //--- [P-VNEXT-1 E3] B-fork decl (his ruling 2026-09-22): mean-reversion flag for the break gate below.'
$a2 = '   bool isMeanRev = (g_mtrade.regimeAtAdmission == REGIME_MEANREV);'
$a3 = '      //--- [P-VNEXT-1 E3] B-fork gate: DAY_CLOSE-minus-5 outranks body-break on mean-reversion; break suppressed here so vDAY decides (SL/TP above untouched).'
$a4 = '      if(isTrigger && behind && through && !vBREAK && !isMeanRev)'
function FindAll($arr, $s) { $r = New-Object Collections.ArrayList; for ($i = 0; $i -lt $arr.Count; $i++) { if ($arr[$i] -ceq $s) { [void]$r.Add($i) } }; return $r }
$h1 = FindAll $contents $a1; $h2 = FindAll $contents $a2; $h3 = FindAll $contents $a3; $h4 = FindAll $contents $a4
Write-Output ('HITS: ' + $h1.Count + '/' + $h2.Count + '/' + $h3.Count + '/' + $h4.Count)
if ($h1.Count -ne 1 -or $h2.Count -ne 1 -or $h3.Count -ne 1 -or $h4.Count -ne 1) { Write-Output 'HALT-SINGLE-HIT'; exit 1 }
$i1 = $h1[0]; $i2 = $h2[0]; $i3 = $h3[0]; $i4 = $h4[0]
Write-Output ('LINES: ' + ($i1+1) + '/' + ($i2+1) + '/' + ($i3+1) + '/' + ($i4+1))
if ($i2 -ne ($i1+1) -or $i4 -ne ($i3+1)) { Write-Output 'HALT-ADJACENCY'; exit 1 }
if (($i1+1) -ne 11157 -or ($i3+1) -ne 11223) { Write-Output 'HALT-LINENO'; exit 1 }
$n3 = '      //--- [P-EXITRANK-6] anchor-rank gate (his 2026-09-23 rule: same-line cross never exits; only HIGHER-authority breaks exit; lower number = higher authority; amends charter 9.1(2) same-line case, supersedes E3).'
$n4 = '      if(isTrigger && behind && through && !vBREAK && g_mtrade.anchorLine >= 0 && g_mtrade.anchorLine < POI_NLINES && g_authorityRank[k] < g_authorityRank[g_mtrade.anchorLine])'
$out = New-Object System.Text.StringBuilder
for ($i = 0; $i -lt $contents.Count; $i++) {
  if ($i -eq $i1 -or $i -eq $i2) { continue }
  if ($i -eq $i3) { [void]$out.Append($n3) }
  elseif ($i -eq $i4) { [void]$out.Append($n4) }
  else { [void]$out.Append($contents[$i]) }
  if ($i -lt $terms.Count) { [void]$out.Append($terms[$i]) }
}
[System.IO.File]::WriteAllText($ea, $out.ToString())
Write-Output 'SPLICED'
$new = [System.IO.File]::ReadAllText($ea)
Write-Output ('OLD-GONE-A1: ' + (([regex]::Matches($new, [regex]::Escape($a1))).Count))
Write-Output ('OLD-GONE-A4: ' + (([regex]::Matches($new, [regex]::Escape($a4))).Count))
Write-Output ('NEW-N3: ' + (([regex]::Matches($new, [regex]::Escape($n3))).Count))
Write-Output ('NEW-N4: ' + (([regex]::Matches($new, [regex]::Escape($n4))).Count))
