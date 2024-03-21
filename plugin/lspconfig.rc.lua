local status, nvim_lsp = pcall(require, 'lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

if (not status) then return end

local protocol = require('vim.lsp.protocol')
local on_attach = function(client, bufnr)
-- Set up completion using nvim_cmp with LSP source

end

nvim_lsp.tsserver.setup{}

nvim_lsp.pylsp.setup{}

nvim_lsp.jdtls.setup{
  cmd = {'jdtls'},
  root_dir = require('lspconfig/util').root_pattern(".git", "pom.xml"),
  on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
 end,
}

nvim_lsp.html.setup{
  capabilities = capabilities,
}

nvim_lsp.cssls.setup {
  capabilities = capabilities,
}
