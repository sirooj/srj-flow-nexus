$j11='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON11-SLDEF_JOURNAL.log'
$jb='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON11b-SLDEF_JOURNAL.log'
$out='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\RECON11b_GATE4_JOIN.txt'
function Tok($line){ $d=@{}; foreach($m in ([regex]::Matches($line,' ([A-Za-z]+)=(\S+)'))){ $d[$m.Groups[1].Value]=$m.Groups[2].Value }; return $d }
$obKeys=@('dir','branch','slToday','slBase','slNuance','deltaBasePts','deltaNuancePts','walkSteps','code2Seen','exhausted','skipShift','skipVal','skipFlag','bodyExt','extUpdatedByNonQual','code3Seen','todayEqBase','todayEqNuance','baseEqNuance','class','outwardBasePts','outwardNuancePts')
$old=@{}; $oldSide=@{}
foreach($m in (Select-String -LiteralPath $j11 -Pattern 'SLIMBWALK fields=39 bar=(\S+ \S+) site=(\S+)')){
  $k=$m.Matches[0].Groups[1].Value+'|'+$m.Matches[0].Groups[2].Value
  $old[$k]=(Tok $m.Line); $oldSide[$k]=$old[$k]['sideViolations']
}
$new=@{}; $newSide=@{}; $guard=@{}
foreach($m in (Select-String -LiteralPath $jb -Pattern 'SLIMBWALK fields=27 bar=(\S+ \S+) site=(\S+)')){
  $k=$m.Matches[0].Groups[1].Value+'|'+$m.Matches[0].Groups[2].Value
  $new[$k]=(Tok $m.Line); $newSide[$k]=$new[$k]['sideViolations']
}
foreach($m in (Select-String -LiteralPath $jb -Pattern 'SLIMBWALKF fields=25 bar=(\S+ \S+) site=(\S+).*fracAnchorGuardApplied=1')){
  $guard[$m.Matches[0].Groups[1].Value+'|'+$m.Matches[0].Groups[2].Value]=1
}
$r=@()
$r+=('OLD_N='+($old.Count)+' NEW_N='+($new.Count))
$match=0; $mm=@(); $missOld=@(); $missNew=@(); $truncOld=0
foreach($k in $old.Keys){
  if(-not $new.ContainsKey($k)){ $missNew+=($k); continue }
  $diff=@()
  foreach($tk in $obKeys){
    if($old[$k][$tk] -ne $new[$k][$tk]){
      if(($tk -eq 'outwardBasePts' -or $tk -eq 'outwardNuancePts') -and [string]::IsNullOrEmpty($old[$k][$tk])){ $truncOld++ }
      else { $diff+=($tk+':'+$old[$k][$tk]+'->'+$new[$k][$tk]) }
    }
  }
  if($diff.Count -eq 0){ $match++ } else { $mm+=($k+' ['+($diff -join ',')+']') }
}
foreach($k in $new.Keys){ if(-not $old.ContainsKey($k)){ $missOld+=($k) } }
$r+=('OB_IDENTICAL_N='+$match)
$r+=('OB_MISMATCH_N='+($mm.Count))
$r+=('OB_MISMATCH_ROWS='+($mm -join ' | '))
$r+=('OB_TRUNC_OLD_OUTWARD_CELLS='+($truncOld))
$r+=('MISSING_IN_NEW_N='+($missNew.Count)+' '+($missNew -join ' | '))
$r+=('MISSING_IN_OLD_N='+($missOld.Count)+' '+($missOld -join ' | '))
$sd=@()
foreach($k in $old.Keys){ if($new.ContainsKey($k) -and $oldSide[$k] -ne $newSide[$k]){ $sd+=($k+' old='+($oldSide[$k])+' new='+($newSide[$k])) } }
$r+=('SIDEV_DIFF_N='+($sd.Count))
$r+=('SIDEV_DIFF_ROWS='+($sd -join ' | '))
$oldPos=@()
foreach($k in $oldSide.Keys){ if($oldSide[$k] -ne '0'){ $oldPos+=($k) } }
$gOnly=@(); $oOnly=@()
foreach($k in $guard.Keys){ if($oldSide[$k] -eq '0' -or -not $oldSide.ContainsKey($k)){ $gOnly+=($k) } }
foreach($k in $oldPos){ if(-not $guard.ContainsKey($k)){ $oOnly+=($k) } }
$r+=('OLD_SIDEV_POS_N='+($oldPos.Count)+' GUARD_N='+($guard.Count))
$r+=('GUARD_NOT_POS_N='+($gOnly.Count)+' '+($gOnly -join ' | '))
$r+=('POS_NOT_GUARDED_N='+($oOnly.Count)+' '+($oOnly -join ' | '))
$wf=@{}
foreach($m in (Select-String -LiteralPath $jb -Pattern 'SLIMBWALKF fields=25 bar=(\S+ \S+) site=(\S+).*fracClass=(\S+)')){
  $wf[$m.Matches[0].Groups[1].Value+'|'+$m.Matches[0].Groups[2].Value]=$m.Matches[0].Groups[3].Value
}
$sr=@{}
foreach($m in (Select-String -LiteralPath $jb -Pattern 'SLIMBR bar=(\S+ \S+) dir=\S+ entry=.*fracClass=(\S+)')){
  $sr[$m.Matches[0].Groups[1].Value+'|S5']=$m.Matches[0].Groups[2].Value
}
$ag=0; $agBad=@(); $agMiss=0
foreach($k in $sr.Keys){
  if($wf.ContainsKey($k)){ if($wf[$k] -eq $sr[$k]){ $ag++ } else { $agBad+=($k+' walkf='+$wf[$k]+' slimbr='+$sr[$k]) } }
  else { $agMiss++ }
}
$r+=('FRACCLASS_AGREE_N='+$ag+' DISAGREE_N='+($agBad.Count)+' '+($agBad -join ' | ')+' MISSING_WF_N='+$agMiss)
$frKeys=@('slFractal','rFractal','dFracPts','slFractalNuance','rFractalNuance','dFracNuancePts','fracClass')
$ob2Keys=@('slToday','rToday','slBase','rBase','dBasePts','slNuance','rNuance','dNuancePts','class')
$srOld=@{}
foreach($m in (Select-String -LiteralPath $j11 -Pattern 'SLIMBR bar=(\S+ \S+) dir=\S+ entry=')){
  $srOld[$m.Matches[0].Groups[1].Value]=(Tok $m.Line)
}
$srNew=@{}
foreach($m in (Select-String -LiteralPath $jb -Pattern 'SLIMBR bar=(\S+ \S+) dir=\S+ entry=')){
  $srNew[$m.Matches[0].Groups[1].Value]=(Tok $m.Line)
}
$r+=('SLIMBR_N_OLD='+($srOld.Count)+' SLIMBR_N_NEW='+($srNew.Count))
$frDiff=@(); $ob2Diff=@(); $srMiss=@()
foreach($k in $srOld.Keys){
  if(-not $srNew.ContainsKey($k)){ $srMiss+=($k); continue }
  $fd=@(); $od=@()
  foreach($tk in $frKeys){ if($srOld[$k][$tk] -ne $srNew[$k][$tk]){ $fd+=($tk+':'+$srOld[$k][$tk]+'->'+$srNew[$k][$tk]) } }
  foreach($tk in $ob2Keys){ if($srOld[$k][$tk] -ne $srNew[$k][$tk]){ $od+=($tk+':'+$srOld[$k][$tk]+'->'+$srNew[$k][$tk]) } }
  if($fd.Count -gt 0){ $frDiff+=($k+' ['+($fd -join ',')+']') }
  if($od.Count -gt 0){ $ob2Diff+=($k+' ['+($od -join ',')+']') }
}
$r+=('SLIMBR_FRAC_DIFF_N='+($frDiff.Count))
$r+=('SLIMBR_FRAC_DIFF_ROWS='+($frDiff -join ' | '))
$r+=('SLIMBR_OB_DIFF_N='+($ob2Diff.Count))
$r+=('SLIMBR_OB_DIFF_ROWS='+($ob2Diff -join ' | '))
$r+=('SLIMBR_MISSING_N='+($srMiss.Count)+' '+($srMiss -join ' | '))
$gs5=@()
foreach($m in (Select-String -LiteralPath $jb -Pattern 'SLIMBWALKF fields=25 bar=(\S+ \S+) site=S5.*fracAnchorGuardApplied=1')){
  $gs5+=($m.Matches[0].Groups[1].Value+'|S5')
}
$r+=('GUARD_S5_N='+($gs5.Count)+' '+($gs5 -join ' | '))
$r | Set-Content -LiteralPath $out
Get-Content -LiteralPath $out
