void Frame_Console(const char[] message, int target) {
    DataPack data = new DataPack();

    data.WriteString(message);
    data.WriteCell(target);
    data.Reset();

    RequestFrame(Frame_OnConsole, data);
}

void Frame_Spectator(int client, const char[] message, int target) {
    DataPack data = new DataPack();

    data.WriteCell(client);
    data.WriteString(message);
    data.WriteCell(target);
    data.Reset();

    RequestFrame(Frame_OnSpectator, data);
}

public void Frame_OnConsole(DataPack data) {
    char message[MESSAGE_SIZE];

    data.ReadString(message, sizeof(message));

    int target = data.ReadCell();

    CloseHandle(data);
    Message_FromServer(message, target);
}

public void Frame_OnSpectator(DataPack data) {
    int client = data.ReadCell();
    char message[MESSAGE_SIZE];

    data.ReadString(message, sizeof(message));

    int target = data.ReadCell();

    CloseHandle(data);
    Message_FromPlayer(client, message, target);
}
