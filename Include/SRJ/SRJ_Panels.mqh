#ifndef __SRJ_PANELS_MQH__
#define __SRJ_PANELS_MQH__

#include <Canvas\Canvas.mqh>
#include "SRJ_Types.mqh"
#include "SRJ_State.mqh"
#include "SRJ_Draw.mqh"
#include "SRJ_Text.mqh"
#include "SRJ_OrderblockMgr.mqh"
#include "SRJ_ImbalanceMgr.mqh"

uint SRJ_computeBiasPaneColorARGB(string bias,bool obExists,bool fvgExists)
  {
   int invalid = 0;
   if(!g_s.tickOBIsValid) invalid += 1;
   if(fvgExists && !g_s.tickFVGIsValid) invalid += 1;
   if(g_s.hasPersistedOpposingFVG) invalid += 1;

   color baseCol = (bias == "bullish") ? clrBlue : clrRed;
   int alpha = 0;                       
   if(invalid == 0)
      alpha = 0;
   else if(invalid == 1)
      alpha = 60;
   else
     {
      baseCol = clrGray;
      alpha = 60;
     }
   uint a = (uint)((100 - alpha) * 255 / 100);
   uint rgb = (uint)baseCol;            
   uint r = (rgb & 0xFF);
   uint g = (rgb >> 8) & 0xFF;
   uint b = (rgb >> 16) & 0xFF;
   return (a<<24) | (r<<16) | (g<<8) | b;   
  }

string SRJ_buildBiasPaneText(string bias,bool obExists,bool fvgExists,bool hasOppFVG,
                             bool is2OB,bool checkActive,bool tickOB,bool suppressStatus)
  {
   string line1 = (bias == "bullish") ? "Bullish Bias" : "Bearish Bias";
   string line2 = is2OB ? SRJ_2OB() : "";
   string line3 = SRJ_buildStatusLine3(obExists,fvgExists,tickOB,g_s.tickFVGIsValid,
                                       is2OB,checkActive,suppressStatus);
   string line4 = hasOppFVG ? SRJ_REV() : "";
   string result = line1;
   if(line2 != "") result += "\n" + line2;
   if(line3 != "") result += "\n" + line3;
   if(line4 != "") result += "\n" + line4;
   return result;
  }

int SRJ_CanvasFontPx(string sizeInput)
  {
   if(sizeInput == "Tiny")   return 10;
   if(sizeInput == "Small")  return 12;
   if(sizeInput == "Large")  return 18;
   return 14; 
  }

ENUM_BASE_CORNER SRJ_TableCorner(string posInput,int &xOff,int &yOff)
  {
   xOff = 10; yOff = 20;
   if(posInput == "Top Left")     { xOff = 10; yOff = 160; return CORNER_LEFT_UPPER; }
   if(posInput == "Top Right")    { xOff = 85; yOff = 20; return CORNER_RIGHT_UPPER; }
   if(posInput == "Bottom Left")  { xOff = 10; yOff = 45; return CORNER_LEFT_LOWER; }
   xOff = 85; yOff = 45;
   return CORNER_RIGHT_LOWER; 
  }

