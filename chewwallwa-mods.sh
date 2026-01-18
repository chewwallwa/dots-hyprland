#!/bin/bash

# --- CONFIGURATION ---
# REPLACE THIS WITH YOUR GITHUB REPO URL
REPO_URL="https://github.com/chewwallwa/dots-hyprland.git"
CLONE_DIR="$HOME/temp_dotfiles_installer"
BRANCH="all-my-mods"

# --- FILE LISTS ---

# 1. Main Dotfiles (Recursive/Standard - Will Backup & Overwrite)
FILES_STANDARD=(
"dots/.config/hypr/custom/execs.conf"
"dots/.config/hypr/custom/rules.conf"
"dots/.config/hypr/custom/rules.conf.bak"
"dots/.config/hypr/hyprland/env.conf"
"dots/.config/hypr/hyprland/execs.conf"
"dots/.config/hypr/hyprland/general.conf"
"dots/.config/hypr/hyprland/general.conf.bak"
"dots/.config/hypr/hyprland/keybinds.conf"
"dots/.config/hypr/hyprland/rules.conf"
"dots/.config/hypr/hyprlock/colors.conf"
"dots/.config/hypr/workspaces.conf"
"dots/.config/quickshell/ii/modules/common/Config.qml"
"dots/.config/quickshell/ii/modules/common/Directories.qml"
"dots/.config/quickshell/ii/modules/common/widgets/notification_utils.js"
"dots/.config/quickshell/ii/modules/ii/bar/BarContent.qml"
"dots/.config/quickshell/ii/modules/ii/cheatsheet/Cheatsheet.qml"
"dots/.config/quickshell/ii/modules/ii/cheatsheet/CheatsheetKatakana.qml"
"dots/.config/quickshell/ii/modules/ii/cheatsheet/CheatsheetKeybinds.qml"
"dots/.config/quickshell/ii/modules/ii/cheatsheet/katakana.js"
"dots/.config/quickshell/ii/modules/ii/lock/Lock.qml"
"dots/.config/quickshell/ii/modules/ii/lock/LockContext.qml"
"dots/.config/quickshell/ii/modules/ii/lock/LockSurface.qml"
"dots/.config/quickshell/ii/modules/ii/lock/PasswordChars.qml"
"dots/.config/quickshell/ii/modules/ii/lock/noise.png"
"dots/.config/quickshell/ii/modules/ii/lock/pam/fprintd.conf"
"dots/.config/quickshell/ii/modules/settings/BarConfig.qml"
"dots/.config/quickshell/ii/modules/settings/GeneralConfig.qml"
"dots/.config/quickshell/ii/modules/settings/HyprlandConfig.qml"
"dots/.config/quickshell/ii/modules/settings/InterfaceConfig.qml"
"dots/.config/quickshell/ii/modules/settings/QuickConfig.qml"
"dots/.config/quickshell/ii/modules/waffle/actionCenter/BodyRectangle.qml"
"dots/.config/quickshell/ii/modules/waffle/actionCenter/FooterMoreButton.qml"
"dots/.config/quickshell/ii/modules/waffle/actionCenter/FooterRectangle.qml"
"dots/.config/quickshell/ii/modules/waffle/actionCenter/PageColumn.qml"
"dots/.config/quickshell/ii/modules/waffle/actionCenter/Separator.qml"
"dots/.config/quickshell/ii/scripts/colors/switchwall.sh"
"dots/.config/quickshell/ii/scripts/hyprland/apply-hyprland-config.sh"
"dots/.config/quickshell/ii/services/Wallpapers.qml"
"dots/.config/quickshell/ii/settings.qml"
"dots/.config/quickshell/ii/shell.qml"
"dots/.config/quickshell/ii/welcome.qml"
"dots/.config/kitty/kitty.conf"
"dots/.config/kitty/kitty.conf.bak"
"dots/.config/fish/config.fish"
"dots/.config/quickshell/ii/modules/ii/screenCorners/ScreenCorners.qml"
"dots/.config/quickshell/ii/modules/ii/overview/Overview.qml"
"dots/.config/quickshell/ii/modules/ii/overview/OverviewWidget.qml"
)

# 2. Autostart Files (No Overwrite / Safe Copy)
FILES_AUTOSTART=(
"dots-extra/autostart/start_apps.sh"
"dots-extra/autostart/workset-0-clean.sh"
"dots-extra/autostart/workset-2-for-config.sh"
)

# 3. Config Overwrites (Always Replace)
FILES_CONFIG_OVERWRITE=(
"dots-extra/config.json"
"dots-extra/config-light.json"
)

# --- FUNCTIONS ---

echo "--- Starting Dotfiles Installation Script ---"

# Function to check and install dependencies
install_dependency() {
    PKG=$1
    if ! command -v $PKG &> /dev/null; then
        echo "Dependency '$PKG' not found. Attempting to install..."
        if command -v pacman &> /dev/null; then
            sudo pacman -S --noconfirm $PKG
        elif command -v apt &> /dev/null; then
            sudo apt update && sudo apt install -y $PKG
        elif command -v dnf &> /dev/null; then
            sudo dnf install -y $PKG
        elif command -v zypper &> /dev/null; then
            sudo zypper install -n $PKG
        else
            echo "ERROR: Could not detect package manager. Please install '$PKG' manually."
            exit 1
        fi
    else
        echo "Dependency '$PKG' is already installed."
    fi
}

