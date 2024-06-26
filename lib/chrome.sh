test -f "$DIR/utils.sh" && source "$DIR/utils.sh"

setup_chrome() {
	if check_for_app "Google Chrome"; then
		# Disable the all too sensitive backswipe on trackpads
		defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
		defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

		# Disable the all too sensitive backswipe on Magic Mouse
		defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
		defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false

		# Use the system-native print preview dialog
		defaults write com.google.Chrome DisablePrintPreview -bool true
		defaults write com.google.Chrome.canary DisablePrintPreview -bool true

		# Expand the print dialog by default
		defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
		defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true

		# Allow installing user scripts via GitHub or Userscripts.org
		defaults write com.google.Chrome ExtensionInstallSources -array "https://*.github.com/*" "http://userscripts.org/*"
		defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://*.github.com/*" "http://userscripts.org/*"
	else
		print_warning "Chrome.app was not found!"
	fi
}
