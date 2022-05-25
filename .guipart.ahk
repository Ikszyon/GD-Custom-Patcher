;---- Check for Args ----;

	If(%0% == "0") {
    
    ;---- Color Edit Boxes ----;

    global BG_COLOR   := 0xFFFFFF
    global FG_COLOR   := 0x000000

    GDPath := Retrieve("GDPath")

    OnMessage( 0x138, "WM_CTLCOLOR" ), OnMessage( 0x133, "WM_CTLCOLOR" )

        Gui, Add, Text, x22 y29 w120 h20 c000000 +BackgroundTrans, Normal Mode
        Gui, Add, Edit, x42 y49 w80 h20 vNormalBar gRefreshColors limit6 Uppercase r1, % Retrieve("NormalBar")
        Gui, Add, Edit, x22 y49 w20 h20 +Center c000000 Disabled r1 Readonly vHash1, #
        NormalBar_TT := "Color of the Normal Mode Progress Bar"

        Gui, Add, Text, x22 y79 w100 h20 c000000 +BackgroundTrans, Practice Mode
        Gui, Add, Edit, x42 y99 w80 h20 vPracticeBar gRefreshColors limit6 Uppercase r1, % Retrieve("PracticeBar")
        Gui, Add, Edit, x22 y99 w20 h20 +Center c000000 Disabled r1 Readonly vHash2, #
        PracticeBar_TT := "Color of the Practice Mode Progress Bar"

        Gui, Add, Text, x312 y229 w100 h20 c000000 +BackgroundTrans, Profile Comment BG
        Gui, Add, Edit, x332 y249 w80 h20 vProfileCommentBG gRefreshColors limit6 Uppercase r1, % Retrieve("ProfileCommentBG")
        Gui, Add, Edit, x312 y249 w20 h20 +Center c000000 Disabled r1 Readonly vHash3, #
        ProfileCommentBG_TT := "Background color of the posts on a profile"

        Gui, Add, Text, x182 y179 w100 h20 c000000 +BackgroundTrans, 1st Profile Post
        Gui, Add, Edit, x202 y199 w80 h20 vProfileCommentOne gRefreshColors limit6 Uppercase r1, % Retrieve("ProfileCommentOne")
        Gui, Add, Edit, x182 y199 w20 h20 +Center c000000 Disabled r1 Readonly vHash4, #
        ProfileCommentOne_TT := "Color of the first post on a profile in pairs of 2"

        Gui, Add, Text, x182 y229 w100 h20 c000000 +BackgroundTrans, 2nd Profile Post
        Gui, Add, Edit, x202 y249 w80 h20 vProfileCommentTwo gRefreshColors limit6 Uppercase r1, % Retrieve("ProfileCommentTwo")
        Gui, Add, Edit, x182 y249 w20 h20 +Center c000000 Disabled r1 Readonly vHash5, #
        ProfileCommentTwo_TT := "Color of the second post on a profile in pairs of 2"

        Gui, Add, Text, x182 y279 w100 h20 c000000 +BackgroundTrans, Profile Post Tint
        Gui, Add, Edit, x202 y299 w80 h20 vProfileCommentTint gRefreshColors limit6 Uppercase r1, % Retrieve("ProfileCommentTint")
        Gui, Add, Edit, x182 y299 w20 h20 +Center c000000 Disabled r1 Readonly vHash6, #
        ProfileCommentTint_TT := "Tint of the background colors for each post on a profile"

        Gui, Add, Text, x312 y179 w90 h20 c000000 +BackgroundTrans, Profile Icons BG
        Gui, Add, Edit, x332 y199 w80 h20 vProfileIconsBG gRefreshColors limit6 Uppercase r1, % Retrieve("ProfileIconsBG")
        Gui, Add, Edit, x312 y199 w20 h20 +Center c000000 Disabled r1 Readonly vHash7, #
        ProfileIconsBG_TT := "Background color of the icon display on a profile"

        Gui, Add, Text, x22 y329 w100 h20 c000000 +BackgroundTrans, Leaderboard BG
        Gui, Add, Edit, x42 y349 w80 h20 vLeaderBoardBG gRefreshColors limit6 Uppercase r1, % Retrieve("LeaderBoardBG")
        Gui, Add, Edit, x22 y349 w20 h20 +Center c000000 Disabled r1 Readonly vHash8, #
        LeaderBoardBG_TT := "Background color of the leaderboard"

        Gui, Add, Text, x312 y79 w100 h20 c000000 +BackgroundTrans, Level Comment BG
        Gui, Add, Edit, x332 y99 w80 h20 vCommentBG gRefreshColors limit6 Uppercase r1, % Retrieve("CommentBG")
        Gui, Add, Edit, x312 y99 w20 h20 +Center c000000 Disabled r1 Readonly vHash9, #
        CommentBG_TT := "Background color of the comment section on a level"

        Gui, Add, Text, x312 y29 w100 h20 c000000 +BackgroundTrans, Level Description BG
        Gui, Add, Edit, x332 y49 w80 h20 vLevelDescBG gRefreshColors limit6 Uppercase r1, % Retrieve("LevelDescBG")
        Gui, Add, Edit, x312 y49 w20 h20 +Center c000000 Disabled r1 Readonly vHash10, #
        LevelDescBG_TT := "Background color of the level description"

        Gui, Add, Text, x182 y29 w100 h20 c000000 +BackgroundTrans, 1st Level Comment
        Gui, Add, Edit, x202 y49 w80 h20 vLevelCommentOne gRefreshColors limit6 Uppercase r1, % Retrieve("LevelCommentOne")
        Gui, Add, Edit, x182 y49 w20 h20 +Center c000000 Disabled r1 Readonly vHash11, #
        LevelCommentOne_TT := "Color of the first comment on a level in pairs of 2"

        Gui, Add, Text, x182 y79 w100 h20 c000000 +BackgroundTrans, 2nd Level Comment
        Gui, Add, Edit, x202 y99 w80 h20 vLevelCommentTwo gRefreshColors limit6 Uppercase r1, % Retrieve("LevelCommentTwo")
        Gui, Add, Edit, x182 y99 w20 h20 +Center c000000 Disabled r1 Readonly vHash12, #
        LevelCommentTwo_TT := "Color of the second comment on a level in pairs of 2"

        Gui, Add, Text, x22 y179 w100 h20 c000000 +BackgroundTrans, 1st Level in a List
        Gui, Add, Edit, x42 y199 w80 h20 vLevelListOne gRefreshColors limit6 Uppercase r1, % Retrieve("LevelListOne")
        Gui, Add, Edit, x22 y199 w20 h20 +Center c000000 Disabled r1 Readonly vHash13, #
        LevelListOne_TT := "Color of the first level in a level list in pairs of 2"

        Gui, Add, Text, x22 y229 w100 h20 c000000 +BackgroundTrans, 2nd Level in a List
        Gui, Add, Edit, x42 y249 w80 h20 vLevelListTwo gRefreshColors limit6 Uppercase r1, % Retrieve("LevelListTwo")
        Gui, Add, Edit, x22 y249 w20 h20 +Center c000000 Disabled r1 Readonly vHash14, #
        LevelListTwo_TT := "Color of the second level in a level list in pairs of 2"

        Gui, Add, Text, x22 y279 w100 h20 c000000 +BackgroundTrans, Level List BG
        Gui, Add, Edit, x42 y299 w80 h20 vLevelListBG gRefreshColors limit6 Uppercase r1, % Retrieve("LevelListBG")
        Gui, Add, Edit, x22 y299 w20 h20 +Center c000000 Disabled r1 Readonly vHash15, #
        LevelListBG_TT := "Background color of level lists"

    ;---- Groupboxes ----;

        Gui, Add, GroupBox, x12 y9 w140 h130 , Progress Bars

        Gui, Add, GroupBox, x12 y159 w140 h230 , Level List && Leaderboard

        Gui, Add, GroupBox, x172 y9 w270 h130 , Level Info

        Gui, Add, GroupBox, x172 y159 w270 h180 , Player Profiles

        Gui, Add, GroupBox, x172 y339 w270 h50 , GeometryDash.exe Path
        Gui, Add, Edit, x180 y357 w206 h20 readonly r1 vEditGDPath, % GDPath
        Gui, Add, Button, x388 y356 w23 h23 +center gGDPathBtn vGDPathBtn, % Chr(0x205D)
        Gui, Add, Button, x412 y356 w23 h23 +center gRunGDBtn vRunGDBtn, % Chr(0x2BC8)
        EditGDPath_TT := GDPath
        GDPathBtn_TT := "Click to set new path"


    ;---- Buttons and Misc. Stuff ----;

        Gui, Add, Button, x12 y409 w130 h30 vSubmitBtn gSubmitBtn, Patch Colors
        SubmitBtn_TT := "Set the colors that are specified above"

        Gui, Add, Button, x162 y409 w130 h30 vElevateAdmin gElevateAdmin, Elevate To Admin
        ElevateAdmin_TT := "Grants the program admin privileges; press if the colors don't appear ingame"

        Gui, Add, Button, x312 y409 w130 h30 vGenerateBatch gGenerateBatch, Generate Batch File
        GenerateBatch_TT := "Generates a Batch file that automatically sets the colors specified above (useful for texture packs)`nNote: you need to include this .exe with the name ""gd_custom_patcher"" in the same directory for it to work" 

        Gui, Add, Button, x12 y448 w70 h20 vUpdateButton gUpdatePage, Update
        UpdateButton_TT := "Click to open the update page"

        GuiControl, hide, UpdateButton

        Gui, Add, StatusBar, vStatusBar gUpdatePage, % A_IsAdmin ? "Successfully launched as Administrator" : "Program Opened"

    ;---- Color Displays ----;

        #include .colorprev.ahk

    ;---- Show Gui ----;

        Gui, Show, h501 w454, Custom Patcher

    If(A_IsAdmin) {
        GuiControl,, ElevateAdmin, Already Admin
        GuiControl, Disable, ElevateAdmin
    }

    ;---- Check for Update ----;

    RunWait, ping.exe www.google.com -n 1,, Hide UseErrorlevel
        If !Errorlevel {
            If("0.9" != CurrentVer) {
                SB_SetText("There is an Update available! Click the button to open the Github repository")
                StatusBar_TT := "https://github.com/Ikszyon/GD-Custom-Patcher/releases"
                GuiControl, show, UpdateButton
            }
        }

    CheckTT()
    
    return

    }

;-- Labels --;

#include .guilabels.ahk