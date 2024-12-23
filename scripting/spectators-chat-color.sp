#include <sourcemod>
#include <basecomm>
#include <regex>

#include "spectators-chat-color/message"
#include "spectators-chat-color/use-case"
#include "spectators-chat-color/user-message"

#include "modules/console-variable.sp"
#include "modules/frame.sp"
#include "modules/message.sp"
#include "modules/use-case.sp"
#include "modules/user-message.sp"

public Plugin myinfo = {
    name = "Spectators chat color",
    author = "Dron-elektron",
    description = "Allows you to change the color of the spectators chat",
    version = "0.6.0",
    url = "https://github.com/dronelektron/spectators-chat-color"
};

public void OnPluginStart() {
    Variable_Create();
    UserMessage_HookSayText();
    AutoExecConfig(_, "spectators-chat-color");
}
