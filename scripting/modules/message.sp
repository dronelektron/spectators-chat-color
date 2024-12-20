void Message_FromServer(const char[] message, int target) {
    char color[COLOR_SIZE];

    Variable_ServerColor(color);
    PrintToChat(target, "%s%sConsole: %s%s", COLOR_RGB, color, COLOR_DEFAULT, message);
}

void Message_FromPlayer(int client, const char[] message, int target) {
    char color[COLOR_SIZE];

    Variable_PlayerColor(color);
    PrintToChat(target, "%s%s%N: %s%s", COLOR_RGB, color, client, COLOR_DEFAULT, message);
}
