#!/bin/sh

SPACE_ICONS=("z" "a" "s" "d" "f" "1" "2" "3" "4" "5")

# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)

sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space      space.$sid left                               \
             --set space.$sid associated_space=$sid                         \
                              icon=${SPACE_ICONS[i]}                        \
                              icon.padding_left=0                          \
                              icon.padding_right=0                         \
                              padding_left=2                                \
                              padding_right=2                               \
                              icon.highlight_color=$RED                  \
                              label.font="sketchybar-app-font:Regular:12.0" \
                              label.background.height=20                    \
                              label.background.padding_left=0                    \
                              label.background.padding_right=0                    \
							  label.padding_left=0 \
							  label.padding_right=15 \
							  label.y_offset=-2 \
							  label.color=$SPACE_BACKGROUND2 \
                              label.background.color=$SPACE_BACKGROUND     \
							  label.highlight_color=$YELLOW                 \
                              label.background.drawing=on                   \
                              label.drawing=off                             \
                              script="$PLUGIN_DIR/space.sh"                 \
            --subscribe       space.$sid mouse.clicked
done

sketchybar --set space.1 padding_left=15

sketchybar --add bracket spaces '/space\..*/'                  \
           --set spaces  background.color=$SPACE_BACKGROUND        \
		   				 background.corner_radius=9 \
                         background.drawing=on


sketchybar   --add item       separator left                                  \
             --set separator  icon=                                          \
                              icon.font="FiraCode Nerd Font:Regular:12.0"         \
                              padding_left=10                                 \
                              padding_right=17                                \
                              label.drawing=off                               \
                              associated_display=active                       \
                              click_script='yabai -m space --create
                                            sketchybar --trigger space_change'\
                              icon.color=$WHITE
