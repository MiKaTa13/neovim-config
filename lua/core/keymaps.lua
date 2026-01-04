local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "

-- File explorer
keymap("n", "<leader>e", "<cmd>Ex<cr>", opts)
keymap("n", "<leader>v", ":Vex<CR>", { desc = "Open netrw in vertical split (Vex)" })

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

-- Venv selector
keymap("n", ",v", "<cmd>VenvSelect<cr>", opts, { desc = "Virual env selection" })

-- LSP keymaps
keymap("n", "gd", vim.lsp.buf.definition, opts, { desc = "Go to definition" })
keymap("n", "K", vim.lsp.buf.hover, opts, { desc = "Hover" })
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts, { desc = "Code action rename" })
keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts, { desc = "Code action" })
keymap("n", "<leader>cff", vim.lsp.buf.format, opts, { desc = "Code format" })

-- Telescope find files
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts, { desc = "Find files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts, { desc = "Live grep" })
keymap("n", "<leader>fB", "<cmd>Telescope buffers<cr>", opts, { desc = "Buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts, { desc = "Help tags" })
keymap("n", "<leader>fb", "<cmd>Telescope file_browser<cr>", { noremap = true, silent = true })

-- Telescope undo
keymap("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "Telescope undo history" })

-- Telescope neoclip
keymap("n", "<leader>c", "<cmd>Telescope neoclip<cr>", { desc = "Telescope clipboard history" })
keymap("n", "<leader>cc", "<cmd>Telescope macroscope<cr>", { desc = "Telescope macroscope history" })

-- Diagnostic
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
keymap("n", "<leader>do", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
keymap("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Show diagnostics in loclist" })
keymap("n", "<leader>dqq", function()
    vim.diagnostic.setloclist({ bufnr = 0 })
end, { desc = "Show diagnostics for current buffer in loclist" })

-- Toggle virtual text (inline messages)
keymap("n", "<leader>dv", function()
    local config = vim.diagnostic.config()
    vim.diagnostic.config({ virtual_text = not config.virtual_text })
    print("Virtual text toggled: " .. tostring(not config.virtual_text))
end, { desc = "Toggle diagnostics virtual text" })

-- Clear all diagnostics in the current buffer (useful for testing/debug)
keymap("n", "<leader>dc", function()
    vim.diagnostic.hide(0)
    print("Cleared diagnostics for current buffer")
end, { desc = "Clear diagnostics for current buffer" })

-- Toggle plugin
local toggle = require("helpers.toggle")
keymap("n", "<leader>tt", toggle.word, { desc = "Toggle word true/false" })

-- Toggle Vex (vertical netrw split)
local toggle_vex = require("helpers.file-exlorer")
vim.keymap.set('n', '<leader>v', toggle_vex, { desc = 'Toggle netrw in vertical split (Vex)' })


vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file or range (conform.nvim)" })

