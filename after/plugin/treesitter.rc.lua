local status , ts = pcall(require, 'nvim-treesitter.configs')
if ( not status ) then return 
	print("error with treesitter")
end

-- Make only for html and css ?
ts.setup {
	highlight = {
		enable = true,
	-- 	disable = { 'javascript', 'typescript', 'json', 'cpp' , 'c', 
	-- 	'python'},
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
	}}
