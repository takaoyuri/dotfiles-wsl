#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

focus_sid=$(aerospace list-workspaces --focused)
apps=$(aerospace list-windows --workspace $focus_sid --format '%{app-name} ')

if [ "$1" = "$focus_sid" ]; then
    sketchybar --set $NAME background.drawing=on
else
    sketchybar --set $NAME background.drawing=off
fi

sketchybar --set space.$focus_sid label="$focus_sid $apps" 
