# Verify v92 appendix completeness (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$R92 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v92-SPLIT-INVENTORY.md'
$L = [System.IO.File]::ReadAllLines($R92, $utf8)
'RAW-LINES=' + $L.Length
$marks = @('## APPENDIX A', '# 2. R2 placement', '# 3. S2 placement', '# 4. Code placement', '## APPENDIX B', 'R2 capacity')
$found = 0
for ($i = 0; $i -lt $L.Length; $i++) {
  foreach ($mk in $marks) {
    if ($L[$i].Contains($mk)) { [string](($i + 1).ToString() + ':' + $mk); $found++ }
  }
}
'MARKS=' + $found
$nA = 0
foreach ($ch in [System.IO.File]::ReadAllText($R92, $utf8).ToCharArray()) {
  if ($ch -eq [char]0x00C2) { $nA++ }
}
'ACIRC=' + $nA
'tail=' + $L[$L.Length - 1]
