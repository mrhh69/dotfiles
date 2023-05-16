local M = {}
M.conf = function()
	return {
		style = 'warmer',
		ending_tildes = true,
		toggle_style_key = '<c-t>',
		toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer'}, -- List of styles to toggle between

		-- Change code style ---
		code_style = {
			comments = 'none',
		},

		-- Custom Highlights --
		colors = {}, -- Override default colors
		highlights = {
			["@constructor"] = { fg = "$purple" },
			["@operator"] = {fg = "$purple"},
			["@variable"] = {fg = "$red"},
			["@function.builtin"] = {fg = "$blue"},
			["GitGutterChange"] = {fg = "$yellow"},
			["GitSignsChange"] = {fg = "$yellow"},
			["GitSignsChangeLN"] = {fg = "$yellow"},
			["GitSignsChangeNR"] = {fg = "$yellow"},
			["UndotreeNode"] = {fg = "$purple"},
			["@text.note"] = {fg = "$cyan"},
			["@text.todo"] = {fg = "$purple"},
			["@text.title"] = {fg = "$blue"},
			["@tag.attribute"] = {fg = "$red"},
			["@text.strong"] = {fg = "$purple"},
			["@string.regex"] = {fg = "$purple"},
			["MatchParen"] = {fg = "$bg_blue", bg="$none", fmt="underline"},
			-- ["MatchParen"] = {bg="$bg2"},
			["NeoTreeNormal"] = {bg = "$bg0"},
			["NeoTreeNormalNC"] = {bg = "$bg0"},
			["NeoTreeEndOfBuffer"] = {fg = "$bg2", bg = "$bg0"},
			["NeotreeFileSlash"] = {fg = "$red"},
			["NeoTreeRootName"] = {fg = "$purple"},
		},

		-- Plugins Config --
		diagnostics = {
			darker = true, -- darker colors for diagnostic
			undercurl = true,   -- use undercurl instead of underline for diagnostics
			background = true,    -- use background color for virtual text
		},
	}
end

return M
