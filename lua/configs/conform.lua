local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        css = { "prettier" },
        html = { "prettier" },
        sh = { "shfmt" },
    },

    formatters = {
        clang_format = {
            prepend_args = {
                "-style={BasedOnStyle: LLVM, IndentWidth: 4}",
            },
        },

        black = {
            prepend_args = { "--fast", "--line-length", "80" },
        },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

return options
