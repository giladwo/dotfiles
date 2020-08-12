#!/usr/bin/bash

xsetroot -solid midnightblue
feh --bg-scale "$HOME/.xmonad/background"

if [ -z $(pgrep xscreensaver) ]; then
    xscreensaver -no-splash &
fi

gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

if [ ! -f "$HOME/.config/touchpadxlibinputrc" ]; then
    cp "$HOME/.{xmonad,config}/touchpadxlibinputrc"
fi
