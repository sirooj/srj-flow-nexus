# Launch RECON46-FORWARD (filed 2026-09-17; RUN on his word under V135 packet accept, both spent here).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON46-FORWARD'
$Ini = Join-Path $Work 'RECON46_FORWARD_P1.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# V135 forward packet (Luna packet-YES + Sonnet methodology-YES; window pinned
# 09-10 forward per Sonnet length push; today caps length). Tree = landed
# EA E5B97B36/597425 + FlowLogic BEC2CBBD/69852 (HEAD ca66fcd, both remotes).
# Fresh ini: InpMode=1 execute, FromDate 2026.09.10, ToDate 2026.09.17 + unix
# DateFrom/DateTo pair (terminal.ini absent on disk - both key styles carried;
# actual window PROVEN by run gates, mismatch REPORT+HALT). Same terminal and
# machine, demo account 1500183638. Ceiling 90 min, wrapper-only. ONE run.
# Timeout REPORT+HALT. His demo terminal is NEVER touched - if TERMINAL_BUSY
# refuses, STOP and ask him (his word or his close), never close it yourself.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
