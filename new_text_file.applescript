(*
This AppleScript creates a new text file with a unique name in the current Finder window's directory.
If no Finder window is open, the file will be created on the Desktop. The script ensures that the filename 
is unique by appending a numerical suffix if necessary, and then opens the new file in the default application.
*)

-- Access the Finder application to determine the target directory
tell application "Finder"
	try
		-- Try to get the directory of the front Finder window
		set currentDir to (target of front window) as alias
	on error
		-- If no Finder window is open, use the Desktop as the directory
		set currentDir to path to desktop as alias
	end try
	
	-- Set initial variables for generating a unique filename
	set baseName to "Untitled" -- Base name of the file
	set extension to ".txt" -- File extension
	set suffix to 0 -- Numeric suffix for uniqueness
	set fileName to baseName & extension -- Initial filename
	
	-- Get the directory path as text
	set currentPath to currentDir as text
	
	-- Loop to find a unique filename
	repeat
		if suffix is 0 then
			-- Use the base name if no suffix is needed
			set tempName to baseName & extension
		else
			-- Append the suffix to the base name for uniqueness
			set tempName to baseName & " " & suffix & extension
		end if
		
		try
			-- Check if a file with the current name already exists
			set tempFile to (currentPath & tempName) as alias
		on error
			-- If the alias cannot be created, the file doesn't exist, so exit the loop
			exit repeat
		end try
		
		-- Increment the suffix and try again
		set suffix to suffix + 1
	end repeat
	
	-- Create the new text file with the unique name
	set newFile to make new file at currentDir with properties {name:tempName}
end tell

-- Open the newly created file using the default application
tell application "System Events"
	open newFile
end tell
