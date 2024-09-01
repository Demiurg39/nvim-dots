require("neoconf").setup()
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local on_attach = require("utils.lsp").on_attach -- For custom mappings

lspconfig.servers = { "lua_ls", "clangd", "pyright" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(lspconfig.servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
end

-- configuring single servers
lspconfig.clangd.setup {
    on_attach = function(client, buffnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        on_attach(client, buffnr)
    end,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
}

lspconfig.pyright.setup {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,

    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off", -- Disable type checking diagnostics
            },
        },
    },
}
