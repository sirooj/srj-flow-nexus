# Launch FAMILYPASS-V4 (filed 2026-09-17; RUN on his "proceed" word under packet P-TP-FAMILYPASS v4, cleared 4x seats v149+v150).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'FAMILYPASS-V4'
$Ini = Join-Path $Work 'RECON44_DEMO_P1.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# Packet P-TP-FAMILYPASS v4 (BA5BE07C; E1 POI-first + E2 census + E3 SWEPTMASK
# restore; G3 expected-not-required). Build EA AE436EBC/599014 (S1 PASS
# E5B97B36/597425/11127LF; S3 PASS outside-hunk identical post-BOM-strip).
# Compile 0/0 (T167_FAMILYPASS_EACOMPILE.log). FlowLogic untouched. Same ini
# (InpMode=1), same range 08-26 to 09-09 (terminal.ini [Tester] verified),
# same terminal+machine. Ceiling 90 min, wrapper-only. ONE build (done) + ONE run.
# Timeout REPORT+HALT. His demo terminal is NEVER touched - if TERMINAL_BUSY
# refuses, STOP and ask him (his word or his close), never close it yourself.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
