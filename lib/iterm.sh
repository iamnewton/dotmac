test -f "$DIR/utils.sh" && source "$DIR/utils.sh"

setup_iterm() {
	if check_for_app "iTerm"; then
		# iTerm2: don’t display the annoying prompt when quitting
		# defaults write com.googlecode.iterm2 PromptOnQuit -bool false
		defaults write com.googlecode.iterm2 QuitWhenAllWindowsClosed -bool true
	else
		print_warning "iTerm.app was not found!"
	fi
}
