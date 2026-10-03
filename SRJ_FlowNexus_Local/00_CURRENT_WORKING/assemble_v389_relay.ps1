$ErrorActionPreference = 'Stop'
$root = 'SRJ_FlowNexus_Local'
$oldRelayPath = Join-Path $root '06_HANDOFFS/BUILDER_RELAY_COUNCIL_v388-UJEXEMPT-25.md'
$packetPath = Join-Path $root '01_TASKS/PACKET_P-RECON74FIX-2v39.md'
$outPath = Join-Path $root '06_HANDOFFS/BUILDER_RELAY_COUNCIL_v389-UJEXEMPT-26.md'
$gradePath = Join-Path $root '06_HANDOFFS/BUILDER_RESULT_V388-GRADE.md'
$r = [IO.File]::ReadAllLines((Resolve-Path $oldRelayPath))
$p = [IO.File]::ReadAllLines((Resolve-Path $packetPath))
if ($p.Length -ne 184) { throw 'V39 packet must have 184 physical lines' }
$oldRelayHash = (Get-FileHash -LiteralPath $oldRelayPath -Algorithm SHA256).Hash
if ($oldRelayHash -ne '767A11E24C59684E02A262071A02BCCE9625010DA59B99B613D957D3F2369F84') { throw "V388 relay hash mismatch: $oldRelayHash" }
$packetHashPre = (Get-FileHash -LiteralPath $packetPath -Algorithm SHA256).Hash
if ($packetHashPre -ne '22EE2F233F825F7681442BE6E42AF83DFC412B405D84D5341381BBF7BC15EDE0') { throw "V39 packet hash mismatch: $packetHashPre" }
$physicalMap = @{}
for ($i=0; $i -lt $p.Length; $i++) { $physicalMap[$i+1] = $i }
foreach ($n in 1..184) { if ($physicalMap[$n] -ne ($n-1)) { throw "Packet P-line map failed at P$n" } }
if ($r[0] -notlike '# BUILDER RELAY COUNCIL v388-*' -or $r[58] -ne '## Twin (packet P-RECON74FIX-2v38 - P001-P184 mechanical splice, rebuilt from final saved packet bytes)' -or $r[59] -notlike 'P001: *' -or $r[242] -notlike 'P184: *' -or $r[243] -ne '' -or $r[244] -ne '## Regions (EA v29 tree; code unchanged; machine-injected, rechecked 0-diff)') { throw 'Relay section boundaries or twin anchors changed' }
if (Test-Path -LiteralPath $outPath) {
    $existingRelayHash = (Get-FileHash -LiteralPath $outPath -Algorithm SHA256).Hash
    if ($existingRelayHash -ne '4ADDF51AA4900A45E80090F908DE90DCB7868DD561591B2867DEFC9156522A4A') { throw "Refusing to replace non-generated relay: $existingRelayHash" }
    Remove-Item -LiteralPath $outPath
}
$oldTwinStart = 59
for ($i=0; $i -lt 184; $i++) {
    $want = ('P{0:D3}: ' -f ($i+1)) + [IO.File]::ReadAllLines((Resolve-Path 'SRJ_FlowNexus_Local/01_TASKS/PACKET_P-RECON74FIX-2v38.md'))[$i]
    if ($r[$oldTwinStart+$i] -cne $want) { throw "Predecessor twin mismatch at P$('{0:D3}' -f ($i+1))" }
}
$gradeHash = (Get-FileHash -LiteralPath $gradePath -Algorithm SHA256).Hash
$packetHash = (Get-FileHash -LiteralPath $packetPath -Algorithm SHA256).Hash
$packetBytes = (Get-Item -LiteralPath $packetPath).Length
$eaPath = 'Experts/SRJ_FlowNexus_EA.mq5'
$eaHash = (Get-FileHash -LiteralPath $eaPath -Algorithm SHA256).Hash
$eaBytes = (Get-Item -LiteralPath $eaPath).Length
$eaLines = [IO.File]::ReadAllLines((Resolve-Path $eaPath)).Length
$u = @{
1 = '# BUILDER RELAY COUNCIL v389-UJEXEMPT-26 - packet P-RECON74FIX-2v39 V388 page fold (draft, page-only)'
2 = "Status: DRAFT - packet v39 SHA-256 $packetHash / $packetBytes bytes / 184 physical lines; expected exact twin 184/184, PSEQ P001-P184; EA regions 107 lines across 8 spans; rows 28; grade BUILDER_RESULT_V388-GRADE.md SHA-256 $gradeHash. EA SHA-256 $eaHash / $eaBytes bytes / $eaLines lines, unchanged. Final battery pending post-write verification."
6 = '- History: packets RECON74FIX-2 v1-v39; V388 replies filed whole and graded. Relays v308 through V389 (draft) are on disk; v366-v371 were workflow-parked thread numbers, not code relays. V388 Q1 conditional/split CONFIRM; Q2 OBJECT / AMEND-WITH-HALT.'
11 = '## 0. What this V389 round is (v39 page-only fold; read first) + scope'
12 = '- CONTINUE from V388-UJEXEMPT-25 (complete replies filed and graded separately: Q1 Sonnet conditional CONFIRM / GLM CONFIRM with page fixes; Q2 Sonnet OBJECT / GLM discrepancy -> OBJECT / AMEND-WITH-HALT). V39 folds page findings only. V388 grade is filed separately. Proposed v26 EA edit set remains unchanged and proposal-only.'
14 = '- Scope: identical packet text to Sonnet and GLM; grade Q1/Q2 separately. Any OBJECT blocks clearance; discrepancy holds the code gate. No EA edit, run, build, key request, commit, or push is authorized. Any future code work needs council clearance and your separate exact grant words; build/run also need their own key and run word.'
15 = '- Current saved-file measurements are in the status line; V389 asks page-only review. Verify page claims only. Do not infer or supply your vote-free GO/HOLD.'
21 = '- V387 round: packet v37 and relay v387 were carried to Sonnet and GLM; complete attachments filed whole and fresh. Result BUILDER_RESULT_V387-GRADE.md SHA-256 198F34E1FAAD8BC96AE8044C674E1D8E867D306AEC08CECB39ADD614A0076552. Q1 Sonnet conditional CONFIRM / GLM CONFIRM with required mechanical fixes. Q2 Sonnet OBJECT / GLM conditional CONFIRM, so OBJECT / AMEND-WITH-HALT. Separate operator vote-free GO/HOLD was not supplied.'
22 = '- V388 round: complete fresh Sonnet and GLM attachments are filed under V388-UJEXEMPT-25 markers and graded in BUILDER_RESULT_V388-GRADE.md (SHA-256 ' + $gradeHash + '). Q1 Sonnet conditional CONFIRM / GLM CONFIRM with fixes; Q2 Sonnet OBJECT / GLM discrepancy, graded OBJECT / AMEND-WITH-HALT. No operator GO/HOLD supplied.'
23 = '- V388 findings folded into v39: source census for reseedBar; conditionalized forecasts; opposite-state versus sign-change proof boundary; OUTSIDE-REQUIRED consistency; exempt/promotion parity; pinned negative-control predicates; forecast re-establishment; labels, duplicates, dangling cites, and history. No code/telemetry changes adopted.'
35 = '- B1 owed take (conditional forecast only; any fired take with an established same-chain 5m structure sign-change is a pin violation): 5 June London USDJPY SHORT, 09:35 retest, 09:40 confirmation, entry 09:45 open at 159.948 R2.00 TP 12:15. Rows: R03 09:15 SHORT reseed; R01 is the separate 09:05 cross-pass KILL; R04/R06/R08 are later KILLs and R05/R07/R09 are UJPROV. R10 is a 09:35 shadow poll, not a 09:40 negative. The 09:40-bar absence is disk-asserted, not a carried-row exhibit. No present emitter can establish a pin-clean fired-path pass; opposite state is not sign-change proof; this can fail on an established sign-change or remain HOLD.'
36 = '- Pinned invalid 8 June London USDJPY SHORT: identity date+symbol+direction+setup-chain keyed by poi/session is disk-asserted; KILL/UJPROV rows do not print sess. R11/R12 are 09:25 evidence. R25-R28 are regression diagnostics, not required negative-control cells. At 09:25, exempt=1 paired with same-bar S2PROMOTE_M15 is NEGATIVE_CONTROL_BREACH / M/T FAIL regardless of stamp attribution; assert exempt=1 iff same-bar promotion, with parity mismatch failing M. Missing required evidence is HOLD.'
37 = '- Direction/stamp rows: 6/5 16:00 and 6/11 14:45 classifications are disk-asserted; P136/P154-P156 are conditional forecasts and actual branches stay UNRESOLVED without arm/holder evidence. R21 prints t78_dir, not post-resolver g_dir; R21/R23 show POI change with retained stamp, mechanism unproven. 6/12 10:55 and 18:10 remain UNRESOLVED per P045/P158/P162.'
38 = '- B3 watch: 11 June New York USDJPY 14:35 evaluated bar, 14:40 pass/entry at 160.524 R1.75; outcome label is not established here; LONG hypothesis. R22 is a SHORT KILL and R24 is a 14:35 SHORT shadow poll, neither a live LONG negative. P115 B3 twin depends on stale-stamp reuse and is run-evidence only.'
39 = '- EU 7: structural fence only (no August run; EU move-watch requires a future word plus key scope).'
41 = '## Q1. Rule the standing proof (one change sentence, one verdict)'
43 = '- Change: under the page-only v26 proposal and m15-match, seedBiasAl != 0 (including -1 sentinel) promotes; seedBiasAl == 0 promotes only when reseedBar and reseedDir are nonzero and reseedDir matches g_dir mapping; otherwise baseline GoAbort is EA-8419@v29, while proposed-tree promotion print is EA-8419@proposed and kill shifts to EA-8421@proposed. m15 read failure or non-match falls to S2WAIT. Separate 5m/LTF read failure at EA-2416@v29 aborts upstream unready at EA-8405-8406@v29. No proposal is authorized.'
44 = '- Q1 verdict: CONFIRM or OBJECT on page. Address current v39 P006/P010/P019/P024-P031/P038/P043-P045/P049/P059/P075/P082/P089-P090/P094/P096-P097/P108-P110/P112-P128/P132-P158/P166/P170-P182. Distinguish page-exhibited, disk-asserted, and run-graded claims. Address every numbered item/subpoint and advisory from both V388 Q1 replies; identify already-correct items with resolving sentences.'
45 = '- Answer form: plain CONFIRM, OBJECT, or discrepancy with exact P-line and namespaced EA-line cites; give each condition separately.'
46 = '- Analytic ask A: enumerate every defect, gap, condition, and imprecision separately, with exact page lines; say ALREADY CORRECT only with the sentence that resolves it.'
47 = '- Analytic ask B: advisory mechanisms only; identify any suggested source lines and state that no code work is authorized.'
49 = '## Q2. Rule the causal acceptance (independent of Q1)'
51 = '- Q2 verdict: CONFIRM or OBJECT with exact page cites. Address P044/P082/P112-P128/P132-P142/P143-P165/P170-P182. Rule separately on fired-path proof ceiling, B1 non-FIRED hold, H_STATUS/PATH_CLASS, present/absent post-promotion edges, pinned 09:25 identity and parity, opposite state vs sign-change, M/T breach, Ku scope, stale stamp, negative-control criterion, and run-only uncertainty. State what is necessary versus sufficient for clearance. Unknown evidence cannot pass; do not infer an all-day ban.'
52 = '- Answer form: plain CONFIRM, OBJECT, or discrepancy with exact P-line and namespaced EA-line cites; give each condition separately.'
53 = '- Analytic ask A: enumerate every defect, gap, condition, and imprecision separately, with exact page lines; say ALREADY CORRECT only with the sentence that resolves it.'
54 = '- Analytic ask B: advisory mechanisms only; identify any suggested source lines and state that no code work is authorized.'
55 = 'Verification split: page-only ruling. Digests, twins, counts, source/runtime facts, and source census are verified on the operator machine; disk-asserted items are labeled as such. No file request.'
56 = '- Operator vote-free GO/HOLD is separate from seat votes. V388 supplied no such operator signal; do not infer it from reviewer advice.'
57 = 'Close each question separately. State any condition, HOLD, or remaining evidence limit; do not infer authorization.'
59 = '## Twin (packet P-RECON74FIX-2v39 - P001-P184 mechanical splice, rebuilt from final saved packet bytes)'
}
foreach ($k in $u.Keys) { $r[[int]$k - 1] = $u[$k] }
for ($i=0; $i -lt 184; $i++) { $r[$oldTwinStart+$i] = ('P{0:D3}: ' -f ($i+1)) + $p[$i] }
$bytes = [Text.UTF8Encoding]::new($false).GetBytes(($r -join "`n") + "`n")
[IO.File]::WriteAllBytes((Join-Path (Get-Location) $outPath), $bytes)
$saved = [IO.File]::ReadAllLines((Resolve-Path $outPath))
if ($saved.Length -ne 390) { throw "relay line count=$($saved.Length), expected 390" }
for ($i=0; $i -lt 184; $i++) { if ($saved[$oldTwinStart+$i] -cne (('P{0:D3}: ' -f ($i+1)) + $p[$i])) { throw "Twin readback failed P$($i+1)" } }
"V389 relay draft saved; sha=$((Get-FileHash $outPath -Algorithm SHA256).Hash); bytes=$($bytes.Length); lines=$($saved.Length); grade=$gradeHash; packet=$packetHash"
