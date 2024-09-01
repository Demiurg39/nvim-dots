require "nvchad.configs.nvimtree"

local function on_attach(bufnr)
    local api = require "nvim-tree.api"
    local keymap = vim.keymap.set

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    keymap("n", "<BS>", api.tree.change_root_to_parent, opts "Up")
    keymap("n", ".", api.tree.change_root_to_node, opts "Change Directory")
end

vim.cmd [[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup {
    on_attach = on_attach,
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 35,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
}
