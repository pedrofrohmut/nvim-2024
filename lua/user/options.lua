--[[
    VIM OPTIONS   :help options
]]

-- Indentation and tabing
vim.opt.expandtab   = true
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = 4
vim.opt.tabstop     = 4
vim.opt.smartindent = true

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch  = false

-- Appearance
vim.opt.signcolumn     = "yes:1"
vim.opt.colorcolumn    = { "81", "101" }
vim.opt.cmdheight      = 1
vim.opt.termguicolors  = true
vim.opt.showmode       = false
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.wildmenu       = true

-- Behavior
vim.opt.splitright    = true
vim.opt.splitbelow    = true
vim.opt.sidescrolloff = 8
vim.opt.cursorline    = true
vim.opt.mouse         = "a"
vim.opt.updatetime    = 250
--vim.opt.wrap          = false

-- Files
vim.opt.fileformat  = "unix"
vim.opt.backup      = false
vim.opt.writebackup = false
vim.opt.autoread    = true

-- CMP
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.cmd [[ set path=$PWD/** ]]
