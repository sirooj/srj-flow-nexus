#ifndef __SRJ_FRACTALS_MQH__
#define __SRJ_FRACTALS_MQH__

#include "SRJ_Types.mqh"
#include "SRJ_State.mqh"

int       g_ratesTotal;

double srjO(const double &open[], int i,int k)   { return open[i-k];  }
double srjH(const double &high[], int i,int k)   { return high[i-k];  }
double srjL(const double &low[],  int i,int k)   { return low[i-k];   }
double srjC(const double &close[],int i,int k)   { return close[i-k]; }

bool SRJ_isBullishCandle(const double &open[],const double &close[],int i,int index)
  {
   return (srjC(close,i,index) > srjO(open,i,index));
  }
bool SRJ_isBearishCandle(const double &open[],const double &close[],int i,int index)
  {
   return (srjC(close,i,index) < srjO(open,i,index));
  }

bool SRJ_isStrictFractalHigh(const double &high[],int i,int index)
  {
   bool result = false;
   if(index >= 1 && (i - index) >= 1 && index <= i)
     {
      if((i - (index+1)) >= 0)
        {
         result = (srjH(high,i,index) > srjH(high,i,index-1)) &&
                  (srjH(high,i,index) > srjH(high,i,index+1));
        }
     }
   return result;
  }

bool SRJ_isStrictFractalLow(const double &low[],int i,int index)
  {
   bool result = false;
   if(index >= 1 && (i - index) >= 1 && index <= i)
     {
      if((i - (index+1)) >= 0)
        {
         result = (srjL(low,i,index) < srjL(low,i,index-1)) &&
                  (srjL(low,i,index) < srjL(low,i,index+1));
        }
     }
   return result;
  }

double SRJ_getHighestInPeriod(const double &high[],int i,int lookback)
  {
   if(lookback < 1) lookback = 1;
   int startIdx = i - (lookback - 1);
   if(startIdx < 0) startIdx = 0;
   double hh = high[startIdx];
   for(int k = startIdx + 1; k <= i; k++)
      if(high[k] > hh) hh = high[k];
   return hh;
  }

double SRJ_getLowestInPeriod(const double &low[],int i,int lookback)
  {
   if(lookback < 1) lookback = 1;
   int startIdx = i - (lookback - 1);
   if(startIdx < 0) startIdx = 0;
   double ll = low[startIdx];
   for(int k = startIdx + 1; k <= i; k++)
      if(low[k] < ll) ll = low[k];
   return ll;
  }

void SRJ_getPriceRange(const double &high[],const double &low[],int i,
                       double &priceTop,double &priceBottom)
  {
   int lookback = (int)MathMax(1, MathMin(500, i)); 
   double visibleHigh = SRJ_getHighestInPeriod(high,i,lookback);
   double visibleLow  = SRJ_getLowestInPeriod(low,i,lookback);
   double padding = (visibleHigh - visibleLow) * 0.1;
   priceTop    = visibleHigh + padding;
   priceBottom = visibleLow  - padding;
  }

double SRJ_safeArrayGetFloat(const double &arr[],int index)
  {
   double result = SRJ_NA_DBL;
   if(index >= 0 && index < ArraySize(arr))
      result = arr[index];
   return result;
  }

int SRJ_safeArrayGetInt(CArrayInt &arr,int index)
  {
   int result = SRJ_NA_INT;
   if(index >= 0 && index < arr.Total())
      result = arr.At(index);
   return result;
  }
int SRJ_safeArrayGetInt(const int &arr[],int index)
  {
   int result = SRJ_NA_INT;
   if(index >= 0 && index < ArraySize(arr))
      result = arr[index];
   return result;
  }

double g_bufFractalHigh[];   
double g_bufFractalLow[];    

#define SRJ_TRIANGLE_HIGH  217   
#define SRJ_TRIANGLE_LOW   218   

