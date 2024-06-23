--imports 
local builtin = require('telescope.builtin')
local telescope = require('telescope')
telescope.load_extension('file_browser')

-- Neovim configuration for the 'dired' plugin

-- Set up the 'dired' plugin with custom options
require("dired").setup({
    path_separator = "/",                -- Use '/' as the path separator
    show_hidden = true,                  -- Show hidden files
    show_icons = false,                  -- Show icons (patched font required)
    show_banner = false,                 -- Do not show the banner
    hide_details = false,                -- Show file details by default
    sort_order = "name",                 -- Sort files by name by default

    -- Define keybindings for various 'dired' actions
    keybinds = {
        dired_enter = "<cr>",
        dired_back = "-",
        dired_up = "_",
        dired_rename = "R",
        -- ... (add more keybindings as needed)
        dired_quit = "q",
    },

    -- Define colors for different file types and attributes
    colors = {
        DiredDimText = { link = {}, bg = "NONE", fg = "505050", gui = "NONE" },
        DiredDirectoryName = { link = {}, bg = "NONE", fg = "9370DB", gui = "NONE" },
        -- ... (define more colors as needed)
        DiredMoveFile = { link = {}, bg = "NONE", fg = "ff3399", gui = "bold" },
    },
})

telescope.setup {
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
			height = vim.o.lines,
			width = vim.o.columns,
			prompt_position = "top",
			preview_height = 0.6,
		}
	}
}

--which-key nvim
local wk = require("which-key")
wk.setup{}
-- just need to set the shortcut for it

-- nvim lua line
require('lualine').setup{
 	options = {
----theme = 'powerline',
 	component_separators = { left = '', right = ''},
     section_separators = { left = '', right = ''}
 }
}

--General Vim stuff
vim.opt.termguicolors = true
vim.api.nvim_command('set nowrap')
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.cmd('set list')
vim.cmd('set listchars=')
vim.o.listchars = 'tab:⇥ '
vim.cmd('set listchars+=precedes:<,extends:>')
vim.cmd('set colorcolumn=72')
vim.g.mapleader = ' ' -- change leader key to space
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
-- vim.cmd([[colorscheme solarized-osaka-night]])
--vim.cmd([[colorscheme gruvbox]])
vim.cmd([[colorscheme neosolarized]])
--vim.cmd('hi Normal guibg=none')
--vim.cmd('hi NormalFloat guibg=none')

-- Move between splits using CTRL-l and CTRL-h
vim.api.nvim_set_keymap('n', '<C-k>', 'gt', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', 'gT', {noremap = true})

--statusline configuration
--vim.cmd('hi StatusLine guifg=#93a1a1')
--vim.cmd('hi StatusLine guibg=#002B36')
vim.cmd('hi LineNr guibg=#073642')
--vim.cmd('hi Tabline guibg=#073642')
--vim.cmd('hi Tabfill guibg=#073642')

vim.o.statusline = '   %<%f %h%m%r%=%-14.(%l,%c%V%) %P   '

-- Select all
-- Remove  later  , This conflicts with C-a binding
-- vim.api.nvim_set_keymap('n', '<C-a>', 'gg<S-v>G', {noremap = true})
vim.api.nvim_set_keymap('n', '<M-x>', ':', {noremap = true})

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], {desc = "Paste over highlighted text"})

-- remap ctrl w q to leader x and ZZ to leader X
vim.keymap.set("n", "<leader>x", ":Telescope commands<CR>",{desc = "Show commands"})
vim.keymap.set("n", "<leader>bk", ":bdel<CR>",{desc = "Buffer Kill"})
vim.keymap.set("n", "<leader>qq", ":q!<CR>",{desc = "Close disregard changes"})
vim.keymap.set("n", "<leader>qe", ":q<CR>",{desc = "Close "})
vim.keymap.set("n", "<leader>qa", ":qa<CR>",{desc = "Close all"})
vim.keymap.set("n", "<leader>fs", ":w <CR>",{desc = "Save"})
vim.keymap.set("n", "<leader>ww", ":wall <CR>",{desc = "Save all open"})
vim.keymap.set("n", "<leader>wq", "ZZ",{desc = "Close w/ saving"})

-- End of General Vim Stuff

local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

vim.diagnostic.config{
  float={border=_border}
}

-- Telescope stuff
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fe', telescope.extensions.file_browser.file_browser, 
	{desc = "Telescope browser"})
vim.keymap.set('n', '<leader>.', builtin.find_files, {desc = "Find files"})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {desc = "Find diagnostics"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "File grep"})
vim.keymap.set('n', '<leader>,', builtin.buffers, {desc = "Find buffers"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Find help tags"})

-- sync yanking and p with system clipboard
vim.cmd('set clipboard=unnamedplus')
-- Restore cursor to vertical cursor after exiting vim
vim.cmd('au VimLeave * set guicursor=a:ver100')

-- setting up lua and lsp
---- Goto definitions, types, implementations, references
vim.api.nvim_set_keymap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true,
desc = "Goto definition"})
vim.api.nvim_set_keymap('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true,
desc = "Goto declaration"})
vim.api.nvim_set_keymap('n', '<leader>al', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true, silent = true, 
	desc = "Code action"})
--vim.api.nvim_set_keymap('n', '<leader>aa', '<cmd>ClangFormat<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true,
desc = "Goto implementation"})
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true,
desc="Rename"})
vim.api.nvim_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true,
desc = "Grep references"})
vim.api.nvim_set_keymap('n', '<leader>fj', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true ,
desc = "Open diagnostics"})
vim.api.nvim_set_keymap('n', '<leader>K', ': lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true ,
desc = "Show method details"})
vim.api.nvim_set_keymap('n', '<leader>c', ': Copilot<CR>', { noremap = true, silent = true ,
desc = "Copilot enable"})

--vim.api.nvim_command('highlight Comment ctermfg=DarkGreen')
--vim.api.nvim_command('highlight Type ctermfg=darkcyan')
--vim.api.nvim_command('highlight Statement ctermfg=DarkYellow')
--vim.api.nvim_command('highlight Constant ctermfg=Darkred')
--vim.api.nvim_command('highlight Preproc ctermfg=Magenta')

---- vim startup configuration
local startup = require('startup')
local headers = require('startup.headers')
startup.setup(
)

require'nvim-treesitter.configs'.setup {
	-- A directory to install the parsers into.
	-- If this is excluded or nil parsers are installed
	-- to either the package dir, or the "site" dir.
	-- If a custom path is used (not nil) it must be added to the runtimepath.
	--parser_install_dir = "/some/path/to/store/parsers",

	-- A list of parser names, or "all"
	--ensure_installed = { "c", "lua", "rust" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	--sync_install = false,

	-- Automatically install missing parsers when entering buffer
	--auto_install = false,

	-- List of parsers to ignore installing (for "all")
	--ignore_install = { "javascript" },

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- list of language that will be disabled
	--	disable = { "c", "rust" },

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}
