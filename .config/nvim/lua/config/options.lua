-- This file contains all of my neovim options

-- Hint: use ':h <option>' to figure out the meaning if needed
-- vim.opt.clipboard = 'unnamedplus'	-- use system clipboard
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a" -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spaces in tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly used for python

-- File encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- UI config
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- higlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split below
vim.opt.splitright = true -- open new horizontal splits rigth
vim.opt.termguicolors = true -- set termguicolors to enable highlight groups
vim.opt.breakindent = true -- enable break indent
vim.opt.scrolloff = 8 -- always have 8 lines above and below curren line when scrolling
vim.opt.colorcolumn = "100" -- add a colored line in column 80
-- vim.opt.guitablabel = '[%N] %t %M'
vim.opt.showmode = false -- Don't show the mode, since it's already in the status line

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = true -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make ite case sensitive if an uppercase is entered

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Save undo history
vim.opt.undofile = true

-- Window options
vim.wo.signcolumn = "yes"
