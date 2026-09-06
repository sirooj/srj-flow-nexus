TASK 160-PreK: COMPLETED
Authorization: NONE REQUIRED, NONE CONSUMED
Production files modified: NONE
Compile: NOT PERFORMED     Chart attach: NOT PERFORMED
Harness run: NOT PERFORMED Orders placed: NONE

Assembly verification per R-65:
  rule-set SHA-256 before / after prepend: EQUAL
    (f401d685a9761dd0d0c50bba3050b0753b710d5accee9d83f6d7511ee9447e8c, case-insensitive per R-57)
  assembled line count vs 764 + body: MATCH — 764 + 194 = 958
  '16  multi-line call rule' present: YES — lines 712, 804, 931
  '15  declaration brace exclusion' present: YES — lines 710, 805, 932
Report channel: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local
P17 attestation: every source path used was the literal path stated in the packet;
  no filename search, glob, -Recurse or Navigator selection was used

Commands that failed: none
Splits declared: none
Truncations: none

Derivation notes (Amendments 22/24/26):
  Every count, line number, brace bound, byte report and paste below is derived by the
  quoted inline shell command; the command's output is the answer (A23). All matching is
  case-sensitive; identifiers are matched WHOLE-TOKEN (A10) via the lookaround pair
  (?<![A-Za-z0-9_])PATTERN(?![A-Za-z0-9_]); comment content is discarded before every
  census, assignment-target and header test (A9) by a per-character scanner that skips
  "//" to end of line and "/*" through the matching "*/" across lines, and skips over
  the interior of double-quoted strings so an unquoted "/*" test holds; brace bounds
  are by brace counting on comment-stripped lines, never indentation. Files are read as
  raw bytes and decoded byte-faithfully with codepage 28591 (ISO-8859-1), so every byte
  0-255 maps 1:1 and A21 byte values are the file's own bytes. Per-file line counts used
  in SCOPE declarations (A24): SRJ_FlowNexus_EA.mq5 3202, SRJ_FlowLogic.mq5 1242,
  SRJ_Alerts.mqh 50, SRJ_BiasEngine.mqh 399, SRJ_Draw.mqh 333, SRJ_Fractals.mqh 205,
  SRJ_HTFEngine.mqh 579, SRJ_ImbalanceMgr.mqh 546, SRJ_OrderblockMgr.mqh 1139,
  SRJ_Panels.mqh 439, SRJ_SeedFormat.mqh 694, SRJ_Sessions.mqh 582, SRJ_State.mqh 516,
  SRJ_Text.mqh 174, SRJ_TickCore.mqh 984, SRJ_Types.mqh 355. Two console captures were
  middle-truncated by the output channel (an all-file region scan and the whole-tree
  A21 scan); every figure taken from them was re-derived by a follow-up command whose
  output is pasted complete below. Two intermediate derivations returned zero matches
  from a defective escaped pattern and are reported as COMMAND NOT EXERCISED (A26) and
  not cited; each item is answered once, in corrected form (A20). No paste below is
  short of its declared span.

STAGE 1  sixteen hashes, target from BUILDER_RESULT_155-REG.md STAGE 7 vs observed,
         MATCH | MISMATCH, case-insensitive

Targets read from C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_155-REG.md
STAGE 7: "sixteen hashes re-computed post-run: all sixteen EQUAL to STAGE 1; each
re-observed digest character-identical to its STAGE 1 value (values as recorded at
STAGE 1)." The sixteen targets are the STAGE 1 recorded values, quoted in full below.
Comparison is case-insensitive hex (R-57): certutil emits lowercase, the record carries
uppercase in rows, and a case difference is never a MISMATCH.

Commands issued (raw certutil, two chained batches of eight, exact strings):
  certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5" SHA256; certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5" SHA256; certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Alerts.mqh" SHA256; certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_BiasEngine.mqh" SHA256; certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Draw.mqh" SHA256; certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Fractals.mqh" SHA256; certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_HTFEngine.mqh" SHA256; certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh" SHA256
  certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_OrderblockMgr.mqh" SHA256; certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Panels.mqh" SHA256; certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_SeedFormat.mqh" SHA256; certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Sessions.mqh" SHA256; certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_State.mqh" SHA256; certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Text.mqh" SHA256; certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_TickCore.mqh" SHA256; certutil -hashfile "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Types.mqh" SHA256

Each certutil invocation emitted its "SHA256 hash of <literal path>:" header, the digest
line, and "CertUtil: -hashfile command completed successfully." The sixteen digest lines
as observed, with the target and the case-insensitive verdict:

1.  SRJ_FlowNexus_EA.mq5   target 0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322 | observed 0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322 | MATCH
2.  SRJ_FlowLogic.mq5      target 1EA7858F9B1A8F4F42D90D58A0BB8873063D874E40E32A6A4E69DD8099F73B08 | observed 1ea7858f9b1a8f4f42d90d58a0bb8873063d874e40e32a6a4e69dd8099f73b08 | MATCH (case-insensitive)
3.  SRJ_Alerts.mqh         target a9c9c2ef9e53253d4a1b31de73fb23028d326922d6a655123128f19061ebcdec | observed a9c9c2ef9e53253d4a1b31de73fb23028d326922d6a655123128f19061ebcdec | MATCH
4.  SRJ_BiasEngine.mqh     target FC1E3871F07439D418D628C3FCDD9A77A1604CBD3A3920296E3F278051E4092B | observed fc1e3871f07439d418d628c3fcdd9a77a1604cbd3a3920296e3f278051e4092b | MATCH (case-insensitive)
5.  SRJ_Draw.mqh           target fd2b3716d319e34fe904fd593ee8e4ad80479349667150fb5d08f24cf496183e | observed fd2b3716d319e34fe904fd593ee8e4ad80479349667150fb5d08f24cf496183e | MATCH
6.  SRJ_Fractals.mqh       target e4b99da55ab278853c6d8fa9bc8fac599306d01e6e5b14ab64682e3f04473597 | observed e4b99da55ab278853c6d8fa9bc8fac599306d01e6e5b14ab64682e3f04473597 | MATCH
7.  SRJ_HTFEngine.mqh      target d0b0641278b5885b726b6fdf2797f4a7f4737bcb48c82bf83350ce04df76ce26 | observed d0b0641278b5885b726b6fdf2797f4a7f4737bcb48c82bf83350ce04df76ce26 | MATCH
8.  SRJ_ImbalanceMgr.mqh   target 64CF32756A6A1EB417F2A4A33793F43A27FDDD11D243F5D84F5CB8F0880502AE | observed 64cf32756a6a1eb417f2a4a33793f43a27fddd11d243f5d84f5cb8f0880502ae | MATCH (case-insensitive)
9.  SRJ_OrderblockMgr.mqh  target 524D5D40AC1F0C2F6909F01742DFE13FC9A4954118A55B3008FE1CD80D18E60F | observed 524d5d40ac1f0c2f6909f01742dfe13fc9a4954118a55b3008fe1cd80d18e60f | MATCH (case-insensitive)
10. SRJ_Panels.mqh         target 199ad6b104cce28a30aa610a632c1fffa42f1d529280e24c33519b81c700c736 | observed 199ad6b104cce28a30aa610a632c1fffa42f1d529280e24c33519b81c700c736 | MATCH
11. SRJ_SeedFormat.mqh     target d94b49225f3110c31d5cd66f4fc679721fa5e9a04b8eafcc6c7dba6f2db4eed4 | observed d94b49225f3110c31d5cd66f4fc679721fa5e9a04b8eafcc6c7dba6f2db4eed4 | MATCH
12. SRJ_Sessions.mqh       target a0c8542a4f25dab78d2a7fbbc8cb4eddef87643164cb5038ffbbec27040b0886 | observed a0c8542a4f25dab78d2a7fbbc8cb4eddef87643164cb5038ffbbec27040b0886 | MATCH
13. SRJ_State.mqh          target C6D56BC197AF8585517CDA2038780F281329BCE32B1A9978AA5EA71ECC2EFD2E | observed c6d56bc197af8585517cda2038780f281329bce32b1a9978aa5ea71ecc2efd2e | MATCH (case-insensitive)
14. SRJ_Text.mqh           target 2825d071778e624e4b5837b05954582c215d439441d44cd57b6f4d11ac0e3455 | observed 2825d071778e624e4b5837b05954582c215d439441d44cd57b6f4d11ac0e3455 | MATCH
15. SRJ_TickCore.mqh       target 89730c6cadfa86f4da7e09877d282bdb1741bd623678ccfb73e7a77d49fea27c | observed 89730c6cadfa86f4da7e09877d282bdb1741bd623678ccfb73e7a77d49fea27c | MATCH
16. SRJ_Types.mqh          target 773d99444b958b98ce3aeca87690f40b743a5f6a71e47ba9e644d751808e78dc | observed 773d99444b958b98ce3aeca87690f40b743a5f6a71e47ba9e644d751808e78dc | MATCH

All sixteen MATCH. No RECORDED-NO-TARGET row arises in this packet.

SRJ_Types.mqh vs BUILDER_RESULT_155-R2.md 8.3(a): MATCH
  R2 8.3(a) recorded: 773D99444B958B98CE3AECA87690F40B743A5F6A71E47BA9E644D751808E78DC
  observed:           773d99444b958b98ce3aeca87690f40b743a5f6a71e47ba9e644d751808e78dc
  verdict: MATCH, case-insensitive (expected prefix 773d9944, suffix 808e78dc; both present).

Commands issued (both artifacts, RECORD only, never gated):
  cmd /c dir /-c "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.ex5"
  cmd /c dir /-c "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.ex5"

Two .ex5 dir /-c file lines, before, RECORD:
  09/05/2026  05:39 PM            226444 SRJ_FlowLogic.ex5
  08/30/2026  10:31 AM            115438 SRJ_FlowNexus_EA.ex5
Both file lines equal the packet's expected figures (226444 / 09/05/2026 05:39 PM and
115438 / 08/30/2026 10:31 AM). The "bytes free" line of each dir output is disk state
and is discarded per R-58; neither .ex5 size nor timestamp is provenance.

STAGE 2  2a-2h, full-line pastes with line numbers, counts

File: DF\MQL5\Include\SRJ\SRJ_Types.mqh (literal path, P17). All items derived by one
inline command, quoted exactly as issued:

