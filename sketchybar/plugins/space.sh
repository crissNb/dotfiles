#!/bin/sh

update() {
  WIDTH="dynamic"
  sketchybar --animate tanh 20 --set $NAME icon.highlight=$SELECTED label.width=$WIDTH
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy $SID
    sketchybar --trigger space_change
  else
    yabai -m space --focus $SID 2>/dev/null
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
