//+------------------------------------------------------------------+
//|   WealthPole Architecture Demo – Starter EA                      |
//|   Author: Hossein Asgari (Fintor AI)                             |
//+------------------------------------------------------------------+
#property copyright "Hossein Asgari - Fintor AI"
#property link      "https://fintorai.com"
#property version   "1.00"
#property strict

#include <FintorAI/Core.mqh>

//--- external inputs (فقط برای دمو)
input ENUM_WP2_Mode InpStartMode = MODE_RISK;

//--- پنل اصلی دمو
CWealthPoleDemo g_panel;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   g_panel.Init(InpStartMode);
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   g_panel.Deinit();
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   g_panel.OnTick();
  }
//+------------------------------------------------------------------+
//| Chart event handler (برای کلیک روی دکمه‌ها)                     |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long  &lparam,
                  const double&dparam,
                  const string&sparam)
  {
   g_panel.OnChartEvent(id,lparam,dparam,sparam);
  }
//+------------------------------------------------------------------+
