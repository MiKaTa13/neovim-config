-- lua/plugins/treesitter.lua

local treesitter = require("nvim-treesitter")
treesitter.setup({
	highlight = { enable = true },
	ensure_installed = { "python", "c", "cpp", "bash", "lua" },
})
