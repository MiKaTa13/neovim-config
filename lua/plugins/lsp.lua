-- Python pyright config
vim.lsp.config.pyright = {
	filetypes = { "python" },
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic", -- or "strict"
			},
		},
	},
}

-- C/C++ clangd config
vim.lsp.config.clangd = {
	filetypes = { "c", "cpp" },
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		"--fallback-style=llvm",
	},
}

-- language server for Nix
vim.lsp.config.nil_ls = {
	filetypes = { "nix" },
	settings = {
		["nil"] = {
			formatting = {
				command = { "alejandra", "--" },
			},
		},
	},
}

-- language server for Bash
vim.lsp.config.bashls = {
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh" },
}

-- Lua LSP
vim.lsp.config.lua_ls = {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					vim.fn.stdpath("config"),
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

vim.lsp.enable("clangd")
vim.lsp.enable("pyright")
vim.lsp.enable("nil_ls")
vim.lsp.enable("bashls")
vim.lsp.enable("lua_ls")
