return function()
    -- Setup language servers.
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.clangd.setup({
        capabilities = capabilities
    })

    lspconfig.cssls.setup({
        capabilities = capabilities
    })

    lspconfig.html.setup({
        capabilities = capabilities
    })

    -- Lua
    lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim", "use" }
                }
            }
        },
    })

    lspconfig.pyright.setup({
        capabilities = capabilities
    })

    lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        -- Server-specific settings. See `:help lspconfig-setup`
        settings = {
            ["rust-analyzer"] = {},
        },
    })

    lspconfig.tsserver.setup({
        capabilities = capabilities
    })
end
