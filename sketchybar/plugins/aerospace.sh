#!/usr/bin/env bash

# Exit on error
set -e

WORKSPACE_ID=$1
[ -z "$WORKSPACE_ID" ] && exit 1

# Use timeout to prevent hanging
FOCUSED_WORKSPACE="$(timeout 1 aerospace list-workspaces --focused | head -n1)"

if [ "$WORKSPACE_ID" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "space.$WORKSPACE_ID" icon.highlight=true label.highlight=true background.border_color=0xff000000
  sketchybar --set "bracket.space.$WORKSPACE_ID" background.border_color=0xff888888 2>/dev/null || true
else
  sketchybar --set "space.$WORKSPACE_ID" icon.highlight=false label.highlight=false background.border_color=0xff1e1e1e
  sketchybar --set "bracket.space.$WORKSPACE_ID" background.border_color=0xff1e1e1e 2>/dev/null || true
fi

# Update app icons for the workspace - with timeout to prevent hanging
APP_ICONS=""
while IFS= read -r line; do
  APP_NAME=$(echo "$line" | awk -F'app="' '{print $2}' | cut -d '"' -f1)
  if [ -n "$APP_NAME" ]; then
    APP_ICONS="$APP_ICONS $APP_NAME"
  fi
done < <(timeout 1 aerospace list-windows --workspace "$WORKSPACE_ID" 2>/dev/null || echo "")

if [ -z "$APP_ICONS" ]; then
  APP_ICONS=" —"
fi

sketchybar --set "space.$WORKSPACE_ID" label="$APP_ICONS"
exit 0
