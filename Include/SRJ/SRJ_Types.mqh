#ifndef __SRJ_TYPES_MQH__
#define __SRJ_TYPES_MQH__

#include <Arrays\ArrayObj.mqh>
#include <Arrays\ArrayInt.mqh>
#include <Object.mqh>

//--- na sentinels -------------------------------------------------------
#define SRJ_NA_INT     (INT_MIN)
#define SRJ_NA_DBL     (EMPTY_VALUE)      // 2147483647 sentinel for doubles
#define SRJ_NA_STR     ("\x01NA")          // internal marker string for na strings

//--- na helpers ---------------------------------------------------------
bool SrjIsNa(const int v)     { return (v == SRJ_NA_INT); }
bool SrjIsNa(const double v)  { return (v == SRJ_NA_DBL); }
bool SrjIsNa(const string v)  { return (v == SRJ_NA_STR || v == NULL); }

int    SrjNaInt()    { return SRJ_NA_INT; }
double SrjNaDbl()    { return SRJ_NA_DBL; }
string SrjNaStr()    { return SRJ_NA_STR; }

//--- [Task 98a] Monotonic object-identity counter -----------------------
// Assigned once at construction, never reassigned, never reused within a run.
// Deliberately NOT a member of SState: the intrabar snapshot restores SState
// wholesale, and rolling this counter back would hand one id to two different
// objects. Reset to 0 in SRJ_StateInit(), which runs only on a full recalc
// where every object is destroyed and rebuilt — so an id is unique for the
// life of a run but is NOT stable across a recalc. Recalc-stable identity is
// the composite key (direction, startBar time, creation/detection time, bounds).
// Write-only for now: nothing reads objId yet.
long g_srjObjIdSeq = 0;
long SRJ_NextObjId(void) { g_srjObjIdSeq++; return g_srjObjIdSeq; }

//+------------------------------------------------------------------+
//| Orderblock  (Pine: type Orderblock)                              |
//+------------------------------------------------------------------+
class COrderblock : public CObject
  {
public:
   int      startBar;
   int      endBar;
   int      swingBar;
   double   high;
   double   low;
   double   open;
   double   midpoint;
   double   invalidationLevel;
   bool     isBullish;
   bool     isActivated;
   bool     isValid;
   int      validationBar;
   int      invalidationBar;
   string   obLineName;      
   string   midLineName;     
   bool     isExtreme;
   bool     isPromoted;
   bool     hasDrivenRenewal; 
   int      creationBar;        // NEW: Bar index when OB was created/discovered
   long     promotionBar;       // [Task 110] bar index on which SRJ_ApplyPromotion ran.
                                // SRJ_NA_INT = never promoted. Stamped at the two
                                // SRJ_ApplyPromotion call sites, not inside that
                                // function, because it takes no bar parameter.
   long     objId;              // [Task 98a] immutable identity, set at construction

            COrderblock(void)
     {
      startBar          = SRJ_NA_INT;
      endBar            = SRJ_NA_INT;
      swingBar          = SRJ_NA_INT;
      high              = SRJ_NA_DBL;
      low               = SRJ_NA_DBL;
      open              = SRJ_NA_DBL;
      midpoint          = SRJ_NA_DBL;
      invalidationLevel = SRJ_NA_DBL;
      isBullish         = false;
      isActivated       = false;
      isValid           = false;
      validationBar     = SRJ_NA_INT;
      invalidationBar   = SRJ_NA_INT;
      obLineName        = "";
      midLineName       = "";
      isExtreme         = false;
      isPromoted        = false;
      hasDrivenRenewal  = false;
      objId             = 0;           // [Task 98a] 0 = unassigned
      creationBar       = SRJ_NA_INT;  // NEW
      promotionBar      = SRJ_NA_INT;  // [Task 110] never promoted
     }

   bool     HasObLine(void)  const { return (obLineName  != "" && !SrjIsNa(obLineName)); }
   bool     HasMidLine(void) const { return (midLineName != "" && !SrjIsNa(midLineName)); }
  };

