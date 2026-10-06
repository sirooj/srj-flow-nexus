# BUILDER SLICE B-45 - raw rows behind P4 and S1-S5 (line numbers; payloads only)
P1-P3 verdicts: all NO_RULING_FOUND (nearest ADJACENT hits listed in result). v26 = RECON74 (B802287F); r78 = RECON78-V26 (48F5C196). j26/j32 INV rows live in slices B39/B44.

## P4 v26 flips 07-10
12092 JR	0	13:10:26.426	Core 04	2026.06.05 07:25:45   [SRJ][T155][OBPROV] code=8 id=0 bar=106420 flag=true
12128 CG	0	13:10:32.530	Core 04	2026.06.05 08:15:04   [SRJ][T155][OBPROV] code=8 id=0 bar=106430 flag=true
12162 JF	0	13:10:44.738	Core 04	2026.06.05 09:00:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106439 flag=true
12615 LE	0	13:10:50.842	Core 04	2026.06.05 09:55:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106450 flag=true

## P4 r78 flips 07-10
12583 GL	0	16:40:51.315	Core 04	2026.06.05 07:25:45   [SRJ][T155][OBPROV] code=8 id=0 bar=106420 flag=true
12619 DP	0	16:41:03.549	Core 04	2026.06.05 08:15:04   [SRJ][T155][OBPROV] code=8 id=0 bar=106430 flag=true
12653 GP	0	16:41:15.781	Core 04	2026.06.05 09:00:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106439 flag=true
13116 GS	0	16:41:34.132	Core 04	2026.06.05 09:55:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106450 flag=true

## P4 v26 gates run-wide

## P4 r78 London gates