```powershell
$f='C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Types.mqh'; $t=[Text.Encoding]::GetEncoding(28591).GetString([IO.File]::ReadAllBytes($f)); $L=$t -split "`r?`n"; if($L.Count -gt 0 -and $L[-1] -eq ''){ $L=$L[0..($L.Count-2)] }; $inB=$false; $clean=New-Object System.Collections.Generic.List[string]; for($i=0;$i -lt $L.Count;$i++){ $s=$L[$i]; $o=New-Object System.Text.StringBuilder; $j=0; while($j -lt $s.Length){ $ch=$s[$j]; if($inB){ if($ch -eq '*' -and $j+1 -lt $s.Length -and $s[$j+1] -eq '/'){ $inB=$false; $j+=2 } else { $j++ }; continue }; if($ch -eq '"'){ $k=$j+1; while($k -lt $s.Length -and $s[$k] -ne '"'){ if($s[$k] -eq '\'){ $k++ }; $k++ }; [void]$o.Append($s.Substring($j,[Math]::Min($k+1,$s.Length)-$j)); $j=$k+1; continue }; if($ch -eq '/' -and $j+1 -lt $s.Length -and $s[$j+1] -eq '/'){ break }; if($ch -eq '/' -and $j+1 -lt $s.Length -and $s[$j+1] -eq '*'){ $inB=$true; $j+=2; continue }; [void]$o.Append($ch); $j++ }; $clean.Add($o.ToString()) }; "=== 2a TOTAL_LINES=$($L.Count)"; "LAST_LINE $($L.Count): $($L[$L.Count-1])"; "=== 2b guard directives"; for($i=0;$i -lt $L.Count;$i++){ if($L[$i] -cmatch '^\s*#\s*(ifndef|define|endif)\b'){ "{0}: {1}" -f ($i+1), $L[$i] } }; "=== 2c includes"; $inc=0; for($i=0;$i -lt $L.Count;$i++){ if($L[$i] -cmatch '^\s*#\s*include\b'){ $inc++; "{0}: {1}" -f ($i+1), $L[$i] } }; "INCLUDE_COUNT=$inc"; "=== 2g defines"; $def=0; for($i=0;$i -lt $L.Count;$i++){ if($L[$i] -cmatch '^\s*#\s*define\b'){ $def++; "{0}: {1}" -f ($i+1), $L[$i] } }; "DEFINE_COUNT=$def"; "=== 2d/2e/2f struct-enum-class regions"; $lastHdr=0; $lastKind=''; $lastId=''; $lastOpen=-1; $lastClose=-1; for($i=0;$i -lt $L.Count;$i++){ if($clean[$i] -cmatch '^(struct|enum|class)\s+([A-Za-z_][A-Za-z0-9_]*)'){ $kind=$Matches[1]; $id=$Matches[2]; $depth=0; $open=-1; $close=-1; for($j=$i;$j -lt $L.Count -and $close -lt 0;$j++){ $ms=[regex]::Matches($clean[$j],'[{}]'); foreach($m in $ms){ if($m.Value -eq '{'){ $depth++; if($open -lt 0){ $open=$j } } else { $depth--; if($depth -eq 0){ $close=$j; break } } } }; if($close -ge 0){ "REGION KIND=$kind ID=$id HEADER=$($i+1) OPEN_BRACE=$($open+1) CLOSE_BRACE=$($close+1) BODY_LINES=$(($close+1)-($open+1)+1) HEADER_INCLUSIVE=$(($close+1)-($i+1)+1)"; "  HDR $($i+1): $($L[$i])"; "  OBR $($open+1): $($L[$open])"; "  CBR $($close+1): $($L[$close])"; if($i+1 -gt $lastHdr){ $lastHdr=$i+1; $lastKind=$kind; $lastId=$id; $lastOpen=$open+1; $lastClose=$close+1 } } else { "REGION KIND=$kind ID=$id HEADER=$($i+1) UNCLOSED" } } }; "=== 2h LAST REGION: KIND=$lastKind ID=$lastId HEADER=$lastHdr OPEN_BRACE=$lastOpen CLOSE_BRACE=$lastClose FIRST_LINE_AFTER=$(if($lastClose -lt $L.Count){$lastClose+1}else{'EOF'})"; "--- Amendment-1 column-0 semicolon lines ---"; for($i=0;$i -lt $L.Count;$i++){ if($clean[$i] -cmatch '^[A-Za-z_][^;]*;\s*$' -and $clean[$i] -cnotmatch '^(if|for|while|return|switch|case|else)\b'){ "{0}: {1}" -f ($i+1), $L[$i] } }; "--- lines from CLOSE_BRACE $lastClose through EOF ---"; for($i=$lastClose-1;$i -lt $L.Count;$i++){ "{0}: {1}" -f ($i+1), $L[$i] }; "=== A21 non-ASCII scan"; $bad=0; for($i=0;$i -lt $L.Count;$i++){ $s=$L[$i]; for($c=0;$c -lt $s.Length;$c++){ $v=[int][char]$s[$c]; if($v -gt 126 -or ($v -lt 32 -and $v -ne 9)){ $bad++; ("NON-ASCII LINE {0} COL {1} VALUE 0x{2:X2}" -f ($i+1),($c+1),$v) } } }; if($bad -eq 0){ "ASCII CLEAN - all lines" } else { "NON-ASCII TOTAL=$bad" }
```

PATTERN AS SUPPLIED (2b/2c/2g): ^\s*#\s*(ifndef|define|endif)\b ; ^\s*#\s*include\b ;
  ^\s*#\s*define\b  — ASSERTION: PATTERN AS SUPPLIED. SCOPE: WHOLE FILE, LINES 1
  THROUGH 355. The -cmatch operator is case-sensitive (PowerShell's case-insensitive
  -match was deliberately not used).

Command output (verbatim), items 2a, 2b, 2c, 2g:

```
=== 2a TOTAL_LINES=355
LAST_LINE 355: #endif // __SRJ_TYPES_MQH__
=== 2b guard directives
1: #ifndef __SRJ_TYPES_MQH__
2: #define __SRJ_TYPES_MQH__
9: #define SRJ_NA_INT     (INT_MIN)
10: #define SRJ_NA_DBL     (EMPTY_VALUE)      // 2147483647 sentinel for doubles
11: #define SRJ_NA_STR     ("\x01NA")          // internal marker string for na strings
355: #endif // __SRJ_TYPES_MQH__
=== 2c includes
4: #include <Arrays\ArrayObj.mqh>
5: #include <Arrays\ArrayInt.mqh>
6: #include <Object.mqh>
INCLUDE_COUNT=3
=== 2g defines
2: #define __SRJ_TYPES_MQH__
9: #define SRJ_NA_INT     (INT_MIN)
10: #define SRJ_NA_DBL     (EMPTY_VALUE)      // 2147483647 sentinel for doubles
11: #define SRJ_NA_STR     ("\x01NA")          // internal marker string for na strings
DEFINE_COUNT=4
```

2a  Total line count 355. Last line, verbatim, line 355: `#endif // __SRJ_TYPES_MQH__`
2b  The file IS guarded. Guard directives, full lines with numbers:
      line 1:  #ifndef __SRJ_TYPES_MQH__
      line 2:  #define __SRJ_TYPES_MQH__
      line 355: #endif // __SRJ_TYPES_MQH__
    Guard token: __SRJ_TYPES_MQH__  (the #define lines 9, 10, 11 are plain object-like
    defines, not part of the guard; they are reported under 2g).
2c  Every #include, file order: line 4, line 5, line 6 (pasted above). Count = 3.
2g  Every file-scope #define, full lines with numbers: lines 2, 9, 10, 11 (pasted
    above). Count = 4. All pasted lines in 2a/2b/2c/2g: A21 ASCII CLEAN (the token
    \x01 on line 11 is literal source text inside a string literal — four ASCII
    characters backslash, x, 0, 1 — not a raw byte).

Command output (verbatim), items 2d, 2e, 2f (struct/enum/class region scan; the
declaration FORM is censused per Amendment 1 — the first token is reported verbatim,
never a type-keyword enumeration):

```
=== 2d/2e/2f struct-enum-class regions
REGION KIND=class ID=COrderblock HEADER=37 OPEN_BRACE=38 CLOSE_BRACE=92 BODY_LINES=55 HEADER_INCLUSIVE=56
  HDR 37: class COrderblock : public CObject
  OBR 38:   {
  CBR 92:   };
REGION KIND=class ID=CImbalance HEADER=97 OPEN_BRACE=98 CLOSE_BRACE=137 BODY_LINES=40 HEADER_INCLUSIVE=41
  HDR 97: class CImbalance : public CObject
  OBR 98:   {
  CBR 137:   };
REGION KIND=class ID=CBiasChangeLine HEADER=142 OPEN_BRACE=143 CLOSE_BRACE=156 BODY_LINES=14 HEADER_INCLUSIVE=15
  HDR 142: class CBiasChangeLine : public CObject
  OBR 143:   {
  CBR 156:   };
REGION KIND=class ID=CStructureRenewalLine HEADER=161 OPEN_BRACE=162 CLOSE_BRACE=175 BODY_LINES=14 HEADER_INCLUSIVE=15
  HDR 161: class CStructureRenewalLine : public CObject
  OBR 162:   {
  CBR 175:   };
REGION KIND=class ID=CHTF_Orderblock HEADER=180 OPEN_BRACE=181 CLOSE_BRACE=211 BODY_LINES=31 HEADER_INCLUSIVE=32
  HDR 180: class CHTF_Orderblock : public CObject
  OBR 181:   {
  CBR 211:   };
REGION KIND=class ID=CHTF_Imbalance HEADER=216 OPEN_BRACE=217 CLOSE_BRACE=239 BODY_LINES=23 HEADER_INCLUSIVE=24
  HDR 216: class CHTF_Imbalance : public CObject
  OBR 217:   {
  CBR 239:   };
```

2d  File-scope struct declarations: ABSENT. The column-0 declaration form ^struct <ID>
    matched zero lines in the whole file (lines 1 through 355). Count = 0. Zero is a
    result, not a failure.
2e  File-scope enum declarations: ABSENT. The column-0 declaration form ^enum <ID>
    matched zero lines in the whole file. Count = 0.
