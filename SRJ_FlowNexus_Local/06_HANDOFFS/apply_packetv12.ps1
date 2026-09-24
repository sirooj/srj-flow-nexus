# apply_packetv12.ps1 - STAGE-2: apply PACKET_P-RESQUAT-1 v11/v12 edits E1-E9 to the EA by exact-diff.
# Mode 0 = dry-run (locate + assert + report, NO write). Mode 1 = apply (only if phase 1 fully green).
# ASCII-only. Straight-line code. Asserts beside every output.
param([int]$Mode = 0)
$packetPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_P-RESQUAT-1.md'
$eaPath = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$pktLines = [System.IO.File]::ReadAllLines($packetPath)
$eaLines = [System.IO.File]::ReadAllLines($eaPath)
echo PKT-COUNT
$pktLines.Count
echo EA-COUNT
$eaLines.Count
echo EDITSET-IDX
$esIdx = -1
$zz = 0
foreach ($lineItem in $pktLines) { if ($lineItem.StartsWith('## Edit set')) { $esIdx = $zz; break }; $zz++ }
$esIdx
echo STAGES-IDX
$stIdx = -1
$zz = 0
foreach ($lineItem in $pktLines) { if ($lineItem.StartsWith('## Stages')) { $stIdx = $zz; break }; $zz++ }
$stIdx
$editTags = @('- E1 suppression', '- E2 FIRE', '- E3 read gate', '- E4 write arm', '- E9 sole', '- E5 pid-resolved', '- E6a vDAY', '- E6b vDAY', '- E7 executor', '- E8a ticket', '- E8b ticket', '- E8c pid latch')
echo EDIT-COUNT
$editTags.Count
$allGreen = 1
$planList = New-Object System.Collections.Generic.List[string]
foreach ($tagText in $editTags) {
  $headIdx = -1
  $zz = 0
  foreach ($lineItem in $pktLines) { if ($zz -gt $esIdx -and $zz -lt $stIdx -and $lineItem.StartsWith($tagText)) { $headIdx = $zz; break }; $zz++ }
  $oldLbl = -1
  $zz = 0
  foreach ($lineItem in $pktLines) { if ($zz -gt $headIdx -and $lineItem -eq '  old:') { $oldLbl = $zz; break }; $zz++ }
  $newLbl = -1
  $zz = 0
  foreach ($lineItem in $pktLines) { if ($zz -gt $headIdx -and $lineItem -eq '  new:') { $newLbl = $zz; break }; $zz++ }
  $nextHead = $pktLines.Count
  $zz = 0
  foreach ($lineItem in $pktLines) { if ($zz -gt $headIdx -and ($lineItem.StartsWith('- E') -or $lineItem.StartsWith('## Stages'))) { if ($zz -lt $stIdx -or $lineItem.StartsWith('## Stages')) { if ($zz -gt $newLbl) { $nextHead = $zz; break } } }; $zz++ }
  echo TAG-CHECK
  $tagText
  echo HEAD-FOUND
  ($headIdx -ge 0)
  echo OLDLBL-FOUND
  ($oldLbl -ge 0)
  echo NEWLBL-FOUND
  ($newLbl -ge 0)
  if ($headIdx -lt 0) { $allGreen = 0 }
  if ($oldLbl -lt 0) { $allGreen = 0 }
  if ($newLbl -lt 0) { $allGreen = 0 }
  $planList.Add([string]$headIdx)
}
echo PHASE1-STRUCTURE-GREEN
$allGreen