class CSrjCanvasPanel
  {
public:
   CCanvas  canvas;
   string   objName;
   bool     created;

            CSrjCanvasPanel(void){ objName=""; created=false; }

   void RenderCorner(const string name,ENUM_BASE_CORNER corner,int xOff,int yOff,
                     string &rows[],uint &rowARGB[],int fontPx,uint bgARGB,
                     uint frameARGB)
     {
      int nrows = ArraySize(rows);
      if(nrows <= 0) return;

      int pad = 5;
      int lineH = fontPx + 7;
      int w = 0;
      if(!created)
        {
         objName = name;
         canvas.CreateBitmapLabel(name,0,0,10,10,COLOR_FORMAT_ARGB_NORMALIZE);
         created = true;
        }
      canvas.FontSet("Arial",-fontPx*10);   
      for(int r=0; r<nrows; r++)
        {
         int tw = canvas.TextWidth(rows[r]);
         if(tw > w) w = tw;
        }
      int panelW = w + pad*2 + 24;
      int panelH = lineH*nrows + pad*2;

      canvas.Destroy();
      canvas.CreateBitmapLabel(name,0,0,panelW,panelH,COLOR_FORMAT_ARGB_NORMALIZE);
      ObjectSetInteger(0,name,OBJPROP_CORNER,corner);
      ObjectSetInteger(0,name,OBJPROP_XDISTANCE,xOff);
      ObjectSetInteger(0,name,OBJPROP_YDISTANCE,yOff);
      ObjectSetInteger(0,name,OBJPROP_HIDDEN,true);
      ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);

      canvas.Erase(bgARGB);
      canvas.Rectangle(0,0,panelW-1,panelH-1,frameARGB);
      canvas.FontSet("Arial",-fontPx*10);
      int y = pad;
      for(int r=0; r<nrows; r++)
        {
         uint col = (r < ArraySize(rowARGB)) ? rowARGB[r] : 0xFF000000;
         int rowW = canvas.TextWidth(rows[r]);
         int rowX = (panelW - rowW) / 2;
         if(rowX < pad) rowX = pad;
         canvas.TextOut(rowX,y,rows[r],col);
         y += lineH;
        }
      canvas.Update();
     }

   void RenderAnchored(const string name,datetime t,double price,
                       const string txt,uint textARGB,uint bgARGB,int fontPx)
     {
      string lines[];
      int nrows = StringSplit(txt,'\n',lines);
      if(nrows <= 0){ ArrayResize(lines,1); lines[0]=txt; nrows=1; }

      int pad = 5;
      int lineH = fontPx + 7;

      if(!created)
        {
         objName = name;
         canvas.CreateBitmapLabel(name,0,0,10,10,COLOR_FORMAT_ARGB_NORMALIZE);
         created = true;
        }
      canvas.FontSet("Arial",-fontPx*10);
      int w = 0;
      for(int r=0;r<nrows;r++){ int tw=canvas.TextWidth(lines[r]); if(tw>w) w=tw; }
      int panelW = w + pad*2 + 24;
      int panelH = lineH*nrows + pad*2;

      canvas.Destroy();
      canvas.CreateBitmapLabel(name,0,0,panelW,panelH,COLOR_FORMAT_ARGB_NORMALIZE);

      int x=0,y=0;
      datetime tt=t; double pp=price;
      if(ChartTimePriceToXY(0,0,tt,pp,x,y))
        {
         ObjectSetInteger(0,name,OBJPROP_CORNER,CORNER_LEFT_UPPER);
         ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
         ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
        }
      ObjectSetInteger(0,name,OBJPROP_HIDDEN,true);
      ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);

      canvas.Erase(bgARGB);
      int yy = pad;
      for(int r=0;r<nrows;r++)
        {
         int rowW = canvas.TextWidth(lines[r]);
         int rowX = (panelW - rowW) / 2;
         if(rowX < pad) rowX = pad;
         canvas.TextOut(rowX,yy,lines[r],textARGB);
         yy += lineH;
        }
      canvas.Update();
     }

   void Destroy()
     {
      if(created){ canvas.Destroy(); created=false; }
     }
  };

CSrjCanvasPanel g_panelMTF;
CSrjCanvasPanel g_panelDataWarn;
CSrjCanvasPanel g_panelBiasPane;

