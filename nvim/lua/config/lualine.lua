local indent = {
	function()
		local style = vim.bo.expandtab and "sp" or "tb"
		local size = vim.bo.expandtab and vim.bo.tabstop or vim.bo.shiftwidth
		return style .. ":" .. size
	end,
}
return {conf = function()
	return {
		options = {
			icons_enabled = false,
			component_separators = { left = '|', right = '|'},
			section_separators   = { left = '', right = ''},
			globalstatus = true, -- same statusline for each window
		},
		sections = {
			lualine_a = {'mode'},
			lualine_b = {
				'branch', 'diff', 'diagnostics',
				-- {require('auto-session-library').current_session_name},
				{
					function()
						local key = require("grapple").key()
						return " [" .. key .. "]"
					end,
					cond = function() return require("grapple").exists() end,
				},
			},
			lualine_c = {'filename'},

			lualine_x = {indent, 'filetype'},
			lualine_y = {'progress'},
			lualine_z = {'location'}
		},
	}
end}
