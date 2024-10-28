#!/bin/zsh

# This script creates a backup of the current .zshrc configuration file,
# adds an alias to map the 'python' command to 'python3', reloads the configuration
# to apply the changes immediately, and verifies that the alias was applied
# by displaying the Python version.

# Set variables for the .zshrc file location and the alias string
ZSHRC_FILE="$HOME/.zshrc"
ALIAS_STRING="alias python='python3'"

# Create a backup of the original .zshrc file as .zshrc.python.bak
cp "$ZSHRC_FILE" "$ZSHRC_FILE.python.bak"

# Append the alias to the .zshrc file
echo "$ALIAS_STRING" >> "$ZSHRC_FILE"
echo "Alias 'python' added to $ZSHRC_FILE"

# Reload the .zshrc file to apply the new configuration
source "$ZSHRC_FILE"
echo "Configuration reloaded."

# Verify that the alias is working by displaying the Python version
echo "Verifying alias:"
python --version
