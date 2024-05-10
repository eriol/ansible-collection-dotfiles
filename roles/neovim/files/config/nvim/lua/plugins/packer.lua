-- Plugins configuration.

return require("packer").startup({
    function()
        -- Make packer manage itself.
        use "wbthomason/packer.nvim"

        use "lewis6991/impatient.nvim"

        use "nvim-tree/nvim-web-devicons"

        use({
            "nvim-lualine/lualine.nvim",
            config = [[require('plugins.lualine')]],
        })
        use({
            "mhinz/vim-sayonara",
            config = [[require('plugins.sayonara')]],
        })

        use({
            "nvim-treesitter/nvim-treesitter",
            config = [[require('plugins.nvim-treesitter')]],
        })
        use({
            "neovim/nvim-lspconfig",
            config = [[require('plugins.lspconfig')]],
        })
        use({
            "nvim-lua/lsp-status.nvim",
            config = [[require('plugins.lsp-status')]],
        })
        use({
            "mhartington/formatter.nvim",
            config = [[require('plugins.formatter')]],
        })
        use({ "mfussenegger/nvim-lint", config = [[require('plugins.lint')]] })

        use({
            "nvim-telescope/telescope.nvim",
            config = [[require('plugins.telescope')]],
            requires = "nvim-lua/plenary.nvim",
        })
        use({
            "folke/trouble.nvim",
            config = [[require('plugins.trouble')]],
            requires = "nvim-tree/nvim-web-devicons",
        })
        use({
            "folke/todo-comments.nvim",
            config = [[require('plugins.todo-comments')]],
            requires = "nvim-lua/plenary.nvim",
        })
        use "folke/lsp-colors.nvim"
        use({
            "nvim-tree/nvim-tree.lua",
            config = [[require('plugins.nvim-tree')]],
            requires = "nvim-tree/nvim-web-devicons",
        })
        use({
            "ray-x/lsp_signature.nvim",
        })
        use "mhinz/vim-startify"

        use({
            "L3MON4D3/LuaSnip",
            config = [[require('plugins.luasnip')]],
        })
        use({
            "hrsh7th/nvim-cmp",
            config = [[require('plugins.nvim-cmp')]],
            requires = {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-path",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
            },
        })
        use({
            "windwp/nvim-autopairs",
            after = { "nvim-cmp" },
            config = [[require('plugins.nvim-autopairs')]],
        })

        use({
            "kylechui/nvim-surround",
            config = [[require('plugins.nvim-surround')]],
        })

        use({
            "numToStr/Comment.nvim",
            config = [[require('plugins.comment')]],
        })

        use({
            "lukas-reineke/indent-blankline.nvim",
            config = [[require('plugins.indent-blankline')]],
        })
        use({
            "lewis6991/gitsigns.nvim",
            config = [[require('plugins.gitsigns')]],
            requires = "nvim-lua/plenary.nvim",
        })
        use "tpope/vim-fugitive"

        use({
            "lervag/vimtex",
            config = [[require('plugins.vimtex')]],
        })

        use "NoahTheDuke/vim-just"
        use({
            "salkin-mada/openscad.nvim",
            config = [[require('plugins.openscad')]],
            requires = "L3MON4D3/LuaSnip",
        })

        -- Themes
        use "bluz71/vim-moonfly-colors"
        use "folke/tokyonight.nvim"
        use "marko-cerovac/material.nvim"
        use "monsonjeremy/onedark.nvim"
        use "pappasam/papercolor-theme-slim"
        use "rafamadriz/neon"
        use "rebelot/kanagawa.nvim"
    end,
    config = {
        max_jobs = 10,
    },
})
