sketchybar --add item battery right \
           --set battery update_freq=3 \
		   				 icon.color=$BLACK \
						 icon.background.color=$GREEN \
						 icon.font="$FONT:Bold:16.0" \
						 icon.background.height=23 \
						 icon.background.padding_right=0 \
						 icon.background.corner_radius=9 \
                         icon.drawing=on \
                         script="~/.config/sketchybar/plugins/power.sh" \
                         background.color=$ITEM_COLOR \
                         background.padding_left=0  \
                         background.height=23        \
                         background.corner_radius=9
