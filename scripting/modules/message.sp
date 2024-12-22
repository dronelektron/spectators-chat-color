void Message_Print(int client, int target, const char[] message) {
    char color[COLOR_SIZE];

    if (client == CONSOLE) {
        Variable_ServerColor(color);
    } else {
        Variable_PlayerColor(color);
    }

    PrintToChat(target, "%s%s%N: %s%s", COLOR_RGB, color, client, COLOR_DEFAULT, message);
}
