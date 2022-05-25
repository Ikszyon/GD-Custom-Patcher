SubmitBtn:

    Gui, Submit, Nohide

    If(WinExist("ahk_exe GeometryDash.exe")) {
        SB_SetText("Close Geometry Dash before patching")
        StatusBar_TT := "The Program cannot patch running executables"
        return
    }

    If(!FileExist(GDPath)) {
        SB_SetText("Path to GeometryDash.exe not set yet")
        StatusBar_TT := "Kinda need to tell the program which file to patch"
        return
    }

    SB_SetText("Patching...")

    For Each, Element in __ValidArgs {
        %Element%Temp := []
        Loop 3
			%Element%Temp.push(SubStr(%Element%, (A_Index - 1) * 2 + 1, 2))
        %Element% := %Element%

        If(StrLen(%Element%) == "6" && IsHex(%Element%))
            Store(Element)
    
        Else {
            enum++
            eelems .= StrLen(%Element%) != "6" ? Element "'s hex code needs to be 6 characters long (" %Element% ")`n" : Element " is not a valid hex code (" %Element% ")`n"
        }
    }

    ;---- Set Color Bytes ----;

    ;---- NormalBar ----;

    If(StrLen(NormalBar) == "6" && IsHex(NormalBar)) {
        HexEdit(GDPath, 2646285, NormalBar)
        HexEdit(GDPath, 2646309, NormalBar)
        HexEdit(GDPath, 2646357, NormalBar)
    }

    ;---- PracticeBar ----;

    If(StrLen(PracticeBar) == "6" && IsHex(PracticeBar)) {
        HexEdit(GDPath, 1537718, "285C3FFF524420FF66C745D4" PracticeBarTemp[1] PracticeBarTemp[2] "B1" PracticeBarTemp[3])
        HexEdit(GDPath, 1597538, "285c3f8b01ff5044b1" PracticeBarTemp[3] "9066c745f8" PracticeBarTemp[1] PracticeBarTemp[2] "0F")
        HexEdit(GDPath, 1986137, "285C3FFF5244B1" PracticeBarTemp[3] "9066C745EC" PracticeBarTemp[1] PracticeBarTemp[2] "66")
    }

    ;---- ProfileIconsBG ----;

    If(StrLen(ProfileIconsBG) == "6" && IsHex(ProfileIconsBG)) {
        HexEdit(GDPath, 2156616, ProfileIconsBG)
        HexEdit(GDPath, 1559021, ProfileIconsBG)
    }

    ;---- ProfileCommentBG ----;

    If(StrLen(ProfileCommentBG) == "6" && IsHex(ProfileCommentBG)) {
        HexEdit(GDPath, 2174114, ProfileCommentBG)
    }

    ;---- ProfileCommentOne ----;

    If(StrLen(ProfileCommentOne) == "6" && IsHex(ProfileCommentOne)) {
        HexEdit(GDPath, 394086, ProfileCommentOneTemp[1] ProfileCommentOneTemp[2] "B2" ProfileCommentOneTemp[3])
    }

    ;---- ProfileCommentTwo ----;

    If(StrLen(ProfileCommentTwo) == "6" && IsHex(ProfileCommentTwo)) {
        HexEdit(GDPath, 394076, ProfileCommentTwoTemp[1] ProfileCommentTwoTemp[2] "B2" ProfileCommentTwoTemp[3])
    }

    ;---- ProfileCommentTint ----;

    If(StrLen(ProfileCommentTint) == "6" && IsHex(ProfileCommentTint)) {
        HexEdit(GDPath, 389911, ProfileCommentTintTemp[1] ProfileCommentTintTemp[2] "B1" ProfileCommentTintTemp[3])
    }

    ;---- LevelListBG ----;

    If(StrLen(LevelListBG) == "6" && IsHex(LevelListBG)) {
        HexEdit(GDPath, 1422381, LevelListBG)
    }

    ;---- LevelListOne ----;

    If(StrLen(LevelListOne) == "6" && IsHex(LevelListOne)) {
        HexEdit(GDPath, 375514, LevelListOneTemp[1] LevelListOneTemp[2] "B1" LevelListOneTemp[3])
    }

    ;---- LevelListTwo ----;

    If(StrLen(LevelListTwo) == "6" && IsHex(LevelListTwo)) {
        HexEdit(GDPath, 375504, LevelListTwoTemp[1] LevelListTwoTemp[2] "B1" LevelListTwoTemp[3])
    }

    ;---- LeaderBoardBG ----;

    If(StrLen(LeaderBoardBG) == "6" && IsHex(LeaderBoardBG)) {
        HexEdit(GDPath, 1410672, LeaderBoardBG)
    }

    ;---- LevelDescBG ----;

    If(StrLen(LevelDescBG) == "6" && IsHex(LevelDescBG)) {
        HexEdit(GDPath, 1372674, LevelDescBGTemp[1] LevelDescBGTemp[2] "8D5589668B4588B1" LevelDescBGTemp[3])
    }

    ;---- CommentBG ----;

    If(StrLen(CommentBG) == "6" && IsHex(CommentBG))	{
        HexEdit(GDPath, 1382317, CommentBG)
    }

    ;---- LevelCommentOne ----;

    If(StrLen(LevelCommentOne) == "6" && IsHex(LevelCommentOne)) {
        HexEdit(GDPath, 394046, LevelCommentOneTemp[1] LevelCommentOneTemp[2] "B2" LevelCommentOneTemp[3])
    }

    ;---- LevelCommentTwo ----;

    If(StrLen(LevelCommentTwo) == "6" && IsHex(LevelCommentTwo)) {
        HexEdit(GDPath, 394036, LevelCommentTwoTemp[1] LevelCommentTwoTemp[2] "B2" LevelCommentTwoTemp[3])
    }

    ErrorText := enum == "1" ? "1 error hover for more info" : enum " errors hover for more info"

    If(enum) {
        SB_SetText(ErrorText "; the working colors were set regardless")
        StatusBar_TT := eelems
    }

    Else {
        SB_SetText("All colors were set correctly")
        StatusBar_TT := "0 Errors occured"
    }

    enum := ""
    eelems := ""

    ;---- Color Bytes Done ----;

