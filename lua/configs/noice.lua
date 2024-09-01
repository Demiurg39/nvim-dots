local noice = require "noice"
vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#000000" })

noice.setup {
    background_colour = "#100000",
    routes = {
        {
            view = "notify",
            filter = { event = "msg_showmode" },
        },
    },
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
        signature = {
            enabled = false,
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
    },
}
