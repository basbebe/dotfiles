#!/usr/bin/env sh

update() {
  # This is called for all other events
  WINDOW=$(yabai -m query --spaces --space)
  case "$(echo "$WINDOW" | jq -rc '.type')" in
    "bsp")
      icon="􀛧"
      ;;
    "stack")
      icon="􀏮"
      ;;
    "float")
      icon="􀚅"
      ;;
  esac
  sketchybar --set $NAME icon=$icon
}

mouse_clicked() {
  yabai -m space --layout stack
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
