#!/bin/bash

# Define options
options="Logout\nSleep\nRestart\nShutdown"

# Get user choice
chosen=$(echo -e "$options" | rofi -dmenu -p "System Actions")

# Execute the choice
case $chosen in
    Logout)
        loginctl terminate-session ${XDG_SESSION_ID}
        ;;
    Sleep)
        systemctl suspend
        ;;
    Restart)
        systemctl reboot
        ;;
    Shutdown)
        systemctl poweroff
        ;;
esac
