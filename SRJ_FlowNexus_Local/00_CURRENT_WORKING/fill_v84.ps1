# Fill v84 + companion markers mechanically via pure .NET UTF-8 (zero transcription).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$EA = Join-Path $MQL5 'Experts\SRJ_FlowNexus_EA.mq5'
$ARC = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\C0-PROBE_JOURNAL.log'
$LUN = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md'
$SON = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md'
$COMP = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_SNIPPET_V84SEED_WHOLE.md'
$R84 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v84-TEST-TIMEOUT-CLOSEDSET.md'
function reg($a,$b) {
  $L = [System.IO.File]::ReadAllLines($EA, $utf8)
  $o = New-Object System.Collections.Generic.List[string]
  for ($n = $a; $n -le $b; $n++) { $o.Add(('{0}: {1}' -f $n, $L[$n - 1])) }
  return $o.ToArray()
}
function pay1($f,$p) {
  $r = Select-String -LiteralPath $f -Pattern $p -SimpleMatch | Select-Object -First 3 | ForEach-Object { $l = $_.Line; $l.Substring($l.IndexOf('[SRJ-EA]')) }
  return $r
}
function seclines($L,$afterMark,$startMark,$endMark) {
  $o = -1
  for ($i = 0; $i -lt $L.Count; $i++) { if ($L[$i].Contains($afterMark)) { $o = $i; break } }
  if ($o -lt 0) { return @('BLOCK-NOT-FOUND') }
  $a = -1
  for ($i = $o; $i -lt $L.Count; $i++) { if ($L[$i].Contains($startMark)) { $a = $i; break } }
  if ($a -lt 0) { return @('START-NOT-FOUND') }
  $b = -1
  for ($i = $a + 1; $i -lt $L.Count; $i++) { if ($L[$i].Contains($endMark)) { $b = $i; break } }
  if ($b -lt 0) { return @('END-NOT-FOUND') }
  return $L[$a..($b - 1)]
}
$ct = [System.IO.File]::ReadAllText($COMP, $utf8)
$ct = $ct.Replace('<!--R-O-->', ((reg 7526 7548) -join "`r`n"))
$ct = $ct.Replace('<!--R-P-->', ((reg 7396 7446) -join "`r`n"))
$qx = New-Object System.Collections.Generic.List[string]
$qx.Add('[t78 site excerpt]')
foreach ($x in (reg 7366 7376)) { $qx.Add($x) }
$qx.Add('[t73 site excerpt]')
foreach ($x in (reg 7470 7480)) { $qx.Add($x) }
$qx.Add('[sh site excerpt]')
foreach ($x in (reg 7515 7523)) { $qx.Add($x) }
$ct = $ct.Replace('<!--R-Q-->', ($qx.ToArray() -join "`r`n"))
[System.IO.File]::WriteAllText($COMP, $ct, $utf8)
$rt = [System.IO.File]::ReadAllText($R84, $utf8)
$fate = New-Object System.Collections.Generic.List[string]
foreach ($p in @('ANCHOR_ELECT bar=2026.09.08 09:15', 'ANCHOR_SUPERSEDE bar=2026.09.08 09:20', 'SUPPRESSED bar=2026.09.08 09:30', '12:05:03 ABORT reason=SESSION_CLOSED')) {
  foreach ($x in (pay1 $ARC $p)) { $fate.Add($x) }
}
$fate.Add('S2WAIT first/last Monthly-POC retained:')
foreach ($x in (pay1 $ARC 'S2WAIT bar=2026.09.08 09:20')) { $fate.Add($x) }
foreach ($x in (pay1 $ARC 'S2WAIT bar=2026.09.08 11:15')) { $fate.Add($x) }
$rt = $rt.Replace('<!--FATE-ROWS-->', ($fate.ToArray() -join "`r`n"))
$lunL = [System.IO.File]::ReadAllLines($LUN, $utf8)
$rt = $rt.Replace('<!--LUNA-TEST-->', ((seclines $lunL 'V83-D-RESCOPE-01' '## 2. Exact predicate' '## 3. Code site') -join "`r`n"))
$sonL = [System.IO.File]::ReadAllLines($SON, $utf8)
$rt = $rt.Replace('<!--SONNET-TIMEOUT-->', ((seclines $sonL 'answers v83' '(i) predicate + site' '(ii) predictions') -join "`r`n"))
[System.IO.File]::WriteAllText($R84, $rt, $utf8)
'done'
