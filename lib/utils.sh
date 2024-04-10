readonly LOG="/tmp/$REPO.log"

# Command/Processing logging
print_process() {
	local message=$1

	echo "$(date) PROCESSING: $message" >>"$LOG"
	printf "%s┃%s %s...\\n" "$(tput setaf 6)" "$(tput sgr0)$(tput setaf 7)" "$message$(tput sgr0)"
}

# Informational logging
print_info() {
	local message=$1

	echo "$(date) INFO: $message" >>$LOG
	printf "%sInfo:%s\\n" "$(tput setaf 6)" "$(tput sgr0) $message"
}

# Warning logging
print_warning() {
	local message=$1

	echo "$(date) WARNING: $message" >>"$LOG"
	printf "%s⚠ Warning:%s!\\n" "$(tput setaf 3)" "$(tput sgr0) $message"
}

# Error logging
print_error() {
	local message=$1

	echo "$(date) ERROR: $message" >>"$LOG"
	printf "%s⊘ Error:%s %s. Aborting!\\n" "$(tput setaf 1)" "$(tput sgr0)" "$message"
}

# Success logging
print_success() {
	local message=$1

	echo "$(date) SUCCESS: $message" >>"$LOG"
	printf "%s✓ Success:%s\\n" "$(tput setaf 2)" "$(tput sgr0) $message"
}

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