void SRJ_InitFractalBuffers(int bufIdxHigh,int bufIdxLow,
                            color highCol,color lowCol,bool showFractals)
  {
   ArraySetAsSeries(g_bufFractalHigh,false);
   ArraySetAsSeries(g_bufFractalLow,false);

   PlotIndexSetInteger(bufIdxHigh,PLOT_DRAW_TYPE,DRAW_ARROW);
   PlotIndexSetInteger(bufIdxHigh,PLOT_ARROW,SRJ_TRIANGLE_HIGH);
   PlotIndexSetInteger(bufIdxHigh,PLOT_LINE_COLOR,0,highCol);
   PlotIndexSetString (bufIdxHigh,PLOT_LABEL,"Fractal High");
   PlotIndexSetDouble (bufIdxHigh,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   PlotIndexSetInteger(bufIdxLow,PLOT_DRAW_TYPE,DRAW_ARROW);
   PlotIndexSetInteger(bufIdxLow,PLOT_ARROW,SRJ_TRIANGLE_LOW);
   PlotIndexSetInteger(bufIdxLow,PLOT_LINE_COLOR,0,lowCol);
   PlotIndexSetString (bufIdxLow,PLOT_LABEL,"Fractal Low");
   PlotIndexSetDouble (bufIdxLow,PLOT_EMPTY_VALUE,EMPTY_VALUE);

   if(!showFractals)
     {
      PlotIndexSetInteger(bufIdxHigh,PLOT_DRAW_TYPE,DRAW_NONE);
      PlotIndexSetInteger(bufIdxLow, PLOT_DRAW_TYPE,DRAW_NONE);
     }
  }

void SRJ_ClearFractalBar(int i)
  {
   if(i >= 0 && i < ArraySize(g_bufFractalHigh)) g_bufFractalHigh[i] = EMPTY_VALUE;
   if(i >= 0 && i < ArraySize(g_bufFractalLow))  g_bufFractalLow[i]  = EMPTY_VALUE;
  }

// Wilder-smoothed True Range of the underlying price series, used purely to
// space fractal triangles a price-proportional distance off the candle —
// same technique as the CVD indicator's g_CvdATR, so spacing stays
// consistent across zoom levels instead of a fixed pixel offset.
void SRJ_UpdatePriceATR(const double &high[],const double &low[],const double &close[],int i)
  {
   double tr;
   if(i < 1)
      tr = high[i] - low[i];
   else
     {
      double tr1 = high[i] - low[i];
      double tr2 = MathAbs(high[i] - close[i-1]);
      double tr3 = MathAbs(low[i]  - close[i-1]);
      tr = MathMax(tr1, MathMax(tr2, tr3));
     }
   double alpha = 1.0 / (double)MathMax(1, g_fractalAtrLength);
   if(SrjIsNa(g_s.priceATRValue))
      g_s.priceATRValue = tr;
   else
      g_s.priceATRValue = g_s.priceATRValue * (1.0 - alpha) + tr * alpha;
  }

void SRJ_EmitFractals(const double &high[],const double &low[],const double &close[],
                      int i,int lastBarIndex,int finalLookback,
                      bool showFractals)
  {
   SRJ_UpdatePriceATR(high,low,close,i);

   int target = i - 1;
   if(target >= 0)
     {
      if(target < ArraySize(g_bufFractalHigh)) g_bufFractalHigh[target] = EMPTY_VALUE;
      if(target < ArraySize(g_bufFractalLow))  g_bufFractalLow[target]  = EMPTY_VALUE;
     }

   bool showFractalHigh = false;
   bool showFractalLow  = false;

   if(showFractals && i >= 2)
     {
      int absoluteLookbackThreshold = (int)MathMax(0, lastBarIndex - finalLookback);
      int fractalBar = i - 1;
      if(fractalBar >= absoluteLookbackThreshold)
        {
         if(SRJ_isStrictFractalHigh(high,i,1)) showFractalHigh = true;
         if(SRJ_isStrictFractalLow(low,i,1))   showFractalLow  = true;
        }
     }

   double gap = SrjIsNa(g_s.priceATRValue) ? 0.0 : g_s.priceATRValue * g_fractalOffsetMult;

   if(target >= 0)
     {
      if(showFractalHigh && target < ArraySize(g_bufFractalHigh))
         g_bufFractalHigh[target] = high[target] + gap;   
      if(showFractalLow && target < ArraySize(g_bufFractalLow))
         g_bufFractalLow[target]  = low[target] - gap;    
     }
  }

#endif // __SRJ_FRACTALS_MQH__
