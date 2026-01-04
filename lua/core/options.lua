vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.errorformat = "%f:%l:%c: %m"

-- Netrw --
vim.g.netrw_browse_split = 4 -- Open directories in a split
vim.g.netrw_liststyle = 3 -- Show files and dirs with a tree view
vim.g.netrw_altv = 1 -- Vertical split for :Vex
vim.g.netrw_banner = 0 -- Hide banner
vim.g.netrw_sort_sequence = "[\\/]*" -- Sort by time modified
vim.g.netrw_hide = "" -- Show dotfiles
vim.g.netrw_winsize = 25 -- Window size
