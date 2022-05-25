WM_CTLCOLOR(wParam, lParam, msg, hwnd)
{
    static hBrush := ""
    if (hBrush = "")
    {
        SetEnv, hBrush, % DllCall("Gdi32.dll\CreateSolidBrush", "UInt", BG_COLOR)
    }

    WinGetClass, Class, ahk_id %lParam%

    if (Class = "Edit")
    {
        DllCall("Gdi32.dll\SetTextColor", "UInt", wParam, "UInt", FG_COLOR)
        DllCall("Gdi32.dll\SetBkColor", "UInt", wParam, "UInt", BG_COLOR)
        DllCall("Gdi32.dll\SetBkMode", "UInt", wParam, "UInt", 2)
        return hBrush
    }
    if (Class = "Static")
    {
        DllCall("Gdi32.dll\SetTextColor", "UInt", wParam, "UInt", FG_COLOR)
    }
}