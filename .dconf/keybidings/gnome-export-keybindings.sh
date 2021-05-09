#!/usr/bin/env sh

[ -d $PWD/gnome ] || mkdir -v $PWD/gnome

dconf dump /org/gnome/shell/keybindings/ > gnome/shell-keybindings.dconf
dconf dump /org/gnome/mutter/keybindings/ > gnome/mutter-keybindings.dconf
dconf dump /org/gnome/mutter/wayland/keybindings/ > gnome/mutter-wayland-keybindings.dconf
dconf dump /org/gnome/desktop/wm/keybindings/ > gnome/desktop-wm-keybindings.dconf
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > gnome/desktop-settings_daemon-plugins-media_keys.dconf
