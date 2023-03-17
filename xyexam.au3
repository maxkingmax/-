#NoTrayIcon
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Compile_Both=y
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#Region ;**** 由 AccAu3Wrapper_GUI 创建指令 ****
#AccAu3Wrapper_Outfile=xyexam.exe
#AccAu3Wrapper_UseX64=n
#AccAu3Wrapper_Res_Language=2052
#AccAu3Wrapper_Res_requestedExecutionLevel=None
#EndRegion ;**** 由 AccAu3Wrapper_GUI 创建指令 ****
#include <Misc.au3>


_Singleton ( "xyexam", 0 )


#Region ;**** 参数创建于 ACNWrapper_GUI ****
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****

;~ 	#include <EditConstants.au3>
;~ #include <GUIConstantsEx.au3>
;~ #include <WindowsConstants.au3>

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
;~ #include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
;~ #include <WindowsConstants.au3>

#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

#include<array.au3>

FileInstall("timer.exe",@ScriptDir&"\timer.exe")
FileInstall("xyexam.ini",@ScriptDir&"\xyexam.ini")


$inifile=@ScriptDir&"\kt\tm.ini"
Global $tk,$zhizhen,$labeltime,$Form2,$iii=0
$zhizhen=IniRead("xyexam.ini","tkh","xh","1")
$settimer=IniRead("xyexam.ini","time","sec","40")
If Not FileExists($inifile) Then 
MsgBox(0,"错误","未找到题库文件,请重新安装",5)
Exit
Else

$tk=IniReadSectionNames ($inifile)
;~ If Not @error Then _arraydisplay($tk)

For $i=1 To $tk[0]

$tk[$i]=IniReadSection($inifile,$tk[$i])
Next

;~ _arraydisplay($tk[1])

$tmparray=$tk[1]
$combotxt=""
For $i=1 To $tmparray[1][1]
	$combotxt&=$i&"|"
Next




#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("信息技术课堂测试", 448, 366, -1, -1)
$Label1 = GUICtrlCreateLabel("请选择试题组：", 24, 24, 120, 20)
;GUICtrlSetstate(-1,$GUI_HIDE )
$Combo1 = GUICtrlCreateCombo("", 152, 24, 145, 25)

GUICtrlSetData(-1, $combotxt,$zhizhen)
;GUICtrlSetstate(-1,$GUI_HIDE )
$Button1 = GUICtrlCreateButton("开始测试", 328, 24, 99, 25)
$Group1 = GUICtrlCreateGroup("", 32, 64, 393, 289)
$Radio1 =""; GUICtrlCreateRadio("打字练习", 112, 88, 113, 17)
GUICtrlCreateLabel ("注意做题顺序 PS-Word-PPT-excel-python", 80, 88, 400, 17)
;~ GUICtrlSetState(-1, $GUI_CHECKED)
$Radio2 = GUICtrlCreateRadio("Python 操作", 112, 320, 250, 17)
;~ GUICtrlSetState(-1,$GUI_DISABLE)
$Radio3 =GUICtrlCreateRadio("Word 操作", 112, 164, 113, 17)
$Radio4 = GUICtrlCreateRadio("Excel 操作", 112, 242, 113, 17)

