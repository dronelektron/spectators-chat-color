void Frame_PrintMessage(int client, const char[] message, int target) {
    DataPack data = new DataPack();

    data.WriteCell(client);
    data.WriteString(message);
    data.WriteCell(target);
    data.Reset();

    RequestFrame(Frame_OnPrintMessage, data);
}

public void Frame_OnPrintMessage(DataPack data) {
    int client = data.ReadCell();
    char message[MESSAGE_SIZE];

    data.ReadString(message, sizeof(message));

    int target = data.ReadCell();

    CloseHandle(data);
    Message_Print(client, message, target);
}
