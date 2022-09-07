inputKeyNumber=$1

yabai -m query --spaces --space | jq -re ".index" | xargs -I {} bash -c "yabai -m window --space $inputKeyNumber"
