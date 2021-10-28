#!/bin/sh

kitty_cmd="kitty \
  --config="$HOME/.config/kitty/kitty.conf" \
  --config="$HOME/.config/kitty/themes/gruvbox-$(fish -c 'echo $OS_THEME').conf"
  --override macos_hide_from_tasks=yes \
  --single-instance \
  --instance-group=scratchpad \
  --listen-on=unix:/tmp/kitty_listen_scratchpad"

kitty_launch="kitty @ --to=unix:/tmp/kitty_listen_scratchpad \
  launch \
  --env SHELL=/usr/local/bin/fish \
  --title=$SCRATCHPAD_TITLE \
  --cwd=$HOME \
  --type=os-window"

scratchpad_id=$(yabai -m query --windows | jq --arg title "$SCRATCHPAD_TITLE" -c '[.[] | select(.title==$title).id'][0])

is_focused()
{
  [[ $(yabai -m query --windows --window $1 | jq '.focused') -eq  1 ]]
}
is_minimized()
{
  [[ $(yabai -m query --windows --window $1 | jq '.minimized') -eq 1 ]]
}

if [[ "$scratchpad_id" -lt 1 ]]; then
  $kitty_launch "${@}" || \
  $kitty_cmd $kitty_launch "${@}"
else
  current_space=$(yabai -m query --spaces --space | jq '.index')
  if is_minimized $scratchpad_id ; then
    yabai -m window "$scratchpad_id" --space "$current_space"
    yabai -m window --focus "$scratchpad_id"
  else
    if is_focused $scratchpad_id ; then
      yabai -m window "$scratchpad_id" --minimize
    else
      yabai -m window --focus "$scratchpad_id"
    fi
  fi
fi