//+------------------------------------------------------------------+
//| Imbalance  (Pine: type Imbalance)                               |
//+------------------------------------------------------------------+
class CImbalance : public CObject
  {
public:
   int      startBar;
   int      endBar;
   int      detectionBar;
   double   top;
   double   bottom;
   double   midpoint;
   bool     isBullish;
   bool     isFilled;
   int      fillBar;
   string   boxName;         
   string   midLineName;     
   bool     isWickFilled;
   int      wickFillBar;
   double   remTop;      // [P-FVGVALIDITY] untested remainder top (edge-anchored)
   double   remBottom;   // [P-FVGVALIDITY] untested remainder bottom
   bool     isVisible;
   long     objId;               // [Task 98a] immutable identity, set at construction

            CImbalance(void)
     {
      startBar     = SRJ_NA_INT;
      endBar       = SRJ_NA_INT;
      detectionBar = SRJ_NA_INT;
      top          = SRJ_NA_DBL;
      bottom       = SRJ_NA_DBL;
      midpoint     = SRJ_NA_DBL;
      isBullish    = false;
      isFilled     = false;
      fillBar      = SRJ_NA_INT;
      boxName      = "";
      midLineName  = "";
      isWickFilled = false;
      wickFillBar  = SRJ_NA_INT;
      remTop       = SRJ_NA_DBL;
      remBottom    = SRJ_NA_DBL;
      isVisible    = true;
      objId        = 0;         // [Task 98a] 0 = unassigned
     }

   bool     HasBox(void)     const { return (boxName     != "" && !SrjIsNa(boxName)); }
   bool     HasMidLine(void) const { return (midLineName != "" && !SrjIsNa(midLineName)); }
  };

//+------------------------------------------------------------------+
//| BiasChangeLine  (Pine: type BiasChangeLine)                     |
//+------------------------------------------------------------------+
class CBiasChangeLine : public CObject
  {
public:
   int      barIndex;
   string   direction;       
   string   lineName;        

            CBiasChangeLine(void)
     {
      barIndex  = SRJ_NA_INT;
      direction = "";
      lineName  = "";
     }
   bool     HasLine(void) const { return (lineName != "" && !SrjIsNa(lineName)); }
  };

//+------------------------------------------------------------------+
//| StructureRenewalLine  (Pine: type StructureRenewalLine)        |
//+------------------------------------------------------------------+
class CStructureRenewalLine : public CObject
  {
public:
   int      barIndex;
   string   direction;       
   string   lineName;        

            CStructureRenewalLine(void)
     {
      barIndex  = SRJ_NA_INT;
      direction = "";
      lineName  = "";
     }
   bool     HasLine(void) const { return (lineName != "" && !SrjIsNa(lineName)); }
  };

//+------------------------------------------------------------------+
//| HTF_Orderblock  (Pine: type HTF_Orderblock — headless)          |
//+------------------------------------------------------------------+
class CHTF_Orderblock : public CObject
  {
public:
   int      startBar;
   int      swingBar;
   double   high;
   double   low;
   double   open;
   double   invalidationLevel;
   bool     isBullish;
   bool     isActivated;
   bool     isValid;
   int      validationBar;
   int      invalidationBar;
   int      creationBar;  // NEW

            CHTF_Orderblock(void)
     {
      startBar          = SRJ_NA_INT;
      swingBar          = SRJ_NA_INT;
      high              = SRJ_NA_DBL;
      low               = SRJ_NA_DBL;
      open              = SRJ_NA_DBL;
      invalidationLevel = SRJ_NA_DBL;
      isBullish         = false;
      isActivated       = false;
      isValid           = false;
      validationBar     = SRJ_NA_INT;
      invalidationBar   = SRJ_NA_INT;
      creationBar       = SRJ_NA_INT;  // NEW
     }
  };

//+------------------------------------------------------------------+
//| HTF_Imbalance  (Pine: type HTF_Imbalance — headless)            |
//+------------------------------------------------------------------+
class CHTF_Imbalance : public CObject
  {
public:
   int      startBar;
   int      detectionBar;
   double   top;
   double   bottom;
   double   midpoint;
   bool     isBullish;
   bool     isFilled;
   int      fillBar;

            CHTF_Imbalance(void)
     {
      startBar     = SRJ_NA_INT;
      detectionBar = SRJ_NA_INT;
      top          = SRJ_NA_DBL;
      bottom       = SRJ_NA_DBL;
      midpoint     = SRJ_NA_DBL;
      isBullish    = false;
      isFilled     = false;
      fillBar      = SRJ_NA_INT;
     }
  };

//+------------------------------------------------------------------+
//| Convenience constructors (mirror Pine .new(...) positional args) |
//+------------------------------------------------------------------+

