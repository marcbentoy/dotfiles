#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle System Natural Scrolling
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Toggles the system's natural scrolling option
# @raycast.author Marc Vincent Bentoy
# @raycast.authorURL https://github.com/marcbentoy

set macVersion to system version of (system info)

if macVersion is greater than or equal to "14" then
	try
		set isNaturalScrolling to (do shell script "defaults -currentHost read NSGlobalDomain com.apple.swipescrolldirection")
	on error
		set isNaturalScrolling to "1" -- Default to enabled if not set
	end try
	
	if isNaturalScrolling is "1" then
		do shell script "defaults -currentHost write NSGlobalDomain com.apple.swipescrolldirection -bool false"
        log("Natural scrolling = ON ✅")
	else
		do shell script "defaults -currentHost write NSGlobalDomain com.apple.swipescrolldirection -bool true"
        log("Natural scrolling = OFF ☑️")
	end if
	
	do shell script "/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u"
else
	tell application "System Settings"
		activate
		set current pane to pane "com.apple.preference.trackpad"
	end tell
	
	delay 0.6
	
	tell application "System Events"
		tell process "System Preferences"
			click radio button 2 of tab group 1 of window "Trackpad"
			click checkbox 1 of tab group 1 of window "Trackpad"
		end tell
	end tell
	
	tell application "System Settings" to quit
end if

