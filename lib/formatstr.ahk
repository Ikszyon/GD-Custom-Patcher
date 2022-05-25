asc2hex(S) {
    Return S="" ? "":Chr((*&S>>4)+48) Chr((x:=*&S&15)+48+(x>9)*7) asc2hex(SubStr(S,2))
}

RegExCapture(Haystack, NeedleRegEx) {
    return RegExMatch(Haystack, NeedleRegEx, x) ? x : x
}

hex2asc(base16) {
    If(Mod(StrLen(base16), 2) || RegexMatch(base16, "[^A-Fa-f0-9]"))
        return 0
    While(StrLen(base16) != "0") {
        c .= Chr("0x" SubStr(base16, 1, 2))
        base16 := SubStr(base16, 3)
    }
    return c
}

ConvertBase(InputBase, OutputBase, nptr) ; Base 2 - 36
{
    static u := A_IsUnicode ? "_wcstoui64" : "_strtoui64"
    static v := A_IsUnicode ? "_i64tow" : "_i64toa"
        VarSetCapacity(s, 66, 0)
        value := DllCall("msvcrt.dll\" u, "Str", nptr, "UInt", 0, "UInt", InputBase, "CDECL Int64")
        DllCall("msvcrt.dll\" v, "Int64", value, "Str", s, "UInt", OutputBase, "CDECL")
    return s
}

InvertColor(Hex) {
    return !InStr(Hex, "0x") ? InvertColor("0x" . Hex) : StrLen(x := StrReplace(Format("{1:#x}", hex ^ 0xFFFFFF), "0x")) == 4 ? "00" . x : x
}

hex2dec(Hex) {
    return Format("{:i}", "0x" Hex)
}

b64e(string)
{
    VarSetCapacity(bin, StrPut(string, "UTF-8")) && len := StrPut(string, &bin, "UTF-8") - 1 
    if !(DllCall("crypt32\CryptBinaryToString", "ptr", &bin, "uint", len, "uint", 0x1, "ptr", 0, "uint*", size))
        throw Exception("CryptBinaryToString failed", -1)
    VarSetCapacity(buf, size << 1, 0)
    if !(DllCall("crypt32\CryptBinaryToString", "ptr", &bin, "uint", len, "uint", 0x1, "ptr", &buf, "uint*", size))
        throw Exception("CryptBinaryToString failed", -1)
    return StrGet(&buf)
}

b64d(string)
{
    if !(DllCall("crypt32\CryptStringToBinary", "ptr", &string, "uint", 0, "uint", 0x1, "ptr", 0, "uint*", size, "ptr", 0, "ptr", 0))
        throw Exception("CryptStringToBinary failed", -1)
    VarSetCapacity(buf, size, 0)
    if !(DllCall("crypt32\CryptStringToBinary", "ptr", &string, "uint", 0, "uint", 0x1, "ptr", &buf, "uint*", size, "ptr", 0, "ptr", 0))
        throw Exception("CryptStringToBinary failed", -1)
    return StrGet(&buf, size, "UTF-8")
}