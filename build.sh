#!/bin/bash

PLUGIN_NAME="spectators-chat-color"

cd scripting
spcomp $PLUGIN_NAME.sp -i include -o ../plugins/$PLUGIN_NAME.smx
