# #!/bin/dash

input=$1

if [ $input -eq 0 ]; 
then
    brew services start fyabai
    brew services start sketchybar
    defaults write com.apple.dock autohide -bool true
#    defaults write "Apple Global Domain" _HIHideMenuBar -bool true
    killall Dock
else
    brew services stop fyabai
    brew services stop sketchybar
    defaults write com.apple.dock autohide -bool false
#    defaults write "Apple Global Domain" _HIHideMenuBar -bool false
    killall Dock
fi

