#NoTrayIcon
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Compile_Both=y
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#Region ;**** 由 AccAu3Wrapper_GUI 创建指令 ****
#AccAu3Wrapper_Outfile=timer.exe
#AccAu3Wrapper_UseX64=n
#AccAu3Wrapper_Res_Language=2052
#AccAu3Wrapper_Res_requestedExecutionLevel=None
#EndRegion ;**** 由 AccAu3Wrapper_GUI 创建指令 ****
#include <Misc.au3>


_Singleton ( "timer", 0 )


If Not FileExists("xyexam.ini") Then 
	IniWrite("xyexam.ini","time","sec","10")
EndIf
If $CmdLine[0]=1 Then
$settime=$CmdLine[1] 
;~ MsgBox(0,$settime,$settime)
$time=$settime*60
Else
	
	Exit
EndIf

	AdlibRegister("_timer", 1000)
	While 1
		Sleep(100)
	WEnd
	
Func _timer()
    $time -= 1
    If Not ProcessExists("xyexam.exe") Then Exit
	Switch $time 
		Case 61 To $settime*60
			ToolTip  (Int($time/60)&":"&Mod ( $time, 60 ),@DesktopWidth/4*3,20,"倒计时",2,2+4)
		Case 0 To 60
			ToolTip  (Int($time/60)&":"&Mod ( $time, 60 ),@DesktopWidth/4*3,20,"倒计时",1,2+4)
		Case Else
			 AdlibUnRegister()
			 ToolTip("")
			If ProcessExists("xyexam.exe") Then ProcessClose("xyexam.exe") 
			SplashTextOn ("时间到！","考试结束",300,60, -1,-1 ,1,"微软雅黑",20,700)
			Sleep(3000)
			Exit
	EndSwitch
	
EndFunc   ;==>_timer