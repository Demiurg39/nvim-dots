-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@diagnostic disable-next-line: undefined-doc-name
---@type ChadrcConfig
local M = {}

M.ui = {
    ------------------------------- base46 -------------------------------------
    theme = "onedark",
    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
    integrations = {
        "blankline",
        "cmp",
        "git",
    },
    changed_themes = {},
    transparency = true,

    cmp = {
        icons = true,
        lspkind_text = true,
        style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    },

    telescope = { style = "borderless" }, -- borderless / bordered

    ------------------------------- nvchad_ui modules -----------------------------
    statusline = {
        theme = "default", -- default/vscode/vscode_colored/minimal
        -- default/round/block/arrow separators work only for default statusline theme
        -- round and block will work for minimal theme only
        separator_style = "default",
        order = nil,
        modules = nil,
    },

    -- lazyload it when there are 1+ buffers
    tabufline = {
        enabled = true,
        lazyload = true,
        order = { "treeOffset", "buffers", "tabs", "btns" },
        modules = nil,
    },

    cheatsheet = { theme = "grid" }, -- simple/grid

    lsp = { signature = true },
}

return M
