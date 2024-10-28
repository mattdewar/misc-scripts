#!/bin/zsh

# This script creates a backup of the current .zshrc configuration file,
# adds an alias to map the 'pip' command to 'pip3', and reloads the 
# configuration to apply the changes immediately. Finally, it verifies
# that the alias was applied correctly by displaying the pip version.

# Set variables for configuration and alias
ZSHRC_FILE="$HOME/.zshrc"
ALIAS_STRING="alias pip='pip3'"

# Create a backup of the original .zshrc file
cp "$ZSHRC_FILE" "$ZSHRC_FILE.bak"

# Add the alias to .zshrc
echo "$ALIAS_STRING" >> "$ZSHRC_FILE"
echo "Alias 'pip' added to $ZSHRC_FILE"

# Reload the ~/.zshrc configuration
source "$ZSHRC_FILE"
echo "Configuration reloaded."

# Verify alias
echo "Verifying alias:"
pip --version
