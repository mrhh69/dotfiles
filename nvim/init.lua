
vim.o.guifont = "Iosevka Custom Standard, Symbols Nerd Font Mono, Symbola:h12"
vim.g.neovide_confirm_quit = false
vim.g.neovide_scroll_animation_length = 0.3
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0


vim.opt.number=true             -- show linenumbers
vim.opt.relativenumber = true   -- relative by default (no flickering)
vim.opt.showmode = false		-- do not show default statusline (insert/visual)
vim.opt.tabstop=4               --number of columns occupied by a tab
vim.opt.shiftwidth=4            --width for autoindents
vim.opt.number=true             --add line numbers
vim.opt.mouse=''                --disable mouse click
vim.opt.clipboard='unnamedplus' --using system clipboard
vim.opt.cursorline=true         --highlight current cursorline
vim.opt.ttyfast=true            --Speed up scrolling in Vim
vim.opt.updatetime=100
vim.opt.signcolumn='yes'        --keep gitgutter
vim.opt.history = 100
vim.opt.termguicolors = true    -- no more cterm :(
vim.opt.foldlevel = 99          -- don't fold on startup
vim.opt.scrolloff = 5           -- always show 5 lines above/below
vim.opt.swapfile = false        -- no swapfile (annoying "other instance of vim" errors)
vim.opt.undofile = true   		-- allow for persistent undo
vim.opt.virtualedit = "onemore" -- cursor past one character end of line
vim.opt.ignorecase = true       -- better case ignoring
vim.opt.smartcase = true
-- vim.opt.spelllang = "en_us"
-- vim.opt.spell = true

vim.cmd("let &undodir=expand('~/.local/state/nvim/undodir/')")

-- netrw (builtin file explorer)
vim.g.netrw_liststyle = 3   -- tree-like display
vim.g.netrw_banner = 0

vim.filetype.add({
	filename = {
		['kitty.conf'] = 'kitty',
	},
	pattern = {
		['.*%.[sS]'] = 'asm6502',
		['.*/kitty/.*%.conf'] = 'kitty',
		['.*/kitty/.*%.session'] = 'kitty-session',
	},

})


vim.g.mapleader = "\'"

-- vim.keymap.set('i', '<C-h>', '<ESC>')                    --ctrl+h to escape in insert mode
vim.keymap.set('n', '<C-S>', ':update<CR>')
vim.keymap.set('n', ',', '@@')                           --, to repeat macro
vim.keymap.set('n', '<C-k>', '<C-y>', {remap=true})      --ctrl+j/k to scroll up/down
vim.keymap.set('n', '<C-j>', '<C-e>', {remap=true})
vim.keymap.set('v', '.', ':norm.<CR>')                   --visual mode . command
vim.keymap.set('v', ',', ':norm,<CR>')
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<CR>')--reload config
-- vim.keymap.set('n', 'q:', '<nop>')  -- disable this annoying thing: history can just be opened with :<c-f>
--[[ vim.keymap.set('n', 'u', 'u<c-o>')        -- no jump on undo
vim.keymap.set('n', '<c-r>', '<c-r><c-o>') ]]

telescope_opts = {
	defaults = {
		preview = false,  -- disable preview (save memory)
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
		}
	},
}

comment_opts = {
	---Add a space b/w comment and the line
	padding = true,
	---Lines to be ignored while (un)comment
	ignore = nil,
	toggler = {---LHS of toggle mappings in NORMAL mode
		line = '<leader><space>',
		block = '<leader>cb',
	},
	opleader = {---LHS of operator-pending mappings in NORMAL and VISUAL mode
		line = 'gc',
		block = 'gb',
	},
	extra = {---LHS of extra mappings
		above = '<leader>cO',
		below = '<leader>co',
		eol = '<leader>ca',
	},
}

tabout_opts = {
	tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
	backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
	act_as_tab = true, -- shift content if tab out is not possible
	act_as_shift_tab = true, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
	enable_backwards = true, -- well ...
	completion = false, -- if the tabkey is used in a completion pum
	tabouts = {
		{open = "'", close = "'"},
		{open = '"', close = '"'},
		{open = '`', close = '`'},
		{open = '(', close = ')'},
		{open = '[', close = ']'},
		{open = '{', close = '}'}
	},
	ignore_beginning = false, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
}



local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
	defaults = {lazy = true},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"editorconfig", -- remove editorconfig (I use a smart plugin)
				"rplugin",
				"shada",
			}
		}
	},
})

vim.cmd.colorscheme("onedark")

--[[ require("auto-session").setup {
	auto_session_suppress_dirs = { "*" },
	auto_session_allowed_dirs = { "~/Documents/*", "~/Downloads/llama/*", "~/.config/nvim/" },
} ]]

--undo tree
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_DiffAutoOpen = 0
vim.g.undotree_ShortIndicators = 1
vim.g.undotree_HelpLine = 0

