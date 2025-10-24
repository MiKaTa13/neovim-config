local telescope = require("telescope")

telescope.setup({
    defaults = {
        prompt_prefix = "> ", -- replaces the 🔍 icon
        selection_caret = "> ",
        layout_config = { 
            vertical = { width = 0.5 } 
        },
        file_ignore_patterns = { "node_modules", ".git/" },
    },
    pickers = { 
        find_files = { theme = "dropdown", } 
    },
    extensions = {
        undo = {
            use_delta = true,
            use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
            side_by_side = true,
            layout_strategy = "vertical",
            layout_config = {
                preview_height = 0.8,
            },
            vim_diff_opts = {
                ctxlen = vim.o.scrolloff,
            },
            entry_format = "state #$ID, $STAT, $TIME",
            time_format = "",
            saved_only = false,
        },
        file_browser = {
            hijack_netrw = false, -- replaces netrw!
            side_by_side = true,
            layout_strategy = "vertical",
            grouped = true,
            hidden = true,
            respect_gitignore = false,
            disable_devicons = true,
        },
    },
})

require("telescope").load_extension("file_browser")

