# Fill v93 quote markers from the filed finding (mechanical, ASCII patterns).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$noBom = New-Object System.Text.UTF8Encoding($false)
$SRC = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_SEP8_MANUAL_REVIEW.md'
$R93 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v93-ANSWERS-AUTHOR.md'
$qa = Select-String -LiteralPath $SRC -Pattern 'fliped the bias short at' -SimpleMatch | Select-Object -First 1
$qb = Select-String -LiteralPath $SRC -Pattern 'only consider A\+ setup' | Select-Object -First 1
if ($null -eq $qa) { throw 'QA-QUOTE-MISSING' }
if ($null -eq $qb) { throw 'QB-QUOTE-MISSING' }
'QA-LINE=' + $qa.LineNumber + ' QB-LINE=' + $qb.LineNumber
$rt = [System.IO.File]::ReadAllText($R93, $utf8)
$rt = $rt.Replace('<!--R-QA-->', '> ' + $qa.Line)
$rt = $rt.Replace('<!--R-QB-->', '> ' + $qb.Line)
[System.IO.File]::WriteAllText($R93, $rt, $noBom)
'done'
