-- Plugins configuration.

local ft_programming = {
    'bash',
    'c',
    'cmake',
    'cpp',
    'html',
    'markdown',
    'python',
    'sh',
    'tex',
    'vim',
    'zsh'
}

return require('packer').startup(function()
    -- Make packer manage itself.
    use 'wbthomason/packer.nvim'

    use 'lewis6991/impatient.nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use 'folke/lsp-colors.nvim'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'mhinz/vim-startify'

    use 'neovim/nvim-lspconfig'
    use {
        'hrsh7th/nvim-cmp',
        config = [[require('plugins.nvim-cmp')]],
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-path',
        }
    }

    use 'lukas-reineke/indent-blankline.nvim'
    use {
      'lewis6991/gitsigns.nvim',
      requires = 'nvim-lua/plenary.nvim'
    }

    -- Themes
    use 'NLKNguyen/papercolor-theme'
end)
