(*
This AppleScript attempts to quit all running applications, including Finder.
If an application does not quit gracefully, the script will use System Events to force quit it.
*)

-- Get a list of all running applications (excluding background-only apps)
tell application "System Events"
	set theApps to (name of every application process whose background only is false)
end tell

-- Iterate through the list of applications
repeat with theApp in theApps
	try
		-- Attempt to quit the application gracefully
		tell application theApp to quit
	on error
		-- If the application does not quit gracefully, use System Events to force quit
		tell application "System Events" to quit application theApp
	end try
end repeat
