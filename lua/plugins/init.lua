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
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        event = "VeryLazy",
        config = function()
            require "configs.mason-lspconfig"
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
        "rshkarin/mason-nvim-lint",
        dependencies = { "mfussenegger/nvim-lint" },
        event = "VeryLazy",
        config = function()
            require "configs.mason-lint"
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform",
    },

    {
        "zapling/mason-conform.nvim",
        dependencies = { "conform.nvim" },
        event = "VeryLazy",
        config = function()
            require "configs.mason-conform"
        end,
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
        "nvimdev/lspsaga.nvim",
        dependency = { "neovim/nvim-lspconfig" },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require "configs.lspsaga"
        end,
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
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

    {
        "folke/noice.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
        event = "VeryLazy",
        config = function()
            require "configs.noice"
        end,
    },

    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VimEnter",
        config = function()
            require "configs.dashboard"
        end,
    },
}

return plugins
