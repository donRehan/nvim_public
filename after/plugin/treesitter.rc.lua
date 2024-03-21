local status , ts = pcall(require, 'nvim-treesitter.configs')
if ( not status ) then return 
	print("error with treesitter")
end

ts.setup {
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		'java',
		'lua',
		'markdown',
		'javascript',
		'c',
		'python'
	},
	autotag = {
		enable = true,
	}
}
