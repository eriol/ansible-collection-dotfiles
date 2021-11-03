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

    use {'nvim-lualine/lualine.nvim', 
        config = function() require('lualine').setup() end
    }
    use 'mhinz/vim-startify'

    use {
        'dense-analysis/ale',
        ft = ft_programming,
        cmd = 'ALEEnable',
        config = 'vim.cmd[[ALEEnable]]'
    }
    use 'lukas-reineke/indent-blankline.nvim'
end)
