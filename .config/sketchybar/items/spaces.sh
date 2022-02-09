#!/usr/bin/env sh

sketchybar --add item            space_mode left                                \
           --set space_mode      script="$PLUGIN_DIR/yabai_space.sh"            \
                                 icon.font="$FONT:Bold:16.0"                    \
                                 label.drawing=off                              \
                                 updates=on                                     \
           --add event           space_mode_change                              \
           --subscribe space_mode space_change space_mode_change                \
                                                                                \
           --clone space_label_template label_template                          \
           --add space          space_template left                             \
           --set space_template icon.highlight_color=0xff9dd274                 \
                                label.drawing=off                               \
                                drawing=off                                     \
                                updates=on                                      \
                                associated_display=1                            \
                                label.font="$FONT:Black:13.0"                   \
                                icon.font="$FONT:Bold:17.0"                     \
                                script="$PLUGIN_DIR/space.sh"                     \
                                click_script="$SPACE_CLICK_SCRIPT"              \
                                                                                \
           --add item           yabai_spaces left                               \
           --set yabai_spaces   drawing=off                                     \
                                updates=on                                      \
                                script="$PLUGIN_DIR/yabai_spaces.sh"              \
           --add event          display_number_changed                          \
           --add event          space_number_changed                            \
           --subscribe yabai_spaces display_number_changed space_number_changed \
                                                                                \
           --clone space_separator sep_template                                 \
           --set space_separator drawing=on                                     \
