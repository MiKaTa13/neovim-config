local ts = require("nvim-treesitter.configs")

ts.setup({
  ensure_installed = { "python", "c", "cpp", "bash" },
  highlight = { enable = true },
})
