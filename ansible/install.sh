#!/usr/bin/env bash
#tempfile=$(mktemp)
#curl -o $tempfile https://raw.githubusercontent.com/wezterm/wezterm/refs/heads/main/termwiz/data/wezterm.terminfo

tempfile=roles/dev_user/files/xterm-ghostty.terminfo

sudo tic -x -o /usr/local/share/terminfo $tempfile


#rm $tempfile