$Radio5 = GUICtrlCreateRadio("Photoshop 操作", 112, 125, 113, 17)
GUICtrlSetState(-1,$GUI_CHECKED )
$Radio6 = GUICtrlCreateRadio("Flash 操作", 112, 281, 113, 17)
GUICtrlSetState(-1,$GUI_HIDE )
$Radio7 =GUICtrlCreateRadio("PowerPoint 操作", 112, 203, 225, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
DirRemove("c:\EXAM",1)
If GUICtrlRead($Combo1)<>"" Then dirCopy(@ScriptDir&"\kt\"&GUICtrlRead($Combo1),"c:\EXAM",1)
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			DirRemove("c:\EXAM",1)
			Exit
		Case	$Button1
			$zhizhen=GUICtrlRead($Combo1)
 			If Not ProcessExists("timer.exe") Then Run(@ScriptDir&"\timer.exe"&" "&$settimer)
;~ 			MsgBox(0,"",@ScriptDir&"\timer.exe"&" "&$settimer)
			If GUICtrlRead($Combo1)="" Then 
				MsgBox(0,"错误","必须要先选择题组号！")
				ControlCommand($Form1,"",$Combo1,"ShowDropDown", "")
				ContinueCase
			EndIf
			IniWrite("xyexam.ini","tkh","xh",$zhizhen)
;~ 			If FileExists("c:\EXAM\"&$zhizhen) Then DirRemove("c:\EXAM",1)
;~ 			If Not FileExists("c:\EXAM\"&$zhizhen) Then dirCopy(@ScriptDir&"\kt\"&$zhizhen,"c:\EXAM",1)
			Select
				Case GUICtrlRead($Radio1)=$GUI_CHECKED
					$iii=0
					input("打字练习",2)
					
				Case GUICtrlRead($Radio2)=$GUI_CHECKED
					other("Python操作",3)
								
				Case GUICtrlRead($Radio3)=$GUI_CHECKED
			other("Word操作",4)
						

				Case GUICtrlRead($Radio4)=$GUI_CHECKED
			other("Excel操作",5)
						

				Case GUICtrlRead($Radio5)=$GUI_CHECKED
			other("Photoshop操作",6)
						
	Case GUICtrlRead($Radio6)=$GUI_CHECKED
			other("Flash操作",7)
	Case GUICtrlRead($Radio7)=$GUI_CHECKED
			other("PowerPoint操作",8)	
			EndSelect
		Case $Combo1
			
;~ 			MsgBox(0,$helpzz,$helpzz)
;~ 						$zhizhen=GUICtrlRead($Combo1)
;~ 			If FileExists("c:\EXAM\"&$zhizhen) Then DirRemove("c:\EXAM",1)
			DirRemove("c:\EXAM",1)
			dirCopy(@ScriptDir&"\kt\"&GUICtrlRead($Combo1),"c:\EXAM",1)

			Case $Radio1
				$iii=0
			

	EndSwitch
WEnd







EndIf



Func input($title,$aaa)

GUISetState(@SW_hide,$Form1)
#Region ### START Koda GUI section ### Form=
$Form2 = GUICreate($title, 953, 422, -1, -1, $WS_SYSMENU, BitOR($WS_EX_TOOLWINDOW,$WS_EX_WINDOWEDGE))
$Edit1 = GUICtrlCreateEdit("", 22, 16, 905, 153,BitOR($ES_READONLY,$WS_VSCROLL,$WS_BORDER), 0)
GUICtrlSetFont(-1, 18, 400, 0, "宋体")
;~ GUICtrlSetColor(-1, 0x110011)
GUICtrlSetState(-1, $GUI_DISABLE)
			$tmparray=$tk[$aaa]
GUICtrlSetData(-1,$tmparray[$zhizhen][1])


$labeltime=GUICtrlCreateLabel("5:00",445,170,100,30)
GUICtrlSetFont(-1,16,400,0,"MS SHELL DLG 2")



$Edit2 = GUICtrlCreateEdit("", 22, 199, 905, 153,BitOR($WS_VSCROLL,$WS_BORDER),0)
GUICtrlSetFont(-1, 18, 400, 0, "宋体")
GUICtrlSetColor(-1, 0x000000)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


AdlibRegister ("time",1000)
While 1
	$nMsg2 = GUIGetMsg()
	Switch $nMsg2
		Case $GUI_EVENT_CLOSE
;~ 			GUIDelete($Form2)
			GUISetState(@SW_HIDE,$Form2)
			GUISetState(@SW_show,$Form1)
;~ 			WinActive($form1)
			
ExitLoop
	EndSwitch
	If $iii=300 Then
AdlibUnRegister("time")		
			GUISetState(@SW_HIDE,$Form2)
			GUISetState(@SW_show,$Form1)
			$iii=0
			ExitLoop
			
EndIf
WEnd

	endfunc
	
	Func other( $title,$aaa)
GUISetState(@SW_hide,$Form1)

			$tmparray=$tk[$aaa]
Local $tmt
$tm=StringSplit($tmparray[$zhizhen][1],"#")
;~ _arraydisplay($tm)

	#Region ### START Koda GUI section ### Form=
$Form3 = GUICreate($title, 340, 460, @DesktopWidth-340-20, @DesktopHeight-455-60, BitOR($WS_THICKFRAME,$WS_SYSMENU))
$Edit1 = GUICtrlCreateEdit("", 8, 8, 330, 395, BitOR($ES_READONLY,$WS_VSCROLL), 0)
GUICtrlSetState(-1,$GUI_FOCUS)





GUICtrlSetData(-1,_arraytostring($tm,@crlf,1,$tm[0]));$tmparray[$zhizhen][1])
;~ GUICtrlSetData(-1, "我有一只小毛驴，我从来也不骑")
GUICtrlSetFont(-1, 14, 400, 0, "宋体")
$Buttonhelp = GUICtrlCreateButton("视频演示", 8, 400, 322, 25)
GUICtrlSetResizing(-1, $GUI_DOCKAUTO+$GUI_DOCKLEFT+$GUI_DOCKRIGHT+$GUI_DOCKBOTTOM+$GUI_DOCKHCENTER+$GUI_DOCKVCENTER+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###



Select
	Case $title='Python操作'
;Run('explorer.exe /n,/root,'&"C:\EXAM\"&$title,"",@SW_MAXIMIZE)


$openfile=FileFindFirstFile ( "C:\EXAM\"&$title&'\*.py' )

$b=RegEnumkey("HKEY_CLASSES_ROOT\Python.File\shell\editwithidle\shell",1)
$f=RegRead("HKEY_CLASSES_ROOT\Python.File\shell\editwithidle\shell\"&$b&"\command","")
ConsoleWrite($f&@CRLF)


$file=FileGetLongName("C:\EXAM\"&$title&"\"&FileFindNextFile($openfile))
ConsoleWrite($file&@crlf)
$ff=StringReplace ($f,'"%L"','"'&$file&'"')
$ff=StringReplace($ff,"%*","")
ConsoleWrite($ff)
Run($ff)

;~ ShellExecute("C:\EXAM\"&$title&"\"&FileFindNextFile($openfile))
FileClose($openfile)









Case $title='Word操作'
$openfile=FileFindFirstFile ( "C:\EXAM\"&$title&'\*.doc' )


ShellExecute("C:\EXAM\"&$title&"\"&FileFindNextFile($openfile))
FileClose($openfile)
Case $title='Excel操作'
$openfile=FileFindFirstFile ( "C:\EXAM\"&$title&'\*.xls' )


ShellExecute("C:\EXAM\"&$title&"\"&FileFindNextFile($openfile))
FileClose($openfile)
Case $title='Photoshop操作'
	
;~ 	$openfile=FileFindFirstFile ( "C:\EXAM\"&$title&'\*.doc' )

;~ If FileExists("C:\EXAM\"&$title&"\服务器Root\index.htm") Then ShellExecute("C:\EXAM\"&$title&"\服务器Root\index.htm")
;~ If FileExists("C:\EXAM\"&$title&"\服务器Root\index.html") Then ShellExecute("C:\EXAM\"&$title&"\服务器Root\index.html")

;~ FileClose($openfile)
	$openfile=FileFindFirstFile ( "C:\EXAM\"&$title&'\*.psd' )


ShellExecute("C:\EXAM\"&$title&"\"&FileFindNextFile($openfile))
FileClose($openfile)

Case $title='Flash操作'
$openfile=FileFindFirstFile ( "C:\EXAM\"&$title&'\*.fla' )


ShellExecute("C:\EXAM\"&$title&"\"&FileFindNextFile($openfile))
FileClose($openfile)	
Case $title='PowerPoint操作'
$openfile=FileFindFirstFile ( "C:\EXAM\"&$title&'\*.ppt' )


ShellExecute("C:\EXAM\"&$title&"\"&FileFindNextFile($openfile))
FileClose($openfile)		

EndSelect



WinSetOnTop ($Form3,"",1)




While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $Buttonhelp
			playhelp($title,$zhizhen)
		Case $GUI_EVENT_CLOSE
			GUISetState(@SW_HIDE,$Form3)
			GUISetState(@SW_show,$Form1)
exitloop
	EndSwitch
WEnd
EndFunc


Func time()
$iii+=1

GUICtrlSetData($labeltime,Int((300-$iii)/60)&":"&Mod((300-$iii),60))
EndFunc

Func playhelp($title,$helpzz)
;~ 	MsgBox(0,' ',@scriptdir&"\help\"&$helpzz&'\'&$title&'.mp4')
	If FileExists(@scriptdir&"\help\"&$helpzz&'\'&$title&'.mp4') Then ShellExecute(@scriptdir&"\help\"&$helpzz&'\'&$title&'.mp4')
	
EndFunc
