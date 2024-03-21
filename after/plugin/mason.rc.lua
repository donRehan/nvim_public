local status , mason = pcall(require, "mason")
if (not status) then
	return
end

local status2, lspconfig = pcall (require, "mason-lspconfig")
if (not status2) then
	return
end

mason.setup{}
lspconfig.setup{}

-- Installed language servers from Mason
require'lspconfig'.lua_ls.setup{}
