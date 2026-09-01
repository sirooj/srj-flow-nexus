#ifndef __SRJ_DRAW_MQH__
#define __SRJ_DRAW_MQH__

#include "SRJ_Types.mqh"
#include "SRJ_State.mqh"
#include "SRJ_Fractals.mqh"

int SRJ_PeriodSeconds()
  {
   return PeriodSeconds(_Period);
  }

// MT5 trend/rectangle objects have no real alpha channel — the only way to
// simulate opacity is to blend the desired color toward the chart background
// (assumed white, matching a light-theme chart) before setting it as the
// object's solid color. opacityPct: 0 = invisible (pure background), 100 = full color.
color SRJ_Opacity(color base, double opacityPct)
  {
   opacityPct = MathMax(0.0, MathMin(100.0, opacityPct));
   double a = opacityPct / 100.0;
   uint rgb = (uint)base;
   int r = (int)(rgb & 0xFF);
   int g = (int)((rgb >> 8) & 0xFF);
   int b = (int)((rgb >> 16) & 0xFF);
   int bgR = 255, bgG = 255, bgB = 255;
   int outR = (int)MathRound(r * a + bgR * (1.0 - a));
   int outG = (int)MathRound(g * a + bgG * (1.0 - a));
   int outB = (int)MathRound(b * a + bgB * (1.0 - a));
   return (color)((outB << 16) | (outG << 8) | outR);
  }

datetime SRJ_BarToTime(const datetime &time[],int rates_total,int barIndex)
  {
   int lastIdx = rates_total - 1;
   if(barIndex < 0) barIndex = 0;
   if(barIndex <= lastIdx)
      return time[barIndex];
   int over = barIndex - lastIdx;
   return (datetime)(time[lastIdx] + (long)over * (long)SRJ_PeriodSeconds());
  }

bool BarClosed(int i, int rates_total)
  {
   return (i < rates_total - 1);
  }

#define SRJ_STYLE_SOLID   0
#define SRJ_STYLE_DOTTED  1
#define SRJ_STYLE_DASHED  2
ENUM_LINE_STYLE SRJ_LineStyle(int s)
  {
   switch(s)
     {
      case SRJ_STYLE_DOTTED: return STYLE_DOT;
      case SRJ_STYLE_DASHED: return STYLE_DASH;
      default:               return STYLE_SOLID;
     }
  }

string SRJ_DrawTrend(const string category,
                     const datetime &time[],int rates_total,
                     int x1bar,double y1,int x2bar,double y2,
                     color clr,int width,int style,bool extendRight)
  {
   string name = SRJ_NextName(category);
   datetime t1 = SRJ_BarToTime(time,rates_total,x1bar);
   datetime t2 = SRJ_BarToTime(time,rates_total,x2bar);
   if(!ObjectCreate(0,name,OBJ_TREND,0,t1,y1,t2,y2))
      return "";
   ObjectSetInteger(0,name,OBJPROP_COLOR,clr);
   ObjectSetInteger(0,name,OBJPROP_WIDTH,width);
   ObjectSetInteger(0,name,OBJPROP_STYLE,SRJ_LineStyle(style));
   ObjectSetInteger(0,name,OBJPROP_RAY_RIGHT,extendRight);
   ObjectSetInteger(0,name,OBJPROP_RAY_LEFT,false);
   ObjectSetInteger(0,name,OBJPROP_BACK,false);
   ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,name,OBJPROP_SELECTED,false);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,true);
   return name;
  }

string SRJ_DrawBox(const string category,
                   const datetime &time[],int rates_total,
                   int leftBar,double top,int rightBar,double bottom,
                   color bgClr,color borderClr,int borderWidth)
  {
   string name = SRJ_NextName(category);
   datetime t1 = SRJ_BarToTime(time,rates_total,leftBar);
   datetime t2 = SRJ_BarToTime(time,rates_total,rightBar);
   if(!ObjectCreate(0,name,OBJ_RECTANGLE,0,t1,top,t2,bottom))
      return "";
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,bgClr);
   ObjectSetInteger(0,name,OBJPROP_COLOR,borderClr);   
   ObjectSetInteger(0,name,OBJPROP_WIDTH,borderWidth);
   ObjectSetInteger(0,name,OBJPROP_STYLE,STYLE_SOLID);
   ObjectSetInteger(0,name,OBJPROP_FILL,false);
   ObjectSetInteger(0,name,OBJPROP_BACK,true);
   ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,name,OBJPROP_SELECTED,false);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,true);
   return name;
  }

void SRJ_SetTrendColor(const string name,color clr)
  { if(name!="" && !SrjIsNa(name)) ObjectSetInteger(0,name,OBJPROP_COLOR,clr); }

void SRJ_SetTrendWidth(const string name,int width)
  { if(name!="" && !SrjIsNa(name)) ObjectSetInteger(0,name,OBJPROP_WIDTH,width); }

void SRJ_SetTrendStyle(const string name,int style)
  { if(name!="" && !SrjIsNa(name)) ObjectSetInteger(0,name,OBJPROP_STYLE,SRJ_LineStyle(style)); }