## S1 CreationPass fractal-low branch (Include\SRJ\SRJ_OrderblockMgr.mqh lines 328-429)
328:    if(SRJ_isStrictFractalLow(low,i,1))
329:      {
330:       g_s.bestBullishOBBar  = SRJ_NA_INT;
331:       g_s.bestBullishOBHigh = SRJ_NA_DBL;
332:       g_s.bestBullishOBLow  = SRJ_NA_DBL;
333:       g_s.bestBullishOBOpen = SRJ_NA_DBL;
334: 
335:       if(SRJ_isBearishCandle(open,close,i,1))
336:         {
337:          g_s.bestBullishOBBar  = i - 1;
338:          g_s.bestBullishOBHigh = srjH(high,i,1);
339:          g_s.bestBullishOBLow  = srjL(low,i,1);
340:          g_s.bestBullishOBOpen = srjO(open,i,1);
341:         }
342:       if(i >= 3 && SRJ_isBearishCandle(open,close,i,2))
343:         {
344:          if(SrjIsNa(g_s.bestBullishOBBar) || srjL(low,i,2) < g_s.bestBullishOBLow)
345:            {
346:             g_s.bestBullishOBBar  = i - 2;
347:             g_s.bestBullishOBHigh = srjH(high,i,2);
348:             g_s.bestBullishOBLow  = srjL(low,i,2);
349:             g_s.bestBullishOBOpen = srjO(open,i,2);
350:            }
351:         }
352:       if(!SrjIsNa(g_s.bestBullishOBBar))
353:         {
354:          bool isExtBull = false;
355:          int leftOffsetBull = i - (g_s.bestBullishOBBar - 1);
356:          if(leftOffsetBull >= 0 && leftOffsetBull <= 500)
357:            {
358:             if(srjC(close,i,leftOffsetBull) > srjO(open,i,leftOffsetBull))
359:                isExtBull = true;
360:            }
361:          COrderblock *ob = SRJ_createOrderblock(time,rates_total,i,
362:                                true,g_s.bestBullishOBBar,g_s.bestBullishOBHigh,
363:                                g_s.bestBullishOBLow,g_s.bestBullishOBOpen,
364:                                i - 1,isExtBull);
365:          g_orderblocks.Add(ob);
366: 
367:          // Replay activation/invalidation for bars startBar+1 .. i-1 to catch same-bar act+inv
368:          // during fractal confirmation lag (workstream 3 fix).
369:          for(int replayBar = ob.startBar + 1; replayBar < i; replayBar++)
370:            {
371:             double replayH = srjH(high,i,i-replayBar);
372:             double replayL = srjL(low,i,i-replayBar);
373:             double replayC = srjC(close,i,i-replayBar);
374:             SRJ_OB_ReplayActivationInvalidation(ob,replayH,replayL,replayC,replayBar,i);
375:            }
376: 
377:          // If the replay invalidated the OB, redraw it as invalidated (it was created inactive)
378:          if(!ob.isValid && !SrjIsNa(ob.invalidationBar))
379:            {
380:             if(ob.HasObLine())  { SRJ_DeleteObj(ob.obLineName);  ob.obLineName  = ""; }
381:             if(ob.HasMidLine()) { SRJ_DeleteObj(ob.midLineName); ob.midLineName = ""; }
382: 
383:             int safeX1 = (int)MathMax(ob.startBar, i - 4500);
384:             int safeX2 = (int)MathMax(ob.startBar + g_lineExtension, safeX1 + 1);
385: 
386:             if(g_showInvalidatedBullishOB)
387:               {
388:                ob.obLineName  = SRJ_DrawTrend("OB",time,rates_total,
389:                                     safeX1,ob.high,safeX2,ob.high,
390:                                     g_invalidatedBullishColor,g_lineThickness,
391:                                     SRJ_STYLE_SOLID,g_extendInvalidated);
392:                ob.midLineName = SRJ_DrawTrend("OBmid",time,rates_total,
393:                                     safeX1,ob.invalidationLevel,safeX2,ob.invalidationLevel,
394:                                     g_invalidatedMidlineColor,g_lineThickness,
395:                                     SRJ_STYLE_DOTTED,g_extendInvalidated);
396:               }
397:            }
398:          // Replay-activated and still valid â€” see the bearish branch above.
399:          else if(ob.isActivated && ob.isValid)
400:            {
401:             if(ob.HasObLine())  { SRJ_DeleteObj(ob.obLineName);  ob.obLineName  = ""; }
402:             if(ob.HasMidLine()) { SRJ_DeleteObj(ob.midLineName); ob.midLineName = ""; }
403: 
404:             int safeX1 = (int)MathMax(ob.startBar, i - 4500);
405:             int safeX2 = (int)MathMax(ob.startBar + g_lineExtension, safeX1 + 1);
406: 
407:             if(g_showValidBullishOB)
408:               {
409:                ob.obLineName  = SRJ_DrawTrend("OB",time,rates_total,
410:                                     safeX1,ob.high,safeX2,ob.high,
411:                                     g_bullishOBColor,g_lineThickness,
412:                                     SRJ_STYLE_SOLID,g_extendValid);
413:                ob.midLineName = SRJ_DrawTrend("OBmid",time,rates_total,
414:                                     safeX1,ob.invalidationLevel,safeX2,ob.invalidationLevel,
415:                                     g_validMidlineColor,g_lineThickness,
416:                                     SRJ_STYLE_DOTTED,g_extendValid);
417:               }
418: 
419:             if(SRJ_InDebugWindow(i))
420:                Print("SRJ OBREDRAW t=", SRJ_BarTimeStr(i), " bar=", i,
421:                      " source=replayActivated dir=bullish",
422:                      " obStart=", ob.startBar,
423:                      " obStartT=", SRJ_BarTimeStr(ob.startBar),
424:                      " obVal=", ob.validationBar,
425:                      " obValT=", SRJ_BarTimeStr(ob.validationBar));
426:            }
427:         }
428:      }
429:   }