void SRJ_RenderBiasPane(const datetime &time[],const double &close[],
                        int rates_total,int i,bool withinLookbackWindow)
  {
   if(!(withinLookbackWindow && g_showBiasPane))
      return;

   bool obExistsNow = SRJ_inBiasOBExists(g_s.currentBias,g_s.obInvalidationBoundary);

   int fvgSearchBoundary = (g_s.currentBias=="bullish") ? g_s.cachedSwingBarBearish
                                                        : g_s.cachedSwingBarBullish;
   if(SrjIsNa(fvgSearchBoundary))
      fvgSearchBoundary = g_s.currentStructureStartBar;

   bool fvgExistsNow = false;
   bool fvgExistsForDisplay = false;

   g_s.isInitialFlipBar = ((i == g_s.currentStructureStartBar) ||
                           (i == g_s.lastRelevantStructureBar && g_s.structureConfirmedThisBar));
   if(g_s.isInitialFlipBar)
     {
      fvgExistsNow = false;
      fvgExistsForDisplay = false;
      g_s.suppressBiasPaneStatusThisBar = true;
     }

   if(g_s.isDoubleOB)
     {
      int twoOBBoundary = g_s.lastRelevantStructureBar;
      if(g_imbalances.Total() > 0 && !SrjIsNa(twoOBBoundary))
        {
         int n = g_imbalances.Total();
         for(int k=0; k<n; k++)
           {
            CImbalance *fvg = GetFVG(g_imbalances,k);
            if(fvg==NULL) continue;
            int compareBar = fvg.detectionBar;
            bool matchesBias = (g_s.currentBias=="bullish" && fvg.isBullish) ||
                               (g_s.currentBias=="bearish" && !fvg.isBullish);
            if(matchesBias && compareBar >= twoOBBoundary && compareBar >= g_s.strictLimitBar)
              {
               if(!fvgExistsForDisplay)
                  fvgExistsForDisplay = true;
               if(!fvg.isFilled && !fvgExistsNow)
                  fvgExistsNow = true;
               if(fvgExistsNow && fvgExistsForDisplay)
                  break;
              }
           }
        }
      //--- [P-VNEXT-1 E2] structure fallback (his blank-FVG ruling 2026-09-22): boundary-gated search empty is not evidence; search the live structure before printing blank.
      if(g_s.isDoubleOB && !fvgExistsForDisplay && !fvgExistsNow && !g_s.isInitialFlipBar && !SrjIsNa(g_s.currentStructureStartBar) && g_imbalances.Total() > 0)
        {
         int n2 = g_imbalances.Total();
         for(int k2=0; k2<n2; k2++)
           {
            CImbalance *fvg2 = GetFVG(g_imbalances,k2);
            if(fvg2==NULL) continue;
            bool m2 = (g_s.currentBias=="bullish" && fvg2.isBullish) || (g_s.currentBias=="bearish" && !fvg2.isBullish);
            if(m2 && fvg2.detectionBar >= g_s.currentStructureStartBar && fvg2.detectionBar >= g_s.strictLimitBar)
              {
               fvgExistsForDisplay = true;
               if(!fvg2.isFilled) fvgExistsNow = true;
               if(fvgExistsNow) break;
              }
           }
        }
     }
   else
     {
      fvgExistsNow = SRJ_inBiasFVGExists(g_s.currentBias,fvgSearchBoundary,false);
      fvgExistsForDisplay = fvgExistsNow;
     }

   bool fvgForText = g_s.isDoubleOB ? fvgExistsForDisplay : fvgExistsNow;

   string paneText;
   if(SrjIsNa(g_s.currentBias))
      paneText = "No Bias";
   else
      paneText = SRJ_buildBiasPaneText(g_s.currentBias,obExistsNow,fvgForText,
                                       g_s.hasPersistedOpposingFVG,g_s.isDoubleOB,
                                       g_s.checklistActivated,g_s.tickOBIsValid,
                                       g_s.suppressBiasPaneStatusThisBar);

   uint paneARGB = 0xFF808080; 
   if(!SrjIsNa(g_s.currentBias))
     {
      bool fvgExistsForColor = g_s.isDoubleOB ? fvgExistsForDisplay : fvgExistsNow;
      paneARGB = SRJ_computeBiasPaneColorARGB(g_s.currentBias,obExistsNow,fvgExistsForColor);
     }

   if(i != rates_total-1)
      return;

   int labelBar = i + g_biasPaneOffsetBars;
   datetime labelTime = SRJ_BarToTime(time,rates_total,labelBar);
   double labelPrice = close[i];

   int fontPx = SRJ_CanvasFontPx("Tiny"); 
   uint textARGB = 0xFFFFFFFF; 
   uint bgARGB = paneARGB;

   if(g_s.biasLabelName == "")
      g_s.biasLabelName = "SRJ_BiasPane";
   g_panelBiasPane.RenderAnchored(g_s.biasLabelName,labelTime,labelPrice,
                                  paneText,textARGB,bgARGB,fontPx);
  }

