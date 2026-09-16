# Verify v93: markers gone, quotes present, byte audit (mechanical).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$R93 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v93-ANSWERS-AUTHOR.md'
$T = [System.IO.File]::ReadAllText($R93, $utf8)
'MARKERS=' + $T.Contains('<!--')
'QA=' + $T.Contains('fliped the bias short at 16:35 candle open')
'QB=' + $T.Contains('only consider A+ setup')
'LUNA-ASK=' + $T.Contains('Ask-1 (Luna)')
'CQD-SCOPE=' + $T.Contains('Ask-2 (Luna)')
$L = [System.IO.File]::ReadAllLines($R93, $utf8)
'RAW-LINES=' + $L.Length
$B = [System.IO.File]::ReadAllBytes($R93)
'BOM=' + $B[0].ToString('X2') + $B[1].ToString('X2') + $B[2].ToString('X2')
$c3 = 0
foreach ($b in $B) { if ($b -eq 195) { $c3++ } }
'C3-COUNT=' + $c3
