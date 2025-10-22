local M = {}

function M.status()
  local cfg = vim.diagnostic.config()
  local vt = cfg.virtual_text
  local enabled = false

  if type(vt) == "table" then
    enabled = true
  elseif vt == true then
    enabled = true
  end

  return enabled and "VT:ON" or "VT:OFF"
end

return M
