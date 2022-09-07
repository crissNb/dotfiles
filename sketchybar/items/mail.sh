#!/usr/bin/env sh

sketchybar --add item mail right                   \
           --set mail update_freq=120              \
                      icon.drawing=off             \
                      script="$PLUGIN_DIR/mail.sh" \
                      label=!                      \
                      width=30                 \
                      background.padding_left=0  \
                      background.color=$ITEM_COLOR  \
                      background.height=23 \
                      background.corner_radius=$CORNER_RADIUS
sketchybar --add item mail_logo right \
           --set mail_logo icon=$MAIL \
                 icon.font="$FONT:Bold:16.0"  \
                 icon.color=$BLACK \
                 label.drawing=off \
                 background.color=$SKY \
                 background.height=23 \
                 background.corner_radius=$CORNER_RADIUS
