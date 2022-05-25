#include <iostream>
#include <ioformat>
#include <adminprivs>
#include <HexEdit>
#include <tt>
#include <cobj>
#include <url2var>
#include .ctlcolor.ahk


#NoEnv
#NoTrayIcon
#SingleInstance off
SetBatchLines, -1

SetWorkingDir %A_ScriptDir%

/*
    COMPILE THIS SCRIPT TO GET THE WORKING EXE
*/

;@Ahk2Exe-SetName GDColorPatcher
;@Ahk2Exe-SetDescription Customize Hard Coded Colors In Geometry Dash; Made By Ikszyon#9500
;@Ahk2Exe-SetVersion 1.0
;@Ahk2Exe-SetCopyright Ikszyon

;-- MAIN SCRIPT --;

global SubName := "GDPatcher"
global CurrentVer := "1.0"


__ValidArgs :=  ["NormalBar"
				,"PracticeBar"
				,"ProfileCommentBG"
				,"ProfileCommentOne"
				,"ProfileCommentTwo"
				,"ProfileCommentTint"
				,"ProfileIconsBG"
				,"LeaderBoardBG"
				,"CommentBG"
				,"LevelDescBG"
				,"LevelCommentOne"
				,"LevelCommentTwo"
				,"LevelListOne"
				,"LevelListTwo"
				,"LevelListBG"]
	

#include .cmdpart.ahk
#include .guipart.ahk

F10::Reload

;-- MAIN SCRIPT END --;