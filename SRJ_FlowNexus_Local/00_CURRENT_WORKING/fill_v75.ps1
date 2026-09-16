# Fill v75 relay appendix + companion regions mechanically from disk (zero transcription).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$EA = Join-Path $MQL5 'Experts\SRJ_FlowNexus_EA.mq5'
$ARC = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\C0-PROBE_JOURNAL.log'
$RELAY = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v75-C0-GRADE-AUTHOR.md'
$COMP = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_SNIPPET_V75COMP_WHOLE.md'
function pay($p) { Select-String -LiteralPath $ARC -Pattern $p -SimpleMatch | ForEach-Object { $l = $_.Line; $l.Substring($l.IndexOf($p)) } | Sort-Object }
function reg($a,$b) { $L = Get-Content -LiteralPath $EA; $o = @(); for ($n=$a; $n -le $b; $n++) { $o += ("{0}: {1}" -f $n, $L[$n-1]) }; $o }
$rt = Get-Content -LiteralPath $RELAY -Raw
$rt = $rt.Replace("<!--A1-TALLY-->", ((@(pay "SIDE1G_TALLY") + @(pay "SEL61LIVE") + @(pay "N1EQUALS") + @(pay "WS161_CENSUS")) -join "`r`n"))
$rt = $rt.Replace("<!--A2-SRC-->", ((pay "SIDE1P3_SRC") -join "`r`n"))
$rt = $rt.Replace("<!--A3-SIGNALS-->", ((pay "ALERT SRJ SIGNAL") -join "`r`n"))
$rt = $rt.Replace("<!--A4-SUPP-->", ((pay "SIDE1C_SUPP") -join "`r`n"))
$bd = pay "SIDE1C_BOTHDIRS"
$rt = $rt.Replace("<!--A5-BOTHDIRS-->", ($bd -join "`r`n"))
$ch = Select-String -LiteralPath $ARC -Pattern "SIDE1C_CHAIN" -SimpleMatch | ForEach-Object { $l = $_.Line; $l.Substring($l.IndexOf("SIDE1C_CHAIN")) } | Sort-Object
$ns = @(); foreach ($c in $ch) { $ns += [int]($c.Substring($c.IndexOf("chainN=")+7)) }
$mono = $true; for ($i=1; $i -lt $ns.Count; $i++) { if ($ns[$i] -le $ns[$i-1]) { $mono = $false } }
$chsum = @("CHAIN rows={0} unique={1} min={2} max={3} monotone={4}" -f $ch.Count, (@($ns | Sort-Object -Unique)).Count, ($ns | Measure-Object -Minimum).Minimum, ($ns | Measure-Object -Maximum).Maximum, $mono)
$rt = $rt.Replace("<!--A6-CHAIN-SUMMARY-->", ((@($chsum) + @($ch[0]) + @($ch[-1])) -join "`r`n"))
Set-Content -LiteralPath $RELAY -Value $rt -Encoding utf8
$ct = Get-Content -LiteralPath $COMP -Raw
$spans = @(@("<!--R-A-->",7532,7559),@("<!--R-B-->",7561,7638),@("<!--R-C-->",7639,7692),@("<!--R-D-->",3844,3854),@("<!--R-E-->",2079,2121))
foreach ($s in $spans) { $ct = $ct.Replace($s[0], ((reg $s[1] $s[2]) -join "`r`n")) }
Set-Content -LiteralPath $COMP -Value $ct -Encoding utf8
'RELAY markers-left={0}' -f ((Select-String -LiteralPath $RELAY -Pattern "<!--A[0-9]" | Measure-Object).Count)
'COMP markers-left={0}' -f ((Select-String -LiteralPath $COMP -Pattern "<!--R-" | Measure-Object).Count)
'BOTHDIRS-in-relay={0}' -f ((Select-String -LiteralPath $RELAY -Pattern "SIDE1C_BOTHDIRS" -SimpleMatch | Measure-Object).Count)
'COMP-numbered-A={0} B={1} C={2} D={3} E={4}' -f ((Select-String -LiteralPath $COMP -Pattern "^7532: " | Measure-Object).Count), ((Select-String -LiteralPath $COMP -Pattern "^7561: " | Measure-Object).Count), ((Select-String -LiteralPath $COMP -Pattern "^7639: " | Measure-Object).Count), ((Select-String -LiteralPath $COMP -Pattern "^3844: " | Measure-Object).Count), ((Select-String -LiteralPath $COMP -Pattern "^2079: " | Measure-Object).Count)
