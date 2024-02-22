---@diagnostic disable: different-requires
local lspconfig = require "lspconfig"

local config = require "plugins.configs.lspconfig"

local on_attach = config.on_attach
local capabilities = config.capabilities

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "pyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.ruff_lsp.setup {
  on_attach = function(client, _)
    -- Disable hover in favour of Pyright
    client.server_capabilities.hoverProvider = false
  end,
  capabilities = capabilities,
}
