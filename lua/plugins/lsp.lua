-- lua/plugins/lsp.lua
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Configure LSP Servers using new vim.lsp.config API

			vim.lsp.config.pyright = {
				cmd = { "pyright-langserver", "--stdio" },
				filetypes = { "python" },
				capabilities = capabilities,
				settings = {
					python = {
						analysis = { typeCheckingMode = "basic" },
					},
				},
			}

			vim.lsp.config.clangd = {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
					"--function-arg-placeholders",
				},
				filetypes = { "c", "cpp" },
				capabilities = capabilities,
			}

			vim.lsp.config.nil_ls = {
				cmd = { "nil" },
				filetypes = { "nix" },
				capabilities = capabilities,
				settings = {
					["nil"] = {
						formatting = { command = { "alejandra", "--" } },
					},
				},
			}

			vim.lsp.config.bashls = {
				cmd = { "bash-language-server", "start" },
				filetypes = { "sh" },
				capabilities = capabilities,
			}

			vim.lsp.config.lua_ls = {
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							checkThirdParty = false,
							library = { vim.env.VIMRUNTIME, vim.fn.stdpath("config") },
						},
						telemetry = { enable = false },
					},
				},
			}

			-- Enable LSP servers
			vim.lsp.enable({ "pyright", "clangd", "nil_ls", "bashls", "lua_ls" })

			-- Setup Diagnostic Configuration
			vim.diagnostic.config({
				virtual_text = {
					enable = true,
					format = function(diagnostic)
						return string.format("%s (%s)", diagnostic.message, diagnostic.source)
					end,
				},
				signs = {
					enable = true,
					text = {
						[vim.diagnostic.severity.ERROR] = "E ",
						[vim.diagnostic.severity.WARN] = "W ",
						[vim.diagnostic.severity.INFO] = "I ",
						[vim.diagnostic.severity.HINT] = "H ",
					},
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					source = true,
					border = "rounded",
					focusable = false,
				},
			})

			-- Custom Highlights
			vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#db4b4b" })
			vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#e0af68" })

			-- Setup Keymaps
			local function setup_keymaps(bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					setup_keymaps(args.buf)
				end,
			})
		end,
	},
}
