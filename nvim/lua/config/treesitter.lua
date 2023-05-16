local M = {}
M.conf = function()
	return {
		ensure_installed = {'c', 'lua', 'vim', 'vimdoc', 'javascript', 'html', 'css', 'comment', 'markdown', 'markdown_inline', 'json', 'make', 'bash'},
		highlight = {enable = true,
			additional_vim_regex_highlighting = false,
		},
		matchup = {enable = true,
			include_match_words = true,
			disable_virtual_text = true,
		},
		autotag = {enable = true,},
	}
end

return M