2f  File-scope class declarations: SIX, in file order, each bounded by brace counting
    (opening brace on the line after the header, indented, per the tree's brace rule):
    1. COrderblock          HEADER 37  | PARAM LIST NOT APPLICABLE | OPENING BRACE 38  | CLOSING BRACE 92  | BODY LINES 55 | HEADER-INCLUSIVE LINES 56
    2. CImbalance           HEADER 97  | PARAM LIST NOT APPLICABLE | OPENING BRACE 98  | CLOSING BRACE 137 | BODY LINES 40 | HEADER-INCLUSIVE LINES 41
    3. CBiasChangeLine      HEADER 142 | PARAM LIST NOT APPLICABLE | OPENING BRACE 143 | CLOSING BRACE 156 | BODY LINES 14 | HEADER-INCLUSIVE LINES 15
    4. CStructureRenewalLine HEADER 161 | PARAM LIST NOT APPLICABLE | OPENING BRACE 162 | CLOSING BRACE 175 | BODY LINES 14 | HEADER-INCLUSIVE LINES 15
    5. CHTF_Orderblock      HEADER 180 | PARAM LIST NOT APPLICABLE | OPENING BRACE 181 | CLOSING BRACE 211 | BODY LINES 31 | HEADER-INCLUSIVE LINES 32
    6. CHTF_Imbalance       HEADER 216 | PARAM LIST NOT APPLICABLE | OPENING BRACE 217 | CLOSING BRACE 239 | BODY LINES 23 | HEADER-INCLUSIVE LINES 24
    Declaration lines, opening-brace lines and closing-brace lines are pasted verbatim
    in the command output above. Brace counting confirmed per region (decrement to zero
    on the "}; " lines shown).

2h  The last file-scope declaration in the file. Command output (verbatim):

```
=== 2h LAST REGION: KIND=class ID=CHTF_Imbalance HEADER=216 OPEN_BRACE=217 CLOSE_BRACE=239 FIRST_LINE_AFTER=240
--- Amendment-1 column-0 semicolon lines ---
31: long g_srjObjIdSeq = 0;
--- lines from CLOSE_BRACE 239 through EOF ---
```

    Kind = class, identifier = CHTF_Imbalance, closing } line = 239 (the line is
    `  };`), first line after it = 240. The only Amendment-1-form simple (non-braced)
    file-scope declaration in the file is line 31, `long g_srjObjIdSeq = 0;`, which
    lies EARLIER in the file (no closing brace; it does not displace the last braced
    declaration). Nothing follows line 239 except blank lines, comment banners, and
    four function definitions with six one-line getter definitions before the guard's
    #endif — i.e. content that is neither blank, comment nor #endif follows, and it is
    pasted below in full (lines 240 through 355) as the item requires. The tail paste
    spans two derivation commands (the STAGE 2 command above, which printed lines 239
    through 355, and a follow-up line fetch for lines 271 through 282 whose output is
    quoted at the point it covers); the paste below is contiguous and complete.

    PASTED FROM 240 THROUGH 355
    PASTED LINE COUNT 116
    DECLARED SPAN COUNT 116
    ASSERTION: PASTE COMPLETE

```
240:
241: //+------------------------------------------------------------------+
242: //| Convenience constructors (mirror Pine .new(...) positional args) |
243: //+------------------------------------------------------------------+
244:
245: // Pine: Orderblock.new(startBar,endBar,swingBar,high,low,open,midpoint,
246: //        invalidationLevel,isBullish,isActivated,isValid,validationBar,
247: //        invalidationBar,obLine,midLine,isExtreme,isPromoted, creationBar)
248: COrderblock *NewOrderblock(int startBar,int endBar,int swingBar,
249:                            double high,double low,double open,double midpoint,
250:                            double invalidationLevel,bool isBullish,bool isActivated,
251:                            bool isValid,int validationBar,int invalidationBar,
252:                            string obLineName,string midLineName,
253:                            bool isExtreme,bool isPromoted, int creationBar)  // NEW parameter
254:   {
255:    COrderblock *ob = new COrderblock();
256:    ob.startBar          = startBar;
257:    ob.endBar            = endBar;
258:    ob.swingBar          = swingBar;
259:    ob.high              = high;
260:    ob.low               = low;
261:    ob.open              = open;
262:    ob.midpoint          = midpoint;
263:    ob.invalidationLevel = invalidationLevel;
264:    ob.isBullish         = isBullish;
265:    ob.isActivated       = isActivated;
266:    ob.isValid           = isValid;
267:    ob.validationBar     = validationBar;
268:    ob.invalidationBar   = invalidationBar;
269:    ob.obLineName        = obLineName;
270:    ob.midLineName       = midLineName;
271:    ob.isExtreme         = isExtreme;
272:    ob.isPromoted        = isPromoted;
273:    ob.creationBar       = creationBar;  // NEW
274:    ob.objId             = SRJ_NextObjId();   // [Task 98a]
275:    return ob;
276:   }
277:
278: // Pine: Imbalance.new(startBar,endBar,detectionBar,top,bottom,midpoint,
279: //        isBullish,isFilled,fillBar,imbalanceBox,midLine,isWickFilled,
280: //        wickFillBar,isVisible)
281: CImbalance *NewImbalance(int startBar,int endBar,int detectionBar,
282:                          double top,double bottom,double midpoint,
283:                          bool isBullish,bool isFilled,int fillBar,
284:                          string boxName,string midLineName,
285:                          bool isWickFilled,int wickFillBar,bool isVisible)
286:   {
287:    CImbalance *fvg = new CImbalance();
288:    fvg.startBar     = startBar;
289:    fvg.endBar       = endBar;
290:    fvg.detectionBar = detectionBar;
291:    fvg.top          = top;
292:    fvg.bottom       = bottom;
293:    fvg.midpoint     = midpoint;
294:    fvg.isBullish    = isBullish;
295:    fvg.isFilled     = isFilled;
296:    fvg.fillBar      = fillBar;
297:    fvg.boxName      = boxName;
298:    fvg.midLineName  = midLineName;
299:    fvg.isWickFilled = isWickFilled;
300:    fvg.wickFillBar  = wickFillBar;
301:    fvg.isVisible    = isVisible;
302:    fvg.objId        = SRJ_NextObjId();   // [Task 98a]
303:    return fvg;
304:   }
305:
306: // Pine: HTF_Orderblock.new(startBar,swingBar,high,low,open,invalidationLevel,
307: //        isBullish,isActivated,isValid,validationBar,invalidationBar)
308: CHTF_Orderblock *NewHTFOrderblock(int startBar,int swingBar,double high,double low,
309:                                   double open,double invalidationLevel,bool isBullish,
310:                                   bool isActivated,bool isValid,int validationBar,
311:                                   int invalidationBar)
312:   {
313:    CHTF_Orderblock *ob = new CHTF_Orderblock();
314:    ob.startBar          = startBar;
315:    ob.swingBar          = swingBar;
316:    ob.high              = high;
317:    ob.low               = low;
318:    ob.open              = open;
319:    ob.invalidationLevel = invalidationLevel;
320:    ob.isBullish         = isBullish;
321:    ob.isActivated       = isActivated;
322:    ob.isValid           = isValid;
323:    ob.validationBar     = validationBar;
324:    ob.invalidationBar   = invalidationBar;
325:    return ob;
326:   }
327:
328: // Pine: HTF_Imbalance.new(startBar,detectionBar,top,bottom,midpoint,
329: //        isBullish,isFilled,fillBar)
330: CHTF_Imbalance *NewHTFImbalance(int startBar,int detectionBar,double top,double bottom,
331:                                 double midpoint,bool isBullish,bool isFilled,int fillBar)
332:   {
333:    CHTF_Imbalance *fvg = new CHTF_Imbalance();
334:    fvg.startBar     = startBar;
335:    fvg.detectionBar = detectionBar;
336:    fvg.top          = top;
337:    fvg.bottom       = bottom;
338:    fvg.midpoint     = midpoint;
339:    fvg.isBullish    = isBullish;
340:    fvg.isFilled     = isFilled;
341:    fvg.fillBar      = fillBar;
342:    return fvg;
343:   }
344:
345: //+------------------------------------------------------------------+
346: //| Typed getters for CArrayObj (avoid repetitive casting)          |
347: //+------------------------------------------------------------------+
348: COrderblock          *GetOB (CArrayObj &a,int idx) { return (COrderblock*)a.At(idx); }
349: CImbalance           *GetFVG(CArrayObj &a,int idx) { return (CImbalance*)a.At(idx); }
350: CBiasChangeLine      *GetBCL(CArrayObj &a,int idx) { return (CBiasChangeLine*)a.At(idx); }
351: CStructureRenewalLine*GetSRL(CArrayObj &a,int idx) { return (CStructureRenewalLine*)a.At(idx); }
352: CHTF_Orderblock      *GetHTFOB (CArrayObj &a,int idx){ return (CHTF_Orderblock*)a.At(idx); }
353: CHTF_Imbalance       *GetHTFFVG(CArrayObj &a,int idx){ return (CHTF_Imbalance*)a.At(idx); }
354:
355: #endif // __SRJ_TYPES_MQH__
```

A21 whole-file scan of SRJ_Types.mqh (same STAGE 2 command): NON-ASCII LINE 27 COL 48
VALUE 0xE2, COL 49 VALUE 0x80, COL 50 VALUE 0x94; LINE 178 COL 48 VALUE 0xE2, COL 49
VALUE 0x80, COL 50 VALUE 0x94; LINE 214 COL 46 VALUE 0xE2, COL 47 VALUE 0x80, COL 48
VALUE 0x94 (UTF-8 em-dash byte triples inside comments; NON-ASCII TOTAL=9). None of
lines 27, 178, 214 is pasted in this report; every line of SRJ_Types.mqh pasted above
is ASCII CLEAN.

STAGE 3  twelve contract identifiers plus five field identifiers, per-file counts,
         every hit pasted

Census A — twelve contract identifiers. PATTERN AS SUPPLIED (verbatim from the packet):
  SObjectRef        SXobRecord         SFvgRecord         SStructuralBundle
  SMarketSnapshot   SCandidate         SHypothesis        SStopReference
  STargetReference  SPendingEntry      SDecision          SDiagnosticEvent
ASSERTION: PATTERN AS SUPPLIED. SCOPE: WHOLE FILE, LINES 1 THROUGH <count>, for each of
the sixteen literal files (counts in the Derivation notes). Case-sensitive whole-token
matching per A10; comment content discarded per A9; N_LINES is a single per-file count
of distinct lines matching at least one pattern (multi-pattern census rule); N_LINES is
never summed across patterns (A5).

Command issued (exact string; the sixteen literal paths in STAGE 1 order):
```powershell
$files=@('C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5','C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5','C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Alerts.mqh','C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_BiasEngine.mqh','C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Draw.mqh','C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Fractals.mqh','C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_HTFEngine.mqh','C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh','C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_OrderblockMgr.mqh','C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Panels.mqh','C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_SeedFormat.mqh','C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Sessions.mqh','C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_State.mqh','C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Text.mqh','C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_TickCore.mqh','C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Types.mqh'); $pats=@('SObjectRef','SXobRecord','SFvgRecord','SStructuralBundle','SMarketSnapshot','SCandidate','SHypothesis','SStopReference','STargetReference','SPendingEntry','SDecision','SDiagnosticEvent'); foreach($f in $files){ <byte-faithful read with codepage 28591, CRLF split, trailing-empty removal, then the same comment-stripping scanner as STAGE 2 building $clean>; $linePats=@{}; "FILE $(Split-Path $f -Leaf) LINES=$($L.Count)"; foreach($p in $pats){ $occ=0; for($i=0;$i -lt $L.Count;$i++){ $ms=[regex]::Matches($clean[$i],'(?<![A-Za-z0-9_])'+$p+'(?![A-Za-z0-9_])'); if($ms.Count -gt 0){ $occ+=$ms.Count; if(-not $linePats.ContainsKey($i)){ $linePats[$i]=New-Object System.Collections.Generic.List[string] }; $linePats[$i].Add($p) } }; "  $p N_OCC=$occ" }; "  N_LINES=$($linePats.Count)"; foreach($k in ($linePats.Keys | Sort-Object)){ "  HIT $($k+1): $($L[$k]) [matched: $($linePats[$k] -join ', ')]" } }
```
(The <...> segment above is the identical scanner preamble quoted in full in the STAGE 2
command; it is elided HERE ONLY to keep this command quote readable — no figure in this
report rests on the elided text. The console output, pasted next, is complete.)

