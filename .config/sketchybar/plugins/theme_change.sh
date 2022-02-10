#!/usr/bin/env sh

# shellcheck source=~/.local/bin/get-colortheme
. ~/.local/bin/get-colortheme

sketchybar --bar color=0xff"$COLOR_BG" \
  --set '/.*/' icon.color=0xff"$COLOR_FG" \
  '/.*/' icon.highlight_color=0xff"$COLOR_FG_BLUE" \
  '/.*/' label.color=0xff"$COLOR_FG" \
  '/.*/' background.color=0xff"$COLOR_BG" \
  '/.*/' icon.background.color=0xff"$COLOR_BG" \
  '/.*/' label.background.color=0xff"$COLOR_BG" \
  '/.*/' popup.background.color=0xff"$COLOR_BG"
