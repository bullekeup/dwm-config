#!/bin/sh

SRCDIR="$(dirname $0)"
cd ${SRCDIR}

FORCE_INSTALL=0;
while [ $# -gt 0 ]; do
  case $1 in
    --update | -u | --force ) FORCE_INSTALL=1; shift;;
    * ) shift;;
  esac
done

if [ ${FORCE_INSTALL} -eq 1 ] || [ ! -e "${HOME}/.local/share/dwm" ]; then

  [ -e "${HOME}/.local/share/dwm" ] && rm -Rf "${HOME}/.local/share/dwm"

  install -d ~/.local/share/dwm

  install -m644 ./picom.conf ~/.local/share/dwm/

  install -m644 ./launcher.rasi ~/.local/share/dwm/
  install -m644 ./colors.rasi ~/.local/share/dwm/
  install -m644 ./colors_light.rasi ~/.local/share/dwm/
  install -m644 ./colors_dark.rasi ~/.local/share/dwm/

  install -m755 ./autostart.sh ~/.local/share/dwm/

  install -m755 ./launcher ~/.local/share/dwm/
fi

cd -
