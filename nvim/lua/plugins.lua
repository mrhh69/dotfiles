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

return require('lazy').setup( {

	-- 'kkharji/sqlite.lua',
	-- 'ecthelionvi/NeoComposer.nvim',

	-- use 'nvim-treesitter/nvim-treesitter-refactor'
	-- 'windwp/nvim-ts-autotag',
	-- 'theHamsta/nvim-treesitter-pairs',
	-- 'drybalka/tree-climber.nvim',
	-- 'RRethy/nvim-treesitter-textsubjects',
	-- 'ahmedkhalf/project.nvim',

	--colorscheme
	{'navarasu/onedark.nvim',
		lazy = false, priority = 10,
		-- opts = ,
		config = function()
			require('onedark').setup(onedark_opts)
			vim.cmd.colorscheme("onedark")
		end
	},

	{'nvim-treesitter/nvim-treesitter',         -- tree-sitter for good highlighting
		lazy = false,
		-- event="VeryLazy",
		config = function()
			require('nvim-treesitter.configs').setup(treesitter_opts)
			require'nvim-treesitter.parsers'.get_parser_configs().asm6502 = {
				install_info = {
					url = "~/Documents/tree-sitter-asm6502/", -- local path or git repo
					files = {"src/parser.c"},
				},
			}
			-- treesitter code folding
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr   = "nvim_treesitter#foldexpr()"
		end,
	},
	{'nvim-treesitter/playground',
		keys = {{"<c-p>", "<cmd>TSPlaygroundToggle<CR>"}},
	},
	{'nvim-treesitter/nvim-treesitter-textobjects', event = "VeryLazy"},

	--NOTE: file navigating
	{'nvim-telescope/telescope.nvim',         -- fuzzy finding
		dependencies = {'nvim-lua/plenary.nvim'},
		config = function()
			require('telescope').setup(telescope_opts)
			-- require('telescope').load_extension('fzf')
		end,
		keys = {
			{"<leader>ff", function() require'telescope.builtin'.find_files() end},
			{"<leader>fg", function() require'telescope.builtin'.live_grep() end},
			{"<leader>fb", function() require'telescope.builtin'.buffers() end},
			{"<leader>fh", function() require'telescope.builtin'.help_tags() end},
		}
	},
	{'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
	{'cbochs/grapple.nvim',
		keys = {
			{ '<leader>a', function() require'grapple'.tag() end },
			{ '<leader>g', "<cmd>GrapplePopup tags<CR>" },
			{ '<leader>n', function() require'grapple'.cycle_forward() end},
			{ '<leader>1', function() require("grapple").select({ key = "g1" }) end},
			{ '<leader>j1', function() require("grapple").tag({ key = "g1" }) end},
		},
	},
	{'nvim-neo-tree/neo-tree.nvim',
		keys = {{'<leader>t', '<cmd>Neotree<CR>'}},
		dependencies = {'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim'},
		config = function()
			require('neo-tree').setup(neotree_opts)
		end,
	},


	--editing commands
	{'kylechui/nvim-surround', event = "VeryLazy",
		opts = {},
	},
	{'tommcdo/vim-lion',                        -- align spaces
		keys = {
			{ 'gl', "<Plug>VLionRight", mode='v' },
			{ 'gL', "<Plug>VLionLeft",  mode='v' },
			{ 'gl', "<Plug>LionRight" },
			{ 'gL', "<Plug>LionLeft" },
		},
		config = function()
			vim.g.lion_squeeze_spaces = 1 -- align spaces
			vim.g.lion_create_maps = 0
		end,
	},
	{'nguyenvukhang/nvim-toggler',              -- toggle true/false
		keys = {{ '<leader>i', function() require('nvim-toggler').toggle() end }},
		opts = {inverses = {
			['0'] = '1',
		}},
	},
	{'tenxsoydev/karen-yank.nvim',              -- separate cut from delete
		event = "VeryLazy",
		opts = {
			mappings = {
				karen = "<leader>",
				disable = { 's','S','x','X', 'c', 'C' },
			},
		},
	},
	{'numToStr/Comment.nvim',
		event = "VeryLazy",
		opts = comment_opts,
	},
	{'windwp/nvim-autopairs', event="VeryLazy",                   -- auto-pair brackets/parentheses
		opts = {},
	},
	{ "chrisgrieser/nvim-spider", event = "VeryLazy", -- better move by word
		config = function()
			require('spider').setup({skipInsignificantPunctuation = true})
			vim.keymap.set({"n", "o", "x"}, "w",  "<cmd>lua require('spider').motion('w')<CR>")
			vim.keymap.set({"n", "o", "x"}, "e",  "<cmd>lua require('spider').motion('e')<CR>")
			vim.keymap.set({"n", "o", "x"}, "b",  "<cmd>lua require('spider').motion('b')<CR>")
			vim.keymap.set({"n", "o", "x"}, "ge", "<cmd>lua require('spider').motion('ge')<CR>")
		end
	},
	{'asiryk/auto-hlsearch.nvim', event="VeryLazy",
		config = function() require('auto-hlsearch').setup() end
	},
	{'abecodes/tabout.nvim', event="VeryLazy",
		config = function() require('tabout').setup(tabout_opts) end,
	},


	--NOTE: editor nice looking stuff
	'nvim-treesitter/nvim-treesitter-context', -- show cur function top line
	{'lukas-reineke/indent-blankline.nvim',     -- indent guide
		lazy = false,
		config = function() require("indent_blankline").setup() end,
	},
	{'karb94/neoscroll.nvim',                   -- better scrolling
		event = "VeryLazy",
		opts = {easing_function = 'sine',},
		config = function()
			require('neoscroll').setup({easing_function = 'sine'})
			require('neoscroll.config').set_mappings({
				['<C-y>'] = {'scroll', {'-0.10', 'true', '100', nil}},
				['<C-e>'] = {'scroll', { '0.10', 'true', '100', nil}},
			})
		end,
	},
	{'nvim-lualine/lualine.nvim',               -- status bar
		lazy = false, --event = "VeryLazy",
		opts = lualine_opts,
	},


	-- sessions/git/undo
	{'mbbill/undotree',                         -- show undo history in a tree
		keys = {{"<leader>u", "<cmd>UndotreeToggle<CR>"}},
	},
	{'tpope/vim-fugitive', cmd="Git",                       -- git plugin
		keys = {{"<C-g>", "<cmd>Git<CR>"}},
	},
	-- 'rmagatti/auto-session',                   -- session managing
	-- 'airblade/vim-gitgutter',                  -- git diff next to line numbers
	--use 'akinsho/git-conflict.nvim'
	{'cpea2506/relative-toggle.nvim', event="VeryLazy",
		config = function() require('relative-toggle').setup() end
	},


	--misc
	{'cappyzawa/trim.nvim',                     -- strip whitespace
		event = "VeryLazy",
		opts = {trim_first_line = false, trim_last_line = false},
	},

	{'nmac427/guess-indent.nvim',               -- automatic indents
		lazy = false,
		config = function()
			require('guess-indent').setup({})
			vim.g.editorconfig = false -- disable editorconfig (default tab-setter)
		end
	},
	{'alec-gibson/nvim-tetris', cmd="Tetris"},
}, {
	defaults = {lazy = true},
})
