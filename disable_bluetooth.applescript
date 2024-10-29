(*
This AppleScript uses Apple frameworks to disable Bluetooth on the system.
It attempts to turn off Bluetooth using the IOBluetooth framework and provides 
feedback through dialog boxes indicating success or failure.
*)

use framework "Foundation" -- Provides access to Cocoa-based objects
use framework "IOBluetooth" -- Grants access to Bluetooth controller functions
use scripting additions

-- A handler to turn off Bluetooth
on disableBluetooth()
	-- Get the shared instance of the Bluetooth controller
	set bluetoothController to current application's IOBluetoothHostController's defaultController()
	
	-- Use the Objective-C method `setPowerState_(0)` to turn off Bluetooth 
	-- (0 disables it, while 1 would enable it)
	set result to bluetoothController's setPowerState:0
	
	-- Display a dialog to show whether the operation was successful or not
	if result is 0 then
		display dialog "Bluetooth turned off successfully." buttons {"OK"} default button "OK"
	else
		display dialog "Failed to turn off Bluetooth." buttons {"OK"} default button "OK"
	end if
end disableBluetooth

-- Run the handler to disable Bluetooth
disableBluetooth()
