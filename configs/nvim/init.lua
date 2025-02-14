vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)


--custom made by alex below--


local pywal16 = require('pywal16')

pywal16.setup()
-- Save with Ctrl+S
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })

-- Close buffer with Ctrl+W
vim.keymap.set("n", "<C-w>", ":bd<CR>", { noremap = true, silent = true })

-- Quit Neovim with Ctrl+Q
vim.keymap.set("n", "<C-q>", ":q<CR>", { noremap = true, silent = true })

-- Select all with Ctrl+A
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Copy with Ctrl+C (already works in visual mode, but for normal mode)
vim.keymap.set("n", "<C-c>", '"+y', { noremap = true, silent = true })

-- Cut with Ctrl+X
vim.keymap.set("v", "<C-x>", '"+d', { noremap = true, silent = true })

-- Paste with Ctrl+V
vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })
vim.keymap.set("n", "<C-v>", '"+p', { noremap = true, silent = true })
vim.keymap.set("v", "<C-v>", '"+p', { noremap = true, silent = true })

-- Undo with Ctrl+Z
vim.keymap.set("n", "<C-z>", "u", { noremap = true, silent = true })

-- Redo with Ctrl+Y
vim.keymap.set("n", "<C-y>", "<C-r>", { noremap = true, silent = true })
