# Repair U+00C2 chars in v92 with ASCII hyphen (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$R92 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v92-SPLIT-INVENTORY.md'
$T = [System.IO.File]::ReadAllText($R92, $utf8)
$T2 = $T.Replace([string][char]0x00C2, '-')
[System.IO.File]::WriteAllText($R92, $T2, $utf8)
$nA = 0
foreach ($ch in $T2.ToCharArray()) { if ($ch -eq [char]0x00C2) { $nA++ } }
'ACIRC-AFTER=' + $nA
'APP-A=' + $T2.Contains('## APPENDIX A')
'APP-B=' + $T2.Contains('## APPENDIX B')
