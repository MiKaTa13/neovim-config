return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	dependencies = { "nvim-treesitter/nvim-treesitter" },

	-- Lazy-load on first use of any of these keys
	keys = {
		{ "af", mode = { "x", "o" }, desc = "function outer" },
		{ "if", mode = { "x", "o" }, desc = "function inner" },
		{ "ac", mode = { "x", "o" }, desc = "class outer" },
		{ "ic", mode = { "x", "o" }, desc = "class inner" },
		{ "ao", mode = { "x", "o" }, desc = "comment outer" },
		{ "as", mode = { "x", "o" }, desc = "local scope" },
		{ "<leader>a", mode = "x", desc = "swap next parameter" },
		{ "<leader>A", mode = "x", desc = "swap prev parameter" },
	},

	config = function()
		local select = require("nvim-treesitter-textobjects.select")
		local swap = require("nvim-treesitter-textobjects.swap")

		-- Select
		vim.keymap.set({ "x", "o" }, "af", function()
			select.select_textobject("@function.outer")
		end, { desc = "function outer" })

		vim.keymap.set({ "x", "o" }, "if", function()
			select.select_textobject("@function.inner")
		end, { desc = "function inner" })

		vim.keymap.set({ "x", "o" }, "ac", function()
			select.select_textobject("@class.outer")
		end, { desc = "class outer" })

		vim.keymap.set({ "x", "o" }, "ic", function()
			select.select_textobject("@class.inner", "locals")
		end, { desc = "class inner" })

		vim.keymap.set({ "x", "o" }, "ao", function()
			select.select_textobject("@comment.outer")
		end, { desc = "comment outer" })

		vim.keymap.set({ "x", "o" }, "as", function()
			select.select_textobject("@local.scope", "locals")
		end, { desc = "local scope" })

		-- Swap
		vim.keymap.set("x", "<leader>a", function()
			swap.swap_next("@parameter.inner")
		end, { desc = "swap next parameter" })

		vim.keymap.set("x", "<leader>A", function()
			swap.swap_previous("@parameter.inner")
		end, { desc = "swap prev parameter" })
	end,
}
