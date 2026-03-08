return {
	"stevearc/oil.nvim",
	---@module 'oil'
	opts = {
		view_options = {
			show_hidden = true,
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons", opts = {} },
	lazy = false,

	config = function()
		local oil = require("oil")
		local detail = false
		oil.setup({
			keymaps = {
				["gd"] = {
					desc = "Toggle file detail view",
					callback = function()
						detail = not detail
						if detail then
							require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
						else
							require("oil").set_columns({ "icon" })
						end
					end,
				},
			},
		})
	end,
}
