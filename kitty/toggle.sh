#!/bin/bash

# Check if Kitty is already running
if pgrep -x "kitty" > /dev/null; then
    # Check if any Kitty window is focused
    if xprop -id $(xprop -root _NET_ACTIVE_WINDOW | awk -F' ' '{print $5}') WM_NAME | grep -qi "kitty"; then
        # Hide the Kitty window
        xdotool getactivewindow windowminimize
    else
        # Focus Kitty if it exists but isn't focused
        wmctrl -R "kitty"
    fi
else
    # Start Kitty if it's not running
    kitty --title "Kitty" &
fi

