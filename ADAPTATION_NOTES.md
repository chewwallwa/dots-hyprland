# Adaptation Notes: all-my-mods to clean base

This document describes the adaptation of customizations from the `all-my-mods` branch to the updated `clean` branch (upstream-compatible base).

## Adaptation Date
2026-01-18

## Summary
Successfully merged **193 files** with customizations from `all-my-mods` into the updated `clean` base branch. All modifications have been adapted to maintain compatibility with the upstream updates while preserving user customizations.

## Files Changed
- **Added:** 30 new files (scripts, configs, utilities)
- **Modified:** 116 existing files
- **Deleted:** 47 deprecated/unused files

## Key Changes by Category

### 1. New Utility Scripts and Configurations
- `chewwallwa-mods.sh` - Main script to apply/manage customizations
- `dots-extra/autostart/*.sh` - Workset automation scripts for session management
- `dots-extra/base-espanso.yml` - Text expansion configuration
- `dots-extra/config*.json` - Light and dark theme configurations
- `dots-extra/default-keyd.conf` - Keyboard daemon configuration
- `dots-extra/fastfetch/*` - Custom system info display
- `dots-extra/changes.txt` - Detailed changelog (from all-my-mods)

### 2. Hyprland Configuration Adaptations

#### Monitor Setup (general.conf)
- **Dual monitor configuration:** DP-1 (1360x768@60, rotated) + HDMI-A-1 (1920x1080@100)
- Custom gaps and border settings optimized for this setup
- Enhanced blur, dim, and popup handling

#### Keybinds (keybinds.conf)
- **Major restructuring:** Extensive use of submaps for organization
- New submaps: Session, App, Media, Browser, Worksets, Tiling, etc.
- Added bindings for: cheatsheet, OCR, clipboard management, quickshell widgets, workspace management

#### Window Rules (rules.conf & custom/rules.conf)
- Custom opacity variables for fine-tuned transparency control
- Application-specific transparency rules (kitty, dolphin, kate, VLC, etc.)
- Blur rules: Only apply to quickshell, ignore others for performance
- Enhanced layer rules for lock screen and session management

#### Environment & Execution
- **env.conf:** Input method variables (fcitx5/ibus compatibility)
- **execs.conf:** Random wallpaper from current folder on startup, custom cursor
- **custom/execs.conf:** VLC auto-start as scratchpad
- **workspaces.conf:** Dynamic workspace generation for dual monitors

#### Colors & Lock Screen
- Custom color palette in hyprlock/colors.conf
- Updated matugen template for color scheme generation

### 3. Terminal Configuration

#### Fish Shell
- Custom aliases for common operations
- Adjusted starship initialization path
- Modified sequence display behavior

#### Kitty Terminal
- Changed to Iosevka font
- Adjusted font size and opacity
- Transparency settings for visual consistency

### 4. Quickshell/QML Modules

#### New Features
- **Katakana Cheatsheet:** New learning tool (CheatsheetKatakana.qml + katakana.js)
- **Hyprland Config Panel:** Direct configuration from Quickshell (HyprlandConfig.qml)
- **Notification Utils:** JavaScript utilities for enhanced notification handling
- **Lock Screen Enhancement:** New LockContext.qml, noise.png texture

#### Modified Modules

**Common Modules:**
- Config.qml - Panel and palette toggles, AI/weeb policies, extensive widget configurations
- Directories.qml - Dynamic shell config name based on dark/light mode
- Enhanced widgets: DragManager, NotificationGroup, StyledComboBox, StyledListView, etc.

**ii Modules:**
- Bar: Multi-monitor support, conditional element visibility per monitor
- Background widgets: Streamlined clock implementation
- Cheatsheet: Enhanced with katakana support
- Lock: Improved context handling and visual effects
- Media Controls: UI refinements
- Overview: Search and widget improvements
- Sidebars: AI chat enhancements, todo widget updates
- Wallpaper Selector: Directory and selection improvements

**waffle Modules:**
- Action Center: Complete redesign with new components (BodyRectangle, FooterRectangle, etc.)
- Bar & Tasks: Multi-monitor enhancements
- Looks: Consolidated toolbar components (removed redundant W* toolbar files)
- Notification Center: Simplified animation handling
- Start Menu: Search and app grid improvements
- Task View: Workspace handling refinements

