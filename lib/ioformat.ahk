fDefault := "[0m"

ConsoleColor(Hex) {
    return InStr(Hex, "0x") ? "[38;2;" Hex >> 16 & 0xFF ";" Hex >> 8 & 0xFF ";" Hex & 0xFF "m" : ConsoleColor("0x" Hex)
}

ConsoleBG(Hex) {
    return InStr(Hex, "0x") ? "[48;2;" Hex >> 16 & 0xFF ";" Hex >> 8 & 0xFF ";" Hex & 0xFF "m" : ConsoleBG("0x" Hex)
}