void SRJ_SetTrendExtend(const string name,bool extendRight)
  { if(name!="" && !SrjIsNa(name)) ObjectSetInteger(0,name,OBJPROP_RAY_RIGHT,extendRight); }

void SRJ_SetTrendX1(const string name,const datetime &time[],int rates_total,int x1bar)
  { if(name!="" && !SrjIsNa(name)) ObjectSetInteger(0,name,OBJPROP_TIME,0,SRJ_BarToTime(time,rates_total,x1bar)); }
void SRJ_SetTrendY1(const string name,double y1)
  { if(name!="" && !SrjIsNa(name)) ObjectSetDouble(0,name,OBJPROP_PRICE,0,y1); }
void SRJ_SetTrendX2(const string name,const datetime &time[],int rates_total,int x2bar)
  { if(name!="" && !SrjIsNa(name)) ObjectSetInteger(0,name,OBJPROP_TIME,1,SRJ_BarToTime(time,rates_total,x2bar)); }
void SRJ_SetTrendY2(const string name,double y2)
  { if(name!="" && !SrjIsNa(name)) ObjectSetDouble(0,name,OBJPROP_PRICE,1,y2); }

void SRJ_SetBoxBg(const string name,color bg)
  { if(name!="" && !SrjIsNa(name)) ObjectSetInteger(0,name,OBJPROP_BGCOLOR,bg); }
void SRJ_SetBoxBorderColor(const string name,color c)
  { if(name!="" && !SrjIsNa(name)) ObjectSetInteger(0,name,OBJPROP_COLOR,c); }
void SRJ_SetBoxBorderWidth(const string name,int w)
  { if(name!="" && !SrjIsNa(name)) ObjectSetInteger(0,name,OBJPROP_WIDTH,w); }

void SRJ_DeleteObj(const string name)
  {
   if(name!="" && !SrjIsNa(name))
      ObjectDelete(0,name);
  }

// MT5's native STYLE_DASH has one fixed dash length with no adjustable
// parameter, so a "longer dash" isn't achievable by changing the style enum.
// This draws the vertical line as a few long solid segments with visible
// gaps instead, giving a genuinely longer, chunkier dash than the native style.
#define SRJ_LONGDASH_SEGMENTS 3

string SRJ_DrawLongDashVertical(const string category,
                                const datetime &time[],int rates_total,int barIdx,
                                double top,double bottom,
                                color clr,int width,bool extendRight)
  {
   string baseName = SRJ_NextName(category);
   double span = bottom - top;
   int nSeg = SRJ_LONGDASH_SEGMENTS;
   int nGap = nSeg - 1;
   double dashUnits = 3.0, gapUnits = 1.0;
   double totalUnits = nSeg*dashUnits + nGap*gapUnits;
   double unit = (totalUnits > 0) ? span/totalUnits : 0;
   double dashLen = unit*dashUnits;
   double gapLen  = unit*gapUnits;
   datetime t = SRJ_BarToTime(time,rates_total,barIdx);

   double cursor = top;
   for(int s=0; s<nSeg; s++)
     {
      double segTop = cursor;
      double segBottom = cursor + dashLen;
      string segName = baseName + "_" + IntegerToString(s);
      if(ObjectCreate(0,segName,OBJ_TREND,0,t,segTop,t,segBottom))
        {
         ObjectSetInteger(0,segName,OBJPROP_COLOR,clr);
         ObjectSetInteger(0,segName,OBJPROP_WIDTH,width);
         ObjectSetInteger(0,segName,OBJPROP_STYLE,STYLE_SOLID);
         ObjectSetInteger(0,segName,OBJPROP_RAY_RIGHT,extendRight);
         ObjectSetInteger(0,segName,OBJPROP_RAY_LEFT,false);
         ObjectSetInteger(0,segName,OBJPROP_BACK,false);
         ObjectSetInteger(0,segName,OBJPROP_SELECTABLE,false);
         ObjectSetInteger(0,segName,OBJPROP_SELECTED,false);
         ObjectSetInteger(0,segName,OBJPROP_HIDDEN,true);
         if(g_isTrackIntrabar)
            g_intrabarObjects.Add(segName);
        }
      cursor += dashLen + gapLen;
     }
   return baseName;
  }

void SRJ_DeleteLongDashVertical(const string baseName)
  {
   if(baseName=="" || SrjIsNa(baseName)) return;
   for(int s=0; s<SRJ_LONGDASH_SEGMENTS; s++)
      SRJ_DeleteObj(baseName + "_" + IntegerToString(s));
  }

