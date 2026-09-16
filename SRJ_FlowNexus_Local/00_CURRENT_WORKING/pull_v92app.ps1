# Pull verbatim appendix cores for v92 (mechanical, zero transcription).
$MQL5 = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$utf8 = [System.Text.Encoding]::UTF8
$VA = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md'
$VS = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md'
$R92 = Join-Path $MQL5 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v92-SPLIT-INVENTORY.md'
$la = [System.IO.File]::ReadAllLines($VA, $utf8)
# Luna 003 sections 1-4: from '# 1. Authored fix' to before '# 5. Seven-row'
$i1 = -1; $i5 = -1
for ($i = 0; $i -lt $la.Length; $i++) {
  if ($la[$i] -eq '# 1. Authored fix: `STAGE-D-CONDSTOP-003`') { $i1 = $i }
}
for ($i = $i1 + 1; $i -lt $la.Length; $i++) {
  if ($la[$i] -eq '# 5. Seven-row predictions') { $i5 = $i; break }
}
if ($i1 -lt 0 -or $i5 -lt 0 -or $i5 -le $i1) { throw 'LUNA-MARKERS-MISSING' }
'luna lines=' + ($i5 - $i1)
$ls = [System.IO.File]::ReadAllLines($VS, $utf8)
# Sonnet v91 S2 + R2 sections: header line to before '## What I would suggest'
$j0 = -1; $j1 = -1
for ($i = 0; $i -lt $ls.Length; $i++) {
  if ($ls[$i].StartsWith('## The question I think actually needs asking')) { $j0 = $i }
  if ($j0 -ge 0 -and $ls[$i].StartsWith("## What I'd suggest")) { $j1 = $i; break }
}
if ($j0 -lt 0 -or $j1 -lt 0 -or $j1 -le $j0) { throw 'SONNET-MARKERS-MISSING' }
'sonnet lines=' + ($j1 - $j0)
$app = New-Object System.Collections.Generic.List[string]
$app.Add('## APPENDIX A — Luna 003 operative authorship VERBATIM (sections 1-4; predictions/status/thresholds as summarized in v92 body section 1)')
$app.Add('')
for ($i = $i1; $i -lt $i5; $i++) { $app.Add($la[$i]) }
$app.Add('')
$app.Add('## APPENDIX B — Sonnet v91 S2-desire + R2-workstream VERBATIM (the object of v92 Ask-2/Ask-3)')
$app.Add('')
for ($i = $j0; $i -lt $j1; $i++) { $app.Add($ls[$i]) }
$rt = [System.IO.File]::ReadAllText($R92, $utf8)
$rlines = [System.IO.File]::ReadAllLines($R92, $utf8)
$tail = $rlines[$rlines.Length - 1]
if (-not $tail.StartsWith('(End')) { throw 'RELAY-TAIL-MISSING' }
$rt = $rt.Replace($tail, (($app.ToArray() -join "`r`n") + "`r`n`r`n" + $tail))
[System.IO.File]::WriteAllText($R92, $rt, $utf8)
'appended appendix lines=' + $app.Count
