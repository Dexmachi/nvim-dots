-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- Indentação e tabs
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Busca
opt.ignorecase = true
opt.incsearch = true
opt.hlsearch = true

-- UI
opt.number = true
opt.wildmode = { "longest", "list" }
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.termguicolors = true
