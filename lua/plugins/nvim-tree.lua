return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			trash = {
				cmd = "rm",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
				icons = {
					show = {
						file = false,
						folder = true,
						folder_arrow = true,
						git = true,
						modified = true,
						diagnostics = true,
						bookmarks = true,
					},
				},
			},
			filters = {
				dotfiles = true,
			},
		})
	end,
	keys = { { "<leader>v", ":NvimTreeToggle<CR>" } },
}
