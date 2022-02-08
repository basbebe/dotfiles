#!/usr/bin/env bash

update() {
  QUERY=$(system_profiler SPBluetoothDataType -json -detailLevel basic 2>/dev/null | jq -rc '.SPBluetoothDataType[0].devices_list[]? | select( .[] | .device_minorType == "Headphones" and .device_connected =="Yes")')
  DEVICE=$(echo $QUERY | jq -rc 'keys[]')

  echo $DEVICE

  if [ "$DEVICE" = "" ]; then
    sketchybar --set $NAME drawing=off
  elif [[ "$DEVICE" = AirPods\ Pro* ]]; then
    # Left
    LEFT="$(echo $QUERY | jq -rc '.[] | .device_batteryLevelLeft' | head -n1 | cut -d '%' -f1)"

    # Right
    RIGHT="$(echo $QUERY | jq -rc '.[] | .device_batteryLevelRight' | head -n1 | cut -d '%' -f1)"

    # Case
    CASE="$(echo $QUERY | jq -rc '.[] | .device_batteryLevelCase' | head -n1 | cut -d '%' -f1)"

    if [ $LEFT = 0 ]; then
      LEFT="-"
    fi

    if [ $RIGHT = 0 ]; then
      RIGHT="-"
    fi

    if [ $CASE = 0 ]; then
      CASE="-"
    fi
    sketchybar --set $NAME drawing=on icon="􀪷" label="$LEFT $RIGHT $CASE"
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
