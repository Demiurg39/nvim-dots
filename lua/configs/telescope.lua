local opts = require "nvchad.configs.telescope"

opts.defaults = opts.defaults or {}

table.insert(opts.defaults, {
    path_display = { "smart" },
    mappings = {
        i = {
            ["<C-h>"] = "which_key",
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<leader>q"] = "close",
        },

        n = { ["<leader>q"] = "close" },
    },
})

local options = {

    pickers = {

        live_grep = {
            theme = "dropdown",
            previewer = true,
        },

        find_buffer = {
            theme = "dropdown",
            previewer = true,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
    },
}

return options
