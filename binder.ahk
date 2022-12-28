#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance, force
oldbutton = NULL
Menu, Tray, noStandard
Menu, Tray, Add
Menu, Tray, Add, Website, RunWebsite
Menu, Tray, Add, Exit, ExitApptray
Menu, Tray, Add
if not A_IsAdmin
Run *RunAs "%A_ScriptFullPath%"
IfWinExist, clumsy 
{
   
} else  {
    Gui, Color, c282828, Verdana
    Gui, Font, s8, Calisto MT
    Gui, Add, Text, x85 y40 cWhite center +BackgroundTrans vTextjd, Run clumsy first!
    Gui, Show, W250 H100, binder
    return
}
Gui, Color, c282828, Verdana
Gui, Font, s8, Calisto MT
Gui, Add, Text, x65 y26 cWhite center +BackgroundTrans vTextjd, Select a Bind:
Gui, Add, DropDownList, x65 y40 vButtonChosse gChangeButton, MButton|LButton|RButton|XButton1|XButton2||ScrollLock|Delete|Insert|Home|End|PgUp|PgDn|Up|Down|Left|Right||Numpad0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|NumpadDot|NumLock|NumpadDiv|NumpadMult|NumpadAdd|NumpadSub|NumpadEnter|RAlt|LAlt|LShift|RShift|Q|W|E|R|T|Y|U|I|O|P|A|S|D|F|G|H|J|K|L|Z|X|C|V|B|N|M|0|1|2|3|4|5|6|7|8|9|none
Gui, Show, W250 H100, binder
return
ChangeButton:
   {
      GuiControlGet, checkifnull,,ButtonChosse
      if checkifnull = none
      {
         if oldbutton = NULL
         {
            return
         }else  {
            HotKey, %oldbutton%, Off
            return
         }
         return
      }
      if oldbutton = NULL
      {
         GuiControlGet, var,,ButtonChosse
         HotKey, ~%var%, StartLag
         oldbutton = %var%
      }else  {
         HotKey, %oldbutton%, Off
         GuiControlGet, var,,ButtonChosse
         HotKey, ~%var%, StartLag
         oldbutton = %var%
      }
      return
   }
return
BestSettingsButton:
   {
      ControlGet, var,Checked,,Button4,clumsy 0.2
      loop
      {
         ControlGet, var,Checked,,Button4,clumsy 0.2
         if var = 0
         {
            ControlFocus, Button4, clumsy 0.2
            sleep 10
            ControlClick, Button4, clumsy 0.2
            ControlClick, Button4, clumsy 0.2
         }else  {
            Break
         }}
      sleep 50
      ControlSetText, Edit2, 3000, clumsy 0.2
      sleep 50
      ControlGet, var, Choice,,Edit1,clumsy 0.2
      if var != outbound
      {
         ControlSetText, Edit1, outbound, clumsy 0.2
      }
      msgbox, Skonczone szefunciu, milego zabijania :)
      return
   }
return
ExitApptray:
   {
      Exitapp
      return
   }
   RunWebsite:
   {
      Run, https://1hunna.club
      return
   }
   GuiClose:
   ExitApp
return
StartLag:
{
   ControlClick, Button2, clumsy 0.2
}              