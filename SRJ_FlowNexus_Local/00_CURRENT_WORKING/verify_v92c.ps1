# Verify v92 companion: markers gone, byte-identity, byte audit (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$EA = Join-Path $MQL5 'Experts\SRJ_FlowNexus_EA.mq5'
$COMP = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_SNIPPET_V92GATE_WHOLE.md'
$ct = [System.IO.File]::ReadAllText($COMP, $utf8)
'MARKERS-LEFT=' + $ct.Contains('<!--')
$E = [System.IO.File]::ReadAllLines($EA, $utf8)
$L = [System.IO.File]::ReadAllLines($COMP, $utf8)
'COMP-LINES=' + $L.Length
$spans = @(@(9464,9466), @(9531,9541), @(9561,9599), @(9697,9707), @(7248,7252))
$mis = 0
$cnt = 0
foreach ($l in $L) {
  $p = $l.IndexOf(': ')
  if ($p -le 0) { continue }
  $n = 0
  if (-not [int]::TryParse($l.Substring(0, $p), [ref]$n)) { continue }
  $in = $false
  foreach ($sp in $spans) {
    if ($n -ge $sp[0]) {
      if ($n -le $sp[1]) { $in = $true }
    }
  }
  if (-not $in) { continue }
  $cnt++
  if ($l.Substring($p + 2) -cne $E[$n - 1]) { $mis++; [string]('MIS ' + $n) }
}
'CODE-LINES=' + $cnt + ' MISMATCHES=' + $mis
$B = [System.IO.File]::ReadAllBytes($COMP)
'BOM=' + ($B[0].ToString('X2') + $B[1].ToString('X2') + $B[2].ToString('X2'))
$c3 = 0
foreach ($b in $B) { if ($b -eq 195) { $c3++ } }
'C3-COUNT=' + $c3
