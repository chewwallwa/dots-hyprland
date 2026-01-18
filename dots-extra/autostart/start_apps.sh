#!/bin/bash

hyprctl dispatch workspace 11
hyprctl dispatch togglespecialworkspace

# Start VLC: -Z (random), -L (Loop) on the playlist path
vlc -Z -L --no-playlist-autostart /mnt/ssd/music & disown

# Start ProtonVPN (must have autoconnect and login set in GUI)
protonvpn-app & disown

# Start Bitwarden (Electron zoom -2x, ~0.81 scale)
bitwarden-desktop --force-device-scale-factor=0.81 & disown

# Start VeraCrypt GUI
veracrypt & disown

sleep 1.8

# Exit special workspace
# hyprctl dispatch togglespecialworkspace
hyprctl dispatch workspace 11

exit
