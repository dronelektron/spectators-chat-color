void UserMessage_HookSayText() {
    UserMsg id = GetUserMessageId("SayText");

    HookUserMessage(id, UserMessage_OnSayText, INTERCEPT_YES);
}

public Action UserMessage_OnSayText(UserMsg id, BfRead buffer, const int[] players, int playersAmount, bool reliable, bool init) {
    int client = buffer.ReadByte();

    if (UseCase_IsConsole(client) || UseCase_IsSpectator(client)) {
        char message[MESSAGE_SIZE];

        buffer.ReadString(message, sizeof(message), LINE_YES);

        int colonIndex = FindCharInString(message, ':');
        int startFrom = colonIndex + MESSAGE_OFFSET;

        if (colonIndex == INDEX_NOT_FOUND) {
            startFrom = 0;
        }

        Frame_PrintMessage(client, players[0], message[startFrom]);

        return Plugin_Handled;
    }

    return Plugin_Continue;
}
