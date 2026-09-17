# Launch FRESHVETO-V1 (filed 2026-09-18; RUN on his "Build P-FRESH-S5OPP" word under packet P-FRESH-S5OPP v5, issued 4x-yes v155).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'FRESHVETO-V1'
$Ini = Join-Path $Work 'RECON44_DEMO_P1.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# Packet P-FRESH-S5OPP v5 (04489E6D; E1a define + E1b 3 globals + E1c OPP-only
# stamp with pre-abort BOUND/DAY + E1d consume-on-fire; G3 five fires +
# exactly-one-FRESHVETO + no-refire tripwire). Build EA 6C2E4028/602894
# (S1 PASS AE436EBC/599014 exact; S2 byte-splice 4 sites; S3 PASS roundtrip
# byte-identical +70 CRLF, 0 bare). Compile 0/0 (T168_FRESHVETO_EACOMPILE.log).
# FlowLogic untouched. Same ini (InpMode=1), same range 08-26 to 09-09
# (config\terminal.ini [Tester] DateFrom 1787702400 / DateTo 1788998400
# verified), same terminal+machine. Ceiling 90 min, wrapper-only. ONE build
# (done) + ONE run. Timeout REPORT+HALT. His demo terminal is NEVER touched -
# if TERMINAL_BUSY refuses, STOP and ask him (his word or his close), never
# close it yourself.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
