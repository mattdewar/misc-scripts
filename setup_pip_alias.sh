#!/bin/zsh

# This script creates a backup of the current .zshrc configuration file,
# adds an alias to map the 'pip' command to 'pip3', reloads the configuration
# to apply the changes immediately, and verifies that the alias was applied
# by displaying the pip version.

# Set variables for the .zshrc file location and the alias string
ZSHRC_FILE="$HOME/.zshrc"
ALIAS_STRING="alias pip='pip3'"

# Create a backup of the original .zshrc file as .zshrc.bak
cp "$ZSHRC_FILE" "$ZSHRC_FILE.bak"

# Append the alias to the .zshrc file
echo "$ALIAS_STRING" >> "$ZSHRC_FILE"
echo "Alias 'pip' added to $ZSHRC_FILE"

# Reload the .zshrc file to apply the new configuration
source "$ZSHRC_FILE"
echo "Configuration reloaded."

# Verify that the alias is working by displaying the pip version
echo "Verifying alias:"
pip --version
