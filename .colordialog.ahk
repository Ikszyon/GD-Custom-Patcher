/*




		FULL CREDIT FOR THIS GOES TO APPENZELLER ON THE AHK FORUMS - https://www.autohotkey.com/board/topic/88704-gui-colour-dialogue-without-dlls/page-2




*/









; Color Dialog for Autohotkey scripts without any dll calls
;                     Concocted by Appenzeller - for free use
; Consists of main subroutine (ColDialog), several subroutines, 
; three functions and one hotkey (Left Mouse Button). 
; All global names (variables, labels) start
;  with "ColDlg_" to avoid conflicts
;                 Mode d'emploi:
; 1. Define in your code two arrays initialized by any integer values
ColDlg_HSV := [0,0,0]
ColDlg_RGB := [0,0,0]
; 2. Provide in your code proper input values -
;    ColDlg_hRGB indicates type of input data: 
;      "r" means that ColDlg_RGB table contains RGB data - 3 x integers (0...255)
;      "h" means that ColDlg_HSV table contains HSV data - integers (0...359),
;       (0...100), (0...100)
;      any other value is interpreted as a hexadecimal RGB string (6 hex digits)
; Examples:
ColDlg_hRGB := ColorVar
; 3. Optionally provide own text for OK, Cancel and Copy buttons and a Title
;     if omitted (empty), the values provided below will be used
;ColDlg_Title := "Wyb�r koloru"
;ColDlg_OK := "OK"
;ColDlg_Can := "Anuluj"
;ColDlg_Copy := "Kopiuj"
; 4. Call Color dialog
Gosub ColDialog
return