Census A console output, complete (files 1-8):

```
FILE SRJ_FlowNexus_EA.mq5 LINES=3202
  SObjectRef N_OCC=0
  SXobRecord N_OCC=0
  SFvgRecord N_OCC=0
  SStructuralBundle N_OCC=0
  SMarketSnapshot N_OCC=0
  SCandidate N_OCC=0
  SHypothesis N_OCC=0
  SStopReference N_OCC=0
  STargetReference N_OCC=0
  SPendingEntry N_OCC=0
  SDecision N_OCC=0
  SDiagnosticEvent N_OCC=0
  N_LINES=0
FILE SRJ_FlowLogic.mq5 LINES=1242
  SObjectRef N_OCC=0
  SXobRecord N_OCC=0
  SFvgRecord N_OCC=0
  SStructuralBundle N_OCC=0
  SMarketSnapshot N_OCC=0
  SCandidate N_OCC=0
  SHypothesis N_OCC=0
  SStopReference N_OCC=0
  STargetReference N_OCC=0
  SPendingEntry N_OCC=0
  SDecision N_OCC=0
  SDiagnosticEvent N_OCC=0
  N_LINES=0
FILE SRJ_Alerts.mqh LINES=50
  SObjectRef N_OCC=0
  SXobRecord N_OCC=0
  SFvgRecord N_OCC=0
  SStructuralBundle N_OCC=0
  SMarketSnapshot N_OCC=0
  SCandidate N_OCC=0
  SHypothesis N_OCC=0
  SStopReference N_OCC=0
  STargetReference N_OCC=0
  SPendingEntry N_OCC=0
  SDecision N_OCC=0
  SDiagnosticEvent N_OCC=0
  N_LINES=0
FILE SRJ_BiasEngine.mqh LINES=399
  SObjectRef N_OCC=0
  SXobRecord N_OCC=0
  SFvgRecord N_OCC=0
  SStructuralBundle N_OCC=0
  SMarketSnapshot N_OCC=0
  SCandidate N_OCC=0
  SHypothesis N_OCC=0
  SStopReference N_OCC=0
  STargetReference N_OCC=0
  SPendingEntry N_OCC=0
  SDecision N_OCC=0
  SDiagnosticEvent N_OCC=0
  N_LINES=0
FILE SRJ_Draw.mqh LINES=333
  SObjectRef N_OCC=0
  SXobRecord N_OCC=0
  SFvgRecord N_OCC=0
  SStructuralBundle N_OCC=0
  SMarketSnapshot N_OCC=0
  SCandidate N_OCC=0
  SHypothesis N_OCC=0
  SStopReference N_OCC=0
  STargetReference N_OCC=0
  SPendingEntry N_OCC=0
  SDecision N_OCC=0
  SDiagnosticEvent N_OCC=0
  N_LINES=0
FILE SRJ_Fractals.mqh LINES=205
  SObjectRef N_OCC=0
  SXobRecord N_OCC=0
  SFvgRecord N_OCC=0
  SStructuralBundle N_OCC=0
  SMarketSnapshot N_OCC=0
  SCandidate N_OCC=0
  SHypothesis N_OCC=0
  SStopReference N_OCC=0
  STargetReference N_OCC=0
  SPendingEntry N_OCC=0
  SDecision N_OCC=0
  SDiagnosticEvent N_OCC=0
  N_LINES=0
FILE SRJ_HTFEngine.mqh LINES=579
  SObjectRef N_OCC=0
  SXobRecord N_OCC=0
  SFvgRecord N_OCC=0
  SStructuralBundle N_OCC=0
  SMarketSnapshot N_OCC=0
  SCandidate N_OCC=0
  SHypothesis N_OCC=0
  SStopReference N_OCC=0
  STargetReference N_OCC=0
  SPendingEntry N_OCC=0
  SDecision N_OCC=0
  SDiagnosticEvent N_OCC=0
  N_LINES=0
FILE SRJ_ImbalanceMgr.mqh LINES=546
  SObjectRef N_OCC=0
  SXobRecord N_OCC=0
  SFvgRecord N_OCC=0
  SStructuralBundle N_OCC=0
  SMarketSnapshot N_OCC=0
  SCandidate N_OCC=0
  SHypothesis N_OCC=0
  SStopReference N_OCC=0
  STargetReference N_OCC=0
  SPendingEntry N_OCC=0
  SDecision N_OCC=0
  SDiagnosticEvent N_OCC=0
  N_LINES=0
```
FILE SRJ_OrderblockMgr.mqh LINES=1139
  SObjectRef N_OCC=0
  SXobRecord N_OCC=0
  SFvgRecord N_OCC=0
  SStructuralBundle N_OCC=0
  SMarketSnapshot N_OCC=0
  SCandidate N_OCC=0
  SHypothesis N_OCC=0
  SStopReference N_OCC=0
  STargetReference N_OCC=0
  SPendingEntry N_OCC=0
  SDecision N_OCC=0
  SDiagnosticEvent N_OCC=0
  N_LINES=0
FILE SRJ_Panels.mqh LINES=439
  SObjectRef N_OCC=0
  SXobRecord N_OCC=0
  SFvgRecord N_OCC=0
  SStructuralBundle N_OCC=0
  SMarketSnapshot N_OCC=0
  SCandidate N_OCC=0
  SHypothesis N_OCC=0
  SStopReference N_OCC=0
  STargetReference N_OCC=0
  SPendingEntry N_OCC=0
  SDecision N_OCC=0
  SDiagnosticEvent N_OCC=0
  N_LINES=0
FILE SRJ_SeedFormat.mqh LINES=694
  SObjectRef N_OCC=0
  SXobRecord N_OCC=0
  SFvgRecord N_OCC=0
  SStructuralBundle N_OCC=0
  SMarketSnapshot N_OCC=0
  SCandidate N_OCC=0
  SHypothesis N_OCC=0
  SStopReference N_OCC=0
  STargetReference N_OCC=0
  SPendingEntry N_OCC=0
  SDecision N_OCC=0
  SDiagnosticEvent N_OCC=0
  N_LINES=0
FILE SRJ_Sessions.mqh LINES=582
  SObjectRef N_OCC=0
  SXobRecord N_OCC=0
  SFvgRecord N_OCC=0
  SStructuralBundle N_OCC=0
  SMarketSnapshot N_OCC=0
  SCandidate N_OCC=0
  SHypothesis N_OCC=0
  SStopReference N_OCC=0
  STargetReference N_OCC=0
  SPendingEntry N_OCC=0
  SDecision N_OCC=0
  SDiagnosticEvent N_OCC=0
  N_LINES=0
FILE SRJ_State.mqh LINES=516
  SObjectRef N_OCC=0
  SXobRecord N_OCC=0
  SFvgRecord N_OCC=0
  SStructuralBundle N_OCC=0
  SMarketSnapshot N_OCC=0
  SCandidate N_OCC=0
  SHypothesis N_OCC=0
  SStopReference N_OCC=0
  STargetReference N_OCC=0
  SPendingEntry N_OCC=0
  SDecision N_OCC=0
  SDiagnosticEvent N_OCC=0
  N_LINES=0
FILE SRJ_Text.mqh LINES=174
  SObjectRef N_OCC=0
  SXobRecord N_OCC=0
  SFvgRecord N_OCC=0
  SStructuralBundle N_OCC=0
  SMarketSnapshot N_OCC=0
  SCandidate N_OCC=0
  SHypothesis N_OCC=0
  SStopReference N_OCC=0
  STargetReference N_OCC=0
  SPendingEntry N_OCC=0
  SDecision N_OCC=0
  SDiagnosticEvent N_OCC=0
  N_LINES=0
FILE SRJ_TickCore.mqh LINES=984
  SObjectRef N_OCC=0
  SXobRecord N_OCC=0
  SFvgRecord N_OCC=0
  SStructuralBundle N_OCC=0
  SMarketSnapshot N_OCC=0
  SCandidate N_OCC=0
  SHypothesis N_OCC=0
  SStopReference N_OCC=0
  STargetReference N_OCC=0
  SPendingEntry N_OCC=0
  SDecision N_OCC=0
  SDiagnosticEvent N_OCC=0
  N_LINES=0
FILE SRJ_Types.mqh LINES=355
  SObjectRef N_OCC=0
  SXobRecord N_OCC=0
  SFvgRecord N_OCC=0
  SStructuralBundle N_OCC=0
  SMarketSnapshot N_OCC=0
  SCandidate N_OCC=0
  SHypothesis N_OCC=0
  SStopReference N_OCC=0
  STargetReference N_OCC=0
  SPendingEntry N_OCC=0
  SDecision N_OCC=0
  SDiagnosticEvent N_OCC=0
  N_LINES=0
```

Census A result: per-file N_LINES = 0 for all sixteen files; every per-pattern N_OCC =
0 in every file. Paste count = 0, equal to the summed per-file N_LINES (A5: no
completeness verdict is built on any summed per-pattern total; the zero here is the
per-file N_LINES result itself). The packet's expected result — zero hits in all
sixteen files for all twelve — is met. No BLOCKED-FOR-COUNCIL condition arises.

Census B — five field and enum identifiers. PATTERN AS SUPPLIED (verbatim):
  objId             relevanceTime      legToken           bundleId
  adverseLatches
ASSERTION: PATTERN AS SUPPLIED. SCOPE: WHOLE FILE per file, LINES 1 THROUGH <count>.
Same matching and counting rules as Census A; executed as two commands (files 1-8, then
files 9-16) to keep each console capture complete; identical logic to Census A with
$pats=@('objId','relevanceTime','legToken','bundleId','adverseLatches').

Census B console output, complete (files 1-8):

```
FILE SRJ_FlowNexus_EA.mq5 LINES=3202
  objId N_OCC=0
  relevanceTime N_OCC=0
  legToken N_OCC=0
  bundleId N_OCC=0
  adverseLatches N_OCC=0
  N_LINES=0
FILE SRJ_FlowLogic.mq5 LINES=1242
  objId N_OCC=2
  relevanceTime N_OCC=0
  legToken N_OCC=0
  bundleId N_OCC=0
  adverseLatches N_OCC=0
  N_LINES=2
  HIT 1028:                   g_bufXobObjId[target]    = (double)xob.objId;   // [Task 102] [matched: objId]
  HIT 1090:                   g_bufFvgObjId[target]       = (double)freshFvg.objId;   // [Task 102] [matched: objId]
FILE SRJ_Alerts.mqh LINES=50
  objId N_OCC=0
  relevanceTime N_OCC=0
  legToken N_OCC=0
  bundleId N_OCC=0
  adverseLatches N_OCC=0
  N_LINES=0
FILE SRJ_BiasEngine.mqh LINES=399
  objId N_OCC=0
  relevanceTime N_OCC=0
  legToken N_OCC=0
  bundleId N_OCC=0
  adverseLatches N_OCC=0
  N_LINES=0
