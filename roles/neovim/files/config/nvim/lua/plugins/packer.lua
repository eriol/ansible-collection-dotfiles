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

return require('packer').startup({function()
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
        'nvim-lua/lsp-status.nvim'
    }
    use { "jose-elias-alvarez/null-ls.nvim",
        config = [[require('plugins.lspconfig')]],
        requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}
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
        'L3MON4D3/LuaSnip',
        config = [[require('plugins.luasnip')]],
    }
    use {
        'hrsh7th/nvim-cmp',
        config = [[require('plugins.nvim-cmp')]],
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        }
    }
    use {
        'windwp/nvim-autopairs',
        after = { "nvim-cmp" },
        config = [[require('plugins.nvim-autopairs')]],
    }
    use {
        'numToStr/Comment.nvim',
        config = [[require('plugins.comment')]],
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
    use 'editorconfig/editorconfig-vim'

    -- Themes
    use 'NLKNguyen/papercolor-theme'
end,
config = {
    max_job = 1,
}})
