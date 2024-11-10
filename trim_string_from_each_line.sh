#!/bin/zsh

# This script prompts the user for a filename and a specific string to remove 
# from the end of each line in the file. It verifies that the file exists, 
# removes the specified string from the end of each line using `sed`, and 
# saves the changes in place.

# Prompt the user for the name of the file (with path if needed)
echo "Enter the name of the file (with path if needed):"
read file_name

# Check if the file exists
if [[ ! -f "$file_name" ]]; then
  # Display an error message and exit if the file does not exist
  echo "File not found. Please check the file name and try again."
  exit 1
fi

# Prompt the user for the string to remove from the end of each line
echo "Enter the string you want to remove from the end of each line:"
read remove_string

# Run the `sed` command to remove the specified string from the end of each line
# The `-i ''` option is used for in-place editing without creating a backup
sed -i '' "s/${remove_string}\$//" "$file_name"

# Display a confirmation message after the operation is complete
echo "The string '${remove_string}' has been removed from the end of each line in ${file_name}"
