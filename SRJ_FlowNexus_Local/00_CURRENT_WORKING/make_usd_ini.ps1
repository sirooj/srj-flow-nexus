# make_usd_ini.ps1 - RECON44_DEMO_P1.ini copy with single-line Currency delta (asserted)
$ErrorActionPreference = 'Stop'
$W = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Src = Join-Path $W 'RECON44_DEMO_P1.ini'
$Dst = Join-Path $W 'RECON50_DEMO_USD.ini'
if (Test-Path -LiteralPath $Dst) { throw 'collision' }
$lines = [IO.File]::ReadAllLines($Src)
"SRC_LINES=$($lines.Count)"
$ci = -1
for ($i = 0; $i -lt $lines.Count; $i++) { if ($lines[$i] -eq 'Currency=JPY') { $ci = $i } }
if ($ci -lt 0) { throw 'Currency=JPY not found' }
"SRC_CURRENCY_LINE=$($ci+1)"
$dep = @()
for ($i = 0; $i -lt $lines.Count; $i++) { if ($lines[$i].StartsWith('Deposit=')) { $dep += "$($i+1):$($lines[$i])" } }
"SRC_DEPOSIT=$($dep -join ',')"
$lines[$ci] = 'Currency=USD'
[IO.File]::WriteAllLines($Dst, $lines)
$s1 = [IO.File]::ReadAllLines($Src); $s2 = [IO.File]::ReadAllLines($Dst)
$diff = @()
for ($i = 0; $i -lt $s1.Count; $i++) { if ($s1[$i] -cne $s2[$i]) { $diff += ($i + 1) } }
"DIFF_LINES=$($diff -join ',') COUNT=$($diff.Count)"
if ($diff.Count -ne 1 -or $diff[0] -ne ($ci + 1)) { throw 'not-single-line' }
"SRC_DIGEST=" + (Get-FileHash -LiteralPath $Src -Algorithm SHA256).Hash
"DST_DIGEST=" + (Get-FileHash -LiteralPath $Dst -Algorithm SHA256).Hash
Get-Content -LiteralPath $Dst
