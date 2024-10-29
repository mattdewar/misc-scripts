#!/bin/zsh

# This script resets the macOS Dock to its factory settings by 
# removing relevant preference files and restarting the Dock.

echo "Resetting macOS Dock to factory settings..."

# Remove the Dock preferences plist file
rm -f ~/Library/Preferences/com.apple.dock.plist

# Remove any app-specific Dock preferences (if any)
rm -rf ~/Library/Application\ Support/Dock/*

# Restart the Dock to apply the changes
killall Dock

echo "Dock has been reset to factory settings."
