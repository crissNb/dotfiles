sketchybar -m --add item network_up right \
              --set network_up label.font="$FONT:Bold:8.0" \
                               icon.font="$FONT:Bold:8.0" \
                               icon=􀆇 \
                               icon.highlight_color=$BLUE \
                               y_offset=5 \
                               width=0 \
                               update_freq=1 \
                               script="$PLUGIN_DIR/network.sh" \
\
              --add item network_down right \
              --set network_down label.font="$FONT:Bold:8.0" \
                                 icon.font="$FONT:Bold:8.0" \
                                 icon=􀆈 \
                                 icon.highlight_color=$YELLOW \
                                 y_offset=-5 \
                                 update_freq=1\
