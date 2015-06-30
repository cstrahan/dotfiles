#!/bin/sh

if [[ -z "$DBUS_SESSION_BUS_ADDRESS" ]] && command -v dbus-launch >/dev/null; then
  eval "$(dbus-launch --sh-syntax --exit-with-session)"
  export DBUS_SESSION_BUS_ADDRESS
fi

xset r rate 220 50

taffybar &

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
