#!/bin/sh
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin/:$PATH"
export PATH="$PATH:$XDG_DATA_HOME/cargo/bin/"
export PATH="$PATH:$HOME/.bun/bin/"
export PATH="$PATH:$HOME/Apps/flutter/bin/"
export PATH="$PATH:$HOME/.jdks/openjdk-19.0.2/bin"
export PATH="$PATH:$XDG_DATA_HOME/npm/bin/"
export PATH="$PATH:$HOME/.local/bin/"
export PATH="$PATH:$HOME/.local/bin/snippets/"
export PATH="$PATH:./node_modules/.bin/"

# export QT_QPA_PLATFORM=wayland
# export XDG_CURRENT_DESKTOP=sway
# export XDG_SESSION_DESKTOP=sway
# export XDG_CURRENT_SESSION_TYPE=wayland
export LC_ALL="en_US.UTF-8"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# xrdb ~/.config/X11/Xresources &
# mpv --no-video ~/Music/DesktopSounds/Windows\ Vista\ Startup.mp3 &
# mako &
# picom &

# xinput set-prop "PNP0C50:01 0911:5288 Touchpad" "libinput Tapping Enabled" 1 &
# xinput set-prop "PNP0C50:01 0911:5288 Touchpad" "libinput Middle Emulation Enabled" 1 &
# xinput set-prop "PNP0C50:01 0911:5288 Touchpad" "libinput Horizontal Scroll Enabled" 1 &
# xinput set-prop "PNP0C50:01 0911:5288 Touchpad" "libinput Scrolling Pixel Distance" 25 &

# emacs --daemon &
# gammastep &
# lxpolkit &
# setxkbmap -option ctrl:swapcaps &
# xset r rate 500 50 &
# xset +dpms &
# xset s on &
# sh ~/.fehbg &

# volumeicon & sleep
# nm-applet & sleep 1
# cbatticon & sleep 1
