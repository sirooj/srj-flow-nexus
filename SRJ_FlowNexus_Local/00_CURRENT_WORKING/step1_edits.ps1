# STEP 1 edits — guarded packet script. Asserts every anchor; writes only if ALL pass.
$ErrorActionPreference = 'Stop'
$ea = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$L = [System.IO.File]::ReadAllLines($ea)
$edits = 0
$probe = @($L | Where-Object { $_ -match 'STEP 1 RETIRED|double s1_stopRef = 0' }).Count
if($probe -gt 0){ "ALREADY APPLIED (probe=$probe) - aborting to prevent double-edit"; exit 1 }
function FindIdx([string[]]$Arr, [string]$pattern, [int]$from) {
  for($i=$from; $i -lt $Arr.Count; $i++){ if($Arr[$i] -match $pattern){ return $i } }
  return -1
}
# R1: site-2 branch (confirmation fallback, has g_touchSeen on the next line)
$i1 = FindIdx $L 'if\(oppositeDir && touchesZone\)' 0
if($i1 -ge 0 -and $L[$i1+1] -match 'g_touchSeen = true'){
  $L[$i1] = $L[$i1] -replace 'if\(oppositeDir && touchesZone\)', 'if(oppositeDir && (!s35_fromFvg || touchesZone))'
  $edits++; "R1 OK line $($i1+1)"
} else { "R1 FAIL idx=$i1 next=[$(if($i1 -ge 0){$L[$i1+1]})]"; exit 1 }
# R2: stop-reference variables declared before the S2POLL block
$i2 = FindIdx $L '^\s{3}if\(g_state >= ST_S2_LTF_ALIGN && g_state <= ST_S5_GATE_CHECK\)\s*$' 0
if($i2 -ge 0){
  $L = $L[0..($i2-1)] + @('   double s1_stopRef = 0.0; bool s1_haveStop = false;') + $L[$i2..($L.Count-1)]
  $edits++; "R2 OK inserted before line $($i2+1)"
} else { "R2 FAIL"; exit 1 }
# R3: capture the stop reference at the S2POLL success point
$i3 = FindIdx $L 'if\(ComputeSlReference\(barShift, g_dir, slRef, slMode, "S2POLL"\)\)' 0
if($i3 -ge 0 -and $L[$i3+1] -match '^\s{8}\{\s*$'){
  $L = $L[0..$i3] + @('         s1_stopRef = slRef; s1_haveStop = true;') + $L[($i3+1)..($L.Count-1)]
  $edits++; "R3 OK after line $($i3+1)"
} else { "R3 FAIL idx=$i3 next=[$(if($i3 -ge 0){$L[$i3+1]})]"; exit 1 }
# R4: S4 call sites gain the stop reference
$i4 = FindIdx $L 'ReadQualifyingZone\(barShift, s35_zHi, s35_zLo, s35_fromFvg\)' 0
if($i4 -ge 0){
  $L[$i4] = $L[$i4] -replace 'ReadQualifyingZone\(barShift, s35_zHi, s35_zLo, s35_fromFvg\)', 'ReadQualifyingZone(barShift, s35_zHi, s35_zLo, s35_fromFvg, s1_stopRef, s1_haveStop)'
  $L[$i4] = $L[$i4] -replace 'ZoneAdoptable\(barShift, s35_zHi, s35_zLo\)', 'ZoneAdoptable(barShift, s35_zHi, s35_zLo, s1_stopRef, s1_haveStop)'
  $edits++; "R4 OK line $($i4+1)"
} else { "R4 FAIL"; exit 1 }
# R5: FindLegTouch call site gains fromFvg (skip if the earlier editor pass did it)
$i5 = FindIdx $L 'FindLegTouch\(barShift, g_zoneHi, g_zoneLo,' 0
if($i5 -ge 0 -and $L[$i5+1] -match 's52_shift, s52_legT, s35_fromFvg\);'){
  $edits++; "R5 ALREADY DONE line $($i5+2)"
} elseif($i5 -ge 0 -and $L[$i5+1] -match 's52_shift, s52_legT\);'){
  $L[$i5+1] = $L[$i5+1] -replace 's52_shift, s52_legT\);', 's52_shift, s52_legT, s35_fromFvg);'
  $edits++; "R5 OK line $($i5+2)"
} else { "R5 FAIL idx=$i5 next=[$(if($i5 -ge 0){$L[$i5+1]})]"; exit 1 }
# R6: Task 75 zone-continue removed
$i6 = FindIdx $L 'if\(t75_zone && t75_v >= g_zoneLo && t75_v <= g_zoneHi\)' 0
if($i6 -ge 0){ $L = $L[0..($i6-1)] + $L[($i6+1)..($L.Count-1)]; $edits++; "R6 OK removed line $($i6+1)" } else { "R6 FAIL"; exit 1 }
# R6b: t75_zone declaration removed
$i6b = FindIdx $L 'bool   t75_zone' 0
if($i6b -ge 0){ $L = $L[0..($i6b-1)] + $L[($i6b+1)..($L.Count-1)]; $edits++; "R6b OK removed line $($i6b+1)" } else { "R6b FAIL"; exit 1 }
# R7: Task 67 block removed (comment through the outer close), replaced by the record
$i7 = FindIdx $L '\[Task 67 / Ruling 1 Option C / EA-71\]' 0
if($i7 -lt 0){ "R7 FAIL start"; exit 1 }
$i7m = FindIdx $L 'result=noSwingOutsideZone' $i7
if($i7m -lt 0){ "R7 FAIL marker"; exit 1 }
$i7r = FindIdx $L 'return false;' $i7m
if($i7r -lt 0){ "R7 FAIL return"; exit 1 }
$i7c1 = $i7r + 1; $i7c2 = $i7r + 2
if($L[$i7c1] -notmatch '^\s{8}\}\s*$' -or $L[$i7c2] -notmatch '^\s{5,6}\}\s*$'){ "R7 FAIL closes c1=[$($L[$i7c1])] c2=[$($L[$i7c2])]"; exit 1 }
$L = $L[0..($i7-1)] + @(
'   // [STEP 1 RETIRED] The Task 67 in-zone stop exclusion is removed per operator',
'   // ruling and spec 3.7: the stop may sit inside the entry zone (measured 1.15835',
'   // inside 1.15805-1.15843), and the correct test is the side relative to the',
'   // entry, never containment. Retired in the same edit as the Task 75 walk',
'   // zone-continue above, per council Part 2.1: the two guards were coupled -',
'   // retiring one alone changed nothing on bars where the other fired.') + $L[($i7c2+1)..($L.Count-1)]
$edits++; "R7 OK removed $($i7c2-$i7+1) lines from $($i7+1)"
# write back
$t = ($L -join "`r`n") + "`r`n"
[System.IO.File]::WriteAllText($ea, $t, (New-Object System.Text.UTF8Encoding($true)))
"WRITTEN edits=$edits newLineCount=$($L.Count)"