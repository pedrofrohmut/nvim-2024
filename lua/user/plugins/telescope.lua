return function()
    local actions = require("telescope.actions")

    require("telescope").setup({
        defaults = {
            file_ignore_patterns = {
                "bin/", "obj/", "%.o", "%.out", "node_modules/", ".git/", "target/",
                "_build", ".elixir_ls", "deps", "%.lock", "package-lock.json", "dist/",
                ".next",
            },
            mappings = {
                i = {
                    -- ["<C-j>"] = actions.move_selection_next,
                    -- ["<C-k>"] = actions.move_selection_previous,
                    ["<C-s>"] = actions.file_split,
                    ["<C-v>"] = actions.file_vsplit,
                },
                n = {
                    ["<C-s>"] = actions.file_split,
                }
            },
        },
        pickers = {
            find_files = {
                hidden = true,
                --no_ignore = true,
            }
        },
        extensions = {}
    })

    require("telescope").load_extension("fzf")

    local no_preview = function()
        return require("telescope.themes").get_dropdown({
            borderchars = {
                { "─",  "│", "─", "│", "┌", "┐", "┘", "└"},
                prompt  = { "─",  "│", " ", "│", "┌", "┐", "│", "│"},
                results = { "─",  "│", "─", "│", "├", "┤", "┘", "└"},
                preview = { "─",  "│", "─", "│", "┌", "┐", "┘", "└"},
            },
            width = 0.8,
            previewer = false,
            prompt_title = false
        })
    end

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files)
    vim.keymap.set("n", "<leader>fg", builtin.live_grep)
    vim.keymap.set("n", "<leader>fb", builtin.buffers)
    vim.keymap.set("n", "<leader>fh", builtin.help_tags)
    vim.keymap.set("n", "<leader>fk", builtin.keymaps)

    -- Find files with hidden and gitignored
    vim.keymap.set("n", "<leader>fa", function()
        builtin.find_files({ no_ignore = true, hidden = true })
    end)

    local grep_search = function()
        local ok_grep, err = pcall(function ()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

        if not ok_grep and err ~= "Keyboard interrupt" then
            error(err)
        end

        vim.cmd.echo("''")
    end

    vim.keymap.set("n", "<leader>fs", grep_search)
    vim.keymap.set("n", "<C-s>", grep_search)

    vim.keymap.set("n", "<C-f>", function()
        -- builtin.current_buffer_fuzzy_find(no_preview())
        builtin.current_buffer_fuzzy_find()
    end)

    vim.keymap.set("n", "<C-q>", function()
        builtin.find_files(no_preview())
    end)

    -- LSP Mappings
    vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions)
    vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations)
    vim.keymap.set("n", "<leader>gr", builtin.lsp_references)
    vim.keymap.set("n", "<leader>gt", builtin.lsp_type_definitions)

    vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
    vim.keymap.set("n", "<leader>fw", builtin.lsp_dynamic_workspace_symbols)

    vim.keymap.set("n", "<leader>sd", builtin.lsp_document_symbols)
    vim.keymap.set("n", "<leader>sw", builtin.lsp_workspace_symbols)
end
