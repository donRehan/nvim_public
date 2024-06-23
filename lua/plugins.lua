local status , packer = pcall(require,'packer')
if (not status) then 
	print("Packer is not installed , Reinstall it and try again !")
	return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	use 'tjdevries/colorbuddy.nvim'
	use 'rhysd/vim-clang-format'
    use 'svrana/neosolarized.nvim'
	use 'shaunsingh/nord.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'dkprice/vim-easygrep'
	use 'maxmx03/solarized.nvim'
	use 'ellisonleao/gruvbox.nvim'
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
		use {
		  "startup-nvim/startup.nvim",
		  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
		  config = function()
			require"startup".setup()
		  end
		}
	use 'mfussenegger/nvim-jdtls'
	use 'overcache/NeoSolarized'
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'L3MON4D3/LuaSnip'
	use 'norcalli/nvim-colorizer.lua'
	use {
	  "folke/which-key.nvim",
	  config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup {
		  -- your configuration comes here
		  -- or leave it empty to use the default settings
		  -- refer to the configuration section below
		}
	  end
	}
	use 'lewis6991/gitsigns.nvim'
	use '/nvim-lualine/lualine.nvim'
	use 'martinsione/darkplus.nvim'
	use 'craftzdog/solarized-osaka.nvim'
	use 'nvim-treesitter/nvim-treesitter-angular'
	use 'rose-pine/neovim'
	use 'preservim/nerdtree'
	use 'hrsh7th/cmp-cmdline'
	use {
		"X3eRo0/dired.nvim",
		requires = "MunifTanjim/nui.nvim",
		config = function()
			require("dired").setup {
				path_separator = "/",
				show_banner = false,
				show_icons = false,
				show_hidden = true,
				show_dot_dirs = true,
				show_colors = true,
			}
		end
	}
end)
