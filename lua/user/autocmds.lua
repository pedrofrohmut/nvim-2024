local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- FileType Group
augroup("FileTypeGroup", { clear = true })

-- Remove auto insert comments next line
autocmd("FileType", {
    group = "FileTypeGroup", pattern = "*", command = "setlocal formatoptions-=cro" })

-- Set 4 indent to all files
autocmd("FileType", {
    group = "FileTypeGroup", pattern = "*", command = "setlocal shiftwidth=4" })

-- Set 2 for exceptions
-- autocmd("FileType", {
--     group = "FileTypeGroup", pattern = {"html"}, command = "setlocal shiftwidth=2 "})

-- CursorLine Group
augroup("CursorLine", { clear = true })

-- Set cursorline on enter
autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
    group = "CursorLine", pattern = "*", command = "setlocal cursorline" })

-- Set nocursorline on leave
autocmd("WinLeave", {
    group = "CursorLine", pattern = "*", command = "setlocal nocursorline" })

-- Remove Trailing White Spaces onSave (And dont show errors)
autocmd("BufWritePre", { pattern = "*", command = ":%s/\\s\\+$//e" })
