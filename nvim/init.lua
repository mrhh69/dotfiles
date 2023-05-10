
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
vim.opt.virtualedit = "onemore" -- cursor past one character end of line
vim.opt.ignorecase = true       -- better case ignoring
vim.opt.smartcase = true
-- vim.opt.spelllang = "en_us"
-- vim.opt.spell = true

-- netrw (builtin file explorer)
vim.g.netrw_liststyle = 3   -- tree-like display
vim.g.netrw_banner = 0

vim.filetype.add({
	pattern = {
		['.*%.[sS]'] = 'asm6502',
	}
})


vim.g.mapleader = "\'"

vim.keymap.set('i', '<C-h>', '<ESC>')                    --ctrl+h to escape in insert mode
vim.keymap.set('n', '<C-S>', ':update<CR>')
vim.keymap.set('n', ',', '@@')                           --, to repeat macro
vim.keymap.set('v', ',', ':norm,<CR>')
vim.keymap.set('n', '<C-k>', '<C-y>', {remap=true})      --ctrl+j/k to scroll up/down
vim.keymap.set('n', '<C-j>', '<C-e>', {remap=true})
vim.keymap.set('v', '.', ':norm.<CR>')                   --visual mode . command
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<CR>')--reload config


onedark_opts = {
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
		-- ["MatchParen"] = {fg = "$cyan", bg="$none", fmt="underline"},
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

treesitter_opts = {
	ensure_installed = {'c', 'lua', 'vim', 'vimdoc', 'javascript', 'html', 'css', 'comment', 'markdown', 'markdown_inline', 'json', 'make', 'bash'},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}

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

local indent = {
    function()
        local style = vim.bo.expandtab and "sp" or "tb"
        local size = vim.bo.expandtab and vim.bo.tabstop or vim.bo.shiftwidth
        return style .. ":" .. size
    end,
}
-- tabline
lualine_opts = {
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


neotree_opts = {
	window = {position = "current"},
	default_component_configs = {
		icon = {
			folder_closed = '▸',
			folder_open = '▾',
			folder_empty = '▾',
			default = '',
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
				{"name", use_git_status_colors = true, right_padding = 0},
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
}

require("plugins")

-- require("NeoComposer").setup()



-- NOTE: version control/git stuff
--[[ require("auto-session").setup {
	auto_session_suppress_dirs = { "*" },
	auto_session_allowed_dirs = { "~/Documents/*", "~/Downloads/llama/*", "~/.config/nvim/" },
} ]]

--undo tree
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_DiffAutoOpen = 0
vim.g.undotree_ShortIndicators = 1
vim.g.undotree_HelpLine = 0
vim.cmd("let &undodir=expand('~/.undodir')")
-- vim.opt.undodir = "~/.undodir"
vim.opt.undofile = true

-- gitgutter
vim.g.gitgutter_signs=1
vim.g.gitgutter_highlight_linenrs=0

vim.g.gitgutter_sign_added                   = '│'
vim.g.gitgutter_sign_modified                = '│'
vim.g.gitgutter_sign_removed                 = '│'
vim.g.gitgutter_sign_removed_above_and_below = '{'
vim.g.gitgutter_sign_modified_removed        = '│~'
