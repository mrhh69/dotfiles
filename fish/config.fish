if status is-interactive

	fish_add_path "/Applications/Atom.app/Contents/MacOS/"
	fish_add_path "/opt/homebrew/bin/"
	fish_add_path "/opt/homebrew/opt/openjdk/bin"
	fish_add_path "/Users/max/Library/Python/3.9/bin"
	fish_add_path "/Applications/Pulsar.app/Contents/MacOS"

	fish_add_path "/opt/homebrew/sbin"
	fish_add_path "/opt/homebrew/bin"
	fish_add_path "/opt/homebrew/opt/llvm/bin"
	alias python3=/opt/homebrew/bin/python3

	set -g fish_greeting "$(date): good morning!$(printf "\n")$(neofetch)$(printf "\n")"


	set fish_color_host green
	set fish_color_user green
	set fish_color_cwd blue


end
