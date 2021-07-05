#!/bin/sh

kitty_cmd="kitty --title $SCRATCHPAD_TITLE \
  --directory $HOME
  --override macos_hide_from_tasks=yes"
  # --single-instance \
  # --instance-group=scratchpad"

scratchpad_id=$(yabai -m query --windows --space | jq --arg title "$SCRATCHPAD_TITLE" -c '.[] | select(.title==$title).id')

if [[ "$scratchpad_id" -lt 1 ]]; then
  $kitty_cmd $@
else
  is_minimized=$(yabai -m query --windows --window "$scratchpad_id" | jq '.minimized')
  current_space=$(yabai -m query --spaces --space | jq '.index')
  if [[ "$is_minimized" -eq 1 ]]; then
    yabai -m window "$scratchpad_id" --deminimize
    yabai -m window --focus "$scratchpad_id"
  else
    yabai -m window "$scratchpad_id" --minimize
  fi
fi