; To change colors, you could:
; 1. Click anywhere on the hue strip or color table to change color
; 2. Drag and drop one of two black pickers (on Hue strip or on Saturation- 
;    Value vel Brightness square
; 3. Rotate mouse wheel or press up/down arrow to change Hue
; 4. Change any of H, S, V, R, G, B values with Up/Down control on the right
; You could copy hex RGB value to the clipboard
; The subroutine returns ColDlg_hRGB empty if cancelled, or
; on pressing OK returns hex value (6 hex digits) in ColDlg_hRGB 
;  and corresponding tables:
;  ColDlg_RGB[1...3] with RGB values and ColDlg_HSV[1...3] with HSV values

;--------------------------------------------------------------------------
ColDialog:
; analyze input data
	ColDlg_Title := EditVar
	ColDlg_OK := "Ok"
	ColDlg_Can := "Cancel"

If (ColDlg_hRGB != "h") and (ColDlg_hRGB != "r")
{
	ColDlg_ext := "0x" . SubStr(ColDlg_hRGB,1,2)
	ColDlg_RGB[1] := Round(ColDlg_ext)
	ColDlg_ext := "0x" . SubStr(ColDlg_hRGB,3,2)
	ColDlg_RGB[2] := Round(ColDlg_ext)
	ColDlg_ext := "0x" . SubStr(ColDlg_hRGB,5,2)
	ColDlg_RGB[3] := Round(ColDlg_ext)
	ColDlg_hRGB := "r"
}
If (ColDlg_hRGB = "r")
{
	ColDlg_HSV := ColDlg_RGBtoHSV(ColDlg_RGB[1],ColDlg_RGB[2],ColDlg_RGB[3])
}
ColDlg_Hue := ColDlg_HSV[1]
ColDlg_Sat := ColDlg_HSV[2]
ColDlg_Val := ColDlg_HSV[3]
	
; display window with inpu values
Gui, ColDlg:New

Gui, ColDlg:Add, Slider, BackgroundTrans vColDlg_Hue hwndColDlg_Main Thick6 gColDlg_Hues Vertical x200 y14 h154 Left Noticks -Theme hidden  invert Range0-359   AltSubmit, %ColDlg_Hue%
Gui, ColDlg:Add, Button, y168 x29 h25 w70 Default gColDlg_OK -wrap, %ColDlg_OK%
Gui, ColDlg:Add, Button, y168 x106 h25 w70 gColDlg_Cancel -wrap, %ColDlg_Can%
Gui, ColDlg:Show, Hide w280 h200, %ColDlg_Title%
Gui, ColDlg:Submit, Nohide

; auxiliary position variables
ColDlg_Xa := 158	; left of last upper square
ColDlg_X := Round(1.44*ColDlg_Sat + 26)
ColDlg_Y := Round(1.44*(100-ColDlg_Val) + 14)
ColDlg_H := Round(158 - ColDlg_Hue*2/5)   
ColDlg_Yh := 18	; top of hue colors	

; display hue stripe
SetFormat, Integer, hex
Loop, 18
{
	ColDlg_co := ColDlg_RGBcom(ColDlg_HStoRGB((18-a_index)*21, 100),100)
	Gui, ColDlg:Add, Progress, w20 h10 x180 y%ColDlg_Yh% +Background%ColDlg_co% 
	ColDlg_Yh += 8
}
SetFormat, Integer, d

; display Saturation-Value(Brightness) square
Loop, 9
{
	ColDlg_ext = %a_index%
	ColDlg_sa := (9-a_index)*12.5
	ColDlg_RGB := ColDlg_HStoRGB(ColDlg_Hue, ColDlg_sa)   ; tablica
	Loop, 9
	{
		SetFormat, Integer, hex
		ColDlg_co := ColDlg_RGBcom(ColDlg_RGB,12.5*(9 - a_index))
		SetFormat, Integer, d
		ColDlg_Yh := 18 + 16 * (a_index - 1)
		Gui, ColDlg:Add, Progress, w17 h17 x%ColDlg_Xa% y%ColDlg_Yh% +Background%ColDlg_co% vColDlg_K%ColDlg_ext%%a_index%
	}
	ColDlg_Xa -= 16
}

; display values as a text
Gui, ColDlg:Add, Text, x210 w15 y84 , H:
Gui, ColDlg:Add, Text, y+0 w15 , S:
Gui, ColDlg:Add, Text, y+0 w15 , V:
Gui, ColDlg:Add, Text, y+5 w15 , R:
Gui, ColDlg:Add, Text, y+0 w15 , G: 
Gui, ColDlg:Add, Text, y+0 w15 , B:
Gui, ColDlg:Add, Text, Right x220 w36 y84 vColDlg_Htekst, %ColDlg_Hue%
Gui, ColDlg:Add, UpDown, Wrap  vColDlg_UpH gColDlg_UpHlab Range0-359, %ColDlg_Hue%
Gui, ColDlg:Add, Text, Right y+0 w36 vColDlg_Stekst, %ColDlg_Sat%
Gui, ColDlg:Add, UpDown, Wrap vColDlg_UpS gColDlg_UpSlab Range0-100, %ColDlg_Sat%
Gui, ColDlg:Add, Text, Right y+0 w36 vColDlg_Vtekst, %ColDlg_Val%
Gui, ColDlg:Add, UpDown, Wrap vColDlg_UpV gColDlg_UpVlab Range0-100, %ColDlg_Val%
Gui, ColDlg:Add, Text, Right y+5 w36 vColDlg_Rtekst, 0
Gui, ColDlg:Add, UpDown, Wrap vColDlg_UpR gColDlg_UpRlab Range0-255, 0
Gui, ColDlg:Add, Text, Right y+0 w36 vColDlg_Gtekst, 0
Gui, ColDlg:Add, UpDown, Wrap vColDlg_UpG gColDlg_UpGlab Range0-255, 0
Gui, ColDlg:Add, Text, Right y+0 w36 vColDlg_Btekst, 0
Gui, ColDlg:Add, UpDown, Wrap vColDlg_UpB gColDlg_UpBlab Range0-255, 0
Gui, ColDlg:Font, s10 
Gui, ColDlg:Add, Text, Center  xp-12 y+2 w50 vColDlg_RGBtekst c000000, 000000

; display pickers and old and new colors
Gui, ColDlg:Add, Progress, w8 h8 x%ColDlg_X% y%ColDlg_y% +BackgroundBlack vColDlg_Punkt hwndColDlg_idPunkt
Gui, ColDlg:Add, Progress, w50 h21 x210 y18 +Backgroundred vColDlg_Cold

Gui, ColDlg:Add, Progress, w50 h40 x210 y38 +Backgroundred vColDlg_Ccol
Gui, ColDlg:Add, Progress, w8 h8 x186 y%ColDlg_H% +Backgroundblack vColDlg_Punkh hwndColDlg_idPunkh
Gosub ColDlg_FillCurrent
GuiControl, ColDlg:+Background%ColDlg_co%, ColDlg_Cold
Gui, ColDlg:-0x20000 -0x10000
Gui, ColDlg:Show

; additional auxiliary variables
ControlFocus,,ahk_id %ColDlg_idPunkt%
GuiControlGet,ColDlg_clPunkt,Focus
ControlFocus,,ahk_id %ColDlg_idPunkh%
GuiControlGet,ColDlg_huPunkt,Focus
ControlFocus,,ahk_id %ColDlg_Main%
return
; end of the main subroutine
;----------------------------------------------------------------
ColDlg_FillCurrent:
	ColDlg_RGB := ColDlg_HStoRGB(ColDlg_Hue, ColDlg_Sat)
	SetFormat, Integer, hex
	ColDlg_co := ColDlg_RGBcom(ColDlg_RGB,ColDlg_Val)
	GuiControl, ColDlg:+Background%ColDlg_co%, ColDlg_Ccol
	SetFormat, Integer, d
	ColDlg_hRGB := Substr("000000" . SubStr(ColDlg_co, 3) , -5)
	GuiControl, ColDlg:,ColDlg_Rtekst, % Round(ColDlg_RGB[1]*ColDlg_Val)
	GuiControl,ColDlg: ,ColDlg_Gtekst, % Round(ColDlg_RGB[2]*ColDlg_Val)
	GuiControl,ColDlg: ,ColDlg_Btekst, % Round(ColDlg_RGB[3]*ColDlg_Val)
	GuiControl,ColDlg: ,ColDlg_RGBtekst, %ColDlg_hRGB%
	GuiControl,ColDlg: ,ColDlg_Htekst, %ColDlg_Hue%
	GuiControl,ColDlg: ,ColDlg_Stekst, %ColDlg_Sat%
	GuiControl,ColDlg: ,ColDlg_Vtekst, %ColDlg_Val%
return

ColDlg_UpVlab:
	ColDlg_Val = %ColDlg_UpV%
	Goto ColDlg_Wsz

ColDlg_UpSlab:
	ColDlg_Sat = %ColDlg_UpS%

ColDlg_Wsz:
	Gosub ColDlg_Punktmove
	Gosub ColDlg_FillCurrent
Return	

ColDlg_Punktmove:
	ColDlg_X := Round(1.44*ColDlg_Sat + 26)
	ColDlg_Y := Round(1.44*(100-ColDlg_Val) + 14)
	GuiControl, ColDlg:Move, ColDlg_Punkt, x%ColDlg_X% Y%ColDlg_Y% 
return

ColDlg_UpHlab:
	ColDlg_Hue = %ColDlg_UpH%
	GuiControl,ColDlg:,ColDlg_Hue,%ColDlg_UpH%
	Gosub ColDlg_Hues
return

ColDlg_UpRlab:	
ColDlg_UpGlab:
ColDlg_UpBlab:
	Gui, ColDlg:Submit, NoHide
	SetFormat, Integer, hex
	ColDlg_com := 65536*ColDlg_UpR + 256*ColDlg_UpG + ColDlg_UpB
	SetFormat, Integer, d
	GuiControl, ColDlg:+Background%ColDlg_com%, ColDlg_Ccol
	ColDlg_HSV := ColDlg_RGBtoHSV(ColDlg_UpR,ColDlg_UpG,ColDlg_UpB)
	ColDlg_changed =
	if (ColDlg_HSV[1] <> ColDlg_Hue) {
		ColDlg_Hue := ColDlg_HSV[1]
		GuiControl,ColDlg:,ColDlg_Hue,%ColDlg_Hue%
		ColDlg_H := Round(158 - ColDlg_Hue*2/5)
		GuiControl, ColDlg:Move, ColDlg_Punkh, x186 Y%ColDlg_H%
		Gosub ColDlg_Huonly
		ColDlg_changed++
	}
	if (ColDlg_HSV[2] <> ColDlg_Sat) or (ColDlg_HSV[3] <> ColDlg_Val) {
		ColDlg_Sat := ColDlg_HSV[2], ColDlg_Val := ColDlg_HSV[3]
		Gosub ColDlg_Punktmove
		ColDlg_changed++
	}
	If ColDlg_changed
	{
		GuiControl,ColDlg: ,ColDlg_Htekst, %ColDlg_Hue%
		GuiControl,ColDlg: ,ColDlg_Stekst, %ColDlg_Sat%
		GuiControl,ColDlg: ,ColDlg_Vtekst, %ColDlg_Val%
	}
	GuiControl,ColDlg: ,ColDlg_RGBtekst, % Substr("000000" . SubStr(ColDlg_com, 3) , -5)
return

ColDlg_Copy:
	Clipboard := ColDlg_hRGB
	ControlFocus,,ahk_id %ColDlg_Main%
return

ColDlg_OK:
	ColDlg_HSV[1] := ColDlg_Hue
	ColDlg_HSV[2] := ColDlg_Sat
	ColDlg_HSV[3] := ColDlg_Val
	Gui, ColDlg:Submit, Nohide
	ColDlg_RGB[1] := ColDlg_UpR
	ColDlg_RGB[2] := ColDlg_UpG
	ColDlg_RGB[3] := ColDlg_UpB
    Gui, ColDlg:Destroy
    GuiControl,1: +c%ColDlg_hRGB%, %DisplayVar%
    GuiControl,1:, %EditVar%, % ColDlg_hRGB
return

ColDlgGuiClose:
ColDlg_Cancel:
	ColDlg_hRGB =
	Gui, ColDlg:Destroy
return

ColDlg_Hues:	
	GuiControl, ColDlg:Disable, ColDlg_Hue
	ColDlg_H := Round(158 - ColDlg_Hue*2/5)
	GuiControl, ColDlg:Move, ColDlg_Punkh, x186 Y%ColDlg_H%
	Gosub ColDlg_FillCurrent
ColDlg_Huonly:
Loop, 8
{
	ColDlg_sa := (9-a_index)*12.5
	ColDlg_ext = %a_index%
	ColDlg_RGB := ColDlg_HStoRGB(ColDlg_Hue, ColDlg_sa)   ; tablica
	Loop, 8
	{
		SetFormat, Integer, hex
		ColDlg_co := ColDlg_RGBcom(ColDlg_RGB,12.5*(9 - a_index))
		SetFormat, Integer, d
		ColDlg_obj = ColDlg_K%ColDlg_ext%%a_index%
		GuiControl, ColDlg:+Background%ColDlg_co%, %ColDlg_obj%
	}
}
GuiControl, ColDlg:+Backgroundblack, ColDlg_Punkt
GuiControl, ColDlg:Enable, ColDlg_Hue
ControlFocus,,ahk_id %ColDlg_Main%
return

~LButton::
CoordMode,Mouse, Client  ; only for this thread
MouseGetPos,ColDlg_X1,ColDlg_Y1,,ColDlg_id
If (ColDlg_id != ColDlg_clPunkt) and (ColDlg_id != ColDlg_huPunkt)
{
	If (ColDlg_X1 > 29) and (ColDlg_X1 < 175) and (ColDlg_Y1 > 17) and (ColDlg_Y1 < 163)
	{
		ColDlg_Sat := Round((ColDlg_X1-30)/1.44)
		ColDlg_Val := Round(100 - (ColDlg_Y1-18)/1.44)
		Gosub ColDlg_Wsz
	}
	else if (ColDlg_X1 > 179) and (ColDlg_X1 < 201) and (ColDlg_Y1 > 17) and (ColDlg_Y1 < 163)
	{
		ColDlg_Hue := Round(5*(162 - ColDlg_Y1)/2)
;		Msgbox %Hue%
		GuiControl,ColDlg:,ColDlg_Hue,%ColDlg_Hue%
		Gosub ColDlg_Hues
		
	}	
	return
}
If (ColDlg_id = ColDlg_clPunkt) 
{	
; Left button pressed over the color square
GuiControlGet, ColDlg_oo, ColDlg:Pos, ColDlg_Punkt
ColDlg_x00 := ColDlg_ooX
ColDlg_Y00 := ColDlg_ooY
; Dragging
Loop
{
	GetKeyState,ColDlg_Button,LButton,P
    If ColDlg_Button = U
        break
    MouseGetPos,ColDlg_X2,ColDlg_Y2 ; Get the current mouse position.
    ColDlg_X2 -= ColDlg_X1, ColDlg_Y2 -= ColDlg_Y1  ; Mouse offset 
    ColDlg_PX2 := (ColDlg_ooX + ColDlg_X2), ColDlg_PY2 := (ColDlg_ooY + ColDlg_Y2) ; New picker position.
	If (ColDlg_PX2 < 26) or (ColDlg_PX2 > 170) or (ColDlg_PY2 < 14) or (ColDlg_PY2 > 158)
		continue
	If Abs(ColDlg_PX2-ColDlg_X00)>=0.2 or Abs(ColDlg_PY2-ColDlg_Y00) >= 0.2	
	{
		GuiControl, ColDlg:Move, ColDlg_Punkt, x%ColDlg_PX2% y%ColDlg_PY2%
		ColDlg_X00 := ColDlg_PX2, ColDlg_Y00 := ColDlg_PY2
		ColDlg_Sat := Round((ColDlg_PX2-26)/1.44)
		ColDlg_Val := Round(100 - (ColDlg_PY2-14)/1.44)
		Gosub ColDlg_FillCurrent
	}
}
}
else     ; Mouse over hue stripe
{
GuiControlGet, ColDlg_oo, ColDlg:Pos, ColDlg_Punkh
ColDlg_Y00 := ColDlg_ooY
Loop
{
    GetKeyState,ColDlg_Button,LButton,P
    If ColDlg_Button = U
        break
    MouseGetPos,ColDlg_X2,ColDlg_Y2
    ColDlg_Y2 -= ColDlg_Y1 
    ColDlg_PY2 := (ColDlg_ooY + ColDlg_Y2) 
	If (ColDlg_PY2 < 14) or (ColDlg_PY2 > 158)
		continue
	If Abs(ColDlg_PY2-ColDlg_Y00) >= 0.2
	{
		GuiControl, ColDlg:Move, ColDlg_Punkh, x186 y%ColDlg_PY2%
		ColDlg_Y00 := ColDlg_PY2
		ColDlg_Hue := Round(5*(158 - ColDlg_PY2)/2)
		GuiControl,ColDlg:,ColDlg_Hue,%ColDlg_Hue%
		Gosub ColDlg_FillCurrent
		Gosub ColDlg_Huonly
	}
}
}
ControlFocus,,ahk_id %ColDlg_Main% 
return

; converting functions

ColDlg_HStoRGB(hu, sa)
; Calculation of RGB as a 3-element table [0-2.55,0-2.55,0-2.55]  
; from the Hue hu (0 - 360) and Saturation sa (0 - 100)
; for Value (Brightness) assumed 100.
; All the three returned values should be multiplied by 
; Value (Brightness) (0 - 100) and rounded
; to get a final RGB (0...255, 0...255, 0...255)
{
 sa := sa/100
 hu := Mod(hu, 360)/60  
 i := Floor(hu)
 f := hu-i
; p := Round(255*(1-sa))
; q := Round(255*(1-(sa*f)))
; t := Round(255*(1-(sa*(1-f))))
 p := 2.55*(1-sa)
 q := 2.55*(1-(sa*f))
 t := 2.55*(1-(sa*(1-f)))
 if (i=0) 
	wy := [2.55,t,p]
 else if (i=1) 
	wy := [q,2.55,p]
 else if (i=2) 
	wy := [p,2.55,t]
 else if (i=3) 
	wy := [p,q,2.55]
 else if (i=4) 
	wy := [t,p,2.55]
 else if (i=5) 
	wy := [2.55,p,q]
return wy
}

ColDlg_RGBcom(tab,v)
; Calculation of RGB value from the RGB table 
; tab is the RGB table from HStoRGB()
; v is the Value (Brightness) (0 - 100)
; for Hue and Saturation as input to HStoRGB()
; Use hexadecimal setformat
; to obtain proper color value like 0xf3aa2e
{
	return 65536*Round(v*tab[1]) + 256*Round(v*tab[2]) + Round(v*tab[3])
}	

ColDlg_RGBtoHSV(red,grn,blu)
; Calculation of HSV value from RGB
; Red, grn, blu (0...255)
; result: a table [H, S, V]
; H (0...359), V, S (0...100)
{
x := ((x:=(red>grn ? grn : red))>blu ? blu : x)
va := ((va:=(red>grn ? red : grn))>blu ? va : blu)
if (x = va)
	hu:=0, sa:=0
else 
{
	f := ((red = x ? grn-blu : (grn = x ? blu-red : red-grn)))
	i := (red = x ? 3 : (grn = x ? 5 : 1))
	hu := Mod(Round((i-f/(va-x))*60),360)
	sa := Round(((va-x)/va)*100)
}
va := Round(va/2.55)
wy := [hu, sa, va]
return wy
}
