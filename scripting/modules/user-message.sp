void UserMessage_HookSayText() {
    UserMsg id = GetUserMessageId("SayText");

    HookUserMessage(id, Hook_OnSayText, INTERCEPT_YES);
}

public Action Hook_OnSayText(UserMsg id, BfRead buffer, const int[] players, int playersAmount, bool reliable, bool init) {
    int client = buffer.ReadByte();
    char message[MESSAGE_SIZE];

    buffer.ReadString(message, sizeof(message), LINE_YES);

    int colonIndex = FindCharInString(message, ':');

    if (colonIndex == INDEX_NOT_FOUND) {
        LogError("Unable to hook a message");

        return Plugin_Continue;
    }

    int startFrom = colonIndex + 2;

    if (UseCase_IsConsole(client)) {
        Frame_Console(message[startFrom]);

        return Plugin_Handled;
    }

    if (UseCase_IsSpectator(client)) {
        Frame_Spectator(client, message[startFrom]);

        return Plugin_Handled;
    }

    return Plugin_Continue;
}
