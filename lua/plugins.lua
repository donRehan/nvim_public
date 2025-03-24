local status , packer = pcall(require,'packer')
if (not status) then 
	print("Packer is not installed , Reinstall it and try again !")
	return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	use 'tjdevries/colorbuddy.nvim'
	use 'rhysd/vim-clang-format'
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
  'nvim-telescope/telescope.nvim', tag = '0.1.1'
}
    use 'nvim-lua/plenary.nvim'
--		use {
--		  "startup-nvim/startup.nvim",
--		  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
--		  config = function()
--			require"startup".setup()
--		  end
--		}
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
	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({
	  'projekt0n/github-nvim-theme',
	  config = function()
		require('github-theme').setup({
		  -- ...
		})

		vim.cmd('colorscheme github_dark')
	  end
	})
	use {'christianchiarulli/nvcode-color-schemes.vim'}
	use 'tjdevries/express_line.nvim'
	use 'ibhagwan/fzf-lua'
	require("packer").startup(function()
	  use({
		"stevearc/oil.nvim",
		config = function()
		  require("oil").setup()
		end,
	  })
	end)
	use({
    'MeanderingProgrammer/markdown.nvim',
    as = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    after = { 'nvim-treesitter' },
    requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
    -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
    -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
    config = function()
        require('render-markdown').setup({})
    end,
})
	use 'ryanoasis/vim-devicons'
	use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'Yazeed1s/minimal.nvim'
  use 'mbbill/undotree'
  use 'nomis51/nvim-xcode-theme'
  use 'metalelf0/base16-black-metal-scheme'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'andrew-george/telescope-themes'
  use("oxfist/night-owl.nvim")
  use {
    'NeogitOrg/neogit',
    tag = 'v0.0.1'
  }
  use 'folke/tokyonight.nvim'
  use 'roobert/tailwindcss-colorizer-cmp.nvim'
  use 'blazkowolf/gruber-darker.nvim'
  use 'akinsho/org-bullets.nvim'
  use {'nvim-orgmode/orgmode', config = function()
  require('orgmode').setup{}
end
}
  use {
    "chipsenkbeil/org-roam.nvim",
    tag = "0.1.0",
    requires = {
      {
        "nvim-orgmode/orgmode",
        tag = "0.3.4",
      },
    },
    config = function()
      require("org-roam").setup({
        directory = "~/orgfiles",
      })
    end
  }
  use "kylechui/nvim-surround"
  use "sotte/presenting.nvim"
  use 'svrana/neosolarized.nvim'
  use 'loctvl842/monokai-pro.nvim'
  use 'tanvirtin/monokai.nvim'
end)
