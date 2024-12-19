void Frame_Console(const char[] message) {
    DataPack data = new DataPack();

    data.WriteString(message);
    data.Reset();

    RequestFrame(Frame_OnConsole, data);
}

void Frame_Spectator(int client, const char[] message) {
    DataPack data = new DataPack();
    int userId = GetClientUserId(client);

    data.WriteCell(userId);
    data.WriteString(message);
    data.Reset();

    RequestFrame(Frame_OnSpectator, data);
}

public void Frame_OnConsole(DataPack data) {
    char message[MESSAGE_SIZE];

    data.ReadString(message, sizeof(message));

    CloseHandle(data);
    Message_FromServer(message);
}

public void Frame_OnSpectator(DataPack data) {
    int userId = data.ReadCell();
    int client = GetClientOfUserId(userId);

    if (client == INVALID_CLIENT) {
        CloseHandle(data);

        return;
    }

    char message[MESSAGE_SIZE];

    data.ReadString(message, sizeof(message));

    CloseHandle(data);
    Message_FromPlayer(client, message);
}
