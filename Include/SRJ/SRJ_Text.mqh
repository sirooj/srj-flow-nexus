#ifndef __SRJ_TEXT_MQH__
#define __SRJ_TEXT_MQH__

#include "SRJ_State.mqh"

string g_glyph_check;
string g_glyph_cross;
string g_glyph_bull;
string g_glyph_bear;
string g_glyph_2ob;
string g_glyph_rev;
string g_glyph_up;
string g_glyph_dn;
string g_glyph_tickmark;
string g_glyph_xmark;

void SRJ_Glyph_Init()
  {
   g_glyph_check    = g_useAsciiFallback ? "[v]" : ShortToString(0x2713);
   g_glyph_cross    = g_useAsciiFallback ? "[x]" : ShortToString(0x2717);
   g_glyph_bull     = g_useAsciiFallback ? "BULL" : ShortToString(0x25B2) + "BULL";
   g_glyph_bear     = g_useAsciiFallback ? "BEAR" : ShortToString(0x25BC) + "BEAR";
   g_glyph_2ob      = "2xOB";
   g_glyph_rev      = "OPP FVG";
   g_glyph_up       = g_useAsciiFallback ? "^" : ShortToString(0x2191);
   g_glyph_dn       = g_useAsciiFallback ? "v" : ShortToString(0x2193);
   g_glyph_tickmark = g_useAsciiFallback ? "v" : ShortToString(0x2713);
   g_glyph_xmark    = g_useAsciiFallback ? "x" : ShortToString(0x2717);
  }

string SRJ_CHECK() { return g_glyph_check; }
string SRJ_CROSS() { return g_glyph_cross; }
string SRJ_BULL()  { return g_glyph_bull; }
string SRJ_BEAR()  { return g_glyph_bear; }
string SRJ_2OB()   { return g_glyph_2ob; }
string SRJ_REV()   { return g_glyph_rev; }
string SRJ_UP()    { return g_glyph_up; }
string SRJ_DN()    { return g_glyph_dn; }
string SRJ_TICKMARK() { return g_glyph_tickmark; }
string SRJ_XMARK() { return g_glyph_xmark; }

string SRJ_buildStatusLine3(bool obExists,bool fvgExists,bool tickOB,bool tickFVG,
                            bool is2OB,bool checklistActive,bool suppressStatus)
  {
   string line3 = "";
   bool suppressByChecklist = checklistActive && !obExists && !fvgExists;
   if(suppressStatus || suppressByChecklist)
     {
      line3 = "";
     }
   else if(is2OB)
     {
      if(!fvgExists && tickOB)
         line3 = "";
      else if(!fvgExists && !tickOB)
         line3 = "OB" + SRJ_CROSS();
      else
        {
         string obSym = tickOB ? SRJ_CHECK() : SRJ_CROSS();
         string fvSym = fvgExists ? (tickFVG ? SRJ_CHECK() : SRJ_CROSS()) : "";
         line3 = StringFormat("OB%s, FVG%s", obSym, fvSym);
        }
     }
   else
     {
      string obSym = obExists ? (tickOB ? SRJ_CHECK() : SRJ_CROSS()) : SRJ_CROSS();
      string fvSym = fvgExists ? (tickFVG ? SRJ_CHECK() : SRJ_CROSS()) : "";
      line3 = StringFormat("OB%s, FVG%s", obSym, fvSym);
     }
   return line3;
  }

string SRJ_fmtBiasShort(string bias)
  {
   if(bias == "bullish") return "Bull";
   if(bias == "bearish") return "Bear";
   return "NA";
  }

string SRJ_erlEmojiFromTag(string tag)
  {
   if(tag == "NA")
      return "NA";
   else if(StringLen(tag) >= 2 && StringSubstr(tag,StringLen(tag)-2) == ".H")
      return SRJ_BEAR();
   else if(StringLen(tag) >= 2 && StringSubstr(tag,StringLen(tag)-2) == ".L")
      return SRJ_BULL();
   else
      return "NA";
  }

string SRJ_buildERLRow(string sweepTag,string targetTo,double erlAlert)
  {
   string emoji = SRJ_erlEmojiFromTag(sweepTag);
   return StringFormat("%s to %s || %s || Alert %s",
                       sweepTag, targetTo, emoji, DoubleToString(erlAlert,1));
  }

string SRJ_buildManualRowHTF(string tfLabel,string bias,string xpoi,
                             string statusLine,string fvgLoop,string twoOB)
  {
   string biasDisp = (bias=="Bull") ? "Bull" : (bias=="Bear") ? "Bear" : "NA";
   string line1 = StringFormat("%s: %s || %s", tfLabel, biasDisp, xpoi);
   string line2 = (twoOB == SRJ_2OB()) ? SRJ_2OB() : "";
   string line3 = statusLine;
   string line4 = (fvgLoop == SRJ_REV()) ? SRJ_REV() : "";
   string result = line1;
   if(line2 != "") result += "\n" + line2;
   if(line3 != "") result += "\n" + line3;
   if(line4 != "") result += "\n" + line4;
   return result;
  }

string SRJ_determineOrderflowBiasManual(string b1,string b2,string b3)
  {
   int bullCount = (b1=="Bull"?1:0) + (b2=="Bull"?1:0) + (b3=="Bull"?1:0);
   int bearCount = (b1=="Bear"?1:0) + (b2=="Bear"?1:0) + (b3=="Bear"?1:0);
   if(bullCount >= 2) return SRJ_BULL();
   if(bearCount >= 2) return SRJ_BEAR();
   return "NA";
  }

string SRJ_formatERLBiasFromSource(string sweepFrom)
  {
   if(sweepFrom == "NA")
      return "Bias NA";
   else if(StringLen(sweepFrom)>=2 && StringSubstr(sweepFrom,StringLen(sweepFrom)-2)==".H")
      return "Bearish Bias";
   else if(StringLen(sweepFrom)>=2 && StringSubstr(sweepFrom,StringLen(sweepFrom)-2)==".L")
      return "Bullish Bias";
   else if(sweepFrom == "XPOI")
      return "XPOI Bias";
   else
      return "Bias NA";
  }

string SRJ_formatTF(string tf)
  {
   if(tf == "60")                 return "1H";
   else if(tf == "240")           return "4H";
   else if(tf == "1D" || tf=="D") return "1D";
   else if(tf == "W" || tf=="1W") return "1W";
   else                           return tf + "m";
  }

string SRJ_TFToPineString(ENUM_TIMEFRAMES tf)
  {
   switch(tf)
     {
      case PERIOD_M1:  return "1";
      case PERIOD_M5:  return "5";
      case PERIOD_M15: return "15";
      case PERIOD_M30: return "30";
      case PERIOD_H1:  return "60";
      case PERIOD_H4:  return "240";
      case PERIOD_D1:  return "1D";
      case PERIOD_W1:  return "W";
      case PERIOD_MN1: return "1M";
      default:
        {
         int mins = PeriodSeconds(tf)/60;
         return (string)mins;
        }
     }
  }

string SRJ_fmtLvl(string tag,double val,bool swept)
  {
   string valStr = SrjIsNa(val) ? "NA" : DoubleToString(val,_Digits);
   string mark = swept ? SRJ_TICKMARK() : SRJ_XMARK();
   return StringFormat("%s:%s%s", tag, valStr, mark);
  }

#endif // __SRJ_TEXT_MQH__
