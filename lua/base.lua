--imports 
local builtin = require('telescope.builtin')
local telescope = require('telescope')
telescope.load_extension('file_browser')

--General Vim stuff
vim.opt.termguicolors = true
vim.api.nvim_command('set nowrap')
vim.o.tabstop = 4
vim.o.shiftwidth = 4
--vim.cmd('set cursorline')
--
---- Set the color scheme
---- Enable line numbers
-- Set relative numbers
vim.cmd('set rnu')

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Enable the theme
--vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme neosolarized]])
vim.cmd('hi Normal guibg=none')

-- Move between splits using CTRL-l and CTRL-h
vim.api.nvim_set_keymap('n', '<C-l>', 'gt', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', 'gT', {noremap = true})

--statusline configuration
vim.cmd('hi StatusLine guifg=#93a1a1')
vim.cmd('hi StatusLine guibg=#002B36')

-- End of General Vim Stuff

-- Telescope stuff
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', telescope.extensions.file_browser.file_browser, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--vim.keymap.set('n', '<leader>fj', lua vim.diagnostic.open_float(), {})

-- sync yanking and p with system clipboard
vim.cmd('set clipboard=unnamedplus')
-- Restore cursor to vertical cursor after exiting vim
vim.cmd('au VimLeave * set guicursor=a:ver100')

-- setting up lua and lsp
---- Goto definitions, types, implementations, references
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fj', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

--vim.api.nvim_command('highlight Comment ctermfg=DarkGreen')
--vim.api.nvim_command('highlight Type ctermfg=darkcyan')
--vim.api.nvim_command('highlight Statement ctermfg=DarkYellow')
--vim.api.nvim_command('highlight Constant ctermfg=Darkred')
--vim.api.nvim_command('highlight Preproc ctermfg=Magenta')
