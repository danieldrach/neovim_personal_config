-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use { -- gives the popup interface that describes shortcuts
        "folke/which-key.nvim",
        --event = "VimEnter", 
        config = function() 
            require("which-key").setup {} -- your configuration comes here or leave it empty to use the default settings
        end
    }

    use { -- icons for interface, file types etc.
        "echasnovski/mini.icons",
        version = false, -- Always use the latest version
        config = {}
    }

 
    use {'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = {{'nvim-lua/plenary.nvim'}}} -- fuzzy finder

    use { -- interface color theme
        "catppuccin/nvim", 
        as = "catppuccin", 
        config = function()
            vim.cmd('colorscheme catppuccin-mocha')
        end
    } 

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}) -- advanced code parsing

    use('tpope/vim-fugitive') -- git management

    use {"nvim-tree/nvim-web-devicons", config = {}} -- special icon pack for tree file navigator

    use { -- popup file navigator with a lot of functionality
        'nvim-tree/nvim-tree.lua', 
        requires = {'nvim-tree/nvim-web-devicons'},
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

    use { -- bottom bar that gives extra info on git branch, file, changes, cursor position, etc.
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons', 
            opt = true 
        },
        config = function() 
            require('lualine').setup {}
        end 
    }

end)
