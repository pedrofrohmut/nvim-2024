return function()
    local cmp = require("cmp")
    local ls = require("luasnip")

    cmp.setup({
        completion = {
            autocomplete = false,
        },
        snippet = {
            expand = function(args) ls.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
            { name = "buffer" },
            { name = "path" },
        })
    })

    local lsp_completion = {
        config = {
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
            })
        }
    }

    vim.keymap.set("i", "<C-j>", function()
        if not cmp.visible() then
            cmp.complete(lsp_completion)
        else
            cmp.abort()
        end
    end)

    local snip_completion = {
        config = {
            sources = cmp.config.sources({
                { name = "luasnip" },
            })
        }
    }

    vim.keymap.set("i", "<C-k>", function()
        if not cmp.visible() then
            cmp.complete(snip_completion)
        else
            cmp.abort()
        end
    end)

    local path_completion = {
        config = {
            sources = cmp.config.sources({
                { name = "path" },
            })
        }
    }

    vim.keymap.set("i", "<C-f>", function()
        if not cmp.visible() then
            cmp.complete(path_completion)
        else
            cmp.abort()
        end
    end)

    vim.keymap.set("i", "<C-o>", function()
        if cmp.visible() then
            cmp.abort()
        end
    end)
end
