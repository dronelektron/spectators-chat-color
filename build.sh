#!/bin/bash

PLUGIN_NAME="spectators-chat-color"

cd scripting
spcomp $PLUGIN_NAME.sp -o ../plugins/$PLUGIN_NAME.smx
