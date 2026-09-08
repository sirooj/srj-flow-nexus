# Tabulation for 161-REG/STEP 0 — parses the tester journal, emits absolute counts.
param([string]$Journal = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\Tester\logs\20260908.log',
      [string]$OutDir  = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS')
$L = [System.IO.File]::ReadAllLines($Journal)
$ea = @($L | Where-Object { $_ -match '\[SRJ-EA\]' })
$O = New-Object System.Collections.Generic.List[string]
function Win([string]$s){ if($s -match 'bar=(2026\.08\.\d\d)'){ $d=$Matches[1]; if($d -eq '2026.08.17'){return 'W1_0817'}; if($d -eq '2026.08.19' -or $d -eq '2026.08.20'){return 'W2_081920'}; if($d -lt '2026.08.17'){return 'PRE'}; return 'POST' } return 'NOBAR' }
$O.Add("EA_LINES=$($ea.Count)")
$x1 = @($ea | Where-Object { $_ -match '\[SRJ-EA\] XOBINPLAY ' })
$O.Add("XOBINPLAY_CAPPED_COUNT=$($x1.Count)")
foreach($k in @('capHit=1','legacy=1','widened=1','flip=1','bounded=0')){ $c=@($x1 | Where-Object { $_ -match [regex]::Escape($k) }).Count; $O.Add("XOBINPLAY_$($k.Replace('=','_'))=$c") }
$x2 = @($ea | Where-Object { $_ -match 'XOBINPLAY2 ' })
$O.Add("XOBINPLAY2_UNCAPPED_COUNT=$($x2.Count)")
foreach($c in @('BOTH','LEGACYONLY','WIDEONLY','NEITHER')){ $n=@($x2 | Where-Object { $_ -match "cls2=$c\b" }).Count; $O.Add("CLS2_$c=$n") }
$n1=@($x2 | Where-Object { $_ -match 'cls1=LEGACYONLY\b' }).Count; $O.Add("CLS1_LEGACYONLY=$n1")
$r1=@($x2 | Where-Object { $_ -match 'reached2=1' }).Count; $r0=@($x2 | Where-Object { $_ -match 'reached2=0' }).Count
$O.Add("REACHED2_1=$r1 REACHED2_0=$r0")
$c1=@($x2 | Where-Object { $_ -match 'capHit=1' }).Count; $O.Add("XOBINPLAY2_capHit_1=$c1")
foreach($lbl in @('W1_0817','W2_081920')){ $w=@($x2 | Where-Object { (Win $_) -eq $lbl }); foreach($c in @('BOTH','LEGACYONLY','WIDEONLY','NEITHER')){ $n=@($w | Where-Object { $_ -match "cls2=$c\b" }).Count; $O.Add("CLS2_${lbl}_$c=$n") }; $z=@($w | Where-Object { $_ -match 'reached2=0' }).Count; $O.Add("REACHED2_0_${lbl}=$z") }
$s3 = @($ea | Where-Object { $_ -match '\[SRJ-EA\] S3INPLAY ' })
$O.Add("S3INPLAY_COUNT=$($s3.Count)")
$O.Add("S3INPLAY_inPlay_1=$(@($s3 | Where-Object { $_ -match 'inPlay=1' }).Count)")
$O.Add("S3INPLAY_inPlay_0=$(@($s3 | Where-Object { $_ -match 'inPlay=0' }).Count)")
foreach($v in @('BAR','SWING1','SWING2')){ $O.Add("S3INPLAY_via_$v=$(@($s3 | Where-Object { $_ -match "via=$v\b" }).Count)") }
$zp = @($ea | Where-Object { $_ -match '\[SRJ-EA\] ZONEPICK ' })
$O.Add("ZONEPICK_COUNT=$($zp.Count)")
$O.Add("ZONEPICK_haveFvg_1=$(@($zp | Where-Object { $_ -match 'haveFvg=1' }).Count)")
$O.Add("ZONEPICK_downgraded_1=$(@($zp | Where-Object { $_ -match 'downgraded=1' }).Count)")
$za = @($ea | Where-Object { $_ -match '\[SRJ-EA\] ZONEADOPT ' })
$O.Add("ZONEADOPT_COUNT=$($za.Count)")
$zi = @($ea | Where-Object { $_ -match '\[SRJ-EA\] ZONEID ' })
$O.Add("ZONEID_COUNT=$($zi.Count) ZONEID_promoT_unset=$(@($zi | Where-Object { $_ -match 'promoT=unset' }).Count)")
$xp = @($ea | Where-Object { $_ -match '\[SRJ-EA\] XOBPROMO ' }); $O.Add("XOBPROMO_COUNT=$($xp.Count)")
$sl = @($ea | Where-Object { $_ -match '\[SRJ-EA\] SLSRC ' })
$O.Add("SLSRC_COUNT=$($sl.Count)")
$O.Add("SLSRC_1swing=$(@($sl | Where-Object { $_ -match 'sl_mode=1-swing' }).Count) SLSRC_2swing=$(@($sl | Where-Object { $_ -match 'sl_mode=2-swing' }).Count)")
$trio=@($sl | Where-Object { $_ -match 'obStruct=([-0-9.]+) obSwing=([-0-9.]+) zoneLo=([-0-9.]+)' -and $Matches[1] -eq $Matches[2] -and $Matches[2] -eq $Matches[3] }).Count
$O.Add("SLSRC_obStruct_eq_obSwing_eq_zoneLo=$trio")
$O.Add("SLSIDEGUARD_COUNT=$(@($ea | Where-Object { $_ -match 'SLSIDEGUARD' }).Count)")
$O.Add("SLSIDEGUARD_noProtectiveSideSwing=$(@($ea | Where-Object { $_ -match 'SLSIDEGUARD' -and $_ -match 'noProtectiveSideSwing' }).Count)")
$O.Add("SLZONEGUARD_COUNT=$(@($ea | Where-Object { $_ -match 'SLZONEGUARD' }).Count)")
$O.Add("SLZONEGUARD_noSwingOutsideZone=$(@($ea | Where-Object { $_ -match 'SLZONEGUARD' -and $_ -match 'noSwingOutsideZone' }).Count)")
$sig = @($ea | Where-Object { $_ -match 'SRJ SIGNAL' }); $O.Add("SIGNAL_COUNT=$($sig.Count) (record-only)"); $sig | ForEach-Object { $O.Add("SIGNAL: $_") }
$O.Add("WS161_LOAD_COUNT=$(@($ea | Where-Object { $_ -match 'WS161_LOAD' }).Count)")
$mm=@($ea | Where-Object { $_ -match 'WS161_MISMATCH' }); $O.Add("WS161_MISMATCH_COUNT=$($mm.Count)")
$mm | ForEach-Object { $O.Add("MISMATCH: $_") }
$O.Add("WS161_CENSUS_LINES=$(@($ea | Where-Object { $_ -match 'WS161_CENSUS' }).Count)")
$bf=@($L | Where-Object { $_ -match 'BIASCENSUS_FINAL' }); $O.Add("BIASCENSUS_FINAL=$($bf.Count)"); $bf | ForEach-Object { $O.Add("BF: $_") }
$O.Add("XOB_PROMOCENSUS_COUNT=$(@($L | Where-Object { $_ -match 'XOB-PROMOCENSUS' }).Count)")
$of=@(Join-Path $OutDir 'T161REG_TABULATION.txt'); [System.IO.File]::WriteAllLines($of, $O, (New-Object System.Text.UTF8Encoding($true)))
$of2=@(Join-Path $OutDir 'T161REG_JOURNAL.log'); [System.IO.File]::Copy($Journal, $of2, $true)
"TABULATION_WRITTEN=$of ($($O.Count) lines) JOURNAL_COPIED=$of2 ($($L.Count) lines)"