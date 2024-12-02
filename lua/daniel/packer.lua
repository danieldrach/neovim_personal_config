-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	use {
	  "folke/which-key.nvim",
	  --event = "VimEnter", 
	  config = function() 
		  require("which-key").setup {} -- your configuration comes here or leave it empty to use the default settings
	  end
	}


	use {
	  "echasnovski/mini.icons",
	  version = false, -- Always use the latest version
	  config = {}
	}

 
	use {'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = {{'nvim-lua/plenary.nvim'}}}
	use { 
		"catppuccin/nvim", 
		as = "catppuccin", 
		config = function()
			vim.cmd('colorscheme catppuccin-mocha')
		end
		} -- this is for changing colors

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('tpope/vim-fugitive')

	use {"nvim-tree/nvim-web-devicons", config = {}}

	use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
	    'nvim-tree/nvim-web-devicons', -- optional
	  },
	  config = function()
	    require("nvim-tree").setup({
	      view = {
		width = 30,
		side = "left",
	      },
	      renderer = {
		icons = {
		  show = {
		    git = true,
		    folder = true,
		    file = true,
		  },
		},
	      },
	    })
	  end,
	}

end)
