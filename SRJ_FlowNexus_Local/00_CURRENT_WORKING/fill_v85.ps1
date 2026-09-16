# Fill v85 markers mechanically via pure .NET UTF-8 (zero transcription).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$ARC = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\C0-PROBE_JOURNAL.log'
$R85 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v85-SLOTOCC-FIXAUTHOR.md'
function pay1($f,$p) {
  $r = Select-String -LiteralPath $f -Pattern $p -SimpleMatch | Select-Object -First 2 | ForEach-Object { $l = $_.Line; $l.Substring($l.IndexOf('[SRJ-EA]')) }
  return $r
}
$rt = [System.IO.File]::ReadAllText($R85, $utf8)
$supp = New-Object System.Collections.Generic.List[string]
foreach ($p in @('SUPPRESSED bar=2026.09.08 09:40', 'SUPPRESSED bar=2026.09.08 09:50', 'SUPPRESSED bar=2026.09.08 10:05')) {
  foreach ($x in (pay1 $ARC $p)) { $supp.Add($x) }
}
$supp.Add('S2WAIT bar=2026.09.08 10:10 (no SUPPRESSED row at 10:10):')
foreach ($x in (pay1 $ARC 'S2WAIT bar=2026.09.08 10:10')) { $supp.Add($x) }
$rt = $rt.Replace('<!--SUPP-WIN-->', ($supp.ToArray() -join "`r`n"))
$s3 = New-Object System.Collections.Generic.List[string]
foreach ($x in (pay1 $ARC '11:25:00 STATE S2_LTF_ALIGN->S3_ZONE_WAIT')) { $s3.Add($x) }
foreach ($x in (pay1 $ARC 'CONFIRM_PREBIND_FAIL bar=2026.09.08 11:25')) { $s3.Add($x) }
foreach ($x in (pay1 $ARC '12:05:03 ABORT reason=SESSION_CLOSED')) { $s3.Add($x) }
$rt = $rt.Replace('<!--S3-WIN-->', ($s3.ToArray() -join "`r`n"))
[System.IO.File]::WriteAllText($R85, $rt, $utf8)
'done'
