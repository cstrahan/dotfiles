#!/bin/sh

# TODO: look at https://github.com/derat/xsettingsd

export XCURSOR_PATH=~/.icons:~/.nix-profile/share/icons:/var/run/current-system/sw/share/icons:/usr/share/icons:/usr/share/pixmaps

# Initialize DBus
if [[ -z "$DBUS_SESSION_BUS_ADDRESS" ]] && command -v dbus-launch >/dev/null; then
  eval "$(dbus-launch --sh-syntax --exit-with-session)"
  export DBUS_SESSION_BUS_ADDRESS
fi

# Make key repeat sane.
xset r rate 220 50

# Use window compositor to fix tearing.
compton --config /dev/null --backend glx --paint-on-overlay --glx-no-stencil --vsync opengl-swc &

# Set default mouse cursor.
xsetroot -cursor_name left_ptr

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
