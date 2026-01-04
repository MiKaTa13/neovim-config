local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "

-- Global keybindings for LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true })

-- Diagnostic
vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Show diagnostics in loclist" })
vim.keymap.set("n", "<leader>dqq", function()
	vim.diagnostic.setloclist({ bufnr = 0 })
end, { desc = "Show diagnostics for current buffer in loclist" })

-- Toggle virtual text (inline messages)
vim.keymap.set("n", "<leader>dv", function()
	local config = vim.diagnostic.config()
	vim.diagnostic.config({ virtual_text = not config.virtual_text })
	print("Virtual text toggled: " .. tostring(not config.virtual_text))
end, { desc = "Toggle diagnostics virtual text" })

-- Clear all diagnostics in the current buffer (useful for testing/debug)
vim.keymap.set("n", "<leader>dc", function()
	vim.diagnostic.hide(0)
	print("Cleared diagnostics for current buffer")
end, { desc = "Clear diagnostics for current buffer" }) -- Telescope find files

-- Telescope undo
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fB", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser<cr>")
-- undo
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "Telescope undo history" })
-- neoclip
vim.keymap.set("n", "<leader>c", "<cmd>Telescope neoclip<cr>", { desc = "Telescope clipboard history" })
vim.keymap.set("n", "<leader>cc", "<cmd>Telescope macroscope<cr>", { desc = "Telescope macroscope history" })

-- Save file
keymap("n", "<leader>w", "<cmd>w<cr>", opts)

-- Quit Neovim
keymap("n", "<leader>q", "<cmd>q<cr>", opts)

-- Save file
keymap("n", "<leader>w", "<cmd>w<cr>", opts)

-- Quit
keymap("n", "<leader>q", "<cmd>q<cr>", opts)

-- Build C/C++
keymap("n", "<leader>m", "<cmd>make<cr>", opts)

-- Format C/C++ manually
keymap("n", "<leader>cf", "<cmd>!clang-format -i %<cr>", opts)

-- Toggle plugin
local toggle = require("helpers.toggle")
keymap("n", "<leader>tt", toggle.word, { desc = "Toggle word true/false" })

-- Toggle Vex (vertical netrw split)
local toggle_vex = require("helpers.file-exlorer")
vim.keymap.set("n", "<leader>v", toggle_vex, { desc = "Toggle netrw in vertical split (Vex)" })
