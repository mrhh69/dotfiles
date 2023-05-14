local M = {}
M.conf = function()
	return {
		ensure_installed = {'c', 'lua', 'vim', 'vimdoc', 'javascript', 'html', 'css', 'comment', 'markdown', 'markdown_inline', 'json', 'make', 'bash'},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	}
end

return M
