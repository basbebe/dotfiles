#!/usr/bin/env sh

update() {
  # This is called for all other events
  WINDOW=$(yabai -m query --windows --window)
  read -r floating split parent fullscreen sticky <<<$(echo "$WINDOW" | jq -rc '.["is-floating", "split-type", "has-parent-zoom", "has-fullscreen-zoom", "is-sticky"]')

  if [[ $floating == "true" ]]; then
    icon="􀶣"
  elif [[ $parent == "true" ]]; then
    icon="􁈔"
  elif [[ $fullscreen == "true" ]]; then
    icon="􀏒"
  elif [[ $split == "vertical" ]]; then
    icon="􀧉"
  elif [[ $split == "horizontal" ]]; then
    icon="􀧋"
  else
    icon="􀏄"
  fi

  sketchybar --set $NAME icon=$icon
}

mouse_clicked() {
  yabai -m window --toggle float
  update
}

mouse_entered() {
  sketchybar --set $NAME background.drawing=on
}

mouse_exited() {
  sketchybar --set $NAME background.drawing=off
}

case "$SENDER" in
  "mouse.entered")
    mouse_entered
    ;;
  "mouse.exited")
    mouse_exited
    ;;
  "mouse.clicked")
    mouse_clicked
    ;;
  *)
    update
    ;;
esac
