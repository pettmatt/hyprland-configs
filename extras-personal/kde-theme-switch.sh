#!/bin/bash
# Theme switch script for KDE and Hyprland

# Detect the current session
if [[ $XDG_CURRENT_DESKTOP == "KDE" ]]; then
    # Set KDE to Breeze (light theme)
    lookandfeeltool -a org.kde.breeze.desktop
    # Set GTK theme to Breeze or another compatible light theme
    gsettings set org.gnome.desktop.interface gtk-theme 'Breeze Dark'
    gsettings set org.gnome.desktop.interface icon-theme 'Breeze Dark'
elif [[ $XDG_CURRENT_DESKTOP == "Hyprland" ]]; then
    # Set GTK theme to Breeze or another light theme for consistency
    gsettings set org.gnome.desktop.interface gtk-theme 'Breeze'
    gsettings set org.gnome.desktop.interface icon-theme 'Breeze'
    # Assuming qt5ct or qt6ct for QT apps in Hyprland
    export QT_QPA_PLATFORMTHEME="qt5ct"
    qt5ct --set-style breeze
fi