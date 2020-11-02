#!/bin/sh

# X11 related tools
nitrogen --restore

[ -n "ps -C picom" ] || \
  picom --config ~/.local/share/dwm/picom.conf

# System utilities / applets
[ -n "pgrep polkit-gnome" ] || \
  /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

[ -n "ps -C udiskie" ] || \
  udiskie -c ~/.config/udiskie/config.yml &

[ -n "ps -C blueman-applet" ] || \
  blueman-applet &

[ -n "ps -C nextcloud" ] || \
  nextcloud --background

xscreensaver -no-splash &
