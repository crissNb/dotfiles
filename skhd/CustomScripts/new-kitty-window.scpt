set appName to "Kitty"
if application appName is running then
    do shell script "~/.config/skhd/CustomScripts/make-kitty-window.sh"
else
    tell application "Kitty"
        open
    end tell
end if
