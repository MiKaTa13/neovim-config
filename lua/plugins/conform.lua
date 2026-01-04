local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		python = { "black", "ruff", "isort" },
		nix = { "alejandra" },
		lua = { "stylua" },
		sh = { "shfmt" },
		javascript = { "prettier" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
