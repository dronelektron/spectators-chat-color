void Frame_PrintMessage(int client, int target, const char[] message) {
    DataPack data = new DataPack();

    data.WriteCell(client);
    data.WriteCell(target);
    data.WriteString(message);
    data.Reset();

    RequestFrame(OnPrintMessage, data);
}

static void OnPrintMessage(DataPack data) {
    int client = data.ReadCell();
    int target = data.ReadCell();
    char message[MESSAGE_SIZE];

    data.ReadString(message, sizeof(message));

    CloseHandle(data);
    Message_Print(client, target, message);
}
