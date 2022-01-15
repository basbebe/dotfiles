#!/usr/bin/env sh

sketchybar --add       item               calendar.time right                           \
           --set       calendar.time      update_freq=2                                 \
                                          icon.drawing=off                              \
                                          label.padding_right=20                        \
                                          script="$PLUGIN_DIR/time.sh"                  \
                                                                                        \
           --clone     calendar.date      label_template                                \
           --set       calendar.date      update_freq=60                                \
                                          position=right                                \
                                          label=cal                                     \
                                          drawing=on                                    \
                                          label.color=$BAR_COLOR                        \
                                          background.color=$LABEL_COLOR                 \
                                          background.padding_right=0                    \
                                          background.height=18                          \
                                          script="$PLUGIN_DIR/date.sh"                  \
                                                                                        \
           --add       bracket            calendar                                      \
                                          calendar.time                                 \
                                          calendar.date                                 \
                                                                                        \
           --set       calendar           background.drawing=on
