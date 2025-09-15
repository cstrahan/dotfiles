-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here


local opt = vim.opt
-- set the terminal title
opt.title = true

vim.g.snacks_animate = false
vim.g.autoformat = false

-- useful characters: (␍␤¬▸·␣»«⏎)
-- note: (neo)vim will still show a eol char at the end of the file,
-- even when there isn't a newline, so eol is (IMO) pointless noise.
-- we'll instead use a [noeol] statusline component to keep tabs on final EOL char.
vim.opt.listchars = 'tab:▸ ,trail:·,nbsp:␣,extends:»,precedes:«'
-- lazyvim defaults:
--vim.opt.listchars = 'tab:> ,trail:-,nbsp:+'
