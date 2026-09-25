# Splice relay v274: twin from packet + code from EA + rows from SEG63 (mechanical, count-asserted, ASCII-only).
$ErrorActionPreference = 'Stop'
$base = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local'
$pkt = Join-Path $base '01_TASKS\PACKET_P-USDJPY-1.md'
$ea = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$seg = Join-Path $base '06_HANDOFFS\RECON63-USDJPY-JUNE_JOURNAL.log'
$rel = Join-Path $base '06_HANDOFFS\BUILDER_RELAY_COUNCIL_v274-USDJPY-CLEAR1.md'
$pl = [System.IO.File]::ReadAllLines($pkt)
$el = [System.IO.File]::ReadAllLines($ea)
$sg = [System.IO.File]::ReadAllLines($seg)
'PKT-COUNT=' + $pl.Count
'EA-COUNT=' + $el.Count
'SEG-COUNT=' + $sg.Count
$twin = @()
for ($i = 0; $i -lt $pl.Count; $i++) { $n = $i + 1; $twin += ('P' + $n.ToString('000') + ': ' + $pl[$i]) }
'TWIN-LINES=' + $twin.Count
$code = @()
$regions = @(@(2193, 2233), @(7302, 7313), @(8067, 8077), @(8655, 8680), @(8795, 8816), @(10081, 10085), @(11334, 11350))
foreach ($rg in $regions) { for ($ln = $rg[0]; $ln -le $rg[1]; $ln++) { $code += ('C' + $ln + ': ' + $el[$ln - 1]) } }
'CODE-LINES=' + $code.Count
$pats = @('SRJ SIGNAL LONG USDJPY', 'PRE-SEND lots=3.71', 'EXECUTED fill=159.932', 'ENTRY_TICKET bar=2026.06.03 09:05', 'MTEXIT bar=2026.06.03 09:55', '2026.06.05 09:30:00 ABORT', '2026.06.05 09:30:00   [SRJ-EA] ALERT SRJ STAND-DOWN LONG', 'ANCHOR_ELECT bar=2026.06.05 09:35', 'REGIMECENSUS #55', 'FRESHSKIP bar=2026.06.05 09:40', 'CONFIRMPOLL bar=2026.06.05 09:40', 'FRESHSKIP bar=2026.06.05 09:45', 'CONFIRMPOLL bar=2026.06.05 09:45', 'RETESTBOOK bar=2026.06.05 09:45', 'FRESHCOUNT #48', '2026.06.05 09:55:00   [SRJ-EA] ALERT SRJ HEADS-UP SHORT', '2026.06.05 11:00:00   [SRJ-EA] ALERT SRJ STAND-DOWN SHORT', 'RETESTBOOK bar=2026.06.05 16:00', 'ANCHOR_ELECT bar=2026.06.05 16:00', 'REGIMECENSUS #56', 'TPCENSUS #86', 'FRESHSKIP bar=2026.06.05 16:05', '2026.06.05 16:10:00 ABORT reason=NO_TP_TARGET', '2026.06.05 16:10:00   [SRJ-EA] 2026.06.05 16:10:00 STATE', '14:45:05   [SRJ-EA] ALERT SRJ HEADS-UP LONG', 'REGIMECENSUS #177', 'RETESTBOOK bar=2026.06.11 14:45', 'CONFIRMPOLL bar=2026.06.11 14:45', 'CONFIRM_STRUCT_FAIL bar=2026.06.11 14:45', 'FRESHCOUNT #89', 'TPCENSUS #147', '2026.06.11 15:25:00 ABORT reason=NO_TP_TARGET state=S4_ARMED')
$rows = @()
$bad = 0
foreach ($p in $pats) { $hits = @($sg | Where-Object { $_.Contains($p) }); if ($hits.Count -ne 1) { $bad++; Write-Output ('ROW-HALT pattern=[' + $p + '] hits=' + $hits.Count) } else { $rows += ('hits=1: ' + $hits[0]) } }
'ROW-PATTERNS=' + $pats.Count
'ROWS-PULLED=' + $rows.Count
if ($bad -gt 0) { 'SPLICE-HALT-ROWS'; exit 1 }
$nonascii = 0
foreach ($r in ($twin + $code + $rows)) { foreach ($ch in $r.ToCharArray()) { if ([int]$ch -gt 127) { $nonascii++ } } }
'NONASCII=' + $nonascii
if ($nonascii -gt 0) { 'SPLICE-HALT-ASCII'; exit 1 }
$rl = [System.IO.File]::ReadAllLines($rel)
$out = New-Object System.Collections.Generic.List[string]
$mode = 'prose'
foreach ($l in $rl) {
  if ($l -eq 'TWIN-ANCHOR-START') { $mode = 'twin'; foreach ($t in $twin) { $out.Add($t) }; continue }
  if ($l -eq 'TWIN-ANCHOR-END') { $mode = 'prose'; continue }
  if ($l -eq 'CODE-ANCHOR-START') { $mode = 'code'; foreach ($t in $code) { $out.Add($t) }; continue }
  if ($l -eq 'CODE-ANCHOR-END') { $mode = 'prose'; continue }
  if ($l -eq 'ROWS-ANCHOR-START') { $mode = 'rows'; foreach ($t in $rows) { $out.Add($t) }; continue }
  if ($l -eq 'ROWS-ANCHOR-END') { $mode = 'prose'; continue }
  if ($mode -eq 'prose') { $out.Add($l) }
}
$enc = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllLines($rel, $out.ToArray(), $enc)
'WROTE-LINES=' + $out.Count