## S2 fractal + bearish-candle (Include\SRJ\SRJ_Fractals.mqh lines 18-49)
18: bool SRJ_isBearishCandle(const double &open[],const double &close[],int i,int index)
19:   {
20:    return (srjC(close,i,index) < srjO(open,i,index));
21:   }
22: 
23: bool SRJ_isStrictFractalHigh(const double &high[],int i,int index)
24:   {
25:    bool result = false;
26:    if(index >= 1 && (i - index) >= 1 && index <= i)
27:      {
28:       if((i - (index+1)) >= 0)
29:         {
30:          result = (srjH(high,i,index) > srjH(high,i,index-1)) &&
31:                   (srjH(high,i,index) > srjH(high,i,index+1));
32:         }
33:      }
34:    return result;
35:   }
36: 
37: bool SRJ_isStrictFractalLow(const double &low[],int i,int index)
38:   {
39:    bool result = false;
40:    if(index >= 1 && (i - index) >= 1 && index <= i)
41:      {
42:       if((i - (index+1)) >= 0)
43:         {
44:          result = (srjL(low,i,index) < srjL(low,i,index-1)) &&
45:                   (srjL(low,i,index) < srjL(low,i,index+1));
46:         }
47:      }
48:    return result;
49:   }

## S3 DecisionBlock counters-to-flipKind (Include\SRJ\SRJ_BiasEngine.mqh lines 157-312)
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
227:       // [Task 155] Buffer 34 provenance capture. Site code 7. No orderblock
228:       // object is in scope at this write, so no identity is recorded and the
229:       // export emits the site sentinel -21.0.
230:       Print("[SRJ][T155][OBPROV] code=7 id=0 bar=", i, " flag=true");
231:       g_s.tickOBSetterId   = 0;
232:       g_s.tickOBSetterCode = 7;
233:       g_s.tickOBSetterBar  = i;
234:       g_s.tickFVGIsValid = true;
235:       g_s.hasPersistedOpposingFVG = false;
236:       
237:       // Selective reset: zero the OPPOSING counter only, preserve in-bias counter.
238:       // In-bias invalidations continue to accumulate toward the next strong flip.
239:       if(g_s.currentBias == "bullish")
240:         {
241:          // Bullish renewal: reset bearish (opposing) counter only
242:          g_s.bearishOBInvalidationCount = 0;
243:          g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;
244:         }
245:       else
246:         {
247:          // Bearish renewal: reset bullish (opposing) counter only
248:          g_s.bullishOBInvalidationCount = 0;
249:          g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;
250:         }
251: 
252:       g_s.checklistActivated = false;
253:       if(g_s.currentBias == "bullish")
254:          g_s.bullishStructureRenewalAlert = true;
255:       else
256:          g_s.bearishStructureRenewalAlert = true;
257: 
258:       if(g_htfDebugLog)
259:          Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
260:                " kind=doRenewal",
261:                " bias=", g_s.currentBias,
262:                " resetOn=true");
263:      }
264:    else if(doStrongFlip || doWeakSignalFlip)
265:      {
266:       string nextBias = (g_s.currentBias=="bullish") ? "bearish" : "bullish";
267:       g_s.currentBias = nextBias;
268:       g_s.currentStructureStartBar = i;
269:       g_s.lastRelevantStructureBar = i;
270:       g_s.structureConfirmedThisBar = true;
271:       g_s.wasBiasFlip = true;
272:       g_s.drawBiasLineNow = true;
273:       g_s.newBiasDirection = nextBias;
274:       if(doStrongFlip)
275:         {
276:          g_s.isDoubleOB = true;
277:          g_s.suppressBiasPaneStatusThisBar = true;
278:         }
279:       else
280:         {
281:          g_s.isDoubleOB = false;
282:         }
283:       g_s.obInvalidationBoundary = i;
284:       g_s.fvgDetectionBoundary = i;
285:       g_s.currentLegHasXOB = false;   // [Section 8] a flip (strong or weak) starts a new leg
286:       g_s.structLegBoundary = i;   // [EA-30] a flip opens a new structural leg
287:       g_s.tickOBIsValid = true;
288:       // [Task 155] Buffer 34 provenance capture. Site code 8. No object is
289:       // in scope; the export emits the site sentinel -22.0.
290:       Print("[SRJ][T155][OBPROV] code=8 id=0 bar=", i, " flag=true");
291:       g_s.tickOBSetterId   = 0;
292:       g_s.tickOBSetterCode = 8;
293:       g_s.tickOBSetterBar  = i;
294:       g_s.tickFVGIsValid = true;
295:       g_s.hasPersistedOpposingFVG = false;
296:       g_s.bullishOBInvalidationCount = 0;
297:       g_s.bearishOBInvalidationCount = 0;
298:       g_s.firstBullishOBInvalidationBar = SRJ_NA_INT;
299:       g_s.firstBearishOBInvalidationBar = SRJ_NA_INT;
300:       g_s.checklistActivated = false;
301:       if(nextBias == "bullish")
302:          g_s.bullishBiasFlipAlert = true;
303:       else
304:          g_s.bearishBiasFlipAlert = true;
305: 
306:       string flipKind = doStrongFlip ? "strongFlip" : "weakFlip";
307:       if(g_htfDebugLog)
308:          Print("SRJ EVT t=", SRJ_BarTimeStr(i), " bar=", i,
309:                " kind=", flipKind,
310:                " bias=", g_s.currentBias,
311:                " resetOn=true");
312:      }

