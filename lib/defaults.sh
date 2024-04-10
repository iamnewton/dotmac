setup_computer() {
	# Set the computer name
	printf "%s==> What would you like to name your computer?%s " "$(tput setaf 3)" "$(tput sgr0)"
	read COMPUTER_NAME

	if [[ ! -z "${COMPUTER_NAME}" ]]; then
		sudo systemsetup -setcomputername "${COMPUTER_NAME}" &>/dev/null
		sudo systemsetup -setlocalsubnetname "${COMPUTER_NAME}" &>/dev/null
		sudo scutil --set ComputerName "${COMPUTER_NAME}"
		sudo scutil --set HostName "${COMPUTER_NAME}"
		sudo scutil --set LocalHostName "${COMPUTER_NAME}"
		sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "${COMPUTER_NAME}"
	fi
}

setup_defaults() {
	# Save screenshots to the Pictures folder
	defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"
	#defaults write com.developer.app NSUserKeyEquivalents -dict-add "Menu Item" -string "@$~^k"

	# Add Login Window Text
	sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Get your hands off my 'puter yo! Unless it's missing and you can call me at +1 424.265.9725"
	# Change picture for main login screen to Ralph and I cartoon
	sudo defaults write /Library/Preferences/com.apple.loginwindow DesktopPicture "$HOME/Pictures/ralph-and-i.png"

	# Set Minimal Clock as default screensaver
	# defaults -currentHost write com.apple.screensaver '{ idleTime = 0; moduleDict = { moduleName = MinimalClock; path = "/Library/Screen Savers/MinimalClock.qtz"; type = 1; }; };'

	# TextEdit: change default fixed width font to 16px Inconsolata
	defaults write com.apple.TextEdit 'NSFixedPitchFont' -string 'Inconsolata'
}
