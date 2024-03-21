local status , packer = pcall(require,'packer')
if (not status) then 
	print("Packer is not installed , Reinstall it and try again !")
	return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	use 'tjdevries/colorbuddy.nvim'
    use 'svrana/neosolarized.nvim'
	use 'shaunsingh/nord.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'dkprice/vim-easygrep'
	use 'maxmx03/solarized.nvim'
	use 'morhetz/gruvbox'
	use 'neovim/nvim-lspconfig' 
	use {
	  'hrsh7th/nvim-cmp',
	  requires = {
	    'hrsh7th/cmp-nvim-lsp',
	    'hrsh7th/cmp-buffer',
	    'hrsh7th/cmp-path',
	    'hrsh7th/cmp-nvim-lua',
	  }
	}
    use { 'mfussenegger/nvim-dap' }
	use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
}
	use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
}
    use 'nvim-lua/plenary.nvim'
	use 'mfussenegger/nvim-jdtls'
	use 'overcache/NeoSolarized'
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'L3MON4D3/LuaSnip'
	use 'norcalli/nvim-colorizer.lua'
	use 'lewis6991/gitsigns.nvim'
end)
