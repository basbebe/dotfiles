#!/usr/bin/env sh

sketchybar --add item theme \
  --set theme script="$PLUGIN_DIR/theme_change.sh" \
  --add event theme_change \
  --subscribe theme theme_change
