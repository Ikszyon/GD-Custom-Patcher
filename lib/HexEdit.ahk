HexEdit(Filename, Position, Bytes) { 
    If(Mod(StrLen(Bytes), 2) || RegExMatch(Bytes, "[^0-9a-fA-F]"))
        return 0

    f := FileOpen(Filename, "rw")
    f.Seek(Position - 1)
    While(StrLen(Bytes) != "0") {
        f.WriteChar("0x" SubStr(Bytes, 1, 2))
        Bytes := SubStr(Bytes, 3)
    }
    f.Close()

    return 1
}