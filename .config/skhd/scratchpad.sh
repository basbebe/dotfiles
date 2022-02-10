#!/bin/sh

kitty_cmd="/usr/local/bin/kitty \
  --config=$HOME/.config/kitty/kitty.conf
  --config=$HOME/.config/kitty/themes/gruvbox-$(fish -c 'echo $OS_THEME').conf \
  --override macos_hide_from_tasks=yes \
  --single-instance \
  --wait-for-single-instance-window-close \
  --instance-group=scratchpad \
  --title=$SCRATCHPAD_TITLE \
  --directory=$HOME"

scratchpad_id=$(yabai -m query --windows | jq --arg title "$SCRATCHPAD_TITLE" -rc '[.[] | select(.title==$title)][0].id | @sh')

is_focused() {
  [ "$(yabai -m query --windows --window "$1" | jq -rc '."has-focus" | @sh')" = "true" ]
}
is_minimized() {
  [ "$(yabai -m query --windows --window "$1" | jq -rc '."is-minimized" | @sh')" = "true" ]
}

echo $scratchpad_id

if [ "$scratchpad_id" = "null" ]; then
  (SHELL=/usr/local/bin/fish $kitty_cmd "$@" &)
else
  current_space=$(yabai -m query --spaces --space | jq -rc '.index | @sh')
  if is_minimized "$scratchpad_id"; then
    yabai -m window "$scratchpad_id" --space "$current_space"
    yabai -m window --focus "$scratchpad_id"
  else
    if is_focused "$scratchpad_id"; then
      yabai -m window "$scratchpad_id" --minimize
    else
      yabai -m window --focus "$scratchpad_id"
    fi
  fi
fi
