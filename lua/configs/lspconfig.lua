-- require("neoconf").setup()

-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

local servers = {
  html = {},
  cssls = {},
  clangd = {},
  lua_ls = {},
}

for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities

  lspconfig[name].setup(opts)
end

lspconfig.clangd.setup {
    on_attach = function(client, buffnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        nvlsp.on_attach(client, buffnr)
    end
}