FILE SRJ_Draw.mqh LINES=333
  objId N_OCC=0
  relevanceTime N_OCC=0
  legToken N_OCC=0
  bundleId N_OCC=0
  adverseLatches N_OCC=0
  N_LINES=0
FILE SRJ_Fractals.mqh LINES=205
  objId N_OCC=0
  relevanceTime N_OCC=0
  legToken N_OCC=0
  bundleId N_OCC=0
  adverseLatches N_OCC=0
  N_LINES=0
FILE SRJ_HTFEngine.mqh LINES=579
  objId N_OCC=0
  relevanceTime N_OCC=0
  legToken N_OCC=0
  bundleId N_OCC=0
  adverseLatches N_OCC=0
  N_LINES=0
FILE SRJ_ImbalanceMgr.mqh LINES=546
  objId N_OCC=0
  relevanceTime N_OCC=0
  legToken N_OCC=0
  bundleId N_OCC=0
  adverseLatches N_OCC=0
  N_LINES=0

Census B console output, complete (files 9-16):

```
FILE SRJ_OrderblockMgr.mqh LINES=1139
  objId N_OCC=12
  relevanceTime N_OCC=0
  legToken N_OCC=0
  bundleId N_OCC=0
  adverseLatches N_OCC=0
  N_LINES=10
  HIT 176:                Print("[SRJ][T155][OBPROV] code=1 id=", ob.objId, " bar=", discoveryBar, " flag=false"); [matched: objId]
  HIT 177:                g_s.tickOBSetterId   = ob.objId; [matched: objId]
  HIT 186:                Print("[SRJ][T155][OBPROV] code=2 id=", ob.objId, " bar=", discoveryBar, " flag=true"); [matched: objId]
  HIT 187:                g_s.tickOBSetterId   = ob.objId; [matched: objId]
  HIT 558:                      Print("[SRJ][T155][OBPROV] code=3 id=", ob.objId, " bar=", i, " flag=false"); [matched: objId]
  HIT 559:                      g_s.tickOBSetterId   = ob.objId; [matched: objId]
  HIT 568:                      Print("[SRJ][T155][OBPROV] code=4 id=", ob.objId, " bar=", i, " flag=true"); [matched: objId]
  HIT 569:                      g_s.tickOBSetterId   = ob.objId; [matched: objId]
  HIT 911:             " objId=", lockedOB.objId, [matched: objId]
  HIT 957:                   " objId=", obCheck.objId, [matched: objId]
FILE SRJ_Panels.mqh LINES=439
  objId N_OCC=0
  relevanceTime N_OCC=0
  legToken N_OCC=0
  bundleId N_OCC=0
  adverseLatches N_OCC=0
  N_LINES=0
FILE SRJ_SeedFormat.mqh LINES=694
  objId N_OCC=0
  relevanceTime N_OCC=0
  legToken N_OCC=0
  bundleId N_OCC=0
  adverseLatches N_OCC=0
  N_LINES=0
FILE SRJ_Sessions.mqh LINES=582
  objId N_OCC=0
  relevanceTime N_OCC=0
  legToken N_OCC=0
  bundleId N_OCC=0
  adverseLatches N_OCC=0
  N_LINES=0
FILE SRJ_State.mqh LINES=516
  objId N_OCC=0
  relevanceTime N_OCC=0
  legToken N_OCC=0
  bundleId N_OCC=0
  adverseLatches N_OCC=0
  N_LINES=0
FILE SRJ_Text.mqh LINES=174
  objId N_OCC=0
  relevanceTime N_OCC=0
  legToken N_OCC=0
  bundleId N_OCC=0
  adverseLatches N_OCC=0
  N_LINES=0
FILE SRJ_TickCore.mqh LINES=984
  objId N_OCC=0
  relevanceTime N_OCC=0
  legToken N_OCC=0
  bundleId N_OCC=0
  adverseLatches N_OCC=0
  N_LINES=0
FILE SRJ_Types.mqh LINES=355
  objId N_OCC=6
  relevanceTime N_OCC=0
  legToken N_OCC=0
  bundleId N_OCC=0
  adverseLatches N_OCC=0
  N_LINES=6
  HIT 63:    long     objId;              // [Task 98a] immutable identity, set at construction [matched: objId]
  HIT 85:       objId             = 0;           // [Task 98a] 0 = unassigned [matched: objId]
  HIT 114:    long     objId;               // [Task 98a] immutable identity, set at construction [matched: objId]
  HIT 132:       objId        = 0;         // [Task 98a] 0 = unassigned [matched: objId]
  HIT 274:    ob.objId             = SRJ_NextObjId();   // [Task 98a] [matched: objId]
  HIT 302:    fvg.objId        = SRJ_NextObjId();   // [Task 98a] [matched: objId]
```

Census B result: relevanceTime, legToken, bundleId, adverseLatches — N_OCC=0 and
N_LINES=0 in every one of the sixteen files. objId — per-file N_OCC: SRJ_FlowLogic.mq5
2, SRJ_OrderblockMgr.mqh 12 (N_LINES=10: lines 911 and 957 each carry two whole-token
occurrences, one inside the string literal " objId=" and one in the member access that
follows it; each distinct line is pasted exactly once), SRJ_Types.mqh 6, all other
thirteen files 0. objId is a live member of COrderblock (SRJ_Types.mqh line 63) and
CImbalance (line 114) and is read/written in the three files pasted above. Every hit is
pasted above; paste count 18 equals the summed per-file N_LINES (2+10+6).

STAGE 4  4a-4e, full-line pastes with line numbers

4a  SState's declaration and matching }. Located by census, bounded by brace counting.
    A column-0 ^struct SState scan of SRJ_State.mqh (same scanner preamble as STAGE 2;
    file decoded byte-faithfully with codepage 28591) returned the single region:

    HEADER 96 | PARAM LIST NOT APPLICABLE | OPENING BRACE 97 | CLOSING BRACE 257 |
    BODY LINES 161 | HEADER-INCLUSIVE LINES 162

    Containing file: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_State.mqh
    (516 lines). First line after the region: 258 (blank); line 259 is `SState g_s;`.
    Brace counting confirmed: depth increments at line 97's `{` and returns to zero at
    line 257's `};`.

    PASTED FROM 96 THROUGH 257
    PASTED LINE COUNT 162
    DECLARED SPAN COUNT 162
    ASSERTION: PASTE COMPLETE

```
96: struct SState
97:   {
98:    double   priceATRValue;
99:    int      effectiveLookback;
100:    int      baseLookback;
101:    int      robustnessLimitBars;
102:    int      usedBars;
103:    double   coverageDays;
104:    string   coverageText;
105:
106:    string   currentBias;
107:    int      currentStructureStartBar;
108:    int      lastRelevantStructureBar;
109:    int      lastBullishOBInvalidationBar;
110:    int      lastBearishOBInvalidationBar;
111:    int      newAnchorBar;
112:    int      bestBullishOBBar;
113:    double   bestBullishOBHigh;
114:    double   bestBullishOBLow;
115:    double   bestBullishOBOpen;
116:    int      bestBearishOBBar;
117:    double   bestBearishOBHigh;
118:    double   bestBearishOBLow;
119:    double   bestBearishOBOpen;
120:    int      cachedSwingBarBullish;
121:    int      cachedSwingBarBearish;
122:    int      obInvalidationBoundary;
123:    int      fvgDetectionBoundary;
124:    bool     currentLegHasXOB;      // [Section 8] true once any promotion resolves within the current leg
125:    int      structLegBoundary;     // [EA-30] structural-leg boundary; advances only on initial bias, flip, fvgRenewal
126:    bool     tickOBIsValid;
127:    bool     tickFVGIsValid;
128:    bool     hasPersistedOpposingFVG;
129:    int      inBiasOBInvalidationCount;
130:    int      opposingOBInvalidationCount;
131:    int      bullishOBInvalidationCount;
132:    int      bearishOBInvalidationCount;
133:    int      firstBullishOBInvalidationBar;
134:    int      firstBearishOBInvalidationBar;
135:    bool     bullishOBCountedThisBar;
136:    bool     bearishOBCountedThisBar;
137:    int      bullishOBInvalidationsThisBar;
138:    int      bearishOBInvalidationsThisBar;
139:    bool     isDoubleOB;
140:    bool     isInitialFlipBar;
141:    bool     checklistActivated;
142:    bool     weakFlipPreconditionMet;
143:    bool     suppressBiasPaneStatusThisBar;
144:    bool     structureConfirmedThisBar;
145:    bool     wasBiasFlip;
146:    string   oldBias;
147:    bool     justChangedBias;
148:    bool     initialBiasJustSet;
149:    bool     drawBiasLineNow;
150:    string   newBiasDirection;
151:    bool     drawStructureRenewalLineNow;
152:    string   renewalDirection;
153:    bool     bullishBiasFlipAlert;
154:    bool     bearishBiasFlipAlert;
155:    bool     bullishStructureRenewalAlert;
156:    bool     bearishStructureRenewalAlert;
157:    string   biasLabelName;
158:    int      lastRenewalOBBar;
159:    int      pendingPromoteBar;
160:    string   pendingPromoteBias;
161:    string   pendingPromoteMode;
162:    int      pendingPromoteBoundary;
163:    int      pendingPromoteTargetBar;
164:    int      pendingPromoteBar2;
165:    string   pendingPromoteBias2;
166:    string   pendingPromoteMode2;
167:    int      pendingPromoteBoundary2;
168:    int      pendingPromoteTargetBar2;
169:    int      safeLimitBar;
170:    int      strictLimitBar;
171:    bool     withinLookbackWindow;
172:
173:    int      sessDay;
174:    int      sessLastProcessedBar;   // NEW: exactly-once commit watermark
175:    double   dayHigh;
176:    double   dayLow;
177:    double   prevDayHigh;
178:    double   prevDayLow;
179:    double   asiaHigh;
180:    double   asiaLow;
181:    double   londonHigh;
182:    double   londonLow;
183:    double   nyHigh;
184:    double   nyLow;
185:    double   pmHigh;
186:    double   pmLow;
187:
188:    // FIX: Previous session highs/lows â cached before reset so inter-session
189:    //      gap sweeps can still reference the just-ended session's levels.
190:    double   prevAsiaHigh;
191:    double   prevAsiaLow;
192:    double   prevLondonHigh;
193:    double   prevLondonLow;
194:    double   prevNYHigh;
195:    double   prevNYLow;
196:    double   prevPMHigh;
197:    double   prevPMLow;
198:
199:    bool     asiaHighSwept;
200:    bool     asiaLowSwept;
201:    bool     londonHighSwept;
202:    bool     londonLowSwept;
203:    bool     nyHighSwept;
204:    bool     nyLowSwept;
205:    bool     pmHighSwept;
206:    bool     pmLowSwept;
207:    bool     pdHighSwept;
208:    bool     pdLowSwept;
209:    int      dayStartBar;
210:    int      prevDayStartBar;
211:    int      prevDayEndBar;
212:    bool     pdLinesDeletedToday;
213:    bool     pdLinesCreatedForDay;
214:    bool     wasInAsia;
215:    bool     wasInLondon;
216:    bool     wasInNY;
217:    bool     wasInPM;
218:    int      asiaStartBar;
219:    int      londonStartBar;
220:    int      nyStartBar;
221:    int      pmStartBar;
222:    int      asiaSessionDay;
223:    int      londonSessionDay;
224:    int      nySessionDay;
225:    int      pmSessionDay;
226:    string   asiaHighLineName;
227:    string   asiaLowLineName;
228:    string   londonHighLineName;
229:    string   londonLowLineName;
230:    string   nyHighLineName;
231:    string   nyLowLineName;
232:    string   pmHighLineName;
233:    string   pmLowLineName;
234:    string   lastSweepTag;
235:    int      lastSweepBar;
236:    string   erlBias;
237:
238:    string   currentSessionSlot;
239:    int      currentSlotStartBar;
240:    string   freshSweepTag;
241:    int      freshSweepBar;
242:    string   freshSweepExpirySession;
243:    bool     freshSweepExpired;
244:
245:    string   mtfBoxName;
246:    string   dataWarningName;
247:    // [Task 155] Buffer 34 transport. These three fields carry the
248:    // provenance of the tickOBIsValid value to the export block. long is
249:    // required here, not matched: COrderblock declares objId as long in
250:    // SRJ_Types.mqh, and truncating it would make the exported identity
251:    // unverifiable. Exact long-to-double conversion holds only inside the
252:    // safe integer range 9007199254740992. The value contract for the
253:    // exported buffer is stated beside the export write, not here.
254:    long     tickOBSetterId;
255:    int      tickOBSetterCode;
256:    int      tickOBSetterBar;
257:   };
```

