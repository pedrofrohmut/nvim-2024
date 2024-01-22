local highlight = vim.api.nvim_set_hl

-- Red Highlight the Matching Scope Character () [] {} ...
highlight(0, "MatchParen", { bold = true, fg = "#ff3333", bg = "none" })

-- Blue and Gray for Tabline (Overriding colorscheme ones)
highlight(0, "TablineSel", { fg = "#88ffff", bg = "#323232" })
highlight(0, "Tabline", { fg = "#989898", bg = "#252525" })
