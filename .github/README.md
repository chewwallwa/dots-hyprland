<div align="center">
    <h1>【 ii mods by Chewwallwa 】</h1>
    <h3></h3>
</div>

<div align="center"> 


</div>

<details> 
  <summary>Installation of original ii</summary>

   - _If you're new to Linux and decide to use Hyprland, you're in for a tough ride._
   - Just run `bash <(curl -s https://ii.clsty.link/get)`
     - Or, clone this repo and run `./setup install`
     - See [document](https://ii.clsty.link/en/ii-qs/01setup/) for details.
   - **Default keybinds**: Should be somewhat familiar to Windows or GNOME users. Important ones:
     - `Super`+`/` = keybind list
     - `Super`+`Enter` = terminal
     - If for whatever reason the keybind list widget does not work, here's an image:
     <img width="1412" height="828" alt="image" src="https://github.com/user-attachments/assets/8f7bd216-9e03-47e3-8709-0008772a4133" />


</details>

<details> 
  <summary>Installation of my mods</summary>

I would recommend installing the @end_4 dotfiles (updated) and using the script to replace some files that give it the appearance I have configured. However, this may stop working over time, so you can also (without the above script) download my complete dotfiles for full compatibility between files.   

```bash
curl -s "[https://raw.githubusercontent.com/chewwallwa/dots-hyprland/all-my-mods/chewwallwa-mods.sh](https://raw.githubusercontent.com/chewwallwa/dots-hyprland/all-my-mods/chewwallwa-mods.sh)" | bash
```

My submap keybinds:

<img width="1165" height="596" alt="image" src="https://github.com/user-attachments/assets/19c885e9-7c0b-4112-99f6-053716fb1aee" />

</details>

<details>
    <summary>Discord</summary>
        <a href="https://discord.gg/GtdRBXgMwq"> Server link </a> | I hope this provides a friendlier environment for support without needing me to personally accept every friend request/DM. For real issues, prefer GitHub
</details>

Check [@end_4/dots-hyprland/](https://github.com/end-4/dots-hyprland)






<div align="center">
    <h2>• My mods - 16-12-2025 - 19:28 GTM UTC+0•</h2>
    <h3></h3>
</div>

- **System ⚙️**: Hyprland GUI Config • Independent Light/Dark Themes • Better Multi-screen Support.
- **Workflow 🖥️**: Ergonomic Submap keybinds • Centered Overview (with 9 wrkspces/screen) • Worksets & Autostart Scripts.
- **Visuals 🎨**: Cool Lock Screen • Wallpaper Rotation (incl. Lock).
- **Extra ✨**: Simple Fastfetch Mod • Disabled AI/Anime • Katakana Cheatshee.

Preview: 

[Video on r/Linuxporn](https://www.reddit.com/r/LinuxPorn/comments/1poce9a/hyprland_my_ii_mods/)

https://github.com/user-attachments/assets/1fc9260e-9705-4a08-ae57-4f6b2e27bd80

<img width="1916" height="1078" alt="image" src="https://github.com/user-attachments/assets/792fccac-6351-4ca3-9348-492ff3991ea9" />
<img width="1918" height="1079" alt="image" src="https://github.com/user-attachments/assets/996f4172-e35b-4656-a180-c0f2d1d1fac3" />
<img width="1851" height="988" alt="image" src="https://github.com/user-attachments/assets/d678da5e-d533-41fa-89c1-10aabdf340df" />


<details>
    <summary>Changelog (by feature)</summary>
    
---

**VLC scratchpad, transparency, and automation**
- `dots/.config/hypr/custom/execs.conf` (l:4-6)
- `dots/.config/hypr/custom/rules.conf` (l:23-32)
- `dots/.config/hypr/custom/rules.conf.bak` (l:23-32)
- `dots/.config/hypr/hyprland/keybinds.conf` (special binds — various, e.g., submaps and binds Super+Q/W/S)
- `dots/.config/quickshell/ii/modules/common/Config.qml` (vars, integration, l:82-194)
- `dots/.config/quickshell/ii/modules/settings/HyprlandConfig.qml` (rule blocks)
- `dots/.config/kitty/kitty.conf` (opacity, visual integration, l:1-17)
- `dots/.config/hypr/hyprland/rules.conf` (l:23-32)

---

**Variable transparency per app (kitty, dolphin, kate, VLC, Bitwarden, BTOP, pavucontrol)**
- `dots/.config/hypr/custom/rules.conf` (l:1-7, 9-21, 23-42)
- `dots/.config/hypr/custom/rules.conf.bak` (whole file)
- `dots/.config/hypr/hyprland/general.conf` (l:20-22, 49-87)
- `dots/.config/quickshell/ii/modules/common/Config.qml` (l:82-194, 644-688)
- `dots/.config/quickshell/ii/modules/settings/HyprlandConfig.qml`
- `dots/.config/kitty/kitty.conf` (opacity and comments, l:7-17)
- `dots/.config/kitty/kitty.conf.bak` (automatic backup)
- `dots/.config/hypr/hyprland/rules.conf` (l:1-16, 8-11, 23-42)

---

**BTOP, Bitwarden, Pavucontrol-qt: float, size, workspace**
- `dots/.config/hypr/custom/rules.conf` (l:33-42)
- `dots/.config/hypr/custom/rules.conf.bak` (l:33-42)
- `dots/.config/quickshell/ii/modules/settings/HyprlandConfig.qml`
- `dots/.config/hypr/hyprland/rules.conf` (l:33-42)

---

**Custom Lockscreen: keyring, fingerprint, blur, bypass**
- `dots/.config/quickshell/ii/modules/ii/lock/Lock.qml` (almost everything: l:1-135 especially)
- `dots/.config/quickshell/ii/modules/ii/lock/LockSurface.qml` (l:1-314, practically whole file)
- `dots/.config/quickshell/ii/modules/ii/lock/LockContext.qml` (new file)
- `dots/.config/quickshell/ii/modules/ii/lock/PasswordChars.qml` (l:30-32)
- `dots/.config/quickshell/ii/modules/ii/lock/noise.png` (new)
- `dots/.config/quickshell/ii/modules/ii/lock/pam/fprintd.conf` (new)

---

**Katakana cheatsheet, dynamic tabs, periodic table**
- `dots/.config/quickshell/ii/modules/ii/cheatsheet/katakana.js` (new)
- `dots/.config/quickshell/ii/modules/ii/cheatsheet/CheatsheetKatakana.qml` (new)
- `dots/.config/quickshell/ii/modules/ii/cheatsheet/Cheatsheet.qml` (l:13-82, 134-176, 161-176)
- `dots/.config/quickshell/ii/modules/ii/cheatsheet/CheatsheetKeybinds.qml` (l:7, 119)
- `dots/.config/quickshell/ii/modules/settings/InterfaceConfig.qml` (l:100-131)

---

**Keybinds, submaps, automation shortcuts/WM cycle**
- `dots/.config/hypr/hyprland/keybinds.conf` (major part: l:1-381, 390-482)
- `dots/.config/quickshell/ii/modules/ii/cheatsheet/CheatsheetKeybinds.qml` (l:7, 119)
- `dots/.config/quickshell/ii/modules/ii/cheatsheet/Cheatsheet.qml` (in conjunction with other features l:13-176)

---

**Wallpaper automation: rotation, dark/light, apply**
- `dots/.config/quickshell/ii/scripts/colors/switchwall.sh` (l:8-19, 68, 77, 331-377)
- `dots/.config/quickshell/ii/scripts/hyprland/apply-hyprland-config.sh` (new file)
- `dots/.config/quickshell/ii/services/Wallpapers.qml` (l:79-143)
- `dots/.config/quickshell/ii/settings.qml` (l:33-37)
- `dots/.config/quickshell/ii/modules/settings/QuickConfig.qml` (l:217-243)

---

**Multi-monitor workspaces & monitor configs**
- `dots/.config/hypr/hyprland/general.conf` (l:1-4, 20-22, 49-87, 119-124)
- `dots/.config/hypr/workspaces.conf` (l:1-24, practically whole file/new)
- `dots/.config/hypr/hyprland/execs.conf` (l:1-20, extra post-login execs)
- `dots/.config/quickshell/ii/modules/settings/HyprlandConfig.qml`
- `dots/.config/hypr/hyprland/rules.conf` (l:16-22, floating & centering)
- `dots/.config/hypr/hyprland/env.conf` (l:1-11, l:17-23; input methods, monitor tweaks)

---

**Kitty: custom font, backup, apply-hyprland-config.sh integration**
- `dots/.config/kitty/kitty.conf` (l:1-43 changed)
- `dots/.config/kitty/kitty.conf.bak` (new file)
- `dots/.config/quickshell/ii/scripts/hyprland/apply-hyprland-config.sh` (l:111-146)

---

**Top bar, Action Center widgets, dynamic panel**
- `dots/.config/quickshell/ii/modules/ii/bar/BarContent.qml` (l:17-115, 153-339)
- `dots/.config/quickshell/ii/modules/waffle/actionCenter/BodyRectangle.qml` (new)
- `dots/.config/quickshell/ii/modules/waffle/actionCenter/FooterMoreButton.qml` (new)
- `dots/.config/quickshell/ii/modules/waffle/actionCenter/FooterRectangle.qml` (new)
- `dots/.config/quickshell/ii/modules/waffle/actionCenter/PageColumn.qml` (new)
- `dots/.config/quickshell/ii/modules/waffle/actionCenter/Separator.qml` (new)
- `dots/.config/quickshell/ii/modules/settings/BarConfig.qml` (l:323-329)

---

**Appearance/themes, palette, fine-tuning**
- `dots/.config/hypr/hyprlock/colors.conf` (l:1-13)
- `dots/.config/quickshell/ii/modules/common/Config.qml` (l:82-194, 244-644)
- `dots/.config/quickshell/ii/modules/common/Directories.qml` (l:33, 48-50)
- `dots/.config/hypr/hyprland/general.conf` (l:20-22, 49-87)
- `dots/.config/quickshell/ii/settings.qml` (l:13-47, visual integration)
- `dots/.config/quickshell/ii/shell.qml` (l:6-133)
- `dots/.config/quickshell/ii/welcome.qml` (l:278-338)

---

**Hyprland configs integrated, pages, and QML**
- `dots/.config/quickshell/ii/settings.qml` (l:33-37)
- `dots/.config/quickshell/ii/modules/settings/HyprlandConfig.qml` (whole file)
- `dots/.config/quickshell/ii/modules/settings/InterfaceConfig.qml` (l:100-131)
- `dots/.config/quickshell/ii/modules/settings/GeneralConfig.qml` (l:191-277)
- `dots/.config/quickshell/ii/modules/settings/QuickConfig.qml` (l:82-115, 217-243)

---

**Utility Widgets/Helpers and custom scripts**
- `dots/.config/quickshell/ii/modules/common/widgets/notification_utils.js` (new file)
- `dots/.config/quickshell/ii/modules/common/Directories.qml` (l:33, 48-50)
- `dots/.config/quickshell/ii/services/Wallpapers.qml` (l:79-143)
- `dots/.config/quickshell/ii/scripts/colors/switchwall.sh` (auxiliary interactions, l:8-19, 68, 77, 331-377)

---

**Shell/System Core**
- `dots/.config/fish/config.fish` (l:13-24, aliases and initialization)

---

**Others (backs, helpers, backup configs)**
- `dots/.config/hypr/custom/rules.conf.bak` (whole file)
- `dots/.config/hypr/hyprland/general.conf.bak` (whole file)
- `dots/.config/kitty/kitty.conf.bak` (whole file)

---

</details>

<details>
    <summary>Changelog (file by file)</summary>
`https://github.com/chewwallwa/dots-hyprland/blob/all-my-mods/dots-extra/changes.txt`
</details>
