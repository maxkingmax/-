#include<array.au3>
#include <ColorConstants.au3>

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>


$num=IniReadSection("tm.ini","tkshu")
$ps=IniReadSection("tm.ini","ps")
$word=IniReadSection("tm.ini","word")
$ppt=IniReadSection("tm.ini","ppt")
$excel=IniReadSection("tm.ini","excel")
$python=IniReadSection("tm.ini","python")
;~ _ArrayDisplay($num)

;~  _ArrayDisplay($ps)
$a=""
For $i=1 To $num[1][1]
	$a&=$i&"|"
Next
;~ MsgBox(0,"",$a)
$zhizhen=""
$psf=""
$wordf=""
$pptf=""
$excelf=""
$pythonf=""
$edittrue=0
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1_1 = GUICreate("题库编辑器", 702, 581, 629, 219)
$numc = GUICtrlCreateCombo("", 88, 16, 105, 25)
GUICtrlSetData(-1, $a)
$Label1 = GUICtrlCreateLabel("题库号", 16, 16, 60, 17)
$Button1 = GUICtrlCreateButton("编辑", 224, 16, 65, 25)
GUICtrlSetState(-1,$GUI_Disable)
$Button2 = GUICtrlCreateButton("新增", 448, 16, 65, 25)
$Button3 = GUICtrlCreateButton("保存", 552, 16, 123, 25)
GUICtrlSetState(-1,$GUI_Disable)
$pst = GUICtrlCreateEdit("", 16, 56, 585, 89)
GUICtrlSetData(-1, "")
$wordt = GUICtrlCreateEdit("", 16, 159, 585, 89)
GUICtrlSetData(-1, "")
$pptt = GUICtrlCreateEdit("", 16, 261, 585, 89)
GUICtrlSetData(-1, "")
$excelt = GUICtrlCreateEdit("", 16, 364, 585, 89)
GUICtrlSetData(-1, "")
$pythont = GUICtrlCreateEdit("", 16, 467, 585, 89)
GUICtrlSetData(-1, "")
$psfb = GUICtrlCreateButton("PS文件", 616, 72, 75, 57,$BS_MULTILINE)
GUICtrlSetState(-1,$GUI_Disable)
$wordfb = GUICtrlCreateButton("WORD文件", 616, 168, 75, 57)
GUICtrlSetState(-1,$GUI_Disable)
$pptfb = GUICtrlCreateButton("PPT文件", 615, 270, 75, 57)
GUICtrlSetState(-1,$GUI_Disable)
$excelfb = GUICtrlCreateButton("EXCEL文件", 616, 376, 75, 57)
GUICtrlSetState(-1,$GUI_Disable)
$pythonfb = GUICtrlCreateButton("Python文件", 617, 483, 75, 57)
GUICtrlSetState(-1,$GUI_Disable)

GUICtrlSetState($pst,$GUI_Disable)
GUICtrlSetState($wordt,$GUI_Disable)
GUICtrlSetState($pptt,$GUI_Disable)
GUICtrlSetState($excelt,$GUI_Disable)
GUICtrlSetState($pythont,$GUI_Disable)





GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $numc
			$zhizhen=GUICtrlRead($numc)
			dispdata()
			GUICtrlSetState($button1,$GUI_Enable)
		Case	$button1
			editdata()
			$edittrue=1
		Case $Button2
			$a=""
			For $i=1 To $num[1][1]+1
			$a&=$i&"|"
			Next
