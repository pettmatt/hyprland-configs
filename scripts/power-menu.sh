#!/bin/bash

# Original: https://github.com/k4ahr/dotfilesV2/blob/main/.script/power-menu.sh
# Power menu options
options="Shutdown\nReboot\nLogout\nSleep"

# Show the menu using wofi
selected_option=$(echo -e "$options" | wofi --dmenu --prompt="Confirm to shut down.")

case $selected_option in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Logout)
        hyprctl dispatch exit
        ;;
    Sleep)
        systemctl suspend
        ;;
    *)
        exit 1
        ;;
esac