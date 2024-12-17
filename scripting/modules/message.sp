void Message_FromServer(const char[] message) {
    char color[COLOR_SIZE];

    Variable_ServerColor(color);
    PrintToChatAll("%s%sConsole: %s%s", COLOR_RGB, color, COLOR_DEFAULT, message);
    PrintToServer("Console: %s", message);
}

void Message_FromPlayer(int client, const char[] message) {
    char color[COLOR_SIZE];

    Variable_PlayerColor(color);
    PrintToChatAll("%s%s%N: %s%s", COLOR_RGB, color, client, COLOR_DEFAULT, message);
    PrintToServer("%N: %s", client, message);
}
