status -l ; and test -f /etc/profile.env ; and source /etc/profile.env
if status is-interactive
#	fish_add_path "EXAMPLE PATH"
	fish_add_path "~/.cargo/bin/"


	set fish_color_host green
	set fish_color_user green
	set fish_color_cwd blue
end


function fish_greeting
	# echo "Good day!"
	# echo The time is (set_color yellow; date +%T; set_color normal)
	neofetch #--ascii_distro gentoo_small
end
