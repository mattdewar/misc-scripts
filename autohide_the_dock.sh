#!/bin/zsh

# This script ensures that the macOS Dock autohide feature is always enabled.
# If it is not enabled, the script enables it and restarts the Dock.

# Check the current autohide status of the Dock (1 = enabled, 0 = disabled)
dockStatus=$(defaults read com.apple.dock autohide)

# Enable autohide if it's not already enabled
if [[ "$dockStatus" -eq 0 ]]; then
  echo "Enabling Dock autohide..."
  defaults write com.apple.dock autohide -bool true
  # Restart the Dock to apply the setting
  killall Dock
else
  echo "Dock autohide is already enabled."
fi
