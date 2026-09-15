$Work='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run='RECON32-RECON'
$Ini=Join-Path $Work 'RECON1_P1.ini'
foreach($suf in @('_STATUS.txt','_DONE.txt')){ $p=Join-Path $Work ($Run + $suf); if(Test-Path -LiteralPath $p){ Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# RECON32 recon build+run (Luna CLEAR-by-name for the print-only recon +
# Opus-§3 amended instruments (PROFILE mirror + VOTE3 + tally, no second
# gate call) + Sonnet/Astra cautions as grade lines; operator fresh run
# word this turn). Build adds SIDE1G_ prints only, adoption OFF, zero
# selection change; FlowLogic 3606BFB4 untouched. Same ini/range as
# RECON20b-31 (Model=4 real-ticks, InpDebugLog=true, same terminal and
# machine, spread live-floating as all prior runs; seed-identity join
# guards the corpus empirically at grade time). Ceiling 90 min,
# wrapper-only. ONE build (done, both compile 0/0) + ONE run. No third
# run. Timeout REPORT+HALT.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
