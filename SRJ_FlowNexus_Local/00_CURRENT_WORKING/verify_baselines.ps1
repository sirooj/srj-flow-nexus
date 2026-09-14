# verify_baselines.ps1 - session-open baseline check (AGENTS.md 10.1).
# Compares SHA256 + byte length of the four baseline files.
# The three frozen files are pinned here (unchanged for weeks).
# EA moves per build: pin it via params from the queue (default = TN3 documented state).
# Exit 0 = all match. Exit 1 = any mismatch (diagnose, never revert on assumption).
param(
  [string]$ExpectedEAHash = "703C3B0A8ECEF5FBE9C9AA14471A225E1E0D817439AAB78D4985E878E3A05BB1",
  [long]$ExpectedEALen = 514584
)
$fail = $false

$ea = "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5"
$eh = (Get-FileHash -Algorithm SHA256 -LiteralPath $ea).Hash
$en = (Get-Item -LiteralPath $ea).Length
if (($eh -eq $ExpectedEAHash) -and ($en -eq $ExpectedEALen)) { "PASS EA {0} {1}" -f $eh, $en }
else { $fail = $true; "MISS EA got {0} {1} want {2} {3} (update params per queue if a new build landed)" -f $eh, $en, $ExpectedEAHash, $ExpectedEALen }

$cqd = "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_CQD_TickBased_MT5.mq5"
$ch = (Get-FileHash -Algorithm SHA256 -LiteralPath $cqd).Hash
$cn = (Get-Item -LiteralPath $cqd).Length
if (($ch -eq "BE6FD84FB970B255F7809EF81CDDE829644DCC8B859166E8B2CEB9BF1D8A421F") -and ($cn -eq 50555)) { "PASS CQD {0} {1}" -f $ch, $cn }
else { $fail = $true; "MISS CQD got {0} {1}" -f $ch, $cn }

$obm = "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_OrderblockMgr.mqh"
$oh = (Get-FileHash -Algorithm SHA256 -LiteralPath $obm).Hash
$on = (Get-Item -LiteralPath $obm).Length
if (($oh -eq "D286621CD8E2AB92B67FBA2BE0FD60BC861FF277C7516A2CFF6F79564E220B7B") -and ($on -eq 48050)) { "PASS OBMGR {0} {1}" -f $oh, $on }
else { $fail = $true; "MISS OBMGR got {0} {1}" -f $oh, $on }

$flw = "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5"
$fh = (Get-FileHash -Algorithm SHA256 -LiteralPath $flw).Hash
$fn = (Get-Item -LiteralPath $flw).Length
if (($fh -eq "3606BFB480A34B5ED4357588DDAFDFE8F7DF2224DA34C6A220EA49F506725911") -and ($fn -eq 67515)) { "PASS FLOW {0} {1}" -f $fh, $fn }
else { $fail = $true; "MISS FLOW got {0} {1}" -f $fh, $fn }

if ($fail) { "RESULT: MISMATCH - diagnose, revert nothing"; exit 1 }
"RESULT: ALL BASELINES MATCH"
exit 0
