#!/bin/sh

# TODO: look at https://github.com/derat/xsettingsd

export XCURSOR_PATH=~/.icons:~/.nix-profile/share/icons:/var/run/current-system/sw/share/icons:/usr/share/icons:/usr/share/pixmaps

if [[ -z "$DBUS_SESSION_BUS_ADDRESS" ]] && command -v dbus-launch >/dev/null; then
  eval "$(dbus-launch --sh-syntax --exit-with-session)"
  export DBUS_SESSION_BUS_ADDRESS
fi

xset r rate 220 50

xsetroot -cursor_name left_ptr
#gsettings set org.gnome.desktop.interface cursor-size 48
#gsettings set org.gnome.desktop.interface cursor-theme Vanilla-DMZ-AA

taffybar &
dropbox &
#xautolock -time 1 -locker slimlock &

if command -v xmonad >/dev/null; then
  xmonad
elif command -v urxvt >/dev/null; then
  urxvt
elif command -v xterm >/dev/null; then
  xterm
else
  echo "could not find a suitable window manager" 1>&2
  exit 1
fi
