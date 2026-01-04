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

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},

	-- LSP + Completion
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lsp")
		end,
	},
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

	-- Git
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

	-- Commenter
	{
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.comment")
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"AckslD/nvim-neoclip.lua",
		},
		config = function()
			require("plugins.telescope")
		end,
	},

	-- LuaLine
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine")
		end,
	},

	-- Rose-pine colorscheme
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("plugins.rose-pine")
		end,
	},

	-- Nvim-surround
	{
		"kylechui/nvim-surround",
		version = "^3.0.0",
		event = "VeryLazy",
		config = function()
			require("plugins.nvim-surround")
		end,
	},

	-- Neoclip
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

	-- Conform formatter
	-- {
	-- 	"stevearc/conform.nvim",
	-- 	config = function()
	-- 		require("conform").setup({
	-- 			formatters_by_ft = {
	-- 				python = { "black" },
	-- 				lua = { "stylua" },
	-- 				javascript = { "prettier" },
	-- 			},
	-- 			format_on_save = {
	-- 				timeout_ms = 500,
	-- 				lsp_fallback = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- Conform formatter
	{
		"stevearc/conform.nvim",
		config = function()
			require("plugins.conform")
		end,
	},
})
