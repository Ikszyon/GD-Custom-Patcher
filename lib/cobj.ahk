"".base.__Get := Func("Default_Get_PseudoProperty")

Default_Get_PseudoProperty(nonobj, key) {

    if (key = "length")
        return StrLen(nonobj)

    else if (key = "IsHex")
        return c := !RegexMatch(nonobj, "[^A-Fa-f0-9]") ? 1 : 0
}

Store(Value) {
    RegWrite, REG_SZ, HKCU\SOFTWARE\Ikszyon\%SubName%, %Value%, % %Value%
    return
}

Retrieve(KeyName) {
    RegRead, v, HKCU\SOFTWARE\Ikszyon\%SubName%, %KeyName%
    return v
}

IsHex(nonobj) {
    return c := !RegexMatch(nonobj, "[^A-Fa-f0-9]") ? 1 : 0
}