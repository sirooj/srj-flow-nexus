$Work='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run='RECON33-PROBE'
$Ini=Join-Path $Work 'RECON1_P1.ini'
foreach($suf in @('_STATUS.txt','_DONE.txt')){ $p=Join-Path $Work ($Run + $suf); if(Test-Path -LiteralPath $p){ Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# D-BIRTH-PROBE-001 loser-exposure probe (Luna CLEAR-by-name V82-PROBE-01,
# print-only, no tokens + his run permission this turn). Build EA (bare local
# print at the 1938-1943 selection point, Luna 7 fields + line-code, no struct
# change, emit-iff-qualified, N1 untouched; AdoptOff held, ordersend 0, both
# compile 0/0); FlowLogic 3606BFB4 untouched. Same ini/range as C0
# (Model=4 real-ticks, InpDebugLog=true, same terminal and machine, spread
# live-floating as all prior runs; seed-identity join guards the corpus
# empirically at grade time). Ceiling 90 min, wrapper-only. ONE build (done)
# + ONE run. No third run. Timeout REPORT+HALT.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
