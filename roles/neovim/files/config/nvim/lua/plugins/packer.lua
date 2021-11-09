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
        config = [[require('plugins.lualine')]],
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
        'neovim/nvim-lspconfig',
        config = [[require('plugins.lspconfig')]],
    }
    use {
        'nvim-telescope/telescope.nvim',
        config = [[require('plugins.telescope')]],
        requires = 'nvim-lua/plenary.nvim'
    }
    use {
        'folke/trouble.nvim',
        config = [[require('plugins.trouble')]],
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'folke/todo-comments.nvim',
        config = [[require('plugins.todo-comments')]],
        requires = 'nvim-lua/plenary.nvim'
    }
    use 'folke/lsp-colors.nvim'
    use {
        'kyazdani42/nvim-tree.lua',
        config = [[require('plugins.nvim-tree')]],
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'mhinz/vim-startify'

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

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = [[require('plugins.indent-blankline')]],
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = [[require('plugins.gitsigns')]],
        requires = 'nvim-lua/plenary.nvim'
    }

    -- Themes
    use 'NLKNguyen/papercolor-theme'
end)