// Pine: Orderblock.new(startBar,endBar,swingBar,high,low,open,midpoint,
//        invalidationLevel,isBullish,isActivated,isValid,validationBar,
//        invalidationBar,obLine,midLine,isExtreme,isPromoted, creationBar)
COrderblock *NewOrderblock(int startBar,int endBar,int swingBar,
                           double high,double low,double open,double midpoint,
                           double invalidationLevel,bool isBullish,bool isActivated,
                           bool isValid,int validationBar,int invalidationBar,
                           string obLineName,string midLineName,
                           bool isExtreme,bool isPromoted, int creationBar)  // NEW parameter
  {
   COrderblock *ob = new COrderblock();
   ob.startBar          = startBar;
   ob.endBar            = endBar;
   ob.swingBar          = swingBar;
   ob.high              = high;
   ob.low               = low;
   ob.open              = open;
   ob.midpoint          = midpoint;
   ob.invalidationLevel = invalidationLevel;
   ob.isBullish         = isBullish;
   ob.isActivated       = isActivated;
   ob.isValid           = isValid;
   ob.validationBar     = validationBar;
   ob.invalidationBar   = invalidationBar;
   ob.obLineName        = obLineName;
   ob.midLineName       = midLineName;
   ob.isExtreme         = isExtreme;
   ob.isPromoted        = isPromoted;
   ob.creationBar       = creationBar;  // NEW
   ob.objId             = SRJ_NextObjId();   // [Task 98a]
   return ob;
  }

// Pine: Imbalance.new(startBar,endBar,detectionBar,top,bottom,midpoint,
//        isBullish,isFilled,fillBar,imbalanceBox,midLine,isWickFilled,
//        wickFillBar,isVisible)
CImbalance *NewImbalance(int startBar,int endBar,int detectionBar,
                         double top,double bottom,double midpoint,
                         bool isBullish,bool isFilled,int fillBar,
                         string boxName,string midLineName,
                         bool isWickFilled,int wickFillBar,bool isVisible)
  {
   CImbalance *fvg = new CImbalance();
   fvg.startBar     = startBar;
   fvg.endBar       = endBar;
   fvg.detectionBar = detectionBar;
   fvg.top          = top;
   fvg.bottom       = bottom;
   fvg.midpoint     = midpoint;
   fvg.isBullish    = isBullish;
   fvg.isFilled     = isFilled;
   fvg.fillBar      = fillBar;
   fvg.boxName      = boxName;
   fvg.midLineName  = midLineName;
   fvg.isWickFilled = isWickFilled;
   fvg.wickFillBar  = wickFillBar;
   fvg.isVisible    = isVisible;
   fvg.objId        = SRJ_NextObjId();   // [Task 98a]
   return fvg;
  }

// Pine: HTF_Orderblock.new(startBar,swingBar,high,low,open,invalidationLevel,
//        isBullish,isActivated,isValid,validationBar,invalidationBar)
CHTF_Orderblock *NewHTFOrderblock(int startBar,int swingBar,double high,double low,
                                  double open,double invalidationLevel,bool isBullish,
                                  bool isActivated,bool isValid,int validationBar,
                                  int invalidationBar)
  {
   CHTF_Orderblock *ob = new CHTF_Orderblock();
   ob.startBar          = startBar;
   ob.swingBar          = swingBar;
   ob.high              = high;
   ob.low               = low;
   ob.open              = open;
   ob.invalidationLevel = invalidationLevel;
   ob.isBullish         = isBullish;
   ob.isActivated       = isActivated;
   ob.isValid           = isValid;
   ob.validationBar     = validationBar;
   ob.invalidationBar   = invalidationBar;
   return ob;
  }

// Pine: HTF_Imbalance.new(startBar,detectionBar,top,bottom,midpoint,
//        isBullish,isFilled,fillBar)
CHTF_Imbalance *NewHTFImbalance(int startBar,int detectionBar,double top,double bottom,
                                double midpoint,bool isBullish,bool isFilled,int fillBar)
  {
   CHTF_Imbalance *fvg = new CHTF_Imbalance();
   fvg.startBar     = startBar;
   fvg.detectionBar = detectionBar;
   fvg.top          = top;
   fvg.bottom       = bottom;
   fvg.midpoint     = midpoint;
   fvg.isBullish    = isBullish;
   fvg.isFilled     = isFilled;
   fvg.fillBar      = fillBar;
   return fvg;
  }

//+------------------------------------------------------------------+
//| Typed getters for CArrayObj (avoid repetitive casting)          |
//+------------------------------------------------------------------+
COrderblock          *GetOB (CArrayObj &a,int idx) { return (COrderblock*)a.At(idx); }
CImbalance           *GetFVG(CArrayObj &a,int idx) { return (CImbalance*)a.At(idx); }
CBiasChangeLine      *GetBCL(CArrayObj &a,int idx) { return (CBiasChangeLine*)a.At(idx); }
CStructureRenewalLine*GetSRL(CArrayObj &a,int idx) { return (CStructureRenewalLine*)a.At(idx); }
CHTF_Orderblock      *GetHTFOB (CArrayObj &a,int idx){ return (CHTF_Orderblock*)a.At(idx); }
CHTF_Imbalance       *GetHTFFVG(CArrayObj &a,int idx){ return (CHTF_Imbalance*)a.At(idx); }

#endif // __SRJ_TYPES_MQH__