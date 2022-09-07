#!/bin/sh

xpt=$(yabai -m query --windows --window | jq -re '. | .frame.x')

_big() {
    yabai -m window --grid 16:32:4:2:24:12
}

_medium() {
    yabai -m window --grid 16:32:6:2:20:12
}

_small() {
    yabai -m window --grid 16:32:8:3:16:10
}

[[ $xpt -gt 481 ]] && _small
[[ $xpt -le 481 && $xpt -gt 361 ]] && _medium
[[ $xpt -le 361 && $xpt -gt 241 ]] && _big
[[ $xpt -le 241 ]] && _small
