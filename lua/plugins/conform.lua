vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      client.server_capabilities.documentFormattingProvider = false
    end
  end,
})

require("conform").setup({
  formatters = {
    black = {
      command = "/etc/profiles/per-user/nix/bin/black",
    },
  },
  formatters_by_ft = {
    python = { "black" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
