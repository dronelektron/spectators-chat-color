void Message_Print(int client, const char[] message, int target) {
    char color[COLOR_SIZE];

    if (client == CONSOLE) {
        Variable_ServerColor(color);
    } else {
        Variable_PlayerColor(color);
    }

    PrintToChat(target, "%s%s%N: %s%s", COLOR_RGB, color, client, COLOR_DEFAULT, message);
}
