bool UseCase_IsConsole(int client) {
    return client < 1;
}

bool UseCase_IsSpectator(int client) {
    int team = GetClientTeam(client);

    return team < TEAM_ALLIES;
}
