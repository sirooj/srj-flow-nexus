# Verify v77 §1 inline copy covers the filed packet (read-only).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$PKP = Join-Path $MQL5 'SRJ_FlowNexus_Local\01_TASKS\PACKET_C1-LANDING-001.md'
$R77 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v77-C1-CLOSEDSET.md'
$pkt = [System.IO.File]::ReadAllText($PKP, $utf8).Trim()
$rel = [System.IO.File]::ReadAllText($R77, $utf8)
$i0 = $rel.IndexOf('PACKET TEXT (filed')
$i1 = $rel.IndexOf('consequence table (from')
$seg = $rel.Substring($i0, ($i1 - $i0))
'SEG-HAS-HEAD={0}' -f $seg.Contains('# PACKET ``C1-LANDING-001``')
'SEG-HAS-TAIL={0}' -f $seg.Contains('STAGE-1 re-hash gates it).')
$lines = $pkt.Split("`n")
$miss = 0
foreach ($ln in $lines) {
  $t = $ln.Trim()
  if ($t -eq '') { continue }
  $lead = $t.Substring(0, [Math]::Min(60, $t.Length))
  if (-not $seg.Contains($lead)) {
    $miss = $miss + 1
    if ($miss -le 3) { 'MISSING-LEAD: {0}' -f $t.Substring(0, [Math]::Min(80, $t.Length)) }
  }
}
'PKT-CONTENT-LINES-ABSENT-FROM-R77={0}' -f $miss
