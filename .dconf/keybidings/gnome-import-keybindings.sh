#!/usr/bin/env sh

[ -d $PWD/gnome ] &&
    (
    dconf load /org/gnome/shell/keybindings/ < gnome/shell-keybindings.dconf;
    dconf load /org/gnome/mutter/keybindings/ < gnome/mutter-keybindings.dconf;
    dconf load /org/gnome/mutter/wayland/keybindings/ < gnome/mutter-wayland-keybindings.dconf;
    dconf load /org/gnome/desktop/wm/keybindings/ < gnome/desktop-wm-keybindings.dconf;
    dconf load /org/gnome/settings-daemon/plugins/media-keys/ < gnome/desktop-settings_daemon-plugins-media_keys.dconf;
    echo "Loaded."
    ) ||
    echo "Nothing to load."
