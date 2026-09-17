# Tabulate RECON45 vs RECON44 + extract (mechanical, same-rule both sides).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$A44 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON44-DEMO_JOURNAL.log'
$A45 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON45-DEMO-PASS_JOURNAL.log'
$TAB = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON45_TABULATE.txt'
$EXT = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON45_EXTRACT.txt'
function Fam($ln) {
  $i = $ln.IndexOf('[SRJ-EA]')
  if ($i -ge 0) { $r = $ln.Substring($i + 8).TrimStart(); if ($r.Length -eq 0) { return '[SRJ-EA]:EMPTY' }; return ($r -split '\s+')[0] }
  $i = $ln.IndexOf('[SRJ]')
  if ($i -ge 0) { $r = $ln.Substring($i + 5).TrimStart(); if ($r.Length -eq 0) { return '[SRJ]:EMPTY' }; return '[SRJ]' + (($r -split '\s+')[0]) }
  $i = $ln.IndexOf('[POI]')
  if ($i -ge 0) { $r = $ln.Substring($i + 5).TrimStart(); if ($r.Length -eq 0) { return '[POI]:EMPTY' }; return '[POI]' + (($r -split '\s+')[0]) }
  return 'OTHER'
}
function CountFams($path) {
  $h = @{}
  $n = 0
  foreach ($ln in [System.IO.File]::ReadLines($path)) { $n++; $f = Fam($ln); if ($h.ContainsKey($f)) { $h[$f]++ } else { $h[$f] = 1 } }
  return @{H=$h; N=$n}
}
$c44 = CountFams($A44)
$c45 = CountFams($A45)
$keys = ($c44.H.Keys + $c45.H.Keys) | Sort-Object -Unique
$out = New-Object System.Collections.Generic.List[string]
$nd = 0
foreach ($k in $keys) {
  $a = 0; if ($c44.H.ContainsKey($k)) { $a = $c44.H[$k] }
  $b = 0; if ($c45.H.ContainsKey($k)) { $b = $c45.H[$k] }
  $s = ('{0} {1}->{2}' -f $k, $a, $b)
  if ($a -ne $b) { $s += ' DELTA'; $nd++ }
  $out.Add($s)
}
[System.IO.File]::WriteAllLines($TAB, $out.ToArray(), $utf8)
'FAMILIES=' + $keys.Count + ' DELTAS=' + $nd
'N44=' + $c44.N + ' N45=' + $c45.N + ' NDELTA=' + ($c45.N - $c44.N)
$ext = New-Object System.Collections.Generic.List[string]
foreach ($ln in [System.IO.File]::ReadLines($A45)) {
  if ($ln.Contains('SIDE1X_STOPREF') -or $ln.Contains('A6FIRED') -or $ln.Contains('DEMO_PASS') -or $ln.Contains('EXECUTED') -or $ln.Contains('PRE-SEND')) {
    $i = $ln.IndexOf('[SRJ'); $ext.Add($ln.Substring($i))
  }
}
[System.IO.File]::WriteAllLines($EXT, $ext.ToArray(), $utf8)
'EXTRACT=' + $ext.Count
$max = 0; foreach ($ln in [System.IO.File]::ReadLines($A45)) { if ($ln.Length -gt $max) { $max = $ln.Length } }
'MAXLEN=' + $max
'CORE04=' + (Select-String -LiteralPath $A45 -Pattern 'Core 04' -SimpleMatch | Measure-Object).Count
'NONCORE-EA=' + ((Select-String -LiteralPath $A45 -Pattern '\[SRJ' | Where-Object { $_.Line -notmatch 'Core 04' } | Measure-Object).Count)
'OUTOFRANGE=' + (Select-String -LiteralPath $A45 -Pattern 'out of range' -SimpleMatch | Measure-Object).Count
'SELHALT=' + (Select-String -LiteralPath $A45 -Pattern 'SELHALT' -SimpleMatch | Measure-Object).Count
'TESTPASSED=' + (Select-String -LiteralPath $A45 -Pattern 'Test passed' -SimpleMatch | Measure-Object).Count
