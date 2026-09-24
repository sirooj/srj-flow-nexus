# splice_relayv269.ps1 - build v269 relay by swapping the v11 packet twin into the v268 skeleton.
# ASCII-only. Straight-line code (no value-returning functions). Count-asserts beside every output.
$relayPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v268-RESQUAT-CLEAR9.md'
$packetPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-RESQUAT-1.md'
$outPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v269-RESQUAT-CLEAR10.md'
$relayLines = [System.IO.File]::ReadAllLines($relayPath)
$packetLines = [System.IO.File]::ReadAllLines($packetPath)
echo RELAY-COUNT
$relayLines.Count
echo PACKET-COUNT
$packetLines.Count
$beginIdx = -1
$endIdx = -1
$scan = 0
foreach ($lineText in $relayLines) { if ($lineText.StartsWith('--- PACKET P-RESQUAT-1 v10 TWIN BEGIN')) { $beginIdx = $scan; break }; $scan++ }
$scan = 0
foreach ($lineText in $relayLines) { if ($lineText.StartsWith('--- PACKET P-RESQUAT-1 v10 TWIN END')) { $endIdx = $scan; break }; $scan++ }
echo BEGIN-IDX
$beginIdx
echo END-IDX
$endIdx
$headList = New-Object System.Collections.Generic.List[string]
$tailList = New-Object System.Collections.Generic.List[string]
$k = 0
while ($k -le $beginIdx) { $headList.Add($relayLines[$k]); $k++ }
$k = $endIdx
while ($k -lt $relayLines.Count) { $tailList.Add($relayLines[$k]); $k++ }
echo HEAD-COUNT
$headList.Count
echo TAIL-COUNT
$tailList.Count
$headText = [string]::Join("`n", $headList)
$tailText = [string]::Join("`n", $tailList)
$headText = $headText.Replace('v268-RESQUAT-CLEAR9', 'v269-RESQUAT-CLEAR10')
$headText = $headText.Replace('v10 TWIN BEGIN', 'v11 TWIN BEGIN')
$tailText = $tailText.Replace('v268-RESQUAT-CLEAR9', 'v269-RESQUAT-CLEAR10')
$tailText = $tailText.Replace('v10 TWIN END', 'v11 TWIN END')
$outList = New-Object System.Collections.Generic.List[string]
foreach ($lineText in ($headText.Split("`n"))) { $outList.Add($lineText) }
foreach ($lineText in $packetLines) { $outList.Add($lineText) }
foreach ($lineText in ($tailText.Split("`n"))) { $outList.Add($lineText) }
echo OUT-COUNT
$outList.Count
echo EXPECTED
($headList.Count + $packetLines.Count + $tailList.Count)
[System.IO.File]::WriteAllLines($outPath, $outList.ToArray())
echo WROTE-COUNT
([System.IO.File]::ReadAllLines($outPath)).Count
echo TWIN-VERIFY
$checkLines = [System.IO.File]::ReadAllLines($outPath)
$cb = -1
$ce = -1
$scan = 0
foreach ($lineText in $checkLines) { if ($lineText.StartsWith('--- PACKET P-RESQUAT-1 v11 TWIN BEGIN')) { $cb = $scan; break }; $scan++ }
$scan = 0
foreach ($lineText in $checkLines) { if ($lineText.StartsWith('--- PACKET P-RESQUAT-1 v11 TWIN END')) { $ce = $scan; break }; $scan++ }
echo TWIN-BEGIN
$cb
echo TWIN-END
$ce
echo TWIN-SPAN
($ce - $cb - 1)
$miss = 0
$j = 0
while ($j -lt $packetLines.Count) { if ($checkLines[$cb + 1 + $j] -cne $packetLines[$j]) { $miss++ }; $j++ }
echo TWIN-MISMATCHES
$miss