void SRJ_Draw_BiasAndRenewalLines(const double &high[],const double &low[],const datetime &time[],int rates_total,int i)
  {
   double priceTop, priceBottom;
   SRJ_getPriceRange(high,low,i,priceTop,priceBottom);
   
   if(g_s.drawBiasLineNow && g_showBiasChangeLines)
     {
      color clr = (g_s.newBiasDirection == "bullish") ? g_biasChangeLineColorBullish : g_biasChangeLineColorBearish;
      clr = SRJ_Opacity(clr, 50.0);
      string name = SRJ_DrawTrend("BiasChange", time, rates_total, i, priceTop, i, priceBottom, clr, g_biasChangeLineWidth, SRJ_STYLE_DASHED, false);
      CBiasChangeLine *bcl = new CBiasChangeLine();
      bcl.barIndex = i;
      bcl.direction = g_s.newBiasDirection;
      bcl.lineName = name;
      g_biasChangeLines.Add(bcl);
      
      g_s.drawBiasLineNow = false;
      g_s.newBiasDirection = SRJ_NA_STR;
     }
     
   if(g_s.drawStructureRenewalLineNow && g_showStructureRenewalLines && !g_s.justChangedBias)
     {
      bool skip = false;
      int bclCount = g_biasChangeLines.Total();
      if(bclCount > 0)
        {
         CBiasChangeLine *lastBcl = GetBCL(g_biasChangeLines, bclCount - 1);
         if(lastBcl != NULL && lastBcl.barIndex == i)
            skip = true;
        }
        
      if(!skip)
        {
         color clr = (g_s.renewalDirection == "bullish") ? g_structureRenewalLineColorBullish : g_structureRenewalLineColorBearish;
         clr = SRJ_Opacity(clr, 30.0);
         string name = SRJ_DrawTrend("StructRen", time, rates_total, i, priceTop, i, priceBottom, clr, g_structureRenewalLineWidth, SRJ_STYLE_DASHED, false);
         CStructureRenewalLine *srl = new CStructureRenewalLine();
         srl.barIndex = i;
         srl.direction = g_s.renewalDirection;
         srl.lineName = name;
         g_structureRenewalLines.Add(srl);
        }
        
      g_s.drawStructureRenewalLineNow = false;
      g_s.renewalDirection = SRJ_NA_STR;
     }
  }

bool SRJ_OBOverCap(CArrayObj &orderblocks,int selfIdx,int keepInvalidatedCount)
  {
   COrderblock *self = GetOB(orderblocks,selfIdx);
   if(self==NULL) return false;
   if(self.isValid) return false;                 
   if(SrjIsNa(self.invalidationBar)) return false;

   int myRank = 0;
   int n = orderblocks.Total();
   for(int j=0; j<n; j++)
     {
      COrderblock *o = GetOB(orderblocks,j);
      if(o==NULL) continue;
      if(!o.isValid && !SrjIsNa(o.invalidationBar))
        {
         if(o.invalidationBar > self.invalidationBar)
            myRank++;
        }
     }
   return (keepInvalidatedCount > 0 && myRank >= keepInvalidatedCount);
  }

bool SRJ_FVGOverCap(CArrayObj &imbalances,int selfIdx,int keepInvalidatedFVGCount)
  {
   CImbalance *self = GetFVG(imbalances,selfIdx);
   if(self==NULL) return false;
   if(!(self.isFilled && !SrjIsNa(self.fillBar))) return false;

   int fvgFilledCount = 0;
   int posInFVGList   = -1;
   int n = imbalances.Total();
   for(int j=0; j<n; j++)
     {
      CImbalance *f = GetFVG(imbalances,j);
      if(f==NULL) continue;
      if(f.isFilled && !SrjIsNa(f.fillBar))
        {
         if(j == selfIdx)
            posInFVGList = fvgFilledCount;
         fvgFilledCount++;
        }
     }
   if(posInFVGList < 0) return false;
   return (keepInvalidatedFVGCount > 0 &&
           posInFVGList < fvgFilledCount - keepInvalidatedFVGCount);
  }

void SRJ_PruneBiasChangeLines(int keepCount)
  {
   if(keepCount <= 0) return;
   int total = g_biasChangeLines.Total();
   if(total <= keepCount) return;
   int toRemove = total - keepCount;
   for(int iter=0; iter<toRemove; iter++)
     {
      CBiasChangeLine *bcl = GetBCL(g_biasChangeLines,0);
      if(bcl!=NULL && bcl.HasLine())
         SRJ_DeleteObj(bcl.lineName);
      g_biasChangeLines.Delete(0);   
     }
  }

void SRJ_PruneStructureRenewalLines(int keepCount)
  {
   if(keepCount <= 0) return;
   int total = g_structureRenewalLines.Total();
   if(total <= keepCount) return;
   int toRemove = total - keepCount;
   for(int iter=0; iter<toRemove; iter++)
     {
      CStructureRenewalLine *srl = GetSRL(g_structureRenewalLines,0);
      if(srl!=NULL && srl.HasLine())
         SRJ_DeleteObj(srl.lineName);
      g_structureRenewalLines.Delete(0);
     }
  }

void SRJ_PruneLineRefArray(CArrayObj &arr,int retentionDays)
  {
   while(arr.Total() > retentionDays)
     {
      SLineRef *ref = GetLineRef(arr,0);
      if(ref!=NULL)
         SRJ_DeleteObj(ref.name);
      arr.Delete(0);   
     }
  }

void SRJ_DeleteAllObjects()
  {
   ObjectsDeleteAll(0,"SRJ_");
  }

#endif // __SRJ_DRAW_MQH__