A21 annotation for the paste above: SRJ_State.mqh line 188 carries three non-ASCII
bytes — NON-ASCII BYTE AT COLUMN 40, VALUE 0xE2; NON-ASCII BYTE AT COLUMN 41, VALUE
0x80; NON-ASCII BYTE AT COLUMN 42, VALUE 0x94 (a UTF-8 em-dash sequence inside the
comment). This channel writes UTF-8 and cannot carry those raw bytes, so line 188 as
pasted above is BYTE-SUBSTITUTED AT COLUMN 40, VALUE 0xE2; COLUMN 41, VALUE 0x80;
COLUMN 42, VALUE 0x94 — it is NOT presented as verbatim and may not serve as an anchor
without a re-read. Every other line of the 96-257 paste is ASCII CLEAN (whole-file
scan: SRJ_State.mqh carries non-ASCII bytes on lines 94 and 188 only; line 94 is not
pasted here). No verdict in this report is built on line 188.

4b  The last field declared in SState. The STAGE 4 region command mechanically took the
    last line strictly between the opening brace (97) and the closing brace (257) whose
    comment-stripped text terminates in ";" — command output (verbatim):

    4b LAST_FIELD_LINE=256:    int      tickOBSetterBar;

    Full line, number 256: `    int      tickOBSetterBar;`
    Closing } line number: 257 (`  };`). The full line is also visible in the 4a paste
    above (line 256). The preceding lines 254-255 (`long tickOBSetterId;`,
    `int tickOBSetterCode;`) and every earlier field line end the same way; 256 is the
    highest-numbered field line before the closing brace, and no method or nested brace
    exists inside SState (the region scan shows a flat body: brace depth returns to
    zero only at 257).

4c  SRJ_StateInit's definition, span, containing file. Definition-header rule applied
    mechanically: candidates are column-0 lines containing SRJ_StateInit followed by "(".
    One candidate in all sixteen files. Command output (verbatim):

    4c CAND FILE=SRJ_State.mqh LINE=307: void SRJ_StateInit()
      PARAM_LIST_CLOSES=307
      CLASSIFICATION=DEFINITION
      REGION FILE=SRJ_State.mqh KIND=function ID=SRJ_StateInit HEADER=307 PARAM_LIST_CLOSES=307 OPEN_BRACE=308 CLOSING_BRACE=505 BODY_LINES=198 HEADER_INCLUSIVE=199

    Classification: the parameter list closes on the candidate's own line (307) and no
    line from 307 through 307 ends in ";" (the line ends in ")"), so the candidate is a
    DEFINITION and is bounded. Paren counting across the candidate line: one "(" and
    one ")", depth zero at end of line 307.
    NOTE (A20/A26): a first derivation attempt emitted OPEN_BRACE=0 / CLOSING_BRACE=257
    / BODY_LINES=258 / HEADER_INCLUSIVE=-49 because its opening-brace search pattern was
    double-escaped and its loop body executed zero times — COMMAND NOT EXERCISED - ZERO
    ITERATIONS, not cited; the corrected command above, whose opening-brace search uses
    a literal brace test, is the single answer.

    Six-field region (brace counting from line 308's bare "{" to the line where depth
    returns to zero — line 505, indented "   }"):

    HEADER 307 | PARAM LIST CLOSES 307 | OPENING BRACE 308 | CLOSING BRACE 505 |
    BODY LINES 198 | HEADER-INCLUSIVE LINES 199

    Containing file: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_State.mqh

    PASTED FROM 307 THROUGH 505
    PASTED LINE COUNT 199
    DECLARED SPAN COUNT 199
    ASSERTION: PASTE COMPLETE

```
307: void SRJ_StateInit()
308:   {
309:    g_s.priceATRValue       = SRJ_NA_DBL;
310:    g_s.effectiveLookback   = 5000;
311:    g_s.baseLookback        = 5000;
312:    g_s.robustnessLimitBars = 5000;
313:    g_s.usedBars            = 0;
314:    g_s.coverageDays        = 0.0;
315:    g_s.coverageText        = "";
316:
317:    g_s.currentBias                    = SRJ_NA_STR;
318:    g_s.currentStructureStartBar       = SRJ_NA_INT;
319:    g_s.lastRelevantStructureBar       = SRJ_NA_INT;
320:    g_s.lastBullishOBInvalidationBar   = SRJ_NA_INT;
321:    g_s.lastBearishOBInvalidationBar   = SRJ_NA_INT;
322:    g_s.newAnchorBar                   = SRJ_NA_INT;
323:    g_s.bestBullishOBBar               = SRJ_NA_INT;
324:    g_s.bestBullishOBHigh              = SRJ_NA_DBL;
325:    g_s.bestBullishOBLow               = SRJ_NA_DBL;
326:    g_s.bestBullishOBOpen              = SRJ_NA_DBL;
327:    g_s.bestBearishOBBar               = SRJ_NA_INT;
328:    g_s.bestBearishOBHigh              = SRJ_NA_DBL;
329:    g_s.bestBearishOBLow               = SRJ_NA_DBL;
330:    g_s.bestBearishOBOpen              = SRJ_NA_DBL;
331:    g_s.cachedSwingBarBullish          = SRJ_NA_INT;
332:    g_s.cachedSwingBarBearish          = SRJ_NA_INT;
333:    g_s.obInvalidationBoundary         = SRJ_NA_INT;
334:    g_s.fvgDetectionBoundary           = SRJ_NA_INT;
335:    g_s.currentLegHasXOB                = false;   // [Section 8]
336:    g_s.structLegBoundary               = SRJ_NA_INT;   // [EA-30]
337:    g_s.tickOBIsValid                  = true;
338:    // [Task 155] Site code 9 means SRJ_StateInit default, no write since.
339:    // Bar -1 means no bar context exists in this function.
340:    g_s.tickOBSetterId                 = 0;
341:    g_s.tickOBSetterCode               = 9;
342:    g_s.tickOBSetterBar                = -1;
343:    g_s.tickFVGIsValid                 = true;
344:    g_s.hasPersistedOpposingFVG        = false;
345:    g_s.inBiasOBInvalidationCount      = 0;
346:    g_s.opposingOBInvalidationCount    = 0;
347:    g_s.bullishOBInvalidationCount     = 0;
348:    g_s.bearishOBInvalidationCount     = 0;
349:    g_s.firstBullishOBInvalidationBar  = SRJ_NA_INT;
350:    g_s.firstBearishOBInvalidationBar  = SRJ_NA_INT;
351:    g_s.bullishOBCountedThisBar        = false;
352:    g_s.bearishOBCountedThisBar        = false;
353:    g_s.bullishOBInvalidationsThisBar  = 0;
354:    g_s.bearishOBInvalidationsThisBar  = 0;
355:    g_s.isDoubleOB                     = false;
356:    g_s.isInitialFlipBar               = false;
357:    g_s.checklistActivated             = false;
358:    g_s.weakFlipPreconditionMet        = false;
359:    g_s.suppressBiasPaneStatusThisBar  = false;
360:    g_s.structureConfirmedThisBar      = false;
361:    g_s.wasBiasFlip                    = false;
362:    g_s.oldBias                        = SRJ_NA_STR;
363:    g_s.justChangedBias                = false;
364:    g_s.initialBiasJustSet             = false;
365:    g_s.drawBiasLineNow                = false;
366:    g_s.newBiasDirection               = SRJ_NA_STR;
367:    g_s.drawStructureRenewalLineNow    = false;
368:    g_s.renewalDirection               = SRJ_NA_STR;
369:    g_s.bullishBiasFlipAlert           = false;
370:    g_s.bearishBiasFlipAlert           = false;
371:    g_s.bullishStructureRenewalAlert   = false;
372:    g_s.bearishStructureRenewalAlert   = false;
373:    g_s.biasLabelName                  = "";
374:    g_s.lastRenewalOBBar               = SRJ_NA_INT;
375:    g_s.pendingPromoteBar              = SRJ_NA_INT;
376:    g_s.pendingPromoteBias             = SRJ_NA_STR;
377:    g_s.pendingPromoteMode             = SRJ_NA_STR;
378:    g_s.pendingPromoteBoundary         = SRJ_NA_INT;
379:    g_s.pendingPromoteTargetBar        = SRJ_NA_INT;
380:    g_s.pendingPromoteBar2             = SRJ_NA_INT;
381:    g_s.pendingPromoteBias2            = SRJ_NA_STR;
382:    g_s.pendingPromoteMode2            = SRJ_NA_STR;
383:    g_s.pendingPromoteBoundary2        = SRJ_NA_INT;
384:    g_s.pendingPromoteTargetBar2       = SRJ_NA_INT;
385:    g_s.safeLimitBar                   = 0;
386:    g_s.strictLimitBar                 = 0;
387:    g_s.withinLookbackWindow           = false;
388:
389:    g_s.sessDay                = SRJ_NA_INT;
390:    g_s.sessLastProcessedBar   = SRJ_NA_INT;   // NEW
391:    g_s.dayHigh                = SRJ_NA_DBL;
392:    g_s.dayLow                 = SRJ_NA_DBL;
393:    g_s.prevDayHigh            = SRJ_NA_DBL;
394:    g_s.prevDayLow             = SRJ_NA_DBL;
395:    g_s.asiaHigh               = SRJ_NA_DBL;
396:    g_s.asiaLow                = SRJ_NA_DBL;
397:    g_s.londonHigh             = SRJ_NA_DBL;
398:    g_s.londonLow              = SRJ_NA_DBL;
399:    g_s.nyHigh                 = SRJ_NA_DBL;
400:    g_s.nyLow                  = SRJ_NA_DBL;
401:    g_s.pmHigh                 = SRJ_NA_DBL;
402:    g_s.pmLow                  = SRJ_NA_DBL;
403:
404:    // FIX: Initialize previous session high/low cache to NA
405:    g_s.prevAsiaHigh       = SRJ_NA_DBL;
406:    g_s.prevAsiaLow        = SRJ_NA_DBL;
407:    g_s.prevLondonHigh     = SRJ_NA_DBL;
408:    g_s.prevLondonLow      = SRJ_NA_DBL;
409:    g_s.prevNYHigh         = SRJ_NA_DBL;
410:    g_s.prevNYLow          = SRJ_NA_DBL;
411:    g_s.prevPMHigh         = SRJ_NA_DBL;
412:    g_s.prevPMLow          = SRJ_NA_DBL;
413:
414:    g_s.asiaHighSwept      = false;
415:    g_s.asiaLowSwept       = false;
416:    g_s.londonHighSwept    = false;
417:    g_s.londonLowSwept     = false;
418:    g_s.nyHighSwept        = false;
419:    g_s.nyLowSwept         = false;
420:    g_s.pmHighSwept        = false;
421:    g_s.pmLowSwept         = false;
422:    g_s.pdHighSwept        = false;
423:    g_s.pdLowSwept         = false;
424:    g_s.dayStartBar        = SRJ_NA_INT;
425:    g_s.prevDayStartBar    = SRJ_NA_INT;
426:    g_s.prevDayEndBar      = SRJ_NA_INT;
427:    g_s.pdLinesDeletedToday= false;
428:    g_s.pdLinesCreatedForDay=false;
429:    g_s.wasInAsia          = false;
430:    g_s.wasInLondon        = false;
431:    g_s.wasInNY            = false;
432:    g_s.wasInPM            = false;
433:    g_s.asiaStartBar       = SRJ_NA_INT;
434:    g_s.londonStartBar     = SRJ_NA_INT;
435:    g_s.nyStartBar         = SRJ_NA_INT;
436:    g_s.pmStartBar         = SRJ_NA_INT;
437:    g_s.asiaSessionDay     = SRJ_NA_INT;
438:    g_s.londonSessionDay   = SRJ_NA_INT;
439:    g_s.nySessionDay       = SRJ_NA_INT;
440:    g_s.pmSessionDay       = SRJ_NA_INT;
441:    g_s.asiaHighLineName   = "";
442:    g_s.asiaLowLineName    = "";
443:    g_s.londonHighLineName = "";
444:    g_s.londonLowLineName  = "";
445:    g_s.nyHighLineName     = "";
446:    g_s.nyLowLineName      = "";
447:    g_s.pmHighLineName     = "";
448:    g_s.pmLowLineName      = "";
449:    g_s.lastSweepTag       = SRJ_NA_STR;
450:    g_s.lastSweepBar       = SRJ_NA_INT;
451:    g_s.erlBias            = SRJ_NA_STR;
452:
453:    g_s.currentSessionSlot     = SRJ_NA_STR;
454:    g_s.currentSlotStartBar    = SRJ_NA_INT;
455:    g_s.freshSweepTag          = SRJ_NA_STR;
456:    g_s.freshSweepBar          = SRJ_NA_INT;
457:    g_s.freshSweepExpirySession= SRJ_NA_STR;
458:    g_s.freshSweepExpired      = false;
459:
460:    g_s.mtfBoxName      = "";
461:    g_s.dataWarningName = "";
462:
463:    g_orderblocks.FreeMode(true);
464:    g_imbalances.FreeMode(true);
465:    g_biasChangeLines.FreeMode(true);
466:    g_structureRenewalLines.FreeMode(true);
467:    g_pdHighLines.FreeMode(true);
468:    g_pdLowLines.FreeMode(true);
469:    g_asiaHighLines.FreeMode(true);
470:    g_asiaLowLines.FreeMode(true);
471:    g_londonHighLines.FreeMode(true);
472:    g_londonLowLines.FreeMode(true);
473:    g_nyHighLines.FreeMode(true);
474:    g_nyLowLines.FreeMode(true);
475:    g_pmHighLines.FreeMode(true);
476:    g_pmLowLines.FreeMode(true);
477:
478:    g_orderblocks.Clear();
479:    g_imbalances.Clear();
480:    g_biasChangeLines.Clear();
481:    g_structureRenewalLines.Clear();
482:    g_bullishInvalidationBarsHistory.Clear();
483:    g_bearishInvalidationBarsHistory.Clear();
484:    g_pdHighLines.Clear();
485:    g_pdLowLines.Clear();
486:    g_asiaHighLines.Clear();
487:    g_asiaLowLines.Clear();
488:    g_londonHighLines.Clear();
489:    g_londonLowLines.Clear();
490:    g_nyHighLines.Clear();
491:    g_pmLowLines.Clear();
492:    g_pmHighLines.Clear();
493:    g_nyLowLines.Clear();
494:
495:    g_alertBar_bullFlip    = SRJ_NA_INT;
496:    g_alertBar_bearFlip    = SRJ_NA_INT;
497:    g_alertBar_bullRenewal = SRJ_NA_INT;
498:    g_alertBar_bearRenewal = SRJ_NA_INT;
499:    g_alertBar_extPromote  = SRJ_NA_INT;
500:
501:    g_objSeq      = 0;
502:    g_srjObjIdSeq = 0;   // [Task 98a] ids restart with the object arrays
503:    g_newBar      = false;
504:    g_lastBarTime = 0;
505:   }
```

