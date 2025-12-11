//+------------------------------------------------------------------+
//|  WealthPole Architecture Demo – Core / UI Stub                   |
//|  این فایل فقط دمو و معماری است؛ بدون منطق ترید واقعی            |
//+------------------------------------------------------------------+
#pragma once

//--- حالت‌های مختلف پنل
enum ENUM_WP2_Mode
  {
   MODE_RISK = 0,
   MODE_GRID,
   MODE_HEDGE,
   MODE_FILTERS
  };

//--- وضعیت ساده پنل
struct SWealthPoleState
  {
   ENUM_WP2_Mode  mode;
   datetime       last_update;
  };

//+------------------------------------------------------------------+
//|  کلاس پنل دمو                                                     |
//+------------------------------------------------------------------+
class CWealthPoleDemo
  {
private:
   long              m_chart_id;
   SWealthPoleState  m_state;

public:
                     CWealthPoleDemo()
     {
      m_chart_id           = ChartID();
      m_state.mode         = MODE_RISK;
      m_state.last_update  = TimeCurrent();
     }

   //--- init / deinit
   void              Init(ENUM_WP2_Mode start_mode)
     {
      m_state.mode = start_mode;
      CreatePanelObjects();
      UpdatePanel();
     }

   void              Deinit()
     {
      DeletePanelObjects();
     }

   //--- روی هر تیک، فقط UI رو تازه می‌کنیم
   void              OnTick()
     {
      if(TimeCurrent() - m_state.last_update > 5)
        {
         m_state.last_update = TimeCurrent();
         UpdatePanel();
        }
     }

   //--- هندل کردن کلیک روی دکمه‌ها
   void              OnChartEvent(const int id,
                                  const long  &lparam,
                                  const double&dparam,
                                  const string&sparam)
     {
      if(id != CHARTEVENT_OBJECT_CLICK)
         return;

      if(sparam == "WP2_btn_risk")
         SetMode(MODE_RISK);
      else if(sparam == "WP2_btn_grid")
         SetMode(MODE_GRID);
      else if(sparam == "WP2_btn_hedge")
         SetMode(MODE_HEDGE);
      else if(sparam == "WP2_btn_filters")
         SetMode(MODE_FILTERS);
     }

private:

   //--- تغییر حالت و رفرش پنل
   void              SetMode(ENUM_WP2_Mode mode)
     {
      if(m_state.mode == mode)
         return;

      m_state.mode = mode;
      UpdatePanel();
     }

   //--- ساخت آبجکت‌های UI
   void              CreatePanelObjects()
     {
      // پس‌زمینه
      const string bg = "WP2_bg";
      if(!ObjectCreate(m_chart_id,bg,OBJ_RECTANGLE_LABEL,0,0,0))
        {
         Print(__FUNCTION__,": failed to create ",bg,". Error: ",GetLastError());
         return;
        }

      ObjectSetInteger(m_chart_id,bg,OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      ObjectSetInteger(m_chart_id,bg,OBJPROP_XDISTANCE,10);
      ObjectSetInteger(m_chart_id,bg,OBJPROP_YDISTANCE,20);
      ObjectSetInteger(m_chart_id,bg,OBJPROP_XSIZE,230);
      ObjectSetInteger(m_chart_id,bg,OBJPROP_YSIZE,150);
      ObjectSetInteger(m_chart_id,bg,OBJPROP_BACK,false);
      ObjectSetInteger(m_chart_id,bg,OBJPROP_COLOR,clrBlack);
      ObjectSetInteger(m_chart_id,bg,OBJPROP_WIDTH,1);

      // برچسب عنوان
      CreateLabel("WP2_lbl_title","WealthPole Demo",30);

      // برچسب حالت
      CreateLabel("WP2_lbl_mode","Mode: -",55);

      // دکمه‌ها
      CreateButton("WP2_btn_risk","Risk",80);
      CreateButton("WP2_btn_grid","Grid",105);
      CreateButton("WP2_btn_hedge","Hedge",130);
      CreateButton("WP2_btn_filters","Filters",155);
     }

   //--- ساخت یک دکمه
   void              CreateButton(const string name,
                                  const string text,
                                  const int    y_offset)
     {
      if(!ObjectCreate(m_chart_id,name,OBJ_BUTTON,0,0,0))
        {
         Print(__FUNCTION__,": failed to create button ",name,
               ". Error: ",GetLastError());
         return;
        }

      ObjectSetInteger(m_chart_id,name,OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      ObjectSetInteger(m_chart_id,name,OBJPROP_XDISTANCE,20);
      ObjectSetInteger(m_chart_id,name,OBJPROP_YDISTANCE,y_offset);
      ObjectSetInteger(m_chart_id,name,OBJPROP_XSIZE,90);
      ObjectSetInteger(m_chart_id,name,OBJPROP_YSIZE,20);
      ObjectSetString(m_chart_id,name,OBJPROP_TEXT,text);
     }

   //--- ساخت یک لیبل
   void              CreateLabel(const string name,
                                 const string text,
                                 const int    y_offset)
     {
      if(!ObjectCreate(m_chart_id,name,OBJ_LABEL,0,0,0))
        {
         Print(__FUNCTION__,": failed to create label ",name,
               ". Error: ",GetLastError());
         return;
        }

      ObjectSetInteger(m_chart_id,name,OBJPROP_CORNER,CORNER_RIGHT_UPPER);
      ObjectSetInteger(m_chart_id,name,OBJPROP_XDISTANCE,20);
      ObjectSetInteger(m_chart_id,name,OBJPROP_YDISTANCE,y_offset);
      ObjectSetString(m_chart_id,name,OBJPROP_TEXT,text);
     }

   //--- حذف آبجکت‌ها
   void              DeletePanelObjects()
     {
      const string objs[] =
        {
         "WP2_bg",
         "WP2_lbl_title",
         "WP2_lbl_mode",
         "WP2_btn_risk",
         "WP2_btn_grid",
         "WP2_btn_hedge",
         "WP2_btn_filters"
        };

      for(int i=0;i<ArraySize(objs);i++)
         ObjectDelete(m_chart_id,objs[i]);
     }

   //--- رفرش متن‌ها بر اساس mode
   void              UpdatePanel()
     {
      string mode_txt="Unknown";

      switch(m_state.mode)
        {
         case MODE_RISK   : mode_txt="Risk";    break;
         case MODE_GRID   : mode_txt="Grid";    break;
         case MODE_HEDGE  : mode_txt="Hedge";   break;
         case MODE_FILTERS: mode_txt="Filters"; break;
        }

      ObjectSetString(m_chart_id,"WP2_lbl_mode",
                      OBJPROP_TEXT,
                      "Mode: "+mode_txt);
     }
  };
