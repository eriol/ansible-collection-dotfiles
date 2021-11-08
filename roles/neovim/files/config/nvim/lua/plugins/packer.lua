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

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'mhinz/vim-startify'

    use {
        'dense-analysis/ale',
        ft = ft_programming,
        cmd = 'ALEEnable',
        config = 'vim.cmd[[ALEEnable]]'
    }
    use 'lukas-reineke/indent-blankline.nvim'
    use {
      'lewis6991/gitsigns.nvim',
      requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Themes
    use 'NLKNguyen/papercolor-theme'
end)
