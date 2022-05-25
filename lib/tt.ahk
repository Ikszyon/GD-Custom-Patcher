WM_MOUSEMOVE()
{
    static CurrControl, PrevControl, _TT
    CurrControl := A_GuiControl
    If (CurrControl <> PrevControl and not InStr(CurrControl, " "))
    {
        ToolTip
        SetTimer, DisplayToolTip, 500
        PrevControl := CurrControl
    }
    Return

    DisplayToolTip:
        SetTimer, DisplayToolTip, Off
        ToolTip % %CurrControl%_TT
        SetTimer, RemoveToolTip, 10000
    Return

    RemoveToolTip:
        SetTimer, RemoveToolTip, Off
        ToolTip
    Return
}

CheckTT() {
    OnMessage(0x200, "WM_MOUSEMOVE")
    WinSet, Redraw
}