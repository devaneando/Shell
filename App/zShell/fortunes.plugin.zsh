# Display fortunes

() {
# Displays a nice fortune
	if [[ -f /usr/games/fortune ]]; then
		echo "${fg[magenta]}$(fortune -s)${reset_color}"
	fi
}