return

GDPathBtn:

    FileSelectFile, GDPath,,, Select Geometry Dash Executable, *.exe
    If(GDPath) {
        GuiControl,, EditGDPath, %GDPath%
        EditGDPath_TT := GDPath
        SB_SetText("New Path to GeometryDash.exe set")
        StatusBar_TT := "Path set to """ GDPath """"
        Store("GDPath")
    }

return

UpdatePage:

    run, https://github.com/Ikszyon/GD-Custom-Patcher/releases
    SB_SetText("Github page opened")
    StatusBar_TT := ""

return

RunGDBtn:

        SB_SetText("Starting Geometry Dash")
        Run, steam://rungameid/322170
        SB_SetText("Geometry Dash started")

return

RefreshColors:

    Gui, Submit, NoHide
    GuiControlGet, CurrentColor, FocusV

    If(StrLen(%CurrentColor%) == "6" && IsHex(%CurrentColor%))
        GuiControl, % "+c" %CurrentColor% , %CurrentColor%Display

    Else
        GuiControl, +c000000 , %CurrentColor%Display

return

ColorDialog:

    Gui, Submit, NoHide

    DisplayVar := StrReplace(A_GuiControl, "_")
    EditVar := StrReplace(DisplayVar, "Display")
    ColorVar := %EditVar%

    #include .colordialog.ahk

return

ElevateAdmin:

    Elevate()

return

GenerateBatch:

    Gui, Submit, NoHide
    for each, element in __ValidArgs {
        If(StrLen(%element%) == "6" && IsHex(%element%)) {
            batchargs .= " -" element "'" %element% "'"
        }
    }
    batchcontent := "@echo off`n""%~dp0gd_custom_patcher"" %1% " batchargs "`npause >NUL"
    Random, batchname, 1, 99999
    FileAppend, %batchcontent%, %batchname%.bat
    SB_SetText("Batch file generated as " batchname ".bat")
    Run, %A_ScriptDir%
    StatusBar_TT := ""
    batchargs := ""

return

GuiClose:

	ExitApp

return