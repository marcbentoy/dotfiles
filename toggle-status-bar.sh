#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Status Bar
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author Marc Vincent Bentoy
# @raycast.authorURL https://github.com/marcbentoy

current_value=$(defaults -currentHost read NSGlobalDomain _HIHideMenuBar)
if [ $current_value = "1" ]
then 
    defaults -currentHost write NSGlobalDomain _HIHideMenuBar -int 0
else 
    defaults -currentHost write NSGlobalDomain _HIHideMenuBar -int 1
fi

osascript -e 'tell application "System Events" to tell dock preferences to set autohide menu bar to false'

