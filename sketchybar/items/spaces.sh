#!/usr/bin/env sh

SPACE_ICONS=("a" "s" "d" "f" "1" "2" "3" "4" "5" "6")

for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space      space.$sid left                    \
             --set space.$sid associated_space=$sid              \
                              icon=${SPACE_ICONS[i]}             \
                              icon.padding_left=22               \
                              icon.padding_right=22              \
                              icon.highlight_color=$YELLOW          \
                              icon.color=$LABEL_COLOR           \
                              background.padding_left=-8         \
                              background.padding_right=-8        \
                              background.height=23               \
                              background.corner_radius=$CORNER_RADIUS         \
                              background.color=$ITEM_COLOR        \
                              background.drawing=on              \
                              label.drawing=off                  \
                              click_script="$SPACE_CLICK_SCRIPT"
done

sketchybar   --add item       separator left                          \
             --set separator  icon=                                  \
                              icon.font="Hack Nerd Font:Regular:12.0" \
                              background.padding_left=26              \
                              background.padding_right=15             \
                              label.drawing=off                       \
                              icon.color=$YELLOW
