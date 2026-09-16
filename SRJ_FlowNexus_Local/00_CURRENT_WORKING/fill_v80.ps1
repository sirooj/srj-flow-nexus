# Fill v80 markers mechanically via pure .NET UTF-8 (zero transcription).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$EA = Join-Path $MQL5 'Experts\SRJ_FlowNexus_EA.mq5'
$BRIEF = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_BRIEF_BIRTH-STAGED.md'
$COMP = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_SNIPPET_V80DE_WHOLE.md'
$R80 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v80-DE-EVIDENCE.md'
function reg($a,$b) {
  $L = [System.IO.File]::ReadAllLines($EA, $utf8)
  $o = New-Object System.Collections.Generic.List[string]
  for ($n = $a; $n -le $b; $n++) { $o.Add(('{0}: {1}' -f $n, $L[$n - 1])) }
  return $o.ToArray()
}
$ct = [System.IO.File]::ReadAllText($COMP, $utf8)
$ct = $ct.Replace('<!--R-F-->', ((reg 8428 8459) -join "`r`n"))
$ct = $ct.Replace('<!--R-G-->', ((reg 9389 9461) -join "`r`n"))
[System.IO.File]::WriteAllText($COMP, $ct, $utf8)
$rt = [System.IO.File]::ReadAllText($R80, $utf8)
$brief = [System.IO.File]::ReadAllText($BRIEF, $utf8).Trim()
$rt = $rt.Replace('<!--BRIEF-->', $brief)
[System.IO.File]::WriteAllText($R80, $rt, $utf8)
'v80-check: run the byte scan below after this fill'
