local opts = require "nvchad.configs.cmp"
opts.sources = opts.sources or {}
table.insert(opts.sources, {
    name = "lazydev",
    group_index = 0, -- set group index to 0 to skip loading LuaLS completions
})

table.insert(opts.sources, { name = "nvim_lsp", max_item_count = 350 })

return opts
