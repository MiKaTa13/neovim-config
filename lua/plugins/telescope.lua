-- lua/plugins/telescope.lua
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8", -- Lock to stable release
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					prompt_prefix = "> ",
					selection_caret = "> ",
					treesitter = false,
					layout_config = {
						vertical = { width = 0.5 },
					},
					file_ignore_patterns = { "node_modules", ".git/" },
				},
				pickers = {
					find_files = { theme = "dropdown" },
				},
				extensions = {
					undo = {
						use_delta = true,
						side_by_side = true,
						layout_strategy = "vertical",
						layout_config = {
							preview_height = 0.8,
						},
						vim_diff_opts = {
							ctxlen = vim.o.scrolloff,
						},
						entry_format = "state #$ID, $STAT, $TIME",
						time_format = "",
						saved_only = false,
					},
					file_browser = {
						hijack_netrw = false,
						grouped = true,
						hidden = true,
						respect_gitignore = false,
						disable_devicons = true,
					},
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			-- Load extensions AFTER setup
			telescope.load_extension("file_browser")
			telescope.load_extension("undo")
			telescope.load_extension("fzf") -- Recommended for performance
		end,
	},
}
