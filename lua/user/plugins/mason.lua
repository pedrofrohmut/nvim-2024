return function()
    require("mason").setup({})

    require("mason-lspconfig").setup({
        ensure_installed = {
            "clangd",        -- C/C++
            "cssls",         -- CSS
            --"elixirls",      -- Elixir
            --"hls",           -- Haskell
            "html",          -- HTML
            "lua_ls",        -- Lua
            --"omnisharp",     -- CSharp
            "pyright",       -- Python
            "rust_analyzer", -- Rust
            "tsserver",      -- Typescript/Javascript
        }
    })
end
