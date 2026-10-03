$ErrorActionPreference = 'Stop'
$root = 'SRJ_FlowNexus_Local'
$packet = Join-Path $root '01_TASKS/PACKET_P-RECON74FIX-2v39.md'
$relay = Join-Path $root '06_HANDOFFS/BUILDER_RELAY_COUNCIL_v389-UJEXEMPT-26.md'
$prevRelay = Join-Path $root '06_HANDOFFS/BUILDER_RELAY_COUNCIL_v388-UJEXEMPT-25.md'
$grade = Join-Path $root '06_HANDOFFS/BUILDER_RESULT_V388-GRADE.md'
$sonFile = Join-Path $root '06_HANDOFFS/BUILDER_VERDICTS_SONNET.md'
$glmFile = Join-Path $root '06_HANDOFFS/BUILDER_VERDICTS_GLM.md'
$sonAtt = 'C:\Users\winar\.codex\attachments\4c1c4bd5-4d0c-410a-a4cc-ec91cd13550a\Pasted text.txt'
$glmAtt = 'C:\Users\winar\.codex\attachments\93f3a407-c180-430d-81b1-642a29c2cff2\Pasted text.txt'
$ea = 'Experts/SRJ_FlowNexus_EA.mq5'
$pText = [IO.File]::ReadAllText((Resolve-Path $packet), [Text.Encoding]::UTF8)
$rText = [IO.File]::ReadAllText((Resolve-Path $relay), [Text.Encoding]::UTF8)
$p = [IO.File]::ReadAllLines((Resolve-Path $packet), [Text.Encoding]::UTF8)
$r = [IO.File]::ReadAllLines((Resolve-Path $relay), [Text.Encoding]::UTF8)
$old = [IO.File]::ReadAllLines((Resolve-Path $prevRelay), [Text.Encoding]::UTF8)
$e = [IO.File]::ReadAllLines((Resolve-Path $ea), [Text.Encoding]::UTF8)
if ($p.Length -ne 184 -or $r.Length -ne 390) { throw "line counts packet=$($p.Length), relay=$($r.Length)" }
$ph = (Get-FileHash $packet -Algorithm SHA256).Hash
$rh = (Get-FileHash $relay -Algorithm SHA256).Hash
$gh = (Get-FileHash $grade -Algorithm SHA256).Hash
$eh = (Get-FileHash $ea -Algorithm SHA256).Hash
$pb = (Get-Item $packet).Length
$rb = (Get-Item $relay).Length
$eb = (Get-Item $ea).Length
if ($ph -ne '22EE2F233F825F7681442BE6E42AF83DFC412B405D84D5341381BBF7BC15EDE0') { throw "packet hash mismatch: $ph" }
if ($eh -ne '977B0FB597F880C46BEB824937669F863C4452C48A6F9FA506311F04267B414E') { throw "EA hash changed: $eh" }
if ($e.Length -ne 12295 -or $eb -ne 684499) { throw 'EA size/line mismatch' }
if (-not $r[1].Contains($ph) -or -not $r[1].Contains("$pb bytes / 184 physical lines") -or -not $r[1].Contains($gh) -or -not $r[1].Contains($eh) -or -not $r[1].Contains("$eb bytes / $($e.Length) lines")) { throw 'Status metadata mismatch' }
if ($r[0] -notmatch 'v389-UJEXEMPT-26.*v39' -or $r[10] -notmatch 'V389.*v39' -or $r[58] -notmatch 'v39.*P001-P184' -or $p[0] -notmatch 'v39' -or $p[2] -notmatch 'v39 DRAFT' -or $p[169] -notmatch 'Fold map \(V388') { throw 'Four-label/section label mismatch' }
$twinErrors = 0
for ($i=0; $i -lt 184; $i++) { if ($r[59+$i] -cne (('P{0:D3}: ' -f ($i+1)) + $p[$i])) { $twinErrors++ } }
$pseq = @($r | Where-Object { $_ -match '^P\d{3}: ' })
if ($twinErrors -ne 0 -or $pseq.Count -ne 184) { throw "Twin/PSEQ mismatch=$twinErrors count=$($pseq.Count)" }
$codeLines = @($r | Where-Object { $_ -match '^EA (\d{3,5}): ' })
$codeErrors = 0
foreach ($line in $codeLines) {
    if ($line -match '^EA (\d{3,5}): (.*)$') {
        $n = [int]$Matches[1]
        if ($n -lt 1 -or $n -gt $e.Length -or $Matches[2] -cne $e[$n-1]) { $codeErrors++ }
    }
}
$codeDistinct = @($codeLines | ForEach-Object { if ($_ -match '^EA (\d{3,5}):') { $Matches[1] } } | Sort-Object -Unique).Count
if ($codeLines.Count -ne 107 -or $codeDistinct -ne 101 -or $codeErrors -ne 0) { throw "EA region mismatch lines=$($codeLines.Count) distinct=$codeDistinct errors=$codeErrors" }
$rows = @($r | Where-Object { $_ -match '^R\d{2} ' })
$oldRows = @($old | Where-Object { $_ -match '^R\d{2} ' })
$rowErrors = 0
for ($i=0; $i -lt 28; $i++) { if ($rows[$i] -cne $oldRows[$i]) { $rowErrors++ } }
if ($rows.Count -ne 28 -or $oldRows.Count -ne 28 -or $rowErrors -ne 0) { throw "row mismatch current=$($rows.Count) prior=$($oldRows.Count) errors=$rowErrors" }
$badCites = @($r | Select-String -Pattern '\bP(\d{3})\b' | ForEach-Object { foreach($m in [regex]::Matches($_.Line,'\bP(\d{3})\b')) { [int]$m.Groups[1].Value } } | Where-Object { $_ -lt 1 -or $_ -gt 184 })
if ($badCites.Count -ne 0) { throw "Out-of-range P cites: $($badCites -join ',')" }
if ($pText.Contains('...') -or $rText.Contains('...')) { throw 'Ellipsis found' }
if ($pText -match '[^\x00-\x7F]' -or $rText -match '[^\x00-\x7F]') { throw 'Unexpected non-ASCII in packet/relay prose' }
foreach ($f in @($packet,$relay)) { $b=[IO.File]::ReadAllBytes((Resolve-Path $f)); if ($b[-1] -ne 10 -or ($b | Where-Object { $_ -eq 13 }).Count -ne 0) { throw "Ending/CRLF check failed: $f" } }
foreach ($needle in @('otherwise NA-EXCLUDED','absent -> NA-EXCLUDED','P115''s M(B3)','SETUP-DEFINED','YLOH','V387 is required before any council clearance')) { if ($pText.Contains($needle) -or $rText.Contains($needle)) { throw "Retired phrase remains: $needle" } }
$sonBody = [IO.File]::ReadAllText($sonAtt).Trim("`r","`n")
$glmBody = [IO.File]::ReadAllText($glmAtt).Trim("`r","`n")
$sonDest = [IO.File]::ReadAllText($sonFile)
$glmDest = [IO.File]::ReadAllText($glmFile)
$key = 'V388-UJEXEMPT-25'
if (-not $sonDest.Contains($sonBody) -or -not $glmDest.Contains($glmBody)) { throw 'Filed attachment body differs from inbound' }
foreach ($pair in @(@($sonDest,'SONNET'),@($glmDest,'GLM'))) {
    if (([regex]::Matches($pair[0],[regex]::Escape("<!-- $key OPEN $($pair[1]) -->"))).Count -ne 1 -or ([regex]::Matches($pair[0],[regex]::Escape("<!-- $key END $($pair[1]) -->"))).Count -ne 1) { throw "Marker count failure: $($pair[1])" }
}
if ($sonDest.Contains("<!-- $key OPEN GLM -->") -or $glmDest.Contains("<!-- $key OPEN SONNET -->")) { throw 'Wrong-file marker found' }
$sonHash = (Get-FileHash $sonAtt -Algorithm SHA256).Hash
$glmHash = (Get-FileHash $glmAtt -Algorithm SHA256).Hash
if ($sonHash -ne '3678842C58FB9FB367718ABA35684AED2F44FC119582B804ECF3E6C4F648CD33' -or $glmHash -ne 'DFA1016C4A62A5DDA7F0E7340836E0D56A67239D4BC31A7824343D26C556B46B') { throw 'Attachment digest mismatch' }
if ((Get-Item $sonAtt).LastWriteTimeUtc -le (Get-Item $prevRelay).LastWriteTimeUtc -or (Get-Item $glmAtt).LastWriteTimeUtc -le (Get-Item $prevRelay).LastWriteTimeUtc) { throw 'Attachment freshness failed vs V388 relay' }
if (-not $rText.Contains($gh) -or -not $rText.Contains($ph) -or -not $rText.Contains($eh)) { throw 'Current digest occurrence missing from relay' }
"PASS packet=$ph bytes=$pb lines=$($p.Length); relay=$rh bytes=$rb lines=$($r.Length); twin-errors=$twinErrors PSEQ=$($pseq.Count)/184; EA-lines=$($codeLines.Count)/107 distinct=$codeDistinct byte-errors=$codeErrors; rows=$($rows.Count)/28 row-diff=$rowErrors; unresolved-cites=0 ellipsis=0; filed V388 markers=1/1 each, inbound hashes=$sonHash/$glmHash; grade=$gh; EA=$eh bytes=$eb lines=$($e.Length)"
