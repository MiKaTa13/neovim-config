-- lua/plugins/nvim-surround.lua
return {
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for latest features
		event = "VeryLazy", -- Load this plugin slightly later to speed up startup
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
}
