static ConVar g_playerColor;
static ConVar g_serverColor;
static Regex g_regex;

void Variable_Create() {
    g_playerColor = CreateConVar("sm_spectatorschatcolor_player", "0099FF", "The color of the player chat");
    g_serverColor = CreateConVar("sm_spectatorschatcolor_server", "EE82EE", "The color of the server chat");
    g_playerColor.AddChangeHook(Variable_OnColorChanged);
    g_serverColor.AddChangeHook(Variable_OnColorChanged);
    g_regex = new Regex("^[0-9A-F]{6}$");
}

void Variable_PlayerColor(char[] color) {
    g_playerColor.GetString(color, COLOR_SIZE);
}

void Variable_ServerColor(char[] color) {
    g_serverColor.GetString(color, COLOR_SIZE);
}

public void Variable_OnColorChanged(ConVar convar, const char[] oldValue, const char[] newValue) {
    int amount = g_regex.MatchAll(newValue);

    if (amount != 1) {
        convar.SetString(oldValue);
    }
}
