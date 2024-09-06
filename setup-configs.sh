#!/bin/bash

# Define paths
hyprland_config_dir="$HOME/.config/hypr"
waybar_config_dir="$HOME/.config/waybar"
mako_config_dir="$HOME/.config/mako"

waybar_config_path="$waybar_config_dir/config"
mako_config_path="$mako_config_dir/config"

# Check if configuration directory exists, create if not
if [ ! -d "$mako_config_dir" ]; then
    echo "Creating Mako configuration directory..."
    mkdir -p "$mako_config_dir"
fi

if [ ! -d "$waybar_config_dir" ]; then
    echo "Creating Waybar configuration directory..."
    mkdir -p "$waybar_config_dir"
fi

# Remove any existing config file or link
if [ -L "$waybar_config_path" ] || [ -e "$waybar_config_path" ]; then
    echo "Removing existing Waybar configuration file..."
    rm -f "$waybar_config_path"
fi

if [ -L "$mako_config_path" ] || [ -e "$mako_config_path" ]; then
    echo "Removing existing Mako configuration file..."
    rm -f "$mako_config_path"
fi

# Create a symbolic link
ln -s "$hyprland_config_dir/waybar/config" "$waybar_config_path"
ln -s "$hyprland_config_dir/mako/config" "$mako_config_path"

echo "Configurations are successfully linked."