**Services:**
- AI: Updated API strategies (Gemini, Mistral, OpenAI)
- Brightness, HyprlandData, Network, Notifications, Wallpapers, Weather: Various improvements
- Removed: GlobalFocusGrab.qml (deprecated)

#### Scripts
- `apply-hyprland-config.sh` - New script for applying Hyprland config changes
- `switchwall.sh` - Updated wallpaper switching logic
- `thumbgen.py` - Thumbnail generation improvements

### 5. Removed Files
- **Icons:** 18 unused Fluent SVG icons (screenshot/camera/edit related)
- **QML Components:** 
  - Deprecated: IndexModel, ScreenshotAction, TempScreenshotProcess, ConfigSlider, DashedBorder
  - Clock components: ClockText, DigitalClock (consolidated)
  - Waffle toolbar: 6 toolbar component files (consolidated into Looks)
  - Waffle screen snip: 3 files (functionality moved)
  - Panel families: 3 loader files (refactored)
  - Notification popup: WaffleNotificationPopup.qml (redesigned)
- **Translations:** de_DE, id_ID, pt_BR (removed per upstream changes)
- **Patches:** hyprland-qtutils-private.patch (no longer needed)

### 6. System/Build Files
- Updated `.github/README.md`
- Fedora dependencies: Updated SPECS, feddeps.toml, install scripts
- Gentoo: Updated README and install scripts
- Build system: Updated functions.sh, subcmd scripts

## Validation Results

### Syntax Checks (All Passed ✓)
- Shell scripts: chewwallwa-mods.sh, autostart scripts, apply-hyprland-config.sh
- JSON files: config.json, config-light.json
- YAML files: base-espanso.yml
- JavaScript: notification_utils.js, katakana.js
- Python: thumbgen.py
- Hyprland configuration structure verified

### File Integrity
- All sourced Hyprland config files present and valid
- All required QML modules in place
- Scripts have correct permissions

## Important Notes

### User-Specific Configurations
The following configurations are **highly personalized** and users should review/modify them:

1. **Monitor Setup** (general.conf) - Configured for specific dual-monitor setup (DP-1 + HDMI-A-1)
2. **Keybinds** (keybinds.conf) - Extensively customized with submaps
3. **Opacity/Transparency** (custom/rules.conf) - App-specific settings
4. **Workspace Generation** (workspaces.conf) - Based on specific monitor layout
5. **Font** (kitty.conf) - Iosevka font (must be installed)

### Dependencies
Ensure the following are installed:
- Iosevka font (for kitty terminal)
- fcitx5 or ibus (if using input method features)
- espanso (if using text expansion)
- keyd (if using keyboard daemon)
- fastfetch (if using system info display)
- VLC (if using scratchpad autostart)

### Backup Files Excluded
The following .bak files from all-my-mods were intentionally **not** included:
- `dots/.config/hypr/custom/rules.conf.bak`
- `dots/.config/hypr/hyprland/general.conf.bak`
- `dots/.config/kitty/kitty.conf.bak`

These are backup files and should not be committed to version control.

## Testing Recommendations

Before deploying to production:

1. **Test Hyprland startup:** Ensure all config files load without errors
2. **Test Quickshell:** Verify all modules load and panels display correctly
3. **Test keybinds:** Verify critical keybinds work (especially Super key, submaps)
4. **Test multi-monitor:** If not using dual monitors, adjust workspaces.conf and general.conf
5. **Test applications:** Verify opacity rules work for kitty, dolphin, kate, etc.
6. **Test autostart:** Check VLC scratchpad and other exec commands

## Known Considerations

### Upstream Compatibility
- All changes maintain compatibility with the updated `clean` base
- Removed deprecated components align with upstream removals
- No conflicts with upstream structure

### Performance
- Blur is restricted to quickshell only for better performance
- Custom gap and border settings are optimized for the specific setup

### Customization
- The extensive keybind restructuring with submaps may require learning
- Some features depend on external tools (espanso, keyd, etc.)

## References
- Detailed change list: `dots-extra/changes.txt` (274 lines)
- Original branch: `all-my-mods` (commit: 1e67f4d)
- Base branch: `clean` (commit: 20ec771)

## Conclusion
All customizations from `all-my-mods` have been successfully adapted to the `clean` base. The configuration is ready for testing and deployment, with special attention needed for user-specific settings like monitor configuration and keybinds.