;~ 			MsgBox(0,$i,$a)
			GUICtrlSetData($numc,"")
			GUICtrlSetData($numc,$a,$i-1)
			adddata()
		Case $Button3
			savedata()
		Case $psfb
			$psf=FileSelectFolder("指定题目所在文件夹","",0,"",$Form1_1)
			If Not $psf="" Then	GUICtrlSetColor($psfb,$COLOR_RED)			
			If $psf="" Then				GUICtrlSetColor($psfb,$COLOR_Black)	

		Case $wordfb
			$wordf=FileSelectFolder("指定题目所在文件夹","",0,"",$Form1_1)
			If Not $wordf="" Then				GUICtrlSetColor($wordfb,$COLOR_RED)
			If $wordf="" Then				GUICtrlSetColor($wordfb,$COLOR_Black)	

		Case $excelfb
			$excelf=FileSelectFolder("指定题目所在文件夹","",0,"",$Form1_1)
			If Not $excelf="" Then				GUICtrlSetColor($excelfb,$COLOR_RED)
			If $excelf="" Then				GUICtrlSetColor($excelfb,$COLOR_Black)	

		Case $pptfb
			$pptf=FileSelectFolder("指定题目所在文件夹","",0,"",$Form1_1)
			If Not $pptf="" Then				GUICtrlSetColor($pptfb,$COLOR_RED)
			If $pptf="" Then				GUICtrlSetColor($pptfb,$COLOR_Black)	

		Case $pythonfb
			$pythonf=FileSelectFolder("指定题目所在文件夹","",0,"",$Form1_1)
			If Not $pythonf="" Then				GUICtrlSetColor($pythonfb,$COLOR_RED)
			If $pythonf="" Then				GUICtrlSetColor($pythonfb,$COLOR_Black)	

		
		
		
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd


_ArrayDisplay($ps)
;~ _ArrayDisplay($word)
;~ _ArrayDisplay($ppt)
;~ _ArrayDisplay($excel)
;~ _ArrayDisplay($python)


Func dispdata()
	
GUICtrlSetData($pst,StringReplace($ps[$zhizhen][1],"#",@CRLF))
GUICtrlSetData($wordt,StringReplace($word[$zhizhen][1],"#",@CRLF))
GUICtrlSetData($pptt,StringReplace($ppt[$zhizhen][1],"#",@CRLF))
GUICtrlSetData($excelt,StringReplace($excel[$zhizhen][1],"#",@CRLF))
GUICtrlSetData($pythont,StringReplace($python[$zhizhen][1],"#",@CRLF))


EndFunc

Func adddata()

GUICtrlSetState($pst,$GUI_Enable)
GUICtrlSetState($wordt,$GUI_Enable)
GUICtrlSetState($pptt,$GUI_Enable)
GUICtrlSetState($excelt,$GUI_Enable)
GUICtrlSetState($pythont,$GUI_Enable)
GUICtrlSetState($psfb,$GUI_Enable)
GUICtrlSetState($wordfb,$GUI_Enable)
GUICtrlSetState($pptfb,$GUI_Enable)
GUICtrlSetState($excelfb,$GUI_Enable)
GUICtrlSetState($pythonfb,$GUI_Enable)
GUICtrlSetState($button3,$GUI_Enable)

GUICtrlSetData($pst,""   )
GUICtrlSetData($wordt,"")
GUICtrlSetData($pptt,"")
GUICtrlSetData($excelt,"")
GUICtrlSetData($pythont,"")

GUICtrlSetState($button2,$GUI_Disable)
EndFunc


Func editdata()
	
GUICtrlSetState($pst,$GUI_Enable)
GUICtrlSetState($wordt,$GUI_Enable)
GUICtrlSetState($pptt,$GUI_Enable)
GUICtrlSetState($excelt,$GUI_Enable)
GUICtrlSetState($pythont,$GUI_Enable)
;GUICtrlSetState($psfb,$GUI_Enable)
;~ GUICtrlSetState($wordfb,$GUI_Enable)
;~ GUICtrlSetState($pptfb,$GUI_Enable)
;~ GUICtrlSetState($excelfb,$GUI_Enable)
;~ GUICtrlSetState($pythonfb,$GUI_Enable)
GUICtrlSetState($button3,$GUI_Enable)

EndFunc






Func savedata()
	$zhizhen=GUICtrlRead($numc)
	FileCopy("tm.ini",@scriptdir&"\tm"&@MDAY&@HOUR&@SEC&".ini.bak")		
	If $edittrue=0 Then
		If $psf="" Or $wordf="" Or $pptf="" Or $excelf="" Or $pythonf="" Or GUICtrlRead($pst)="" or GUICtrlRead($wordt)=""  Or GUICtrlRead($pptt)=""  Or GUICtrlRead($excelt)=""  Or GUICtrlRead($pythont)="" Then 
		MsgBox(0,"错误","有未指定的内容！",0,$Form1_1)
		Else
			If $zhizhen > $num[1][1] Then
				$num[1][1]+=1
				
				IniWrite("tm.ini","tkshu","sum",$num[1][1])
			EndIf
		EndIf
		
	EndIf	
	
	If $zhizhen>$ps[0][0] Then	
	_ArrayAdd($ps,"tm"&$zhizhen&"|"&"本地工作目录：C:\EXAM\PhotoShop操作。##"&StringReplace(GUICtrlRead($pst),@crlf,"#"))
	
