return {conf = function()
	return {
		window = {position = "current"},
		default_component_configs = {
			icon = {
				-- folder_closed = '▸',
				-- folder_open = '▾',
				-- folder_empty = '▾',
				folder_closed = '⯈',
				folder_open = '⯆',
				folder_empty = '⯆',
				default = '',
			},
			git_status = {
				symbols = {
					-- Change type
					added     = "✚",
					deleted   = "✖",
					-- modified  = "󰃉",
					modified  = "",
					renamed   = "󰁕",
					-- Status type
					untracked = "",
					ignored   = "",
					unstaged  = "",
					staged    = "",
					conflict  = "",
				},
			},
		},
		filesystem = {
			components = {
				trailing_slash = function ()
					return {
						text = "/",
						highlight = "NeotreeFileSlash",
					}
				end,
			},
			renderers = {
				directory = {
					{"icon"},
					{"name", use_git_status_colors = false, right_padding = 0},
					{"trailing_slash"},
					-- {"diagnostics"},
					-- {"git_status"},
				},
			}
		},
		sources = {
			"filesystem", -- Neotree filesystem source
			-- "netman.ui.neo-tree",
		},
		--[[ filesystem = {
			filtered_items = {
				visible = true,     -- hidden items are shown as grey
				hide_dotfiles = true,
				hide_gitignored = true,
				-- always_show = {'.gitignore', '.gitattributes'},
			},
		}, ]]
		-- enable_git_status = true,
	}
end}
