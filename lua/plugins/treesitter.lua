-- lua/plugins/treesitter.lua
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			init = function()
				require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
			end,
		},
	},
	opts = {
		ensure_installed = { "lua", "vim", "python", "c", "cpp", "bash" },
		highlight = { enable = true },
		indent = { enable = true },
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
		},
	},
	config = function(_, opts)
		-- FIX: Try 'configs' (old) OR 'config' (new)
		local status_ok, configs = pcall(require, "nvim-treesitter.configs")

		if not status_ok then
			-- Fallback to new singular name if plural fails
			status_ok, configs = pcall(require, "nvim-treesitter.config")
		end

		if not status_ok then
			vim.notify("CRITICAL: Could not load nvim-treesitter config module!", vim.log.levels.ERROR)
			return
		end

		configs.setup(opts)
	end,
}
