#include <sourcemod>
#include <basecomm>
#include <regex>

#include "spectators-chat-color/message"
#include "spectators-chat-color/use-case"

#include "modules/console-variable.sp"
#include "modules/message.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Spectators chat color",
    author = "Dron-elektron",
    description = "Allows you to change the color of the spectators chat",
    version = "0.1.0",
    url = "https://github.com/dronelektron/spectators-chat-color"
};

public void OnPluginStart() {
    Variable_Create();
    AutoExecConfig(_, "spectators-chat-color");
}

public Action OnClientSayCommand(int client, const char[] command, const char[] args) {
    return UseCase_OnClientSayCommand(client, args) ? Plugin_Handled : Plugin_Continue;
}
