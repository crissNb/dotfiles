#!/usr/bin/env sh
source "$HOME/.config/sketchybar/dynamic_island_settings.sh"
source "$HOME/.config/sketchybar/plugins/dynamic_island/islands/music/music_island_settings.sh"

# add
sketchybar --add item	island.resume_text popup.island \
		   --set island.resume_text	label.color=$TRANSPARENT_LABEL \
									label.padding_right=0 	\
									label.font="$FONT:Bold:11.0" \
									label.y_offset=-20		\
									background.padding_left=0 \
									background.padding_right=0 \
									width=30			\
		   --add item island.resume_bar popup.island \
		   --set island.resume_bar width=$RESUME_EXPAND_SIZE \
								   background.height=$DEFAULT_HEIGHT \
								   background.color=$PITCH_BLACK \
								   background.border_color=$PITCH_BLACK \
								   background.corner_radius=$DEFAULT_CORNER_RADIUS \
								   background.padding_left=0 \
								   background.padding_right=0 \
								   background.y_offset=0 \
								   background.shadow.drawing=off \
		   --set island		popup.drawing=true \
							background.drawing=false \
							popup.horizontal=on
if [[ $1 == 0 ]]; then
	# paused
	sketchybar --set island.resume_text label="Paused" \
					 					label.padding_left=0
else
	# resume
	sketchybar --set island.resume_text label="Resumed" \
					 					label.padding_left=235
fi

# animate
sketchybar --animate sin 20 --set island.resume_bar width=$RESUME_SQUISH_SIZE width=$MAX_RESUME_EXPAND_SQUISH_SIZE width=$MAX_RESUME_EXPAND_SIZE\
		   --animate sin 35 --set island popup.height=$RESUME_HEIGHT_SQUISH popup.height=$RESUME_HEIGHT \
		   --animate sin 35 --set island popup.background.corner_radius=$RESUME_CORNER_RADIUS

sleep 0.45
sketchybar --animate sin 25 --set island.resume_text label.color=$DEFAULT_LABEL
