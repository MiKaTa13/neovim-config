local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "folke/lazy.nvim" },

	----------------
	-- Treesitter
	----------------
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},

	----------------
	-- Telescope
	----------------
	{
		"nvim-telescope/telescope.nvim",
		version = "0.2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"AckslD/nvim-neoclip.lua",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("plugins.telescope")
		end,
	},

	----------------
	-- LSP
	----------------
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lsp")
		end,
	},

	----------------
	-- Completion
	----------------
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("plugins.completion")
		end,
	},

	----------------
	-- Git
	----------------
	{
		"tpope/vim-fugitive",
	},

	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.git")
		end,
	},

	----------------
	-- Commenter
	----------------
	{
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.comment")
		end,
	},

	----------------
	-- LuaLine
	----------------
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine")
		end,
	},

	----------------
	-- Rose-pine
	----------------
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("plugins.rose-pine")
		end,
	},

	----------------
	-- Nvim-surround
	----------------
	{
		"kylechui/nvim-surround",
		version = "^3.0.0",
		event = "VeryLazy",
		config = function()
			require("plugins.nvim-surround")
		end,
	},

	----------------
	-- Neoclip
	----------------
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "kkharji/sqlite.lua", module = "sqlite" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("plugins.neoclip")
		end,
	},

	----------------
	-- Formatter
	----------------
	{
		"stevearc/conform.nvim",
		config = function()
			require("plugins.conform")
		end,
	},
})
