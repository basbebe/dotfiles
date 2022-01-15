#!/usr/bin/env sh

number_of_stacked=$(yabai -m query --windows --space | jq -c 'map(select(."visible" == 1 and ."stack-index" != 0)) | length')
currspace=$(yabai -m query --spaces --space | jq '.index')

padding=4
spadding=35

[[ "$number_of_stacked" = 0 ]] && spadding=$padding

yabai -m config --space "$currspace" top_padding $padding
yabai -m config --space "$currspace" bottom_padding $padding
yabai -m config --space "$currspace" left_padding $spadding
yabai -m config --space "$currspace" right_padding $spadding
