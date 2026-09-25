# Splice relay v282: twin from packet v9 + code from EA + rows from SEG64 (mechanical, count-asserted, ASCII-only; anchor-existence asserts per v275-D1: reruns halt unless anchors present).
$ErrorActionPreference = 'Stop'
$base = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local'
$pkt = Join-Path $base '01_TASKS\PACKET_P-USDJPY-2v2.md'
$ea = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$seg = Join-Path $base '06_HANDOFFS\RECON64-V7-USDJPY_JOURNAL.log'
$rel = Join-Path $base '06_HANDOFFS\BUILDER_RELAY_COUNCIL_v282-USDJPY-GUARDS2.md'
$pl = [System.IO.File]::ReadAllLines($pkt)
$el = [System.IO.File]::ReadAllLines($ea)
$sg = [System.IO.File]::ReadAllLines($seg)
'PKT-COUNT=' + $pl.Count
'EA-COUNT=' + $el.Count
'SEG-COUNT=' + $sg.Count
$rl0 = [System.IO.File]::ReadAllLines($rel)
foreach ($a in @('TWIN-ANCHOR-START','TWIN-ANCHOR-END','CODE-ANCHOR-START','CODE-ANCHOR-END','ROWS-ANCHOR-START','ROWS-ANCHOR-END')) { $c = @($rl0 | Where-Object { $_ -eq $a }).Count; if ($c -ne 1) { Write-Output ('ANCHOR-HALT ' + $a + ' hits=' + $c); exit 1 } }
'ANCHORS-OK=6'
$twin = @()
for ($i = 0; $i -lt $pl.Count; $i++) { $n = $i + 1; $twin += ('P' + $n.ToString('000') + ': ' + $pl[$i]) }
'TWIN-LINES=' + $twin.Count
$code = @()
$regions = @(@(8086, 8112), @(5117, 5146), @(7119, 7130), @(302, 324), @(7099, 7102), @(1728, 1733))
foreach ($rg in $regions) { for ($ln = $rg[0]; $ln -le $rg[1]; $ln++) { $code += ('C' + $ln + ': ' + $el[$ln - 1]) } }
'CODE-LINES=' + $code.Count
$pats = @('ORDER fields=10 bar=1 barTime=2026.06.05 09:40', 'ORDER fields=10 bar=1 barTime=2026.06.04 16:15', 'ORDER fields=10 bar=1 barTime=2026.06.08 09:30', 'ORDER fields=10 bar=1 barTime=2026.06.03 09:05', 'CONFIRM_PREBIND_S2 bar=2026.06.05 09:40', 'ALERT SRJ SIGNAL SHORT USDJPY M5 | Daily-POC | LONDON | R=2.04', 'EXECUTED fill=159.948', 'CONFIRM_PREBIND_FAIL bar=2026.06.05 16:05', 'CONFIRM_PREBIND_S2 bar=2026.06.04 16:15', 'TPFALLBACK bar=2026.06.05 16:05', 'TP_RR_FAIL_LATCH bar=2026.06.05 16:50', 'EXECUTED fill=159.932', 'ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-VWAP | LONDON | R=1.35', 'RETESTDIAG bar=2026.06.05 09:40', 'RETESTDIAG bar=2026.06.03 09:05', 'CONFIRM_PREBIND_S2 bar=2026.06.08 09:30', 'ALERT SRJ SIGNAL SHORT USDJPY M5 | Weekly-POC | LONDON | R=3.47', 'A2_WAIVED_POC bar=2026.06.11 15:15', 'A2_WAIVED_POC bar=2026.06.03 18:35', 'SIDE1T_SEEDBIAS bar=2026.06.05 09:35', 'SIDE1T_SEEDBIAS bar=2026.06.04 16:00', 'SIDE1T_SEEDBIAS bar=2026.06.08 09:25', 'SIDE1T_SEEDBIAS bar=2026.06.03 09:00', 'TP_RR_FAIL_LATCH bar=2026.06.03 18:35')
$rows = @()
$bad = 0
foreach ($p in $pats) { $hits = @($sg | Where-Object { $_.Contains($p) }); if ($hits.Count -ne 1) { $bad++; Write-Output ('ROW-HALT pattern=[' + $p + '] hits=' + $hits.Count) } else { $rows += ('hits=1: ' + $hits[0]) } }
'ROW-PATTERNS=' + $pats.Count
'ROWS-PULLED=' + $rows.Count
if ($bad -gt 0) { 'SPLICE-HALT-ROWS'; exit 1 }
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
