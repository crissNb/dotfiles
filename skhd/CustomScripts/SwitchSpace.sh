# #!/bin/dash

inputKeyNumber=$1

#index=$inputKeyNumber; eval "$(yabai -m query --spaces | jq --argjson index "${index}" -r '(.[] | select(.index == $index).windows[0]) as $wid | if $wid then "yabai -m window --focus \"" + ($wid | tostring) + "\"" else "skhd --key \"ctrl + alt + cmd - " + (map(select(."is-native-fullscreen" == false)) | index(map(select(.index == $index))) + 1 % 10 | tostring) + "\"" end')"

yabai -m display --focus $(yabai -m query --displays --space $inputKeyNumber | jq '.index'); skhd -k "ctrl + alt + cmd - $inputKeyNumber"
