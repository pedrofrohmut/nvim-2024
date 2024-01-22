-- Default is "$HOME/.local/share/nvim/lazy/lazy.nvim"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Colorscheme
    {
        "sainnhe/sonokai", lazy = false, priority = 1000,
        config = require("user.plugins.sonokai")
    },

    -- Language support
    {
        "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
        config = require("user.plugins.treesitter")
    },
    {  "maxmellon/vim-jsx-pretty", config = require("user.plugins.vim-jsx-prettier") },

    -- Lsp
    { "neovim/nvim-lspconfig", config = require("user.plugins.lsp-config") },

    -- Language Server
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim", config =  require("user.plugins.mason") },

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        -- load cmp on InsertEnter
        event = "InsertEnter",
        -- these dependencies will only be loaded when cmp loads
        -- dependencies are always lazy-loaded unless specified otherwise
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            -- Snips
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = require("user.plugins.cmp")
    },

    -- Snips
    { "mattn/emmet-vim", config = require("user.plugins.emmet") },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim",  },
        config = require("user.plugins.telescope")
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

    -- Symbols (Tagbar)
    { "simrat39/symbols-outline.nvim", config = require("user.plugins.symbols-outline") },

    -- Tree file explorer
    { "preservim/nerdtree", event = "VeryLazy", config = require("user.plugins.nerdtree") },

    -- Jump plugin like small version of easy motion
    { "justinmk/vim-sneak", config = require("user.plugins.sneak") },

    -- Auto Pairs
    { "windwp/nvim-autopairs", config = require("user.plugins.vim-autopairs") },

    -- Surrounder for Simple Stuff
    { "tpope/vim-surround", config = require("user.plugins.vim-surrond") },

    -- Dot command now works with some plugins too
    { "tpope/vim-repeat" },

    -- Commenter
    { "tomtom/tcomment_vim", config = require("user.plugins.tcomment-vim") },

    -- Aligner
    { "tommcdo/vim-lion" },

    -- Status Line
    { "nvim-lualine/lualine.nvim", config = require("user.plugins.lualine") },
}

local options = {}

require("lazy").setup(plugins, options)
