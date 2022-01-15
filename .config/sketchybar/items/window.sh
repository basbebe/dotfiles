#!/usr/bin/env sh

sketchybar --add       item               window.yabai_status left                             \
           --set       window.yabai_status script="$PLUGIN_DIR/yabai_window.sh"                \
                                          icon.font="$FONT:Bold:16.0"                          \
                                          label.drawing=off                                    \
                                          updates=on                                           \
           --add event window_mode_change                                                      \
           --subscribe window.yabai_status front_app_switched window_mode_change mouse.clicked \
                                                                                               \
           --add       item               window.yabai_stack right                             \
           --set       window.yabai_stack script="$PLUGIN_DIR/stack.sh"                        \
                                          icon.font="$FONT:Bold:16.0"                          \
                                          updates=on                                           \
           --subscribe window.yabai_stack front_app_switched window_mode_change                \
                                                                                               \
           --clone     window.label       label_template                                       \
           --set       window.label       label=sys                                            \
                                          drawing=on                                           \
                                          script="$PLUGIN_DIR/window_title.sh"                 \
           --subscribe window.label       front_app_switched                                   \
                                                                                               \
           --add       bracket            window                                               \
                                          window.yabai_stack                                   \
                                          window.yabai_status                                  \
                                          window.label                                         \
                                                                                               \
           --set       window             background.drawing=on
