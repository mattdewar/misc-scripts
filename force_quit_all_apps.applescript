(*
This AppleScript attempts to quit all running applications gracefully.
If an application fails to quit, it falls back to using System Events to force quit it.
*)

-- Get a list of all running applications (excluding background-only apps)
tell application "System Events"
	set theApps to (name of every application process whose background only is false)
end tell

-- Iterate through the list of applications to quit them
repeat with theApp in theApps
	try
		-- Attempt to quit the application gracefully
		tell application theApp to quit
	on error
		-- If quitting fails, use System Events to force quit the application
		tell application "System Events" to quit application theApp
	end try
end repeat
