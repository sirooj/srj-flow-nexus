# TASK 154-Pre3-R: COMPLETED
**Reference documents loaded:** none
**Relay check:** token END-OF-TASK-154-PRE3 **PRESENT** | per-block item counts received: **A 7, B 6, C 9, D 7, E 4** | **COUNT LINE CONSISTENT** (7+6+9+7+4 = 33 = declared 33)
**Files read** (all via shell only; numbered slices via `Get-Content`, locators via case-sensitive `-cmatch`/`-clike` greps, hashes via `certutil`):
```text
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Alerts.mqh
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_BiasEngine.mqh
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Draw.mqh
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Fractals.mqh
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_HTFEngine.mqh
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_ImbalanceMgr.mqh
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_OrderblockMgr.mqh
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Panels.mqh
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_SeedFormat.mqh
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Sessions.mqh
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_State.mqh
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Text.mqh
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_TickCore.mqh
C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Include\SRJ\SRJ_Types.mqh
```
**Files written:** none
**Checkpoints:** none (read-only task)
**Commands that failed:**
1. `function Cens(...){ ... "  $ln: $($L[$ln-1])" ... }` → raw error: `Variable reference is not valid. ':' was not followed by a valid variable name character.` — re-issued with `${ln}:`; census results above come from the corrected run.
2. `function StackOf($f,$O,$Slist){...}` → produced incomplete stacks (PowerShell variables `$O` and `$o` are the same, case-insensitive; the region-open operand was overwritten by the entry loop). Detected by cross-check, re-issued as `StackOf2($f,$reg,$Slist)`; all stacks in this report come from the corrected run. The FL S=904 and BE S=228 stacks from the first run were unaffected and match the corrected run.
**Splits declared:** none — single-part delivery
**Truncations:** none
**Definition-header classifications** (every candidate; fallback reached for NONE):
```text
SRJ_FVG_CreationRenewalPass | candidate SRJ_ImbalanceMgr.mqh 108 | param list closes 110 | DEFINITION (no ';' between 108 and 110) | fallback NOT reached
SRJ_Bias_DecisionBlock      | candidate SRJ_BiasEngine.mqh 149  | param list closes 149 | DEFINITION | fallback NOT reached
SRJ_StateInit               | candidate SRJ_State.mqh 297       | param list closes 297 | DEFINITION | fallback NOT reached
SRJ_DispatchAlert           | candidate SRJ_Alerts.mqh 7        | param list closes 7   | DEFINITION | fallback NOT reached
OnInit  (SRJ_FlowLogic.mq5) | candidate 563 | param list closes 563 | DEFINITION | fallback NOT reached
OnCalculate(SRJ_FlowLogic.mq5)| candidate 705 | param list closes 714 | DEFINITION | fallback NOT reached
ReadFlow  (SRJ_FlowNexus_EA.mq5) | candidate 500 | param list closes 500 | DEFINITION | fallback NOT reached
ReadBuf1  (SRJ_FlowNexus_EA.mq5) | candidate 431 | param list closes 431 | DEFINITION | fallback NOT reached
```
(All non-column-0 occurrences of these names are calls; no column-0 call-candidates exist for any name.)
**Region-bounds convention:** confirmed — every region in every block is reported in the labelled SIX-FIELD form with both counts; no single integer is called "the line count".
**Paste-sizing rule:** A2 WHOLE (BODY LINES 238 ≤ 260; pasted header-inclusive 108–348) | B2 WHOLE (222 ≤ 240; pasted 149–371) | C9 WHOLE (11 ≤ 40; pasted 7–18) | E3 ReadBuf1 WHOLE (6 ≤ 60; pasted 431–437) | E3 ReadFlow WHOLE (3 ≤ 60; pasted 500–503) | C2/C6/D2/D4 bounds only, not pasted per item.
**Brace rule used:** brace counting — confirmed for A1, A5(c), A5(d), B1, B5, C2, C5, C6, C8, C9, D2, D4, D5, E3. Counting ran on comment- and string-stripped text; the tree's only block comments (EA 2000, 2144) contain no braces; no bounded region was the EA OnInit, so the noted decoy `}` never entered any count; indentation was never used.
**Enclosing-construct rule used:** confirmed — FULL open-brace stacks computed; headers resolved by upward scan, never proximity. Region's-own-brace entries are resolved to their region's definition header (stated where used). For-loop/if headers stated explicitly where they occur (D5 entry 820's header is **for** — stated explicitly).
**Attribution rule used:** confirmed — (a) enumerated every parameter whose text contains `*` (none exist in A/B headers); (e1) D<S tested; (e2) tested BOTH the opening AND the brace-counted closing line; (e3) tested stack membership. Per-statement failures named in A5/B5.
**Naming test used:** confirmed — computed only from each statement's own text and the resolved guard headers of its brace stack; NAMED_COUNT reported as an integer per statement.
**Multi-line call rule used:** confirmed — every D3 argument list closes by matching paren on its own line; nothing reported UNTERMINATED. The two multi-line RHS/call constructions in A5(b) (lines 117–118, 234–235) were closed by matching paren across lines and reported JOINED.
**Amendment 15 used:** confirmed — C3 reports the highest declaration and the closing brace as TWO SEPARATE ANSWERS; no `}`-first line reported as a declaration anywhere.
**Census-pattern provenance:** confirmed — `PruningPass` (names a function) was matched as supplied, yielded only INCIDENTAL matches → reported INCIDENTAL-ONLY with containing identifiers; not substituted, not re-run.

# BLOCK A — THE FOUR QUALIFYING WRITE SITES AND THEIR NAMING

## A1 — SRJ_FVG_CreationRenewalPass, definition-header rule incl. fallback
Candidates found (column 0, name followed by `(`, not `//`): **one** — SRJ_ImbalanceMgr.mqh line 108. Parameter list closes line **110**. No line 108..110 ends in `;` → **DEFINITION**. Fallback NOT reached.
Brace counting was used (count on comment/string-stripped text, increment `{`, decrement `}`, stop at zero).
**SIX FIELDS:** `HEADER 108 | PARAM LIST CLOSES 110 | OPENING BRACE 111 | CLOSING BRACE 348 | BODY LINES 238 | HEADER-INCLUSIVE LINES 241`

## A2 — Region paste
**SIX FIELDS (repeat):** `HEADER 108 | PARAM LIST CLOSES 110 | OPENING BRACE 111 | CLOSING BRACE 348 | BODY LINES 238 | HEADER-INCLUSIVE LINES 241`
BODY LINES 238 ≤ 260 → **WHOLE** region pasted, header-inclusive, range 108–348 (braced body = 111–348):

```text
108: void SRJ_FVG_CreationRenewalPass(const double &high[],const double &low[],
109:                                  const datetime &time[],int rates_total,int i,
110:                                  bool withinLookbackWindow,bool barClosed)
111:   {
112:    if(!(withinLookbackWindow && barClosed && g_showFVG && i >= 3))
113:       return;
114:
115:    if(low[i] > srjH(high,i,2))
116:      {
117:       CImbalance *newBullFVG = SRJ_createImbalance(time,rates_total,i,
118:                                  true,i - 2,low[i],srjH(high,i,2),i);
119:       g_imbalances.Add(newBullFVG);
120:
121:       bool fvgWithinStructure = !SrjIsNa(g_s.currentBias);
122:       if(fvgWithinStructure)
123:         {
124:          bool isInBiasFVG = (g_s.currentBias == "bullish");
125:          if(isInBiasFVG)
126:            {
127:             g_s.tickFVGIsValid = true;
128:
129:             // Strict-nearest selection, identical to the promotion path, so the OB
130:             // that triggers the renewal is the same OB the promotion will target.
131:             int  latestOBValidationBar = SRJ_NA_INT;
132:             bool hasNewOB     = false;
133:             int  scanStartBar = SRJ_NA_INT;
134:             int  scanValBar   = SRJ_NA_INT;
135:             bool scanIsNew    = false;
136:             COrderblock *renewalOB = NULL;
137:
138:             int nearestIdx = SRJ_StrictNearestOBIndex("bullish",g_s.obInvalidationBoundary);
139:             if(nearestIdx > -1)
140:               {
141:                COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);
142:                if(nearestOB != NULL && !SrjIsNa(nearestOB.validationBar))
143:                  {
144:                   scanStartBar = nearestOB.startBar;
145:                   scanValBar   = nearestOB.validationBar;
146:                   scanIsNew    = !nearestOB.hasDrivenRenewal;
147:                   if(scanIsNew)
148:                     {
149:                      latestOBValidationBar = nearestOB.validationBar;
150:                      hasNewOB              = true;
151:                      renewalOB             = nearestOB;
152:                     }
153:                  }
154:               }
155:
156:             if(SRJ_InDebugWindow(i))
157:                Print("SRJ FVGREN-SCAN t=", SRJ_BarTimeStr(i), " bar=", i,
158:                      " dir=bullish",
159:                      " nearestIdx=", nearestIdx,
160:                      " obStart=", scanStartBar,
161:                      " obStartT=", SRJ_BarTimeStr(scanStartBar),
162:                      " obVal=", scanValBar,
163:                      " obValT=", SRJ_BarTimeStr(scanValBar),
164:                      " boundary=", g_s.obInvalidationBoundary,
165:                      " boundaryT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),
166:                      " lastRenewalOB=", g_s.lastRenewalOBBar,
167:                      " isNew=", (scanIsNew ? 1 : 0),
168:                      " hasNewOB=", (hasNewOB ? 1 : 0),
169:                      " justChangedBias=", (g_s.justChangedBias ? 1 : 0));
170:
171:             if(nearestIdx < 0)
172:                SRJ_DumpNearestOBCandidates(i,"bullish",g_s.obInvalidationBoundary);
173:
174:             if(hasNewOB && !g_s.justChangedBias)
175:               {
176:                // --- PRE-RESET STATE RECORDER ---
177:                if(g_htfDebugLog &&
178:                   (g_s.bullishOBInvalidationCount > 0 || g_s.bearishOBInvalidationCount > 0))
179:                   Print("SRJ FVGREN-PRE t=", SRJ_BarTimeStr(i), " bar=", i,
180:                         " dir=", g_s.currentBias,
181:                         " bull=", g_s.bullishOBInvalidationCount,
182:                         " bear=", g_s.bearishOBInvalidationCount,
183:                         " tickOB=", g_s.tickOBIsValid,
184:                         " tickFVG=", g_s.tickFVGIsValid,
185:                         " persistOppFVG=", g_s.hasPersistedOpposingFVG,
186:                         " checklistAct=", g_s.checklistActivated,
187:                         " structStart=", g_s.currentStructureStartBar,
188:                         " obInvBoundBefore=", g_s.obInvalidationBoundary,
189:                         " crossSeg=", (!SrjIsNa(g_s.obInvalidationBoundary) &&
190:                                        g_s.obInvalidationBoundary > g_s.currentStructureStartBar),
191:                         " resetOn=true");
192:                // ------------------------------
193:
194:                g_s.isDoubleOB = false;
195:                g_s.lastRelevantStructureBar = i;
196:                g_s.structureConfirmedThisBar = true;
197:                g_s.drawStructureRenewalLineNow = true;
198:                g_s.renewalDirection = "bullish";
199:                g_s.hasPersistedOpposingFVG = false;
200:
201:                g_s.bullishStructureRenewalAlert = true;
202:                g_s.structLegBoundary = i - 2;   // [EA-30] fvgRenewal opens a leg; anchor to opener startBar (i-2)
203:                SRJ_QueueNearestPromotion(i,"bullish",g_s.obInvalidationBoundary,1);
204:                if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true;
205:                g_s.lastRenewalOBBar = latestOBValidationBar;   // kept for logging
206:                g_s.obInvalidationBoundary = i;
207:                g_s.fvgDetectionBoundary = i;
208:
209:                g_s.tickOBIsValid                 = true;
210:                g_s.tickFVGIsValid                = true;
211:                // Selective reset: bullish bias renewal zeros bearish (opposing) counter only
212:                g_s.bearishOBInvalidationCount    = 0;
213:                g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;
214:                g_s.checklistActivated            = false;
215:
216:                if(g_htfDebugLog)
217:                   Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
218:                         " kind=fvgRenewal",
219:                         " bias=", g_s.currentBias,
220:                         " resetOn=true");
221:               }
222:            }
223:          else
224:            {
225:             // Opposing FVG under a bearish bias.
226:             g_s.hasPersistedOpposingFVG = true;
227:             SRJ_QueueOpposingPromotion(i,"bullish");
228:            }
229:         }
230:      }
231:
232:    if(high[i] < srjL(low,i,2))
233:      {
234:       CImbalance *newBearFVG = SRJ_createImbalance(time,rates_total,i,
235:                                  false,i - 2,srjL(low,i,2),high[i],i);
236:       g_imbalances.Add(newBearFVG);
237:
238:       bool fvgWithinStructure = !SrjIsNa(g_s.currentBias);
239:       if(fvgWithinStructure)
240:         {
241:          bool isInBiasFVG = (g_s.currentBias == "bearish");
242:          if(isInBiasFVG)
243:            {
244:             g_s.tickFVGIsValid = true;
245:
246:             // Strict-nearest selection, identical to the promotion path, so the OB
247:             // that triggers the renewal is the same OB the promotion will target.
248:             int  latestOBValidationBar = SRJ_NA_INT;
249:             bool hasNewOB     = false;
250:             int  scanStartBar = SRJ_NA_INT;
251:             int  scanValBar   = SRJ_NA_INT;
252:             bool scanIsNew    = false;
253:             COrderblock *renewalOB = NULL;
254:
255:             int nearestIdx = SRJ_StrictNearestOBIndex("bearish",g_s.obInvalidationBoundary);
256:             if(nearestIdx > -1)
257:               {
258:                COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);
259:                if(nearestOB != NULL && !SrjIsNa(nearestOB.validationBar))
260:                  {
261:                   scanStartBar = nearestOB.startBar;
262:                   scanValBar   = nearestOB.validationBar;
263:                   scanIsNew    = !nearestOB.hasDrivenRenewal;
264:                   if(scanIsNew)
265:                     {
266:                      latestOBValidationBar = nearestOB.validationBar;
267:                      hasNewOB              = true;
268:                      renewalOB             = nearestOB;
269:                     }
270:                  }
271:               }
272:
273:             if(SRJ_InDebugWindow(i))
274:                Print("SRJ FVGREN-SCAN t=", SRJ_BarTimeStr(i), " bar=", i,
275:                      " dir=bearish",
276:                      " nearestIdx=", nearestIdx,
277:                      " obStart=", scanStartBar,
278:                      " obStartT=", SRJ_BarTimeStr(scanStartBar),
279:                      " obVal=", scanValBar,
280:                      " obValT=", SRJ_BarTimeStr(scanValBar),
281:                      " boundary=", g_s.obInvalidationBoundary,
282:                      " boundaryT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),
283:                      " lastRenewalOB=", g_s.lastRenewalOBBar,
284:                      " isNew=", (scanIsNew ? 1 : 0),
285:                      " hasNewOB=", (hasNewOB ? 1 : 0),
286:                      " justChangedBias=", (g_s.justChangedBias ? 1 : 0));
287:
288:             if(nearestIdx < 0)
289:                SRJ_DumpNearestOBCandidates(i,"bearish",g_s.obInvalidationBoundary);
290:
291:             if(hasNewOB && !g_s.justChangedBias)
292:               {
293:                // --- PRE-RESET STATE RECORDER ---
294:                if(g_htfDebugLog &&
295:                   (g_s.bullishOBInvalidationCount > 0 || g_s.bearishOBInvalidationCount > 0))
296:                   Print("SRJ FVGREN-PRE t=", SRJ_BarTimeStr(i), " bar=", i,
297:                         " dir=", g_s.currentBias,
298:                         " bull=", g_s.bullishOBInvalidationCount,
299:                         " bear=", g_s.bearishOBInvalidationCount,
300:                         " tickOB=", g_s.tickOBIsValid,
301:                         " tickFVG=", g_s.tickFVGIsValid,
302:                         " persistOppFVG=", g_s.hasPersistedOpposingFVG,
303:                         " checklistAct=", g_s.checklistActivated,
304:                         " structStart=", g_s.currentStructureStartBar,
305:                         " obInvBoundBefore=", g_s.obInvalidationBoundary,
306:                         " crossSeg=", (!SrjIsNa(g_s.obInvalidationBoundary) &&
307:                                        g_s.obInvalidationBoundary > g_s.currentStructureStartBar),
308:                         " resetOn=true");
309:                // ------------------------------
310:
311:                g_s.isDoubleOB = false;
312:                g_s.lastRelevantStructureBar = i;
313:                g_s.structureConfirmedThisBar = true;
314:                g_s.drawStructureRenewalLineNow = true;
315:                g_s.renewalDirection = "bearish";
316:                g_s.hasPersistedOpposingFVG = false;
317:
318:                g_s.bearishStructureRenewalAlert = true;
319:                g_s.structLegBoundary = i - 2;   // [EA-30] fvgRenewal opens a leg; anchor to opener startBar (i-2)
320:                SRJ_QueueNearestPromotion(i,"bearish",g_s.obInvalidationBoundary,1);
321:                if(renewalOB != NULL) renewalOB.hasDrivenRenewal = true;
322:                g_s.lastRenewalOBBar = latestOBValidationBar;   // kept for logging
323:                g_s.obInvalidationBoundary = i;
324:                g_s.fvgDetectionBoundary = i;
325:
326:                g_s.tickOBIsValid                 = true;
327:                g_s.tickFVGIsValid                = true;
328:                // Selective reset: bearish bias renewal zeros bullish (opposing) counter only
329:                g_s.bullishOBInvalidationCount    = 0;
330:                g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;
331:                g_s.checklistActivated            = false;
332:
333:                if(g_htfDebugLog)
334:                   Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
335:                         " kind=fvgRenewal",
336:                         " bias=", g_s.currentBias,
337:                         " resetOn=true");
338:               }
339:            }
340:          else
341:            {
342:             // Opposing FVG under a bullish bias â€” the 16:05 EURUSD M5 case.
343:             g_s.hasPersistedOpposingFVG = true;
344:             SRJ_QueueOpposingPromotion(i,"bearish");
345:            }
346:         }
347:      }
348:   }
```

## A3 — Parameters (from A2 paste; parameter list spans lines 108–110, pasted above)
```text
1 | const double &high[]      | BY REFERENCE | CONTAINS-ASTERISK: no
2 | const double &low[]       | BY REFERENCE | CONTAINS-ASTERISK: no
3 | const datetime &time[]    | BY REFERENCE | CONTAINS-ASTERISK: no
4 | int rates_total           | BY VALUE     | CONTAINS-ASTERISK: no
5 | int i                     | BY VALUE     | CONTAINS-ASTERISK: no
6 | bool withinLookbackWindow | BY VALUE     | CONTAINS-ASTERISK: no
7 | bool barClosed            | BY VALUE     | CONTAINS-ASTERISK: no
```

## A4 — Lines assigning to hasPersistedOpposingFVG (paste searched: the A2 paste, 108–348; comment-excluded per Amendment 3)
```text
199:                 g_s.hasPersistedOpposingFVG = false;            | RHS: false
226:              g_s.hasPersistedOpposingFVG = true;                | RHS: true
316:                 g_s.hasPersistedOpposingFVG = false;            | RHS: false
343:              g_s.hasPersistedOpposingFVG = true;                | RHS: true
```
(Exact pasted texts — leading whitespace verbatim:)
```text
199:                g_s.hasPersistedOpposingFVG = false;
226:             g_s.hasPersistedOpposingFVG = true;
316:                g_s.hasPersistedOpposingFVG = false;
343:             g_s.hasPersistedOpposingFVG = true;
```
**Count = 4.** (Lines 185 and 302 contain the identifier inside Print argument lists — occurrence followed by `,`, no `=` reached by rule (2) → not assignments.)

## A5 — Attribution rule (Amendment 14), per A4 statement
**(a) Pointer parameters of the region's definition header (lines 108–110):** every parameter's text was checked for `*`; **none contains `*`** → empty list (reported so that the "(a) is not skipped" trap is visibly closed).

**(b) Variables in the A2 paste declared with a pointer type or assigned from a call whose name contains create/New/Get/At** (mechanical scan of 108–348; no `At(`, no `new `, no other `Get*` calls exist in the paste):
```text
117:       CImbalance *newBullFVG = SRJ_createImbalance(time,rates_total,i,          | newBullFVG | RHS JOINED: SRJ_createImbalance(time,rates_total,i, true,i - 2,low[i],srjH(high,i,2),i) | D=117
118:                                  true,i - 2,low[i],srjH(high,i,2),i);           (RHS terminator ';' on line 118 — multi-line, pasted, JOINED)
136:             COrderblock *renewalOB = NULL;                                      | renewalOB  | RHS: NULL                                    | D=136
141:                COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);        | nearestOB  | RHS: GetOB(g_orderblocks,nearestIdx)         | D=141
234:       CImbalance *newBearFVG = SRJ_createImbalance(time,rates_total,i,          | newBearFVG | RHS JOINED: SRJ_createImbalance(time,rates_total,i, false,i - 2,srjL(low,i,2),high[i],i) | D=234
235:                                  false,i - 2,srjL(low,i,2),high[i],i);          (RHS terminator ';' on line 235 — multi-line, pasted, JOINED)
253:             COrderblock *renewalOB = NULL;                                      | renewalOB  | RHS: NULL                                    | D=253
258:                COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);        | nearestOB  | RHS: GetOB(g_orderblocks,nearestIdx)         | D=258
```

**(c) Full open-brace stack per statement** (brace-counted, from region opening brace 111; outermost first):
```text
S=199: 111–348 (region, header 108) → 116–230 → 123–229 → 126–222 → 175–221
S=226: 111–348 (region, header 108) → 116–230 → 123–229 → 224–228
S=316: 111–348 (region, header 108) → 233–347 → 240–346 → 243–339 → 292–338
S=343: 111–348 (region, header 108) → 233–347 → 240–346 → 341–345
```

**(d) Innermost brace-counted entry containing each (b) declaration line** [Dopen, Dclose]:
```text
newBullFVG  D=117 → [116, 230]
renewalOB   D=136 → [126, 222]
nearestOB   D=141 → [140, 154]
newBearFVG  D=234 → [233, 347]
renewalOB   D=253 → [243, 339]
nearestOB   D=258 → [257, 271]
```

**(e) Scope test per statement, per candidate** (each of (e1)/(e2)/(e3) reported):

**S=199** — stack {(111,348),(116,230),(123,229),(126,222),(175,221)}
| candidate | e1 D<S | e2 Dopen≤S≤Dclose | e3 entry in stack | verdict |
|---|---|---|---|---|
| newBullFVG (117,[116,230]) | YES 117<199 | YES 116≤199≤230 | YES [116,230]∈stack | **IN SCOPE** |
| renewalOB (136,[126,222]) | YES 136<199 | YES 126≤199≤222 | YES [126,222]∈stack | **IN SCOPE** |
| nearestOB (141,[140,154]) | YES 141<199 | NO 199≤154 fails | NO [140,154]∉stack | NOT IN SCOPE (fails e2 and e3) |
| newBearFVG (234) | NO 234<199 fails | — | — | NOT IN SCOPE (fails e1) |
| renewalOB (253) | NO | — | — | NOT IN SCOPE (fails e1) |
| nearestOB (258) | NO | — | — | NOT IN SCOPE (fails e1) |

**S=226** — stack {(111,348),(116,230),(123,229),(224,228)}
| candidate | e1 | e2 | e3 | verdict |
|---|---|---|---|---|
| newBullFVG (117,[116,230]) | YES 117<226 | YES 116≤226≤230 | YES | **IN SCOPE** |
| renewalOB (136,[126,222]) | YES 136<226 | NO 226≤222 fails | NO [126,222]∉stack | NOT IN SCOPE (fails e2 and e3) |
| nearestOB (141,[140,154]) | YES | NO 226≤154 fails | NO | NOT IN SCOPE (fails e2 and e3) |
| newBearFVG (234) | NO | — | — | NOT IN SCOPE (fails e1) |
| renewalOB (253) | NO | — | — | NOT IN SCOPE (fails e1) |
| nearestOB (258) | NO | — | — | NOT IN SCOPE (fails e1) |

**S=316** — stack {(111,348),(233,347),(240,346),(243,339),(292,338)}
| candidate | e1 | e2 | e3 | verdict |
|---|---|---|---|---|
| newBullFVG (117,[116,230]) | YES 117<316 | NO 316≤230 fails | NO [116,230]∉stack | NOT IN SCOPE (fails e2 and e3) |
| renewalOB (136,[126,222]) | YES | NO 316≤222 fails | NO | NOT IN SCOPE (fails e2 and e3) |
| nearestOB (141,[140,154]) | YES | NO 316≤154 fails | NO | NOT IN SCOPE (fails e2 and e3) |
| newBearFVG (234,[233,347]) | YES 234<316 | YES 233≤316≤347 | YES | **IN SCOPE** |
| renewalOB (253,[243,339]) | YES 253<316 | YES 243≤316≤339 | YES | **IN SCOPE** |
| nearestOB (258,[257,271]) | YES 258<316 | NO 316≤271 fails | NO [257,271]∉stack | NOT IN SCOPE (fails e2 and e3) |

**S=343** — stack {(111,348),(233,347),(240,346),(341,345)}
| candidate | e1 | e2 | e3 | verdict |
|---|---|---|---|---|
| newBullFVG (117,[116,230]) | YES | NO 343≤230 fails | NO | NOT IN SCOPE (fails e2 and e3) |
| renewalOB (136,[126,222]) | YES | NO 343≤222 fails | NO | NOT IN SCOPE (fails e2 and e3) |
| nearestOB (141,[140,154]) | YES | NO 343≤154 fails | NO | NOT IN SCOPE (fails e2 and e3) |
| newBearFVG (234,[233,347]) | YES 234<343 | YES 233≤343≤347 | YES | **IN SCOPE** |
| renewalOB (253,[243,339]) | YES 253<343 | NO 343≤339 fails | NO [243,339]∉stack | NOT IN SCOPE (fails e2 and e3) |
| nearestOB (258,[257,271]) | YES | NO 343≤271 fails | NO | NOT IN SCOPE (fails e2 and e3) |

## A6 — NAMING TEST per A4 statement (paste searched: A2 paste)
Guard headers resolved per stack entry (entry line → header by upward scan; region brace → region definition header):
```text
Entry 111 → HEADER 108: void SRJ_FVG_CreationRenewalPass(const double &high[],const double &low[],   (region definition header)
Entry 116 → HEADER 115:     if(low[i] > srjH(high,i,2))
Entry 123 → HEADER 122:       if(fvgWithinStructure)
Entry 126 → HEADER 125:          if(isInBiasFVG)
Entry 175 → HEADER 174:             if(hasNewOB && !g_s.justChangedBias)
Entry 224 → HEADER 223:          else
Entry 233 → HEADER 232:     if(high[i] < srjL(low,i,2))
Entry 240 → HEADER 239:       if(fvgWithinStructure)
Entry 243 → HEADER 242:          if(isInBiasFVG)
Entry 292 → HEADER 291:             if(hasNewOB && !g_s.justChangedBias)
Entry 341 → HEADER 340:          else
```
No entry is HEADER UNRESOLVED.

**S=199** — in-scope candidates: newBullFVG, renewalOB
- newBullFVG: OCCURS-IN-STATEMENT: no | OCCURS-IN-A-GUARD-HEADER: no
- renewalOB: OCCURS-IN-STATEMENT: no | OCCURS-IN-A-GUARD-HEADER: no
- **NAMED_COUNT = 0** → NOT NAMED

**S=226** — in-scope candidate: newBullFVG
- newBullFVG: OCCURS-IN-STATEMENT: no | OCCURS-IN-A-GUARD-HEADER: no
- **NAMED_COUNT = 0** → NOT NAMED

**S=316** — in-scope candidates: newBearFVG, renewalOB(line 253)
- newBearFVG: OCCURS-IN-STATEMENT: no | OCCURS-IN-A-GUARD-HEADER: no
- renewalOB: OCCURS-IN-STATEMENT: no | OCCURS-IN-A-GUARD-HEADER: no
- **NAMED_COUNT = 0** → NOT NAMED

**S=343** — in-scope candidate: newBearFVG
- newBearFVG: OCCURS-IN-STATEMENT: no | OCCURS-IN-A-GUARD-HEADER: no
- **NAMED_COUNT = 0** → NOT NAMED

## A7 — Census within A2 paste (108–348), comment-excluded, case-sensitive, repeats counted
```text
objId              N_OCC 0  → ABSENT
COrderblock        N_OCC 4
CImbalance         N_OCC 2
GetOB              N_OCC 2
GetFVG             N_OCC 0  → ABSENT
SRJ_createImbalance N_OCC 2
SRJ_NextObjId      N_OCC 0  → ABSENT
N_LINES (distinct lines matching ≥1 pattern) = 6
```
```text
117:       CImbalance *newBullFVG = SRJ_createImbalance(time,rates_total,i,          [matched: CImbalance, SRJ_createImbalance]
136:             COrderblock *renewalOB = NULL;                                      [matched: COrderblock]
141:                COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);        [matched: COrderblock, GetOB]
234:       CImbalance *newBearFVG = SRJ_createImbalance(time,rates_total,i,          [matched: CImbalance, SRJ_createImbalance]
253:             COrderblock *renewalOB = NULL;                                      [matched: COrderblock]
258:                COrderblock *nearestOB = GetOB(g_orderblocks,nearestIdx);        [matched: COrderblock, GetOB]
```
All matches are whole-token (none INCIDENTAL). N_LINES (6) is a single per-region figure; per-pattern N_OCCs were never summed to build it.

# BLOCK B — THE DECISION-BLOCK WRITE SITES

## B1 — SRJ_Bias_DecisionBlock
One candidate (column 0): SRJ_BiasEngine.mqh 149; parameter list closes **149**; no `;` before the brace → **DEFINITION**. Fallback NOT reached. Brace counting used.
**SIX FIELDS:** `HEADER 149 | PARAM LIST CLOSES 149 | OPENING BRACE 150 | CLOSING BRACE 371 | BODY LINES 222 | HEADER-INCLUSIVE LINES 223`

## B2 — Region paste
**SIX FIELDS (repeat):** `HEADER 149 | PARAM LIST CLOSES 149 | OPENING BRACE 150 | CLOSING BRACE 371 | BODY LINES 222 | HEADER-INCLUSIVE LINES 223`
BODY LINES 222 ≤ 240 → **WHOLE**, header-inclusive, range 149–371:

```text
149: void SRJ_Bias_DecisionBlock(int i,bool withinLookbackWindow,bool barClosed)
150:   {
151:    if(!(withinLookbackWindow && !SrjIsNa(g_s.currentBias)))
152:       return;
153:
154:    g_s.checklistActivated = (!g_s.tickOBIsValid) || (!g_s.tickFVGIsValid) ||
155:                             g_s.hasPersistedOpposingFVG;
156:
157:    int currentOpposingCount = (g_s.currentBias=="bullish")
158:                               ? g_s.bearishOBInvalidationCount
159:                               : g_s.bullishOBInvalidationCount;
160:    bool doRenewal = (currentOpposingCount >= 2) && !g_s.drawStructureRenewalLineNow;
161:
162:    int currentInBiasCount = (g_s.currentBias=="bullish")
163:                             ? g_s.bullishOBInvalidationCount
164:                             : g_s.bearishOBInvalidationCount;
165:    bool doStrongFlip = (currentInBiasCount >= 2) && !g_s.drawBiasLineNow;
166:
167:    // Union of latched (pre-renewal) and live (post-renewal) weak-flip conditions.
168:    // The latch captures the state before FVG renewal resets; the live check captures
169:    // any weak signal that becomes true during this bar's FVG or fill passes.
170:    bool doWeakSignalFlip = g_s.weakFlipPreconditionMet ||
171:                            ((!g_s.tickOBIsValid) && (!g_s.tickFVGIsValid) &&
172:                             g_s.hasPersistedOpposingFVG);
173:
174:    int countReferenceBar = g_s.currentStructureStartBar;
175:
176:    if(SRJ_InDebugWindow(i))
177:      {
178:       Print("SRJ DEC t=", SRJ_BarTimeStr(i),
179:             " bar=", i,
180:             " biasBefore=", g_s.currentBias,
181:             " inBias=", currentInBiasCount,
182:             " opp=", currentOpposingCount,
183:             " bull=", g_s.bullishOBInvalidationCount,
184:             " bear=", g_s.bearishOBInvalidationCount,
185:             " structStart=", g_s.currentStructureStartBar,
186:             " structStartT=", SRJ_BarTimeStr(g_s.currentStructureStartBar),
187:             " countRef=", countReferenceBar,
188:             " countRefT=", SRJ_BarTimeStr(countReferenceBar),
189:             " lastRelStruct=", g_s.lastRelevantStructureBar,
190:             " obInvBound=", g_s.obInvalidationBoundary,
191:             " obInvBoundT=", SRJ_BarTimeStr(g_s.obInvalidationBoundary),
192:             " lastRenewalOB=", g_s.lastRenewalOBBar,
193:             " justChangedBias=", (g_s.justChangedBias ? 1 : 0),
194:             " isDoubleOB=", (g_s.isDoubleOB ? 1 : 0),
195:             " persistOppFVG=", (g_s.hasPersistedOpposingFVG ? 1 : 0),
196:             " strong=", (doStrongFlip ? 1 : 0),
197:             " renew=", (doRenewal ? 1 : 0),
198:             " weak=", (doWeakSignalFlip ? 1 : 0));
199:
200:       Print("SRJ DEC3 t=", SRJ_BarTimeStr(i),
201:             " bar=", i,
202:             " oppCount=", currentOpposingCount,
203:             " drawStructRenewal=", (g_s.drawStructureRenewalLineNow ? 1 : 0),
204:             " renewResult=", (doRenewal ? 1 : 0),
205:             " inBiasCount=", currentInBiasCount,
206:             " drawBiasLine=", (g_s.drawBiasLineNow ? 1 : 0),
207:             " strongResult=", (doStrongFlip ? 1 : 0),
208:             " tickOBIsValid=", (g_s.tickOBIsValid ? 1 : 0),
209:             " tickFVGIsValid=", (g_s.tickFVGIsValid ? 1 : 0),
210:             " hasPersistedOppFVG=", (g_s.hasPersistedOpposingFVG ? 1 : 0),
211:             " weakResult=", (doWeakSignalFlip ? 1 : 0));
212:      }
213:
214:    if(doRenewal)
215:      {
216:       g_s.lastRelevantStructureBar = i;
217:       g_s.structureConfirmedThisBar = true;
218:       g_s.wasBiasFlip = false;
219:       g_s.drawStructureRenewalLineNow = true;
220:       g_s.renewalDirection = g_s.currentBias;
221:       g_s.isDoubleOB = true;
222:       g_s.suppressBiasPaneStatusThisBar = true;
223:       g_s.obInvalidationBoundary = i;
224:       g_s.fvgDetectionBoundary = i;
225:       // [EA-30] doRenewal is a checklist event, NOT a structural leg boundary; currentLegHasXOB retained (XOB projects until invalidated)
226:       g_s.tickOBIsValid = true;
227:       g_s.tickFVGIsValid = true;
228:       g_s.hasPersistedOpposingFVG = false;
229:
230:       // Selective reset: zero the OPPOSING counter only, preserve in-bias counter.
231:       // In-bias invalidations continue to accumulate toward the next strong flip.
232:       if(g_s.currentBias == "bullish")
233:         {
234:          // Bullish renewal: reset bearish (opposing) counter only
235:          g_s.bearishOBInvalidationCount = 0;
236:          g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;
237:         }
238:       else
239:         {
240:          // Bearish renewal: reset bullish (opposing) counter only
241:          g_s.bullishOBInvalidationCount = 0;
242:          g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;
243:         }
244:
245:       g_s.checklistActivated = false;
246:       if(g_s.currentBias == "bullish")
247:          g_s.bullishStructureRenewalAlert = true;
248:       else
249:          g_s.bearishStructureRenewalAlert = true;
250:
251:       if(g_htfDebugLog)
252:          Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
253:                " kind=doRenewal",
254:                " bias=", g_s.currentBias,
255:                " resetOn=true");
256:      }
257:    else if(doStrongFlip || doWeakSignalFlip)
258:      {
259:       string nextBias = (g_s.currentBias=="bullish") ? "bearish" : "bullish";
260:       g_s.currentBias = nextBias;
261:       g_s.currentStructureStartBar = i;
262:       g_s.lastRelevantStructureBar = i;
263:       g_s.structureConfirmedThisBar = true;
264:       g_s.wasBiasFlip = true;
265:       g_s.drawBiasLineNow = true;
266:       g_s.newBiasDirection = nextBias;
267:       if(doStrongFlip)
268:         {
269:          g_s.isDoubleOB = true;
270:          g_s.suppressBiasPaneStatusThisBar = true;
271:         }
272:       else
273:         {
274:          g_s.isDoubleOB = false;
275:         }
276:       g_s.obInvalidationBoundary = i;
277:       g_s.fvgDetectionBoundary = i;
278:       g_s.currentLegHasXOB = false;   // [Section 8] a flip (strong or weak) starts a new leg
279:       g_s.structLegBoundary = i;   // [EA-30] a flip opens a new structural leg
280:       g_s.tickOBIsValid = true;
281:       g_s.tickFVGIsValid = true;
282:       g_s.hasPersistedOpposingFVG = false;
283:       g_s.bullishOBInvalidationCount = 0;
284:       g_s.bearishOBInvalidationCount = 0;
285:       g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;
286:       g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;
287:       g_s.checklistActivated = false;
288:       if(nextBias == "bullish")
289:          g_s.bullishBiasFlipAlert = true;
290:       else
291:          g_s.bearishBiasFlipAlert = true;
292:
293:       string flipKind = doStrongFlip ? "strongFlip" : "weakFlip";
294:       if(g_htfDebugLog)
295:          Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
296:                " kind=", flipKind,
297:                " bias=", g_s.currentBias,
298:                " resetOn=true");
299:      }
300:
301:    if(doRenewal)
302:      {
303:       // Renewals always take all-mode path, even if a weak signal also fired this bar.
304:       // Resolve any pending slot-2 promotion from an earlier bar first.
305:       // barClosed guard: SRJ_ApplyPromotion writes object widths, and an object
306:       // created on an earlier bar is not in g_intrabarObjects, so an intrabar
307:       // width change would survive the snapshot rollback while isPromoted reverts.
308:       if(barClosed && !SrjIsNa(g_s.pendingPromoteBar2) && g_s.pendingPromoteBar2 < i)
309:          SRJ_promotionReconcile(i,g_s.pendingPromoteMode2,g_s.pendingPromoteBias2,
310:                                 g_s.pendingPromoteBoundary2,g_s.pendingPromoteTargetBar2);
311:
312:       g_s.pendingPromoteBar2       = i;
313:       g_s.pendingPromoteBias2      = g_s.currentBias;
314:       g_s.pendingPromoteMode2      = "all";
315:       g_s.pendingPromoteBoundary2  = SRJ_NA_INT;
316:       g_s.pendingPromoteTargetBar2 = SRJ_NA_INT;
317:      }
318:    else if(doStrongFlip)
319:      {
320:       // Strong flips also use all-mode.
321:       // barClosed guard: SRJ_ApplyPromotion writes object widths, and an object
322:       // created on an earlier bar is not in g_intrabarObjects, so an intrabar
323:       // width change would survive the snapshot rollback while isPromoted reverts.
324:       if(barClosed && !SrjIsNa(g_s.pendingPromoteBar2) && g_s.pendingPromoteBar2 < i)
325:          SRJ_promotionReconcile(i,g_s.pendingPromoteMode2,g_s.pendingPromoteBias2,
326:                                 g_s.pendingPromoteBoundary2,g_s.pendingPromoteTargetBar2);
327:
328:       g_s.pendingPromoteBar2       = i;
329:       g_s.pendingPromoteBias2      = g_s.currentBias;
330:       g_s.pendingPromoteMode2      = "all";
331:       g_s.pendingPromoteBoundary2  = SRJ_NA_INT;
332:       g_s.pendingPromoteTargetBar2 = SRJ_NA_INT;
333:      }
334:    else if(doWeakSignalFlip || g_s.initialBiasJustSet)
335:      {
336:       // Weak signals promote NEW-bias OBs (the side that survived and now defines the bias).
337:       // At this point g_s.currentBias has already been flipped to the new bias.
338:       // Initial bias also promotes the current (new) bias.
339:       SRJ_QueueNearestPromotion(i,g_s.currentBias,SRJ_NA_INT,2);
340:      }
341:
342:    // Invariant: a structural renewal only ever runs in the direction of the bias
343:    // that is live at the end of this bar.  SRJ_FVG_CreationRenewalPass runs earlier
344:    // in the bar and can raise the flag against the pre-decision bias; if a flip
345:    // then lands on the same bar, that flag now points the wrong way.  Drop it
346:    // rather than draw a renewal against the new bias, and withdraw the alert it
347:    // would have fired.
348:    if(g_s.drawStructureRenewalLineNow &&
349:       !SrjIsNa(g_s.renewalDirection) &&
350:       g_s.renewalDirection != g_s.currentBias)
351:      {
352:       if(SRJ_InDebugWindow(i))
353:          Print("SRJ RENEWAL-DROP t=", SRJ_BarTimeStr(i), " bar=", i,
354:                " renewalDir=", g_s.renewalDirection,
355:                " bias=", g_s.currentBias,
356:                " reason=directionMismatch");
357:
358:       g_s.drawStructureRenewalLineNow  = false;
359:       g_s.renewalDirection             = SRJ_NA_STR;
360:       g_s.bullishStructureRenewalAlert = false;
361:       g_s.bearishStructureRenewalAlert = false;
362:      }
363:
364:    if(SRJ_InDebugWindow(i))
365:       Print("SRJ DEC2 t=", SRJ_BarTimeStr(i),
366:             " bar=", i,
367:             " biasAfterDecision=", g_s.currentBias,
368:             " justChangedBias=", (g_s.justChangedBias ? 1 : 0),
369:             " obInvBound=", g_s.obInvalidationBoundary,
370:             " lastRenewalOB=", g_s.lastRenewalOBBar);
371:   }
```

## B3 — Parameters (from B2 paste; single-line list at 149)
```text
1 | int i                     | BY VALUE | CONTAINS-ASTERISK: no
2 | bool withinLookbackWindow | BY VALUE | CONTAINS-ASTERISK: no
3 | bool barClosed            | BY VALUE | CONTAINS-ASTERISK: no
```

## B4 — Lines assigning to hasPersistedOpposingFVG (paste searched: B2 paste, 149–371)
```text
228:       g_s.hasPersistedOpposingFVG = false;   | RHS: false
282:       g_s.hasPersistedOpposingFVG = false;   | RHS: false
```
**Count = 2.** (Lines 155, 172, 195, 210 contain the identifier without an assignment target `=`; line 382 is outside the region.)

## B5 — Attribution (Amendment 14) + naming test, per B4 statement
- (a) Pointer parameters of header 149: parameters `int i`, `bool withinLookbackWindow`, `bool barClosed` — **none contains `*`** → empty list.
- (b) Mechanical scan of 149–371 for pointer-typed declarations and calls containing create/New/Get/At: the only `new`/`creat` hits are inside `//` comments (lines 278, 279, 306, 322, 337, 346 — COMMENT, excluded per Amendment 3/9); no pointer declarations; no qualifying calls → **empty list**.
- (c) Stacks (brace-counted):
  - S=228: 150–371 (region, header 149) → 215–256
  - S=282: 150–371 (region, header 149) → 258–299
- (d)/(e): no (a) and no (b) candidates exist → nothing to test.
- **S=228: NO OBJECT IN SCOPE AT THIS STATEMENT.** **S=282: NO OBJECT IN SCOPE AT THIS STATEMENT.**
- Naming test: no in-scope candidates → **NAMED_COUNT = 0** per statement (no candidate exists to name).

## B6 — Census within B2 paste (149–371)
```text
objId N_OCC 0 → ABSENT | COrderblock N_OCC 0 → ABSENT | CImbalance N_OCC 0 → ABSENT
GetOB N_OCC 0 → ABSENT | GetFVG N_OCC 0 → ABSENT | SRJ_createImbalance N_OCC 0 → ABSENT
SRJ_NextObjId N_OCC 0 → ABSENT
N_LINES = 0   (no lines pasted — count of 0 is a result)
```

# BLOCK C — SState APPEND POINT, INITIALISER REGION, TWO CONSUMERS

## C1 — Census all 16 files: SState (substring rule, comment-excluded per Amendment 9)
```text
SRJ_FlowNexus_EA.mq5  N_OCC 0  N_LINES 0
SRJ_FlowLogic.mq5     N_OCC 1  N_LINES 1
SRJ_Alerts.mqh        N_OCC 0  N_LINES 0
SRJ_BiasEngine.mqh    N_OCC 0  N_LINES 0
SRJ_Draw.mqh          N_OCC 0  N_LINES 0
SRJ_Fractals.mqh      N_OCC 0  N_LINES 0
SRJ_HTFEngine.mqh     N_OCC 0  N_LINES 0
SRJ_ImbalanceMgr.mqh  N_OCC 0  N_LINES 0
SRJ_OrderblockMgr.mqh N_OCC 0  N_LINES 0
SRJ_Panels.mqh        N_OCC 0  N_LINES 0
SRJ_SeedFormat.mqh    N_OCC 0  N_LINES 0
SRJ_Sessions.mqh      N_OCC 0  N_LINES 0
SRJ_State.mqh         N_OCC 2  N_LINES 2
SRJ_Text.mqh          N_OCC 0  N_LINES 0
SRJ_TickCore.mqh      N_OCC 0  N_LINES 0
SRJ_Types.mqh         N_OCC 0  N_LINES 0
```
Paste (every distinct line once; all whole-token, none INCIDENTAL):
```text
SRJ_FlowLogic.mq5 119: SState g_sSnapshot;                      | class: DECLARATION
SRJ_State.mqh 96: struct SState                                 | class: STRUCT HEADER
SRJ_State.mqh 249: SState g_s;                                  | class: DECLARATION
```
COMMENT-excluded (match exists only inside `//` comment → discarded before census per Amendment 9; reported as COMMENT, no verdict, not counted):
```text
SRJ_State.mqh 94:  //| SState â€” every Pine `var` scalar, grouped by Pine section.       |
SRJ_Sessions.mqh 201:    // The watermark lives in SState, so the snapshot restores it and the live bar
SRJ_Types.mqh 24: // Deliberately NOT a member of SState: the intrabar snapshot restores SState
```

## C2 — Struct bound (only ONE struct header exists — C1 returned exactly one, SRJ_State.mqh 96; no selection rule needed, none applied)
Brace counting used from the opening brace.
**SIX FIELDS:** `HEADER 96 | PARAM LIST NOT APPLICABLE (struct has no parameter list) | OPENING BRACE 97 | CLOSING BRACE 247 | BODY LINES 151 | HEADER-INCLUSIVE LINES 152`

## C3 — Highest declaration in the C2 range (relaxed file-scope rule, leading whitespace permitted, Amendment 15 applied) — TWO SEPARATE ANSWERS
```text
DECLARATION  246:     string   dataWarningName;      | declared type: string
CLOSING BRACE 247:   };
```
(246 is the highest-numbered line in [97,247] ending in `;` whose first token is not if/for/while/return/switch/case/else and which is not a `}`-first line; line 247 begins with `}` → CLOSING BRACE, never a declaration.)

## C4 — Last 15 lines of the C2 range (233–247), contiguous, verbatim
```text
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
247:   };
```

## C5 — Census all 16 files: hasPersistedOpposingFVG (comment-excluded)
```text
SRJ_FlowNexus_EA.mq5  N_OCC 0  N_LINES 0   (line 1803 is wholly a // comment → COMMENT, excluded, not counted)
SRJ_FlowLogic.mq5     N_OCC 1  N_LINES 1
SRJ_Alerts.mqh        N_OCC 0  N_LINES 0
SRJ_BiasEngine.mqh    N_OCC 7  N_LINES 7
SRJ_Draw.mqh          N_OCC 0  N_LINES 0
SRJ_Fractals.mqh      N_OCC 0  N_LINES 0
SRJ_HTFEngine.mqh     N_OCC 0  N_LINES 0
SRJ_ImbalanceMgr.mqh  N_OCC 6  N_LINES 6
SRJ_OrderblockMgr.mqh N_OCC 0  N_LINES 0
SRJ_Panels.mqh        N_OCC 2  N_LINES 2
SRJ_SeedFormat.mqh    N_OCC 0  N_LINES 0
SRJ_Sessions.mqh      N_OCC 0  N_LINES 0
SRJ_State.mqh         N_OCC 2  N_LINES 2
SRJ_Text.mqh          N_OCC 0  N_LINES 0
SRJ_TickCore.mqh      N_OCC 0  N_LINES 0
SRJ_Types.mqh         N_OCC 0  N_LINES 0
```
Every match is whole-token (the `g_s.`/`g_bufOppFVG[target]` contexts leave the token complete — none INCIDENTAL). Per line (class per assignment-target/comparison rules; enclosing function six-field):
```text
SRJ_FlowLogic.mq5 904:          g_bufOppFVG[target] = g_s.hasPersistedOpposingFVG ? 1.0 : 0.0;
  class: OTHER (CONTAINS-EQUALS-NOT-TARGET — the unquoted '=' targets g_bufOppFVG[target]; identifier followed by ' ?')
  enclosing: OnCalculate | 705 | 714 | 715 | 1179 | BODY 465 | HDR-INCL 475
SRJ_BiasEngine.mqh 155:                              g_s.hasPersistedOpposingFVG;
  class: OTHER (continuation of 154's assignment; no '=' on this line)
  enclosing: SRJ_Bias_DecisionBlock | 149 | 149 | 150 | 371 | BODY 222 | HDR-INCL 223
SRJ_BiasEngine.mqh 172:                              g_s.hasPersistedOpposingFVG);
  class: OTHER (call-argument continuation; no '=' on this line)
  enclosing: SRJ_Bias_DecisionBlock | 149 | 149 | 150 | 371 | BODY 222 | HDR-INCL 223
SRJ_BiasEngine.mqh 195:              " persistOppFVG=", (g_s.hasPersistedOpposingFVG ? 1 : 0),
  class: OTHER (the '=' on this line is inside the string literal " persistOppFVG="; identifier followed by ' ?')
  enclosing: SRJ_Bias_DecisionBlock | 149 | 149 | 150 | 371 | BODY 222 | HDR-INCL 223
SRJ_BiasEngine.mqh 210:              " hasPersistedOppFVG=", (g_s.hasPersistedOpposingFVG ? 1 : 0),
  class: OTHER (same — '=' inside string literal)
  enclosing: SRJ_Bias_DecisionBlock | 149 | 149 | 150 | 371 | BODY 222 | HDR-INCL 223
SRJ_BiasEngine.mqh 228:       g_s.hasPersistedOpposingFVG = false;
  class: ASSIGNMENT | RHS: false
  enclosing: SRJ_Bias_DecisionBlock | 149 | 149 | 150 | 371 | BODY 222 | HDR-INCL 223
SRJ_BiasEngine.mqh 282:       g_s.hasPersistedOpposingFVG = false;
  class: ASSIGNMENT | RHS: false
  enclosing: SRJ_Bias_DecisionBlock | 149 | 149 | 150 | 371 | BODY 222 | HDR-INCL 223
SRJ_BiasEngine.mqh 382:     if((!g_s.tickOBIsValid) && (!g_s.tickFVGIsValid) && g_s.hasPersistedOpposingFVG)
  class: OTHER (no '==' or '!=' on line, first token not 'case')
  enclosing: SRJ_Bias_WeakFlipLatchPass | 376 | 376 | 377 | 384 | BODY 8 | HDR-INCL 9
SRJ_ImbalanceMgr.mqh 185:                          " persistOppFVG=", g_s.hasPersistedOpposingFVG,
  class: OTHER ('=' inside string literal; identifier followed by ',')
  enclosing: SRJ_FVG_CreationRenewalPass | 108 | 110 | 111 | 348 | BODY 238 | HDR-INCL 241
SRJ_ImbalanceMgr.mqh 199:                 g_s.hasPersistedOpposingFVG = false;
  class: ASSIGNMENT | RHS: false
  enclosing: SRJ_FVG_CreationRenewalPass | 108 | 110 | 111 | 348 | BODY 238 | HDR-INCL 241
SRJ_ImbalanceMgr.mqh 226:              g_s.hasPersistedOpposingFVG = true;
  class: ASSIGNMENT | RHS: true
  enclosing: SRJ_FVG_CreationRenewalPass | 108 | 110 | 111 | 348 | BODY 238 | HDR-INCL 241
SRJ_ImbalanceMgr.mqh 302:                          " persistOppFVG=", g_s.hasPersistedOpposingFVG,
  class: OTHER ('=' inside string literal)
  enclosing: SRJ_FVG_CreationRenewalPass | 108 | 110 | 111 | 348 | BODY 238 | HDR-INCL 241
SRJ_ImbalanceMgr.mqh 316:                 g_s.hasPersistedOpposingFVG = false;
  class: ASSIGNMENT | RHS: false
  enclosing: SRJ_FVG_CreationRenewalPass | 108 | 110 | 111 | 348 | BODY 238 | HDR-INCL 241
SRJ_ImbalanceMgr.mqh 343:              g_s.hasPersistedOpposingFVG = true;
  class: ASSIGNMENT | RHS: true
  enclosing: SRJ_FVG_CreationRenewalPass | 108 | 110 | 111 | 348 | BODY 238 | HDR-INCL 241
SRJ_Panels.mqh 17:     if(g_s.hasPersistedOpposingFVG) invalid += 1;
  class: OTHER (no '==' or '!=' on line; identifier followed by ')')
  enclosing: SRJ_computeBiasPaneColorARGB | 12 | 12 | 13 | 36 | BODY 24 | HDR-INCL 25
SRJ_Panels.mqh 251:                                         g_s.hasPersistedOpposingFVG,g_s.isDoubleOB,
  class: OTHER (argument-list continuation; no '=' on line)
  enclosing: SRJ_RenderBiasPane | 188 | 189 | 190 | 277 | BODY 88 | HDR-INCL 90
SRJ_State.mqh 128:      bool     hasPersistedOpposingFVG;
  class: DECLARATION
  enclosing: NO ENCLOSING FUNCTION - FILE SCOPE (line lies inside struct SState — SIX FIELDS: 96 | NOT APPLICABLE | 97 | 247 | 151 | 152)
SRJ_State.mqh 329:     g_s.hasPersistedOpposingFVG        = false;
  class: ASSIGNMENT | RHS: false
  enclosing: SRJ_StateInit | 297 | 297 | 298 | 490 | BODY 193 | HDR-INCL 194
```

## C6 — SRJ_StateInit
One candidate (column 0): SRJ_State.mqh 297; param list closes 297; **DEFINITION**; fallback NOT reached. Brace counting used.
**SIX FIELDS:** `HEADER 297 | PARAM LIST CLOSES 297 | OPENING BRACE 298 | CLOSING BRACE 490 | BODY LINES 193 | HEADER-INCLUSIVE LINES 194` (region NOT pasted, per item)

## C7 — Lowest assignment to hasPersistedOpposingFVG in the C6 range
Only match in [298,490] is line 329 → lowest = 329. Window: **323–335** (6 before + line + 6 after). INSERTION-POINT ANCHOR ONLY — no scope, attribution or gating classification is built on it.
```text
323:     g_s.obInvalidationBoundary         = SRJ_NA_INT;
324:     g_s.fvgDetectionBoundary           = SRJ_NA_INT;
325:     g_s.currentLegHasXOB                = false;   // [Section 8]
326:     g_s.structLegBoundary               = SRJ_NA_INT;   // [EA-30]
327:     g_s.tickOBIsValid                  = true;
328:     g_s.tickFVGIsValid                 = true;
329:     g_s.hasPersistedOpposingFVG        = false;
330:     g_s.inBiasOBInvalidationCount      = 0;
331:     g_s.opposingOBInvalidationCount    = 0;
332:     g_s.bullishOBInvalidationCount     = 0;
333:     g_s.bearishOBInvalidationCount     = 0;
334:     g_s.firstBullishOBInvalidationBar  = SRJ_NA_INT;
335:     g_s.firstBearishOBInvalidationBar  = SRJ_NA_INT;
```

## C8 — Census all 16 files: weakFlipPreconditionMet (comment-excluded)
```text
SRJ_FlowNexus_EA.mq5 / Alerts / Draw / Fractals / HTFEngine / ImbalanceMgr / OrderblockMgr /
Panels / SeedFormat / Sessions / Text / TickCore / Types / FlowLogic: N_OCC 0, N_LINES 0 (ABSENT)
SRJ_BiasEngine.mqh  N_OCC 3  N_LINES 3
SRJ_State.mqh       N_OCC 2  N_LINES 2
```
All whole-token, none INCIDENTAL. Per line:
```text
SRJ_BiasEngine.mqh 28:     g_s.weakFlipPreconditionMet       = false;  // NEW: reset per-bar
  class: ASSIGNMENT | RHS: false   (trailing // comment excluded from RHS per Amendment 3)
  enclosing: SRJ_Bias_PerBarResetPass | 16 | 16 | 17 | 44 | BODY 28 | HDR-INCL 29
SRJ_BiasEngine.mqh 170:     bool doWeakSignalFlip = g_s.weakFlipPreconditionMet ||
  class: OTHER (CONTAINS-EQUALS-NOT-TARGET — the unquoted '=' targets doWeakSignalFlip; identifier followed by ' ||')
  enclosing: SRJ_Bias_DecisionBlock | 149 | 149 | 150 | 371 | BODY 222 | HDR-INCL 223
SRJ_BiasEngine.mqh 383:        g_s.weakFlipPreconditionMet = true;
  class: ASSIGNMENT | RHS: true
  enclosing: SRJ_Bias_WeakFlipLatchPass | 376 | 376 | 377 | 384 | BODY 8 | HDR-INCL 9
SRJ_State.mqh 142:      bool     weakFlipPreconditionMet;
  class: DECLARATION
  enclosing: NO ENCLOSING FUNCTION - FILE SCOPE (line lies inside struct SState — 96 | NOT APPLICABLE | 97 | 247 | 151 | 152)
SRJ_State.mqh 343:     g_s.weakFlipPreconditionMet        = false;
  class: ASSIGNMENT | RHS: false
  enclosing: SRJ_StateInit | 297 | 297 | 298 | 490 | BODY 193 | HDR-INCL 194
```

## C9 — SRJ_DispatchAlert
One candidate (column 0): SRJ_Alerts.mqh 7; param list closes 7; **DEFINITION**; fallback NOT reached.
**SIX FIELDS:** `HEADER 7 | PARAM LIST CLOSES 7 | OPENING BRACE 8 | CLOSING BRACE 18 | BODY LINES 11 | HEADER-INCLUSIVE LINES 12`
BODY LINES 11 ≤ 40 → **WHOLE**, pasted 7–18:
```text
 7: void SRJ_DispatchAlert(int &lastBarGuard,int i,const string msg)
 8:   {
 9:    if(lastBarGuard == i)
10:       return;
11:    lastBarGuard = i;
12:
13:    Alert(msg);
14:    if(g_alertSendPush)
15:       SendNotification(msg);
16:    if(g_alertSendEmail)
17:       SendMail("SRJ Flow Logic", msg);
18:   }
```
**Parameters** (from that paste):
```text
1 | int &lastBarGuard   | BY REFERENCE
2 | int i               | BY VALUE
3 | const string msg    | BY VALUE
```
**Every "if" line with its FULL open-brace stack** (each entry: opening line + brace-counted closing line):
```text
if-line  9:     if(lastBarGuard == i)
  stack: OPEN 8 CLOSE 18   (region's own brace — header resolved to region definition header line 7)
if-line 14:    if(g_alertSendPush)
  stack: OPEN 8 CLOSE 18   (same resolution)
if-line 16:    if(g_alertSendEmail)
  stack: OPEN 8 CLOSE 18   (same resolution)
```
No entry is HEADER UNRESOLVED; no for/while/switch/do header occurs in this stack.
**Every assignment-target line with exact RHS** (paste searched: 7–18):
```text
11:    lastBarGuard = i;    | target lastBarGuard | RHS: i
```
**Emission census within the paste** (separate patterns, case-sensitive, comment-excluded):
```text
Alert            N_OCC 2   (line 7 — INCIDENTAL, containing identifier SRJ_DispatchAlert; line 13 — whole-token, exact)
SendNotification N_OCC 1   (line 15 — exact)
SendMail         N_OCC 1   (line 17 — exact)
PlaySound        N_OCC 0 → ABSENT
SendFTP          N_OCC 0 → ABSENT
N_LINES = 4
  7: void SRJ_DispatchAlert(int &lastBarGuard,int i,const string msg)      [matched: Alert (INCIDENTAL→SRJ_DispatchAlert)]
 13:    Alert(msg);                                                         [matched: Alert]
 15:       SendNotification(msg);                                           [matched: SendNotification]
 17:       SendMail("SRJ Flow Logic", msg);                                 [matched: SendMail]
```

# BLOCK D — FLOWLOGIC REGISTRATION, EXPORT BLOCK, PASS ORDERING, BUFFER TYPE

## D1 — FlowLogic column-0 `#property` lines (count = 9)
```text
 5: #property copyright "SRJ Flow Logic Auto â€” Pine v6 port"
 6: #property version   "1.00"
 7: #property indicator_chart_window
 8: #property indicator_buffers 34  // [Task 113] Was 33. Added 33 (selected XOB promotionTime). [Task 102] Was 31. Added 31 (selected XOB objId), 32 (selected FVG objId).
 9: #property indicator_plots   2
11: #property indicator_label1  "Fractal High"
12: #property indicator_type1   DRAW_ARROW
13: #property indicator_label2  "Fractal Low"
14: #property indicator_type2   DRAW_ARROW
```

## D2 — OnInit (FlowLogic only)
One candidate (column 0): 563; param list closes 563; **DEFINITION**; fallback NOT reached; brace counting used.
**SIX FIELDS:** `HEADER 563 | PARAM LIST CLOSES 563 | OPENING BRACE 564 | CLOSING BRACE 697 | BODY LINES 134 | HEADER-INCLUSIVE LINES 135` (NOT pasted, per item)

## D3 — Every SetIndexBuffer call in the D2 range (564–697), ascending, count = 34; paste searched: OnInit region 564–697
All 34 argument lists close on their own line (no ARGUMENT LIST CONTINUES ON NEXT LINE; nothing UNTERMINATED). First/second/third arguments verbatim:
```text
566:    SetIndexBuffer(0,g_bufFractalHigh,INDICATOR_DATA);                          | 1st: 0  | 2nd: g_bufFractalHigh | 3rd: INDICATOR_DATA
567:    SetIndexBuffer(1,g_bufFractalLow, INDICATOR_DATA);                          | 1st: 1  | 2nd: g_bufFractalLow  | 3rd: INDICATOR_DATA
572:    SetIndexBuffer(2,  g_bufBias,         INDICATOR_CALCULATIONS);              | 1st: 2  | 2nd: g_bufBias        | 3rd: INDICATOR_CALCULATIONS
573:    SetIndexBuffer(3,  g_bufOBValid,      INDICATOR_CALCULATIONS);              | 1st: 3  | 2nd: g_bufOBValid     | 3rd: INDICATOR_CALCULATIONS
574:    SetIndexBuffer(4,  g_bufFVGValid,     INDICATOR_CALCULATIONS);              | 1st: 4  | 2nd: g_bufFVGValid    | 3rd: INDICATOR_CALCULATIONS
575:    SetIndexBuffer(5,  g_bufOppFVG,       INDICATOR_CALCULATIONS);              | 1st: 5  | 2nd: g_bufOppFVG      | 3rd: INDICATOR_CALCULATIONS
576:    SetIndexBuffer(6,  g_bufSwingHigh,    INDICATOR_CALCULATIONS);              | 1st: 6  | 2nd: g_bufSwingHigh   | 3rd: INDICATOR_CALCULATIONS
577:    SetIndexBuffer(7,  g_bufSwingLow,     INDICATOR_CALCULATIONS);              | 1st: 7  | 2nd: g_bufSwingLow    | 3rd: INDICATOR_CALCULATIONS
578:    SetIndexBuffer(8,  g_bufPrevDayHigh,  INDICATOR_CALCULATIONS);              | 1st: 8  | 2nd: g_bufPrevDayHigh | 3rd: INDICATOR_CALCULATIONS
579:    SetIndexBuffer(9,  g_bufPrevDayLow,   INDICATOR_CALCULATIONS);              | 1st: 9  | 2nd: g_bufPrevDayLow  | 3rd: INDICATOR_CALCULATIONS
580:    SetIndexBuffer(10, g_bufAsiaHigh,     INDICATOR_CALCULATIONS);              | 1st: 10 | 2nd: g_bufAsiaHigh    | 3rd: INDICATOR_CALCULATIONS
581:    SetIndexBuffer(11, g_bufAsiaLow,      INDICATOR_CALCULATIONS);              | 1st: 11 | 2nd: g_bufAsiaLow     | 3rd: INDICATOR_CALCULATIONS
582:    SetIndexBuffer(12, g_bufLondonHigh,   INDICATOR_CALCULATIONS);              | 1st: 12 | 2nd: g_bufLondonHigh  | 3rd: INDICATOR_CALCULATIONS
583:    SetIndexBuffer(13, g_bufLondonLow,    INDICATOR_CALCULATIONS);              | 1st: 13 | 2nd: g_bufLondonLow   | 3rd: INDICATOR_CALCULATIONS
584:    SetIndexBuffer(14, g_bufNyHigh,       INDICATOR_CALCULATIONS);              | 1st: 14 | 2nd: g_bufNyHigh      | 3rd: INDICATOR_CALCULATIONS
585:    SetIndexBuffer(15, g_bufNyLow,        INDICATOR_CALCULATIONS);              | 1st: 15 | 2nd: g_bufNyLow       | 3rd: INDICATOR_CALCULATIONS
586:    SetIndexBuffer(16, g_bufPmHigh,       INDICATOR_CALCULATIONS);              | 1st: 16 | 2nd: g_bufPmHigh      | 3rd: INDICATOR_CALCULATIONS
587:    SetIndexBuffer(17, g_bufPmLow,        INDICATOR_CALCULATIONS);              | 1st: 17 | 2nd: g_bufPmLow       | 3rd: INDICATOR_CALCULATIONS
588:    SetIndexBuffer(18, g_bufSweepTag,     INDICATOR_CALCULATIONS);              | 1st: 18 | 2nd: g_bufSweepTag    | 3rd: INDICATOR_CALCULATIONS
589:    SetIndexBuffer(19, g_bufHtfHi,        INDICATOR_CALCULATIONS);              | 1st: 19 | 2nd: g_bufHtfHi       | 3rd: INDICATOR_CALCULATIONS
590:    SetIndexBuffer(20, g_bufHtfMid,       INDICATOR_CALCULATIONS);              | 1st: 20 | 2nd: g_bufHtfMid      | 3rd: INDICATOR_CALCULATIONS
591:    SetIndexBuffer(21, g_bufHtfLo,        INDICATOR_CALCULATIONS);              | 1st: 21 | 2nd: g_bufHtfLo       | 3rd: INDICATOR_CALCULATIONS
594:    SetIndexBuffer(22, g_bufXobZoneHigh,    INDICATOR_CALCULATIONS);            | 1st: 22 | 2nd: g_bufXobZoneHigh | 3rd: INDICATOR_CALCULATIONS
595:    SetIndexBuffer(23, g_bufXobZoneLow,     INDICATOR_CALCULATIONS);            | 1st: 23 | 2nd: g_bufXobZoneLow  | 3rd: INDICATOR_CALCULATIONS
596:    SetIndexBuffer(24, g_bufFvgLegZoneHigh, INDICATOR_CALCULATIONS);            | 1st: 24 | 2nd: g_bufFvgLegZoneHigh | 3rd: INDICATOR_CALCULATIONS
597:    SetIndexBuffer(25, g_bufFvgLegZoneLow,  INDICATOR_CALCULATIONS);            | 1st: 25 | 2nd: g_bufFvgLegZoneLow | 3rd: INDICATOR_CALCULATIONS
600:    SetIndexBuffer(26, g_bufObStructExtreme, INDICATOR_CALCULATIONS);           | 1st: 26 | 2nd: g_bufObStructExtreme | 3rd: INDICATOR_CALCULATIONS
601:    SetIndexBuffer(27, g_bufObSwingExtreme,  INDICATOR_CALCULATIONS);           | 1st: 27 | 2nd: g_bufObSwingExtreme | 3rd: INDICATOR_CALCULATIONS
604:    SetIndexBuffer(28, g_bufRenewalBoundaryTime, INDICATOR_CALCULATIONS);       | 1st: 28 | 2nd: g_bufRenewalBoundaryTime | 3rd: INDICATOR_CALCULATIONS
607:    SetIndexBuffer(29, g_bufSweptMask, INDICATOR_CALCULATIONS);                 | 1st: 29 | 2nd: g_bufSweptMask    | 3rd: INDICATOR_CALCULATIONS
610:    SetIndexBuffer(30, g_bufStructLegTime, INDICATOR_CALCULATIONS);             | 1st: 30 | 2nd: g_bufStructLegTime | 3rd: INDICATOR_CALCULATIONS
613:    SetIndexBuffer(31, g_bufXobObjId, INDICATOR_CALCULATIONS);                  | 1st: 31 | 2nd: g_bufXobObjId     | 3rd: INDICATOR_CALCULATIONS
614:    SetIndexBuffer(32, g_bufFvgObjId, INDICATOR_CALCULATIONS);                  | 1st: 32 | 2nd: g_bufFvgObjId     | 3rd: INDICATOR_CALCULATIONS
617:    SetIndexBuffer(33, g_bufXobPromoTime, INDICATOR_CALCULATIONS);              | 1st: 33 | 2nd: g_bufXobPromoTime | 3rd: INDICATOR_CALCULATIONS
```
**Call count = 34.** No sorting, deduplication or summarising beyond the required ascending line order.

## D4 — OnCalculate (FlowLogic only)
Header rule: candidate 705 (column 0); param list closes **714**; **DEFINITION**; fallback NOT reached; brace counting used.
**SIX FIELDS:** `HEADER 705 | PARAM LIST CLOSES 714 | OPENING BRACE 715 | CLOSING BRACE 1179 | BODY LINES 465 | HEADER-INCLUSIVE LINES 475` (NOT pasted, per item)
Census within 715–1179 (paste searched: OnCalculate range; comment-excluded):
```text
PruningPass             N_OCC 2   → INCIDENTAL-ONLY (Amendment 13: pattern matched as supplied; both matches lie inside longer identifiers; NOT substituted, NOT re-run)
   line 888  containing identifier: SRJ_OB_PruningPass
   line 889  containing identifier: SRJ_FVG_PruningPass
hasPersistedOpposingFVG N_OCC 1   (whole-token, exact)
SRJ_Bias_DecisionBlock  N_OCC 1   (whole-token, exact)
N_LINES = 4
  878:       SRJ_Bias_DecisionBlock(i,withinLookbackWindow,barClosed);        [matched: SRJ_Bias_DecisionBlock]
  888:       SRJ_OB_PruningPass(withinLookbackWindow);                        [matched: PruningPass (INCIDENTAL→SRJ_OB_PruningPass)]
  889:       SRJ_FVG_PruningPass(withinLookbackWindow);                       [matched: PruningPass (INCIDENTAL→SRJ_FVG_PruningPass)]
  904:          g_bufOppFVG[target] = g_s.hasPersistedOpposingFVG ? 1.0 : 0.0;   [matched: hasPersistedOpposingFVG]
```

## D5 — Export-block window and stack
Lowest = highest hasPersistedOpposingFVG line in D4 range = **904** (only match). Window: **896–912** (8 before + line + 8 after). INSERTION-POINT ANCHOR ONLY for the window; the stack below is brace-scope.
```text
896:       // [NEW EXPORT BLOCK] ------------------------------------------------------
897:       // Write out all state variables to the calculation buffers for EA consumption
898:       int target = i - 1;
899:       if(target >= 0)
900:         {
901:          g_bufBias[target] = (g_s.currentBias == "bullish") ? 1.0 : (g_s.currentBias == "bearish" ? -1.0 : 0.0);
902:          g_bufOBValid[target] = g_s.tickOBIsValid ? 1.0 : 0.0;
903:          g_bufFVGValid[target] = g_s.tickFVGIsValid ? 1.0 : 0.0;
904:          g_bufOppFVG[target] = g_s.hasPersistedOpposingFVG ? 1.0 : 0.0;
905:
906:          g_bufSwingHigh[target] = EMPTY_VALUE;
907:          g_bufSwingLow[target]  = EMPTY_VALUE;
908:          if(i >= 2)
909:            {
910:             if(SRJ_isStrictFractalHigh(high, i, 1))
911:                g_bufSwingHigh[target] = high[target];
912:             if(SRJ_isStrictFractalLow(low, i, 1))
```
**FULL open-brace stack for line 904** (brace-counted; each entry opening + closing):
```text
OPEN 715  CLOSE 1179   (OnCalculate's own brace — header resolved to region definition header line 705)
OPEN 820  CLOSE 1152   (entry line 820 first token is '{' → upward scan → HEADER 819:     for(int i = start; i < rates_total; i++)   — header is FOR, stated explicitly)
OPEN 900  CLOSE 1145   (entry line 900 first token is '{' → upward scan → HEADER 899:       if(target >= 0))

## D6 — Census all 16 files (3 patterns, comment-excluded, case-sensitive, repeats counted)
Per-file N_OCC per pattern and per-file N_LINES:
```text
SRJ_FlowLogic.mq5: INDICATOR_CALCULATIONS N_OCC 32 | INDICATOR_DATA N_OCC 2 | indicator_plots N_OCC 1 | N_LINES 35
SRJ_FlowNexus_EA.mq5: all three ABSENT, N_LINES 0      SRJ_Alerts.mqh: all three ABSENT, N_LINES 0
SRJ_BiasEngine.mqh: all three ABSENT, N_LINES 0        SRJ_Draw.mqh: all three ABSENT, N_LINES 0
SRJ_Fractals.mqh: all three ABSENT, N_LINES 0          SRJ_HTFEngine.mqh: all three ABSENT, N_LINES 0
SRJ_ImbalanceMgr.mqh: all three ABSENT, N_LINES 0      SRJ_OrderblockMgr.mqh: all three ABSENT, N_LINES 0
SRJ_Panels.mqh: all three ABSENT, N_LINES 0            SRJ_SeedFormat.mqh: all three ABSENT, N_LINES 0
SRJ_Sessions.mqh: all three ABSENT, N_LINES 0          SRJ_State.mqh: all three ABSENT, N_LINES 0
SRJ_Text.mqh: all three ABSENT, N_LINES 0              SRJ_TickCore.mqh: all three ABSENT, N_LINES 0
SRJ_Types.mqh: all three ABSENT, N_LINES 0
```
Paste (every distinct line once, FlowLogic only; all whole-token, none INCIDENTAL; count 35 = per-file N_LINES):
```text
SRJ_FlowLogic.mq5 9: #property indicator_plots   2                                      [matched: indicator_plots]
SRJ_FlowLogic.mq5 566:    SetIndexBuffer(0,g_bufFractalHigh,INDICATOR_DATA);             [matched: INDICATOR_DATA]
SRJ_FlowLogic.mq5 567:    SetIndexBuffer(1,g_bufFractalLow, INDICATOR_DATA);             [matched: INDICATOR_DATA]
SRJ_FlowLogic.mq5 572:    SetIndexBuffer(2,  g_bufBias,         INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 573:    SetIndexBuffer(3,  g_bufOBValid,      INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 574:    SetIndexBuffer(4,  g_bufFVGValid,     INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 575:    SetIndexBuffer(5,  g_bufOppFVG,       INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 576:    SetIndexBuffer(6,  g_bufSwingHigh,    INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 577:    SetIndexBuffer(7,  g_bufSwingLow,     INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 578:    SetIndexBuffer(8,  g_bufPrevDayHigh,  INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 579:    SetIndexBuffer(9,  g_bufPrevDayLow,   INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 580:    SetIndexBuffer(10, g_bufAsiaHigh,     INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 581:    SetIndexBuffer(11, g_bufAsiaLow,      INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 582:    SetIndexBuffer(12, g_bufLondonHigh,   INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 583:    SetIndexBuffer(13, g_bufLondonLow,    INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 584:    SetIndexBuffer(14, g_bufNyHigh,       INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 585:    SetIndexBuffer(15, g_bufNyLow,        INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 586:    SetIndexBuffer(16, g_bufPmHigh,       INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 587:    SetIndexBuffer(17, g_bufPmLow,        INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 588:    SetIndexBuffer(18, g_bufSweepTag,     INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 589:    SetIndexBuffer(19, g_bufHtfHi,        INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 590:    SetIndexBuffer(20, g_bufHtfMid,       INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 591:    SetIndexBuffer(21, g_bufHtfLo,        INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 594:    SetIndexBuffer(22, g_bufXobZoneHigh,    INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 595:    SetIndexBuffer(23, g_bufXobZoneLow,     INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 596:    SetIndexBuffer(24, g_bufFvgLegZoneHigh, INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 597:    SetIndexBuffer(25, g_bufFvgLegZoneLow,  INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 600:    SetIndexBuffer(26, g_bufObStructExtreme, INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 601:    SetIndexBuffer(27, g_bufObSwingExtreme,  INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 604:    SetIndexBuffer(28, g_bufRenewalBoundaryTime, INDICATOR_CALCULATIONS); [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 607:    SetIndexBuffer(29, g_bufSweptMask, INDICATOR_CALCULATIONS);      [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 610:    SetIndexBuffer(30, g_bufStructLegTime, INDICATOR_CALCULATIONS);  [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 613:    SetIndexBuffer(31, g_bufXobObjId, INDICATOR_CALCULATIONS);       [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 614:    SetIndexBuffer(32, g_bufFvgObjId, INDICATOR_CALCULATIONS);       [matched: INDICATOR_CALCULATIONS]
SRJ_FlowLogic.mq5 617:    SetIndexBuffer(33, g_bufXobPromoTime, INDICATOR_CALCULATIONS);   [matched: INDICATOR_CALCULATIONS]
```

## D7 — OnInit-range type census and the FL_BUF_XOB_PROMO_TIME registration (paste searched: D2 range 564–697)
```text
INDICATOR_CALCULATIONS  N_OCC 32  (lines 572–591, 594–597, 600, 601, 604, 607, 610, 613, 614, 617)
INDICATOR_DATA          N_OCC 2   (lines 566, 567)
N_LINES = 34   (paste = the same 34 lines listed under D6, lines 566–617, in ascending order)
```
**SetIndexBuffer call whose SECOND ARGUMENT TEXT is `FL_BUF_XOB_PROMO_TIME`:** **SECOND ARGUMENT NOT FOUND** (no D3 call has that second-argument text; all second arguments are `g_buf*` identifiers).
Every second-argument text reported in D3, in ascending line order:
```text
566
```
**SPLIT BOUNDARY (declared per delivery rule):** PART 1 = report header through Block D7 up to the words "in ascending line order:" (cut mid-list at `566`). PART 2 = this message, resuming exactly at that list, through the FINAL HASH ITEM. Both parts delivered; no TRUNCATED marker is emitted beside this declared boundary. Truncations: none.

Resuming **D7** — Every second-argument text reported in D3, in ascending line order:
```text
566:  g_bufFractalHigh
567:  g_bufFractalLow
572:  g_bufBias
573:  g_bufOBValid
574:  g_bufFVGValid
575:  g_bufOppFVG
576:  g_bufSwingHigh
577:  g_bufSwingLow
578:  g_bufPrevDayHigh
579:  g_bufPrevDayLow
580:  g_bufAsiaHigh
581:  g_bufAsiaLow
582:  g_bufLondonHigh
583:  g_bufLondonLow
584:  g_bufNyHigh
585:  g_bufNyLow
586:  g_bufPmHigh
587:  g_bufPmLow
588:  g_bufSweepTag
589:  g_bufHtfHi
590:  g_bufHtfMid
591:  g_bufHtfLo
594:  g_bufXobZoneHigh
595:  g_bufXobZoneLow
596:  g_bufFvgLegZoneHigh
597:  g_bufFvgLegZoneLow
600:  g_bufObStructExtreme
601:  g_bufObSwingExtreme
604:  g_bufRenewalBoundaryTime
607:  g_bufSweptMask
610:  g_bufStructLegTime
613:  g_bufXobObjId
614:  g_bufFvgObjId
617:  g_bufXobPromoTime
```
(34 texts = the 34 D3 calls, ascending by line. No call's second argument is `FL_BUF_XOB_PROMO_TIME`.)

# BLOCK E — THE EA READ MODEL AND ITS INCLUDES

## E1 — EA column-0 `#include` lines (count = 2)
```text
10: #include <SRJ\SRJ_TickCore.mqh>
11: #include <Trade\Trade.mqh>
```

## E2 — EA lines whose text contains `#define FL_BUF_` (count = 31; verbatim, ascending; not interpreted, not sorted by index, not tabulated)
```text
100: #define FL_BUF_LTF_BIAS      2
101: #define FL_BUF_LTF_OB_VALID  3
102: #define FL_BUF_LTF_FVG_VALID 4
103: #define FL_BUF_LTF_OPP_FVG   5
104: #define FL_BUF_SWING_HIGH    6
105: #define FL_BUF_SWING_LOW     7
106: #define FL_BUF_PDAY_HIGH     8
107: #define FL_BUF_PDAY_LOW     9
108: #define FL_BUF_ASIA_HIGH     10
109: #define FL_BUF_ASIA_LOW     11
110: #define FL_BUF_LONDON_HIGH   12
111: #define FL_BUF_LONDON_LOW    13
112: #define FL_BUF_NY_HIGH       14
113: #define FL_BUF_NY_LOW       15
114: #define FL_BUF_PM_HIGH       16
115: #define FL_BUF_PM_LOW       17
116: #define FL_BUF_SWEEP_TAG     18
117: #define FL_BUF_HTF_HIGH      19
118: #define FL_BUF_HTF_MID       20
119: #define FL_BUF_HTF_LOW       21
121: #define FL_BUF_XOB_ZONE_HIGH     22
122: #define FL_BUF_XOB_ZONE_LOW      23
123: #define FL_BUF_FVG_LEG_ZONE_HIGH 24
124: #define FL_BUF_FVG_LEG_ZONE_LOW 25
457: #define FL_BUF_OB_STRUCT_EXTREME 26
458: #define FL_BUF_OB_SWING_EXTREME  27
462: #define FL_BUF_SWEPT_MASK        29
470: #define FL_BUF_STRUCT_LEG_TIME   30
483: #define FL_BUF_XOB_OBJ_ID        31
484: #define FL_BUF_FVG_OBJ_ID        32
498: #define FL_BUF_XOB_PROMO_TIME    33
```

## E3 — ReadFlow and ReadBuf1 (separate patterns; definition-header rule incl. fallback)
**ReadBuf1** — one candidate (column 0): EA 431; param list closes 431; **DEFINITION**; fallback NOT reached; brace counting used.
**SIX FIELDS:** `HEADER 431 | PARAM LIST CLOSES 431 | OPENING BRACE 432 | CLOSING BRACE 437 | BODY LINES 6 | HEADER-INCLUSIVE LINES 7`
BODY LINES 6 ≤ 60 → **WHOLE**, pasted 431–437:
```text
431: bool ReadBuf1(int handle, int bufIdx, double &outVal, int shift = 1)
432:   {
433:    double tmp[1];
434:    if(CopyBuffer(handle, bufIdx, shift, 1, tmp) != 1) return false;
435:    outVal = tmp[0];
436:    return true;
437:   }
```
**ReadFlow** — one candidate (column 0): EA 500; param list closes 500; **DEFINITION**; fallback NOT reached; brace counting used.
**SIX FIELDS:** `HEADER 500 | PARAM LIST CLOSES 500 | OPENING BRACE 501 | CLOSING BRACE 503 | BODY LINES 3 | HEADER-INCLUSIVE LINES 4`
BODY LINES 3 ≤ 60 → **WHOLE**, pasted 500–503:
```text
500: bool ReadFlow(int bufIdx, double &outVal, int evalShift)
501:   {
502:    return ReadBuf1(g_hFlow, bufIdx, outVal, evalShift + FLOW_SHIFT_OFFSET);
503:   }
```

## E4 — Census within each E3 paste (paste named per row; case-sensitive; comment-excluded)
**ReadBuf1 paste (431–437):**
```text
CopyBuffer → 434:    if(CopyBuffer(handle, bufIdx, shift, 1, tmp) != 1) return false;
iCustom    → ABSENT
Handle     → ABSENT   (line 431/434 carry the lowercase identifier `handle`; the case-sensitive pattern `Handle` does not occur — no containing identifier to report)
```
**ReadFlow paste (500–503):**
```text
CopyBuffer → ABSENT
iCustom    → ABSENT
Handle     → ABSENT
```

# FINAL ITEM, MANDATORY

Raw certutil output, `SRJ_FlowNexus_EA.mq5`:
```text
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5:
0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322
CertUtil: -hashfile command completed successfully.
```
Raw certutil output, `SRJ_FlowLogic.mq5`:
```text
SHA256 hash of C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Indicators\SRJ_FlowLogic.mq5:
d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5
CertUtil: -hashfile command completed successfully.
```
Comparison against the two values supplied in this task's header, and only those:
```text
EA .mq5       supplied: 0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322
EA .mq5      observed: 0f1f44cb3f7d9aa183a2ece9d3029fd2cc006d46a49f33b35aff41ea52331322
EA RESULT: MATCH

FlowLogic .mq5  supplied: d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5
FlowLogic .mq5 observed: d5525014a101318a83049de7f3ac357056ecc5b6edd3feddaf41e0fafb5664d5
FlowLogic RESULT: MATCH
```

**END OF REPORT — TASK 154-Pre3-R: COMPLETED.** All five blocks delivered (A 7/7, B 6/6, C 9/9, D 7/7, E 4/4 = 33 items) including the final hash item; both parts of the one declared split delivered; no file written, no compile, no run, no MetaEditor, no reference documents loaded.