4d  The last assignment inside SRJ_StateInit. Derived by a character-scan command over
    the comment-stripped body (lines 308 through 504): for each line, take the first
    "=" outside strings/comments; the line qualifies if the character after that "=" is
    not "=" and the first non-space character to its left is a letter, digit, "_", or
    "]" (subscript-tolerant per A25). This test implements the assignment-target rule
    for every identifier on the line; it excludes "==", "!=", "<=", ">=" and compound
    operators. Command output (verbatim):

    ASSIGN_MATCH_COUNT=153
    4d LAST_ASSIGN_LINE=504:    g_lastBarTime = 0;

    The last assignment inside SRJ_StateInit is line 504, full line:
    `    g_lastBarTime = 0;`
    (visible as the final assignment before the closing brace, line 505, in the 4c
    paste above). NOTE (A26): two earlier attempts used a regex whose escaping was
    doubled in transit; both executed zero matching iterations and are reported as
    COMMAND NOT EXERCISED - ZERO ITERATIONS and not cited. The character-scan command
    above executed 153 qualifying matches and is the derivation.

4e  Whether every field pasted at 4b has a corresponding initialiser in SRJ_StateInit.
    4b pasted exactly one field line — line 256, `    int      tickOBSetterBar;`.
    Answer by paste:

      field (4b), SRJ_State.mqh line 256:
        `    int      tickOBSetterBar;`
      initialiser, SRJ_StateInit body, SRJ_State.mqh line 342 (in the 4c paste above):
        `    g_s.tickOBSetterBar                = -1;`

    The field identifier tickOBSetterBar appears on line 342 as an assignment target
    (`g_s.tickOBSetterBar` followed by "=", next character not "=", per the same
    character-scan test; it is one of the 153 qualifying assignments). Therefore: YES —
    every field pasted at 4b (the single field tickOBSetterBar) has a corresponding
    initialiser in SRJ_StateInit. No field pasted at 4b lacks an initialiser; no field
    is named as lacking one. The paste, not prose, is the answer; lines 254 and 255
    (tickOBSetterId, tickOBSetterCode) are additionally initialised at lines 340 and
    341, visible in the same paste.

STAGE 5  5a-5d, full-line pastes with line numbers, counts, ordinal positions

One command over the three literal paths (identical include scan to STAGE 2's 2c,
case-sensitive -cmatch, whole file). Command pattern: for each file, print every line
matching ^\s*#\s*include\b with its 1-based number, then INCLUDE_COUNT.

Command output (verbatim, complete):

```
=== FILE SRJ_FlowNexus_EA.mq5
10: #include <SRJ\SRJ_TickCore.mqh>
11: #include <Trade\Trade.mqh>
INCLUDE_COUNT=2
=== FILE SRJ_FlowLogic.mq5
16: #include <SRJ/SRJ_Types.mqh>
17: #include <SRJ/SRJ_State.mqh>
18: #include <SRJ/SRJ_Text.mqh>
19: #include <SRJ/SRJ_Fractals.mqh>
20: #include <SRJ/SRJ_Draw.mqh>
21: #include <SRJ/SRJ_Alerts.mqh>
22: #include <SRJ/SRJ_OrderblockMgr.mqh>
23: #include <SRJ/SRJ_ImbalanceMgr.mqh>
24: #include <SRJ/SRJ_BiasEngine.mqh>
25: #include <SRJ/SRJ_Sessions.mqh>
26: #include <SRJ/SRJ_HTFEngine.mqh>
27: #include <SRJ/SRJ_Panels.mqh>
INCLUDE_COUNT=12
=== FILE SRJ_State.mqh
4: #include "SRJ_Types.mqh"
5: #include <Arrays\ArrayString.mqh>
INCLUDE_COUNT=2
```

5a  SRJ_FlowNexus_EA.mq5 (literal path DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5), file
    order: lines 10, 11 (pasted above). Count = 2. All pasted lines A21 ASCII CLEAN.
5b  SRJ_FlowLogic.mq5 (literal path DF\MQL5\Indicators\SRJ_FlowLogic.mq5), file order:
    lines 16 through 27 (pasted above). Count = 12. All pasted lines A21 ASCII CLEAN.
5c  SRJ_State.mqh (literal path DF\MQL5\Include\SRJ\SRJ_State.mqh), file order: lines
    4, 5 (pasted above). Count = 2. All pasted lines A21 ASCII CLEAN.
