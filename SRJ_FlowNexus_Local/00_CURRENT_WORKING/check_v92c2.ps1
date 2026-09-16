# Inspect v92 head/tail/appendix presence via raw read (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$R92 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v92-SPLIT-INVENTORY.md'
$B = [System.IO.File]::ReadAllBytes($R92)
'BYTELEN=' + $B.Length
$L = [System.IO.File]::ReadAllLines($R92, $utf8)
'RAW-LINES=' + $L.Length
'HEAD0=' + $L[0]
$n1 = 0
$n2 = 0
$n3 = 0
foreach ($ln in $L) {
  if ($ln.Contains('ONE trip')) { $n1++ }
  if ($ln.Contains('APPENDIX')) { $n2++ }
  if ($ln.Contains('PASTE SET') -or $ln.Contains('TWO pastes')) { $n3++ }
}
'ONE-trip-lines=' + $n1 + ' APPENDIX-lines=' + $n2 + ' PASTE-lines=' + $n3
'tail=' + $L[$L.Length - 1]
