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

        if (colonIndex == INDEX_NOT_FOUND) {
            LogError("Unable to hook a message");

            return Plugin_Continue;
        }

        int startFrom = colonIndex + 2;
        int target = players[0];

        Frame_PrintMessage(client, message[startFrom], target);

        return Plugin_Handled;
    }

    return Plugin_Continue;
}