;~ 	DirCreate($zhizhen&"\PhotoShop操作")
	$ps[0][0]+=1
	_arraydisplay($ps)
	FileCopy($psf&"\*.*",@ScriptDir&"\"&$zhizhen&"\PhotoShop操作\",8)
	ElseIf $zhizhen<=$ps[0][0] Then
	$ps[$zhizhen][1]=StringReplace(GUICtrlRead($pst),@crlf,"#")
	_arraydisplay($ps)
	EndIf
	IniWriteSection("tm.ini","ps",$ps)
	
	
	If $zhizhen>$word[0][0] Then	
	_ArrayAdd($word,"tm"&$zhizhen&"|"&"本地工作目录：C:\EXAM\Word操作。##"&StringReplace(GUICtrlRead($wordt),@crlf,"#"))
;~ 	_arraydisplay($word)
;~ 	DirCreate($zhizhen&"\PhotoShop操作")
	$word[0][0]+=1
	FileCopy($wordf&"\*.*",@ScriptDir&"\"&$zhizhen&"\Word操作\",8)
	ElseIf	$zhizhen<=$word[0][0] Then
	$word[$zhizhen][1]=StringReplace(GUICtrlRead($wordt),@crlf,"#")
	EndIf
	
	IniWriteSection("tm.ini","word",$word)
	
	
	
	If $zhizhen>$ppt[0][0] Then
	_ArrayAdd($ppt,"tm"&$zhizhen&"|"&"本地工作目录：C:\EXAM\Powerpoint操作。##"&StringReplace(GUICtrlRead($pptt),@crlf,"#"))
;~ 	_arraydisplay($ppt)
	$ppt[0][0]+=1
	FileCopy($pptf&"\*.*",@ScriptDir&"\"&$zhizhen&"\Powerpoint操作\",8)
	ElseIf $zhizhen<=$ppt[0][0] Then
	$ppt[$zhizhen][1]=StringReplace(GUICtrlRead($pptt),@crlf,"#")
	EndIf
;~ 	DirCreate($zhizhen&"\PhotoShop操作")
	
	IniWriteSection("tm.ini","ppt",$ppt)

	
	
	If $zhizhen>$excel[0][0] Then
	_ArrayAdd($excel,"tm"&$zhizhen&"|"&"本地工作目录：C:\EXAM\Excel操作。##"&StringReplace(GUICtrlRead($excelt),@crlf,"#"))
;~ 	_arraydisplay($excel)
$excel[0][0]+=1
FileCopy($excelf&"\*.*",@ScriptDir&"\"&$zhizhen&"\Excel操作\",8)
	ElseIf $zhizhen<=$excel[0][0] Then
	$excel[$zhizhen][1]=StringReplace(GUICtrlRead($excelt),@crlf,"#")
	EndIf
;~ 	DirCreate($zhizhen&"\PhotoShop操作")
	
	IniWriteSection("tm.ini","excel",$excel)
	
	
	
	
	If $zhizhen>$python[0][0] Then
	_ArrayAdd($python,"tm"&$zhizhen&"|"&"本地工作目录：C:\EXAM\Python操作。##"&StringReplace(GUICtrlRead($pythont),@crlf,"#"))
;~ 	_arraydisplay($python)
$python[0][0]+=1
FileCopy($pythonf&"\*.*",@ScriptDir&"\"&$zhizhen&"\Python操作\",8)
	ElseIf $zhizhen<= $python[0][0] Then
	$python[$zhizhen][1]=StringReplace(GUICtrlRead($pythont),@crlf,"#")
	EndIf
	
;~ 	DirCreate($zhizhen&"\PhotoShop操作")
	
	IniWriteSection("tm.ini","python",$python)
	
	
	
	
	MsgBox(0,"保存成功","保存题库成功",0,$Form1_1)
	GUICtrlSetState($button3,$GUI_Disable)
	
	
	
	endfunc
	