5d  Mechanical, direct inclusion only, no transitive inference:
    - In 5a (SRJ_FlowNexus_EA.mq5): SRJ_Types.mqh — NOT DIRECTLY INCLUDED (its two
      includes are SRJ_TickCore.mqh and Trade.mqh).
    - In 5b (SRJ_FlowLogic.mq5): SRJ_Types.mqh — DIRECTLY INCLUDED at ordinal position
      1 of 12 (line 16, #include <SRJ/SRJ_Types.mqh>).
    - In 5c (SRJ_State.mqh): SRJ_Types.mqh — DIRECTLY INCLUDED at ordinal position 1
      of 2 (line 4, #include "SRJ_Types.mqh").

STAGE 6  6a-6c, full-line pastes with line numbers, counts

Locator census — PATTERN AS SUPPLIED: SState, ST_IDLE, ST_S5_GATE_CHECK (three separate
patterns, per-pattern N_OCC and single per-file N_LINES; case-sensitive whole-token;
comment content discarded). ASSERTION: PATTERN AS SUPPLIED. SCOPE: WHOLE FILE per file.
Same command logic as Census A with
$pats=@('SState','ST_IDLE','ST_S5_GATE_CHECK'). ST_IDLE and ST_S5_GATE_CHECK hit ONLY
SRJ_FlowNexus_EA.mq5; SState hits only SRJ_FlowLogic.mq5 (line 122, `SState
g_sSnapshot;`) and SRJ_State.mqh (lines 96, 259). Console output for the
ST_S5_GATE_CHECK rows (complete): SRJ_FlowNexus_EA.mq5 N_OCC=8, N_LINES=8; the other
fifteen files N_OCC=0, N_LINES=0.

6a  The enum containing ST_IDLE. All nine ST_IDLE occurrences in the sixteen files are
    in SRJ_FlowNexus_EA.mq5 (lines 138, 167, 285, 1092, 1426, 1727, 2124, 2172, 2207;
    every hit pasted in the locator census). The occurrence at line 138 lies inside the
    column-0 enum region found by the all-file region scan (same scanner as STAGE 2):

    HEADER 137 | PARAM LIST NOT APPLICABLE | OPENING BRACE 138 | CLOSING BRACE 139 |
    BODY LINES 2 | HEADER-INCLUSIVE LINES 3

    Containing file: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5
    (3202 lines). Enum identifier: ENUM_SRJ_STATE. Brace counting confirmed: depth
    increments at line 138's `{` and returns to zero at line 139's `};`. Both member
    lines carry members on the same line as a brace; a dedicated member-extraction
    command split the brace-stripped interior on commas. Its command output (verbatim):

```
6a REGION FILE=SRJ_FlowNexus_EA.mq5 KIND=enum ID=ENUM_SRJ_STATE HEADER=137 PARAM_LIST=NOT_APPLICABLE OPEN_BRACE=138 CLOSING_BRACE=139 BODY_LINES=2 HEADER_INCLUSIVE=3
DECL 137: enum ENUM_SRJ_STATE
MEMBERLINE 138:   { ST_IDLE, ST_S1_REGIME, ST_S2_LTF_ALIGN, ST_S3_ZONE_WAIT,
MEMBERLINE 139:     ST_S4_ARMED, ST_S5_GATE_CHECK, ST_SIGNAL, ST_ABORT };
MEMBER_COUNT=8
  MEMBER 1: ST_IDLE
  MEMBER 2: ST_S1_REGIME
  MEMBER 3: ST_S2_LTF_ALIGN
  MEMBER 4: ST_S3_ZONE_WAIT
  MEMBER 5: ST_S4_ARMED
  MEMBER 6: ST_S5_GATE_CHECK
  MEMBER 7: ST_SIGNAL
  MEMBER 8: ST_ABORT
6b EQUALS_IN_MEMBERS=False
```

    Declaration line, members in declaration order, and closing } line (full lines):
      137: enum ENUM_SRJ_STATE
      138:   { ST_IDLE, ST_S1_REGIME, ST_S2_LTF_ALIGN, ST_S3_ZONE_WAIT,
      139:     ST_S4_ARMED, ST_S5_GATE_CHECK, ST_SIGNAL, ST_ABORT };
    Member count: 8. All three pasted lines A21 ASCII CLEAN (targeted line scan).
    (A20 note: the all-file region scan's own member-count row printed MEMBER_COUNT=0
    for this region because its member loop scanned strictly between the brace lines
    and both member lines carry a brace; the dedicated extraction command above is the
    single answer for 6a.)

6b  Whether any member of ENUM_SRJ_STATE carries an explicit "=" value. The extraction
    command tested the brace-stripped member interior (both member lines) for "=":
    EQUALS_IN_MEMBERS=False. Full lines for any member carrying "=": ABSENT. No member
    of ENUM_SRJ_STATE carries an explicit value; the eight ordinal comparisons rest on
    declaration order, and a re-expression of item-9 ordinals would be a rewrite of
    positions, not a renumbering of assigned values. (Mechanical statement only; the
    design decision is the council's.)

6c  Every ST_S5_GATE_CHECK hit across all sixteen files. Locator census result:
    SRJ_FlowNexus_EA.mq5 N_OCC=8 (N_LINES=8); SRJ_FlowLogic.mq5, SRJ_Alerts.mqh,
    SRJ_BiasEngine.mqh, SRJ_Draw.mqh, SRJ_Fractals.mqh, SRJ_HTFEngine.mqh,
    SRJ_ImbalanceMgr.mqh, SRJ_OrderblockMgr.mqh, SRJ_Panels.mqh, SRJ_SeedFormat.mqh,
    SRJ_Sessions.mqh, SRJ_State.mqh, SRJ_Text.mqh, SRJ_TickCore.mqh, SRJ_Types.mqh —
    N_OCC=0 each. Count = 8. Every hit, full line, file and number (console output,
    verbatim; all lines A21 ASCII CLEAN by targeted line scan):

```
  HIT 139:     ST_S4_ARMED, ST_S5_GATE_CHECK, ST_SIGNAL, ST_ABORT }; [matched: ST_S5_GATE_CHECK]
  HIT 290:       case ST_S5_GATE_CHECK: return "S5_GATE_CHECK"; [matched: ST_S5_GATE_CHECK]
  HIT 1740:                       (int)(g_state == ST_S5_GATE_CHECK && !g_divLatch)); [matched: ST_S5_GATE_CHECK]
  HIT 1788:    if(g_state >= ST_S3_ZONE_WAIT && g_state <= ST_S5_GATE_CHECK) [matched: ST_S5_GATE_CHECK]
  HIT 1931:    if(g_state >= ST_S4_ARMED && g_state <= ST_S5_GATE_CHECK) [matched: ST_S5_GATE_CHECK]
  HIT 1937:    if(g_state >= ST_S2_LTF_ALIGN && g_state <= ST_S5_GATE_CHECK) [matched: ST_S5_GATE_CHECK]
  HIT 2877:             g_state = ST_S5_GATE_CHECK; [matched: ST_S5_GATE_CHECK]
  HIT 2883:    if(g_state == ST_S5_GATE_CHECK) [matched: ST_S5_GATE_CHECK]
```
    (All eight hits are in DF\MQL5\Experts\SRJ_FlowNexus_EA.mq5; the "FILE
    SRJ_FlowNexus_EA.mq5 LINES=3202" header and the ST_IDLE rows of the same census
    output appear earlier in this stage. No whole-token ST_S5_GATE_CHECK occurrence
    exists in any other file; no INCIDENTAL substring hits arose for this pattern
    anywhere, so Amendment 13's INCIDENTAL-ONLY clause does not fire.)

STAGE 7  sixteen hashes EQUAL | CHANGED; two .ex5 lines UNCHANGED | CHANGED

The STAGE 1 certutil commands (both chained batches, exact strings quoted at STAGE 1)
and both dir /-c commands were re-issued unchanged after every read above. Re-observed
digests, each with its verdict against the STAGE 1 value (case-insensitive per R-57):

1.  SRJ_FlowNexus_EA.mq5   0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322 | EQUAL
2.  SRJ_FlowLogic.mq5      1ea7858f9b1a8f4f42d90d58a0bb8873063d874e40e32a6a4e69dd8099f73b08 | EQUAL
3.  SRJ_Alerts.mqh         a9c9c2ef9e53253d4a1b31de73fb23028d326922d6a655123128f19061ebcdec | EQUAL
4.  SRJ_BiasEngine.mqh     fc1e3871f07439d418d628c3fcdd9a77a1604cbd3a3920296e3f278051e4092b | EQUAL
5.  SRJ_Draw.mqh           fd2b3716d319e34fe904fd593ee8e4ad80479349667150fb5d08f24cf496183e | EQUAL
6.  SRJ_Fractals.mqh       e4b99da55ab278853c6d8fa9bc8fac599306d01e6e5b14ab64682e3f04473597 | EQUAL
7.  SRJ_HTFEngine.mqh      d0b0641278b5885b726b6fdf2797f4a7f4737bcb48c82bf83350ce04df76ce26 | EQUAL
8.  SRJ_ImbalanceMgr.mqh   64cf32756a6a1eb417f2a4a33793f43a27fddd11d243f5d84f5cb8f0880502ae | EQUAL
9.  SRJ_OrderblockMgr.mqh  524d5d40ac1f0c2f6909f01742dfe13fc9a4954118a55b3008fe1cd80d18e60f | EQUAL
10. SRJ_Panels.mqh         199ad6b104cce28a30aa610a632c1fffa42f1d529280e24c33519b81c700c736 | EQUAL
11. SRJ_SeedFormat.mqh     d94b49225f3110c31d5cd66f4fc679721fa5e9a04b8eafcc6c7dba6f2db4eed4 | EQUAL
12. SRJ_Sessions.mqh       a0c8542a4f25dab78d2a7fbbc8cb4eddef87643164cb5038ffbbec27040b0886 | EQUAL
13. SRJ_State.mqh          c6d56bc197af8585517cda2038780f281329bce32b1a9978aa5ea71ecc2efd2e | EQUAL
14. SRJ_Text.mqh           2825d071778e624e4b5837b05954582c215d439441d44cd57b6f4d11ac0e3455 | EQUAL
15. SRJ_TickCore.mqh       89730c6cadfa86f4da7e09877d282bdb1741bd623678ccfb73e7a77d49fea27c | EQUAL
16. SRJ_Types.mqh          773d99444b958b98ce3aeca87690f40b743a5f6a71e47ba9e644d751808e78dc | EQUAL

All sixteen EQUAL — every re-observed digest character-identical to its STAGE 1 value.
Each certutil invocation again emitted its header, digest line and "CertUtil: -hashfile
command completed successfully." echo. A source-only census wrote nothing and compiled
nothing.

Two .ex5 dir /-c file lines, after — UNCHANGED:
  09/05/2026  05:39 PM            226444 SRJ_FlowLogic.ex5
  08/30/2026  10:31 AM            115438 SRJ_FlowNexus_EA.ex5
Both file lines are character-identical to the STAGE 1 RECORD lines and to the packet's
expected figures. The "bytes free" line differs before/after (disk state, not file
provenance; discarded per R-58). No recompile occurred inside this packet.

STAGE 8  resolved report path, byte size, integer line count

  Resolved report path (R-62, builder channel, stated once):
  C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_160-PreK.md
  Post-write verification read: byte size 74892 bytes | integer line count 1425 lines
  (figures measured by Get-Item Length and a physical line count of this file after the
  final write; see the chat channel for the raw verification output).

COLLISION VERDICT, one line, mechanical only:
  twelve contract identifiers: ZERO HITS

Supplementary mechanical line (not the mandated verdict line): of the five field and
enum identifiers censused, four (relevanceTime, legToken, bundleId, adverseLatches)
have ZERO HITS in all sixteen files and one (objId) has hits — 2 in SRJ_FlowLogic.mq5,
12 in SRJ_OrderblockMgr.mqh (10 distinct lines), 6 in SRJ_Types.mqh, pasted at Census B.

End of report.