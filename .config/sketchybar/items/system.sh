#!/usr/bin/env sh

sketchybar --add       item               system.keyboard_layout right                              \
           --set       system.keyboard_layout script="$PLUGIN_DIR/keyboard_layout.sh"               \
                                          icon="􀇳"                                                  \
           --add       event              input_change AppleSelectedInputSourcesChangedNotification \
           --subscribe system.keyboard_layout input_change                                          \
                                                                                                    \
           --add       event              bluetooth_change "com.apple.bluetooth.status"             \
                                                                                                    \
           --add       item headphones    right                                                     \
           --set       headphones         icon=""                                                   \
                                          drawing=off                                               \
                                          background.padding_right=1                                \
                                          background.padding_left=4                                 \
                                          script="$PLUGIN_DIR/ble_headset.sh"                       \
           --subscribe headphones         bluetooth_change                                          \
                                                                                                    \
           --add       item               system.mic right                                          \
           --set       system.mic         update_freq=100                                           \
                                          label.drawing=off                                         \
                                          script="$PLUGIN_DIR/mic.sh"                               \
                                          click_script="$PLUGIN_DIR/mic_click.sh"                   \
                                                                                                    \
           --add       item               system.caffeinate right                                   \
           --set       system.caffeinate  update_freq=100                                           \
                                          icon=$LOADING                                             \
                                          label.drawing=off                                         \
                                          script="$PLUGIN_DIR/caffeinate.sh"                        \
           --subscribe system.caffeinate  mouse.clicked                                             \
                                                                                                    \
           --add       bracket            system                                                    \
                                          system.keyboard_layout                                    \
                                          system.mic                                                \
                                          system.caffeinate                                         \
                                                                                                    \
           --set       system             background.drawing=on
