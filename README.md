#  My Neovim Plugin Setup

This directory contains modular Lua configurations for my Neovim setup.  
Each file configures a specific plugin, keeping everything clean and maintainable.

##  UI & Appearance

###  rose-pine.lua
Color scheme configuration using **rose-pine**.
- Soft pastel theme
- Transparent background option
- Lualine integration

###  lualine.lua
Custom statusline using **lualine.nvim**.
- Git branch
- LSP status
- File info
- Theme integration

###  coloriser.lua
Highlights color codes directly in buffers.
- Supports hex, RGB, HSL
- Works in CSS, HTML, JS, etc.

---

##  File Navigation

###  nvim-tree.lua
File explorer sidebar.
- File operations (create, delete, rename)
- Git integration
- Icon support

###  oil.lua
Edit directories like normal buffers.
- Batch rename files
- Lightweight file management

###  telescope.lua
Powerful fuzzy finder.
- Find files
- Live grep
- Buffers
- Git files
- Clipboard history (via neoclip)

---

##  Code Intelligence

###  lsp.lua
Language Server Protocol configuration.
- Go to definition
- Hover documentation
- Rename
- Code actions
- Diagnostics

###  completion.lua
Autocompletion setup.
- LSP completion
- Snippet support
- Buffer & path suggestions
- Icon formatting

###  nvim-treesitter.lua
Advanced syntax parsing.
- Better highlighting
- Incremental selection
- Folding

###  nvim-treesitter-textobjects.lua
Enhanced text objects via Treesitter.
- Around/inside functions & classes
- Parameter swapping
- Smart navigation

---

##  Formatting & Editing

###  conform.lua
Code formatting management.
- Auto format on save
- Per-language formatter setup

###  comment.lua
Smart commenting.
- Toggle line comments
- Toggle block comments
- Context-aware with Treesitter

###  nvim-surround.lua
Easily manage surrounding characters.
- Add, delete, change quotes/brackets
- Fast text editing workflow

---

##  Git Integration

###  git.lua
Git signs & inline changes.
- Hunk preview
- Blame info
- Line change indicators

###  vim-fugitive.lua
Full Git wrapper inside Neovim.
- `:Git` status view
- Commit browsing
- Diff splits
- Blame support

---

##  Clipboard & Markdown

###  neoclip.lua
Persistent clipboard manager.
- Yank history
- Telescope integration

###  render-markdown.lua
Enhanced Markdown rendering.
- Styled headings
- Highlighted code blocks
- Checkbox rendering
