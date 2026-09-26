# Splice relay v287: twin from packet ENTRY-2 + code from EA + rows from SEG67+SEG60+SEG63 (mechanical, count-asserted, ASCII-only; anchor-existence asserts).
$ErrorActionPreference = 'Stop'
$base = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local'
$pkt = Join-Path $base '01_TASKS\PACKET_P-ENTRY-2.md'
$ea = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$seg67 = Join-Path $base '06_HANDOFFS\RECON67-V5-EU_JOURNAL.log'
$seg60 = Join-Path $base '06_HANDOFFS\RECON60-RESQUAT-V12_JOURNAL.log'
$seg63 = Join-Path $base '06_HANDOFFS\RECON63-USDJPY-JUNE_JOURNAL.log'
$rel = Join-Path $base '06_HANDOFFS\BUILDER_RELAY_COUNCIL_v287-ENTRY-FULL.md'
$pl = [System.IO.File]::ReadAllLines($pkt)
$el = [System.IO.File]::ReadAllLines($ea)
$sg67 = [System.IO.File]::ReadAllLines($seg67)
$sg60 = [System.IO.File]::ReadAllLines($seg60)
$sg63 = [System.IO.File]::ReadAllLines($seg63)
'PKT-COUNT=' + $pl.Count
'EA-COUNT=' + $el.Count
'SEG67-COUNT=' + $sg67.Count
'SEG60-COUNT=' + $sg60.Count
'SEG63-COUNT=' + $sg63.Count
$rl0 = [System.IO.File]::ReadAllLines($rel)
foreach ($a in @('TWIN-ANCHOR-START','TWIN-ANCHOR-END','CODE-ANCHOR-START','CODE-ANCHOR-END','ROWS-ANCHOR-START','ROWS-ANCHOR-END')) { $c = @($rl0 | Where-Object { $_ -eq $a }).Count; if ($c -ne 1) { Write-Output ('ANCHOR-HALT ' + $a + ' hits=' + $c); exit 1 } }
'ANCHORS-OK=6'
$twin = @()
for ($i = 0; $i -lt $pl.Count; $i++) { $n = $i + 1; $twin += ('P' + $n.ToString('000') + ': ' + $pl[$i]) }
'TWIN-LINES=' + $twin.Count
$code = @()
$regions = @(@(7822, 7856), @(8655, 8691), @(8795, 8818), @(2395, 2424), @(2218, 2233), @(8851, 8869))
foreach ($rg in $regions) { for ($ln = $rg[0]; $ln -le $rg[1]; $ln++) { $code += ('C' + $ln + ': ' + $el[$ln - 1]) } }
'CODE-LINES=' + $code.Count
$rows = @()
$bad = 0
foreach ($p in @('RETESTBOOK bar=2026.08.27 18:05', 'RETESTBOOK bar=2026.08.27 18:10', 'CONFIRMPOLL bar=2026.08.27 18:15', 'CONFIRM_PREBIND_S2 bar=2026.08.27 18:15', 'E4B_GUARD bar=2026.08.27 18:15', 'RETESTBOOK bar=2026.09.01 15:25', 'CONFIRMPOLL bar=2026.09.01 15:25', 'CONFIRM_PREBIND_S2 bar=2026.09.01 15:25', 'E4B_GUARD bar=2026.09.01 15:25')) { $hits = @($sg67 | Where-Object { $_.Contains($p) }); if ($hits.Count -ne 1) { $bad++; Write-Output ('ROW-HALT-R67 pattern=[' + $p + '] hits=' + $hits.Count) } else { $rows += ('hits=1 [R67]: ' + $hits[0]) } }
foreach ($p in @('RETESTBOOK bar=2026.09.07 16:35', 'CONFIRMPOLL bar=2026.09.07 16:40', 'RETESTBOOK bar=2026.09.07 16:40')) { $hits = @($sg60 | Where-Object { $_.Contains($p) }); if ($hits.Count -ne 1) { $bad++; Write-Output ('ROW-HALT-R60 pattern=[' + $p + '] hits=' + $hits.Count) } else { $rows += ('hits=1 [R60]: ' + $hits[0]) } }
foreach ($p in @('CONFIRMPOLL bar=2026.06.05 09:40', '2026.06.05 16:10:00   [SRJ-EA] 2026.06.05 16:10:00 ABORT reason=NO_TP_TARGET', 'RETESTBOOK bar=2026.06.11 14:45', 'CONFIRMPOLL bar=2026.06.11 14:45')) { $hits = @($sg63 | Where-Object { $_.Contains($p) }); if ($hits.Count -ne 1) { $bad++; Write-Output ('ROW-HALT-R63 pattern=[' + $p + '] hits=' + $hits.Count) } else { $rows += ('hits=1 [R63]: ' + $hits[0]) } }
'ROW-PATTERNS=16'
'ROWS-PULLED=' + $rows.Count
if ($bad -gt 0) { 'SPLICE-HALT-ROWS'; exit 1 }
'ROWS-TOTAL=' + $rows.Count
$ntw = 0
foreach ($r in $twin) { foreach ($ch in $r.ToCharArray()) { if ([int]$ch -gt 127) { $ntw++ } } }
'nontwin-ascii=' + $ntw
$nrw = 0
foreach ($r in $rows) { foreach ($ch in $r.ToCharArray()) { if ([int]$ch -gt 127) { $nrw++ } } }
'nonrows-ascii=' + $nrw
if ($ntw -gt 0 -or $nrw -gt 0) { 'SPLICE-HALT-ASCII'; exit 1 }
$okcode = $true
$traced = 0
foreach ($t in $code) { $has = $false; foreach ($ch in $t.ToCharArray()) { if ([int]$ch -gt 127) { $has = $true; break } }; if ($has) { $ln = [int]$t.Substring(1, $t.IndexOf(': ') - 1); $body = $t.Substring($t.IndexOf(': ') + 2); if ($body -cne $el[$ln - 1]) { $okcode = $false; Write-Output ('CODE-ASCII-FAIL ' + $t.Substring(0, 12)) } else { $traced++ } } }
'code-nonascii-traced=' + $traced
'code-ascii-traced=' + $okcode
if (-not $okcode) { 'SPLICE-HALT-CODEASCII'; exit 1 }
$rl = $rl0
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
