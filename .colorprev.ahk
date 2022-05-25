/*
    Could've probably used some procedural way to create the gui but no
*/

        ;---- Groupboxes ----;

            Gui, Add, GroupBox, x125 y43 w22 h28 +BackgroundTrans
            Gui, Add, GroupBox, x125 y93 w22 h28 +BackgroundTrans
            Gui, Add, GroupBox, x415 y243 w22 h28 +BackgroundTrans
            Gui, Add, GroupBox, x285 y193 w22 h28 +BackgroundTrans
            Gui, Add, GroupBox, x285 y243 w22 h28 +BackgroundTrans
            Gui, Add, GroupBox, x285 y293 w22 h28 +BackgroundTrans
            Gui, Add, GroupBox, x415 y193 w22 h28 +BackgroundTrans
            Gui, Add, GroupBox, x125 y343 w22 h28 +BackgroundTrans
            Gui, Add, GroupBox, x415 y93 w22 h28 +BackgroundTrans
            Gui, Add, GroupBox, x415 y43 w22 h28 +BackgroundTrans
            Gui, Add, GroupBox, x285 y43 w22 h28 +BackgroundTrans
            Gui, Add, GroupBox, x285 y93 w22 h28 +BackgroundTrans
            Gui, Add, GroupBox, x125 y193 w22 h28 +BackgroundTrans
            Gui, Add, GroupBox, x125 y243 w22 h28 +BackgroundTrans
            Gui, Add, GroupBox, x125 y293 w22 h28 +BackgroundTrans

        ;---- Displays ----;

            Gui, font, s22
            
            Gui, Add, Text, +BackgroundTrans x127 y51 w17 h17 gColorDialog v_NormalBarDisplay
            Gui, Add, Progress, % "c"Retrieve("NormalBar") " +Backgroundc000000 x127 y51 w17 h17 vNormalBarDisplay", 100
            Gui, Add, Text, +BackgroundTrans x127 y101 w17 h17 gColorDialog v_PracticeBarDisplay
            Gui, Add, Progress, % "c"Retrieve("PracticeBar") " +Backgroundc000000 x127 y101 w17 h17 vPracticeBarDisplay", 100
            Gui, Add, Text, +BackgroundTrans x417 y251 w17 h17 gColorDialog v_ProfileCommentBGDisplay
            Gui, Add, Progress, % "c"Retrieve("ProfileCommentBG") " +Backgroundc000000 x417 y251 w17 h17 w17 h17 vProfileCommentBGDisplay", 100
            Gui, Add, Text, +BackgroundTrans x287 y201 w17 h17 gColorDialog v_ProfileCommentOneDisplay
            Gui, Add, Progress, % "c"Retrieve("ProfileCommentOne") " +Backgroundc000000 x287 y201 w17 h17 vProfileCommentOneDisplay", 100
            Gui, Add, Text, +BackgroundTrans x287 y251 w17 h17 gColorDialog v_ProfileCommentTwoDisplay
            Gui, Add, Progress, % "c"Retrieve("ProfileCommentTwo") " +Backgroundc000000 x287 y251 w17 h17 vProfileCommentTwoDisplay", 100
            Gui, Add, Text, +BackgroundTrans x287 y301 w17 h17 gColorDialog v_ProfileCommentTintDisplay
            Gui, Add, Progress, % "c"Retrieve("ProfileCommentTint") " +Backgroundc000000 x287 y301 w17 h17 vProfileCommentTintDisplay", 100
            Gui, Add, Text, +BackgroundTrans x417 y201 w17 h17 gColorDialog v_ProfileIconsBGDisplay
            Gui, Add, Progress, % "c"Retrieve("ProfileIconsBG") " +Backgroundc000000 x417 y201 w17 h17 vProfileIconsBGDisplay", 100
            Gui, Add, Text, +BackgroundTrans x127 y351 w17 h17 gColorDialog v_LeaderBoardBGDisplay
            Gui, Add, Progress, % "c"Retrieve("LeaderBoardBG") " +Backgroundc000000 x127 y351 w17 h17 vLeaderBoardBGDisplay", 100
            Gui, Add, Text, +BackgroundTrans x417 y101 w17 h17 gColorDialog v_CommentBGDisplay
            Gui, Add, Progress, % "c"Retrieve("CommentBG") " +Backgroundc000000 x417 y101 w17 h17 vCommentBGDisplay", 100
            Gui, Add, Text, +BackgroundTrans x287 y51 w17 h17 gColorDialog v_LevelCommentOneDisplay
            Gui, Add, Progress, % "c"Retrieve("LevelCommentOne") " +Backgroundc000000 x287 y51 w17 h17 vLevelCommentOneDisplay", 100
            Gui, Add, Text, +BackgroundTrans x287 y101 w17 h17 gColorDialog v_LevelCommentTwoDisplay
            Gui, Add, Progress, % "c"Retrieve("LevelCommentTwo") " +Backgroundc000000 x287 y101 w17 h17 vLevelCommentTwoDisplay", 100
            Gui, Add, Text, +BackgroundTrans x417 y51 w17 h17 gColorDialog v_LevelDescBGDisplay
            Gui, Add, Progress, % "c"Retrieve("LevelDescBG") " +Backgroundc000000 x417 y51 w17 h17 vLevelDescBGDisplay", 100
            Gui, Add, Text, +BackgroundTrans x127 y201 w17 h17 gColorDialog v_LevelListOneDisplay
            Gui, Add, Progress, % "c"Retrieve("LevelListOne") " +Backgroundc000000 x127 y201 w17 h17 vLevelListOneDisplay", 100
            Gui, Add, Text, +BackgroundTrans x127 y251 w17 h17 gColorDialog v_LevelListTwoDisplay
            Gui, Add, Progress, % "c"Retrieve("LevelListTwo") " +Backgroundc000000 x127 y251 w17 h17 vLevelListTwoDisplay", 100
            Gui, Add, Text, +BackgroundTrans x127 y301 w17 h17 gColorDialog v_LevelListBGDisplay
            Gui, Add, Progress, % "c"Retrieve("LevelListBG") " +Backgroundc000000 x127 y301 w17 h17 vLevelListBGDisplay", 100