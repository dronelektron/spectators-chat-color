bool UseCase_OnClientSayCommand(int client, const char[] message) {
    if (IsConsole(client)) {
        Message_FromServer(message);

        return true;
    }

    if (BaseComm_IsClientGagged(client)) {
        return false;
    }

    if (IsAdminSay(client, message)) {
        return false;
    }

    int team = GetClientTeam(client);

    if (team < TEAM_ALLIES) {
        Message_FromPlayer(client, message);

        return true;
    }

    return false;
}

static bool IsConsole(int client) {
    return client < 1;
}

static bool IsAdminSay(int client, const char[] message) {
    bool isSay = message[0] == CHAT_SYMBOL;
    bool isPlayerSay = message[1] == CHAT_SYMBOL;
    bool hasAccessToSay = CheckCommandAccess(client, "sm_say", ADMFLAG_CHAT);
    bool hasAccessToPlayerSay = CheckCommandAccess(client, "sm_psay", ADMFLAG_CHAT);

    return (isSay && hasAccessToSay) || (isPlayerSay && hasAccessToPlayerSay);
}
