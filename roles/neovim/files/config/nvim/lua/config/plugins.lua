-- Plugins configuration.

return require('packer').startup(function()
    -- Make packer manage itself.
    use 'wbthomason/packer.nvim'

    use {'nvim-lualine/lualine.nvim', 
        config = function() require('lualine').setup() end
    }
    use 'mhinz/vim-startify'

    use {
        'dense-analysis/ale',
        ft = {
            'bash',
            'c',
            'cmake',
            'cpp',
            'html',
            'markdown',
            'py',
            'sh',
            'tex',
            'vim',
            'zsh'
        },
        cmd = 'ALEEnable',
        config = 'vim.cmd[[ALEEnable]]'
    }
    use 'lukas-reineke/indent-blankline.nvim'
end)