install_dependency "git"
install_dependency "less"

# Clone Repository
if [ -d "$CLONE_DIR" ]; then
    echo "Temporary directory exists, cleaning up..."
    rm -rf "$CLONE_DIR"
fi

echo "Cloning repository ($BRANCH)..."
if git clone -b "$BRANCH" "$REPO_URL" "$CLONE_DIR"; then
    echo "Clone successful."
else
    echo "ERROR: Failed to clone repository. Check URL and connection."
    exit 1
fi

echo "--- Processing Files ---"

# 1. Process Standard Dots (Overwrite with Backup)
echo "[1/4] Processing Standard Dotfiles..."
for FILE_PATH in "${FILES_STANDARD[@]}"; do
    SOURCE="$CLONE_DIR/$FILE_PATH"
    # Remove "dots/" prefix
    REL_PATH="${FILE_PATH#dots/}"
    DEST="$HOME/$REL_PATH"
    DEST_DIR=$(dirname "$DEST")

    if [ -f "$SOURCE" ]; then
        if [ ! -d "$DEST_DIR" ]; then
            mkdir -p "$DEST_DIR"
        fi

        if [ -f "$DEST" ]; then
            TIMESTAMP=$(date +%Y%m%d_%H%M%S)
            echo "  Backup: $DEST -> $DEST.bak_$TIMESTAMP"
            mv "$DEST" "$DEST.bak_$TIMESTAMP"
        fi

        echo "  Copying: $REL_PATH"
        cp "$SOURCE" "$DEST"

        [[ "$DEST" == *.sh ]] && chmod +x "$DEST"
    else
        echo "  WARNING: Source file not found: $FILE_PATH"
    fi
done

# 2. Process Autostart (No Overwrite)
echo "[2/4] Processing Autostart Scripts (No Overwrite)..."
AUTOSTART_DIR="$HOME/.config/autostart"
mkdir -p "$AUTOSTART_DIR"

for FILE_PATH in "${FILES_AUTOSTART[@]}"; do
    SOURCE="$CLONE_DIR/$FILE_PATH"
    FILENAME=$(basename "$FILE_PATH")
    DEST="$AUTOSTART_DIR/$FILENAME"

    if [ -f "$SOURCE" ]; then
        if [ -f "$DEST" ]; then
            echo "  Skipping (Exists): $FILENAME"
        else
            echo "  Copying: $FILENAME"
            cp "$SOURCE" "$DEST"
            chmod +x "$DEST"
        fi
    else
        echo "  WARNING: Source file not found: $FILE_PATH"
    fi
done

# 3. Process Fastfetch (Glob Pattern - No Overwrite)
echo "[3/4] Processing Fastfetch (No Overwrite)..."
FASTFETCH_SOURCE_DIR="$CLONE_DIR/dots-extra/fastfetch"
FASTFETCH_DEST_DIR="$HOME/.config/fastfetch"

if [ -d "$FASTFETCH_SOURCE_DIR" ]; then
    mkdir -p "$FASTFETCH_DEST_DIR"
    # Iterate over files inside the cloned fastfetch folder
    for SOURCE in "$FASTFETCH_SOURCE_DIR"/*; do
        [ -e "$SOURCE" ] || continue
        FILENAME=$(basename "$SOURCE")
        DEST="$FASTFETCH_DEST_DIR/$FILENAME"

        if [ -f "$DEST" ]; then
            echo "  Skipping (Exists): $FILENAME"
        else
            echo "  Copying: $FILENAME"
            cp -r "$SOURCE" "$DEST"
        fi
    done
else
    echo "  WARNING: fastfetch folder not found in source."
fi

# 4. Process Illogical Impulse Configs (Overwrite)
echo "[4/4] Processing Illogical Impulse Configs (Overwrite)..."
IMPULSE_DIR="$HOME/.config/illogical-impulse"
mkdir -p "$IMPULSE_DIR"

for FILE_PATH in "${FILES_CONFIG_OVERWRITE[@]}"; do
    SOURCE="$CLONE_DIR/$FILE_PATH"
    FILENAME=$(basename "$FILE_PATH")
    DEST="$IMPULSE_DIR/$FILENAME"

    if [ -f "$SOURCE" ]; then
        echo "  Replacing: $FILENAME"
        cp "$SOURCE" "$DEST"
    else
        echo "  WARNING: Source file not found: $FILE_PATH"
    fi
done

# Cleanup
echo "--- Cleaning up temporary files ---"
rm -rf "$CLONE_DIR"

echo "--------------------------------------------------------"
echo "DONE! All files have been moved."
echo "IMPORTANT NOTICE:"
echo "The autostart files are just a template, modify for your needs and put in keybinds.conf"
echo "--------------------------------------------------------"