void SRJ_RenderDataWarning(int i,int rates_total)
  {
   if(!(g_showDataWarnings && i == rates_total-1))
      return;

   string modeBase = g_robustnessModeStr;
   int cut = StringFind(g_robustnessModeStr," (");
   if(cut != -1)
      modeBase = StringSubstr(g_robustnessModeStr,0,cut);
   string robustnessValue = modeBase + " (" + (string)g_s.baseLookback + " bars)";
   string barsUsedValue   = (string)g_s.usedBars + " / " + (string)g_s.baseLookback;
   string coverageValue   = g_s.coverageText;

   string rows[4];
   rows[0] = "SRJ Flow Logic";
   rows[1] = "Robustness: " + robustnessValue;
   rows[2] = "Bars Used: " + barsUsedValue;
   rows[3] = "Coverage: " + coverageValue;

   uint rowARGB[4];
   for(int r=0;r<4;r++) rowARGB[r] = 0xFF000000; 

   int fontPx = SRJ_CanvasFontPx(g_dataWarningSize);
   int xOff, yOff;
   ENUM_BASE_CORNER corner = SRJ_TableCorner(g_dataWarningPosition,xOff,yOff);

   uint bgARGB    = 0xFFFFFFFF; 
   uint frameARGB = 0xFF000000; 

   if(g_s.dataWarningName == "")
      g_s.dataWarningName = "SRJ_DataWarn";
   g_panelDataWarn.RenderCorner(g_s.dataWarningName,corner,xOff,yOff,
                                rows,rowARGB,fontPx,bgARGB,frameARGB);
  }

void SRJ_RenderMTFBox(int i,int rates_total,
                      string h1_bias,string h1_2ob,string h1_line3,string h1_opp,
                      string h2_bias,string h2_2ob,string h2_line3,string h2_opp,
                      string h3_bias,string h3_2ob,string h3_line3,string h3_opp)
  {
   if(i != rates_total-1)
      return;

   bool freshSweepValid = !SrjIsNa(g_s.freshSweepBar) && !g_s.freshSweepExpired;
   string autoSweepFrom = freshSweepValid ? g_s.freshSweepTag : "NA";
   string effectiveSweepFrom = g_autoDetectERLSweep ? autoSweepFrom : g_erlSweepFromStr;

   string t1_label = SRJ_formatTF(SRJ_TFToPineString(g_htfHighTF));
   string t2_label = SRJ_formatTF(SRJ_TFToPineString(g_htfMidTF));
   string t3_label = SRJ_formatTF(SRJ_TFToPineString(g_htfLowTF));

   string row1H_auto = SRJ_buildManualRowHTF(t1_label,h1_bias,g_htfHighTargetStr,h1_line3,h1_opp,h1_2ob);
   string row15_auto = SRJ_buildManualRowHTF(t2_label,h2_bias,g_htfMidTargetStr, h2_line3,h2_opp,h2_2ob);
   string row5_auto  = SRJ_buildManualRowHTF(t3_label,h3_bias,g_htfLowTargetStr, h3_line3,h3_opp,h3_2ob);

   string ofBiasManual = SRJ_determineOrderflowBiasManual(h1_bias,h2_bias,h3_bias);
   string ofText = StringFormat("ORDERFLOW || %s || Alert %s", ofBiasManual, DoubleToString(g_alertNumber,1));
   string erlText = SRJ_buildERLRow(effectiveSweepFrom,g_erlTargetToStr,g_erlAlertNumber);
   string combinedRow = ofText + "\n" + erlText;

   string flat[];
   int cap = 4 + (g_showLiquiditySweepDebugLabel?1:0) + (g_showLiquidityLevelsDebug?3:0);
   string cells[];
   int nCells = 0;
   ArrayResize(cells,cap);
   cells[nCells++] = combinedRow;
   cells[nCells++] = row1H_auto;
   cells[nCells++] = row15_auto;
   cells[nCells++] = row5_auto;

   if(g_showLiquiditySweepDebugLabel)
     {
      string slotLabel = SrjIsNa(g_s.currentSessionSlot) ? "warming up" : g_s.currentSessionSlot;
      string lastEventLabel = SrjIsNa(g_s.freshSweepTag) ? "none yet"
            : g_s.freshSweepTag + " (" + (string)(SrjIsNa(g_s.freshSweepBar)?0:(i - g_s.freshSweepBar)) + " bars ago)";
      string expiryLabel = SrjIsNa(g_s.freshSweepExpirySession) ? "n/a"
            : (g_s.freshSweepExpired ? g_s.freshSweepExpirySession + " (already opened)"
                                     : "at " + g_s.freshSweepExpirySession + " open");
      cells[nCells++] = StringFormat("Slot:%s || Fresh:%s || LastEvent:%s || Expires:%s",
                                     slotLabel,autoSweepFrom,lastEventLabel,expiryLabel);
     }

   if(g_showLiquidityLevelsDebug)
     {
      string dbg1 = SRJ_fmtLvl("AS.H",g_s.asiaHigh,g_s.asiaHighSwept) + "  |  " +
                    SRJ_fmtLvl("AS.L",g_s.asiaLow, g_s.asiaLowSwept)  + "  |  " +
                    SRJ_fmtLvl("LD.H",g_s.londonHigh,g_s.londonHighSwept) + "  |  " +
                    SRJ_fmtLvl("LD.L",g_s.londonLow, g_s.londonLowSwept);
      string dbg2 = SRJ_fmtLvl("NY.H",g_s.nyHigh,g_s.nyHighSwept) + "  |  " +
                    SRJ_fmtLvl("NY.L",g_s.nyLow, g_s.nyLowSwept)  + "  |  " +
                    SRJ_fmtLvl("PM.H",g_s.pmHigh,g_s.pmHighSwept) + "  |  " +
                    SRJ_fmtLvl("PM.L",g_s.pmLow, g_s.pmLowSwept);
      string dbg3 = SRJ_fmtLvl("PD.H",g_s.prevDayHigh,g_s.pdHighSwept) + "  |  " +
                    SRJ_fmtLvl("PD.L",g_s.prevDayLow, g_s.pdLowSwept)  + "  |  buf:" +
                    DoubleToString(g_liquiditySweepBufferPoints * g_mintick,_Digits);
      cells[nCells++] = dbg1;
      cells[nCells++] = dbg2;
      cells[nCells++] = dbg3;
     }

   int flatN = 0;
   ArrayResize(flat,0);
   for(int c=0;c<nCells;c++)
     {
      string sub[];
      int ns = StringSplit(cells[c],'\n',sub);
      if(ns<=0){ ns=1; ArrayResize(sub,1); sub[0]=cells[c]; }
      for(int s=0;s<ns;s++)
        {
         ArrayResize(flat,flatN+1);
         flat[flatN++] = sub[s];
        }
     }

   uint rowARGB[];
   ArrayResize(rowARGB,flatN);
   for(int r=0;r<flatN;r++) rowARGB[r] = 0xFF000000;

   int fontPx = SRJ_CanvasFontPx(g_mtfBoxTextSize);
   uint bgARGB    = 0xFFF5F5F5;
   uint frameARGB = 0xFF555555; 

   if(g_s.mtfBoxName == "")
      g_s.mtfBoxName = "SRJ_MTFBox";
   int xOff=10, yOff=20;
   g_panelMTF.RenderCorner(g_s.mtfBoxName,CORNER_LEFT_UPPER,xOff,yOff,
                           flat,rowARGB,fontPx,bgARGB,frameARGB);
  }

