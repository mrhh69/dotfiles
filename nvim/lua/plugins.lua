return {

	-- 'kkharji/sqlite.lua',
	-- 'ecthelionvi/NeoComposer.nvim',

	-- use 'nvim-treesitter/nvim-treesitter-refactor'
	-- 'windwp/nvim-ts-autotag',
	-- 'theHamsta/nvim-treesitter-pairs',
	-- 'drybalka/tree-climber.nvim',
	-- 'RRethy/nvim-treesitter-textsubjects',
	-- 'ahmedkhalf/project.nvim',

	{'navarasu/onedark.nvim',
		lazy = false,
		opts = function() return onedark_opts end,
	},

	{'nvim-treesitter/nvim-treesitter',
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
	{'mrhh69/nvim-kitty', lazy=false},

	--NOTE: file navigating
	{'nvim-telescope/telescope.nvim',         -- fuzzy finding
		dependencies = {'nvim-lua/plenary.nvim'},
		opts = function(_, opts) return telescope_opts end,
		config = function(_, opts)
			require('telescope').setup(opts)
			require('telescope').load_extension('fzf')
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
		main = 'neo-tree',
		opts = function() return neotree_opts end,
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
		main = 'spider',
		opts = function() return {skipInsignificantPunctuation = true} end,
		keys = {
			{ "w",  "<cmd>lua require('spider').motion('w')<CR>", mode={"n", "o", "x"} },
			{ "e",  "<cmd>lua require('spider').motion('e')<CR>", mode={"n", "o", "x"} },
			{ "b",  "<cmd>lua require('spider').motion('b')<CR>", mode={"n", "o", "x"} },
			{ "ge", "<cmd>lua require('spider').motion('ge')<CR>",mode={"n", "o", "x"} },
		},
	},
	{'asiryk/auto-hlsearch.nvim', event="VeryLazy", opts = {}, },
	{'abecodes/tabout.nvim', event="VeryLazy",
		opts = function() return tabout_opts end,
	},
	{'max397574/better-escape.nvim', event="VeryLazy", main = 'better_escape',
		opts = function() return {
			mapping = {'jk', 'kj'},
			keys = "<Esc>",
		} end,
	},


	--NOTE: editor nice looking stuff
	-- 'nvim-treesitter/nvim-treesitter-context', -- show cur function top line
	{'lukas-reineke/indent-blankline.nvim', main='indent_blankline',     -- indent guide
		event="VeryLazy",
		opts = {},
	},
	{'karb94/neoscroll.nvim',                   -- better scrolling
		event = "VeryLazy",
		opts = {easing_function = 'sine',},
		config = function(_, o)
			require('neoscroll').setup(o)
			require('neoscroll.config').set_mappings({
				['<C-y>'] = {'scroll', {'-0.10', 'true', '100', nil}},
				['<C-e>'] = {'scroll', { '0.10', 'true', '100', nil}},
			})
		end,
	},
	{'nvim-lualine/lualine.nvim',               -- status bar
		lazy = false,
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
	--use 'akinsho/git-conflict.nvim'
	{'lewis6991/gitsigns.nvim', event="VeryLazy", opts = {}, },
	{'cpea2506/relative-toggle.nvim', event="VeryLazy", opts = {}, },


	--misc
	{'cappyzawa/trim.nvim',                     -- strip whitespace
		event = "VeryLazy",
		opts = {trim_first_line = false, trim_last_line = false},
	},

	{'nmac427/guess-indent.nvim',               -- automatic indents
		lazy = false,
		opts = {},
	},
	{'alec-gibson/nvim-tetris', --cmd="Tetris"
		keys = {{'<leader>Gt', '<cmd>Tetris<CR>'}},
	},
	{'jim-fx/sudoku.nvim', --cmd = "Sudoku",
		keys = {{'<leader>Gu', '<cmd>Sudoku<CR>'}},
		opts = {},
	},
	{'seandewar/nvimesweeper', --cmd="Nvimesweeper",
		keys = {{'<leader>Gn', '<cmd>Nvimesweeper<CR>'}},
	},
	{'rktjmp/shenzhen-solitaire.nvim', --cmd="ShenzhenSolitaireNewGame",
		keys = {{'<leader>Gs', function() require('shenzhen-solitaire')["start-next-game"](0, {cursor={show=true}, keys={['next-location']='j', ['prev-location']='k'}}) end}},
		config = function() vim.opt.mouse = 'n' end,
	},
	{'ThePrimeagen/vim-be-good', --cmd='VimBeGood',
		keys = {{'<leader>Gv', '<cmd>VimBeGood<CR>'}},
	},
}
