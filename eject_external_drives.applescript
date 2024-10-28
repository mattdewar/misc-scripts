(*
This AppleScript ejects all external, ejectable drives except for a specified one.
It skips the drive named "MyImportantDrive" (or whichever name you provide).
If a drive fails to eject, an error dialog will appear for that specific drive.
*)

tell application "Finder"
	-- Set the name of the drive to exclude from ejection
	set excludedDriveName to "MyImportantDrive" -- Replace with the desired drive name
	
	-- Get a list of all ejectable disks (external drives)
	set allVolumes to disks whose ejectable is true
	
	-- Iterate through the list of drives and eject them (if not excluded)
	repeat with aVolume in allVolumes
		if name of aVolume is not excludedDriveName then
			try
				-- Attempt to eject the drive
				eject aVolume
			on error errMsg
				-- If ejection fails, show an error dialog
				display dialog "Failed to eject " & name of aVolume buttons {"OK"}
			end try
		end if
	end repeat
end tell
