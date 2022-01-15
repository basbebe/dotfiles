#!/usr/bin/env bash

update() {
  QUERY=$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null | jq -rc '.SPBluetoothDataType[0].devices_list[]? | select( .[] | .device_minorType == "Headphones" and .device_connected =="Yes")')
  DEVICE=$(echo $QUERY | jq -rc 'keys[]')

  echo $DEVICE

  if [ "$DEVICE" = "" ]; then
    sketchybar --set $NAME drawing=off
  elif [[ "$DEVICE" = AirPods\ Pro* ]]; then
    sketchybar --set $NAME drawing=on icon="􀪷" label=""
  else
    sketchybar --set $NAME drawing=on icon="􀑈" label="$DEVICE"
  fi
}

case "$SENDER" in
  "mouse.entered")
    sketchybar --set $NAME icon.background.drawing=on icon.highlight=on label.drawing=on
    ;;
  "mouse.exited")
    sketchybar --set $NAME icon.background.drawing=off icon.highlight=off label.drawing=off
    ;;
  *)
    update
    ;;
esac
