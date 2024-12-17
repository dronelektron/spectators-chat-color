bool UseCase_OnClientSayCommand(int client, const char[] message) {
    if (IsConsole(client)) {
        Message_FromServer(message);

        return true;
    }

    if (BaseComm_IsClientGagged(client)) {
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
