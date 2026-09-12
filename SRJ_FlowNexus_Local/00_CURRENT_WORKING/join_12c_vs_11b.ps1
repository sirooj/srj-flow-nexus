$j11='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON11b-SLDEF_JOURNAL.log'
$jb='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON12c-NEWS_JOURNAL.log'
$out='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON12c_GATE3_JOIN.txt'
function Tok($line){ $d=@{}; foreach($m in ([regex]::Matches($line,' ([A-Za-z]+)=(\S+)'))){ $d[$m.Groups[1].Value]=$m.Groups[2].Value }; return $d }
function Join($pat11,$pat12,$keys,$label){
  $old=@{}; $new=@{}
  foreach($m in (Select-String -LiteralPath $j11 -Pattern $pat11)){ $old[$m.Matches[0].Groups[1].Value+'|'+$m.Matches[0].Groups[2].Value]=(Tok $m.Line) }
  foreach($m in (Select-String -LiteralPath $jb -Pattern $pat12)){ $new[$m.Matches[0].Groups[1].Value+'|'+$m.Matches[0].Groups[2].Value]=(Tok $m.Line) }
  $match=0; $mm=@(); $missN=@(); $missO=@()
  foreach($k in $old.Keys){
    if(-not $new.ContainsKey($k)){ $missN+=($k); continue }
    $diff=@()
    foreach($tk in $keys){ if($old[$k][$tk] -ne $new[$k][$tk]){ $diff+=($tk+':'+$old[$k][$tk]+'->'+$new[$k][$tk]) } }
    if($diff.Count -eq 0){ $match++ } else { $mm+=($k+' ['+($diff -join ',')+']') }
  }
  foreach($k in $new.Keys){ if(-not $old.ContainsKey($k)){ $missO+=($k) } }
  return @($label+'_OLD_N='+($old.Count)+' '+$label+'_NEW_N='+($new.Count)+' IDENTICAL='+($match)+' MISMATCH='+($mm.Count)+' '+($mm -join ' | ')+' MISS_NEW='+($missN.Count)+' '+($missN -join ' | ')+' MISS_OLD='+($missO.Count)+' '+($missO -join ' | '))
}
$r=@()
$slimbKeys=@('dir','branch','obValid','slRef','slShift','latestFlag','latestShift','latestAvail','latestApexMatch','chosenFlag','chosenShift','chosenAvail','nuanceClass')
$r+=(Join 'SLIMB fields=19 bar=(\S+ \S+) site=(\S+)' 'SLIMB fields=19 bar=(\S+ \S+) site=(\S+)' $slimbKeys 'SLIMB')
$obKeys=@('dir','branch','slToday','slBase','slNuance','deltaBasePts','deltaNuancePts','walkSteps','code2Seen','exhausted','skipShift','skipVal','skipFlag','bodyExt','extUpdatedByNonQual','code3Seen','sideViolations','todayEqBase','todayEqNuance','baseEqNuance','class','outwardBasePts','outwardNuancePts')
$r+=(Join 'SLIMBWALK fields=27 bar=(\S+ \S+) site=(\S+)' 'SLIMBWALK fields=27 bar=(\S+ \S+) site=(\S+)' $obKeys 'WALKOB')
$frKeys=@('dir','branch','fracAnchorShift','fracAnchorFlag','slFractal','slFractalNuance','deltaFracPts','deltaFracNuancePts','fracSteps','fracCode2','fracExh','fracC3','fracExtNQ','fracClass','sideFracViolations','outwardFracPts','outwardFracNuancePts','fracAnchorRawShift','fracAnchorRawSide','fracAnchorGuardApplied','fracAnchorShiftT','fracSkip','fracSkipT')
$r+=(Join 'SLIMBWALKF fields=25 bar=(\S+ \S+) site=(\S+)' 'SLIMBWALKF fields=25 bar=(\S+ \S+) site=(\S+)' $frKeys 'WALKFR')
$srKeys=@('dir','entry','tp','slToday','rToday','slBase','rBase','dBasePts','slNuance','rNuance','dNuancePts','slFractal','rFractal','dFracPts','slFractalNuance','rFractalNuance','dFracNuancePts','class','fracClass')
$old=@{}; $new=@{}
foreach($m in (Select-String -LiteralPath $j11 -Pattern 'SLIMBR bar=(\S+ \S+) dir=')){ $old[$m.Matches[0].Groups[1].Value]=(Tok $m.Line) }
foreach($m in (Select-String -LiteralPath $jb -Pattern 'SLIMBR bar=(\S+ \S+) dir=')){ $new[$m.Matches[0].Groups[1].Value]=(Tok $m.Line) }
$match=0; $mm=@()
foreach($k in $old.Keys){
  if($new.ContainsKey($k)){
    $diff=@()
    foreach($tk in $srKeys){ if($old[$k][$tk] -ne $new[$k][$tk]){ $diff+=($tk+':'+$old[$k][$tk]+'->'+$new[$k][$tk]) } }
    if($diff.Count -eq 0){ $match++ } else { $mm+=($k+' ['+($diff -join ',')+']') }
  }
}
$r+=('SLIMBR_OLD_N='+($old.Count)+' SLIMBR_NEW_N='+($new.Count)+' IDENTICAL='+($match)+' MISMATCH='+($mm.Count)+' '+($mm -join ' | '))
$r | Set-Content -LiteralPath $out
Get-Content -LiteralPath $out
