local map = vim.keymap.set

-- Mappings --------------------------------------------------------------------

map("n", "<F11>", function()
    vim.cmd.LspRestart()
    vim.cmd.echo('"Lsp Restarted"')
end)
map("n", "<F12>",      vim.cmd.LspInfo,           { silent = true })
map("n", "<C-p>",      vim.diagnostic.goto_prev,  { silent = true })
map("n", "<C-n>",      vim.diagnostic.goto_next,  { silent = true })
map("n", "<leader>do", vim.diagnostic.open_float, { silent = true })
map("n", "<leader>dl", vim.diagnostic.setloclist, { silent = true })
map("n", "<leader>dd", vim.diagnostic.disable,    { silent = true })
map("n", "<leader>de", vim.diagnostic.enable,     { silent = true })
map("n", "<leader>cf", vim.lsp.buf.format,        { silent = true })

-- Config ----------------------------------------------------------------------

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
-- EXTRA
    float = {
        focusable = true,
        style = "minimal",
        source = "always",
        header = "",
        prefix = ""
    }
-- EXTRA
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        -- Code navigation
        map('n', 'gD', vim.lsp.buf.declaration, opts)
        map('n', 'gd', vim.lsp.buf.definition, opts)
        map('n', 'gi', vim.lsp.buf.implementation, opts)
        map('n', 'gt', vim.lsp.buf.type_definition, opts)
        map('n', 'gr', vim.lsp.buf.references, opts)

        -- Code change and hinting
        map('n', 'K', vim.lsp.buf.hover, opts)
        map('n', 'gs', vim.lsp.buf.signature_help, opts)
        map('n', '<space>rn', vim.lsp.buf.rename, opts)
        map({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)

        -- Completion (Completion without need of a extra plugin)
        --map('i', '<C-j>', vim.lsp.omnifunc, opts)

        -- Format
        map('n', '<space>cf', function()
            vim.lsp.buf.format { async = true }
        end, opts)

        -- Workspaces
        map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        map('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
    end,
})


-----@diagnostic disable-next-line: unused-local
--local on_attach = function(client, bufnr)
--    local bufopts = { silent = true, buffer = bufnr }
--
--    -- Enable completion triggered by <c-x><c-o>
--    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
--
--    local telescope_builtin = require("telescope.builtin")
--
--    map("n", "gd", function()
--        if not pcall(telescope_builtin.lsp_definitions) then
--            vim.lsp.buf.definition()
--        end
--    end, bufopts)
--
--    map("n", "gt", function()
--        if not pcall(telescope_builtin.lsp_type_definitions) then
--            vim.lsp.buf.type_definition()
--        end
--    end, bufopts)
--
--    map("n", "gi", function()
--        if not pcall(telescope_builtin.lsp_implementations) then
--            vim.lsp.buf.implementation()
--        end
--    end, bufopts)
--
--    map("n", "gr", function()
--        if not pcall(telescope_builtin.lsp_references) then
--            vim.lsp.buf.references()
--        end
--    end, bufopts)
--
--    -- Mappings.
--    map("n", "gD", vim.lsp.buf.declaration, bufopts)
--    map("n", "K", vim.lsp.buf.hover, bufopts)
--    map("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
--    map("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
--end
