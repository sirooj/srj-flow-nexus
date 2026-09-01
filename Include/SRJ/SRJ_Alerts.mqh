#ifndef __SRJ_ALERTS_MQH__
#define __SRJ_ALERTS_MQH__

#include "SRJ_Types.mqh"
#include "SRJ_State.mqh"

void SRJ_DispatchAlert(int &lastBarGuard,int i,const string msg)
  {
   if(lastBarGuard == i)
      return;
   lastBarGuard = i;

   Alert(msg);                   
   if(g_alertSendPush)
      SendNotification(msg);
   if(g_alertSendEmail)
      SendMail("SRJ Flow Logic", msg);
  }

void SRJ_Alerts_DispatchBiasRenewal(int i)
  {
   if(g_enableBiasFlipAlerts)
     {
      if(g_s.bullishBiasFlipAlert)
         SRJ_DispatchAlert(g_alertBar_bullFlip, i,
                           "SRJ Flow Logic: Bullish Bias Flip Detected");
      if(g_s.bearishBiasFlipAlert)
         SRJ_DispatchAlert(g_alertBar_bearFlip, i,
                           "SRJ Flow Logic: Bearish Bias Flip Detected");
     }

   if(g_enableStructureRenewalAlerts)
     {
      if(g_s.bullishStructureRenewalAlert)
         SRJ_DispatchAlert(g_alertBar_bullRenewal, i,
                           "SRJ Flow Logic: Bullish Structure Renewal");
      if(g_s.bearishStructureRenewalAlert)
         SRJ_DispatchAlert(g_alertBar_bearRenewal, i,
                           "SRJ Flow Logic: Bearish Structure Renewal");
     }
  }

void SRJ_FireExtremePromote(int i, string bias)
  {
   if(!g_enableExtremeOBPromotionAlerts) return;
   string dirMsg = (bias=="bullish") ? "Bullish" : "Bearish";
   SRJ_DispatchAlert(g_alertBar_extPromote, i, "SRJ Flow Logic: Extreme OB Promoted (" + dirMsg + ")");
  }

#endif // __SRJ_ALERTS_MQH__