void SRJ_PanelsDestroy()
  {
   g_panelMTF.Destroy();
   g_panelDataWarn.Destroy();
   g_panelBiasPane.Destroy();
  }

// Wrappers for Contract
void SRJ_Panels_Init(string posInput, string sizeInput, string mtfSizeInput, bool useAscii, string chartTF) {} // Init happens independently if needed via globals
void SRJ_Panels_BiasPane(const double &open[],const double &high[],const double &low[],const double &close[],
                         const datetime &time[],int rates_total,int i,
                         bool showBiasPane,int biasPaneOffsetBars) {
    SRJ_RenderBiasPane(time, close, rates_total, i, g_s.withinLookbackWindow);
}
void SRJ_Panels_DataWarning(bool showDataWarnings, int i, int rates_total) {
    SRJ_RenderDataWarning(i, rates_total);
}
void SRJ_Panels_MTFBox(bool autoDetect, string sweepFrom, string targetTo,
                       string h1T, string h2T, string h3T,
                       double alertNum, double erlNum,
                       bool showDbgLabel, bool showLvlDbg,
                       int i, int rates_total,
                       string h1_b, string h1_2, string h1_3, string h1_o,
                       string h2_b, string h2_2, string h2_3, string h2_o,
                       string h3_b, string h3_2, string h3_3, string h3_o) {
    SRJ_RenderMTFBox(i, rates_total, h1_b, h1_2, h1_3, h1_o, h2_b, h2_2, h2_3, h2_o, h3_b, h3_2, h3_3, h3_o);
}
void SRJ_Panels_Destroy() {
    SRJ_PanelsDestroy();
}

#endif // __SRJ_PANELS_MQH__
