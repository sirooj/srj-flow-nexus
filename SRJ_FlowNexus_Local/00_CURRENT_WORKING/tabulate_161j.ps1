# Tabulation for T161J (P-CQD-FLAGGATE + UNIFY verification) — copy of tabulate_161i.ps1 with
# T161J names; same divergence-stream counts for the like-for-like comparison against T161I.
param([string]$Journal = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\T161J_JOURNAL.log',
      [string]$OutDir  = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS')
$L = [System.IO.File]::ReadAllLines($Journal)
$ea = @($L | Where-Object { $_ -match '\[SRJ-EA\]' })
$O = New-Object System.Collections.Generic.List[string]
function Win([string]$s){ if($s -match 'bar=(2026\.08\.\d\d)'){ $d=$Matches[1]; if($d -eq '2026.08.17'){return 'W1_0817'}; if($d -eq '2026.08.19' -or $d -eq '2026.08.20'){return 'W2_081920'}; if($d -lt '2026.08.17'){return 'PRE'}; return 'POST' } return 'NOBAR' }
$O.Add("EA_LINES=$($ea.Count)")
$div = @($ea | Where-Object { $_ -match 'CQD DIV verdict=' })
$O.Add("CQD_DIV_CENSUS_COUNT=$($div.Count)")
foreach($v in @('=+1','=+2','=-1','=-2')){ $n=@($div | Where-Object { $_ -match [regex]::Escape("verdict$v ") }).Count; $O.Add("CQD_DIV_verdict$($v.Replace('=','_'))=$n") }
$d18 = @($div | Where-Object { $_ -match 'bar=2026\.08\.18' })
$O.Add("CQD_DIV_0818_COUNT=$($d18.Count)")
$d18 | ForEach-Object { if($_ -match 'bar=(2026\.08\.18 \d\d:\d\d)'){ $O.Add("CQD_DIV_0818: $($Matches[1])") } }
$O.Add("S5_WAIT_COUNT=$(@($ea | Where-Object { $_ -match 'S5 waiting' }).Count)")
$x1 = @($ea | Where-Object { $_ -match '\[SRJ-EA\] XOBINPLAY ' })
$O.Add("XOBINPLAY_CAPPED_COUNT=$($x1.Count)")
$x2 = @($ea | Where-Object { $_ -match 'XOBINPLAY2 ' })
$O.Add("XOBINPLAY2_UNCAPPED_COUNT=$($x2.Count)")
foreach($c in @('BOTH','LEGACYONLY','WIDEONLY','NEITHER')){ $n=@($x2 | Where-Object { $_ -match "cls2=$c\b" }).Count; $O.Add("CLS2_$c=$n") }
$r1=@($x2 | Where-Object { $_ -match 'reached2=1' }).Count; $r0=@($x2 | Where-Object { $_ -match 'reached2=0' }).Count
$O.Add("REACHED2_1=$r1 REACHED2_0=$r0")
$s3 = @($ea | Where-Object { $_ -match '\[SRJ-EA\] S3INPLAY ' })
$O.Add("S3INPLAY_COUNT=$($s3.Count) S3INPLAY_inPlay_1=$(@($s3 | Where-Object { $_ -match 'inPlay=1' }).Count)")
$xp = @($ea | Where-Object { $_ -match '\[SRJ-EA\] XOBPROMO ' }); $O.Add("XOBPROMO_COUNT=$($xp.Count)")
$sig = @($ea | Where-Object { $_ -match 'SRJ SIGNAL' }); $O.Add("SIGNAL_COUNT=$($sig.Count) (record-only)"); $sig | ForEach-Object { $O.Add("SIGNAL: $_") }
$O.Add("WS161_LOAD_COUNT=$(@($ea | Where-Object { $_ -match 'WS161_LOAD' }).Count)")
$mm=@($ea | Where-Object { $_ -match 'WS161_MISMATCH' }); $O.Add("WS161_MISMATCH_COUNT=$($mm.Count)")
$mm | ForEach-Object { $O.Add("MISMATCH: $_") }
$wc=@($ea | Where-Object { $_ -match 'WS161_CENSUS' }); $O.Add("WS161_CENSUS_LINES=$($wc.Count)"); $wc | ForEach-Object { $O.Add("WS161: $_") }
$bf=@($L | Where-Object { $_ -match 'BIASCENSUS_FINAL' }); $O.Add("BIASCENSUS_FINAL=$($bf.Count)"); $bf | ForEach-Object { $O.Add("BF: $_") }
$O.Add("XOB_PROMOCENSUS_COUNT=$(@($L | Where-Object { $_ -match 'XOB-PROMOCENSUS' }).Count)")
$of=@(Join-Path $OutDir 'T161J_TABULATION.txt'); [System.IO.File]::WriteAllLines($of, $O, (New-Object System.Text.UTF8Encoding($true)))
"TABULATION_WRITTEN=$of ($($O.Count) lines)"