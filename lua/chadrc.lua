-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "catppuccin",
    transparency = true,

    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },

    integrations = {
        "cmp",
        "git",
        "dap",
    },
}

M.ui = {
    cmp = {
        icons_left = true, -- only for non-atom styles!
        lspkind_text = true,
        style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
        format_colors = {
            tailwind = true, -- will work for css lsp too
            icon = "󱓻",
        },
    },

    statusline = {
        enabled = true,
        theme = "minimal", -- default/vscode/vscode_colored/minimal
        -- default/round/block/arrow separators work only for default statusline theme
        -- round and block will work for minimal theme only
        separator_style = "round",
        order = nil,
        modules = nil,
    },

    tabufline = {
        enabled = true,
        lazyload = true,
        order = { "treeOffset", "buffers", "tabs", "btns" },
        modules = nil,
    },
}

M.nvdash = {
    load_on_startup = true,
    header = require("utils.dashboards").ayanami_rei,
    buttons = {
        { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
        { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
        { txt = "󰈭  Find Word", keys = "Spc f w", cmd = "Telescope live_grep" },
        { txt = "󱥚  Themes", keys = "Spc t h", cmd = ":lua require('nvchad.themes').open()" },
        { txt = "  Mappings", keys = "Spc c h", cmd = "NvCheatsheet" },

        { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },

        {
            txt = function()
                local stats = require("lazy").stats()
                local ms = math.floor(stats.startuptime) .. " ms"
                return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
            end,
            hl = "NvDashLazy",
            no_gap = true,
        },

        { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
    },
}

M.colorify = {
    enabled = true,
    mode = "virtual", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
}

M.term = {
    winopts = { number = false },
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
        row = 0.3,
        col = 0.25,
        width = 0.8,
        height = 0.7,
        border = "single",
    },
}

return M
