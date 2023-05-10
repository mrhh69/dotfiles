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


	set fish_color_host green
	set fish_color_user green
	set fish_color_cwd blue


end


function fish_greeting
	# echo "Good day!"
	# echo The time is (set_color yellow; date +%T; set_color normal)
	neofetch --ascii_distro macOS_small --colors 2 fg fg 1 fg 4
end
