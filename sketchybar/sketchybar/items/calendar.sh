#!/usr/bin/env sh

sketchybar --add item     calendar right               \
           --set calendar update_freq=15               \
                          icon=cal                     \
                          icon.color=$LABEL_COLOR            \
                          icon.font="$FONT:Black:12.0" \
                          icon.padding_left=5         \
                          icon.padding_right=5         \
                          label.color=$LABEL_COLOR           \
                          label.padding_left=5        \
                          label.padding_right=5       \
                          width=140                    \
                          align=center                 \
                          script="$PLUGIN_DIR/time.sh" \
                          background.color=$ITEM_COLOR  \
                          background.height=23         \
                          background.corner_radius=$CORNER_RADIUS
sketchybar --add item calendar_logo right \
           --set calendar_logo icon=$CALENDAR \
                 icon.font="$FONT:Bold:16.0"  \
                 icon.color=$BLACK \
                 label.drawing=off \
                 background.color=$YELLOW \
                 background.height=23 \
                 background.corner_radius=$CORNER_RADIUS
