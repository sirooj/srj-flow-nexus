# Splice relay v301: twin from packet P-UJIMPL-1 v2 + EA code + BiasEngine/FlowLogic evidence + rows from SEG67+SEG60+SEG63 + D74 rows from SEG60 + S1 death rows from SEG63 (mechanical, count-asserted, ASCII-only).
$ErrorActionPreference = 'Stop'
$base = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local'
$pkt = Join-Path $base '01_TASKS\PACKET_P-UJIMPL-1.md'
$ea = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$seg67 = Join-Path $base '06_HANDOFFS\RECON67-V5-EU_JOURNAL.log'
$seg60 = Join-Path $base '06_HANDOFFS\RECON60-RESQUAT-V12_JOURNAL.log'
$seg63 = Join-Path $base '06_HANDOFFS\RECON63-USDJPY-JUNE_JOURNAL.log'
$rel = Join-Path $base '06_HANDOFFS\BUILDER_RELAY_COUNCIL_v301-UJIMPL-2.md'
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
if ($pl.Count -eq 0 -or $el.Count -eq 0 -or $sg67.Count -eq 0 -or $sg60.Count -eq 0 -or $sg63.Count -eq 0) { 'SPLICE-HALT-EMPTY-INPUT'; exit 1 }
$res = 0
foreach ($pat in @('.:', 'downstream gates bypassed', 'confirm-lock fire at 09:45', 'on exceed')) { $c = @($pl | Where-Object { $_.Contains($pat) }); if ($c.Count -gt 0) { $res++; Write-Output ('FOLD-HALT-RESIDUE pattern=[' + $pat + '] hits=' + $c.Count) } }
if ($res -gt 0) { 'SPLICE-HALT-FOLDRESIDUE'; exit 1 }
$rl0 = [System.IO.File]::ReadAllLines($rel)
function FindIdx($lines, $pat) { $ix = @(); for ($i = 0; $i -lt $lines.Count; $i++) { if ($lines[$i] -match $pat) { $ix += $i } }; return $ix }
$t0 = @(FindIdx $rl0 '^P001: '); $pall = @(FindIdx $rl0 '^P[0-9][0-9][0-9]: '); $t1 = @(); if ($pall.Count -gt 0) { $t1 = @($pall[$pall.Count - 1]) }
$c0 = @(FindIdx $rl0 '^C10665: '); $c1 = @(FindIdx $rl0 '^C11492: ')
$rAll = @(FindIdx $rl0 '^hits=1 ')
if ($t0.Count -ne 1 -or $t1.Count -ne 1 -or $pall.Count -ne ($t1[0] - $t0[0] + 1)) { 'SPLICE-HALT-TWIN-BOUND'; exit 1 }
if ($c0.Count -ne 1 -or $c1.Count -ne 1) { 'SPLICE-HALT-CODE-BOUND'; exit 1 }
if ($rAll.Count -ne 26 -and $rAll.Count -ne 29) { 'SPLICE-HALT-ROWS-BOUND hits=' + $rAll.Count; exit 1 }
$r0 = $rAll[0]; $r1 = $rAll[$rAll.Count - 1]
'TWIN-OLD-LINES=' + ($t1[0] - $t0[0] + 1)
'CODE-OLD-BOUNDS=' + $c0[0] + '..' + $c1[0]
'ROWS-OLD-LINES=' + ($r1 - $r0 + 1)
$twin = @()
for ($i = 0; $i -lt $pl.Count; $i++) { $n = $i + 1; $twin += ('P' + $n.ToString('000') + ': ' + $pl[$i]) }
'TWIN-LINES=' + $twin.Count
if ($twin.Count -ne $pl.Count -or $twin.Count -eq 0) { 'SPLICE-HALT-TWIN-EMPTY'; exit 1 }
$code = @()
$regions = @(@(10665, 10668), @(3045, 3055), @(4995, 5012), @(8655, 8691), @(8795, 8818), @(4496, 4505), @(2490, 2503), @(2300, 2322), @(2395, 2424), @(2441, 2465), @(2282, 2299), @(7260, 7287), @(2218, 2233), @(11483, 11492), @(180, 204), @(2349, 2372), @(7304, 7325), @(8060, 8080), @(2238, 2267), @(8819, 8851), @(7288, 7293), @(2193, 2208), @(2466, 2471), @(11095, 11118))
foreach ($rg in $regions) { for ($ln = $rg[0]; $ln -le $rg[1]; $ln++) { $code += ('C' + $ln + ': ' + $el[$ln - 1]) } }
'CODE-LINES=' + $code.Count
if ($code.Count -ne 475 -or $code.Count -eq 0) { 'SPLICE-HALT-CODE-COUNT'; exit 1 }
$biasf = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_BiasEngine.mqh'
$flowf = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5'
$bl = [System.IO.File]::ReadAllLines($biasf)
$fl = [System.IO.File]::ReadAllLines($flowf)
if ($bl.Count -eq 0 -or $fl.Count -eq 0) { 'SPLICE-HALT-BF-EMPTY'; exit 1 }
$bregs = @(@(14, 35), @(138, 169))
$fregs = @(@(30, 60), @(246, 256), @(320, 331))
$bcode = @()
foreach ($rg in $bregs) { for ($ln = $rg[0]; $ln -le $rg[1]; $ln++) { $bcode += ('B' + $ln + ': ' + $bl[$ln - 1]) } }
'BCODE-LINES=' + $bcode.Count
if ($bcode.Count -ne 54 -or $bcode.Count -eq 0) { 'SPLICE-HALT-B-COUNT'; exit 1 }
$fcode = @()
foreach ($rg in $fregs) { for ($ln = $rg[0]; $ln -le $rg[1]; $ln++) { $fcode += ('F' + $ln + ': ' + $fl[$ln - 1]) } }
'FCODE-LINES=' + $fcode.Count
if ($fcode.Count -ne 54 -or $fcode.Count -eq 0) { 'SPLICE-HALT-F-COUNT'; exit 1 }
$rows = @()
$bad = 0
foreach ($p in @('RETESTBOOK bar=2026.08.27 18:05', 'RETESTBOOK bar=2026.08.27 18:10', 'CONFIRMPOLL bar=2026.08.27 18:15', 'CONFIRM_PREBIND_S2 bar=2026.08.27 18:15', 'E4B_GUARD bar=2026.08.27 18:15', 'RETESTBOOK bar=2026.09.01 15:25', 'CONFIRMPOLL bar=2026.09.01 15:25', 'CONFIRM_PREBIND_S2 bar=2026.09.01 15:25', 'E4B_GUARD bar=2026.09.01 15:25')) { $hits = @($sg67 | Where-Object { $_.Contains($p) }); if ($hits.Count -ne 1) { $bad++; Write-Output ('ROW-HALT-R67 pattern=[' + $p + '] hits=' + $hits.Count) } else { $rows += ('hits=1 [R67]: ' + $hits[0]) } }
foreach ($p in @('RETESTBOOK bar=2026.09.07 16:35', 'CONFIRMPOLL bar=2026.09.07 16:40', 'RETESTBOOK bar=2026.09.07 16:40', 'ANCHOR_ELECT bar=2026.09.07 14:55')) { $hits = @($sg60 | Where-Object { $_.Contains($p) }); if ($hits.Count -ne 1) { $bad++; Write-Output ('ROW-HALT-R60 pattern=[' + $p + '] hits=' + $hits.Count) } else { $rows += ('hits=1 [R60]: ' + $hits[0]) } }
foreach ($p in @('2026.06.05 16:10:00   [SRJ-EA] 2026.06.05 16:10:00 ABORT reason=NO_TP_TARGET', 'ANCHOR_ELECT bar=2026.06.05 09:35', 'RETESTBOOK bar=2026.06.05 09:35', 'CONFIRMPOLL bar=2026.06.05 09:40', 'RETESTBOOK bar=2026.06.11 14:35', 'CONFIRMPOLL bar=2026.06.11 14:35', 'ANCHOR_ELECT bar=2026.06.11 14:20', 'SUPPRESSED bar=2026.06.11 14:35', 'S1WAIT bar=2026.06.11 14:35', 'REGIMECENSUS #176 bar=2026.06.11 14:35')) { $hits = @($sg63 | Where-Object { $_.Contains($p) }); if ($hits.Count -ne 1) { $bad++; Write-Output ('ROW-HALT-R63 pattern=[' + $p + '] hits=' + $hits.Count) } else { $rows += ('hits=1 [R63]: ' + $hits[0]) } }
foreach ($p in @('ANCHOR_ELECT bar=2026.08.27 17:45', 'RETESTBOOK bar=2026.08.27 18:10 hits=2', 'CONFIRMPOLL bar=2026.08.27 18:15 anchor=Weekly-POC', 'CONFIRMPOLL bar=2026.09.01 15:25 anchor=Monthly-POC', 'S2WAIT bar=2026.09.01 15:25', '15:30:00 STATE S1_REGIME->S2_LTF_ALIGN dir=SHORT poi=Monthly-POC')) { $hits = @($sg60 | Where-Object { $_.Contains($p) }); if ($hits.Count -ne 1) { $bad++; Write-Output ('ROW-HALT-D74 pattern=[' + $p + '] hits=' + $hits.Count) } else { $rows += ('hits=1 [D74]: ' + $hits[0]) } }
'ROW-PATTERNS=29'
'ROWS-PULLED=' + $rows.Count
if ($bad -gt 0) { 'SPLICE-HALT-ROWS'; exit 1 }
if ($rows.Count -ne 29) { 'SPLICE-HALT-ROWS-COUNT'; exit 1 }
$ntw = 0
foreach ($r in $twin) { foreach ($ch in $r.ToCharArray()) { if ([int]$ch -gt 127) { $ntw++ } } }
'nonwin-ascii=' + $ntw
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
$okbf = $true
foreach ($t in $bcode) { $ln = [int]$t.Substring(1, $t.IndexOf(': ') - 1); $body = $t.Substring($t.IndexOf(': ') + 2); if ($body -cne $bl[$ln - 1]) { $okbf = $false; Write-Output ('B-ASCII-FAIL ' + $t.Substring(0, 12)) } }
foreach ($t in $fcode) { $ln = [int]$t.Substring(1, $t.IndexOf(': ') - 1); $body = $t.Substring($t.IndexOf(': ') + 2); if ($body -cne $fl[$ln - 1]) { $okbf = $false; Write-Output ('F-ASCII-FAIL ' + $t.Substring(0, 12)) } }
if (-not $okbf) { 'SPLICE-HALT-BFASCII'; exit 1 }
$out = New-Object System.Collections.Generic.List[string]
for ($i = 0; $i -lt $t0[0]; $i++) { $out.Add($rl0[$i]) }
foreach ($t in $twin) { $out.Add($t) }
for ($i = $t1[0] + 1; $i -lt $c0[0]; $i++) { $out.Add($rl0[$i]) }
foreach ($t in $code) { $out.Add($t) }
$out.Add('# --- Include/SRJ/SRJ_BiasEngine.mqh (read-only evidence, his scope YES) ---')
foreach ($t in $bcode) { $out.Add($t) }
$out.Add('# --- Indicators/SRJ_FlowLogic.mq5 (read-only evidence, his scope YES) ---')
foreach ($t in $fcode) { $out.Add($t) }
for ($i = $c1[0] + 1; $i -lt $r0; $i++) { $out.Add($rl0[$i]) }
foreach ($r in $rows) { $out.Add($r) }
for ($i = $r1 + 1; $i -lt $rl0.Count; $i++) { $out.Add($rl0[$i]) }
'OUT-LINES=' + $out.Count
if ($out.Count -eq 0) { 'SPLICE-HALT-EMPTY-OUT'; exit 1 }
$enc = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllLines($rel, $out.ToArray(), $enc)
'WROTE-LINES=' + $out.Count