## S4 WeakFlipLatchPass (Include\SRJ\SRJ_BiasEngine.mqh lines 386-397)
386: //+------------------------------------------------------------------+
387: //| Latch weak-flip precondition before renewal resets clear flags. |
388: //+------------------------------------------------------------------+
389: void SRJ_Bias_WeakFlipLatchPass()
390:   {
391:    if(SrjIsNa(g_s.currentBias))
392:       return;
393:    
394:    // Latch the weak-flip condition if all three preconditions are met
395:    if((!g_s.tickOBIsValid) && (!g_s.tickFVGIsValid) && g_s.hasPersistedOpposingFVG)
396:       g_s.weakFlipPreconditionMet = true;
397:   }

## S4 TURN_0855 weak row (j26)
69784 KR	0	13:32:29.612	Core 04	2026.06.05 09:00:00   SRJ EVT t=2026.06.05 08:55 bar=106439 kind=weakFlip bias=bullish resetOn=true
119130 MR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 08:55 bar=106439 kind=weakFlip bias=bullish resetOn=true

## S5 creation/val bars (j32 INV)
49432 ID	0	16:46:35.849	Core 04	2026.06.05 08:10:00   SRJ INV t=2026.06.05 08:05 bar=106429 obStart=106423 obStartT=2026.06.05 07:35 obVal=106428 obInv=106429 obCreation=106424 isBull=1 bias=bullish ref=106420 refT=2026.06.05 07:20 refOk=1 sameBarValInv=0 top=159.968 bot=159.955 mid=159.962 killClose=159.959
49458 NQ	0	16:46:35.849	Core 04	2026.06.05 08:15:04   SRJ INV t=2026.06.05 08:10 bar=106430 obStart=106426 obStartT=2026.06.05 07:50 obVal=106428 obInv=106430 obCreation=106428 isBull=1 bias=bullish ref=106420 refT=2026.06.05 07:20 refOk=1 sameBarValInv=0 top=159.961 bot=159.955 mid=159.958 killClose=159.957
50058 DO	0	16:46:35.849	Core 04	2026.06.05 09:25:04   SRJ INV t=2026.06.05 09:20 bar=106444 obStart=106440 obStartT=2026.06.05 09:00 obVal=106442 obInv=106444 obCreation=106442 isBull=1 bias=bullish ref=106439 refT=2026.06.05 08:55 refOk=1 sameBarValInv=0 top=159.968 bot=159.949 mid=159.959 killClose=159.952
