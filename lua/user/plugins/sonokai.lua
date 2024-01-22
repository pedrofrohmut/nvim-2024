return function()
    vim.opt.background = "dark"

    -- This configuration options should be placed before `colorscheme sonokai`.
    vim.g.sonokai_style = "shusia"
    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_transparent_background = 2

    vim.cmd.colorscheme("sonokai")
end
