Elevate() {
    ret := "", hToken := "", ReturnLength := ""
    DllCall("SetLastError", "UInt", 0)
    ret := DllCall("Advapi32.dll\OpenProcessToken", "UInt", DllCall("GetCurrentProcess"), "UInt", 0x0008, "UIntP", hToken)
    DllCall("SetLastError", "UInt", 0)
    DllCall("Advapi32.dll\GetTokenInformation", "UInt", hToken, "UInt", 18, "Int", 0, "Int", 0, "UIntP", ReturnLength)
    sizeof_elevationType := VarSetCapacity(elevationType, ReturnLength, 0)
    DllCall("SetLastError", "UInt", 0)
    DllCall("Advapi32.dll\GetTokenInformation", "UInt", hToken, "UInt", 18, "UIntP", elevationType, "Int", sizeof_elevationType, "UIntP", ReturnLength)
    if (elevationType == 3) {
        full_command_line := DllCall("GetCommandLine", "str")
        if not (RegExMatch(full_command_line, " /restart(?!\S)")) {
            if(A_IsCompiled) {
                Run *RunAs "%A_ScriptFullPath%" /restart,, UseErrorLevel
            } else {
                Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%",, UseErrorLevel
            }
            ExitApp
        }
    } 
    if (hToken)
        DllCall("CloseHandle", "UInt", hToken)
    return
}
