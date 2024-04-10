test -f "$DIR/utils.sh" && source "$DIR/utils.sh"

setup_shottr() {
	if check_for_app "Shottr"; then
		defaults write cc.ffitch.shottr showDockIcon 2009463689
	else
		print_warning "Shottr.app was not found!"
	fi
}
