#!/usr/bin/env sh

NOTIFICATION_DATABASE=""
# CHANGE THIS LINE ^^^^^^^^^^^^^

# run python script to check for notifications
NotificationCheckScript="$HOME/.config/sketchybar/plugins/dynamic_island/islands/notification/FetchNotifications.py"
pkill -f $NotificationCheckScript
python3 $NotificationCheckScript $NOTIFICATION_DATABASE &
