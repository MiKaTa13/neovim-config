-- Toggle Vex (vertical netrw split)
local vex_open = false

local function toggle_vex()
    if vex_open then
        -- Close netrw buffer
        vim.cmd('bwipeout')
        vex_open = false
    else
        -- Open Vex
        vim.cmd('Vex')
        vex_open = true
    end
end

return toggle_vex
