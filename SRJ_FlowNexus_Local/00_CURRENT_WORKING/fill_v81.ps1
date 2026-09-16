# Fill v81 companion markers mechanically via pure .NET UTF-8 (zero transcription).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$EA = Join-Path $MQL5 'Experts\SRJ_FlowNexus_EA.mq5'
$COMP = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_SNIPPET_V81DET_WHOLE.md'
function reg($a,$b) {
  $L = [System.IO.File]::ReadAllLines($EA, $utf8)
  $o = New-Object System.Collections.Generic.List[string]
  for ($n = $a; $n -le $b; $n++) { $o.Add(('{0}: {1}' -f $n, $L[$n - 1])) }
  return $o.ToArray()
}
$ct = [System.IO.File]::ReadAllText($COMP, $utf8)
$ct = $ct.Replace('<!--R-H-->', ((reg 1894 1948) -join "`r`n"))
$ct = $ct.Replace('<!--R-I-->', ((reg 91 105) -join "`r`n"))
$ct = $ct.Replace('<!--R-J-->', ((reg 6165 6192) -join "`r`n"))
$ct = $ct.Replace('<!--R-K-->', ((reg 6698 6710) -join "`r`n"))
[System.IO.File]::WriteAllText($COMP, $ct, $utf8)
'done'
