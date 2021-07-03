#!/usr/bin/env sh

number_of_windows=$(yabai -m query --windows --space | /usr/local/bin/jq 'length')
number_of_stacked=$(yabai -m query --windows --space | /usr/local/bin/jq -c 'map(select(."stack-index" != 0)) | length')
currspace=$(yabai -m query --spaces --space | /usr/local/bin/jq '.index')

padding=8
spadding=40

[[ "$number_of_windows" -eq 1 ]] && padding=0
[[ "$number_of_stacked" = 0 ]] && spadding=$padding

yabai -m config --space "$currspace" top_padding $padding
yabai -m config --space "$currspace" bottom_padding $padding
yabai -m config --space "$currspace" left_padding $spadding
yabai -m config --space "$currspace" right_padding $spadding
# yabai -m config --space "$currspace" window_gap $padding
