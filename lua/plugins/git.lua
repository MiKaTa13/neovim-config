-- lua/plugins/git.lua
return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" }, -- Load on file open
		config = function()
			require("gitsigns").setup({})
		end,
	},
}
