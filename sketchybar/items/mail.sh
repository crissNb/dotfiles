#!/usr/bin/env sh

sketchybar --add item mail right                   \
           --set mail update_freq=60              \
					   icon=$MAIL \
					   icon.font="$FONT:Bold:16.0"  \
					   icon.color=$BLACK \
					   icon.background.color=$SKY \
					   icon.background.height=23 \
					   icon.background.corner_radius=9 \
					   icon.drawing=on \
                      script="$PLUGIN_DIR/mail.sh" \
                      label=!                      \
					  label.padding_left=20 \
                      background.padding_left=0  \
                      background.padding_right=0  \
                      background.color=$ITEM_COLOR  \
                      background.height=23 \
                      background.corner_radius=9
