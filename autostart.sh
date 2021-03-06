#!/bin/sh

# X11 related tools
nitrogen --restore

[ -n "$(ps -C picom --no-headers)" ] || \
  picom --config ~/.local/share/dwm/picom.conf &

# System utilities / applets
[ -e ~/.config/polybar/launch.sh ] && ~/.config/polybar/launch.sh

[ -n "$(pgrep dunst)" ] || \
  dunst -conf ~/.config/dunst/dunstrc &

[ -n "$(pgrep polkit-gnome)" ] || \
  /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

[ -n "$(ps -C udiskie --no-headers)" ] || \
  udiskie -c ~/.config/udiskie/config.yml &

[ -n "$(ps -C blueman-applet --no-headers)" ] || \
  blueman-applet &

[ -n "$(ps -C nextcloud --no-headers)" ] || \
  nextcloud --background &

[ -n "$(pgrep gnome-keyring)" ] || \
  gnome-keyring-daemon --start --components=secrets

[ -n "$(command -v numlockx)" ] && numlockx on

