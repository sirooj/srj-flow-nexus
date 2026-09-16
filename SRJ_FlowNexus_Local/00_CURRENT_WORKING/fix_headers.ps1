# Repair the two mojibake header lines with pure-ASCII replacements (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$R92 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v92-SPLIT-INVENTORY.md'
$L = [System.IO.File]::ReadAllLines($R92, $utf8)
$fixed = 0
for ($i = 0; $i -lt $L.Length; $i++) {
  if ($L[$i].Contains('## APPENDIX A')) {
    $L[$i] = '## APPENDIX A - Luna 003 operative authorship VERBATIM (sections 1-4; predictions/status/thresholds as summarized in v92 body section 1)'
    $fixed++
  }
  if ($L[$i].Contains('## APPENDIX B')) {
    $L[$i] = '## APPENDIX B - Sonnet v91 S2-desire + R2-workstream VERBATIM (the object of v92 Ask-2/Ask-3)'
    $fixed++
  }
}
[System.IO.File]::WriteAllLines($R92, $L, $utf8)
'FIXED-LINES=' + $fixed
$B = [System.IO.File]::ReadAllBytes($R92)
'BYTELEN=' + $B.Length
$vals = @{}
foreach ($b in $B) {
  if ($b -ge 128) {
    $k = $b.ToString()
    if ($vals.ContainsKey($k)) { $vals[$k] = $vals[$k] + 1 } else { $vals[$k] = 1 }
  }
}
'HIGH-BYTE-HISTOGRAM:'
foreach ($k in ($vals.Keys | Sort-Object)) { [string]('0x' + ([int]$k).ToString('X2') + '=' + $vals[$k]) }
