--[[
    Vim keymaps that must work with neovim without any plugin
    The plugins keymaps must be in their repective config files
    To discover keymaps just use RipGrep or :verbose <mode>keymap <key>
]]

vim.g.mapleader = " "

local keymap = vim.keymap.set

-- Unsetters: Do nothing to remove unwanted default behavior
keymap({"n", "v"}, "<Space>",   "<Nop>", { silent = true })
keymap("i",        "<C-j>",     "<Nop>")
keymap("n",        "R",         "<Nop>") -- Disable WTF mode
keymap({"n", "v"}, "<C-Space>", "<Nop>", { silent = true })

-- Fix C-i so you can keymap Tab Key
keymap("n", "<C-i>", "<C-i>")

-- Function Keys
keymap("n", "<F1>", ":vertical help ")
keymap("n", "<F2>", ":verbose map ")

-- File Explorer
keymap("n", "<leader>fe", vim.cmd.Explore)
keymap("n", "<leader>fp", ":find ")

-- Create File
keymap("n", "<leader>nf", ":!touch ")
keymap("n", "<leader>nd", ":!mkdir -p ")

-- Redo on better keymapping
keymap("n", "U", "<C-r>")

-- Reset command-line
keymap("n", "<C-c>", "<cmd>set cmdheight=1<Enter><cmd>echo ''<Enter>")

-- Delete in insert mode
keymap("i", "<C-l>", "<Del>")
keymap("i", "<C-h>", "<BS>")

-- Insert lines/spaces in Normal Mode
keymap("n", "<Enter>", "i<CR><Esc>")
-- Normal Enter/CR when needed
keymap("n", "<A-Enter>", "<CR>")

-- Insert spaces in normal mode
keymap("n", "<C-Space>", "i<Space><Esc>l")

-- Move Text (by Primeagen)
keymap("v", "<C-j>", ":move '>+1<CR>gv=gv", { silent = true })
keymap("v", "<C-k>", ":move '<-2<CR>gv=gv", { silent = true })

-- Auto reselect visual mode when indenting (by Brodie Robertson)
keymap("v", ">", ">gv", { silent = true })
keymap("v", "<", "<gv", { silent = true })

-- Do not override current register on v_paste
keymap("v", "p", [["_dP]])

-- Easy Register Copy/Cut to x
keymap("v", "<leader>xy", "\"xy")
keymap("v", "<leader>xd", "\"xd")
keymap("n", "<leader>xp", "\"xp")

-- Easy Register Copy/Cut to/from System Clipboard (:checkhealth if not working)
keymap("v", "<leader>sy", "\"+y")
keymap("v", "<leader>sd", "\"+d")
keymap("n", "<leader>sp", "\"+p")

-- Quickfix
keymap("n", "<A-n>", vim.cmd.cnext)
keymap("n", "<A-p>", vim.cmd.cprev)
keymap("n", "<A-c>", vim.cmd.cclose)
keymap("n", "<A-o>", vim.cmd.copen)

-- ### MyPlugin: Closing cheracter #############################################

-- Closing character with <Enter> / <CR>
keymap("i", "(<CR>", "(<CR>)<Esc>ko")
keymap("i", "[<CR>", "[<CR>]<Esc>ko")
keymap("i", "[[<CR>", "[[<CR>]]<Esc>ko")
keymap("i", "{<CR>", "{<CR>}<Esc>ko")
keymap("i", "({<CR>", "({<CR>})<Esc>ko")
keymap("i", "`<CR>",  "<CR>`<Esc>ko<Tab>")
keymap("i", "(`<CR>", "(``)<Esc>hi<CR><Esc>ko<Tab>")

-- Add spaces inside closing character (lacking in autopairs plugin)
keymap("i", "( ", "(  )<Esc>hi")
keymap("i", "[ ", "[  ]<Esc>hi")
keymap("i", "[[ ", "[[  ]]<Esc>hi")
keymap("i", "{ ", "{  }<Esc>hi")
keymap("i", "({ ", "({  })<Esc>hi")

-- ### Buffers #################################################################

-- Next
keymap("n", "<leader>bn", ":bnext<CR>", { silent = true })

-- Previous
keymap("n", "<leader>bp", ":bprevious<CR>", { silent = true })

-- Utils
keymap("n", "<leader>bb", ":buffers<CR>")
keymap("n", "<leader>bx", ":buffers<CR>:b")
keymap("n", "<leader>bd", ":bdelete<CR>")
keymap("n", "<leader>ba", ":bufdo bd")

-- ### Tabs ####################################################################

-- New Tab
keymap("n", "<leader>tc", ":tabnew<CR>", { silent = true })

-- Close Tabs
keymap("n", "<leader>tq", ":tabclose<CR>", { silent = true })
keymap("n", "<leader>to", ":tabonly<CR>", { silent = true })

-- Move Tabs - Left/Right
keymap("n", "<leader>th", ":-tabmove<CR>", { silent = true })
keymap("n", "<S-Tab>",    ":-tabmove<CR>", { silent = true })
keymap("n", "<leader>tl", ":+tabmove<CR>", { silent = true })
keymap("n", "<Tab>",      ":+tabmove<CR>", { silent = true })

-- Go To - Next/Prev
keymap("n", "<C-l>",      ":tabnext<CR>",     { silent = true })
keymap("n", "<C-h>",      ":tabprevious<CR>", { silent = true })

-- ### Jumping/Scrolling #######################################################

-- To line keymaps, that I never use. To better moving
keymap({"n", "v"}, "M",     "%")  -- Easier to press %
keymap("n",        "H",     "^")  -- First non-blank character
keymap("n",        "L",     "g_") -- Last non-blank character

-- Emacs inspired keymaps
keymap("n",        "<A-a>", "k^") -- First character of previous line
keymap("n",        "<A-e>", "2$") -- Last character of next line

-- Scrolling
keymap("n", "<C-k>", "12<C-y>")
keymap("n", "<C-j>", "12<C-e>")

keymap("n", "<C-d>", "28<C-e>M")
keymap("n", "<C-u>", "28<C-y>M")

-- Center when jumping
keymap("n", "G", "Gzz")
keymap("n", "`0", "`0zz")
keymap("n", "'0", "'0zz")

-- ### Windows #################################################################

-- Resizing
keymap("n", "<A-k>", "3<C-w>+") -- Up
keymap("n", "<A-j>", "3<C-w>-") -- Down
keymap("n", "<A-h>",  "3<C-w>>") -- Left
keymap("n", "<A-l>", "3<C-w><") -- Right

-- Change current window to a new tab
keymap("n", "<leader>wt", "<C-w>T")

-- Closes every other window and every other tab
keymap("n", "<leader>wo", function()
    vim.cmd.tabonly()
    vim.cmd.only()
    vim.cmd.echo("''")
end)

-- ### Sessions ################################################################

keymap("n", "<leader>sm", ":mksession! .vim-session<Enter>:echo('session created')<Enter>")
keymap("n", "<leader>so", ":source .vim-session<Enter>")
keymap("n", "<leader>sx", ":! rm .vim-session")

-- ### String Utils ###########################################################

-- Find-Replace
keymap("n", "<leader>ss", ":%s/")
keymap("v", "<leader>ss", ":s/")

-- Find-Replace but auto-fills the with last yanked
keymap("n", "<leader>sh", ':%s/<C-r>"/')
keymap("v", "<leader>sh", 'y<Esc>:%s/<C-r>"/')

-- Sort
keymap("v", "<leader>sp", ":sort<Enter>")

local f = require("user.utils.string-functions")

-- Remove trailing spaces
keymap("n", "<leader>st", f.remove_trailing)
