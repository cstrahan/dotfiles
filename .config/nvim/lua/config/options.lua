-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here


local opt = vim.opt
-- set the terminal title
opt.title = true

vim.g.snacks_animate = false
vim.g.autoformat = false

-- useful characters: (␍␤¬▸·␣»«⏎)
vim.opt.listchars = 'eol:⏎,tab:▸ ,trail:·,nbsp:␣,extends:»,precedes:«'
-- lazyvim defaults:
--vim.opt.listchars = 'tab:> ,trail:-,nbsp:+'
