check_for_app() {
	local app=$1

	if [ -e "/Applications/${app}.app" ] || [ -e "${HOME}/Applications/${app}.app" ]; then
		return 0
	fi

	return 1
}

setup_permissions() {
	# Ask for the administrator password upfront
	sudo -v

	# Keep-alive: update existing `sudo` time stamp until 'osxdefaults' has finished
	while true; do
		sudo -n true
		sleep 60
		kill -0 "$$" || exit
	done 2>/dev/null &
}

kill_apps() {
	local apps=$1
	local app
	for app in "${apps}"; do
		killall "${app}" >/dev/null 2>&1
	done
}
