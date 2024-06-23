local status, nvim_lsp = pcall(require, 'lspconfig')
local cmp_nvim = require('cmp_nvim_lsp').default_capabilities()

if (not status) then return end

local protocol = require('vim.lsp.protocol')
local on_attach = function(client, bufnr)
-- Set up completion using nvim_cmp with LSP source

end

nvim_lsp.clangd.setup {
      capabilities = cmp_nvim.default_capabilities,
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
      },
 	  on_attach = function(client, bufnr)
 		client.server_capabilities.semanticTokensProvider = nil
 	 end,
}

nvim_lsp.tsserver.setup{
	  on_attach = function(client, bufnr)
		client.server_capabilities.semanticTokensProvider = nil
	 end,

}

nvim_lsp.pylsp.setup{
 		  on_attach = function(client, bufnr)
 		client.server_capabilities.semanticTokensProvider = nil
 	 end,

}

nvim_lsp.angularls.setup{
	cmd = { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" },
	filetypes = {'typescriptreact'},
	on_new_config = function(new_config,new_root_dir)
		new_config.cmd = { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" }
	end,
}

nvim_lsp.jdtls.setup{
  cmd = {'jdtls'},
  root_dir = require('lspconfig/util').root_pattern(".git", "pom.xml"),
   on_attach = function(client, bufnr)
     client.server_capabilities.semanticTokensProvider = nil
  end,
}

nvim_lsp.html.setup{
  capabilities = cmp_nvim,
}

nvim_lsp.bashls.setup{}

nvim_lsp.cssls.setup {
  capabilities = cmp_nvim,
}

nvim_lsp.emmet_language_server.setup {
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- **Note:** only the options listed in the table are supported.
  init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
}
