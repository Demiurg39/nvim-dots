local plugins = {

    { "folke/neoconf.nvim" },

    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },

    { "Bilal2453/luvit-meta", lazy = true },

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        opts = require "configs.treesitter",
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require "configs.lint"
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform",
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        opts = require "configs.cmp",
    },

    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require "configs.nvim-tree"
        end,
    },

    { "mfussenegger/nvim-dap" },

    { "nvim-neotest/nvim-nio" },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        event = "VeryLazy",
        config = function()
            require "configs.dap"
        end,
    },

    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        lazy = true,
        config = true,
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        lazy = true,
        config = true,
    },
}

return plugins
