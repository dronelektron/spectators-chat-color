static int g_client = INDEX_NOT_FOUND;
static int g_target = INDEX_NOT_FOUND;
static char g_message[MESSAGE_SIZE];

void UserMessage_HookSayText() {
    UserMsg id = GetUserMessageId("SayText");

    HookUserMessage(id, UserMessage_OnSayText, INTERCEPT_YES, UserMessage_OnSayTextPost);
}

public Action UserMessage_OnSayText(UserMsg id, BfRead buffer, const int[] players, int playersAmount, bool reliable, bool init) {
    g_client = buffer.ReadByte();
    g_target = players[0];

    if (UseCase_IsConsole(g_client) || UseCase_IsSpectator(g_client)) {
        char message[MESSAGE_SIZE];

        buffer.ReadString(message, sizeof(message), LINE_YES);

        int colonIndex = FindCharInString(message, ':');

        if (colonIndex == INDEX_NOT_FOUND) {
            colonIndex = -MESSAGE_OFFSET;
        }

        strcopy(g_message, sizeof(g_message), message[colonIndex + MESSAGE_OFFSET]);

        return Plugin_Handled;
    }

    ResetMessage();

    return Plugin_Continue;
}

public void UserMessage_OnSayTextPost(UserMsg id, bool sent) {
    if (g_client > INDEX_NOT_FOUND) {
        Message_Print(g_client, g_target, g_message);
        ResetMessage();
    }
}

static void ResetMessage() {
    g_client = INDEX_NOT_FOUND;
    g_target = INDEX_NOT_FOUND;
    g_message[0] = '\0';
}
