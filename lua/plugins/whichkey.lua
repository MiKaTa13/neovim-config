local wk = require("which-key")

wk.setup({
    plugins = {
        marks = true,
        registers = true,
        presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
    icons = {
        breadcrumb = "»", -- shows current key combo
        separator = "➜",  -- between key and label
        group = "+",      -- group name prefix
        keys = {
            Up = "^ ", Down = "v ", Left = "< ", Right = "> ",
            BS = "BS", CR = "CR", Space = "SP", Tab = "TB",
            Esc = "ESC", -- etc.
        },
    },

    win = {
        -- don't allow the popup to overlap with the cursor
        no_overlap = true,
        -- width = 1,
        height = { min = 4, max = 25 },
        -- col = 0,
        -- row = math.huge,
        border = "rounded", -- Options: "none", "single", "double", "shadow", "rounded"
        padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
        title = false,
        -- title_pos = "center",
        zindex = 1000,
        -- Additional vim.wo and vim.bo options
        bo = {},
        wo = {
            winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        },
    },
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 4,
        align = "center",
    },
    filter = function(mapping)
        -- exclude mappings without a description
        return mapping.desc and mapping.desc ~= ""
    end,
    show_help = true,
    show_keys = true,
    disable = {
        buftypes = {},
        filetypes = {},
    },
})


wk.add({
    { "gb", group = "Comment Blockwise" },
    { "gc", group = "Comment Linewise" },
    { "y",  group = "Surround" },
}, { mode = "n" })

