;---- Check for Args / Combine Args ----;

	If(%0% != "0") {

	GDPath := A_Args[1]
	CMD_Red := ConsoleColor(0xff3030)
	CMD_Green := ConsoleColor(0x30ff30)
	CMD_Gray := ConsoleColor(0xAAAAAA)

	Stdout("`n`nCustom Patcher by Ikszyon`n" CMD_Gray "If you find any bugs DM me on Discord Ikszyon#9500`n")

	If(WinExist("ahk_exe GeometryDash.exe")) {
		Stdout(CMD_Red "`n	Please close Geometry Dash before running the Program" fDefault)
		StdExit()
		ExitApp
	}

	If(!InStr(A_Args[1], ".exe")) {
		Stdout(CMD_Red "`n	Drag the Geometry Dash Executable onto the batch file" fDefault)
		ExitApp
	}

	For Each, Element In A_Args
		__Args .= A_space . Element

;---- Define Hex Bytes for each Color ----;

	For Each, Element in __ValidArgs {
		If(InStr(__Args, Element) && Element != GDPath) {
			%Element%Temp := []
			Loop 3
				%Element%Temp.push(SubStr(RegExMatch(A_Args[Each+1], "(?<=').*?(?=')", HexCode) ? HexCode : HexCode, (A_Index - 1) * 2 + 1, 2))
			%Element% := %Element%Temp[1] . %Element%Temp[2] . %Element%Temp[3]
			If(StrLen(%Element%) == "6" && IsHex(%Element%)) {
				Stdout(CMD_Green "`n	Color for " . Element . " set to Hex Code: #" . Format("{:U}", %Element%) fDefault)
				Store(Element)
			}

			Else {
				Stdout(CMD_Red "`n	Color for " . Element . " couldn't be set correctly; hex code invalid (" . %Element% . ")" fDefault)
				%Element% := ""
			}
		}
	}

;---- Set Color Bytes in EXE ----

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

;---- Color Bytes Done ----;

;---- End Console Output----;

	StdExit()

	ExitApp:
	ExitApp

	}