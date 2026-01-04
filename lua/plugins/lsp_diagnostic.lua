-- lua/config/lsp_diagnostics.lua

vim.diagnostic.config({
	virtual_text = {
		enable = true,
		format = function(diagnostic)
			return string.format("%s (%s)", diagnostic.message, diagnostic.source)
		end,
	},
	signs = {
		enable = true, -- Show icons in the sign column (gutter)
		text = {
			[vim.diagnostic.severity.ERROR] = "E ", -- Error icon (red cross/times)
			[vim.diagnostic.severity.WARN] = "W ", -- Warning icon (yellow triangle)
			[vim.diagnostic.severity.INFO] = "I ", -- Info icon (blue circle)
			[vim.diagnostic.severity.HINT] = "H ", -- Hint icon (lightbulb/idea)
		},
	},
	underline = true, -- Underline problematic text
	update_in_insert = false, -- Don't update diagnostics while typing in insert mode (prevents flickering)
	severity_sort = true, -- Sort diagnostics by severity (errors first, then warnings, etc.)
	float = {
		-- Configuration for the floating window that appears when hovering over diagnostics
		source = true, -- Always show the source of the diagnostic (e.g., "eslint", "pyright")
		border = "rounded", -- Optional: add a border to the floating window for aesthetics
		focusable = false, -- Optional: make the float non-focusable
	},
})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#FF0000" }) -- Red wavy
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#FFFF00" }) -- Yellow wavy
