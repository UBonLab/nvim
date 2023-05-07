vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.wo.number = true
vim.wo.relativenumber = true

vim.wo.cursorline =false 

vim.wo.signcolumn = "yes"
vim.wo.colorcolumn = "180"

vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = false 

vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

vim.o.expandtab = true
vim.bo.expandtab = true

vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.incsearch = true

vim.o.cmheight = 2

vim.o.autoread = true
vim.bo.autoread = true

vim.wo.wrap = false

vim.o.whichwrap = '<,>,[,]'

vim.o.hidden = true

vim.o.mouse = "a"

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.o.updatetime = 300

vim.o.timeoutlen = 500

vim.o.splitbelow = true
vim.o.splitright = true

vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- vim.o.list = true
-- vim.o.listchars = "space:·"

vim.o.wildmenu = true

vim.o.shortmess = vim.o.shortmess .. 'c'

vim.o.pumheight = 10
vim.o.showtabline = 2

vim.o.showmode = false


local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
local leader_key = " "

vim.g.mapleader = leader_key
vim.g.maplocalleader = leader_key

local opts_remap = {
  remap = true,
  silent = true,
}

local opts_expr = {
  expr = true,
  silent = true,
}
