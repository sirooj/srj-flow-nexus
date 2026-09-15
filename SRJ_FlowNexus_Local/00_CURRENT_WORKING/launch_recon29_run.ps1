$Work='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run='RECON29-SIDE1P'
$Ini=Join-Path $Work 'RECON1_P1.ini'
foreach($suf in @('_STATUS.txt','_DONE.txt')){ $p=Join-Path $Work ($Run + $suf); if(Test-Path -LiteralPath $p){ Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# SIDE-1P-REV3 print-only instrumentation build+run (Sonnet conditional
# CLEAR SIDE1P-REV3-S5-01 with reassembly condition + operator print-only
# standing order + fresh run word; ChatGPT V55 threshold clarification
# recorded, no defect). EA CB25D2D2 (SIDE1P2_ block + 2 hooks only,
# adoption OFF, zero selection change), FlowLogic 3606BFB4 unchanged.
# Same ini/range as RECON20b-28. Ceiling 90 min, wrapper-only. ONE build
# (done) + ONE run. No third run. Timeout REPORT+HALT.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
